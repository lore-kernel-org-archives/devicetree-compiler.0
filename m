Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D291C8F4A;
	Thu, 15 Jan 2026 00:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768436853; cv=none; b=sNB5BrqD3aTucrZFp76w0nDsB633zAOXdMyWymCO1b1WDVOt1nBvsHmr7VKUGz/iCUZq19i2tRRM7/+F/xVVMSV+10LC0lmUzu0BK6ZSMY9JE37V6hT+2twAJLTHlmDZbe7MdXDA4ph4sZvX5oEW2onvysoLTksYn/uU6T2oUEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768436853; c=relaxed/simple;
	bh=p1EPGTEuGQmR7vfi+yXUQR2H4bxU21u5IDjFy85N1nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llbNAUhnyOu8cRxAjA+CCuLb4pSP7DFh7eSk793KzmdNJ+w9FjX3pGGaNQzvyS2CYPJQ0t9XFj5o6nNVMUjrAtQVu/bybf8nFe0CN460ycZQOa1iVwP7S2k6FTaGU0ray4Xu3iWZyBlfDra1pb5cEyJcjZaQ+3kT168c6D2SkXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=L1nvzD/R; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="L1nvzD/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768436849;
	bh=oANh57TKXBTxFP66T2o2jKU1dxCjYbkQUEG6n6MWNJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1nvzD/RpcIQa+maP2h87OCDDwrxLdLJX9jgIbuGkkVe/VRdo0hah6gBeH8ZAnaVG
	 vqX1gtB0VpPZV3iJovnV0xOMaU8TsAThG0lRDU4D/inAnTgOTCVMmDqtFTVl7bpXog
	 YoXmAG34nAFC2RJoDgMVH20Zx2QwAzbsLMbNL5EgHiasEEQZlTb6z6nWcS9uSAeAxe
	 BQpVrre5hNGCrvDKE5n2fGxup+uiSfV7R0Yd2/W1G5jRLPHuThyUlKkB27g9aLS2Mx
	 ZbX7q7rEoLl7ZFaApfcopArzwe3O4j/X6gCrVeTvcDVHFSR2Mqe/e68MNErcavIz8W
	 561bo50z0rtnQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds3hx1ByDz4wDk; Thu, 15 Jan 2026 11:27:29 +1100 (AEDT)
Date: Thu, 15 Jan 2026 11:08:50 +1100
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
Subject: Re: [RFC PATCH 00/77] Add support for dtb metadata and addon
 device-trees
Message-ID: <aWgwEmKyPY_odaxw@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0oLZuV6nVPbd3/Mm"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-1-herve.codina@bootlin.com>


--0oLZuV6nVPbd3/Mm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:18:50PM +0100, Herve Codina wrote:
> This big picture series adds support for dtb metadata and addon
> device-trees.

Oof.  So, I lobbied for (at least aspects of) this approach, I think
it's a better idea than more ad-hoc extensions to overlays.

Now I'm reaping what I sowed: reviewing 77 patches for dtc/libfdt is
going to be a real challenge - I've been struggling to find time to
review a 6 patch series for months.  Well, I guess we'll see what we
can do.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--0oLZuV6nVPbd3/Mm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloMBIACgkQzQJF27ox
2GekNQ/9FK6BaahaUWrPzGsCLWg2epgHaJMGPUjgmQntyJNCEQlCSAD/8tVWRgz1
e9/lefhQ6/OD3D+6jJOFVq0EADNeGg1RpSpGAgGTj9JFGFv4jngvCgCwyZ5E1s3r
An211mRhefg3qNi3I8H2OliHmSCRVZlTmtBE1/kw8ktooWzI+fSppRZPScu+/tac
N8doj60d6QpXKRFk8mQ/MX5xrPM0CVOhVJM87Xez3Zl7VTFWwnU2N/AoXSefM5DB
KrRO43pPTDXdziv3+c+wIPNXXC9bCfBVxHaYWxbDx0booSKa4RHD1tZakbkV8ZaO
Oja6tLptjieg+WeUbfQ7f2PAsYLL1lTdzXmYq01LSV0kxDMsulp9DY6CWAKGqru8
kQ81SgbQvLYQA/BqthXikPpaMU8oRJMmWx5Aj1E6/sm9AYEJn4wi8wWOJQyNpPBL
aEXwlDTV8a+MERCKZnq94UnduV5P6MQDahtfZuVbT9XfeWubYdXGtyFvVnRi9uQN
xbG7U/sZbUWcjzBL0F5ml6n+d2Y45Wo8aGyDNV++/hmo8mo/XYgGoPOmN+5PEsoL
MWVVl1MbaN4mwCP6Ar+YRGe3J/vRaswGQ/XRvvtS/+BLyyKZoOVaW5EpsTe3mnCV
WFW5YmBXJox3RiRuSRdY/W6W7DVoNUaGYX0mBP6ydkfDxXSt1jk=
=gumr
-----END PGP SIGNATURE-----

--0oLZuV6nVPbd3/Mm--
