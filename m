Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265075;
	b=YRbxUfh6LJROb04ObCQEkpBKv3zH50ylnXiPY5vGI/ZreoRbjWwvcWuXnVBOgSmA6Pwf
	 1WQ1sGU7sSUVSAyf7hnq0xrou8czlpwAjr4NQ+dw7F0QMkhd8rH2qnMAQ2rIg9tbRpb1r
	 J4NgCxQbARxcXJQov8UN+gIASQQ5RmgI8SjuSa/TjD9mi1Wxo1Uj+SCOvlsinYopASsge
	 LFfpxQF9Rad5WB+OSasV6e0ccHtMWkNO9Ufdisot4e6R9+P3QrOMe05YrPz0gmnNGqcH2
	 iQT5bHEzZoxUuThu4VD7FJeHrKtwsUbkN/Z3cGjXi+GMe1Wwt34ShgFN0dbb5r2TBvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265075;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=DesY9onW6Qm5F/BlEq3HWVmD7O5N98tT3yvVTKJmKA8=;
	b=gvu8dXg4jaa40LelW6K46q8Xx+mAHPTfmbDSz/ugFOmckvCI6fkv1siItiAFxZMofqFk
	 TP9qlqeIys153aKKIsBGCAoHSx62SOoVuohYRD+oVxGNRKsSBJVm+z1q3iRAA1LStjbJq
	 fo13VvJ86HNDw5Luvgql1bBfJGw0BuwZMqoweuDLLBGDp2m+T//EhCgEfKzUrz4O+4NCN
	 KlvtP6c3BQRCpw6UXBmJQ97sx9UJogR1KmJoCWXGbGBM0zjHy5wRVDJWVS0SfBx+WWrar
	 t8K+NFBYelJDsEDwYMDAWZ3Jk9l70DsxOXbZ1TRytMfBOeSraZ3rVb7+qb3xOtXU1HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=NElZ6NPW;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1CC606A31F;
	Thu, 29 Oct 2026 09:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1CC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=NElZ6NPW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793265070;
	bh=DesY9onW6Qm5F/BlEq3HWVmD7O5N98tT3yvVTKJmKA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NElZ6NPWTMCHi3nTtuPElkdoLmx9jIxEuEnlBMAiuK3plBDedqFkBaNeax8JBhgwe
	 MHsYsR/2qaLoEv63LuK5ZCgq9Qtj7l9wRzdJn1Vf2+wFJ8q7rvLTgKZ1TdDGqlSDIk
	 A7FA/nGVP3DhfIQ3dZWWlYjJL+hVzlrbDCpwQ7/SyPIDFtjZV1sUCmm7LPF140aH0U
	 aiKcGm5kIY/NsbulKG1JZAKgP7RjgKSrnIpY1PwPzAPDPfxofynONUsZhaddX3tKa3
	 dTmS6Yq/Yky2d30/EocwCzpEyaPC2iBKvEkgzCoRtewwMj3leEcok0y021tyT773J3
	 9hBOMxF4F3WKg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jFdkk27jVz4whS; Thu, 29 Oct 2026 20:11:10 +1100 (AEDT)
Date: Thu, 29 Oct 2026 19:38:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and
 get_mem_rsv_list()
Message-ID: <auMF8HnYSTXS22jO@gractus.seuss>
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-3-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="TL5/2bxJUgMTDbEs"
Content-Disposition: inline
In-Reply-To: <20261028215600.1713475-3-dianders@chromium.org>

--TL5/2bxJUgMTDbEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 02:46:51PM -0700, Douglas Anderson wrote:
> Add Pythonic iterator helpers on `FdtRo` to simplify walking nodes,
> properties, and memory reservation entries without manual offset loops
> or `-FDT_ERR_NOTFOUND` sentinel handling:
>=20
> - `subnodes(nodeoffset)`: yields the offset of each direct child subnode
>   of `nodeoffset`.
> - `properties(nodeoffset)`: yields a `Property` object for each property
>   of `nodeoffset`.
> - `get_mem_rsv_list()`: returns a list of `(address, size)` tuples for
>   all entries in the memory reservation block.
>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Patches 1 & 2 are useful independent of the rest of the series.
Applied, thanks.

