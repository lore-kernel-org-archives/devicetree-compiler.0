From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 0/5] Introduce Python bindings for libfdt
Date: Fri, 10 Feb 2017 11:39:14 -0700
Message-ID: <CAPnjgZ2bMw3T9F+3xj6HAmXefZTUHqmPD5yUfZG5AFe5P0=VRw@mail.gmail.com>
References: <20170205201323.15411-1-sjg@chromium.org> <20170210050524.GH25381@umbus>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=ZbOKLoYQZUFb6ddDwD/f2pddmL28Sh6gO9y8CGHROT8=;
        b=cz6KreBG3YpL3V3diko7InpgxcJ/etgZsrcNz32qV4BjbRgJ3ztHPvzA4CCTQ9vPtF
         dFA49E7V3W6ZS6UloayJNYCWpzmrEwk56M758RotTWJt2h87zaIQdMFUxy98cvSB35rC
         aVwQLX830nPRuogoe8nCOCnJZs3K93uVR8bQLqJWvjtr0UvWB/04NsSZRm5dnS01P7JD
         V2rFUd95du8whYhltxHmK3RvNaVfslY153ToxPWX7OesO2vlbtoDfqhhE8a8QNnVNtv1
         VoO6ubytNbnt0ne9KoZVAQg7wF7gu/Qp8AUbOP42jKV05bk5Oial19zu55t6ykwSEr6l
         1PHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=ZbOKLoYQZUFb6ddDwD/f2pddmL28Sh6gO9y8CGHROT8=;
        b=cKBqYwSxfyjiXvp8pPM5o4o2IGr3aPqwtzTcNSF2by/K3sbgVYOlKz+AAAo+eW/lNV
         ozC1GMkGwFEsATtwVdL61Tq6RdRRKZCKIGUzwPwYzMZtxWDR6SmON12Ll6MgfQsQdiYV
         D/vftU73hYiZ1evDBS58M9L/v7DouO2J09Mac=
In-Reply-To: <20170210050524.GH25381@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 9 February 2017 at 22:05, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sun, Feb 05, 2017 at 01:13:18PM -0700, Simon Glass wrote:
>> At present libfdt consists of only a C implementation. Many scripts are
>> written using Python so it useful to have Python bindings for libfdt.
>> Apparently this has never been attempted before, or if so I cannot find a
>> reference.
>>
>> This series starts the process of adding this support, with just a
>> bare-bones set of methods.
>>
>> The v4 series provides binding that can be used like this:
>>
>>     fdt = libfdt.Fdt(open(fname).read())
>>     node = fdt.path_offset('/subnode@1')
>>     print fdt.get_prop(node, 'compatible')
>>     subnode = fdt.first_subnode_quiet(node)
>>     while subnode > 0:
>>         print fdt.get_name(subnode)
>>         subnode = fdt.next_subnode_quiet(subnode)
>>
>> This version does not include a class for properties. That can be added
>> if it is felt to be useful, but I want to get some basic functionality
>> agreed first. The get_property_by_offset() function would likely benefit
>> from this.
>
> Sorry I've taken so long to look at this, I've finally given it a
> review.

That's OK. Thanks for looking. I'll try to spin this quickly.

>
> Fwiw, I ran into someone at linux.conf.au who also seemed to be rather
> interested in a Python libfdt wrapper.

OK good - there was someone on the U-Boot list also.

Regards,
Simo
