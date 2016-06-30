From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 10/12] libfdt: Add overlay application function
Date: Wed, 29 Jun 2016 19:34:54 -0700
Message-ID: <5774854E.2020008@gmail.com>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-11-maxime.ripard@free-electrons.com>
 <20160627052607.GK4242@voom.fritz.box> <20160627114000.GV4000@lukather>
 <20160628031252.GZ4242@voom.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=y6cvNyakvIpziXNyF/xMT5tVDMk47a3EFBzOEUh99QY=;
        b=QJd2PvzenxCbsGdbxipKO95RYB84nV7Za9DFcLmG28tDbnYVG5RSafsaTZaUacC5wP
         ZIyPeOU3q2wGs45zV4xt2v6Nbfb3bM/XRID9MhZ/NHBAlKhIUtMbwhypniyioxVnWv7k
         rcxZifgCPbRIXIkzSygEtpthym9uuhffs3EcwgEXB1SdFLtOjIRz2hQYvHloJ0a8RcJO
         O9KyBhkqovX5i8ZlS4W1+0pKyg/5HZrAH8Rz4cJ6DZH++4KQ7xf6hFX2/OyYRXKdmRKJ
         tufQuWgc5PWpJYOXzFkqBWYixvzxoH0uOcensQC2kJ3syyIFzXST2wORSQxmvh/pe8Fn
         Xxhg==
In-Reply-To: <20160628031252.GZ4242-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Antoine_T=c3=a9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

On 06/27/16 20:12, David Gibson wrote:
> On Mon, Jun 27, 2016 at 01:40:00PM +0200, Maxime Ripard wrote:
>> Hi David,
>>
>> On Mon, Jun 27, 2016 at 03:26:07PM +1000, David Gibson wrote:
>>>> +static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
>>>> +{
>>>> +	const uint32_t *val;
>>>> +	int len;
>>>> +
>>>> +	val = fdt_getprop(fdto, fragment, "target", &len);
>>>> +	if (!val || (*val == 0xffffffff) || (len != sizeof(*val)))
>>>> +		return 0;
>>>
>>> This doesn't distinguish between a missing property (which may
>>> indicate a valid overlay using a target-path or some other method)
>>> and a badly formatted 'target' property, which is definitely an error
>>> in the overlay.
>>>
>>> I think those should be treated differently.
>>
>> AFAIK, phandles can have any 32 bits values but 0xffffffff. In order
>> to cover the two cases, we would need to have some error code, but
>> that doesn't really work with returning a uint32_t.
> 
> Actually phandles can have any value except 0xffffffff *or* 0.  So you
> can use 0 for "couldn't find" and -1 for "badly formatted".

< snip >

Hi David,

I would like to capture this for the specification.

It seems like I could say that a value of 0 in the FDT is not allowed.

Then thinking of what Pantelis is doing with overlays, it seems like a
value of 0xffffffff is allowed in the FDT, but it means not a valid
phandle, so do not try to de-reference it.

Does that sound good?

-Frank
