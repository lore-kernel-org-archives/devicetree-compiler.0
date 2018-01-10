From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtdiff: change to POSIX shell
Date: Wed, 10 Jan 2018 16:57:18 +1100
Message-ID: <20180110055718.GG19773@umbus.fritz.box>
References: <20180110054756.23464-1-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Z0mFw3+mXTC5ycVe"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515563843;
        bh=imrvInWGibm2gufu1dquzDBWv2m3qO6TUbDkjXYqsQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hCuGugpR4KTAtuyLzyS/sTguXtWA9ekJ2TY+GLSFwytXzeNXcattSbEF1WGNtzkFt
         UjB8Eba85Ri+vKJ0fmy3Q/1iq0rmHWVEU5vGqf5Qdw26cM/xrYbmTpGix2gdGj22az
         2tkEk1U6a85TBwNUAG++Ng4e624i7vS4+m3C2sto=
Content-Disposition: inline
In-Reply-To: <20180110054756.23464-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Z0mFw3+mXTC5ycVe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2018 at 12:47:56AM -0500, Mike Frysinger wrote:
> From: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> This changes from the bash-specific process substitution feature to
> reading with pipes.  It relies on /dev/fd or /proc/self/fd existing.
>=20
> URL: https://crbug.com/756559
> Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Yeah, sorry, replacing a dependency on a complex but widely available
shell with a much more cryptic dependency on a Linux specific feature
does not seem like a win to me.

> ---
>  dtdiff | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/dtdiff b/dtdiff
> index 5fa772b0ab62..4d1b71756c2f 100644
> --- a/dtdiff
> +++ b/dtdiff
> @@ -1,8 +1,4 @@
> -#! /bin/bash
> -
> -# This script uses the bash <(...) extension.
> -# If you want to change this to work with a generic /bin/sh, make sure
> -# you fix that.
> +#! /bin/sh
> =20
> =20
>  DTC=3Ddtc
> @@ -35,4 +31,15 @@ if [ $# !=3D 2 ]; then
>      exit 1
>  fi
> =20
> -diff -u <(source_and_sort "$1") <(source_and_sort "$2")
> +for dir in /dev/fd /proc/self/fd; do
> +    if [ -d "${dir}" ]; then
> +        break
> +    fi
> +done
> +
> +source_and_sort "$1" | (
> +    # Duplicate current stdin from the first file to fd 3 so we can chan=
ge fd 0
> +    # to the second file.
> +    exec 3<&0
> +    source_and_sort "$2" | diff -u "${dir}/3" "${dir}/0"
> +)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Z0mFw3+mXTC5ycVe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpVqzsACgkQbDjKyiDZ
s5JzwhAAzmGs5QN1urlp7OlMEybgY1WH30ltmYw+aMA2oxli3D0MO3FHz82sHHiG
wdj+mP3g/CmyfNkvla8oR4isFXJAzE16OwDn6SLQJv6PC7kxWy2+2MFsE64oVSiT
IngbYVv6xgkFNYPCWeknDeJYv5PPi8pcZnN1sV80mv2TMVJPA91JCy33N7PjT4Ls
2/v25MHWtgpRVxnNHKbGUN9bSYPkOMJFOIbBpB/L/qlBcEsMCD8CjWVpTQSJIcSA
IJglG9CZtjGofziyf7NUdGbNZ2dBbV64R8py5+6kq4OJ3n/ajIW/PBEOZ1BVH6dN
yDv9NZfnI898ljAeABedz70s7yG3hwv6CMQmFzOfYR1TRZCKxrA3obEdXb90DGmi
g+eBBr47Rh9d4+25WfeP/SOrhrd2wD31tc0SFFHI0IAdOCHELVHMqZdPbZNcP2ja
ahffUDPZMc0HIuq0UpxyhlQMA6HZFx4hu+vXf3DbgBIHMvyGcUMqp3TDt+Cpk2gF
PFDX9BG8olH7EkmntkuHf+BJgh/WYdrF2mt4DBuWogWSAeyO81HlMsdppMlI6+5z
dBW3i4wY6fUzxjdEMLQkzLidIgZvo9lnb4g3ApEj2TMkosAvtwgNWAvvMrnJOGzu
Q1188Ky+Iiwfawn6kmvYQUrqHmYIj7i23jID9obCm8DNR2mWM70=
=bs8v
-----END PGP SIGNATURE-----

--Z0mFw3+mXTC5ycVe--
