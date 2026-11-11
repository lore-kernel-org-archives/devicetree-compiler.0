Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365455;
	b=cT6+jkpw9r4/NxqW0H8xJNlz308nD1d9MgF0J/FhxPXcKz1ZrUGylhsUdX9NhqWwaBT/
	 fOhMYD2LU+1QKGJ3ASwoBFCKeWf5ae1Ym/9jfyu769fqwmPbv0ygFTlveqS0Qy3GLVV+G
	 b68NNBDOEOKsjygJkq1/kvNxgI5IG+fJ09Y2n2uGCky021pxB370GuLv6D2+nXlpg+Yew
	 1wC87T7SFmT2OzY5p50Eipi3WiGPWJekpeM5zaD3kGweUWz/1qalubO4DkH8ix5jmRWd8
	 70BVzCHDumiVEQkbD2rAy7TDmKdvnTGb+KOEYN4iRss2PQeiouYZIhA+YpILbgNlEMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365455;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=KfJcD1xmEPHruC5deduyMk/FH2MTaokXbAfWNIvN+To=;
	b=d1T68iGxTrjR8kfbuGk5KJH1A0+4K6VIQ1qvHH8uj9flWcraNPNqrRpF93ykNVIhhYpJ
	 REZjsSkY7OipLYVK7KZ3tM4Xz3nX6LZ4e/Iz8l7oIO2z6KkM/dNVqmaUgDYwbzBLXN029
	 FmhG8ju/uugnmn9lafqh6Kn0c5RmUEr6yNuHzIGzgoko9nudbpBbFyF9NhN0vSNeaIoXa
	 h9joBhB4JeaQWqFR2O90sOn7GVy4z/NnYsJNEjWsroOGLFrdTVD/LeFHqKPPifhEOSvpB
	 UNFRmZftzsyO/f2+zUupTKYjf/oUqyWyW+qBr30ag2/WA7tuFuLNz5YClQyaGPueIzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="L35/zYiO";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA5C606A31C
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Nov 2026 02:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA5C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=L35/zYiO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794365445;
	bh=KfJcD1xmEPHruC5deduyMk/FH2MTaokXbAfWNIvN+To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L35/zYiO9GCAbxP4GauTPtYoDZBuIZBwS3Wlhw/Kw96Ed9Gbsc8+WbUES1PRaoG98
	 28tq+padHJttn1MWjS5XaT1DxVaj6EXDk7S5USEdCLFPHqkF00JCenf1vS11GUetsu
	 X81bmmVVaug2/cgs6+/iMb/WLdhAWcfMfvzOKvAMoJ7HSlh/WzmIwnEfVPPIWe6+WG
	 y/5UJBoaVm/idZPtPGY5rTCwBUaCqEJLXY0fd+wxbZWhhvOx6TIsuDcfoJMexXNOVk
	 ABl1skbIbSsV6nNg+/l/I6HnjJ4LigRy3+4oiv8RxD5SVT2kL4vHtCSjzAWMYHULIe
	 Rq4trwTsOg3pw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jPSgn06hrz4w9T; Wed, 11 Nov 2026 13:50:45 +1100 (AEDT)
Date: Wed, 11 Nov 2026 13:50:39 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v3] libfdt: Fix fdt_get_path() reading before the start
 of the buffer
Message-ID: <avPX_jg75lrkBMwN@gractus.seuss>
References: <20261105180439.955822-1-ayan.kumar.halder@amd.com>
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
	protocol="application/pgp-signature"; boundary="CpEYL1uNi7LSClD2"
Content-Disposition: inline
In-Reply-To: <20261105180439.955822-1-ayan.kumar.halder@amd.com>

--CpEYL1uNi7LSClD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2026 at 06:04:39PM +0000, Ayan Kumar Halder wrote:
61;8401;1c> Asking fdt_get_path() for an offset past the root node's FDT_EN=
D_NODE
> tag makes it read before the start of the caller's buffer. Such an
> offset is not a node offset, so fdt_get_path() should return
> -FDT_ERR_BADOFFSET.
>=20
> fdt_get_path() trims a component off the buffer for each level the walk
> comes back up, comparing the components it has against the depth from
> fdt_next_node(). On leaving the root node, fdt_next_node() takes the
> depth negative and returns the offset just past that tag rather than an
> error, as commit ce4d9c0f ("libfdt: Rework fdt_next_node()") intended so
> that fdt_node_end_offset_() can find where a node ends. The loop only
> tests the offset, so it runs once more and tries to trim a component
> that is not there, scanning back past the start of the buffer.
>=20
> Stop the walk once the depth goes negative, as
> fdt_subnode_offset_namelen() and fdt_node_end_offset_() already do, and
> reject the offset up front with fdt_check_node_offset_() where input is
> not assumed valid. Add a bad-offset case to tests/get_path.c; run it
> under valgrind (tests/run_tests.sh -m) to catch the read.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Merged, thanks.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--CpEYL1uNi7LSClD2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrz1/4ACgkQzQJF27ox
2GdwhA/7Bg2lzyZ0PBIatUA+kRKPWkuk5Nkt4wIWcBRJuNy9JNArsq6oel4jNB+u
Y8c9+1wt84Jv+Wcge7TeohHEQIpm71fgTlvNeQSDK/t1WudPArkWJTFK/tK0JQd5
oEivROz8IeMPW2ETfxatoD4syUBWJ+TO9AhYcfYwboDl0HKh7typ55PB6OvaHIu1
Z1NQnqlz6MekOFOEC8lGt/aJyziTvg2d9nAm2EeYWTLtt1CjrH4j6o2Nr9qgzJJU
8ZdX8jQEGEteeWPOC6pvB/bGDwkSVzuj2LsaQVtnZ6d49NQfHZ/z0u8PnZGCmV3D
HH0LGBoN4g2FMdyCOAcdi5llqwEWrIQNogMsiW9cFlZOFsnlvVBiLjX3FCdU/4Dv
EQ7FMu6rNXFQ6QV4KZ6bCKpATz8olJKrTXbIRYraojwlbUyFcCFmvC9Z4mumpZ/I
7WgT4HCvv4T1iuT/SgMzq1DrR+g/gE/mjUH8OylV42xfesrFyUIBMdrkWjB6zOxo
1AR7LPI0h3OY0yt1fMpDWzet7C9dDZ++ozsPV/ArtjjRSQoF3B9SDpbakADZUvsh
/N0qvmPTJGsXNxkCEby6/7GyrxTgDuVE9a7G48e76F2rzcrbfBTb2f9XTvabNw50
mKNuX2e2WKZzunmmJwD4qO6un/MR+5Od34Hh90fqK0F51sAQuJ0=
=BMGg
-----END PGP SIGNATURE-----

--CpEYL1uNi7LSClD2--
