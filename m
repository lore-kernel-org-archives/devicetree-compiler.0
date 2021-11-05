From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/4] pylibfdt: allow build out of tree
Date: Fri, 5 Nov 2021 16:01:38 -0500
Message-ID: <CAL_JsqL=panX9EW+41vTwsaWLtJbsY=opPPbwH+nnEGZSVnYsQ@mail.gmail.com>
References: <20201104194527.986901-1-marcandre.lureau@redhat.com> <20201104194527.986901-2-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636146111;
        bh=39o2PikH0PUh0ws595y2ACVDYgFPND4f1Ijp4s2qoKA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FEWPPwiUCb4JrYPrAwa7PtCGSaRmlltbvIyOVobP6yvHD3tkz6xLO+egBBdeLQR8Q
         +NLsSTuEV1ZZy8Ot4wxZPab0u+8gUYcCLt6P1IR7P3D1JiUgw70Z4dVOvP+tfU5zfv
         dNYGo5FWEAQESlcoh8WqwaXGXTVO4w9DLDW+B1xFqC7pevu/zgBGEMPH35RJrkvafq
         /EFtbvj8OM6PpXuMNGplwTowF7kVM5JVtGCK7ezsX6slnha6IBiJMAvXuRQtOQnf+3
         BkjCz3t9FbegFx6VvRF0WtqrRb2v958i0bLKfyIPuiGE2Moreqh+qrcQbytRoI5wrR
         /Ecrw7ElHUKKA==
In-Reply-To: <20201104194527.986901-2-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On Wed, Nov 4, 2020 at 1:45 PM <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> With meson, we have to support out-of-tree build.

I noticed that meson still builds pylibfdt/libfdt.py and
pylibfdt/libfdt_wrap.c in tree. And it makes the result unusable
without installing. For example the README instructions don't work:

    $ cd pylibfdt
    $ python3 -c "import libfdt; help(libfdt)"

I tried to fix the in tree part with swig option '-outdir', but that
didn't work.

Really what I'm after is what uses need to be supported? I'm looking
at getting pip and pypi packaging to work. I'm actually wondering if
pylibfdt needs to be so tightly coupled to the build system(s!) and
source tree. The dependencies are really just libfdt headers and
library which are easily installed either from source or a distro pkg.
The '..libfdt/' references are problematic with the packaging tools.
The easier route may be a standalone repo with a copy of libfdt.i and
a different setup.py.

Rob
