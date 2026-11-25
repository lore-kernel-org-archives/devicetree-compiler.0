Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598524;
	b=sM1odYEY/kxwK607JJOkcpIuI/ZjFT8kRyHdWteKmCoZSTEb+TnDISHJxVhm6viOidHP
	 d/649ZHHp64du64aYRB6+B+5EoXX+3UvcGvcjllMHuFHw/6tc76XhjoVzk4kGh/KWeKQh
	 HOM9MaM+m0ER8gstNHjWVpBwFYo7Dpv/0ukB4wZ7hsHVO+dQfYzQz5SQ1bzijiA43mVuW
	 WeMaQ44Ex0SICTR2aSy1OqNFHsJ+raVe7soy4+aZ6NlNJYxB8Gcb1A09eM1K0JsURq6dV
	 xeOxmaMJr2ElSgyxWMoIFHJB7ROXSEV096Y0EV4tVRVqjAfky0zlVRVuam1ghA6Dkiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598524;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=KZr09DVgzsS9U2lQ1ifuDPDujMdvWXmaam9D0xrQu6c=;
	b=YGRAVr4aaRq0Sua1OdAFIN0NgORMyT7pjrID/oHxFi+9OrxyTlpQC2y/tOxCxuF4DfEO
	 uIX+FKozTw1yn5Iw5OfX4GHh23pQoYsTAHoaI3UCfaiWSC07ok87dJJrDm0chNUto0DBr
	 sFN+3BwAIG5bzGHfLdTB+BSnEZAODKW9CLTMODgeRPaxZsUNBFRRIBCT9jtUS2dwbF/WJ
	 c7Bwt1GOfygUMR5P3PlLtCvfNVw7JuUwV+XCoT0mftVDIUFgNwFYkYDOcM6J4rRgHYxLt
	 PBXgBU47RXr11+jmKW9Lua71WZFGK0BkZuFEghFmM0xEy4/AOufRNUm3odRE+SmrOZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=bvVVoqBF;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8267606A68D;
	Wed, 25 Nov 2026 09:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8267606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=bvVVoqBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795598520;
	bh=KZr09DVgzsS9U2lQ1ifuDPDujMdvWXmaam9D0xrQu6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvVVoqBFztiePRmuD/Q9cTcb0wWGHgG2j588b7mLjdp512xo88qT8Cxt+lf8OtKVh
	 2tg+AvRdkHjYzcR0lXb3aZkr9b5uPEWnl2eCQ17GUGcMbbtoBMUNs8ZSYFk/ZIoeb5
	 KST70TgmwRo7j9W8WgFxoZqhsADQ4maEsjHj4yumy1DFY1DwePRW+5NgRU5VNnO4NO
	 GhipFwUL2bgIK4pSfL0NYWXlIP3E6u8gbIZhf7mJitibmVbx6SMsrQpV1o3QGU/vWY
	 m0ugfCuN1GEdKIyIVo7cOF5dE99/XhQewoc9AvZwOYKxg8qGCEacumeIhxRk7VeaBc
	 xOKwBDmvwgOyA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZDhm5ggZz4wLT; Wed, 25 Nov 2026 20:22:00 +1100 (AEDT)
Date: Wed, 25 Nov 2026 20:16:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 13/74] Add support for /addon/ keyword
Message-ID: <awanS_Wx4iRBw7-i@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-14-herve.codina@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="JldxE5qn1ka6YP1T"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-14-herve.codina@bootlin.com>

--JldxE5qn1ka6YP1T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:42AM +0200, Herve Codina wrote:
> The dts /addon/ keyword allows to mark a dts as an addon dts.
>=20
> This is similar to /plugin/ used for overlay dts but specific to addon
> dts.
>=20
> It is also worth noting that a dts tagged with /addon/ will lead to a
> dtb with the dt_flags set to FDT_FLAG_ADDON (0x1).
>=20
> This allows to identify without any ambiguity an addon dts and an addon
> dtb.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

I've hinted at this elswhere, but from this point, it gets pretty hard
to review the series without having a better overall picture of where
we're aiming - what the addon syntax looks like, what the encoding in
the dtb is and the semantics of each.

I'll skim the rest of the series looking for any futher patches which
make sense independently, but in general I'm not going to review the
rest of this spin.  I'll reexamine in the next version, which I'm
hoping will come with some better documentation of the overall
feature.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--JldxE5qn1ka6YP1T
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGp0sACgkQzQJF27ox
2Gc4qxAAk0237DS1aQK32pqIq1ajeudNv75q+7DoP0JXTBnMSwWZ93shGuHmaPju
UhgrJZMIlqxjs7t6Uk301RW+DmD3/8ceBQwgPhuzjKBy3G3KGaOHMRNxp0ioLsfs
gDQ4kZENQXMDTSspePHtBufAzmuMKmuUSb16Qwbyb2SFsPAUQ9I0iiqCchWLj7PG
75k4T0riavYNZKYJsV8OCozY+dielRnlaxZEDaGMHha88O59i4SwL6vyvyZK6rBJ
acIM80v3MSA2urSkLNi7Bavr7ewaap/K0LkaI79ND2vWU2uPk5gZqNUDpsFi6cQS
5R4eJlG9cWibQn4L9DoAXVSNHC0D+JZwZg+fnHYsR/E78ZSZDlPgpLlDgbNgrpyd
weY/XeeWeZkq6kUtF3D1D7tByDA1ajFoB7T4prwY0golKg8SJQkrzUrdZcTtusQN
sPc4/pDQ41IwfcZTq5rFtbaEBpwVtv3ILdEDVh6LTjRRvdx/fzpsSLAK8u5Cyjoo
htIPinZixGDrT7Zy1kH2ED5jiAhrNdSloOEe+9x0aIrq1pkhkE1Qk5dmITHKqbpV
ESE1hpcO1deOPs7/nRWbvS+5LxGQdj0OaCzynDszaXDRyMTICYDWzl0gIV3bPaTM
QN7x+OdvuYFBHx8YYGt+v8ACyJfziF3xtqItJVpuSMp+ZmV6aiM=
=PsXd
-----END PGP SIGNATURE-----

--JldxE5qn1ka6YP1T--
