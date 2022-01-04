From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] setup.py: fix out of tree build
Date: Tue, 4 Jan 2022 12:12:55 -0600
Message-ID: <CAL_Jsq+yNJ9wUR=LNdr7SysEpwXzoT34wh8G3MJ5mW+mAv+PwA@mail.gmail.com>
References: <20220103073855.1468799-1-marcandre.lureau@redhat.com> <20220103073855.1468799-3-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641319988;
        bh=THbokACSrY0/qWTWpH0AXuz6/JO5gA2YPZ0kLNMLgpU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LNkkongSBMi4hlEVoBCdRjE9EJ4+vd4dGvsGa6/81VP2lqFcL6gxSsHt4Wzyg/B7Y
         3Ywaa6mi1WYTigrmO4wkP3g6P/I8tsOU3D8X35c4ZlKZHLjDi1ahF+4PXlDdSyzIq2
         n1O2qxahfoDFO0PH004VUEbduW1n5CwGu+LNwpzZQE9WqdbIqFohRBBT86CI9rJcTS
         hSL3ikhuY1EYceqin8Cg7hPNMvucqTteoKuT7o053LkJiUbFBAylKffuSv9H3JOx0z
         3SUAc+xrUl0czLWpCKIlYwt2gD4zi8m4Xm0scneSKfO9PVuPMmhLf/nmYp7keND/0U
         5JrgKGjAtAJMQ==
In-Reply-To: <20220103073855.1468799-3-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mon, Jan 3, 2022 at 1:39 AM <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

$subject is a non-feature IMO. Please see the my recent reply to your
patch from a year ago.

IMO, we should keep meson/Makefile and setup.py builds/tooling
separate. Each has their own ideas about how things work. The path
handling hacks that were in setup.py are just going to cause more
problems when we move to the new Python way with setup.cfg^W
pyproject.toml.

Rob
>
> Fixes: commit 1cc41b1c9 ("pylibfdt: Add packaging metadata")
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  setup.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/setup.py b/setup.py
> index 00444e64337b..029aa6182221 100755
> --- a/setup.py
> +++ b/setup.py
> @@ -17,7 +17,7 @@ import sys
>
>  srcdir =3D os.path.dirname(__file__)
>
> -with open("README", "r") as fh:
> +with open(os.path.join(srcdir, "README"), "r") as fh:
>      long_description =3D fh.read()
>
>  def get_top_builddir():
> --
> 2.34.1.8.g35151cf07204
>
