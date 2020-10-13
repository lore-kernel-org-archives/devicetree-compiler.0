From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 08/11] dtc: Fix signedness comparisons warnings: Wrap (-1)
Date: Tue, 13 Oct 2020 15:59:03 +1100
Message-ID: <20201013045903.GR71119@yekko.fritz.box>
References: <20201012161948.23994-1-andre.przywara@arm.com>
 <20201012161948.23994-9-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gMqNd2jlyJQcupG/"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602565785;
        bh=w0Dp8nMx8hlTKyi+nImRdWKv1LaepwVrsVUj196/XRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mEcuYnfYJsM74qd8irsxrN0lfFp8q8CwF0JdWkiqKDGuxPAnvNGrwYbcBrRy86oJ1
         l1ZpxLizchTp2p05rm8JNkBgOKl/adXukx9Hlit0JiZbyzLSJ0dG4m8x0vkxh6qLpM
         lWqIQcWCylA8MmWBustMoE78xgmLT+CXyFLps6KE=
Content-Disposition: inline
In-Reply-To: <20201012161948.23994-9-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--gMqNd2jlyJQcupG/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 05:19:45PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in dtc's data_copy_file().
>=20
> Even though maxlen is of an unsigned type, we compare against "-1",
> which is passed in from the parser to indicate an unknown size.
>=20
> Cast the "-1" to an unsigned size to make the comparison match.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  data.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/data.c b/data.c
> index fdb0407..1473423 100644
> --- a/data.c
> +++ b/data.c
> @@ -84,7 +84,7 @@ struct data data_copy_file(FILE *f, size_t maxlen)
>  	while (!feof(f) && (d.len < maxlen)) {
>  		size_t chunksize, ret;
> =20
> -		if (maxlen =3D=3D -1)
> +		if (maxlen =3D=3D (size_t)-1)
>  			chunksize =3D 4096;
>  		else
>  			chunksize =3D maxlen - d.len;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gMqNd2jlyJQcupG/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+FNBYACgkQbDjKyiDZ
s5KiFg//WBvE8OTPnKy0qY0uNvPLp33m/I/zHLe7vNpwEpbOueO2lG8hmIpbNh1s
SKLzOKOmhTfSdyBvj61xVvZ/d4qzFYz0g86U35B4jfdLPYpARB8q9HKMP+P/J++8
vdddT8QKrTMrBz+4BQhCP5ttYHc/7e4Bqgw2JQhWEQiMRTxtEK/b4fhIwV/9VkkX
3opYUpjyyKpI7B6fQaEw9gINApZGG9Qm80nEhBXrkV4feqKwIdBJo4+M40kqzr8J
tnLShqJkoU2uAZim6UQBE5xzS9eGLBfJiXOUWHZi2Tz8jG6avpVuMV4MbuR48wVQ
wdtpQySAVqZ30IBoS4q0mb5P9CSf87oSxLjiW+y6Puz38M2maBSqI3sqXQ13xZ/O
CSvgACzcKdO2VR6vX4RfM4aUW9TbFoAjkfLdhVH/WF7MCN5om/JtkU+Ov/kDegQM
MKBYW3lqVkPLGAOttXwyORG+iBDCaACNy37A745w+42vHQ/64j2MdZC/4XzKtFjX
cDGOlJq/YHnV26935jTh11nlei9OmfVkXLxr8G8V/lMGN7dqqC0kQyKKVWzGiDxt
L3rrBdKWhga95c76vdtRCDOxDroYFUH95QrZm7um6v0mRDoq4qIy4cLV1M6j5KBv
QP2rAHX2g3lgHB9DFSgGoXUDx8E/2bxzCKlqy6KckSZMVYJERtk=
=YnSE
-----END PGP SIGNATURE-----

--gMqNd2jlyJQcupG/--
