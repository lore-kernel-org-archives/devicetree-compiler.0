From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/5] dtc: Simplify asm_emit_string() implementation
Date: Mon, 6 Mar 2017 15:13:02 +1100
Message-ID: <20170306041302.GG12030@umbus.fritz.box>
References: <20170304132647.23286-1-nicolas.iooss_linux@m4x.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gvF4niNJ+uBMJnEh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1488773725;
        bh=J3Fplb3bTSuNdVfOnGwXTS8hD4OSa9xqBIno8uKZRtM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=be8X8OZLQgMqXTOipB3xJRzfJSOCU8Qc/2PGYCSMuLWiAQna0wB9q6pi5ocT0Jpyp
         EDid7UmdF3rfYYxisauI1P08DZzqScgalX2Lsozj7Tks5/AKg1SkbLW81M2MeAcyLH
         6ShQvjR1YdJd320cMXs1DTEfh/mv3x+X+mKyiiSE=
Content-Disposition: inline
In-Reply-To: <20170304132647.23286-1-nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--gvF4niNJ+uBMJnEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 04, 2017 at 02:26:43PM +0100, Nicolas Iooss wrote:
> Using %.*s format helps making asm_emit_string() not modify its "str"
> parameter.
>=20
> While at it, constify the "str" parameter of bin_emit_string() and
> asm_emit_string(), as these function no longer modify it.
>=20
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>

All applued, thanks.

> ---
>  flattree.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
>=20
> diff --git a/flattree.c b/flattree.c
> index ebac548b3fa8..d8a118258e01 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -49,7 +49,7 @@ static struct version_info {
> =20
>  struct emitter {
>  	void (*cell)(void *, cell_t);
> -	void (*string)(void *, char *, int);
> +	void (*string)(void *, const char *, int);
>  	void (*align)(void *, int);
>  	void (*data)(void *, struct data);
>  	void (*beginnode)(void *, struct label *labels);
> @@ -64,7 +64,7 @@ static void bin_emit_cell(void *e, cell_t val)
>  	*dtbuf =3D data_append_cell(*dtbuf, val);
>  }
> =20
> -static void bin_emit_string(void *e, char *str, int len)
> +static void bin_emit_string(void *e, const char *str, int len)
>  {
>  	struct data *dtbuf =3D e;
> =20
> @@ -144,22 +144,14 @@ static void asm_emit_cell(void *e, cell_t val)
>  		(val >> 8) & 0xff, val & 0xff);
>  }
> =20
> -static void asm_emit_string(void *e, char *str, int len)
> +static void asm_emit_string(void *e, const char *str, int len)
>  {
>  	FILE *f =3D e;
> -	char c =3D 0;
> =20
> -	if (len !=3D 0) {
> -		/* XXX: ewww */
> -		c =3D str[len];
> -		str[len] =3D '\0';
> -	}
> -
> -	fprintf(f, "\t.string\t\"%s\"\n", str);
> -
> -	if (len !=3D 0) {
> -		str[len] =3D c;
> -	}
> +	if (len !=3D 0)
> +		fprintf(f, "\t.string\t\"%.*s\"\n", len, str);
> +	else
> +		fprintf(f, "\t.string\t\"%s\"\n", str);
>  }
> =20
>  static void asm_emit_align(void *e, int a)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gvF4niNJ+uBMJnEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYvOHOAAoJEGw4ysog2bOSqqcP/RV8aEChXRYI0V9cTJLYf3Sk
v0UbuJdIhxjde4F5c8jd3Z2swjQrMc7St1ou9sWTkCbq0TriCg/yivXXoxg1GXTF
qIlVMHtLf6sHeUDPTiL8XdsYUShTgyFPkUSNjWhOaROgeqOdQygWo7Uf7OhuwPUD
LeLemHLuFLE1B/Wtc5VCFRrXoYP+sqpnMggo41hy3VXPpXLvcLYFAdz9lC9KcaOT
VdtxKW+h4AxenM7lufajZulKrqLfW8PqCO4TYmamUMYHv62ldG2I6U89WTW1+MA5
7uNzkskEe+EqZ9eY0YBGesEdL04U4m64op6ZfzpciiWWMf7WgbJrufaczE4oXbNn
NblHO+FgHaOXa1tnZKSc2gxfeHSHmjKas/Ar0n4ybYLFK3x+dMSv2nDFDIjieDCI
3QJoP+fWEyp7TseH3ufF4vciLX51GWMdkDaJ5W0AOXil28y/QQS3PR/bZKmHRMMZ
wID9DWzCTmy/pnP2JO8U93m4t7Z4UxRFphTIJj6WDj4O3pvJNCyqhnoVEfD2bkYi
hmEXX7A5oeiTlTqvf+quI2O2NIly9EG4YfdFCTENyDMKLetVVspduQU/XgKcJ9nJ
6QCHPwzlXtsIZ+WZs/XVuLLd6vI8bqETkbpI53ah+b5/a/cO4YmqOE0aPXM7hVrv
QXo3xUO3O6VDPX/gTFG6
=2S1m
-----END PGP SIGNATURE-----

--gvF4niNJ+uBMJnEh--
