From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 0/5] Introduce Python bindings for libfdt
Date: Fri, 10 Feb 2017 16:05:24 +1100
Message-ID: <20170210050524.GH25381@umbus>
References: <20170205201323.15411-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SdvjNjn6lL3tIsv0"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486703135;
        bh=qc44y1Cf2yJIIG3Bn8jHemr46K7ykbgKmDTAXfy7iNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PXMBzJ5oMUCkfgBVZQPojwTU+1vkcqVf0FSbZMmcCoVPLzrP0ZwaK/Gp4+Fj5ppJd
         L+2T1/ksfBgACuCwwDFvsk0+TWE3V0IYwm/BhNuybBiaFN0AO1b8GX3gUw2X8bUbMi
         4i92ltKMpavzSCT3b0sGnc0sovOS7Lz8pBdtE3BE=
Content-Disposition: inline
In-Reply-To: <20170205201323.15411-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--SdvjNjn6lL3tIsv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 05, 2017 at 01:13:18PM -0700, Simon Glass wrote:
> At present libfdt consists of only a C implementation. Many scripts are
> written using Python so it useful to have Python bindings for libfdt.
> Apparently this has never been attempted before, or if so I cannot find a
> reference.
>=20
> This series starts the process of adding this support, with just a
> bare-bones set of methods.
>=20
> The v4 series provides binding that can be used like this:
>=20
>     fdt =3D libfdt.Fdt(open(fname).read())
>     node =3D fdt.path_offset('/subnode@1')
>     print fdt.get_prop(node, 'compatible')
>     subnode =3D fdt.first_subnode_quiet(node)
>     while subnode > 0:
>         print fdt.get_name(subnode)
>         subnode =3D fdt.next_subnode_quiet(subnode)
>=20
> This version does not include a class for properties. That can be added
> if it is felt to be useful, but I want to get some basic functionality
> agreed first. The get_property_by_offset() function would likely benefit
> from this.

Sorry I've taken so long to look at this, I've finally given it a
review.

Fwiw, I ran into someone at linux.conf.au who also seemed to be rather
interested in a Python libfdt wrapper.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SdvjNjn6lL3tIsv0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYnUoUAAoJEGw4ysog2bOSvNkQAK4Js1mimE7lVzkwrsu91egz
FRWDXoLem6hC/laGKQA4gHPkdpoaAYd02CuVvyLLo4RxeFWPlclfLttmq/025G+E
481xFztAcwPV0ICaxvVe/5iol7RXsKzgAEZ4cEt/nmgdfNZWEm7GHFnzuSwOPXCx
yGZBALKKEBYofp2+iHH1Ykhh24NTAKWTTzzzTvQOvmI54kpYCfWZkBQJ3ZaHeXU2
22Z/Cp18RB+M8OF8YiqUUYelV/9KrBAYqq9s+DK6ud3skQbft0eKoy30fR791gRB
RGTtdN4V7Ls8B4q11/VL6Zaou920nKhk6OQjpgMWuEnpATCelOHVt/VTVX+SAhZ9
/FBXwMUJlTzZJ7nA6CaOAiymcGm/GBt+wE8MysOTAplH4XwFLFIfPoWr2O1uWW2P
PlaRfuPuSaN0+XNEWVNA1gonHonRAkOwlmAQeBmkRQ/taneeBViw1irYhrsbnztn
cKB8K154ucjZtIK4/YBxdi24ke0YFMwLcFy02Ymj0N97WohtQM351D591TRQ0TpN
Rp3bdiPwfhQwSITMROuASsQco9yyGf+afgQX6yIeAcqC+c9cZknd/FNz+rlWpioE
IHqam90vyVDj8zuMvAJ2pwSMeOIBKL5A/68D6DwmXkRPjaub5Q4MpLrB7yXxVKun
hVho1U1buFTGC9m0dDEw
=olRe
-----END PGP SIGNATURE-----

--SdvjNjn6lL3tIsv0--