> ---
>=20
> Changes in v2:
> - New patch adding FdtRo.subnodes(), FdtRo.properties(), and
>   FdtRo.get_mem_rsv_list()
>=20
>  pylibfdt/libfdt.i       | 45 +++++++++++++++++++++++++++++++++++++++++
>  tests/pylibfdt_tests.py | 18 +++++++++++++++++
>  2 files changed, 63 insertions(+)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 46f28f67290d..0db7110b4a38 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -201,6 +201,23 @@ class FdtRo(object):
>          """
>          return check_err(fdt_next_subnode(self._fdt, nodeoffset), quiet)
> =20
> +    def subnodes(self, nodeoffset):
> +        """Iterate over the subnodes of a node
> +
> +        Args:
> +            nodeoffset: Offset of parent node to check
> +
> +        Yields:
> +            Node offset of each direct subnode in order
> +
> +        Raises:
> +            FdtException on error (e.g. invalid nodeoffset)
> +        """
> +        soff =3D self.first_subnode(nodeoffset, quiet=3DQUIET_NOTFOUND)
> +        while soff >=3D 0:
> +            yield soff
> +            soff =3D self.next_subnode(soff, quiet=3DQUIET_NOTFOUND)
> +
>      def magic(self):
>          """Return the magic word from the header
> =20
> @@ -302,6 +319,17 @@ class FdtRo(object):
>          check_err(val[0], quiet)
>          return val[1:]
> =20
> +    def get_mem_rsv_list(self):
> +        """Return a list of all memory reserve-map records
> +
> +        Returns:
> +            List of (address, size) tuples for each memory reserve-map r=
ecord
> +        """
> +        return [
> +            tuple(self.get_mem_rsv(i))
> +            for i in range(self.num_mem_rsv())
> +        ]
> +
>      def address_cells(self, nodeoffset, quiet=3D()):
>          """Return the number of address cells used by a node's children
> =20
> @@ -434,6 +462,23 @@ class FdtRo(object):
>              return pdata[1]
>          return Property(pdata[0], pdata[1])
> =20
> +    def properties(self, nodeoffset):
> +        """Iterate over the properties of a node
> +
> +        Args:
> +            nodeoffset: Offset of node to check
> +
> +        Yields:
> +            Property object for each property on @nodeoffset in order
> +
> +        Raises:
> +            FdtException on error (e.g. invalid nodeoffset)
> +        """
> +        poff =3D self.first_property_offset(nodeoffset, quiet=3DQUIET_NO=
TFOUND)
> +        while poff >=3D 0:
> +            yield self.get_property_by_offset(poff)
> +            poff =3D self.next_property_offset(poff, quiet=3DQUIET_NOTFO=
UND)
> +
>      def getprop(self, nodeoffset, prop_name, quiet=3D()):
>          """Get a property from a node
> =20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 1b65961491bf..2a0509c7802e 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -243,6 +243,22 @@ class PyLibfdtBasicTests(unittest.TestCase):
>              node_list.append(self.fdt.get_name(node))
>              node =3D self.fdt.next_subnode(node, QUIET_NOTFOUND)
>          self.assertEqual(node_list, ['subnode@1', 'subnode@2'])
> +        self.assertEqual(
> +            [self.fdt.get_name(n) for n in self.fdt.subnodes(0)],
> +            ['subnode@1', 'subnode@2'],
> +        )
> +        leaf =3D self.fdt.path_offset('/subnode@1/ss1')
> +        self.assertEqual(list(self.fdt.subnodes(leaf)), [])
> +
> +    def testPropertiesIterator(self):
> +        """Check that we can iterate through properties of a node"""
> +        node =3D self.fdt.path_offset('/subnode@1')
> +        props =3D list(self.fdt.properties(node))
> +        self.assertEqual([p.name for p in props],
> +                         ['compatible', 'reg', 'prop-int'])
> +        self.assertEqual(props[0], b'subnode1\0')
> +        leaf =3D self.fdt.path_offset('/subnode@1/ss1')
> +        self.assertEqual(list(self.fdt.properties(leaf)), [])
> =20
>      def testFirstNextSubnodeOffsetExceptions(self):
>          """Check except handling for first/next subnode functions"""
> @@ -410,6 +426,8 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          self.assertEqual([ 0xdeadbeef00000000, 0x100000],
>                            self.fdt.get_mem_rsv(0))
>          self.assertEqual([123456789, 0o10000], self.fdt.get_mem_rsv(1))
> +        self.assertEqual([(0xdeadbeef00000000, 0x100000), (123456789, 0o=
10000)],
> +                         self.fdt.get_mem_rsv_list())
> =20
>      def testAddDelReserveMap(self):
>          """Test that we can add to and remove from the memory reserve ma=
p"""
> --=20
> 2.56.0.313.g2479322e68-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--TL5/2bxJUgMTDbEs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrjBfAACgkQzQJF27ox
2GcbGw/+NoZiUz98Y9CDKnaUPJRtCg8Wr2QXiC6JfgYqcsdAdO9uoEFxg60HVMeQ
4A67lU9H2g+/Ca8wNJOT2P25nLJdk915npWj/qOsoVX+eoF+XK1aGgs5nym6omC5
0CMER6l2Z1vLpekV+JNcrwmPuIQMc8voXvdhzy1GMS8FnSKoVUIjAC2sngDXmUuN
WEHeRRihtZ6mL2IvAqzquU1AEeF5+iAZENkZX4wwmEukctOFMY11vyA3Ywl8GuzB
THpq1G40KIPiKReLCiU2bhr2nLgQIHqyicQktZ1HXbt5UCiGrRDnGkr3U44K/iwS
ShJG/HNLLkH+H6P5o2OfL2RrQPAR2EeDD5Ya0oJvR89FNP4vlkhHs7PrZEAOWpF0
Ey/fW7P/syILOGNf2kCK3KTjT2Pf2a9vAqU2UOjybdaNqL1ktk8ppMysCKUb+amQ
8cDZ1lawhAF0BwqlVqVCjkfq271pFVFzQHNZHKOKQzatF162GEuF2xTyBHjQuipp
jgQrneLBqL+oJDAO9W8W0RRThi3xi8B3B6rS0cE0iYV+RDLyELHpHdozAu7hKPjQ
BefO2xQh/gD5xnGFGRhTrUKlrovsE0vMgAh4r1LS7gZNwP6zjtWPvFkRsJf2YYf6
e/pObOmb0JcJQfCZzYe5okXbN/w8p8YWv8k7HALuVLyN6LAGyJw=
=Z1jb
-----END PGP SIGNATURE-----

--TL5/2bxJUgMTDbEs--
