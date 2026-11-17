Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888472;
	b=uH+oSR7eSLwqFijQjgrbvfXtIVD5uUW434+ZHKkoLP4mBKs2/eaPq0Tm+Ibg+8UjpLen
	 0jonOmbgcUj0o0yYBNjCBVPiLQkeanSbVc2Bjybf9PYQtb42VjbQ9vFlBy7SV1Nnt6gST
	 EbTzd9+TEc1G0UdTKCPPKiMPPLc3/a3LT/0kcG85Ix66zeCxY445eCnp/1ycVaEplZOnH
	 wcVez2QmcGT/yG/wy7XBSsh65A8HCYDyNbjMJ3O5RPI8atUXsGIEdJvPMlkB+W8DwDHRk
	 K5q3f5Kz2FxmQgzfbcdRfSNkVSoWt+oDlFlzfopCMaFxf415CSd0wgH2z3X6cK3GbNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888472;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=vazntSqnmHMdNlbcyg8Tr4Nzw6bRT2l3Puo42bhlvGI=;
	b=tYecGR+xLqxA8uH6pKaSnNMIT7q9V2Xp2efBj6TJYWLA8tX9fUwtgB8vSHH0Zsg5WQXq
	 u5JrqiEuyYRLQ4w5iYu4DY9n9zWJCKD0wFoEoC+APXwPDT4FwSG/LZKRaFojinxMdJFoo
	 Qvbdj51p2QnE23mx/SesqJ65lt1XeJZisxCowiH9zuKnjDfvqT2tYY05FBqeRVC8RDix5
	 R0dYXOaQXqIESuK1cf3ZloGjPw2K8s/mgkgp2Vkr04yylc1PPhdkpLgSi2bZiCyF23PHI
	 v+6FUB3sOcPIGFK7u2HlKDGTJkEP1Bd99z8qi/yzdSgJxpPDkO/5wnmSDBLbGmsKs8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=VXdXWsdr;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A502F606A8A3;
	Tue, 17 Nov 2026 04:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A502F606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=VXdXWsdr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794888468;
	bh=vazntSqnmHMdNlbcyg8Tr4Nzw6bRT2l3Puo42bhlvGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXdXWsdrqLTVaaxEUwgcYTPd+UgQvnBmt6a6nFyOC48XNHWvfJ6j/Sk3CDaFPEFra
	 8Vq3UUrYuPK4FnxMU1hXJjjJ2izX87eumRdq7EYnLL1OYHx4s4ybMe0FzbwrhHc8uB
	 k1YBASllLacyd905ECMp1wOaE5uG78uz64mkDOuQxp6PiAcv3aA6apvqUfmVWdEvQL
	 cHesPN0CdJHxsQLHEYiSKQBwVFsXBOuhcTv0f6WFQH+wPGzUR1jVchCY+1O204T7Q2
	 z5gE6CSg2GD0hwz80obR0hgw8do10NlqvyPbglljy06j100cM60GJNoLrTUtEHUvRD
	 0Lzm0+HspRDPw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jTB5w4f91z4wT7; Tue, 17 Nov 2026 15:07:48 +1100 (AEDT)
Date: Tue, 17 Nov 2026 15:07:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with
 memchr()
Message-ID: <avvTEIZQZwra3Zra@gractus.seuss>
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org>
 <avvRY-nTstFbvTpF@gractus.seuss>
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
	protocol="application/pgp-signature"; boundary="cXum1XM0T00KBhSS"
Content-Disposition: inline
In-Reply-To: <avvRY-nTstFbvTpF@gractus.seuss>

--cXum1XM0T00KBhSS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 03:00:36PM +1100, David Gibson wrote:
> On Mon, Nov 16, 2026 at 12:53:05PM -0800, Douglas Anderson wrote:
> > `fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
> > across the string table (`for (p =3D strtab; p <=3D last; p++)`). When
> > building or modifying trees with large string tables (such as DTBs and
> > overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
> > `fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
> > byte dominates serialization time.
> >=20
> > Advance `p` between candidate first-byte matches using `memchr()` (with
> > an explicit `slen =3D=3D 0` check for empty property names and a `tabsi=
ze <
> > slen + 1` bounds check before computing `last`), preserving identical
> > suffix-sharing behavior.
> >=20
> > On one stress test (running the fdtfactor tool across 438 arm64 Qualcomm
> > DTBs) this reduced `fdt_property()` time by ~5.6x.
>=20
> What we really want is memmem(), which would presumably have a similar
> optimization (and likely more) built in.  However, we avoid that to
> make this easier to environments which lack it.
>=20
> Complexity isn't too great, so this looks reasonable to me

Hmm... actually, thinking about this again, I'm kind of baffled that
the speedup is so large.  In the old version, if p is at a character
that doesn't match the start of the string we're looking for, memcmp()
should return almost immediately (after a single byte comparison), so
I'd expect both versions to be - roughly speaking - a single scan
through each byte of the strings block.  At least with gcc builtin and
inlined mem*() implementations, I'd expect the performance difference
to be pretty modest between that and the new version.

What was the environment (host CPU, libc, compiler options) you used
for the benchmark?

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--cXum1XM0T00KBhSS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr70xAACgkQzQJF27ox
2Gc1VQ/+L2RgHkvbtZddBfGHshJn92Djad6o307+u2sikqFrETPgzchH2WfO5at3
U+cFWUXG/pIwSmJtUzmTVwXcNEdPEthFgKStrTii6z0a4qKFhRsNVgsSmM6k/Xol
e1Xv+Ux141/23u3leO7ngzORmoRZhTWevH5931Aw7OUnP/DCdmniM6k8MO5NQFrU
+Ize6rGRw2appWwP5Na2/EutbgUjNvRA2zCDInR3jg0gpjyBwm3/sl2nNdz6V2GB
hHVwAZFhWnsepr8As+YItWFlaTVUUaBeRpSLtWOt2SXNEZaQRmrRbF6XxDios32Y
ynxJyAPwwSeq7J7Yhu+2T26MRU0k8FKtu8PSEQSIqskocAtT4DWLiwRed5iCAMr1
lZxNO8BaU2gz2RzGd1RYO+LpDTX71xKoubgmeqhpflWAZsmd7G4E3s+QNYljSIcO
VAJP73HcbKLd1CKmCEZKpgdolQniq1Zx+B2nTMVA6si7XK0FlEIqtwN+UPCM1qyZ
kUtX9+FK9K8GiHU0j0AhODsITwJqMLZQbgwuWD8warurDq2WJZ0+QJXBnvZ+/Ygq
8Ucer0Y4h1cPJYhtsSsogwQtviTRLC8HqQ4Bdve6WvZpaoRkOlXg+7USsdMIUrT9
n6bP83p1az7dxGLNbvyODf/r1rREkjv0LvHNWe3lDn7BoLROTJg=
=LrBC
-----END PGP SIGNATURE-----

--cXum1XM0T00KBhSS--
