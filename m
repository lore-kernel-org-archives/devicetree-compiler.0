From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v11 0/5] Introduce Python bindings for libfdt
Date: Tue, 21 Mar 2017 14:51:37 -0600
Message-ID: <CAPnjgZ1_r3QoeJkPz1U9AMadB3md_dHEv5NqMw5W+4-J=4cPpg@mail.gmail.com>
References: <20170317221434.15390-1-sjg@chromium.org> <20170321053531.GA19078@umbus.fritz.box>
 <CAPnjgZ0WkRXRqQBx0W6QhMqROZtC=RTebdA0TBrEPidtxRV17A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=mbIKCJotJEJWNpLZDTFKM39JXsZGBJPlCEVqD1WDaj8=;
        b=Z00je/AC6BqBGOiAqYrnlQwye9jlrARqNn4xOtD86fhc3nCvG0KQliaqvG1fqLrk0R
         ss0sOUGP5/Tep7JZAQxYv8ntsnBWihmpwMXF5y+hldikjw5Om9p1LekuPBO3is6lIoBf
         TxBwLOFoJBwHe0nbzRGUNA1qusQRqm1BIAqPV8hOE4YO81YbqajqIHGoQaZdcdnxJQxz
         K//YlkVpBIBK1D51p/RMuUuyBnuvoStKamlgvkEGk8HLkjjkT75vBqltYO0TzUeJmPe8
         kZhfqM9yMN/28oKdsgCgbozTzoz0T31dLbHStrpekeMNB7XQoqym9rg+9ePYMkkf4Fsx
         5/AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=mbIKCJotJEJWNpLZDTFKM39JXsZGBJPlCEVqD1WDaj8=;
        b=OXBVq/utGF/FeI9Lxtci6dujrLSGPNL+X+upmM1OThs0wMRY6Hq/nWY0jDMtD4RjW6
         n9nnYcHJGWZzZFZiFX9+6WlYhVt9gy5ylG7oT2tUHLHtofWVLC79vjnZHntIWgWOrgpg
         oxJIX+c5rpt6OR25RoIzit7TpnBXS/JaaBk2c=
In-Reply-To: <CAPnjgZ0WkRXRqQBx0W6QhMqROZtC=RTebdA0TBrEPidtxRV17A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 21 March 2017 at 10:02, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Hi David,
>
> On 20 March 2017 at 23:35, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> On Fri, Mar 17, 2017 at 04:14:29PM -0600, Simon Glass wrote:
>>> At present libfdt consists of only a C implementation. Many scripts are
>>> written using Python so it useful to have Python bindings for libfdt.
>>> Apparently this has never been attempted before, or if so I cannot find a
>>> reference.
>>>
>>> This series starts the process of adding this support, with just a
>>> bare-bones set of methods.
>>>
>>> The v11 series provides binding that can be used like this:
>>>
>>>     fdt = libfdt.Fdt(open(fname).read())
>>>     node = fdt.path_offset('/subnode@1')
>>>     print fdt.get_prop(node, 'compatible')
>>>     subnode = fdt.first_subnode(node, quiet=[libfdt.NOTFOUND])
>>>     while subnode > 0:
>>>         print fdt.get_name(subnode)
>>>         subnode = fdt.next_subnode(subnode, quiet=[libfdt.NOTFOUND])
>>>
>>> This version includes a simple class for properties.
>>
>> Applied to master.  I made a small change in the last patch, so that
>> the error message when the python packages aren't installed is less
>> scary looking.
>
> Yes that is better, but note the 'pylibgfdt' typo.
>
> I suppose it is too soon for a new release tag?

Actually before this we need to make sure the library is installed properly.

>
> I'm also interested in your thoughts on where to take this next.
> Presumably we should support the rest of the functions in libfdt.
>
> Benjamin, any plans?
>
> Regards,
> Simon

Regards,
Simon
