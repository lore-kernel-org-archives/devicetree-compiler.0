Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C3C15749C
	for <devicetree-compiler@vger.kernel.org>; Wed,  5 Mar 2025 04:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741148255; cv=none; b=gNh18+SsHir2USJSI/3S4GlYMmipamaTrOfGGH8GYE3/q/Cij2cv5lpemp6l2X8xXhloRopwpsjJrWhgkRO0UuEDTOu8Eq6Of7DkLzl9WMg0ZrAVYFrYMtqcWIlnMzcrY+ktcJreS6ppx6BD6mSsXggwDiGya3poX5ElKArdij8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741148255; c=relaxed/simple;
	bh=DidSThhFjP1rzH8Xkpmxlqr9Gl9WbclWQxuqPpnNIfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgfSJvO23/IjA7Xd+M7ayNuW19/sr/5w+TymI2yjO/TCoShzZWUHFpTJNFWtk9/lo/uTjpc5JwuogWwdgZu6alpyXVmv58lxeD5wUGnxflDugEGmvI2mziMtKbDcht4be8N5oLAxayZxd2igdHtionv90HUccKh97s2ixz/0Krg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Hj/BmYTL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Hj/BmYTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202502; t=1741148250;
	bh=KWJHRhzFG4H6m9VIcL2bJfzx6p5fOMTeHEUhgPhIqaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hj/BmYTLErjXuGJ2QoSdRW2nC9suKwH++h3cthqBR7g11q26GgRrz01QQNC4NWQ2v
	 em7Rl7Jjj4qu4Dzke8ziKK1q5uhc19HylzJw/EiOlMqVy//Yxiw3YhyCuMXb9UvgCH
	 Eb98fo7OtAj45VQQAtYv4mW4u49U3nMov6o/VYxkE2cXFPvwFkteA/arc/ixdS1lLU
	 GPY7Mp0/nrqZHYPBzXM+WS8yf+Nb0qjtm+rH/cyse0anHgqvL6/vREVF/gOgHyuPNU
	 WcGE/6WQzf/DRKzjcxBdUwZToW3ETVG6dUd3hiFDpyg/Z3ryU2183yagU6rf56gMpP
	 8yfERFWwcAU8g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Z6zmB520bz4x2c; Wed,  5 Mar 2025 15:17:30 +1100 (AEDT)
Date: Wed, 5 Mar 2025 15:17:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Glass <sjg@chromium.org>, devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 3/3] tests: Add test for /./
Message-ID: <Z8fQVMAVtpaKRe1Y@zatzit>
References: <20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org>
 <20250301-previous-value-v1-3-71d612eb0ea9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oZ9675kFfky4aFuM"
Content-Disposition: inline
In-Reply-To: <20250301-previous-value-v1-3-71d612eb0ea9@beagleboard.org>


--oZ9675kFfky4aFuM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 01, 2025 at 06:55:04PM +0530, Ayush Singh wrote:
> - Test /./ on a string and int array.
> - Also test on subnode property.

These tests are ok as far as they go.  Testing  a property with mixed
data types would be a good idea for completeness.

>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  tests/prev_prop.dts | 21 +++++++++++++++++++++
>  tests/run_tests.sh  |  7 +++++++
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/tests/prev_prop.dts b/tests/prev_prop.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..41a0e19015b006d78a3ec35a2=
6db63982ec4c90a
> --- /dev/null
> +++ b/tests/prev_prop.dts
> @@ -0,0 +1,21 @@
> +/dts-v1/;
> +
> +/ {
> +        str-prop =3D "1", "2";
> +        int-prop =3D <1 2>;
> +
> +        subnode {
> +                str-prop =3D "1", "2";
> +                int-prop =3D <1 2>;
> +        };
> +};
> +
> +/ {
> +        str-prop =3D /./, "3", "4", /./, "6";
> +        int-prop =3D /./, <3 4>, /./, <6>;
> +
> +        subnode {
> +                str-prop =3D /./, "3", "4", /./;
> +                int-prop =3D /./, <3 4>, /./;
> +        };
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index f0b51c04bf0af69f1df483b185f3aefa5d0bae27..30aa99f55570ac10b85c94353=
711361c19a5b479 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -708,6 +708,13 @@ dtc_tests () {
>      run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb "$SRCDIR/tes=
t_tree1_delete.dts"
>      tree1_tests dtc_tree1_delete.test.dtb
> =20
> +    # Check previous property functionality
> +    run_dtc_test -I dts -O dtb -o prev_prop.test.dtb "$SRCDIR/prev_prop.=
dts"
> +    run_fdtget_test "1 2 3 4 1 2 6" prev_prop.test.dtb "/" "str-prop"
> +    run_fdtget_test "1 2 3 4 1 2 6" prev_prop.test.dtb "/" "int-prop"
> +    run_fdtget_test "1 2 3 4 1 2" prev_prop.test.dtb "/subnode" "str-pro=
p"
> +    run_fdtget_test "1 2 3 4 1 2" prev_prop.test.dtb "/subnode"
> "int-prop"

Rather than have a batch of separate fdtget tests, I think it would be
cleaner to create a different .dts with the expected output from the
expansions, then compare them with dtbs_equal_ordered.

> +
>      # Check omit-if-no-ref functionality
>      run_dtc_test -I dts -O dtb -o omit-no-ref.test.dtb "$SRCDIR/omit-no-=
ref.dts"
>      run_test check_path omit-no-ref.test.dtb not-exists "/node1"
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--oZ9675kFfky4aFuM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmfH0FMACgkQzQJF27ox
2Gc2hhAAqrWZIFfySeEZioXV2+DV6tWe7AOMFU4LzeLWCbhamOnWNGHMGdzjHrJW
dGdFtCWM8skeNF4oDgrM1QhP3tS5fTFIpGSCB9UKjTAeHGlRK0vwkz+VCrlFnwKS
r8gMmOTITtdPSEKeSnOaFZ2V7j4x2QMsIVOZgwN/qtZnWSXa+XsrurYkxNUiarS9
BH1UtJEODc5iEMyTSdBBiYDLYapwrOynnkQdfWCtIHZpUeulGVXVQ4HtfSz+LHc8
8I+86drq2eB/oi6yN3tXx2O8Z2pKqi8lUNw7YePnEFKKDTDRKTUH/sZul5db1YrX
OmkZgWNUJr0IUktAGsCau5AC3S3paZR9PsjY8xIsx/Zfnsy6hpJGr47x2lgaVNw3
PGd2HviurT7Y4sINBNAruC88f+fw6vmbelNu3r73QNftSB4QrGwho/1Qz7GgA59o
wGujx8Lr/q+UaNrFVtfgMHIOUnd2GOfqWlSLFeCQpSIjTr0j6ZNKb4AmsgIjrnPL
LH60a/oQkYvHnI8iu+dwHDoBiboGYoLGk6u36j2LBCqGeiIfPRhHzBh6UCn5GFgs
kfn8UYj23zsFrLeNBy0qNUPJEUtbFh0jTY4PxPJJsuF+xPPiet6ba2zjvxQhIwQ3
weDy+V2wlja7eJoXLOcrAzRY4AOLERa75ynLI/+ohgqZHwkfTPk=
=rogd
-----END PGP SIGNATURE-----

--oZ9675kFfky4aFuM--
