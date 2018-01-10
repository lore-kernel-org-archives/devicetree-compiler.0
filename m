From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] checks: Use source position information for check failures
Date: Wed, 10 Jan 2018 10:41:54 -0600
Message-ID: <CAL_Jsq+Brr4e1ZvPapnpRLb5hJPsyBjxoZAdDeaqsD2y0Ma6Jw@mail.gmail.com>
References: <20180108224927.1016-1-robh@kernel.org> <20180110053020.GD19773@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180110053020.GD19773-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Tue, Jan 9, 2018 at 11:30 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Mon, Jan 08, 2018 at 04:49:27PM -0600, Rob Herring wrote:
>> Now that we retain source position information of nodes and properties,
>> make that the preferred file name (and position) to print out in check
>> failures. This will greatly simplify finding and fixing check errors
>> because most errors are in included source .dtsi files and they get
>> duplicated every time the source file is included.
>>
>> For now, only converting a few locations and using a new macro name. I
>> will convert all FAIL occurences once we agree on the new syntax. Also,
>> after this, some checks may need some rework to have more specific
>> line numbers of properties rather than nodes.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> So, I like the basic idea here - something I've kind of wanted for a while.
>
>> ---
>> This is based on Julia's annotation series.
>
> But that series will need a new spin, which will require a new spin of
> this at the last.

Yes, I expected that.

>>  checks.c | 28 ++++++++++++++++++++++------
>>  1 file changed, 22 insertions(+), 6 deletions(-)
>>
>> diff --git a/checks.c b/checks.c
>> index 7845472742e0..2078c0fe75eb 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -19,6 +19,7 @@
>>   */
>>
>>  #include "dtc.h"
>> +#include "srcpos.h"
>>
>>  #ifdef TRACE_CHECKS
>>  #define TRACE(c, ...) \
>> @@ -72,7 +73,8 @@ struct check {
>>  #define CHECK(nm_, fn_, d_, ...) \
>>       CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
>>
>> -static inline void  PRINTF(3, 4) check_msg(struct check *c, struct dt_info *dti,
>> +static inline void  PRINTF(4, 5) check_msg(struct check *c, struct dt_info *dti,
>> +                                        struct srcpos *pos,
>>                                          const char *fmt, ...)
>>  {
>>       va_list ap;
>> @@ -80,8 +82,15 @@ static inline void  PRINTF(3, 4) check_msg(struct check *c, struct dt_info *dti,
>>
>>       if ((c->warn && (quiet < 1))
>>           || (c->error && (quiet < 2))) {
>> +             const char *file_str;
>> +             if (pos)
>> +                     file_str = srcpos_string(pos);
>> +             else if (streq(dti->outname, "-"))
>> +                     file_str = "<stdout>";
>> +             else
>> +                     file_str = dti->outname;
>>               fprintf(stderr, "%s: %s (%s): ",
>> -                     strcmp(dti->outname, "-") ? dti->outname : "<stdout>",
>> +                     file_str,
>>                       (c->error) ? "ERROR" : "Warning", c->name);
>
> Incidentally, the reason it currently shows the output name, which
> seems weird at first glance, is so that if you have a whole batch of
> dtc commands running from a script or Makefile, you can at least tell
> which command caused the check failure.

Yes, better than nothing...

>
>>               vfprintf(stderr, fmt, ap);
>>               fprintf(stderr, "\n");
>> @@ -93,7 +102,14 @@ static inline void  PRINTF(3, 4) check_msg(struct check *c, struct dt_info *dti,
>>       do {                                                            \
>>               TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);  \
>>               (c)->status = FAILED;                                   \
>> -             check_msg((c), dti, __VA_ARGS__);                       \
>> +             check_msg((c), dti, NULL, __VA_ARGS__);                 \
>> +     } while (0)
>> +
>> +#define FAIL_POS(c, dti, p, ...)                                             \
>> +     do {                                                            \
>> +             TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);  \
>> +             (c)->status = FAILED;                                   \
>> +             check_msg((c), dti, p, __VA_ARGS__);                    \
>>       } while (0)
>>
>>  static void check_nodes_props(struct check *c, struct dt_info *dti, struct node *node)
>> @@ -126,7 +142,7 @@ static bool run_check(struct check *c, struct dt_info *dti)
>>               error = error || run_check(prq, dti);
>>               if (prq->status != PASSED) {
>>                       c->status = PREREQ;
>> -                     check_msg(c, dti, "Failed prerequisite '%s'",
>> +                     check_msg(c, dti, NULL, "Failed prerequisite '%s'",
>>                                 c->prereq[i]->name);
>>               }
>>       }
>> @@ -1049,7 +1065,7 @@ static void check_avoid_unnecessary_addr_size(struct check *c, struct dt_info *d
>>       }
>>
>>       if (!has_reg)
>> -             FAIL(c, dti, "unnecessary #address-cells/#size-cells without \"ranges\" or child \"reg\" property in %s",
>> +             FAIL_POS(c, dti, node->srcpos, "unnecessary #address-cells/#size-cells without \"ranges\" or child \"reg\" property in %s",
>>                    node->fullpath);
>
> Checks are already associated with a node, would it make more sense to
> print the position information from the general code?

Not sure I follow the question. You mean pass in the struct node and
get the srcpos and fullpath inside check_msg?

While checks are associated with nodes, specific error messages may be
associated with properties. This is one example where we could make
the error message be the exact line (of the #address-cells or
#size-cells), but that would require re-working the check a bit to get
the property structs (and srcpos).

Rob
