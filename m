Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593929;
	b=Z6oTRTfgf0WnGbxOqkR96pt2ixfr346RjOi7d1fxC9RnYgZh+cgAK1pznfz0uZinD2Ey
	 ytLLEBYrAaEFC2xAEe9c4/p3md8sgIjShdm6dQ10jNRQZ8zcVavc4mC1MPOZ5qv9QyhyJ
	 W/GndNOx+EeKJeZaYuXyu+KLEkG16xCl1ztepdxH2SVOhHhOou6JaUlqCEf83FVu7/JvE
	 buTsqv4n7j86GmMKcGNSyGiVbToMxilK4nUA1SgA2ASBB4HGNgpJhBMyl24sn1EUsO9hN
	 L/X84wpLa7matVL5H1qAEf7rc9XbchevCFE5pNVPcA/ZSbojS3D/eNLfyn4BzKAFE2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593929;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=yzZ/z+3CZkYv0Dmd3MXtKVrN/u9qrG1gStZV0Nk9xes=;
	b=xm7pEj1cdoATIFVVfrbMUN5TVw8ihOQC2FWc7qn6u93QCUQ1H0sbh/s9pJG3MVGMw6+c
	 6NgBWaPl6dwVL93AS+gX0fVCP+0NhUL9TqytK8oTWbuOBr5XafhKbMmyt15T/1SQg2LCM
	 D2xcelc9HtSseQDehcGuvYhK+Hj4WQDaJF+Z2zKiTNhHmIQYiL17k+m46UqOKlEKzQvX8
	 OOEvB4wM92W/D5DXzfmf9NzUVI6yBCOQrdGSOUpwJoP2UeyKinzSjFaTQNeaQqoMfsn7U
	 83BfszowzUzsH59vdm0eW5xIvYQzevDSSzJHyZW9MnB6pVeo6fZm81qZBETUPTAybrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=OEi3TiTq;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9111606A324;
	Mon,  2 Nov 2026 04:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9111606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=OEi3TiTq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793593926;
	bh=yzZ/z+3CZkYv0Dmd3MXtKVrN/u9qrG1gStZV0Nk9xes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEi3TiTqSPF7MH7vIa7w4NvMzxDnwX7v69FEBybOBL5B3poqs9g0miZ5kz3ec/xve
	 V3DApCh9xIGF9l6KT/Ajzx6HBpVZxaBhxw3wRYFP74iYOaYHQgWLbN3NNyR1ah7g2W
	 niimQrovDTJmbWFYQCh8wF3Hj2yBM+7Roco10VVPGuNsgC4EtGg/ShBZC8kiyKsOun
	 jqv68L/J9S4BFhYVkXOYnyCypqc1LF2OKKGjz2aDd/8lR/EbaHCYjZXQnJjG9AZ2Ny
	 6A9XnW2/qCDPmpzc0pmp7uJLFoQceb/Kv8IAKkEjGqJtzcUgLoObB/oooXMs8t8Npl
	 O9FGiRFD56LaA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHzLt2Ww0z4w1Y; Mon, 02 Nov 2026 15:32:06 +1100 (AEDT)
Date: Mon, 2 Nov 2026 15:32:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH v3 03/15] pylibfdt: Clarify iterator docstrings and test
 negative offsets
Message-ID: <augSQnmzSkLBRFdR@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-4-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="DEyseBBr8/Qj/VP1"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-4-dianders@chromium.org>

