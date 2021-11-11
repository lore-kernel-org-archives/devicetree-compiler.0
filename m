From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add static lib to meson build
Date: Thu, 11 Nov 2021 14:27:52 +1100
Message-ID: <YYyNuNt8Lfxsltkv@yekko>
References: <20211111003329.2347536-1-robh@kernel.org>
 <CAPnjgZ3RuJAkndfHf6tUpVd07Nxi1Y8aWtZOaDbik0Ss8xpO_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b2JNrprvAJTmfY40"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1636602101;
        bh=4k/sIzaY8NtSS0nXFSx6MOp5/wKZpdH9QeoCh21/m08=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aUFGEwajchnzz+qG6o0oRpc0gyACFXtjw+YiwiE+lXB3omXukjwJBunfLAO1S6Emu
         JJsCuDdkJRaVlnz9nqQQzO87FskQkF4voSZATknNeFkRHKd1BBQiU/Dz2xecCIphIM
         ypNw8L5eMNfwhL9PF+khsxJTLcqBoT6C+x3YaFLk=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3RuJAkndfHf6tUpVd07Nxi1Y8aWtZOaDbik0Ss8xpO_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--b2JNrprvAJTmfY40
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2021 at 08:20:52PM -0700, Simon Glass wrote:
> Hi,
> On Wed, 10 Nov 2021 at 17:33, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > The meson build is not building the static libfdt, so add it.
> >
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> >  libfdt/meson.build | 5 +++++
> >  1 file changed, 5 insertions(+)
>=20
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> I have again lost the patchwork thing for this mailing list. Any
> hints?

Applied, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--b2JNrprvAJTmfY40
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGMjbYACgkQbDjKyiDZ
s5JL9hAAiInxUTiMnzM0/C17vIbFWhBZ7qVqWWg57DVnptgjHUN6qrWF+sfHPl4k
Jo8f8L6HP7CVFk8upXPnLpGwumEwnMPiV9L+3eBgjRUR+wZOaFTgTM+bICnf8F2Q
B+wR1FOddljtR3YYNekbdDO/wbIoZn6eo8/xv7Q+d5/8Gzd6AIaLF32HCwTj0GvX
jBpMaFNMoNinEu6lIrO/SJiJcCDigC+LtXQmiS7MPHQVaAObHCPxmGPYNeTd3OdI
UYJF/1quVHTEwtavs1XpnGU3+9ZAS5s9kESSqNEaG0K1IjIWh3rTwccnt1dW6ndS
OY/pRuigadfVAfxJclqPfYUkawvqz9mJum2+/qc+x0QBPUon+3VB11mtqgVRZ10j
hQWvzsL9GilYf3YJ3WfHBHlexXxJDIlsVbvGbVRx3lPwf3Ak4AAWyxjy3Uaro+Us
9HY8PaboQtAqsrZ4bbo1ry8UU+P0Osvz+b6KDmS9i76Yqf9RPCtqJ5JAduB2Y7j6
lanrAi6pkvJ5YDINYG4tHXv5q9udbmYRNNShmLQGkTcimJEPF9/CBV3arH6EaKat
KB2jNVs1Sdz0XKUM/CDJkRa5x/TKyafYcaUmf5CuJkjxjfO9rUiqbMHafefKJCu2
hWuUfYRCSvNdTIiAB73RHYFM01WeGNvX/Y6OmwU8mc/XJnVRVxY=
=B55y
-----END PGP SIGNATURE-----

--b2JNrprvAJTmfY40--
