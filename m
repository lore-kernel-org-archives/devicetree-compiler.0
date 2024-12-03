Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874722E64A
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 04:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733201207; cv=none; b=CC4z1bf5EQkU6Inu2cocRnQPUTnP7DS2VNPiJ5XZpERsDmSuonja8K/xyrYD5nUqfgKp0PZyUETaulj/05jBY/WbRJG76BTKH4MMlTkd9TI43rj/1QWTtur4K+F1oGqfAW48+Opt7ED0xZKFaZq+CieHqrkQ0Y1SPd8RoBpE+xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733201207; c=relaxed/simple;
	bh=bM9zKUck8VhnD0mylPgl5pg9vP52Y0sFHNbjXwqiiDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jupgShEayDw0G5NZQTQ60mCfI+3fHWInMN91Zti2kWoPigEz7HrfTKdrDikySBXoUTvzMvpAzmIwn538EgqhgXRoWvBG00sXgVAeGvZn7lxW7mkREc0BoXv8GLqNmmnZt1zMS17RUMFCWuIc0SabibnY2j4mlHEIc7iivXc8/X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Be1hwT3Z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Be1hwT3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733201192;
	bh=JShceKH/4KvF08r89OPNIuf4LzctBW6iMPxzoQUySnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Be1hwT3ZTzjXkTq2q7puU7EOpDOdPb/y8A2SuHHaEy/AdajQQZgkFIMooYFmvNGch
	 CFmJ8nI1AFUsiKOsN+qtaPLzaaIlZYKUNGvxb05UjzDbjsuBI0IMmYG+RrGcaC8cbS
	 +jfyEdhb+e/lxo6KNdVzkL4wOt/Inc8clC/o4Z83aa65tUrYxygSnMO8bD3Qutop+u
	 Ipw5v2YBU8Wz682n42sr8fCR1pnnG3AMC7KJ6bcWd3l4LfVxa2eUSh09KIjRt4Mbuw
	 +9R0ReusGLoAgEgTlilxdn7M0FPDZJoeFQuASl2GpZFAEwusEXetWbfgA054Q29FkT
	 NkCEKp7UoFN7w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y2Sm82hW2z4xD9; Tue,  3 Dec 2024 15:46:32 +1100 (AEDT)
Date: Tue, 3 Dec 2024 15:46:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 5/5] tests: Add path tests for overlay
Message-ID: <Z06NHgkgh9-d310t@zatzit>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-5-ac3e121359e9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ITnJfe7rkRGjAGGe"
Content-Disposition: inline
In-Reply-To: <20241116-overlay-path-v1-5-ac3e121359e9@beagleboard.org>


--ITnJfe7rkRGjAGGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 08:30:23PM +0530, Ayush Singh wrote:
> Add tests to verify path reference support in overlays
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  tests/overlay_overlay.dts               | 11 +++++++++++
>  tests/overlay_overlay_manual_fixups.dts | 26 +++++++++++++++++++++++++-
>  tests/overlay_overlay_nosugar.dts       | 19 +++++++++++++++++++
>  3 files changed, 55 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/overlay_overlay.dts b/tests/overlay_overlay.dts
> index c4ef1d47f1f159c5284c8f7282a0232d944ecfd1..18382762eb3d7c26b0f2e507a=
cc3803f38194fb1 100644
> --- a/tests/overlay_overlay.dts
> +++ b/tests/overlay_overlay.dts
> @@ -50,3 +50,14 @@
>  		new-sub-test-property;
>  	};
>  };
> +
> +&test {
> +	test-patha =3D &test;
> +	test-pathb =3D &test;
> +};
> +
> +&test {
> +	sub-path-test-node {
> +		test-path =3D &test;
> +	};
> +};

You should test path references combined with other pieces too:

	test-pathc =3D "a string", &test, "another string";

In fact it would even be a good idea to test path references combined
with phandle references.
	test-pathd =3D "a string", <0x1 0x2 &test>, &test;

