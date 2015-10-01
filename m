From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v5 1/2] dtc: protect against null pointer dereference
 in srcpos_string()
Date: Thu, 1 Oct 2015 15:32:07 +1000
Message-ID: <20151001053207.GL23574@voom>
References: <560CA87E.1010103@gmail.com>
 <560CA95C.6010109@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/jkxxxtAhYIHVDuh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <560CA95C.6010109-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--/jkxxxtAhYIHVDuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 08:32:44PM -0700, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>=20
> Check for NULL pos before dereferencing it in srcpos_string().
>=20
> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
>  srcpos.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> Index: b/srcpos.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -272,7 +272,9 @@ srcpos_string(struct srcpos *pos)
>  		fname =3D pos->file->name;

Hmm.. looking at the existing code, it looks like the
	if (pos)
above should probably be
	if (pos->file)

It would be nice to fix that at the same time..

> =20
> -	if (pos->first_line !=3D pos->last_line)
> +	if (!pos)
> +		rc =3D asprintf(&pos_str, "%s:0", fname);

Because this really should go very first, before even setting fname.
"<no-file>:0" seems an odd way to display this, rather than just
"<no-location>", for example.

> +	else if (pos->first_line !=3D pos->last_line)
>  		rc =3D asprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
>  			      pos->first_line, pos->first_column,
>  			      pos->last_line, pos->last_column);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/jkxxxtAhYIHVDuh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDMVXAAoJEGw4ysog2bOS/YkP/izOz0rhcpD7sMWFYwxlqADG
ZbNqT7zNxcleb6og0exVPbCS83DwZ5nNz3240VwItufVUikIjXCNN5f+TJMGt9L0
QNrs/60IfyZUVQmEUSTIy/cVclVOWWo/tFaJV/beniHJwZr5N90U/1qFrDXmD3+/
WsiEfCEYC/LCDr0FhYDGQrg6W/qsktCKrHDnnclX+ou23jnFD/DjQKpH0gZJHo3D
Ubd3eMLO3KNZmkBzehfADhqEG5+/8eYQ5jbMNeONNeUUZRht75BOszuaM6shd06k
LFh5BRAMgU0PK6Mbmnqy32pSRs4y26nKgzkaQtl7JFHAc3jpNltHfcqAE36mxWAO
B4kRxJb9IO0AG6nNhvA6u+hcE/TZjJfs5C+mFMKIY4XOTygscxhBTulMU7H2XDyv
RU/iCD4Enko4Sk1VggyksJojDn8oGsx7/WBQ3VF3JKTIa4yrgxCwviM28IzohA0C
ONRi+U7q6Hqvf59u8e8TC5jPAjk5nNP50sj/OPCWfG5BDk4L+Do7dit6m8pxv7rl
SXpPTG0GJTk68vMjZqcKOdThYu9yUDcuzwlOyzhsrxV2xdscQcnfs7luIf9t/TKH
LHiZ/H6tASwNzGBgzpL0wJ8QkpMwseAnnGOURIvY8tGXgKgM42myy4SUXoJbGtxq
qw4wWnLei2/5AXbFz9Hq
=6Pft
-----END PGP SIGNATURE-----

--/jkxxxtAhYIHVDuh--
