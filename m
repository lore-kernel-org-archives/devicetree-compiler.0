From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 1/3] dtc: dts source location annotation
Date: Tue, 22 Sep 2015 10:10:42 -0700
Message-ID: <56018B92.90305@gmail.com>
References: <5600E191.9020903@gmail.com> <5600E8EF.6020107@gmail.com> <20150922103251.GO20331@voom.fritz.box>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=/0lvHtjIrRPTRhoEtdD0Wab9uDPHGIfcsYoVhBeUK9M=;
        b=zwvbTofOQMGgrme0BHEjglepZG5oeGz7V4pOr4kxKapBSyftZ2W9yKIO4u5tWXSFw4
         y0YSU/CdgL/rdNjRBkYuLsgo0ZBr3jIOz8WYWJzWFYJUs2VbM+wAeYwixZcY6EGnHDH2
         Ms674geDYYmprH3LHvOGXXiu5ElYwJyyedH3ehQOufhv79Ld1agZjWds3+3AU8NqvM4b
         pof51x2n8InY1JOuF2mqFrA+2CX+lP6WBhYYxHpvvShuC8rMhbN2b9q9eokGf8sjaHc8
         j5t9M/K2J+2VmFZ+Xmj3ZrU0jHH5TzzhDWZ2JMIEFZ6KZJefJ5LI49v56Wz4RhhEqDXQ
         Uc8w==
In-Reply-To: <20150922103251.GO20331-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 9/22/2015 3:32 AM, David Gibson wrote:
> On Mon, Sep 21, 2015 at 10:36:47PM -0700, Frank Rowand wrote:
>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>
>> Proof of concept patch.
> 
> Still like the idea, still some some problems with the implementation.
> 
>> Annotates input source file and line number of nodes and properties
>> as comments in output .dts file when --annotate flag is supplied.
>>
>>
>> A common dts source file convention is for a system .dts file
>> to include default SOC and/or device .dtsi files and then add
>> additional system specific properties or over-ride property values
>> from the .dtsi files.  It can be a time consuming and error prone
>> exercise to determine exactly what nodes, properties, and property
>> values are in the final .dtb binary blob and where they originated.
>>
>> Modify the dtc compiler to read a (possibly cpp pre-processed) .dts
>> file and for the output .dts annotate each node and property with
>> the corresponding source location.
>>
>> As an example, one device tree node for the dragonboard in the
>> Linux kernel source tree is: 
>>
>>  sdhci@f9824900 { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:14 */
>>                         compatible = "qcom,sdhci-msm-v4"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:240 */
>>                         reg = <0xf9824900 0x11c 0xf9824000 0x800>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:241 */
>>                         reg-names = "hc_mem", "core_mem"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:242 */
>>                         interrupts = <0x0 0x7b 0x0 0x0 0x8a 0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:243 */
>>                         interrupt-names = "hc_irq", "pwr_irq"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:244 */
>>                         clocks = <0xd 0xd8 0xd 0xd7>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:245 */
>>                         clock-names = "core", "iface"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:246 */
>>                         status = "ok"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:17 */
>>                         bus-width = <0x8>; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:15 */
>>                         non-removable; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:16 */
>>                 }; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:18 */
>>
>>
>> qcom-apq8074-dragonboard.dts:
>>    - last referenced the sdhci node
>>    - changed the value of the "status" property from "disabled" to "ok"
>>    - added two properties, "bus-width" and "non-removable"
>>
>> qcom-msm8974.dtsi:
>>    - initially set the value the "status" property to "disabled"
>>      (not visible in the annotated .dts)
>>    - provided all of the other property values
>>
>>
>> When the dtc compiler is run within the Linux kernel build system,
>> the path of the source files will be the full absolute path, just
>> as seen for gcc warnings and errors.  I always trim away the path
>> leading up to the Linux kernel source tree by passing the kernel
>> build output through a sed pipe.  I have done the same to the
>> above example to remove the excessive verbosity in the source paths.
>>
>> Implementation notes:
>>
>>   - The source location of each node and property is saved in the
>>     respective node or property during the parse phase because
>>     the source location information from current_srcfile is no longer
>>     available when the final values are written out from dt_to_source()
>>     and the functions that it calls.
>>
>>   - A check is added to dtc.c to ensure that input and output format
>>     are both device tree source.  An alternate choice would be to
>>     turn off the --annotate flag if either the input file or the
>>     output file is not device tree source.  In the alternate case,
>>     the disabling of --annotate could be silent or a warning could
>>     be issued.
>>
>>
>> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>> ---
>>  dtc-parser.y |   14 ++++++++++++--
>>  dtc.c        |    9 +++++++++
>>  dtc.h        |   12 +++++++++++-
>>  flattree.c   |    2 +-
>>  fstree.c     |    2 +-
>>  livetree.c   |   40 +++++++++++++++++++++++++++++++++++++++-
>>  treesource.c |   27 ++++++++++++++++++++++-----
>>  7 files changed, 95 insertions(+), 11 deletions(-)
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
>> @@ -126,6 +127,11 @@ bool data_is_one_string(struct data d);
>>  #define MAX_NODENAME_LEN	31
>>  
>>  /* Live trees */
>> +struct src {
>> +	char *name;
>> +	int lineno;
>> +};
> 
> Still not seeing an explanation for why you need this, instead of
> using the existing struct srcpos.

