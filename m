From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v5 1/2] dtc: dts source location annotation
Date: Fri, 02 Oct 2015 21:24:15 -0700
Message-ID: <560F586F.8040302@gmail.com>
References: <560CA87E.1010103@gmail.com> <560CA9FB.6050700@gmail.com> <20151001054948.GM23574@voom>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=yDI9QtpUhFeS27qTkDoPqbZPNqd91a4vOfLAoOcu6mM=;
        b=jU+1LO6B//c0qR8rg2Rnq0enb08iyHXMrWtTmQ8NAIMPzgFTv/CGO6liSGfTg7MQbx
         eoIq5L23DH2SycA+eugWpq0ZQy7qIa4cLfNcXFr+ekYcXFxfF+oV+i1k7lS2QBS0ganh
         3XwFiHHe4jPqyj3vJ95tiWcOlkGgG+LFKU1yq/QKKCkEGQtiy04rV34ItEPE3ZYWOsOp
         NxtsWTC7YjlaHMlVLTn2aFgX6jYJMeCzbeba2YRhy7iEPowwbpvLPWrKbQuBbydzk5VT
         jM3KHVkWVMyKozgz49YrVfZnOc6DCrkllaU5g6dPmH2cmuAD05AcZwLzNqHtl0pV/9oe
         m8jA==
In-Reply-To: <20151001054948.GM23574@voom>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 9/30/2015 10:49 PM, David Gibson wrote:
> On Wed, Sep 30, 2015 at 08:35:23PM -0700, Frank Rowand wrote:
>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>
>> Proof of concept patch.

< snip >

