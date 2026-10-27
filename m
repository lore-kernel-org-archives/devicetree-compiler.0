Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067802;
	b=Y4FXKUKuOuR9zggp/jFGgEwSha/jsQ1CxxC69gglJmi8tMAMPGHUCUQJLbx3E7YxjxCo
	 qes2S+ZOaZ+HN98b5dMZz55JvWhcXvT106Swb5Ej+u31cmr6KnbyN4yxTmNMUlheOsXe6
	 1Nuk+/4r3vP9Q1mlZpK0Mty/cofiKgjoTSQeBUcdT341QDo0xmPD/wcnn9HGf8lZN/Nro
	 P/aJWh4UUj53dISnfSTFXX9xUWzymZol3l4dR80OYBU1POqynra4DKu8zpQYkj2ou4e+9
	 N1vUF7OeiXG34cTb+tSYeE2sdnVjH4o6Yaod484uyiF4kJl5TLGbj2RsdieMMGwWwnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067802;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Pwqov5MeynMww/2+rwvtohofAZtatnPSX39X/f/b4Y4=;
	b=YjpCbLshfj9Husloq0xskuGmFP7Sczj1+Ko78wPypYgn/3SYP3rn+6oRYIU1TVPqVEKG
	 hZlzpy/nEyFUkPkRnRVHnKX8p7NzYuX2Klab+9kFly5Vr6yoQiwrt5OlCI9YVdcsA2hG0
	 ousgUcttK0W2XPCqQiE0c8StHI1+YfcZvL1qv97FJVkZkivzJqEQcS/grIU5UMEKVa5A6
	 SDkeks3waNDdS0qL7TcAFkHMiglQMHVYI2cOV/0+9wQiTUQfFS9uJoFq37f3b2pH+LV1S
	 WMXTWN/EHMykDo80ZZvtomtLC3HYC9yUYpEx43ML3dDyAxqRPilPdGQpCtwDFR3z4bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=vNUaIzmH;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D483A606A31B
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 02:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D483A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=vNUaIzmH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793067797;
	bh=Pwqov5MeynMww/2+rwvtohofAZtatnPSX39X/f/b4Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vNUaIzmHrLI1TqFHjQLgK+fKmj2/tBcRv30Utg5sbfngTi3A0Eq54ZYXbOqMJ0SyA
	 0SGogQKK5arziBdkmxcFp4WMhKI3cHvRI+qonsd4w7ph/iww5sA5XvighujM1vtdG7
	 J5Ghr+8NWDIhGNb7XoQXtzF/HzslGzxMYJ3aU1CKPThrwnBvEldWrq52H/DCVtMkKa
	 EZmWwlcIWOztZtjOj23L1t++wiHqXzMvP4KBbv8iqH3FQTPamdC7WacwN+bzNnATbn
	 jf7Fwgtq2PMkQBOcEezJXugYs6IRQMdQ/qvQ3yvUS8tILT9VEvL7njZotbWwa5SHLf
	 CFQ3wQsLPEexQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jDDn13PJnz4wJp; Tue, 27 Oct 2026 13:23:17 +1100 (AEDT)
Date: Tue, 27 Oct 2026 13:21:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3] libfdt: Find a node's parent in a single pass
Message-ID: <auAKlGAXmEetRxkF@gractus.seuss>
References: <20261026095020.1760446-1-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="SOUyqGomIMGiuQ8C"
Content-Disposition: inline
In-Reply-To: <20261026095020.1760446-1-sjg@chromium.org>

--SOUyqGomIMGiuQ8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 03:50:18AM -0600, Simon Glass wrote:
> fdt_parent_offset() walks the whole tree from the root twice: once
> inside fdt_node_depth() to discover the node's depth, then again in
> fdt_supernode_atdepth_offset() to find the ancestor one level up. Both
> walks are O(nodes before the target), so a parent lookup costs twice
> what it needs to.
>=20
> This matters in U-Boot, which looks up a node's parent before
> relocation, for example to find the cell sizes for a device's address,
> and may be reading the devicetree with the caches off at that point. On
> a Firefly-RK3399, with a 564-node devicetree, the 17 lookups made before
> relocation take about 7.1ms each, 121ms in all. With this change each
> takes about 4.3ms, for a total of 73ms.
>=20
> Walk the tree once instead, remembering the most recent node seen at
> each depth. On reaching the target node its parent is the last node seen
> one level up. A node deeper than the tracked limit falls back to the
> existing code.
>=20
> The single pass needs an int per level of depth, so it costs that much
> stack. FDT_PARENT_MAX_DEPTH sets the limit when libfdt is built: 32 by
> default, which no real tree approaches, and lower where stack is tight.
> Setting it to 0 leaves the single-pass code out altogether, for callers
> who would rather have the smaller build.
>=20
> Nothing builds libfdt with FDT_PARENT_MAX_DEPTH set to 0, so the
> fallback only runs for the deep tree in the parent_offset test. Add a
> step to the Meson CI builds which leaves out the single-pass lookup and
> runs the libfdt tests, so that every parent lookup there takes the
> fallback, including those from fdt_overlay.c
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Merged, thanks!

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--SOUyqGomIMGiuQ8C
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrgCpQACgkQzQJF27ox
2Gf69g//XFohOJaFvwaWLAOMlaGerNJnd8e4Omph7BXUJRSBrUQbCXak5AIX6Tn0
UY0TaishihAEMhGtZQMCqNAvuo1NqqfE173so1yKvMHDWgaCNN2VlEEnqtYNY9Xw
kC0/kHbVtLgcjlqjGkg4GgE+uywFDNPtim80H97kkt7gTbysbUuFks/XzMWYadxG
nXU7etKZBAbN3jUjaZ02h5J0q23gvmQ4iBmzVN3hr4Rzk6qmDx3CgYLhiGnLEx/C
QCqZ5KPPpy8eGCDCQa5eu1EBanmBvqDEdJDl+oZGeKBySjB4FbZhmdP2cbSSgbFK
JXjs92Mvwl/c4ttYHjfB5zft5u3UEDTwzZMpRGigzxQBc3DIZj0Mys/BAGlf9jxA
twpHhWsioxljBEblCc/CbK7aXkBG3h1/tVQczCh3nU7y2bcDYL8L9WvRoY+WVtTH
kBeV7WvCX9X1YLgNsVGlVoeswUsDULvbOw6KtoVHhg0ct4Se2F+DoNtlLQ97VzJf
cBGRrMP4Y3Vn3LghcL/8/w3T9pJqVzxyTdjSwvp0C4w/HDvALesDYSL4SEzCgKYx
D84ZnASHhinoekM0VB+CPDmrb6cyO/dRYx7fE44JCgHUWSNVdbXSFVdHYUtaWqO8
wVzia+piyTablDv39HgHzy0Q5GXToyynKWO5Wmi/0gQm7CJg0r0=
=Rd1V
-----END PGP SIGNATURE-----

--SOUyqGomIMGiuQ8C--
