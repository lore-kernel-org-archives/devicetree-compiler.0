From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3 v2] annotations: check for NULL position
Date: Wed, 17 Jan 2018 12:10:44 +1100
Message-ID: <20180117011044.GV30352@umbus.fritz.box>
References: <1516040650-9848-1-git-send-email-Julia.Lawall@lip6.fr>
 <1516040650-9848-2-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s0H35NU0PUc8VBh+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516151609;
        bh=FE9QAkuAyKLg26Ts4g0IRmijdxfPAHAtsUCyj0m3/vw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oincahyutfWRfNyswuhVQjm7dU5cUsl4qMAZah/dD6LlsX9GuQUp7B3NwPwcpdeE2
         kCajMQ6LMqW38EHasR7RHHnQJDLUNsZgUxCmighbeL8NoKjE+ycj/UPpn0jY8s7D2U
         2NNVdf8/a/wMArGqGIwRiGwbULog3rjHGW/BzBUc=
Content-Disposition: inline
In-Reply-To: <1516040650-9848-2-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>


--s0H35NU0PUc8VBh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2018 at 07:24:08PM +0100, Julia Lawall wrote:
> Check for NULL position and NULL filename.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

> ---
>=20
> v2: Use xasprintf without result check.  Only use fname when it is define=
d.
>=20
>  srcpos.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/srcpos.c b/srcpos.c
> index e8fced9..9067ba3 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -250,12 +250,20 @@ srcpos_copy(struct srcpos *pos)
>  char *
>  srcpos_string(struct srcpos *pos)
>  {
> -	const char *fname =3D "<no-file>";
> +	const char *fname;
>  	char *pos_str;
> =20
> -	if (pos->file && pos->file->name)
> -		fname =3D pos->file->name;
> +	if (!pos) {
> +		xasprintf(&pos_str, "<no-file>:<no-line>");
> +		return pos_str;
> +	}
> =20
> +	if (!pos->file)
> +		fname =3D "<no-file>";
> +	else if (!pos->file->name)
> +		fname =3D "<no-filename>";
> +	else
> +		fname =3D pos->file->name;
> =20
>  	if (pos->first_line !=3D pos->last_line)
>  		xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--s0H35NU0PUc8VBh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpeopEACgkQbDjKyiDZ
s5KVyg//VU4r0glEJ1DZ6QwSz6xQkihS5iix0sC/J+IGcZiaxbQVhuD19qNNK5Ab
u0v8uWoJVfu8ehOTDh0Pfcj7oxnv8IRkBZEY72N0E1a8/mbjT55HHWRvbxQLShJi
YjIuerkxG9W8LXLjM8zMpSM2Ft8hixSxoGMUy4fpNo5htrCcAFMqvJqli3/momR8
oKLKdBl9fpXqXnOVimfDpC1vJwluUmGiqWQFu1U+ZdyIhmRTcrvmmxh9LX2IJf2g
4VsYrMD0t/8q43zYCNy8wZTxegVcIux6pB/emIFQ2mLw1rpBQkcOW1EpMg5QtbnL
J5cmD7R3KssIgeY2lkuIga+TIoYHwuvRsrEHkZVuS4pBDjKgBTOtRKpoMOB7JraO
+vG/n+usz2ttk8WeFHwGLhX5Y8V7kGH34D0cHMRYfKrCn62YrNIyk0iRx/47o7Vo
iW+wxFEjRIr67gJ/k2nZAETxkmFuJjMTb64+jspJUZiU9KhxTOlGJeh1ae97md+b
or6zAScLoyz8jRfSigOGPJuLFi+Kul2QGM92VySTiYvXIdGwJMZjJ++tWL6o5MLt
qQk49WW1MoGaecNoDY7cqgeVppjojNbFL20sSkXHkhYriGqPKnO76luJh61XfRBw
Pnt/N/z330jEo1WcRUt22zGSeHs3Bd9Qhn6+VhjeZlhx6DsRE/o=
=nC07
-----END PGP SIGNATURE-----

--s0H35NU0PUc8VBh+--
