From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 3/5] Mention pylibfdt in the documentation
Date: Fri, 10 Feb 2017 11:39:24 -0700
Message-ID: <CAPnjgZ09WOUqK8+tY+eqjAuHecSRRNpc-GDXgMa5dUkg8=ORqA@mail.gmail.com>
References: <20170205201323.15411-1-sjg@chromium.org> <20170205201323.15411-4-sjg@chromium.org>
 <20170210045814.GE25381@umbus>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=hvvcp4L0G4y9TAsdoZRGD8yLnxn434mMO/bn7Hbd07o=;
        b=lCEIgIYd+sG4xiJfPI08BAX15q1F7YLjIpwpWkyVkSLw8tvPzuRnNsR9NETAxpHdEc
         QA/rLGaqaRrRepB17xgIabf70Aa7jeJsCUgUJwTc8JJXb+zYIxNQjQ9fGmmvNgpdTopv
         F9JlkQ+KI5yFRUAxSbX0JzZoN8MiR34fzRP4mhhHKMIfaMcc3gpbfjr3C7pMreS4/k8Q
         /nBq2WVnLQrK/D8F82J97wh5MAzKiGRRWbRIv6I3yVUASLc8gml3eWaqnfLmFrKAUEx+
         RfXvXDU19itjP9cojOFjArIuLbpnudII1p8FeRgWWi2z5sSxtqjdSQ48Yr72n1UXliJb
         JnWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=hvvcp4L0G4y9TAsdoZRGD8yLnxn434mMO/bn7Hbd07o=;
        b=jD+tsvVCmd3kXLyg68CaXuuv1bMAUPihfmFjCNjFUjPRYNmvkw0noZAeeDAZn0tzt1
         Mp6L76e2GbcepkEGgDP/dskxHWHXoPtCa8O8tmJHWfCHltqUbjnwHtDl3B0EKYL7M+B0
         JXHyo8c3lS9PmpjLepSh0LGt9PASOvFtK3oMc=
In-Reply-To: <20170210045814.GE25381@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 9 February 2017 at 21:58, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sun, Feb 05, 2017 at 01:13:21PM -0700, Simon Glass wrote:
>> Add a note about pylibfdt in the README.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>
>> Changes in v4: None
>> Changes in v3: None
>> Changes in v2:
>> - Add details on how to obtain full help and code coverage
>>
>>  README | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/README b/README
>> index f92008f..7191d1b 100644
>> --- a/README
>> +++ b/README
>> @@ -7,6 +7,39 @@ DTC and LIBFDT are maintained by:
>>  David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>>  Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
>>
>> +
>> +Python library
>> +--------------
>> +
>> +A Python library is also available. To build this you will need to install
>> +swig and Python development files. On Debian distributions:
>> +
>> +   sudo apt-get install swig python-dev
>> +
>> +The library provides an Fdt class which you can use like this:
>> +
>> +    fdt = _ReadFdt('test_tree1.dtb')
>
> This seems to be using the test wrapper _ReadFdt(0 rather than the fdt
> class proper.
>
>> +    node = fdt.path_offset('/test-node')
>> +    prop = fdt.first_property_offset(node)
>> +    print 'Property name: %s' % fdt.string(prop.nameoff)
>> +    print 'Property data: %s' % fdt.data(prop.nameoff)
>
> I think this is not quite up to date with the current version.
>
> In addition, I think the example would be more informative if you
> showed an interactive session, demonstrating how the offsets and
> property values are encoded as Python ints and strings.

OK, sounds good. I will revisit it once the interface is nailed down.
I can also expand this with a few more examples.

Regards,
Simon
