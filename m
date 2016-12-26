From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] dtc: fdtdump: check fdt if not in scanning mode
Date: Tue, 27 Dec 2016 09:42:25 +1100
Message-ID: <20161226224225.GB25998@umbus>
References: <20161221224138.GA14282@umbus.fritz.box>
 <20161221235906.24281-1-xypron.glpk@gmx.de>
 <CAPnjgZ0Tu-UdEg0Yx1aX+1exnXsR7ukN8d7hCDuxMCDRzboMRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1482798003;
        bh=dSayj+ykQ5FKa5AjzpuTcDmZ+/i3K5iJBPiCQzONGqg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JaVImYu6t5+RXECDaHAYYXgbwTIhO1nJqPX4kRZIhmAE55tZ9PG9a835OmU9pqX2Z
         UYOt0dZZSAbXCYyMpsS37H/eztFYozA3Rs6XfuuGncFlRWX5ogWR8yK6a77Cnr/JXk
         0RsWqQ1bHbOpokTWYYOyKQo7Mff/uz7ivGlFULpg=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0Tu-UdEg0Yx1aX+1exnXsR7ukN8d7hCDuxMCDRzboMRQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 26, 2016 at 06:24:20PM +1300, Simon Glass wrote:
> On 22 December 2016 at 12:59, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wr=
ote:
> > Running fdtdump without scan mode for an invalid file often
> > results in a segmentation fault because the fdt header is
> > not checked.
> >
> > With the patch the header is checked both in scanning as
> > well as in non-scanning mode.
> >
> > Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> > ---
> >
> > v2:
> >         Refactor header check as separate function.
> >
> >  fdtdump.c | 27 +++++++++++++++++++--------
> >  1 file changed, 19 insertions(+), 8 deletions(-)
>=20
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> nit: I don't think the function needs to be marked 'inline'. It is not
> time-critical.

Ah, yes.  In fact, the 'inline' keyword should generally be avoided
except in header files.  The compiler nearly always has better
information than you do about whether it's a good idea to inline a
function or not.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYYZzOAAoJEGw4ysog2bOSHYgQAIOf4CtaTJp9kNVZbb6crtdY
kmhklmUEdz+UHpM5lD978idIT/sGRelBAV8KPOiSW7FOYGHW0THHaXpyf6WBQOD7
xx/JNeeIrQ4Or4tVUi6OS/bTOf9viZKPkczWL42O/sevzJh2jfYRH1fjQF1xs3wH
4EIPSKwPp3UaPqhtsVbjIlvXpTWW93y27XbFuHcxp4uUxnOuQjpkLDxpi91ao5jI
VUDP9gZdhNLmT7cL/KuRpaayeYuDCdqveQjY6EtwUBIPcmvTHPfYM7k2IzXS4Mkr
T5dB+B2OJ5pnqwHO4TYl/XF3W1Ol55mDChSIBmINptGR3iLyaGmI01TW2VypaTGT
Gd+9Q2nqkMwIWbPxwMvDA3w1LKNcxy7oyDBUuFrX6ggMmScDQi42eoW8Tt6FtBvX
A9UKMJPTIKYYXoCzOPJDCRs8v570X7+l8TqzkBbMP/uhL3hYziL2/Byzf8O/lxQG
KjP9aKCH/2jCpWPJNwy5Lbkyvjyt0gxCtTlxh6Ue+6eB3/Le11NKFa1gUosWNCo1
XL6upPT745K0FDP/OPTh9bzZp0EwP4Zufs3E/G++YNU6IX1idb/tT803KrLcgKO3
KXoVJzadjJ9k8a5eAc4pYuKUMJBUDuc7DB23zw2P/ofZTFij+w4DfJKKD9FxQfsr
tx0aLzjunWlX/lbhCy7j
=Xyp+
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
