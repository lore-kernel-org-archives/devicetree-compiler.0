From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v9 0/5] Introduce Python bindings for libfdt
Date: Tue, 14 Mar 2017 08:20:53 -0600
Message-ID: <CAPnjgZ1pdbNMCdGbSZQ9aE=rGR0XZyJ-e9Fqsj2v0ThEuk6SiQ@mail.gmail.com>
References: <20170304235229.5343-1-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=wSQCIu84jQutuOroSTu4qXR/KGwx3vre4/eQamDLAug=;
        b=ST094SRIHo8dbnLkNM2Quss3dvSZnEYuOBAAcJhuqkbEWcUlTL3qS7H93PHZw9K3Sc
         nW2GNQAvVkfZTKb27FqPdop7VQnlOML36uAhfjfz0E4cZo1E4o8XBpR5U0BkL5HyC0Kt
         Cc5eEOiLxB3L+OniHJCP7sJNMgbp5y1uY6Eryd9VRRea0PY5xMX0Db75ce1XFJ1V//oV
         nE5LQ6lX2PRLCSQFyrYipyuQojaHRWe5J37aHUKoOcRRt4huUyRosrsR7TtZKaNkUjzC
         57Lm4diBZJoWSd3N7FRczlgL/O8/7O9V+0dgBtqB5GNQxagt0Cq9u+0V/znk1aBWwlW7
         /e+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=wSQCIu84jQutuOroSTu4qXR/KGwx3vre4/eQamDLAug=;
        b=H5FcJyoH1fTu7mEEap+EtYd+HRd2GRgTiYZcL3LcYiIEPIdXbU3GDXacqkUMmBalmC
         +t3dHzKDAny7ys7HBAAEaCTqTzOJqcwYkVaEdXGAH7FoY1iDbPuU2pCQiRFO2eGCq42+
         eSM6IuFzi0LI1JQk2qwUy/ItgEcXkyoLK0n+o=
In-Reply-To: <20170304235229.5343-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Hi David,

On 4 March 2017 at 16:52, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> At present libfdt consists of only a C implementation. Many scripts are
> written using Python so it useful to have Python bindings for libfdt.
> Apparently this has never been attempted before, or if so I cannot find a
> reference.
>
> This series starts the process of adding this support, with just a
> bare-bones set of methods.
>
> The v8 series provides binding that can be used like this:
>
>     fdt = libfdt.Fdt(open(fname).read())
>     node = fdt.path_offset('/subnode@1')
>     print fdt.get_prop(node, 'compatible')
>     subnode = fdt.first_subnode(node, quiet=[libfdt.NOTFOUND])
>     while subnode > 0:
>         print fdt.get_name(subnode)
>         subnode = fdt.next_subnode(subnode, quiet=[libfdt.NOTFOUND])

Just checking in to see how this looks now? I sent one v10 patch but
the rest is as is. Let me know if you'd like me to send the whole
thing again.

Regards,
Simon
