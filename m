From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Add missing relref_merge test to meson test list
Date: Sat, 2 Jul 2022 16:37:41 +1000
Message-ID: <Yr/ntXuErx7H89ZS@yekko>
References: <20220629163114.932175-1-tero.tervala@unikie.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="I9wfliSnxcL8ce67"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1656753416;
        bh=IptaI3X301b46eEbFKh3myMM6MyarcqVmJwOolNndHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ANgNXM7ngjV2sTFBUVYq+XJB94G4IpYEedimgR5Idz+4ToPqzHcGOSLZPgrmLEMuM
         e81renEsL0qTskkuTZ7eXBQKv56VDC9qaCIDtn8AdUztrceBO6eCi6N7yLoRESP4X6
         ZG4biqELsqGPDS6A1RBcPOHYUwNeLsfF9FC8z0ns=
Content-Disposition: inline
In-Reply-To: <20220629163114.932175-1-tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--I9wfliSnxcL8ce67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 07:31:14PM +0300, Tero Tervala wrote:
> Will remove one "Strange test result" when running tests with
> meson
>=20
> Signed-off-by: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

> ---
>  tests/meson.build | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/meson.build b/tests/meson.build
> index fa06824..3776fef 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -71,6 +71,7 @@ tests =3D [
>    'property_iterate',
>    'propname_escapes',
>    'references',
> +  'relref_merge',
>    'root_node',
>    'rw_oom',
>    'rw_tree1',

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--I9wfliSnxcL8ce67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmK/564ACgkQgypY4gEw
YSLGNQ/+JtAJ1dVtLGq7SGiRZJlOTlgTEh6lbGhZrt9lUAhvbJc212DNAUsXmqc5
mLRiOSGfelsw4L+83wRHDLrLh03GlzOguBbBEND8VjjoumX53rAzOqhB60aX5O8Z
VeCIO4ja+XRfN5TMQ9XPI7PdOJD91y4uPNJ8hI0EZ8zYe19BDj407dIkwIVLYDel
VAe3eup4rOXBfeQVXggbk7dLMuiB1LY4R+JpSKWE2pRgywIeo2EmLBexNvYVFPuf
LjDpTmC8UUdA1JNP1HaGe2URKmU8ZZYxXMlkDU7+LMe4Nn/lEUiTm1aAmUdqAr/s
pmLZ8HjHPhtzyo4heMhhYoeq5OW/eKxBtuLqCsMBTBXhS1wYTCNlE7m4xIE1gZbS
ewQLO4v7sGM57N8FBCdCLnLMX+v98u65NCKS/noeSNjqldEpsouq+Ey9fwVUAWWh
kjMcsR9qakP+MuMB2QHgHH82x3MoyEkbc7G+1EmyOCbmWJhoMBJy1eaw9qC1swze
z4Qk6TDKoEgbj2mj8mVsd2gpfK62rjsVWgHklKx7gn6w9zKwI009J8YeraXrHDfP
vB8EVCkXsybXi10whrZh/BzxNGQceEA3Ek5dBvwvsilx/ZWucRL/cOg5LDdJbDRr
39GunuYM1s158GBmSbCyk0wVkZ7KafT4oJxzx72EqknaW/SmoXc=
=2OnG
-----END PGP SIGNATURE-----

--I9wfliSnxcL8ce67--
