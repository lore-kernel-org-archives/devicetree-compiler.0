From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Fix ambiguous grammar for devicetree rule
Date: Mon, 20 Nov 2017 11:20:31 -0600
Message-ID: <CAL_JsqLYeXPtqDq_xetp5wB1ufjNAv5brvf840uD_=OLZ7uJsw@mail.gmail.com>
References: <20171120171218.3320-1-grant@tiffany.secretlab.ca>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171120171218.3320-1-grant-72MMKEujIeWzez9aqWk6I/IHrerwW8k1@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant-72MMKEujIeWYvcOBcYx38pOp/cRyR9/c930Pai70D+E@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On Mon, Nov 20, 2017 at 11:12 AM, Grant Likely
<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> From: Grant Likely <grant-72MMKEujIeWYvcOBcYx38pOp/cRyR9/c930Pai70D+E@public.gmane.org>

Ummm?

> Commit 737b2df3, "overlay: Add syntactic sugar version of overlays"
> introduced an empty rule for "devicetree" that created ambiguities in
> the grammar and causes the following warning:
>
>          BISON dtc-parser.tab.c
>   dtc-parser.y: warning: 3 shift/reduce conflicts [-Wconflicts-sr]
>
> Fix the grammar by explicitly testing for the condition the
> new overlay grammar wants to use. This means duplicating a very small
> amount of grammar processing code, but the alternative seems to be a
> more invasive reorganization of the devicetree rule. Better to fix it
> this way now and save the reorg for a separate patch

Missing period.

>
> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
> Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