Your comment below about lexer vs parser gives me the clue as to why
I do not need struct src.  I'll go read about the lexer and come
up with another version.


> 
>>  struct label {
>>  	bool deleted;
>>  	char *label;
>> @@ -140,6 +146,7 @@ struct property {
>>  	struct property *next;
>>  
>>  	struct label *labels;
>> +	struct src src;
>>  };
>>  
>>  struct node {
>> @@ -158,6 +165,8 @@ struct node {
>>  	int addr_cells, size_cells;
>>  
>>  	struct label *labels;
>> +	struct src begin_src;
>> +	struct src end_src;
>>  };
>>  
>>  #define for_each_label_withdel(l0, l) \
>> @@ -189,7 +198,8 @@ struct property *build_property_delete(c
>>  struct property *chain_property(struct property *first, struct property *list);
>>  struct property *reverse_properties(struct property *first);
>>  
>> -struct node *build_node(struct property *proplist, struct node *children);
>> +struct src *start_node(void);
>> +struct node *build_node(struct src *begin_src, struct property *proplist, struct node *children);
>>  struct node *build_node_delete(void);
>>  struct node *name_node(struct node *node, char *name);
>>  struct node *chain_node(struct node *first, struct node *list);
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
>> @@ -58,6 +59,14 @@ struct property *build_property(char *na
>>  
>>  	new->name = name;
>>  	new->val = val;
>> +	if (current_srcfile) {
> 
> So referencing current_srcfile outside of the lexer isn't strictly
> speaking safe.  You'll get away with it at the moment, but in theory
> the lexer/parser internal state (and hence the source location) could
> be ahead of where it's actually executed parser actions for - and
> those are what will cause build_property().

Thank you!!!  This is exactly the clue that penetrates my total lack
of knowledge of the lexer.  My apologies for not reading all the way
through the bison manual before submitting these patches.  And my
thanks for bearing with me as I do stupid things as  result.

I'll try moving from the parser side to the lexer side.


> At the moment you'll get away with it, but if we ever add syntax that
> needs the %glr-parser Bison option, then this will actually break.
> 
>> +		new->src.name = current_srcfile->name;
>> +		new->src.lineno = current_srcfile->lineno;
>> +	} else {
>> +		/* adding implicit property, such as phandle */
>> +		new->src.name = "__builtin__";
>> +		new->src.lineno = 0;
> 
> Minor nit, I think it would be cleaner to just leave node->src NULL,
> and format that how we like on the output side.

Sounds good.

> 
>> +	}
>>  
>>  	return new;
>>  }
>> @@ -97,7 +106,22 @@ struct property *reverse_properties(stru
>>  	return head;
>>  }
>>  
>> -struct node *build_node(struct property *proplist, struct node *children)
>> +struct src *start_node(void)
>> +{
>> +	struct src *new = xmalloc(sizeof(*new));
>> +
>> +	if (current_srcfile) {
>> +		new->name = current_srcfile->name;
>> +		new->lineno = current_srcfile->lineno;
>> +	} else {
>> +		new->name = "__builtin__";
>> +		new->lineno = 0;
>> +	}
>> +
>> +	return new;
>> +}
>> +
>> +struct node *build_node(struct src *begin_src, struct property *proplist, struct node *children)
>>  {
>>  	struct node *new = xmalloc(sizeof(*new));
>>  	struct node *child;
>> @@ -111,6 +135,16 @@ struct node *build_node(struct property
>>  		child->parent = new;
>>  	}
>>  
>> +	if (begin_src) {
>> +		new->begin_src = *begin_src;
>> +		free(begin_src);
>> +	}
>> +
>> +	if (current_srcfile) {
>> +		new->end_src.name = current_srcfile->name;
>> +		new->end_src.lineno = current_srcfile->lineno;
>> +	}
>> +
>>  	return new;
>>  }
>>  
>> @@ -169,6 +203,7 @@ struct node *merge_nodes(struct node *ol
>>  
>>  				old_prop->val = new_prop->val;
>>  				old_prop->deleted = 0;
>> +				old_prop->src = new_prop->src;
>>  				free(new_prop);
>>  				new_prop = NULL;
>>  				break;
>> @@ -209,6 +244,9 @@ struct node *merge_nodes(struct node *ol
>>  			add_child(old_node, new_child);
>>  	}
>>  
>> +	old_node->begin_src = new_node->begin_src;
>> +	old_node->end_src = new_node->end_src;
>> +
>>  	/* The new node contents are now merged into the old node.  Free
>>  	 * the new node. */
>>  	free(new_node);
> 
> So, it's actually much easier than this to get the location
> information.  The lexer and parser are already tracking the location
> of *every* grammar symbol.  In the rules in dtc-parser.y @$ will give
> you a struct srcpos with the location of the LHS of the production,
> @1..@N will give you a srcpos for each symbol on the RHS.
> 
> See the "Tracking Locations" section in the Bison info for more
> information.
> 
> So all you need to do is add struct srcpos * parameter to
> build_property and build_node, and pass in &@$ from the parser.  Other
> callers can pass NULL to record that source location isn't available.
> 
> I'm not sure of the lifetime of the struct srcpos handled by the
> parser, so you might need to dupe the structures.

Thank you!!!  I'll go read the manual a bit, but it seems you have
given me the base knowledge I need to do this right.


> 
>> Index: b/treesource.c
>> ===================================================================
>> --- a/treesource.c
>> +++ b/treesource.c
>> @@ -202,7 +202,11 @@ static void write_propval(FILE *f, struc
>>  	int i;
>>  
>>  	if (len == 0) {
>> -		fprintf(f, ";\n");
>> +		if (annotate)
>> +			fprintf(f, "; /* %s:%d */\n",
>> +				prop->src.name, prop->src.lineno);
> 
> So, as a bonus, if you use struct srcpos, you can use the
> srcpos_string() function here, which will format it nicely, and even
> handle cases where the property spans several line in the source.  And
> it will include column numbers, so it will even give you useful
> information if someone is silly enough to put multiple properties on
> the same line.

Nice.  Thanks.


> 
>> +		else
>> +			fprintf(f, ";\n");
>>  		return;
>>  	}
>>  
>> @@ -230,7 +234,10 @@ static void write_propval(FILE *f, struc
>>  		write_propval_bytes(f, prop->val);
>>  	}
>>  
>> -	fprintf(f, ";\n");
>> +	if (annotate)
>> +		fprintf(f, "; /* %s:%d */\n", prop->src.name, prop->src.lineno);
>> +	else
>> +		fprintf(f, ";\n");
>>  }
>>  
>>  static void write_tree_source_node(FILE *f, struct node *tree, int level)
>> @@ -242,10 +249,16 @@ static void write_tree_source_node(FILE
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
>> +		fprintf(f, " /* %s:%d */\n",
>> +			tree->begin_src.name, tree->begin_src.lineno);
>> +	} else
>> +		fprintf(f, "\n");
>>  
>>  	for_each_property(tree, prop) {
>>  		write_prefix(f, level+1);
>> @@ -259,7 +272,11 @@ static void write_tree_source_node(FILE
>>  		write_tree_source_node(f, child, level+1);
>>  	}
>>  	write_prefix(f, level);
>> -	fprintf(f, "};\n");
>> +	if (annotate)
>> +		fprintf(f, "}; /* %s:%d */\n",
>> +			tree->end_src.name, tree->end_src.lineno);
>> +	else
>> +		fprintf(f, "};\n");
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
>> +	{"annotate",         no_argument, NULL, 'a'},
> 
> I'm slightly dubious about the short form name here, since -a means
> "--all" in so many programs.

OK.  Would -A be good?


> 
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
>> +		case 'a':
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
>> @@ -48,6 +48,7 @@ extern bool treesource_error;
>>  
>>  	struct property *prop;
>>  	struct property *proplist;
>> +	struct src *src;
>>  	struct node *node;
>>  	struct node *nodelist;
>>  	struct reserve_info *re;
>> @@ -78,6 +79,7 @@ extern bool treesource_error;
>>  %type <prop> propdef
>>  %type <proplist> proplist
>>  
>> +%type <src> openbrace
>>  %type <node> devicetree
>>  %type <node> nodedef
>>  %type <node> subnode
>> @@ -177,12 +179,20 @@ devicetree:
>>  	;
>>  
>>  nodedef:
>> -	  '{' proplist subnodes '}' ';'
>> +	  openbrace proplist subnodes '}' ';'
>>  		{
>> -			$$ = build_node($2, $3);
>> +			$$ = build_node($1, $2, $3);
>>  		}
>>  	;
>>  
>> +openbrace:
>> +	  '{'
>> +		{
>> +			$$ = start_node();
>> +		}
>> +	;
>> +
>> +
>>  proplist:
>>  	  /* empty */
>>  		{
>> Index: b/flattree.c
>> ===================================================================
>> --- a/flattree.c
>> +++ b/flattree.c
>> @@ -748,7 +748,7 @@ static struct node *unflatten_tree(struc
>>  	char *flatname;
>>  	uint32_t val;
>>  
>> -	node = build_node(NULL, NULL);
>> +	node = build_node(NULL, NULL, NULL);
>>  
>>  	flatname = flat_read_string(dtbuf);
>>  
>> Index: b/fstree.c
>> ===================================================================
>> --- a/fstree.c
>> +++ b/fstree.c
>> @@ -34,7 +34,7 @@ static struct node *read_fstree(const ch
>>  	if (!d)
>>  		die("Couldn't opendir() \"%s\": %s\n", dirname, strerror(errno));
>>  
>> -	tree = build_node(NULL, NULL);
>> +	tree = build_node(NULL, NULL, NULL);
>>  
>>  	while ((de = readdir(d)) != NULL) {
>>  		char *tmpname;
> 
