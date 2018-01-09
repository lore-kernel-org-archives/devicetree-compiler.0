From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/5] annotations: Check for NULL pos
Date: Tue, 9 Jan 2018 21:04:00 +1100
Message-ID: <20180109100400.GK2131@umbus.fritz.box>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
 <1515418607-26764-2-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DfnuYBTqzt7sVGu3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515493775;
        bh=nnjOjA5Jv+tsq9zIXfjvjWgFCrTPLQzRxdSM34uv6i8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ij3wXeEv03S5vXnkfSkYEuDNVMZC670c3b86pzRHVbOuAZnRJyp3a9wJN3PvTNU4W
         FFSWdPCOTQb7+KaaWnEMgt8hlC2FtxrICJn/L3SsC4D2Trq7DS20W9i1XSrIJe4/4N
         1ncfuQHWTLK4i1MlcQEN1PZT+k4r32L0DyYdento=
Content-Disposition: inline
In-Reply-To: <1515418607-26764-2-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--DfnuYBTqzt7sVGu3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2018 at 02:36:43PM +0100, Julia Lawall wrote:
> Check for NULL position and file name.  Check for xasprintf failure.
> Builds on a patch proposed by Frank Rowand:
>=20
> https://www.mail-archive.com/devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg00377=
=2Ehtml
>=20
> Annotation extension will introduce the possibility of the position
> being NULL.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> ---
>  srcpos.c | 35 +++++++++++++++++++++++------------
>  1 file changed, 23 insertions(+), 12 deletions(-)
>=20
> diff --git a/srcpos.c b/srcpos.c
> index 9d38459..7f2626c 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -249,24 +249,35 @@ srcpos_copy(struct srcpos *pos)
>  char *
>  srcpos_string(struct srcpos *pos)
>  {
> -	const char *fname =3D "<no-file>";
> +	const char *fname;
>  	char *pos_str;
> -
> -	if (pos->file && pos->file->name)
> +	int rc;
> +
> +	if (!pos) {
> +		rc =3D asprintf(&pos_str, "%s:<no-line>", fname);

Uh.. you've removed the initializer of fname, so this branch will use
it uninitialized, no?

> +		goto out;
> +        } else if (!pos->file)

I prefer to keep braces on all branches if they're present on any
branch.

> +		fname =3D "<no-file>";
> +	else if (!pos->file->name)
> +		fname =3D "<no-filename>";
> +	else
>  		fname =3D pos->file->name;
> =20
> -
>  	if (pos->first_line !=3D pos->last_line)
> -		xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
> -			  pos->first_line, pos->first_column,
> -			  pos->last_line, pos->last_column);
> +		rc =3D xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
> +			       pos->first_line, pos->first_column,
> +			       pos->last_line, pos->last_column);
>  	else if (pos->first_column !=3D pos->last_column)
> -		xasprintf(&pos_str, "%s:%d.%d-%d", fname,
> -			  pos->first_line, pos->first_column,
> -			  pos->last_column);
> +		rc =3D xasprintf(&pos_str, "%s:%d.%d-%d", fname,
> +			       pos->first_line, pos->first_column,
> +			       pos->last_column);
>  	else
> -		xasprintf(&pos_str, "%s:%d.%d", fname,
> -			  pos->first_line, pos->first_column);
> +		rc =3D xasprintf(&pos_str, "%s:%d.%d", fname,
> +			       pos->first_line, pos->first_column);
> +
> +out:
> +	if (rc =3D=3D -1)
> +		die("Couldn't allocate in srcpos string");

You shouldn't need this - xasprintf() will already abort on allocation
failure, that's the whole point of it.

>  	return pos_str;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DfnuYBTqzt7sVGu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpUk40ACgkQbDjKyiDZ
s5Jumg/3W/XWqtknjBAXnhsFAtadCNkW1LeL62utj9N15pnH+f9F0O8tHLqwsnkl
vM6ePWWPveycasxE7+/LPtZbGwSRSZWJd1Ex0uCDVfzeBp/qWoRCEmBzv4ovl8pB
5ySniE7A0v060boSn3kEASRaKXRnU/W1cyBDnpVME3G/psN/XK5kVrrxNvh1l8yF
1+WTbZAr3WxuXjt8JOecBCMmKiPCLExEjg9mQ4whg9Gqn2Luyimp5Mqp1Pw87deZ
Vvb/JRoXoH4lNOGA2TsyJ33YhcIGxoO+ajeEh/T5RYDsnXIC+W+48B0ZJq5sd3bw
hEecSelQiy1/Y8DLY7iG+895w4K0Nyl7phNEW7SKguROS1aDMYs2cxF2YugQxYtN
JRNIBbgbTHS+bmCg882uCgARGg7OOwt4MH41/Qff5pdghmIhE/TAU0O5n+wjmWLv
VLgz1DZVz291lzW7lt7mSE/zLXE918DNLRjj9unkBMmNbwj0imSkt/5ol3wT5L9i
HC1bgTzgeydD0Fq4HDX2ioEsac49gJGBHWAjKstqhvWuU4jch1KqNmvsVPovn3Cr
Pcs2CN2+Nyqg99A1eSnOYjKYa4ckKM71rdgL8eYx+XzWPJ5hHRqySYgfpHcKhWzf
rGxIUcBarMB8OJVqPq0+n8xB3M77653U8GtNjjigA80IfFZtLw==
=JMA5
-----END PGP SIGNATURE-----

--DfnuYBTqzt7sVGu3--
