From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v6 1/3] dtc: protect against null pointer dereference
 in srcpos_string()
Date: Tue, 6 Oct 2015 15:10:00 +1100
Message-ID: <20151006041000.GI3861@voom.fritz.box>
References: <560F5D15.9060606@gmail.com>
 <560F5E44.9080006@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xQR6quUbZ63TTuTU"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <560F5E44.9080006-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--xQR6quUbZ63TTuTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2015 at 09:49:08PM -0700, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>=20
> Check for NULL pos before dereferencing it in srcpos_string().
>=20
> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
>  srcpos.c |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> Index: b/srcpos.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -268,11 +268,13 @@ srcpos_string(struct srcpos *pos)
>  	char *pos_str;
>  	int rc;
> =20
> -	if (pos)
> +	if (pos && pos->file)
>  		fname =3D pos->file->name;
> =20
> =20
> -	if (pos->first_line !=3D pos->last_line)
> +	if (!pos)
> +		rc =3D asprintf(&pos_str, "%s:<no-line>", fname);
> +	else if (pos->first_line !=3D pos->last_line)

This logic still seems backwards to me.  I'd really prefer the !pos
check to go first, then !pos->file, then the normal case.

>  		rc =3D asprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
>  			      pos->first_line, pos->first_column,
>  			      pos->last_line, pos->last_column);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xQR6quUbZ63TTuTU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWE0mYAAoJEGw4ysog2bOSa3sQAJ+pTUJKSdf35QvFgbnQ66gJ
WO7OaLmHVLP0nDGHSEYLQSobG4NtI3Mxinh7SjYga/03YuH5HdVso24qS/YIsHuC
jz9N7Do5neAicuta5fas9RaxrkvslIe30Uc4vUF12yhCbrtOxAsZ37axbQgjmg71
2PC7DEagYVt89Vcj+qrzvJe8t6+09KWvqejY5n5IauEZRkYKeHOXPTwESdL20LzK
1otRLBLv10Yi/ca1Dvlfdkdf3bmooWms7vxNrtim9UtYy/8dx+d5D7BLjD9zyxjN
/uP0YZMTQyPSDwE4tViIMIVmcrQ2xvDDi53IP2/qrLtWEJTOv/avZuUDWnr2ryIn
qmHAXqe8OQwvCu4Nu3F8Bi9HkTtSoVCtZjeMqIs0IvI5GRkDhNbeq7LfU7npR+wj
nbDE9I7hS+35Lm5n1h56Iv+DlzwDiHsDQve+NEmy2rll1nB6Z8l7/ouuPLn1KYtE
c+nZS3jW4zdfddKAMX/p3iS/4QpG1UiNUKdby+f7LTSJUQP+GA1W+8VxMxx+c71y
ECuAC/T1pRCObSsIl6sZGfSNHb45b8A7OC6VX46IRGVL2VkiObUYZvOAlJfh8js4
YtPRF5h7bu/2Ovb89fDOmR07S8T/I5qcSNVnG/ge63tTVReQsOS7reOYi4QoAl36
QvQjRNzLOqQRc+B5Qay8
=FeYV
-----END PGP SIGNATURE-----

--xQR6quUbZ63TTuTU--
