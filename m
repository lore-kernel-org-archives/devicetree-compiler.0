Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993087;
	b=c6zChM9DVpYSr+kAaVxlsko4WgjaLWifEzaEppx8i2ld267MROwQdTkYQlWHJJ3hnT9l
	 87HEGU/uPc6lWyau/rugeIKCeuEx/H4dG9e8rBb86XzkacPZMkFbU37ektqQu6Xhp+0Oz
	 wh0mdH5fqsgOzbY/q287LlObKuJNXTYT2m9CGrvNV7Ad+tzKHtNzp4bDuagTJhLkmvGQK
	 EFbIf7LpVgpYWnX0K3vbazpQs05Ar9ju1HXpWmHn+t+OYvcTsjGel7nBu9in3Xv288/f3
	 0c3Wz23An4ikx5rmMwI3hmS8KfQ0mQK7I5JbbYKpbluITT7jMB6HDKdgNNxo288PoRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993087;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ngPYo/6/AxSgdLys/4ADiwYsA//xt+rr0u1XtD3pxcE=;
	b=VCddbhhmXdFKArW9AJdIDHkJueWIL6vs0YVEgAqgOTSXO/VzdJ9TuOEu5V44SRpu6xjU
	 PKNCVeEWYixtvnGAK+BTvJLGV4+2OwfGaeSM7a7SDVKTWJhSGBEr6d4SLaPvgrGlU1ZVt
	 jAE+5TefURfkJgWS7To/orNrsQMwoh3Jr0emTL8wRFfMIRD/Jtfe5WJOGnq/zvmpjtyiJ
	 BGCKtcOmt62w5cU0SYsvSRyPCinbIwIzIVJ3DgyDTsX+rEjtcoJyktP+GXUL1XbSQOLtR
	 +5qJjGPeP7KAtdqDkDs2cv79wCq7J86lhbjRn+0XgEefXPYHpO69FMKkVSSGM4YwfQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=UaQNmrYh;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF50606A31A
	for <devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 05:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBF50606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=UaQNmrYh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792993084;
	bh=ngPYo/6/AxSgdLys/4ADiwYsA//xt+rr0u1XtD3pxcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UaQNmrYhaysPubA77cAZY4+BA98K9N2IVDOhsFE7DF0rvM8XaP3ik9qSzVLufUqNs
	 8oESNUHHCNsrqe3PMz2yAmlejmg7TkVn42GmpjLYSMckeO6Lly0btWeBHYTTjaTH+s
	 uB6ZkrErTr1eMCMTBpR0bTchu8dze8mc7E3T8RiEg/d49lLbvXAq07fbTv5bMN5SX2
	 AkWUGkHKbfr2CevZAFQ6kzmivbMGtb/Nbfxnq+Iazbj6pdVnb9i6+roG5UOGeHk9FY
	 HI8DRCvuEN1OHq9UcEYPE/JVNsVXF/YTIEokAmdllqYew6XamS9TF8MOkMHuEQ0UOD
	 6DdUVMnlEw5xw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jCj8D0RJMz4wCh; Mon, 26 Oct 2026 16:38:04 +1100 (AEDT)
Date: Mon, 26 Oct 2026 16:37:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 2/2] ci: Test with the single-pass parent lookup left
 out
Message-ID: <at7nDu9qft-Je-6P@gractus.seuss>
References: <20261025085508.1622340-1-sjg@chromium.org>
 <20261025085508.1622340-3-sjg@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0Rg0Q+WAqQgTji12"
Content-Disposition: inline
In-Reply-To: <20261025085508.1622340-3-sjg@chromium.org>

--0Rg0Q+WAqQgTji12
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 02:55:05AM -0600, Simon Glass wrote:
> Nothing builds libfdt with FDT_PARENT_MAX_DEPTH set to 0, so the code
> which finds a node's parent by walking the tree twice only runs for the
> deep tree in the parent_offset test.
>=20
> Add a step to the Ubuntu Meson job which builds with the single-pass
> lookup left out and runs the tests, so that every parent lookup takes
> the slower path. This covers the callers in fdt_overlay.c and pylibfdt
> as well as parent_offset.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
> Changes in v2:
> - Add new patch

This is so short, I don't see much reason not to fold this in with the
previous patch.

>=20
>  .github/workflows/build.yml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/.github/workflows/build.yml b/.github/workflows/build.yml
> index d5704d7..afd45e9 100644
> --- a/.github/workflows/build.yml
> +++ b/.github/workflows/build.yml
> @@ -57,6 +57,13 @@ jobs:
>          if: matrix.build =3D=3D 'meson'
>          run: if ! meson test -C build; then cat build/meson-logs/testlog=
=2Etxt; false; fi
> =20
> +      - name: Check without the single-pass parent lookup (Meson)
> +        if: matrix.build =3D=3D 'meson' && matrix.os =3D=3D 'ubuntu'

I don't see much reason to restrict this to only the Ubuntu build.
Might as well do it with everything.

> +        run: |
> +          meson setup -D c_args=3D-DFDT_PARENT_MAX_DEPTH=3D0 -D python=
=3Denabled build-depth0

We could disable python and run just the relevant test group to reduce
duplication, though.

> +          meson compile -C build-depth0
> +          if ! meson test -C build-depth0; then cat build-depth0/meson-l=
ogs/testlog.txt; false; fi
> +
>    build-macos:
>      runs-on: macos-latest
> =20
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--0Rg0Q+WAqQgTji12
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmre5w4ACgkQzQJF27ox
2Gci6Q//SQrzIyEbJhsi72TsNkqBs7OaNkwuRbQ7GW277H0Y3fgGOKDmdgVcuYVb
ANEZD7Ahn+dKkcN/msu3VmBA0e6HvvR95lC9JFHnMNCmE16ApELDwHIIb7HOwDqM
hLMR4LXvddh4jQQWL6HnX+dw/DbV8yOsPkFrGZ0WFyaK0wj8Xd/f1rT1Zz9Ka23X
YllWJRVJ3DbFPINIXcS5EplJaXduTBRXZdxuxkVyhiBeYl4A8mXQfa3XLGKqxKrZ
Z3g9pYfQ+r5kyWvAh09pY2WfIHEeU9F9BRulZbDE3I/CGwT9HBRy6vX2XtO6g5BR
B+zUX4AIPD0uKeq0XXMROqwGSPVQIPrcRRuXy0lwxP1DxG0EKr2NIbV37T6hly2t
brqpXVqUKKTja3JjFttS42UJ4CAznNt/83hkSzBdNJpALrKziWIXSLojzqTwMtro
M59dPLLKT4r/Xvx6fMchpTJgdNp6wAQkTMIzT/+T2LoTki6cr8kxNUdNKdNxP+KX
uFLzgHK1Nw0n5x6xdzO6Nu0+n7z91Db4H5jxXCeK5K9OTOE3qj3Rc2L9teN+8BJF
EWz+/DO8zVG7xS3tVCNe9Rg+nO71edE3tpzqqO2B2Obewzee81AKSpfyh6Lv1+ls
3w09L7sZLr7ea1PKah6b+U3VMiu3qUrUinL/HgqhfFRZQaFfVnc=
=MOgm
-----END PGP SIGNATURE-----

--0Rg0Q+WAqQgTji12--
