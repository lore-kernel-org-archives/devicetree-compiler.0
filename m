From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 3/5] pylibfdt: Allow setup.py to operate stand-alone
Date: Fri, 7 Apr 2017 15:48:10 -0600
Message-ID: <CAPnjgZ1p2fF6dvdm96O8uM55WPH7Vd7VZbZrjLHYjJFNHbReUQ@mail.gmail.com>
References: <20170405160142.10564-1-sjg@chromium.org> <20170405160142.10564-4-sjg@chromium.org>
 <20170407054640.GB27571@umbus>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=7/lKU8DpzKbP6nGl3w+bAM1TwVLEM7zAjGo/zNHK4dM=;
        b=IezHUlM/VpAyJaP2xIqaG+IP7D3Rhavcwkh831glL43CE7hA3XAFzHyv/BB1CTM3SW
         PWrvh1x3v/dQojtuRCzoYrOwiPziuRiFOOeSgpHqSfE5gtvEVojl6aSPO36P3BCc0uB8
         pinktoOOVG7Rf0vfJJn5Zvg8FZg8KbqoSGTL5fAzJCGAgHHI4MYpvABw/RMTGciVvopD
         +mG4FwlJ2tlLXFPMf4PEOv9cmf1ag0W65Y7o70k0ovkZ2Svh7u2RwOQJGChYgZhkTbBW
         enunr9HkA6XNg7NabtTGjFSqB0mGBuqQ9+KCt3J0Gos2pCsf3eA6A+RoW5Doy6btuN5W
         XrUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=7/lKU8DpzKbP6nGl3w+bAM1TwVLEM7zAjGo/zNHK4dM=;
        b=gtnDi+koRqVw/05GcrG8PPyKd/iIpilNjGF9ty+kBxbOv4NalX6dWuUGaw4EA0j6oo
         yevgPLraUfEQosZq2sjgkJOUuNYGAE6OVhj04UVFaLhkcNdcwxPPDr6MD5Aw3upKI7NH
         bgIxOopSuy0bqXwUtx3U9IBD3CUHY34h97poY=
In-Reply-To: <20170407054640.GB27571@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

Hi David,

On 6 April 2017 at 23:46, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Apr 05, 2017 at 10:01:40AM -0600, Simon Glass wrote:
>> At present we require that setup.py is executed from the Makefile, which
>> sets up various important things like the list of files to build and the
>> version number.
>>
>> However many installation systems expect to be able to change to the
>> directory containing setup.py and run it. This allows them to support (for
>> example) building/installing for multiple Python versions, varying
>> installation paths, particular C flags, etc.
>>
>> The problem in implementing this is that we don't want to duplicate the
>> information in the Makefile. A common solution (so I am told) is to parse
>> the Makefile to obtain the required information.
>>
>> Update the setup.py script to read a few Makefiles when it does not see
>> the required information in its environment. This allows installation
>> using:
>>
>>    ./pylibfdt/setup.py install
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> I'm not sure quite how or why, but this patch has the side-effect of
> stopping the Python tests from running with "make check".

Yes I did see that at one point but unfortunately didn't go back and
investigate. There's a dependency problem since tests don't currently
build the module. Will send a new version.

Regards,
Simon
