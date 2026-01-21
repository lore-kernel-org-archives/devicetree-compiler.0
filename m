Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4593D349B;
	Wed, 21 Jan 2026 04:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768970646; cv=none; b=hJRe7qiGQhlfyHoWXT5kQMpv2oLAravilnGAS0mRx6VdykoKCfGi2aHwirLxHSFHZe0PXC4ZMzxRWijzVw+PBtAFBTXVaEfcRUJ05WX3AzGFdLKpmgm2P8WyJfvrY4SJqnOqCcEcWNTT+8+n2xzp+2LrwngpCfBprT5w6FuJIjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768970646; c=relaxed/simple;
	bh=vmFU8XHjUILi92lfTDqAYfiGIVyhEpodVoVizjNipiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGUAMzxJlZZwH3W9C+wsMnJxYTQHIXiK+B8Jcn0DCXvCTwYVrFQJVgOremgp0i9g+4jJMAFOpJAw9S3XggP9Eg7uHb3BTswG2qDOt6N2oEOed2kZQ35fg871iKjhYiQYXjFBdU4GgpgR4Z3iKIOnejXUyZnSTcg/SzjnP26+Mg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=mIO6+5lt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="mIO6+5lt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768970636;
	bh=4UB/4j16fqtuACzSYwiOI2E+047A9SorvVqUgCveJbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mIO6+5ltoc9PWqb81t62UDquVJSQ2yCJAc8VIL5i2QJ78ycBPTMrpq6wiVk5qx9e1
	 1O5nWyDd1/xJEnTPHiY0dG4g2k5y/bffzWGU7Jh25xfb1H+pu1LUl8doW4SAefbcvs
	 t8ZWZGQud7O308bHuSVUgkvb3m8BAlLlOiY4MalgEFHpBG5ajflnT6ef1AMdJMvnKQ
	 4Rj+mRzI2Qo6m3Pjz6DkH2EoPYiu8TLkte5nir2HKtvqTD2uqIOEsm30cDAGo/vZ/3
	 Az2c88Lq1EUcNisbDQgqu87OU/qKMQYEC7H75QrGSReg4J46V34jYLfiHD8qbcjPyD
	 sRv6nvZ7r1VMg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dws646YmLz4w2D; Wed, 21 Jan 2026 15:43:56 +1100 (AEDT)
Date: Wed, 21 Jan 2026 13:37:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 32/77] dtc-parser: Introduce last_header_flags
Message-ID: <aXA8AOuucE5JdJCW@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-33-herve.codina@bootlin.com>
 <aWiJvEEgjl44h6vd@zatzit>
 <20260119151145.2f67139e@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nURbXyNkcTJCgOkG"
Content-Disposition: inline
In-Reply-To: <20260119151145.2f67139e@bootlin.com>


--nURbXyNkcTJCgOkG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 03:11:45PM +0100, Herve Codina wrote:
> On Thu, 15 Jan 2026 17:31:24 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:19:22PM +0100, Herve Codina wrote:
> > > The parser needs to get header flags value in different places.
> > >=20
> > > It relies on the fact that the rule used to parse the dts file is alw=
ays
> > >   headers memreserves devicetree
> > >=20
> > > With that only rule to parse the file, it uses '$<flags>-1' construct=
 to
> > > get the flags value.
> > >=20
> > > With the future introduction of import symbols parsing, this rule will
> > > change and the parser couldn't rely anymore on '$<flags>-1' to get fl=
ags
> > > value. Indeed, import symbols parsing will add a new optional symbol =
in
> > > this rule leading to two possible rules (with and without the new
> > > symbol) to parse the source file.
> > >=20
> > > Introduce the last_header_flags variable to explicitly keep track of
> > > flags while also being agnostic of the rule structure and use this new
> > > variable instead of '$<flags>-1'. =20
> >=20
> > I'm not sure this approach is safe: I'm not sure bison guarantees that
> > semantic rules will always be executed in the same order, so using
> > global variables is risky.
>=20
> if rules were not executed in the same order '$<flags>-1' construct would
> not work.

Uhh.. I'm pretty sure $<flags>-1 only depends on the parse tree
structure, not the order in which the actual semantic rule code
fragments run.

> The problem is not the order. I don't think the order will change. The
> problem is related to the number of items on stack.
>=20
> With import symbols, that the stack will be:
>   header memreserved devicetree
> or
>   header memreserved importsyms devicetree
>=20
> Using '$-1' will no more be possible. Indeed, '$-1' from the devicetree
> rule will reference 'header' in one case and 'memreserved' in the other
> case.
>=20
> Without a global variable, I don't know how to reference 'header' (or fla=
gs
> value) in all cases.
>=20
> Any better ideas are welcome.

Ok, I'll try to look into it and see what I can come up with.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--nURbXyNkcTJCgOkG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlwO/AACgkQzQJF27ox
2Gf4zA//ecAeKaXiIbLxczvbxzNwZeSNtvGNo8SZeo5/LDe+8qNrYwaRVmJKqQHD
LFbL+RLBjdkIgEajYvPSgEGqQ7pkYmy034t53HogY2H5n2oqw0Y7neiyQ0brdIry
nHde0wqi1NBH1iZmImGeEG0Sul17WEBmgFLZWjsyf7uE8AiiegNh6DDH3HY5YBno
cTwoMgAcjwcb1WUcez2fcRl34RKz2yahC2tPvwE4fXwbuFATbqJRTQ5eEbYKO55h
vzb575T9YvH3u2NThVxVcmzvuhwOd6CHTi0oyM+gHCDzVK8ZWx89vvgNipaaCSeG
/a+s7RGOzvMfJvx0fhH6xZ2vwRsOtHej++w5/EBxunSlMXHUt+1MYRnHaYRD12OS
m5n2Xx1uLN6IVoTmlATxABiqCacfKGPtOVYoGd1KoiXMu1ZN+L7ELWNkbRGem4c/
NjNDLLBOguRKX0RDVeviVjYbR24dMn8/Ug6ZOzlvf4SpYCxOJTFlEao28sQUrUbi
3iol12958J5GO8Lu0egRJdq/ztzRCS2DeOyhvHDO+6mspm/OQTw1ex9YXDD8nrL9
uYKBHxq+X2an4SJEVfSQmH55Px5/S/peQxCzS31xdMi1N07Yfn6Be4z1mYJRCbdE
kMDsLDDh1AHO00AKaM6SYxCvhnaD8sHvx0NRgGqQ9WM30KyoGhU=
=VXLW
-----END PGP SIGNATURE-----

--nURbXyNkcTJCgOkG--
