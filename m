From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] Add device tree build information
Date: Wed, 15 Jan 2020 20:28:10 -0600
Message-ID: <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gwQsFePft3MfAfTwN78fKEDrEk3xpT6VkZlinejpxg8=;
        b=eHvGxNYjkklmWwDAF0QtjAfJ0ddV5IbvTQmBmdI8EAMRg48lNG1u019SMzE0mJlGAz
         95n8fNW/9/oAV6yYv6wPThFbTJ+f2826FSYvtqQ19HeRQfFqG0Xn9zsdPAZO9Y36XzFZ
         GCr5vz918v/S90GwjGBGYwHx07RUTeZUk0qXZTKrgZKl+3ZZNAU/VM5CTVVRSDHxjW23
         gZbeJp7HECVH7LCMnzgjt7uoMMNa0GUu3pLRtfhc3NTwaNmmNQ/AqfiJAYbGzdVadQFD
         HmTzKx9uGHhOdLVXA+k57KMmGBD7y2sdd+q+76j9cCPsCRTNYpyJIX3z5kprP1WZV7Y5
         PE7Q==
In-Reply-To: <20200113181625.3130-1-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 1/13/20 12:16 PM, Alexandre Torgue wrote:
> Hi,
> 
> The goal of this series is to add device tree build information in dtb.
> This information can be dtb build date, where devicetree files come from,
> who built the dtb ... Actually, same kind of information that you can find
> in the Linux banner which is printout during kernel boot. Having the same
> kind of information for device tree is useful for debugging and maintenance.
> 
> To achieve that a new option "-B" (using an argument) is added to dtc. 
> The argument is a file containing a string with build information
> (e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
> DTC use it to append dts file with a new string property "Build-info".
> 
> of/fdt.c is modified to printout "Build-info" property during Kernel boot and 
> scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
> last part could be improved for sure).

Please read through the thread at:

  https://lore.kernel.org/linux-arm-kernel/550A42AC.8060104-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/

which was my attempt to do something similar.

-Frank

> 
> Regards
> Alex
> 
> Alexandre Torgue (3):
>   dtc: Add dtb build information option
>   of: fdt: print dtb build information
>   scripts: Use -B dtc option to generate dtb build information.
> 
>  drivers/of/fdt.c           |  9 +++++++
>  scripts/Makefile.lib       | 11 +++++---
>  scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
>  scripts/gen_dtb_build_info | 11 ++++++++
>  4 files changed, 76 insertions(+), 10 deletions(-)
>  create mode 100755 scripts/gen_dtb_build_info
> 

