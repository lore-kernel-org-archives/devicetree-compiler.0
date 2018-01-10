From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 2/5] annotations: Add position information to various
 calls
Date: Wed, 10 Jan 2018 07:31:37 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801100731170.2157@hadrien>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr> <1515418607-26764-3-git-send-email-Julia.Lawall@lip6.fr> <a0d1314a-8c1f-e553-dacc-62274c6b4cca@gmail.com> <bd068783-e34a-293c-ff03-d6dd37bff219@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bd068783-e34a-293c-ff03-d6dd37bff219-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On Tue, 9 Jan 2018, Frank Rowand wrote:

> On 01/09/18 22:25, Frank Rowand wrote:
> > On 01/08/18 05:36, Julia Lawall wrote:
> >> Builds on a patch proposed by Frank Rowand:
> >>
> >> https://www.mail-archive.com/devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg00372.html
> >>
> >> Added NULL position argument in a few new places in dtc-parser.tab.c (1)
> >> and livetree.c (3).
> >>
> >> For both '/' nodedef productions, include the '/' in the position.
> >>
> >> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> >> ---
> >>  dtc-parser.y | 23 +++++++++++++----------
> >>  dtc.c        | 10 ++++++++++
> >>  dtc.h        | 14 ++++++++++----
> >>  flattree.c   |  2 +-
> >>  fstree.c     |  8 +++++---
> >>  livetree.c   | 43 ++++++++++++++++++++++++++++++-------------
> >>  srcpos.c     | 35 +++++++++++++++++++++++++++++++++++
> >>  srcpos.h     |  3 +++
> >>  treesource.c | 38 +++++++++++++++++++++++++++++++++-----
> >>  9 files changed, 140 insertions(+), 36 deletions(-)
> >>
> >> diff --git a/dtc-parser.y b/dtc-parser.y
> >> index 44af170..d668349 100644
> >> --- a/dtc-parser.y
> >> +++ b/dtc-parser.y
> >> @@ -160,11 +160,11 @@ memreserve:
> >>  devicetree:
> >>  	  '/' nodedef
> >>  		{
> >> -			$$ = name_node($2, "");
> >> +			$$ = name_node($2, "", &@$);
> >>  		}
> >>  	| devicetree '/' nodedef
> >>  		{
> >> -			$$ = merge_nodes($1, $3);
> >> +			$$ = merge_nodes($1, $3, srcpos_combine(&@2, &@3));
> >>  		}
> >>  	| DT_REF nodedef
> >>  		{
> >> @@ -175,7 +175,10 @@ devicetree:
> >>  			 */
> >>  			if (!($<flags>-1 & DTSF_PLUGIN))
> >>  				ERROR(&@2, "Label or path %s not found", $1);
> >> -			$$ = add_orphan_node(name_node(build_node(NULL, NULL), ""), $2, $1);
> >> +			$$ = add_orphan_node(
> >> +					name_node(build_node(NULL, NULL), "",
> >> +						  NULL),
> >> +					$2, $1, &@2);
> >>  		}
> >>  	| devicetree DT_LABEL DT_REF nodedef
> >>  		{
> >> @@ -183,7 +186,7 @@ devicetree:
> >>
> >>  			if (target) {
> >>  				add_label(&target->labels, $2);
> >> -				merge_nodes(target, $4);
> >> +				merge_nodes(target, $4, &@4);
> >>  			} else
> >>  				ERROR(&@3, "Label or path %s not found", $3);
> >>  			$$ = $1;
> >> @@ -193,7 +196,7 @@ devicetree:
> >>  			struct node *target = get_node_by_ref($1, $2);
> >>
> >>  			if (target) {
> >> -				merge_nodes(target, $3);
> >> +				merge_nodes(target, $3, &@3);
> >>  			} else {
> >>  				/*
> >>  				 * We rely on the rule being always:
> >> @@ -201,7 +204,7 @@ devicetree:
> >>  				 * so $-1 is what we want (plugindecl)
> >>  				 */
> >>  				if ($<flags>-1 & DTSF_PLUGIN)
> >> -					add_orphan_node($1, $3, $2);
> >> +					add_orphan_node($1, $3, $2, &@3);
> >>  				else
> >>  					ERROR(&@2, "Label or path %s not found", $2);
> >>  			}
> >> @@ -242,11 +245,11 @@ proplist:
> >>  propdef:
> >>  	  DT_PROPNODENAME '=' propdata ';'
> >>  		{
> >> -			$$ = build_property($1, $3);
> >> +			$$ = build_property($1, $3, &@$);
> >>  		}
> >>  	| DT_PROPNODENAME ';'
> >>  		{
> >> -			$$ = build_property($1, empty_data);
> >> +			$$ = build_property($1, empty_data, &@$);
> >>  		}
> >>  	| DT_DEL_PROP DT_PROPNODENAME ';'
> >>  		{
> >> @@ -517,11 +520,11 @@ subnodes:
> >>  subnode:
> >>  	  DT_PROPNODENAME nodedef
> >>  		{
> >> -			$$ = name_node($2, $1);
> >> +			$$ = name_node($2, $1, &@$);
> >>  		}
> >>  	| DT_DEL_NODE DT_PROPNODENAME ';'
> >>  		{
> >> -			$$ = name_node(build_node_delete(), $2);
> >> +			$$ = name_node(build_node_delete(), $2, &@$);
> >>  		}
> >>  	| DT_LABEL subnode
> >>  		{
> >> diff --git a/dtc.c b/dtc.c
> >> index c36994e..371d04c 100644
> >> --- a/dtc.c
> >> +++ b/dtc.c
> >> @@ -35,6 +35,7 @@ int phandle_format = PHANDLE_EPAPR;	/* Use linux,phandle or phandle properties *
> >>  int generate_symbols;	/* enable symbols & fixup support */
> >>  int generate_fixups;		/* suppress generation of fixups on symbol support */
> >>  int auto_label_aliases;		/* auto generate labels -> aliases */
> >> +bool annotate = false; /* annotate .dts with input source location */
> >>
> >>  static int is_power_of_2(int x)
> >>  {
> >> @@ -83,6 +84,7 @@ static struct option const usage_long_opts[] = {
> >>  	{"auto-alias",       no_argument, NULL, 'A'},
> >>  	{"help",             no_argument, NULL, 'h'},
> >>  	{"version",          no_argument, NULL, 'v'},
> >> +	{"annotate",         no_argument, NULL, 'T'},
> >
> > The "annotate" entry should be just before the "help" entry.
> >
> > -Frank
> >
>
> Ah, I see that patch 5 makes this correction.  See my comment that I'm about to
> write on patch 5.

I've put it in the right place in the right patch now.

julia
