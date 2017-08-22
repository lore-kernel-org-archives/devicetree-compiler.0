From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 09/10] README: Add a note about test_tree1.dts
Date: Tue, 22 Aug 2017 07:39:57 -0600
Message-ID: <CAPnjgZ05qhg5hLAtRGS89qEcrPyfYXtJSjQTzaR0y8z4YOUvQA@mail.gmail.com>
References: <20170819171803.195806-1-sjg@chromium.org> <20170819171803.195806-9-sjg@chromium.org>
 <20170821002557.GD12356@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=PZUyaX95fGhvE8uMDdKtayCZ7TBJYd3DRMR7gr53PUk=;
        b=d4rgj2ulpV2gxa4owCwP7A1L0AoLBPj8aDgVBM2BZ9OPL9wER8McWFEFf8kLxujbaN
         5vAXHPwG2xtMCzga7kt7swDa++hKA52To+SFgkOlhSfInhrSEUHFVrr+Uxau0EDvZJmb
         DoEHk9EMiEDc3yOjk0DKhNxaixS5WIjAezWBYATKdfiEuQAYkxTqtOOaiW+dQd3pDPNo
         PqzCljf05syN7f6gVXJg3oRNfROR/9p4qJQHiONd4J3Bx0tLT8ohXyDUnaLI7W1Jtz/d
         17YmF3cI6S/2lWGhFo7GnRqvdWPVJMEW4oluZ2HvYQ8DfRJFWyJn2J0mizJyv8XNHud8
         BX/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=PZUyaX95fGhvE8uMDdKtayCZ7TBJYd3DRMR7gr53PUk=;
        b=i9CNeyFkAV+bFVsyW1KP4wB7uETwwbD/s2D9SaFPegneM//2i79tt8PU8U66T0BZBF
         50yGhwJvSPN5bkZOSh388IRgQg6JM+werAIpYKnqsa2kuajXKjDied/PQhBlxp/5qDOH
         /D0LRLATJ83AdOz8LrRifw+EbSAaQgWKg5IdE=
In-Reply-To: <20170821002557.GD12356-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

On 20 August 2017 at 18:25, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sat, Aug 19, 2017 at 11:18:02AM -0600, Simon Glass wrote:
>> Add a little note in the README about something which confused me.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> I've applied patches 8 & 9.

OK thanks. Will they appear at git.kernel.org at some point?

Regards,
Simon