>>  7 files changed, 129 insertions(+), 9 deletions(-)
>>
>> Index: b/dtc.h
>> ===================================================================
>> --- a/dtc.h
>> +++ b/dtc.h
>> @@ -54,6 +54,7 @@ extern int reservenum;		/* Number of mem
>>  extern int minsize;		/* Minimum blob size */
>>  extern int padsize;		/* Additional padding to blob */
>>  extern int phandle_format;	/* Use linux,phandle or phandle properties */
>> +extern bool annotate;		/* annotate .dts with input source location */
>>  
>>  #define PHANDLE_LEGACY	0x1
>>  #define PHANDLE_EPAPR	0x2
>> @@ -140,6 +141,7 @@ struct property {
>>  	struct property *next;
>>  
>>  	struct label *labels;
>> +	struct srcpos *srcpos;
>>  };
>>  
>>  struct node {
>> @@ -158,6 +160,8 @@ struct node {
>>  	int addr_cells, size_cells;
>>  
>>  	struct label *labels;
>> +	struct srcpos *begin_srcpos;
>> +	struct srcpos *end_srcpos;
> 
> struct srcpos already has a last_line / last_column, so I don't think
> you need separate begin and end srcpos variables - a single one should
> do it.

Yes.  Changed to single one.

> 
>>  };
>>  
>>  #define for_each_label_withdel(l0, l) \
>> @@ -185,6 +189,7 @@ void add_label(struct label **labels, ch
>>  void delete_labels(struct label **labels);
>>  
>>  struct property *build_property(char *name, struct data val);
>> +void srcpos_property(struct property *prop, struct srcpos *srcpos);
> 
> I'd prefer to make this a parameter to build_property(), which I think
> becomes possible with the other changes I suggest below.

OK.  I had done it as you suggested in the previous version, but this
time I did not so that I would not have to modify other programs that
call this function.  I agree that it is cleaner to do as you suggest.

> 
>>  struct property *build_property_delete(char *name);
>>  struct property *chain_property(struct property *first, struct property *list);
>>  struct property *reverse_properties(struct property *first);
>> @@ -192,6 +197,8 @@ struct property *reverse_properties(stru
>>  struct node *build_node(struct property *proplist, struct node *children);
>>  struct node *build_node_delete(void);
>>  struct node *name_node(struct node *node, char *name);
>> +void begin_srcpos_node(struct node *node, struct srcpos *srcpos);
>> +void end_srcpos_node(struct node *node, struct srcpos *srcpos);
> 
> Likewise a parameter to build_node().

Yes.

> 
>>  struct node *chain_node(struct node *first, struct node *list);
>>  struct node *merge_nodes(struct node *old_node, struct node *new_node);
>>  
>> Index: b/livetree.c
>> ===================================================================
>> --- a/livetree.c
>> +++ b/livetree.c
>> @@ -19,6 +19,7 @@
>>   */
>>  
>>  #include "dtc.h"
>> +#include "srcpos.h"
>>  
>>  /*
>>   * Tree building functions
>> @@ -74,6 +75,11 @@ struct property *build_property_delete(c
>>  	return new;
>>  }
>>  
>> +void srcpos_property(struct property *prop, struct srcpos *srcpos)
>> +{
>> +	prop->srcpos = srcpos_copy_all(srcpos);
>> +}
>> +
>>  struct property *chain_property(struct property *first, struct property *list)
>>  {
>>  	assert(first->next == NULL);
>> @@ -134,6 +140,16 @@ struct node *name_node(struct node *node
>>  	return node;
>>  }
>>  
>> +void begin_srcpos_node(struct node *node, struct srcpos *srcpos)
>> +{
>> +	node->begin_srcpos = srcpos_copy_all(srcpos);
>> +}
>> +
>> +void end_srcpos_node(struct node *node, struct srcpos *srcpos)
>> +{
>> +	node->end_srcpos = srcpos_copy_all(srcpos);
>> +}
>> +
>>  struct node *merge_nodes(struct node *old_node, struct node *new_node)
>>  {
>>  	struct property *new_prop, *old_prop;
>> @@ -169,6 +185,7 @@ struct node *merge_nodes(struct node *ol
>>  
>>  				old_prop->val = new_prop->val;
>>  				old_prop->deleted = 0;
>> +				old_prop->srcpos = new_prop->srcpos;
>>  				free(new_prop);
>>  				new_prop = NULL;
>>  				break;
>> @@ -209,6 +226,9 @@ struct node *merge_nodes(struct node *ol
>>  			add_child(old_node, new_child);
>>  	}
>>  
>> +	old_node->begin_srcpos = new_node->begin_srcpos;
>> +	old_node->end_srcpos = new_node->end_srcpos;
>> +
>>  	/* The new node contents are now merged into the old node.  Free
>>  	 * the new node. */
>>  	free(new_node);
>> Index: b/treesource.c
>> ===================================================================
>> --- a/treesource.c
>> +++ b/treesource.c
>> @@ -200,9 +200,16 @@ static void write_propval(FILE *f, struc
>>  	int nnotstring = 0, nnul = 0;
>>  	int nnotstringlbl = 0, nnotcelllbl = 0;
>>  	int i;
>> +	char *srcstr;
>>  
>>  	if (len == 0) {
>> -		fprintf(f, ";\n");
>> +		if (annotate) {
>> +			srcstr = srcpos_string_short(prop->srcpos);
> 
> I tend to think the full srcpos_string might be useful here, rather
> than the short version.

I think that in the normal case that the short version is better,
but that there are cases where the full information would be
valuable.  I have modified this base patch to report the full
information, then added an additional patch to report the short
information.  The additional patch still needs to add the choice
of short or long format of location to the --annotate option.


> 
>> +			fprintf(f, "; /* %s */\n", srcstr);
>> +			free(srcstr);
>> +		} else {
>> +			fprintf(f, ";\n");
>> +		}
>>  		return;
>>  	}
>>  
>> @@ -230,7 +237,13 @@ static void write_propval(FILE *f, struc
>>  		write_propval_bytes(f, prop->val);
>>  	}
>>  
>> -	fprintf(f, ";\n");
>> +	if (annotate) {
>> +		srcstr = srcpos_string_short(prop->srcpos);
>> +		fprintf(f, "; /* %s */\n", srcstr);
>> +		free(srcstr);
>> +	} else {
>> +		fprintf(f, ";\n");
>> +	}
>>  }
>>  
>>  static void write_tree_source_node(FILE *f, struct node *tree, int level)
>> @@ -238,14 +251,23 @@ static void write_tree_source_node(FILE
>>  	struct property *prop;
>>  	struct node *child;
>>  	struct label *l;
>> +	char *srcstr;
>>  
>>  	write_prefix(f, level);
>>  	for_each_label(tree->labels, l)
>>  		fprintf(f, "%s: ", l->label);
>> +
>>  	if (tree->name && (*tree->name))
>> -		fprintf(f, "%s {\n", tree->name);
>> +		fprintf(f, "%s {", tree->name);
>>  	else
>> -		fprintf(f, "/ {\n");
>> +		fprintf(f, "/ {");
>> +	if (annotate) {
>> +		srcstr = srcpos_string_short(tree->begin_srcpos);
> 
> So to do this with a single srcpos field, you'd probably want
> srcpos_string_begin() and srcpos_string_end() functions.

Yes.

Looking at the next version (v5) I see that I named them
srcpos_string_first() and srcpos_string_last().  I can
change that in v6.


> 
>> +		fprintf(f, " /* %s */\n", srcstr);
>> +		free(srcstr);
>> +	} else {
>> +		fprintf(f, "\n");
>> +	}
>>  
>>  	for_each_property(tree, prop) {
>>  		write_prefix(f, level+1);
>> @@ -259,7 +281,13 @@ static void write_tree_source_node(FILE
>>  		write_tree_source_node(f, child, level+1);
>>  	}
>>  	write_prefix(f, level);
>> -	fprintf(f, "};\n");
>> +	if (annotate) {
>> +		srcstr = srcpos_string_short(tree->end_srcpos);
>> +		fprintf(f, "}; /* %s */\n", srcstr);
>> +		free(srcstr);
>> +	} else {
>> +		fprintf(f, "};\n");
>> +	}
>>  }
>>  
>>  
>> Index: b/dtc.c
>> ===================================================================
>> --- a/dtc.c
>> +++ b/dtc.c
>> @@ -29,6 +29,7 @@ int reservenum;		/* Number of memory res
>>  int minsize;		/* Minimum blob size */
>>  int padsize;		/* Additional padding to blob */
>>  int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
>> +bool annotate = false;	/* annotate .dts with input source location */
>>  
>>  static void fill_fullpaths(struct node *tree, const char *prefix)
>>  {
>> @@ -71,6 +72,7 @@ static struct option const usage_long_op
>>  	{"error",             a_argument, NULL, 'E'},
>>  	{"help",             no_argument, NULL, 'h'},
>>  	{"version",          no_argument, NULL, 'v'},
>> +	{"annotate",         no_argument, NULL, 'A'},
>>  	{NULL,               no_argument, NULL, 0x0},
>>  };
>>  static const char * const usage_opts_help[] = {
>> @@ -101,6 +103,7 @@ static const char * const usage_opts_hel
>>  	"\n\tEnable/disable errors (prefix with \"no-\")",
>>  	"\n\tPrint this help and exit",
>>  	"\n\tPrint version and exit",
>> +	"\n\tAnnotate output .dts with input source file and line",
>>  	NULL,
>>  };
>>  
>> @@ -125,6 +128,9 @@ int main(int argc, char *argv[])
>>  
>>  	while ((opt = util_getopt_long()) != EOF) {
>>  		switch (opt) {
>> +		case 'A':
>> +			annotate = true;
>> +			break;
>>  		case 'I':
>>  			inform = optarg;
>>  			break;
>> @@ -213,6 +219,9 @@ int main(int argc, char *argv[])
>>  		fprintf(depfile, "%s:", outname);
>>  	}
>>  
>> +	if (annotate && (!streq(inform, "dts") || !streq(outform, "dts")))
>> +		die("--annotate requires -I dts -O dts\n");
>> +
>>  	if (streq(inform, "dts"))
>>  		bi = dt_from_source(arg);
>>  	else if (streq(inform, "fs"))
>> Index: b/dtc-parser.y
>> ===================================================================
>> --- a/dtc-parser.y
>> +++ b/dtc-parser.y
>> @@ -134,10 +134,12 @@ memreserve:
>>  devicetree:
>>  	  '/' nodedef
>>  		{
>> +			begin_srcpos_node($2, &@1);
> 
> With a single srcpos, you could move this to the nodedef productions
> and use &@$.

I missed this in v5.  Will fix for v6.


> 
>>  			$$ = name_node($2, "");
> 
> Actually, if using a parameter to build_node() doesn't work, my second
> preference would be to change name_node() to say place_node() which
> adds both the name and source location.
> 
>>  		}
>>  	| devicetree '/' nodedef
>>  		{
>> +			begin_srcpos_node($3, &@2);
>>  			$$ = merge_nodes($1, $3);
>>  		}
>>  
>> @@ -146,20 +148,25 @@ devicetree:
>>  			struct node *target = get_node_by_ref($1, $3);
>>  
>>  			add_label(&target->labels, $2);
>> -			if (target)
>> +			if (target) {
>> +				begin_srcpos_node($4, &@3);
>>  				merge_nodes(target, $4);
>> -			else
>> +			} else {
>>  				ERROR(&@3, "Label or path %s not found", $3);
>> +			}
>>  			$$ = $1;
>>  		}
>>  	| devicetree DT_REF nodedef
>>  		{
>>  			struct node *target = get_node_by_ref($1, $2);
>>  
>> -			if (target)
>> +
>> +			if (target) {
>> +				begin_srcpos_node($3, &@2);
>>  				merge_nodes(target, $3);
>> -			else
>> +			} else {
>>  				ERROR(&@2, "Label or path %s not found", $2);
>> +			}
>>  			$$ = $1;
>>  		}
>>  	| devicetree DT_DEL_NODE DT_REF ';'
>> @@ -180,6 +187,7 @@ nodedef:
>>  	  '{' proplist subnodes '}' ';'
>>  		{
>>  			$$ = build_node($2, $3);
>> +			end_srcpos_node($$, &@4);
>>  		}
>>  	;
>>  
>> @@ -198,10 +206,12 @@ propdef:
>>  	  DT_PROPNODENAME '=' propdata ';'
>>  		{
>>  			$$ = build_property($1, $3);
>> +			srcpos_property($$, &@1);
> 
> It think using &@$ giving the location of the whole definition, rather
> than just the property name part in &@1 would be a better idea.
> 
>>  		}
>>  	| DT_PROPNODENAME ';'
>>  		{
>>  			$$ = build_property($1, empty_data);
>> +			srcpos_property($$, &@1);
>>  		}
>>  	| DT_DEL_PROP DT_PROPNODENAME ';'
>>  		{
>> @@ -456,11 +466,13 @@ subnodes:
>>  subnode:
>>  	  DT_PROPNODENAME nodedef
>>  		{
>> +			begin_srcpos_node($2, &@1);
>>  			$$ = name_node($2, $1);
>>  		}
>>  	| DT_DEL_NODE DT_PROPNODENAME ';'
>>  		{
>>  			$$ = name_node(build_node_delete(), $2);
>> +			begin_srcpos_node($$, &@2);
>>  		}
>>  	| DT_LABEL subnode
>>  		{
>> Index: b/srcpos.c
>> ===================================================================
>> --- a/srcpos.c
>> +++ b/srcpos.c
>> @@ -246,6 +246,25 @@ srcpos_copy(struct srcpos *pos)
>>  	return pos_new;
>>  }
>>  
>> +struct srcpos *
>> +srcpos_copy_all(struct srcpos *pos)
>> +{
>> +	struct srcpos *pos_new;
>> +	struct srcfile_state *srcfile_state;
>> +
>> +	pos_new = srcpos_copy(pos);
>> +
>> +	if (pos_new) {
>> +		/* allocate without free */
>> +		srcfile_state = xmalloc(sizeof(struct srcfile_state));
>> +		memcpy(srcfile_state, pos->file, sizeof(struct srcfile_state));
>> +
>> +		pos_new->file = srcfile_state;
>> +	}
>>
> You don't need this function - srcpos_copy() already does what you
> need. The srcfile_state structures already have unlimited lifetime
> exactly so they can be referenced later.  In other words, we already
> deliberately leak them - see srcfile_pop().

If I don't allocate a new copy of pos->file, then the file names are
incorrect.  I'm not sure why.  I can dig into this deeper to try to
understand what is going on if you want me to.

< snip >
