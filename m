From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] srcpos: drop special handling of tab
Date: Tue, 23 Jan 2018 17:06:48 +1100
Message-ID: <20180123060648.GE11419@umbus>
References: <alpine.DEB.2.20.1801220904060.4623@hadrien>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516687632;
        bh=mESz2QkNgfNNI2xuYpo2Zvy42v3YVLaJ577vpCtKRRQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i7WgEHpI2nGSik93g1axWdHffIxCvQM5oPga/5W1u68FtElT+eMvGl4pVgaw42IQ0
         3piju9EzEHJrvKctrvPJNrkwxOyXutYkbVcZDX/vQc6K1lV20BDTygsZG6+23eYkcg
         AiXUc4i7zpin/I/r7ND60h5rcYYKUu8QNYSwMLqA=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1801220904060.4623@hadrien>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2018 at 09:08:45AM +0100, Julia Lawall wrote:
> Align column number with those reported by gcc.  Thus, do not make a tab
> count as 8 spaces.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> ---
>=20
> This replaces the patch about correcting column numbers.  That one should
> be dropped.  This one, with the starting column as column 1 and no
> expansion of tabs, follows the strategy of gcc.

Applied, thanks.

>=20
> julia
>=20
>  srcpos.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/srcpos.c b/srcpos.c
> index 9d38459..cb6ed0e 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -209,8 +209,6 @@ struct srcpos srcpos_empty =3D {
>  	.file =3D NULL,
>  };
>=20
> -#define TAB_SIZE      8
> -
>  void srcpos_update(struct srcpos *pos, const char *text, int len)
>  {
>  	int i;
> @@ -224,9 +222,6 @@ void srcpos_update(struct srcpos *pos, const char *te=
xt, int len)
>  		if (text[i] =3D=3D '\n') {
>  			current_srcfile->lineno++;
>  			current_srcfile->colno =3D 1;
> -		} else if (text[i] =3D=3D '\t') {
> -			current_srcfile->colno =3D
> -				ALIGN(current_srcfile->colno, TAB_SIZE);
>  		} else {
>  			current_srcfile->colno++;
>  		}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpm0PUACgkQbDjKyiDZ
s5IOXhAAgiVLW/5LH6ATpdNv6ib6U9DU3s2+i9z95bn/8MOln7kugSb8JCAn7c6C
KBcilyJiCZ7xaGaFZz2vNe503y4MScYb/+jPa1O+xFGogvXHZP0qEDMcYYuq0GA+
cLTcbbfwppnwXejW6TUCemqreUyo1wCf0ZArEfKPVgqvM9WVaS++3IekfVm6LdDM
6jyektooQdlGcloqNngu1I+ktnr1gfbavyem3eRQqmt14/1R5rjohTIUO2ikt0dk
0wM9Ufb2jiH9L6M3HbwTNivUkvoa/hmdAyXhpMDas9UU5WoWOMUEO0lqlLVIbJVw
mhK5nHtzXtFaPlTCZxO4uNAC7pCGVROBn2MaB1e8706NqujitDhRxwHROG6+Ovz8
3hSiqwEXjjEKC1DwRZV+mQ0LYsvKjkGgM7z7F+tZTGV2gOKLJ9wTk8yBzGORcYXY
rY0ms8zaAMmschAWOLCqDPZGe/vgNjU1Ti6Urh2UKmuOJIVhikO2t3g498+Z7IoS
zhjKoUNzCQcsscXcLGT8Knd3ypyDymqCfT1UfjIJ+3Z7kNAqZBRrEo2HfdUIqmZK
NOybKuZ3WPKbfYzF+uSryfHcF50gmHdSzCvEPl0/+YcfvXNHF2tKkrX4KPkjBeUy
TYn3aXL2M2tT1iyhNj00Y0thyM5TCCA3aYrB/O01X3rInC42u4k=
=orLN
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--
