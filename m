From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Attempt to auto-detect stat(1) being used if not given
 proper invocation
Date: Thu, 4 Jan 2018 14:21:39 +1100
Message-ID: <20180104032139.GZ24581@umbus.fritz.box>
References: <20180103163444.68928-1-kevans@FreeBSD.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PsVWHEfaXyN1A/K4"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515036198;
        bh=pmpUqXZeKld6a5kG0+LxLh5hATUbkasYxBT1fYMoAoo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HDMjXHLnAaXUoqD2tbARLDCxIXQiT+02XRkh0TAQKaUk93AwozHexvfAOE3Ice3Fh
         6cRpdsRmq1vDxvJZN9E4HYhn2l2+WcjhYh1llVfQvIObucm8/GYnP1vUIjNmbHA7Sm
         TT35XEBNG4FL8SvZ5B8h+CAEIz7eat53eL97PxUY=
Content-Disposition: inline
In-Reply-To: <20180103163444.68928-1-kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--PsVWHEfaXyN1A/K4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2018 at 10:34:44AM -0600, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
> GNU stat(1) uses '-c "%s"' as the proper invocation to print filesize of =
the
> file in question, while BSD stat(1) uses '-f "%Uz"'. Do some trivial
> autodetection to check if we're using GNU stat(1) and assume we're using =
BSD
> stat(1) if we don't detect otherwise.
>=20
> This should allow the test suite to run properly out-of-the-box on *BSDs =
and
> MacOS in addition to the current Linux support.
>=20
> Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
> ---
>=20
> I should also note here that I've not tested this on Linux, given that I =
don't
> really have any Linux boxes, but I don't see any reason why it
> wouldn't work.

Works for me, applied.

>=20
>  tests/run_tests.sh | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 3fa7c0a..0d30edf 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -8,7 +8,14 @@ fi
> =20
>  # stat differs between platforms
>  if [ -z "$STATSZ" ]; then
> -	STATSZ=3D"stat -c %s"
> +	stat --version 2>/dev/null | grep -q 'GNU'
> +	GNUSTAT=3D$?
> +	if [ "$GNUSTAT" -ne 0 ]; then
> +		# Assume BSD stat if we can't detect as GNU stat
> +		STATSZ=3D"stat -f %Uz"
> +	else
> +		STATSZ=3D"stat -c %s"
> +	fi
>  fi
> =20
>  export QUIET_TEST=3D1

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PsVWHEfaXyN1A/K4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpNncMACgkQbDjKyiDZ
s5JyKQ/+ORhy2nfXWKpa3+95h8C+l8x0tiydDA/ft3v/hvtUycNmYlvzYnfTYAQ2
4v6HfLmlxWe9e0a9lWgCTgvc9mmXptV0oMChfRCBhvoEwAJ0jIMkXNiB8Ni9FpRC
8qliSDC7uuDsGEkzCfVclhegKO0lDOstWe+e8TOw45jshR4BRAMIbT6yOA5ZFivF
pOE9dcznE4IXPgk9Y24vHf5XRDlSf5Xbdm7S1YVJaK2OSYFVT+goc6yxTgNXnfvo
CPZ/1MscVbqDQM8FOev57OPAzdOQ1AUQR48DBTuK367ujRv05dm1xU2x+h9/FwTO
n7Vu0LyBWlKwXjSn3bi+STWulY/dqpLrDMK+1YZgQEz7TS3Y9EPyUgEDWrOUgOlp
3URyQshXwOpOczkuer4rHsKTkZ+3N1ISeR9vRZlaxe9UAAgpSoezcXcpHOYu8Fbp
ATVDw+YN9icU7Pxuky3D24p9RCtWsBFSM5WBJyHW6drhzoJ0+A00Y3BZKDSEOK/O
engGZp9KqhGihA1N30shXerhwHoj8es5Mc8uXERmUA5uK8R/dnTAMtbnEvuTVWqp
ZreLXCRiFm5sO7ePfrcl6QCh4MukjW6jZcYRm+pPdDBwxHHWGYrGsswcOA1thA1R
ZycOXjtgx2qERjnasndByRy1WJlszJ2q1a9a1MOJOUTg3AIEs8s=
=7XfA
-----END PGP SIGNATURE-----

--PsVWHEfaXyN1A/K4--
