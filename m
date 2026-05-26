Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14B03D45FA;
	Tue, 26 May 2026 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787011; cv=none; b=PgKO4PSKQ2qgKHAB+bEPPNfoVn1smxsihD799XOiXJ7SsrkBZ3ojmNK3nVApUoFWJBat0DYzX4Ah6t677tLUC8mT9iTf3SrHgqIyJuJpGyqGxQ+Fdivk6Otye65uhe0EhzpobfSpY41AFaJ8lQ/Wj8r8/X6H9+Gitsh1QswVabk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787011; c=relaxed/simple;
	bh=BP9cn15ZhN4Y66iRzKKpcKOKtn7Xsi0XDPeBNbnFEWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbZbvAQZQLO+H3a3JzZ8utONqsGDmMBTAybZob+B1ECOFtdarnrFdhcDovQOrrQQ+idgzg2ADlEVfv+QKnYsic3/fcE+b7CT7jR5FrPXxZORwhBZTIPSN10PSg6Ks5KYVje6eJeR4PO3gHywpJDu88ppy1Yya1jyWrgqJFMVBzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=bFIUdpME; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="bFIUdpME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1779787000;
	bh=uFL0kwpYH5xYLFC2QgP8jp9lOSLZnERss/OQfiKILlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFIUdpMEVIrFJ+ix4PJJJRemrb7Oc8emQhtlTqtG0A2GykaoUnt0sqCpf++xai8pL
	 Vaj//dycuTJKFxGoOkSN++lzQ1DuHmyojjv3yU03l/j7qllHqDf3flBrV/chxFomSU
	 8ui9smLUkMGY+o3XmARs2yXX1OUNi7/Jk5y7nhe+4PmmwUfTq4gSVinNtTMsFbd/3d
	 C/BodYS96020JcdCp0oV2cwX77W7l1M4Z+j2kqEun4yHlmw/0QwESZKbXzmkB+ZIsV
	 bQmOJrHmissdqlyX/20v1x2ShuqQqvaUfjWEKaY6n8C8//xyNuawKTYh9EwxZVmHCd
	 +egpg0ZnfCJWg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4gPnF42Jx0z4xRh; Tue, 26 May 2026 19:16:40 +1000 (AEST)
Date: Tue, 26 May 2026 19:16:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: devicetree-compiler@vger.kernel.org
Cc: devicetree@vger.kernel.org
Subject: Re: DTC 1.8.0 released
Message-ID: <ahVk7cy6XnpF3xaZ@zatzit>
References: <ahVka0oWJ3RApioU@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X5TyPcbBzOzOErrT"
Content-Disposition: inline
In-Reply-To: <ahVka0oWJ3RApioU@zatzit>


--X5TyPcbBzOzOErrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 07:14:19PM +1000, David Gibson wrote:
> DTC 1.8.0
>=20
> Changes since v1.7.2 include:
>  * dtc
>    - Add informative error for stray identifiers (e.g. unexpanded macros)
>    - Better decompiling of plugins
>      - Restore labels from __symbols__ node when possible
>      - Restore phandle references from __local_fixups__ and __fixups__
>        when possible
>      - Improve type guessing when compiling to dts format
>    - Add only new data to fixup nodes instead of complete regeneration
>=20
>  * libfdt
>    - Add fdt_setprop_namelen() and fdt_setprop_namelen_string()
>    - Add fdt_get_property_namelen_w()
>    - Add fdt_find_string_len_()
>    - Introduce fdt_downgrade_version()
>    - Verify alignment of sub-blocks in dtb
>    - Handle FDT_NOP tags before FDT_END in fdt_check_full()
>    - Document most remaining functions in libfdt.h
>    - Standardise "returns:" annotation in documentation
>=20
>  * checks
>    - Warn about missing #address-cells for interrupt parents
>    - Relax avoid_unnecessary_addr_size to allow child ranges properties
>    - Fix detection of 'i2c-bus' child node
>    - Remove check for graph child addresses (redundant with schema valida=
tion)
>    - Do not check overlays for alias paths
>=20
>  * fdtdump
>    - Remove overly strict dtb version check
>=20
>  * pylibfdt
>    - Fix backwards compatibility of return values with SWIG v4.3
>    - Port python bindings to build natively via meson and meson-python
>=20
>  * Build
>    - Deprecate Makefile in favor of Meson
>    - Support building libfdt without static library
>    - Don't build test programs by default
>    - Fix -Dtools=3Dfalse build
>    - Add FreeBSD and non-GNU linker compatibility
>=20
>  * CI
>    - Add macOS build to GitHub Actions
>    - Add Cirrus CI for FreeBSD testing
>    - Add GitLab CI for Linux builds
>    - Update GitHub Actions ubuntu runner to 24.04
>    - Skip swig install for mingw32 Windows build
>=20
>  * Tests
>    - Add compatibility with uutils (Rust coreutils)
>    - Mark .so from asm output as non-executable stack (glibc-2.41 compat)
>=20
>  * General
>    - Consider drive letters when checking absolute paths on Windows
>    - Add AI contribution guidelines
>    - Assorted bugfixes and cleanups
>    - Add clang-format config
>    - Add SBOM file in CycloneDX format
>=20
> --=20
> David Gibson (he or they)	| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
> 				| around.
> http://www.ozlabs.org/~dgibson



--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--X5TyPcbBzOzOErrT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmoVZMwACgkQzQJF27ox
2GdggQ/9EiPXDXJtf6G9Ods1ssswZM6L1yCwkgiO8KmuMguJLe7UrGAU6JoPRLRC
A6AKllPuDXzOjd5z7jJ+d2w6hZSJFTNyFM59NqqSx+qB8jaSNa93dU7EwwKtIUp6
5YrC7G1FY7zP4BU26EYi7v5DAeDkBnrK/iJFtQQ00J9v+Q254BK3pcaBn0G2In80
nr3xoCjTdck6dxhNs5UfatWljbYJ99gzo6ss7SF0UFSUuE4mdM/cxfIIk5z4D/q9
9ngQDBN+4ATYylZKBw2HAdfMnBfcWiTRwHNSrpmEu1EBIKYf/nv0c8ZEXcwn2cuZ
dgIYHJyEI/Y09/AJKLAj91zM/pXc/dTvrn+i4WWnCRXHJExvPAsjsOlA2p/hIWJ/
GsXLoC4f1933T0kQ0VebvBTLhcGUpIqOrW5UO2wl7xuvk0gEmMh9rmJ1TZG0XjKF
AkIJsBsue/HKkF4goewKcxVFh5NwyoHlJEupZaM0svIMe7hoMbZu+8VWQWFahOGr
5gChSDkEGdfVQ1hkdLuDQ4MWd16IiMpfp36wD/VHJlv0ho8CRhk8eO/omGtJ4SXN
INkjiikmrGaxpzwkJJY8icxM3HWG/F6fWreiUrBZsBdHXz1PdgdchZx5w+JoXjzJ
MhKHfRTKaWNOj3a0SnUd7csYBCtg+L80mCiSKgcz3S8Q3QvmbcE=
=RHb1
-----END PGP SIGNATURE-----

--X5TyPcbBzOzOErrT--
