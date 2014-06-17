From: Matthew Gerlach <mhgerlach30-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Microsoft Visual C patches
Date: Tue, 17 Jun 2014 10:18:31 -0700
Message-ID: <CACavRF-Uc6yS_A_1FR523RF0tD4uuKeMzLD4WcQ7_CnfafuwxA@mail.gmail.com>
References: <539DBFC8.4050204@errapartengineering.com>
	<20140616104628.GB29264@voom.redhat.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=8jG4qaLgG0MvXgEbkERJLRlY09x6+kKNQpi1rUZJxWQ=;
        b=Yx/eyORubtwaaNhCZTtzgfiOjHj2OVyiNg8yyO4fab/teCVH0HTmFaL+uNAH0yDbC8
         owGcg99LPMd/zokHMmqbXq+12gWAVnYGIcNJlxArlZEYrZJpmYFsvemtB3/jsEhayHwy
         20Fw/A746esR83swKJ8bLJZ1frZeXggdh33/nGymTMi1YnA1bfC9zrn/g38M57C24u2n
         n01nHkxy3/5Zwy1Lb2TCVhZfqKUaT60IH/MD7bIry8mNvsH5adFU9LDbUlBTgxDMuXYm
         BdwjaP8kbTvRmbZG32U8zmFq3ySEIlkmX6HRy/+t7GT02KvC/q5aBx3rQwnsD5+Y1Irv
         7Dsw==
In-Reply-To: <20140616104628.GB29264-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Andrei,

Your patches are very timely for us.  We were wondering how to compile
dtc for Windows.  We look forward to your resubmissions being
accepted.

Thanks,

Matthew Gerlach

On Mon, Jun 16, 2014 at 3:46 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sun, Jun 15, 2014 at 06:46:16PM +0300, Andrei Errapart wrote:
>> Hallo,
>>
>>
>> The attached patches are the result of compiling the dtc with the Microsoft
>> Visual C (MSVC) in order to be able to run the dtc under Microsoft
>> Windows.
>
> Ok, so, in order to apply these, I'll need them one by one, with their
> own commit messages and Signed-off-by lines.
>
>>
>> Short descriptions of the patches:
>> checks:               MSVC is unable to handle 0-sized array literals.
>> fopen:                Binary files should be opened in binary mode.
>> signed-char:  For MSVC, char defaults to signed char.
>> dtc-header:
>>   1) Variadic macro in the form "args..." is a GCC extension.
>>   2) MSVC requires 0 to be present in a struct literal.
>>
>> On a Linux, all tests pass when these patches have been applied.
>>
>> We have been using the dtc on Windows computers for a few days and haven't
>> had any problems so far. In the case people are interested in having the
>> MSVC project file(s) and the few lightweight compatibility functions
>> required for compilation, let me know and I can clean them up for public
>> use.
>>
>>
>> best regards,
>> Andrei
>
>> diff --git a/checks.c b/checks.c
>> index 47eda65..cf07864 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -61,17 +61,19 @@ struct check {
>>  #define CHECK_ENTRY(nm, tfn, nfn, pfn, d, w, e, ...)        \
>>       static struct check *nm##_prereqs[] = { __VA_ARGS__ }; \
>>       static struct check nm = { \
>> -             .name = #nm, \
>> -             .tree_fn = (tfn), \
>> -             .node_fn = (nfn), \
>> -             .prop_fn = (pfn), \
>> -             .data = (d), \
>> -             .warn = (w), \
>> -             .error = (e), \
>> -             .status = UNCHECKED, \
>> -             .num_prereqs = ARRAY_SIZE(nm##_prereqs), \
>> -             .prereq = nm##_prereqs, \
>> +             #nm, \
>> +             (tfn), \
>> +             (nfn), \
>> +             (pfn), \
>> +             (d), \
>> +             (w), \
>> +             (e), \
>> +             UNCHECKED, \
>> +             false, \
>> +             ARRAY_SIZE(nm##_prereqs), \
>> +             nm##_prereqs \
>
> Um.. I don't see what removing the C99 initializers has to do with
> MSVC not supporting 0 size arrays
>
>>       };
>> +
>
> Please don't include unrelated whitespace changes.
>
>>  #define WARNING(nm, tfn, nfn, pfn, d, ...) \
>>       CHECK_ENTRY(nm, tfn, nfn, pfn, d, true, false, __VA_ARGS__)
>>  #define ERROR(nm, tfn, nfn, pfn, d, ...) \
>> @@ -153,7 +155,7 @@ static bool run_check(struct check *c, struct node *dt)
>>
>>       c->inprogress = true;
>>
>> -     for (i = 0; i < c->num_prereqs; i++) {
>> +     for (i = 0; i < c->num_prereqs && c->prereq[i]!=NULL; i++) {
>
> Hrm.  I think I see what you're doing here, but it's kinda subtle.
> Without a comment, I think someone's very likely to take it out again.
>
> [snip]
>
>> diff --git a/fstree.c b/fstree.c
>> index 4d2791c..6d1beec 100644
>> --- a/fstree.c
>> +++ b/fstree.c
>> @@ -52,7 +52,7 @@ static struct node *read_fstree(const char *dirname)
>>                       struct property *prop;
>>                       FILE *pfile;
>>
>> -                     pfile = fopen(tmpname, "r");
>> +                     pfile = fopen(tmpname, "rb");
>>                       if (! pfile) {
>>                               fprintf(stderr,
>>                                       "WARNING: Cannot open %s: %s\n",
>> diff --git a/srcpos.c b/srcpos.c
>> index 4549773..f534c22 100644
>> --- a/srcpos.c
>> +++ b/srcpos.c
>> @@ -77,7 +77,7 @@ static char *try_open(const char *dirname, const char *fname, FILE **fp)
>>       else
>>               fullname = join_path(dirname, fname);
>>
>> -     *fp = fopen(fullname, "r");
>> +     *fp = fopen(fullname, "rb");
>>       if (!*fp) {
>>               free(fullname);
>>               fullname = NULL;
>> diff --git a/dtc.c b/dtc.c
>> index d36ccdc..e3665b6 100644
>> --- a/dtc.c
>> +++ b/dtc.c
>> @@ -237,7 +237,7 @@ int main(int argc, char *argv[])
>>       if (streq(outname, "-")) {
>>               outf = stdout;
>>       } else {
>> -             outf = fopen(outname, "w");
>> +             outf = fopen(outname, "wb");
>>               if (! outf)
>>                       die("Couldn't open output file %s: %s\n",
>>                           outname, strerror(errno));
>
> The fopen() mode patch I'm happy to take once it's sent with its own
> comment and signed-off-by lines.
>
>> diff --git a/treesource.c b/treesource.c
>> index bf7a626..2386b93 100644
>> --- a/treesource.c
>> +++ b/treesource.c
>> @@ -178,7 +178,7 @@ static void write_propval_bytes(FILE *f, struct data val)
>>                       m = m->next;
>>               }
>>
>> -             fprintf(f, "%02hhx", *bp++);
>> +             fprintf(f, "%02hhx", (unsigned char)(*bp++));
>>               if ((const void *)bp >= propend)
>>                       break;
>>               fprintf(f, " ");
>
> Likewise the unsigned char patch.
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
