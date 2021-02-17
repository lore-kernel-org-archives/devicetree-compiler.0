From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Prevent overlays from modifying phandle
 properties
Date: Wed, 17 Feb 2021 16:25:36 +1100
Message-ID: <YCyo0CrHJiEaPEYA@yekko.fritz.box>
References: <20201219172808.3101-1-pbarker@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h14oC3IiXCcvhNQm"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1613539542;
        bh=L0KC85Dr3sETTFgIt8gapmfQccppAlb+Yda+YCj4vvI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p/Cj3D1LPdZvrzc3/f+sCtBKqIL6GGljPyUfwqpZe5gk2GnXEpAMI0kaKu9JyQMx1
         kzEwWFHEMQ6GfP3rW4jslcx/uwAm3Ewv5RqvAnaLYCGh+jvbinKB3EeprUaSaht1Pp
         /6sOGgIg55aKQ9nRE1M/aLFl2ugfLxsrSRfT5qSI=
Content-Disposition: inline
In-Reply-To: <20201219172808.3101-1-pbarker-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Paul Barker <pbarker-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Scott Murray <scott.murray-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jan Simon Moeller <jsmoeller-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>


--h14oC3IiXCcvhNQm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 19, 2020 at 05:28:08PM +0000, Paul Barker wrote:
> When applying an overlay fragment, we should take care not to overwrite
> an existing phandle property of the target node as this could break
> references to the target node elsewhere in the base dtb.

It could.. but my first inclination is to say "don't do that".

> In addition to potentially breaking references within the resulting fdt,
> if the overlay is built with symbols enabled (`-@` option to dtc) then
> fdtoverlay will be unable to merge the overlay with a base dtb file.

If we can manage, I really think the better fix is to *not* have the
overlay provide conflicting phandles, rather than having the merge
process ignore them.

I think we need to pin down the cirucmstances in which overlays with
phandles are being generated and address those, if possible.

> A new test case is added to check how fdtoverlay handles this case.
> Attempting to apply this test overlay without the fix in this patch
> results in the following output:
>=20
>     input  =3D tests/overlay_base_ref.test.dtb
>     output =3D tests/overlay_overlay_ref.fdtoverlay.dtb
>     overlay[0] =3D tests/overlay_overlay_ref.test.dtb
>=20
>     Failed to apply 'tests/overlay_overlay_ref.test.dtb':
>     FDT_ERR_NOTFOUND

[snip]
> diff --git a/tests/overlay_base_ref.dts b/tests/overlay_base_ref.dts
> new file mode 100644
> index 0000000..1fc02a2
> --- /dev/null
> +++ b/tests/overlay_base_ref.dts
> @@ -0,0 +1,19 @@
> +/*
> + * Copyright (c) 2016 NextThing Co
> + * Copyright (c) 2016 Free Electrons
> + * Copyright (c) 2016 Konsulko Inc.
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +	test: test-node {
> +		test-int-property =3D <42>;
> +	};
> +
> +	test-refs {
> +		refs =3D <&test>;
> +	};
> +};
> diff --git a/tests/overlay_overlay_ref.dts b/tests/overlay_overlay_ref.dts
> new file mode 100644
> index 0000000..a45c95d
> --- /dev/null
> +++ b/tests/overlay_overlay_ref.dts
> @@ -0,0 +1,24 @@
> +/*
> + * Copyright (c) 2016 NextThing Co
> + * Copyright (c) 2016 Free Electrons
> + * Copyright (c) 2016 Konsulko Inc.
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
> + */
> +
> +/dts-v1/;
> +/plugin/;

Given that you're using the /plugin/ tag, it doesn't make sense to use
the "manual" way of constructing the overlay, rather than dtc's
built-in syntax:

&test {
	...
}

> +
> +/ {
> +	fragment@0 {
> +		target =3D <&test>;
> +
> +		frag0: __overlay__ {
> +			test-int-property =3D <43>;
> +		};
> +	};
> +
> +    test-ref {
> +        ref =3D <&frag0>;
> +    };
> +};

Things get weird in this example, because the point is we're equating
the __overlay__ node with the target node.  Just ignoring the phandle
overwrite is *wrong* in this case, because it will break test-ref
(except that test-ref isn't in a fragment, and therefore discarded,
but that could be changed).  Instead to handle this case correctly
we need to identify that we're asking the __overlay__ node to be the
same thing as &test and so &frag0 needs to be rewritten as &test.

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 294585b..a65b166 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -329,6 +329,11 @@ dtc_overlay_tests () {
>      run_test check_path overlay_base_with_aliases.dtb not-exists "/__sym=
bols__"
>      run_test check_path overlay_base_with_aliases.dtb not-exists "/__fix=
ups__"
>      run_test check_path overlay_base_with_aliases.dtb not-exists "/__loc=
al_fixups__"
> +
> +    # Test taking a reference to an overlay fragment
> +    run_dtc_test -@ -I dts -O dtb -o overlay_base_ref.test.dtb "$SRCDIR/=
overlay_base_ref.dts"
> +    run_dtc_test -@ -I dts -O dtb -o overlay_overlay_ref.test.dtb "$SRCD=
IR/overlay_overlay_ref.dts"
> +    run_wrap_test $FDTOVERLAY -i overlay_base_ref.test.dtb overlay_overl=
ay_ref.test.dtb -o overlay_overlay_ref.fdtoverlay.dtb
>  }
> =20
>  tree1_tests () {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--h14oC3IiXCcvhNQm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAsqM4ACgkQbDjKyiDZ
s5K41BAA3sLMD5fqu/Zhvt+h/WHgRzdIcLrYPZc6SWccWD6+DgpScSWnUt43YoKf
M0sTkRLLBh8AGZ/7SeloWZw4Ym4bQo7cPwrm2nKuWF9uuw17tIfc5oQBXBlwBWma
dYEUBloI8lnxNYCNJfNiFdSO6WEYgHhaszQwQwyRPOnuKTABmp5/o3b6JW2S8TS3
afxMYFV67Xkn3udIm994h/a4KnKgHLVNjf6Yx27JcK3j1a9fBncA5fnMbUvVrCCh
O2edl9GB8WiEANRMwjvc9dbMM9+01/PhZjOYiboL5j/oD4TVahJ++0DO8CPuvulN
umNTzGTFyhnM5iW8Bv7Gd+zvGN+d912wCbpN3W4+GOZLuivwQreT72fa8Uv6EFMA
rjNoUam60FlCdoyBUUvQ6dDAHnLdp3edPWCvtg5jQ/brlDNJVYI87QwiH12ZjSvo
7gOLjTZYZcLPfUzM7zn4LmBcwTRWof+yTrZQE/SafBnr6fPdlb+ao1+yBqUp8cCQ
jO+rlpqHRfVPIpt8gjSQngzJ512+Fz3tTI3hqCpsphO6ctXOAf8HGjOWhUjwYzCZ
NWSX8x6hGcpTRwqXdCUgwf5tNsDqX6rq6qQbFD5wHA27BxpTH6OapjTuDu0GH2G2
sjNKAColRgQshbWBEh1Tlrg4ucXJSEBHMP9diTZe8//Hm/Za1B4=
=I0OX
-----END PGP SIGNATURE-----

--h14oC3IiXCcvhNQm--