> diff --git a/tests/overlay_overlay_manual_fixups.dts b/tests/overlay_over=
lay_manual_fixups.dts
> index a5715b6048acaeebcdab56060040a339d08686a3..c40297aaefaaa6d168e42f864=
639a05bbbe69f57 100644
> --- a/tests/overlay_overlay_manual_fixups.dts
> +++ b/tests/overlay_overlay_manual_fixups.dts
> @@ -86,6 +86,25 @@
>  		};
>  	};
> =20
> +  fragment@8 {
> +		target =3D <0xffffffff /*&test*/>;
> +
> +		__overlay__ {
> +			test-patha;
> +			test-pathb;
> +		};
> +	};
> +
> +	fragment@9 {
> +		target =3D <0xffffffff /*&test*/>;
> +
> +		__overlay__ {
> +			sub-path-test-node {
> +				test-path;
> +			};
> +		};
> +	};
> +
>  	__fixups__ {
>  		test =3D "/fragment@0:target:0",
>  		       "/fragment@1:target:0",
> @@ -95,7 +114,12 @@
>  		       "/fragment@5:target:0",
>  		       "/fragment@5/__overlay__:test-phandle:0",
>  		       "/fragment@6:target:0",
> -		       "/fragment@7:target:0";
> +		       "/fragment@7:target:0",
> +		       "/fragment@8:target:0",
> +		       "/fragment@8/__overlay__:test-patha:0",
> +		       "/fragment@8/__overlay__:test-pathb:0",
> +		       "/fragment@9:target:0",
> +		       "/fragment@9/__overlay__/sub-path-test-node:test-path:0";
>  	};
>  	__local_fixups__ {
>  		fragment@5 {
> diff --git a/tests/overlay_overlay_nosugar.dts b/tests/overlay_overlay_no=
sugar.dts
> index b5947e96fb00dcf2c321c9f43e708863053b14b3..7e54ae5f5e7641bdf08626200=
e9471067b0f7677 100644
> --- a/tests/overlay_overlay_nosugar.dts
> +++ b/tests/overlay_overlay_nosugar.dts
> @@ -83,4 +83,23 @@
>  			};
>  		};
>  	};
> +
> +	fragment@8 {
> +		target =3D <&test>;
> +
> +		__overlay__ {
> +			test-patha =3D &test;
> +			test-pathb =3D &test;
> +		};
> +	};
> +
> +	fragment@9 {
> +		target =3D <&test>;
> +
> +		__overlay__ {
> +			sub-path-test-node {
> +				test-path =3D &test;
> +			};
> +		};
> +	};
>  };
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ITnJfe7rkRGjAGGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdOjRQACgkQzQJF27ox
2GfQzg/+Ly3VZRTTMuJGHTdDYhyjE7b9ISs/FswRGO+R0aZwuOQbFJ9kiw4UCzVD
953UUaWi+sJ9gcP89dAuOo1+X5oqag1TqNCIKiNve1ToFVh58aLzn5XjdNjiFjNB
yjmMR0N7MxnpqXa7/ThPhYuCOElcikcCqBLYBiLUBBSlUHd2lHQzAb/Dp/cLsVLD
pkVP0WNJJWVo0lj1gWfhVcUmQclK3tojTtrsxSjxbJhqd9pGlFp4lOBz/4jNvwv0
pxX0WSFdb+1EGttAyh0a21heGSTvDLGzL4VBboTWumVHVuiALatDfCWu1Kh8UrL/
POaFfX3WTWCO7VTT2UTKwFxstF6kmAt+X5Y775YAlWQb52/E1usbRTlSe8NEsybI
/Ys/BAKG68k4VZuBneK5Wx6hIYqv5edvgjBudYQY9eTYSRlqvvWqVcAbDL5wvHNa
32SxcY61lhLHmChAo0d+yLIb9YoVU3ZhIb4dslOt4dUSi+bHZ90NYHffhuEdFFPD
KOW4GeMa4cOWlCwsLB5LK4nmf2DC2+//XhwOC7EflFlI08RYC7XxUZdPgpeDYb3b
XjDbHrgb4qCyfNueI9wp5kbz3djzwHzHexJvuc9KZ2pqe2TPDUaDW7eURrkdkdX9
HvLf93fqtc1njbgo1yMJ0+MTvVpTd8EJKM68i0rmFFjj73H6IhY=
=98AG
-----END PGP SIGNATURE-----

--ITnJfe7rkRGjAGGe--
