From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: Remove -O dtbo support
Date: Fri, 12 Mar 2021 12:58:09 +1100
Message-ID: <YErKscWisdaJf/PE@yekko.fritz.box>
References: <20210311094956.924310-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2bALcUhB5+rNA34W"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1615514382;
        bh=KX9QzVmVKYRCFkR5EpSojc/VYJjnyzlcnQpi56DoVwk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bx0e3B2UXAFZNpauo5vFqjSZ89R2L7wcVLetyPDwYIxLy0yvQKAUpyD5+BUqetr3p
         Lt6fim4YCBGDM+O7flUIcKnctBhQ83vv6pzMqCLnwGhQVXByw2JgQEfjJ9ytpemIyX
         WBsNuxl1lZ5bQNfYDWh4zhC9ylSgWkoXAWapUh/M=
Content-Disposition: inline
In-Reply-To: <20210311094956.924310-1-masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


--2bALcUhB5+rNA34W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 06:49:55PM +0900, Masahiro Yamada wrote:
> This partially reverts 163f0469bf2e ("dtc: Allow overlays to have
> .dtbo extension").
>=20
> I think accepting "dtbo" as --out-format is strange. This is not
> shown by --help, at least.
>=20
> *.dtb and *.dtbo should have the same format, "dtb".
>=20
> Signed-off-by: Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Oops, yes.  When reviewing 163f0469bf2e I missed the fact that it
accepted -O dtbo as well changing the default based on file extension.

Applied.

> ---
>=20
>  dtc.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/dtc.c b/dtc.c
> index 838c5df..3962d3f 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -359,8 +359,6 @@ int main(int argc, char *argv[])
>  #endif
>  	} else if (streq(outform, "dtb")) {
>  		dt_to_blob(outf, dti, outversion);
> -	} else if (streq(outform, "dtbo")) {
> -		dt_to_blob(outf, dti, outversion);
>  	} else if (streq(outform, "asm")) {
>  		dt_to_asm(outf, dti, outversion);
>  	} else if (streq(outform, "null")) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2bALcUhB5+rNA34W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBKyrEACgkQbDjKyiDZ
s5JJvRAApwIh+bKhk6zMX17Qu/2t80l3je8k7dtJyzs21UT+KUG4vm8OaaStqXFu
Q1ECEpddqvR3YW1d7hEldLvK03KSu7cDwP3l6oSHKPnHwcc2PuQnCDoDPOQY7Gg5
L81hbrAF43mEme3BlU/13+fX2MH4gPb0fDvHQLpMsZ3tbJ1PASpU51OWO6+h7//J
fQQbbbcHXc06/AvaEjeNUgN3wp3ASAoS111aWCa9alncAGHVlK8ylPTfH/4emgmx
8jWF0vinpKAz/qPrGEMklamx9sPygI90yo8PUyiJxacCwhnP2HrkeD9uwKzi7Rxf
zprDozaYtCfaZ/7GKDVmg5Jd4nP0odl/KqDiyn4GJUrdqE4LDjrDJtP2+iDChakM
f/HWIuA+B2C6JCs30MQ0a1tUHD+k2BzKsUBC1CEUlvRtS9tSJ4Q1qC+aUq+WRrNh
CoeN6C3jvQl5XAMOAg6F9ROz5TR6OEDkP9IxgnMAY+BBEofyhFZRi/UjMcZf53eH
wvBG5MEfnQ2r/2oib+Dc7SnXo07qjpfUGvr7cSYoB9cEsWC5ZFpv0kJdNAOAVbdu
xXI2gAfm8pwST0Y7X/DyIko3DFzQ6xt6ljEfdFOI0lEhXRJZsPnd4m5yk7MkHrJt
tn+xMwORNisW/Xuom+HxXDLG00MPePpmmi7rRlzxo8lXqhNnck8=
=HysT
-----END PGP SIGNATURE-----

--2bALcUhB5+rNA34W--
