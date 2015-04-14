From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Invitation and RFC: Linux Plumbers Device Tree track proposed
Date: Tue, 14 Apr 2015 10:36:15 -0500
Message-ID: <CAL_JsqL0FdvKtGTxFNYxtrGWkm3z-1m0v9dHwYezCtkFOW6EgQ@mail.gmail.com>
References: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E@SELDMBX99.corpusers.net>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=y00EZEx5o7Mlu0ZVBV5FWX7Cnk5xR5hf2M4c7SBIga8=;
        b=wTSGO3lKmkq8ifzX5+uP6g2GM6KWeTH9w3dZx1LQrcuFoy5tUjp8hq+qheQYM9oKe8
         WYNsODwahH6ZBmLB5BguGHJcYIVG+z3z/vvw1vkxo0WlJFoT7gf+2zSpaim8EWmr/LK9
         4KkVUrO9ED71AEIkaO+RUSLqDIpBj4yojeMa9LSnFtsqQ7t6l9MkQO5Dd4CP4xfSvr46
         oLhWyjHKcz0lGOtHNxFyZgt39xukxVZ6aCfNM8C4n0UQh2L0x6ColKqLU2iwZVBHu/ZM
         WWWv/YpDZuK9jZI9J9XaFtJuPZpX4YfnDzZZjNw/0gI4/zHPREkHufZ1P0b9JlytE4aE
         bh8g==
In-Reply-To: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E-6yWnlZQfN9JoBVljSLT0Ysm4BeyDBExM@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rowand, Frank" <Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org" <celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Sat, Apr 11, 2015 at 2:20 PM, Rowand, Frank
<Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> wrote:
> In recent years there have been proposed tools to aid in the creation of valid
> device trees and in debugging device tree issues.  An example of this is the
> various approaches proposed (with source code provided) to validate device tree
> source against valid bindings.  As of today, device tree related tools,
> techniques, and debugging infrastructure have not progressed very far.  I have
> submitted a device tree related proposal for the Linux Plumbers 2015 conference
> to spur action and innovation in such tools, techniques, and debugging
> infrastructure.
>
> The current title of the track is "Device Tree Tools, Validation, and
> Troubleshooting".  The proposal is located at
>
>    http://wiki.linuxplumbersconf.org/2015:device_tree_tools_validation_and_trouble_shooting
>
> I am looking for several things at the moment:
>
>    1) Suggestions of additional topics to be discussed.

A few things on my list:

- Supported and not supported overlay usecases
- Tools for overlays - I think overlays has created new challenges in
validation and a need for new tools. How to test an overlay applies?
Generating a dtb from dts + overlay dts. Generating an overlay from a
diff of old and new dts (overlay as a way to update old dtbs)
- Shrinking the binding review fire hose. How to improve binding
documentation structure and review.
- Standardizing Android dtb handling. Appended DTB for arm64? Not
liked by upstream, but already in use.


>    2) Emails or other messages expressing an interest in attending the
>       device tree track.
>
>    3) Commitments to attend the device tree track (the conference committee
>       is looking at attendee interest and commitments as part of the process
>       of accepting the device tree track).

I plan to attend. I'm probably attending some of the Android mini conf
too, so I'll have to split my time.

>    4) Identifying additional people who should attend the device tree track.

Arnd Bergmann
Matt Porter
Jon Loeliger
Gaurav Minocha

Rob

> The desired outcome of the device tree track is to encourage the future
> development of tools, process, etc to make device tree related development,
> test, review and system administration more efficient, faster, easier, more
> robust, and to improve troubleshooting and debugging facilities.  Some
> examples of areas of interest could include:
>    - make it easier to create correct device tree source files
>    - support for debugging incorrect device tree source files
>    - create a kernel that correctly boots one or more specific device trees
>      (eg a kernel configured to include the proper drivers and subsystems)
>    - create drivers that properly work for a device tree binding definition
>    - create drivers that support detecting errors in the related node(s) in
>      a device tree
>
> The wiki page lists additional areas of interest.
>
> Thanks,
>
> Frank Rowand
> Sony Mobile Communications
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