--DEyseBBr8/Qj/VP1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:10PM -0800, Douglas Anderson wrote:
> Follow-up improvements to commit 6b0371afc532 ("pylibfdt: Add
> subnode/property iterators and get_mem_rsv_list()"):
>=20
> - Document in `FdtRo.subnodes()` and `FdtRo.properties()` that the
>   device tree must not be modified while iterating, as node or property
>   offsets may shift.
> - Remove the inaccurate `Raises:` section from `FdtRo.subnodes()`, as
>   `fdt_first_subnode()` and `fdt_next_subnode()` map all negative
>   returns from `fdt_next_node()` to `-FDT_ERR_NOTFOUND` (which
>   `subnodes()` quiets).
> - Add a test case in `tests/pylibfdt_tests.py` verifying that passing a
>   negative offset (`-1`) to `properties()` raises `FdtException` with
>   `-libfdt.BADOFFSET`.
>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
> Changes in v3:
> - New follow-up patch for already-applied commit 6b0371afc532
>   ("pylibfdt: Add subnode/property iterators and get_mem_rsv_list()")
>   clarifying iterator docstrings and testing negative offsets (Simon
>   Glass, David Gibson)
>=20
>  pylibfdt/libfdt.i       | 9 ++++++---
>  tests/pylibfdt_tests.py | 4 ++++
>  2 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 0db7110b4a38..5c8859b37df3 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -204,14 +204,14 @@ class FdtRo(object):
>      def subnodes(self, nodeoffset):
>          """Iterate over the subnodes of a node
> =20
> +        The device tree must not be modified while iterating, as node of=
fsets
> +        may shift.
> +
>          Args:
>              nodeoffset: Offset of parent node to check
> =20
>          Yields:
>              Node offset of each direct subnode in order
> -
> -        Raises:
> -            FdtException on error (e.g. invalid nodeoffset)
>          """
>          soff =3D self.first_subnode(nodeoffset, quiet=3DQUIET_NOTFOUND)
>          while soff >=3D 0:
> @@ -465,6 +465,9 @@ class FdtRo(object):
>      def properties(self, nodeoffset):
>          """Iterate over the properties of a node
> =20
> +        The device tree must not be modified while iterating, as property
> +        offsets may shift.
> +
>          Args:
>              nodeoffset: Offset of node to check
> =20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 2a0509c7802e..93408745c575 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -171,6 +171,10 @@ class PyLibfdtBasicTests(unittest.TestCase):
>              self.fdt.first_property_offset(node)
>          self.assertEqual(e.exception.err, -libfdt.NOTFOUND)
> =20
> +        with self.assertRaises(FdtException) as e:
> +            list(self.fdt.properties(-1))
> +        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
> +
>      def testGetName(self):
>          """Check that we can get the name of a node"""
>          self.assertEqual(self.fdt.get_name(0), '')
> --=20
> 2.56.0.317.g454f8302e1-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--DEyseBBr8/Qj/VP1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroEkIACgkQzQJF27ox
2GeQ8A/+K1WgdzwxvMgSMbFoFnRFq3YBLIGlPmC0ze7H1uwRpqFQp5dnFLamtZxs
lhw1Zd7eV46zxyZyyHGOr/XjZ3B5ViGeNUgyR/xjEEqnA8KzFRfMUqc9dda0OjaQ
S0JZxdCAZQHm5nfKljQPteszFPK4VEYDcFMbMQDzyprs7h5pLEgGQIGfSF4Z9lCe
wec586XdosYUnmfi3foDYxNDvX7K+RtXcuztjwC7V812e+iLnv6PWKVKIO06C58+
FHRMBz1C61Q9PRI3LnhMUfMNQ7cdM/L24j4Urk3VggQFieM1elHODerF4cCqvGYv
I/atik4acWK8WjnDpph3xrc3e99RQD/GwCYFsGxUldr7RXz0zxH4xww3dpCkquJQ
NNBz5jQZtMk9c+CgWCY29G1ESnjfSJ1vu0yFaT3cScdjUCmiSHOvJrJ7hqHHd/CH
NSAPloe2KXGrXDBbeKMfiUrS9w+vKB708KgWDtghUllDLtHlRaZdNkNHuhLRaCKK
ERPgnypFoGvus6nnbqzhc9pgA1Jt7OTPNQRa3jRCR6/11wWv8UuFnmCZwPeEFKM3
FwH+ycSLqVzSxSMCm31YeicvYiXmaeg5Wcht3/XBNOZu0GkcOYub9gdLlx/BgBbu
li/sEQW7Unt7Uyr4pEb24DWdc2OExI72N4SMUSwm27sbM/6EpN8=
=ITzA
-----END PGP SIGNATURE-----

--DEyseBBr8/Qj/VP1--
