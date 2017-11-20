From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Fix ambiguous grammar for devicetree rule
Date: Mon, 20 Nov 2017 17:22:43 +0000
Message-ID: <CACxGe6tvoYbKjCmK9SoGoXfqPN12POtLtgy4nyzovxcd2jHFnQ@mail.gmail.com>
References: <20171120171218.3320-1-grant@tiffany.secretlab.ca> <CAL_JsqLYeXPtqDq_xetp5wB1ufjNAv5brvf840uD_=OLZ7uJsw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=Cufs8RHu5rs4mXrWYx5peMsFPVIBVFnvPWYAemZDPkU=;
        b=ZLi2s7la+0hh+bW2MGf0CJkHqsXo2RfEAK7SMko5/ssUuhhBL2oX6tDyEij1yAYvp9
         344sYU0A+iJgp5wXfYpw67k3Gqassi+bqQmj+3JMMHbVyfblPhKOaBqOWY7lNdkzl8wS
         Lci+lW4oB8OL29dkWeO0+BGMR5AcPpW2DsvhJn+87akFpQ7plrMXTgZ6tF5ljbzbepYr
         SlEECP0S7Rs+8Dkhpiz8lNdDOSVEjZIuYVF0y/qoN8DvMEzyMLE4ZrNKX4sk1nmab9ra
         PQXzkQNw3laeEVGJxp2IpXv1KVxWyPef1GgFzv78ReCE+4i3wdVsMwXYaadMKmfQJKA0
         CPKA==
In-Reply-To: <CAL_JsqLYeXPtqDq_xetp5wB1ufjNAv5brvf840uD_=OLZ7uJsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant-72MMKEujIeWYvcOBcYx38pOp/cRyR9/c930Pai70D+E@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On Mon, Nov 20, 2017 at 5:20 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Nov 20, 2017 at 11:12 AM, Grant Likely
> <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> From: Grant Likely <grant-72MMKEujIeWYvcOBcYx38pOp/cRyR9/c930Pai70D+E@public.gmane.org>
>
> Ummm?

New Linux VM; forgot to do the "git config user.email" step. Bonus
points to there person who figures out my computer naming scheme.

>
>> Commit 737b2df3, "overlay: Add syntactic sugar version of overlays"
>> introduced an empty rule for "devicetree" that created ambiguities in
>> the grammar and causes the following warning:
>>
>>          BISON dtc-parser.tab.c
>>   dtc-parser.y: warning: 3 shift/reduce conflicts [-Wconflicts-sr]
>>
>> Fix the grammar by explicitly testing for the condition the
>> new overlay grammar wants to use. This means duplicating a very small
>> amount of grammar processing code, but the alternative seems to be a
>> more invasive reorganization of the devicetree rule. Better to fix it
>> this way now and save the reorg for a separate patch
>
> Missing period.

thx.

>
>>
>> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
>> Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
