From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Fix ambiguous grammar for devicetree rule
Date: Mon, 20 Nov 2017 17:36:33 +0000
Message-ID: <CACxGe6tqqhaBPCrLbacNSEk+vEqzkmzh7fSY-m=h=OjTpJfy+A@mail.gmail.com>
References: <20171120171218.3320-1-grant@tiffany.secretlab.ca>
 <CAL_JsqLYeXPtqDq_xetp5wB1ufjNAv5brvf840uD_=OLZ7uJsw@mail.gmail.com>
 <CACxGe6tvoYbKjCmK9SoGoXfqPN12POtLtgy4nyzovxcd2jHFnQ@mail.gmail.com> <CAL_JsqJAm_bnTnONLEb3oQJN+U9au9VZrEPN4SfEmZOqz-ncOg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=cOYdD+G5SMWQeMkQF60AQ6UM5kKFKHCRtpHBYOFkAVE=;
        b=ayiS7hDZ4iEKe9l/Gd7h4gP3b1hrQ0O9hGCFcn/EACpau6yss2KY0m22VAHilKKtJ5
         FG7sIpUXv8eJI2+91tH1V6vIDKpZQwTcHRJO9QrTOrIbOpSOF11gxN0K+suvgdzAS5gI
         C61q4zmsEoDa2PE2mBdhDXiAQGHnTZO2OBWCvM8D0z6mHqBDDL5Xvsh4P0v91GOaX/Ca
         Kr70OjqbHkaBZHeLyI7nhK8A1hWtBdTENJzsWiq8V5VbkMRY0yup6UxVhY9uNClrYcmw
         AtlpbPyRTNzeMfHyhMmnlAfnCf7+B9cqdzv6keXdFlAmaoErUefshcCltP3A+Ur9F2VC
         3+8g==
In-Reply-To: <CAL_JsqJAm_bnTnONLEb3oQJN+U9au9VZrEPN4SfEmZOqz-ncOg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant-72MMKEujIeWYvcOBcYx38pOp/cRyR9/c930Pai70D+E@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On Mon, Nov 20, 2017 at 5:29 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Nov 20, 2017 at 11:22 AM, Grant Likely
> <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> On Mon, Nov 20, 2017 at 5:20 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Mon, Nov 20, 2017 at 11:12 AM, Grant Likely
>>> <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>>>> From: Grant Likely <grant-72MMKEujIeWYvcOBcYx38pOp/cRyR9/c930Pai70D+E@public.gmane.org>
>>>
>>> Ummm?
>>
>> New Linux VM; forgot to do the "git config user.email" step. Bonus
>> points to there person who figures out my computer naming scheme.
>
> It's after your favorite music artists, obviously.

Oooh, burn. But no. Previous laptop was named Trevor

g.
