From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: Fix memory leak in character literal parsing
Date: Mon, 12 Dec 2016 10:34:52 +1100
Message-ID: <20161211233452.GB12127@umbus.fritz.box>
References: <1481487196-20830-1-git-send-email-ga29smith@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1481502662;
        bh=vsN4T8uIeQ2tHyPKR8DET1VbWQPsDjRhw6J77lV8Wcg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C4LDOveBczR11psIaVmJm7yKAlAMioEuehXD44mlakzoFIB1G8A1mPFisH4Epa4g0
         xojlveusVqHf+sCRlcUrmWf3Jfb0c0h/GsQGg5trJim1NSioFC2gwkK7MjTGYUFRGR
         ysXReWyz2JTnKsVQtgqaNQnreqbO+lBiVgorWsfk=
Content-Disposition: inline
In-Reply-To: <1481487196-20830-1-git-send-email-ga29smith-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Gabriel Smith <ga29smith-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 11, 2016 at 03:13:16PM -0500, Gabriel Smith wrote:
> The data struct used for parsing character literals was never freed
> resulting in a few bytes leaked for every character.
>=20
> Signed-off-by: Gabriel Smith <ga29smith-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Nice catch.  Merged and pushed.

> ---
>  dtc-lexer.l | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index 790fbf6..f252ab9 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -184,16 +184,16 @@ static void lexical_error(const char *fmt, ...);
>  			if (d.len =3D=3D 1) {
>  				lexical_error("Empty character literal");
>  				yylval.integer =3D 0;
> -				return DT_CHAR_LITERAL;
> -			}
> -
> -			yylval.integer =3D (unsigned char)d.val[0];
> +			} else {
> +				yylval.integer =3D (unsigned char)d.val[0];
> =20
> -			if (d.len > 2)
> -				lexical_error("Character literal has %d"
> -					      " characters instead of 1",
> -					      d.len - 1);
> +				if (d.len > 2)
> +					lexical_error("Character literal has %d"
> +						      " characters instead of 1",
> +						      d.len - 1);
> +			}
> =20
> +			data_free(d);
>  			return DT_CHAR_LITERAL;
>  		}
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYTeKcAAoJEGw4ysog2bOSl+QQANuw/xxaBP1Fh0alLyQTsMUX
rDPTVbc9mCQHRpAYN0C6F277i9JE6X7lBjytx8AVhyiLJqtT+ASGlYxgtRd40428
tE6hN1ux1MCRBJCHNfzEdOFfHnaNkSj4thoBAJXmAoB3s4B6JeAGFve80aGa9P22
My49BuNb9x5PcQGgEejPlovjFX2IdV+noCmhvshnnyWNmgUFLvvFxE8XtYmuG9GI
KcBjYMqrUCEf0Ta9SXnHLbcXI/0x6XgqtGYrl64Esa/ED3D0FEshi0/AdDfuIzEw
cSkK1QR0rTRtsEKMoIwiaNdUHf7ML7pwCbYAGgj2P2beBrBTTLsPkkDapKr4IzMG
ks5HcWG8kq4T4+Qa9XIdeN8bISV/DL1sRGlRSCYwVQbJ2AdzaeMorK29hfcbvYPB
5Uw/g576p3mbwdNgebmmtXbn0V9LCz7NGx3NqW7MoQv2d/S58lFSW29FLCIIZP2Z
3nfvj3jgxZalIyUo9yZd2XyJKViZ9CiB+3kvrhvCm4NPwOwEhfpkIfaB2OYGDzht
MnlLZ0MdR3HmMXEXca1ufUImQEHej4Ebx9DxU4seHXCGu2mrTkQMDeEaL7poQhnS
ZccjtZYLQXRL0OE2fblgm+dYzZy8vkxe32tFpXjrJcXaljZvHdXqN5Rld7o05o80
3H6hdZHf77oBu6blFxzT
=MSJB
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
