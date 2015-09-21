From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dtc: dts source location annotation
Date: Mon, 21 Sep 2015 10:55:11 -0700
Message-ID: <5600447F.8010307@gmail.com>
References: <55F8EB35.5010601@gmail.com> <55F8EE7A.7080301@gmail.com> <20150921063119.GL20331@voom.fritz.box>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=3IqB8WzbPG0DeXVJXjoidZ7Gm6/2AJN/S5fFaYWtswE=;
        b=irxa/gePQSoBEy3w2Tbvbp6fW6s+8Hwf4YpkRm2nYcb6CEIgDsAb27xDE/TMvlr/7A
         57AVS5rFhjbKDhVe5Ghd8NQMkYLJct7jAR2Typ9vfaj9K9bEHvDHJuMgQBSKB6K0khn2
         0XF7Lj9Hjczd717BGo2fWG7HQMQ/X6z3EWpyrgcXJBk+oAhwRDdaInc+ThwyAQiZcbYV
         fxbMdQ7GsuJn4pS0HUVfGwwMC5PthfbyvPibpIvM9qGveuHixc3JN06HqrKfQHJlHPh+
         INMemHqhmM3BFBZFLYNuRebQ3HVc4NfeEM8N9EtQjrjrQP5fbQiVMcU4djLE2MmPbgyn
         SoEQ==
In-Reply-To: <20150921063119.GL20331-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 9/20/2015 11:31 PM, David Gibson wrote:
> On Tue, Sep 15, 2015 at 09:22:18PM -0700, Frank Rowand wrote:
>>
>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>
>> Proof of concept patch.
>>
>> Annotates input source file and line number of nodes and properties
>> as comments in output .dts file when --annotate flag is supplied.
>>
>> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> 
> A like the concept, but I have some queries about the implementation.
> 
>> ---
>>  dtc-lexer.l  |    2 +
>>  dtc.c        |    9 ++++++++
>>  dtc.h        |   14 +++++++++++++
>>  livetree.c   |   62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  srcpos.h     |    6 +++++
>>  treesource.c |   27 ++++++++++++++++++++-----
>>  6 files changed, 115 insertions(+), 5 deletions(-)
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
>> @@ -126,6 +127,16 @@ bool data_is_one_string(struct data d);
>>  #define MAX_NODENAME_LEN	31
>>  
>>  /* Live trees */
>> +struct src {
>> +	char *name;
>> +	int lineno;
>> +};
> 
> I'd prefer to see the existing struct srcpos used, rather than
> creating a new structure.

My next version of the patch will still have struct src, but I
will explain why it exists.  If your comment still stands with
me additional explanation, please repeat it.


> 
>> +struct prop_src {
>> +	struct prop_src *prev;
>> +	struct src src;
>> +};
>> +
>>  struct label {
>>  	bool deleted;
>>  	char *label;
>> @@ -140,6 +151,7 @@ struct property {
>>  	struct property *next;
>>  
>>  	struct label *labels;
>> +	struct src src;
>>  };
>>  
>>  struct node {
>> @@ -158,6 +170,8 @@ struct node {
>>  	int addr_cells, size_cells;
>>  
>>  	struct label *labels;
>> +	struct src begin_src;
>> +	struct src end_src;
>>  };
>>  
>>  #define for_each_label_withdel(l0, l) \
>> Index: b/livetree.c
>> ===================================================================
>> --- a/livetree.c
>> +++ b/livetree.c
>> @@ -19,6 +19,9 @@
>>   */
>>  
>>  #include "dtc.h"
>> +#include "srcpos.h"
>> +
>> +struct prop_src *prev_prop_src = NULL;
> 
> So you've built a new global stack here, and I don't really understand
> what it's for.  The parser already tracks source positions for each
> construct, so you should be able to just use that.  You'd need to pass
> the srcpos from dtc-parser.y into the tree building calls in more
> places, but that should be it.

This is the part that I struggled with most.  You have given me the clue
that I was overlooking.  I'll send out a new version without the global
stack later today.


> 
> Or have I missed something?
> 
>>  /*
>>   * Tree building functions
>> @@ -58,6 +61,13 @@ struct property *build_property(char *na
>>  
>>  	new->name = name;
>>  	new->val = val;
>> +	if (current_srcfile) {
>> +		new->src.name = current_srcfile->name;
>> +		new->src.lineno = current_srcfile->lineno;
>> +	} else {
>> +		new->src.name = "__builtin__";
>> +		new->src.lineno = 0;
> 
> A comment explaining when this will happen in practice would be nice.

I'm not sure what you are asking.  When current_srcfile will be null?
I'll add a comment for that.

> 
> Incidentally.. what happens if you use dtb input and try to annotate?

There is no source information, which means the output would be of no use.
I chose to address this by the check in dtc.c to only allow --annotate
for inform and outform of "dts".

Thanks for the comments.

-Frank
