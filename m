From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] srcpos.c: Fix dereference after null check
Date: Wed, 8 Feb 2017 17:40:00 +1100
Message-ID: <20170208064000.GI17644@umbus.fritz.box>
References: <20170207170814.26168-1-jcd@tribudubois.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jQIvE3yXcK9X9HBh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486536072;
        bh=pM7lYft8OgSG5tuynHqdyIPu48OaOjcEQAhguQirs/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NNpRR541Cou7SOyficibX/qFYfYrmKdr8utrbFHbGvQFomUoCKg2LXcALAQFnEN9Q
         prmMRYWlEHg8LHL7xdI13KbSzCwCPkW8lsJMH2AENQX/LUA3X2Oy6MXB9pQhPDD+BK
         dOtOkCxEMuQ0KXlL0SP+sV7fgnhD84XK7ewHh/Ss=
Content-Disposition: inline
In-Reply-To: <20170207170814.26168-1-jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--jQIvE3yXcK9X9HBh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2017 at 06:08:14PM +0100, Jean-Christophe Dubois wrote:
> When running coverity on dtc source code the following error is reported.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 250 srcpos_string(struct srcpos *pos)
> 251{
> 252        const char *fname =3D "<no-file>";
> 253        char *pos_str;
> 254
>    1. Condition pos, taking false branch.
>    2. var_compare_op: Comparing pos to null implies that pos might be nul=
l.
> 255        if (pos)
> 256                fname =3D pos->file->name;
> 257
> 258
>    CID 1026108 (#1 of 1): Dereference after null check (FORWARD_NULL)3. v=
ar_deref_op: Dereferencing null pointer pos.
> 259        if (pos->first_line !=3D pos->last_line)
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Fixed the srcpos_string() function assuming the pos argument could be NUL=
L.
>=20
> Fixed the fname assignement checking the name was indeed set in the
> provided pos structure.
>=20
> As srcpos_string() can now return NULL, fixed srcpos_verror() to handle t=
his
> situation.

Actually, on looking at this a bit further, it looks like the post =3D=3D
NULL case just can't happen.  I've instead made a change to just
remove the pos =3D=3D NULL check from srcpos_string().


>=20
> Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
> ---
>  srcpos.c | 44 ++++++++++++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 18 deletions(-)
>=20
> diff --git a/srcpos.c b/srcpos.c
> index aa3aad0..cec790c 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -249,24 +249,28 @@ srcpos_copy(struct srcpos *pos)
>  char *
>  srcpos_string(struct srcpos *pos)
>  {
> -	const char *fname =3D "<no-file>";
> -	char *pos_str;
> +	char *pos_str =3D NULL;
> =20
> -	if (pos)
> -		fname =3D pos->file->name;
> +	if (pos) {
> +		const char *fname =3D "<no-file>";
> =20
> +		if (pos->file && pos->file->name) {
> +			fname =3D pos->file->name;
> +		}
> =20
> -	if (pos->first_line !=3D pos->last_line)
> -		xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
> -			  pos->first_line, pos->first_column,
> -			  pos->last_line, pos->last_column);
> -	else if (pos->first_column !=3D pos->last_column)
> -		xasprintf(&pos_str, "%s:%d.%d-%d", fname,
> -			  pos->first_line, pos->first_column,
> -			  pos->last_column);
> -	else
> -		xasprintf(&pos_str, "%s:%d.%d", fname,
> -			  pos->first_line, pos->first_column);
> +		if (pos->first_line !=3D pos->last_line) {
> +			xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
> +				  pos->first_line, pos->first_column,
> +				  pos->last_line, pos->last_column);
> +		} else if (pos->first_column !=3D pos->last_column) {
> +			xasprintf(&pos_str, "%s:%d.%d-%d", fname,
> +				  pos->first_line, pos->first_column,
> +				  pos->last_column);
> +		} else {
> +			xasprintf(&pos_str, "%s:%d.%d", fname,
> +				  pos->first_line, pos->first_column);
> +		}
> +	}
> =20
>  	return pos_str;
>  }
> @@ -278,11 +282,15 @@ void srcpos_verror(struct srcpos *pos, const char *=
prefix,
> =20
>  	srcstr =3D srcpos_string(pos);
> =20
> -	fprintf(stderr, "%s: %s ", prefix, srcstr);
> +	if (srcstr) {
> +		fprintf(stderr, "%s: %s ", prefix, srcstr);
> +		free(srcstr);
> +	} else {
> +		fprintf(stderr, "%s: <unknown> ", prefix);
> +	}
> +
>  	vfprintf(stderr, fmt, va);
>  	fprintf(stderr, "\n");
> -
> -	free(srcstr);
>  }
> =20
>  void srcpos_error(struct srcpos *pos, const char *prefix,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jQIvE3yXcK9X9HBh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYmr0+AAoJEGw4ysog2bOS984QAJl7ar3Cpv86AJTMv8P5txHc
r5TA5ZcAnT+aT4cOv1W7g7wt4HatFMbg7f8ALl4YkTTe7mABA8V4UK4oPmtXiUrB
BAZyF3jSbteyx+wWMwacG9sjrxpNaRUIqGTGsLZgEAbJghKaai4D5Q2HtfA6SlJB
n0v4viEX4bubnH9oEzkXoZ+EPBqiZTlYoOfbts22kMPX259apNAOAUkGwWmLXJ2n
TtM/JbgM9vD8u07jcUC+TZAUTBTTqZ3uQoGNwDgVwvuqeE4OjoHyXE9UKGHxk6my
Oy6tFio9HIkPIkPE+KZKALwQHQUrGj0rqXmzBhKIJPruIm3cLMYCUck2ELNis5i3
W8hGfjlSXbTHApAVznmqAhESKtTOPuvmSxgBx7sHcwWgYS9p1AZ19XPX96JjqL5M
tt3xo4p56J+xu81DvM4PyEZIIrmAsu/xy6ppE27tafK6yuIvzQUmOsxf+qXGjve3
CrEuVrCQ/0LAgeNyhduVQVJbjyehxIbdIkXLyL7JU2Avp0qOCn3qgeg34lmyb9Ar
tu7DcOcpf9RaRKmegUFXnWGtW+4UO3Z5+D+xsUr3/zvnmRxPyihkx5Zfs9ZUFmGy
dNDH9GXuR9NDy3O4dVfI41BZWZG6u5t9PrZ0ZwgVw/iPvUlQGdn+aDQcMwtC5e7w
lfsW+7wJt0TnTxAFHdY2
=cnwe
-----END PGP SIGNATURE-----

--jQIvE3yXcK9X9HBh--
