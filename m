Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066708;
	b=YQe/m2EauxW/cIaijXDj8cDQg9HIMOXbT4+t9R5KC/inzB3A1PzzamkSQ6vDtySOpIQo
	 XWs5zlvXMYpd+l8TA5rhcWrCYij1CD98bqDEDU23kIewH6f+c6GRtAS8R1rS8zH5gQ2vD
	 qkNjAOeI1jdlkVTSDp7qY+Ht0oYflbdc0cocaels6CYMtshLQ1317+iSAEcAGK0Om71AS
	 JbfQVO8L3fO3UtYCWhhK8coHW9+D8d0exSXsjs5m1JsJSsRb2ulPQe7iqoCa8hBTLQbJh
	 Q+7QRTkuAD8yDntVmR9s+wp1j8xcqoi+2bA5H0gYfpSbA9wHAg1APWioHiFxFXWjwog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066708;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ghc+UuFr7KATLDGFNLX/gYrfjZ7riCLFJn+9t38npuI=;
	b=c8B9XblMBscPdIWMXcESvOK2ok/lELnjlNKFzcIeeh7GFN9m28a1s5aNfJyXwJ7ZadTS
	 EtxCa+gFe5PKngAEa61d0QK7oge9JfPsCunap0274CdQL1KtNVv5rJxSpYIP1Zg6tih1I
	 44+10KSeLBc43U4M6hgmIQc4rpcpIrhLoS0dXKiXQvaef8MIlU4Tcf1jbb938Vm4sJT5N
	 4yuIikAxgkayzDy10JtO/LopmIEW0BCLewrXztDdHLVpcRrR9zGDsWkvO9ednjCR30KAF
	 y0L/EolQHYm0q0ZypZHGMmqxwOG1UTl8AI2hzUBy3BheKnzY4Qm/tDmprfUp4Ic7Udw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=CvyKYJI9;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9D606B400;
	Thu, 19 Nov 2026 05:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B9D606B400
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=CvyKYJI9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795066699;
	bh=ghc+UuFr7KATLDGFNLX/gYrfjZ7riCLFJn+9t38npuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CvyKYJI99wg/8GtiSouJEpyP5nzwKxfb9eaJqaubukMLsRtoaREJG4FGmALvYkoKd
	 daPnFf/IJ0PNujvVRtVXVTcVVRRklaQqPRQyK92izGqjXbjf8PcxCJEvIr4w5GCXP2
	 s6Fzp1VUwUm+cAxESyLca4ASYLpoa7di/NWtQoE5ucVGOCERvCeaCuzBNlV3vDH/CQ
	 G/hQl+ncF6jYc05EDt75WdOaFSNaUb0VKTg5bvV+j8qgE6XNGdCPINgG+UNbbx2nES
	 xK9qLw3Qv8KOlFucpgaEO3AyriFnNdmXQRLOMpFV8v07Rb++j6aFR0AgPT0Z2PKk9V
	 w91t+XPx4WLNA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jVS1R0P9Dz4wT1; Thu, 19 Nov 2026 16:38:19 +1100 (AEDT)
Date: Thu, 19 Nov 2026 16:29:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: David Laight <david.laight.linux@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
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
Message-ID: <av6JN1-T8t_TRN_N@gractus.seuss>
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org>
 <20261118095418.51d30ee8@pumpkin>
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
	protocol="application/pgp-signature"; boundary="BWelGwrox45cy1D9"
Content-Disposition: inline
In-Reply-To: <20261118095418.51d30ee8@pumpkin>

--BWelGwrox45cy1D9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 09:54:18AM +0000, David Laight wrote:
> On Mon, 16 Nov 2026 12:53:05 -0800
> Douglas Anderson <dianders@chromium.org> wrote:
>=20
> > `fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
> > across the string table (`for (p =3D strtab; p <=3D last; p++)`). When
> > building or modifying trees with large string tables (such as DTBs and
> > overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
> > `fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
> > byte dominates serialization time.
>=20
> Are those symbols just in a linear list with embedded '\0' ?
> That doesn't scale well at all :-)

It's not supposed to scale, it's supposed to be simple.  Device trees
just aren't that large.

> > Advance `p` between candidate first-byte matches using `memchr()` (with
> > an explicit `slen =3D=3D 0` check for empty property names and a `tabsi=
ze <
> > slen + 1` bounds check before computing `last`), preserving identical
> > suffix-sharing behavior.
>=20
> Might it be better to scan for the '\0' that terminated/separates the str=
ings?
> Then you do one memcmp() for each string/symbol rather than for each time
> the first character appears in any string.

Doesn't work; as Doug says, suffix sharing is supported.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--BWelGwrox45cy1D9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr+iTcACgkQzQJF27ox
2GcvdhAAhuVsXGLFv2w25gbBnzlo5nFqH3cwU6zVc2jLRZGjeFETiXxz1SiX9UXk
bc2OQfi+CldEBaWMvhgiXtbq4aOMQN/9+BAQC6EVAKB1GMwXvNw8SJI4oLeS+LWd
b7pdlNO21oDUg17pr9KodlBCKya4oNJ1ya+47bOYS+6kBAmfv6+RYZV77PD6W+cG
4giZajNIPfHghfPtgq4Y4XObfjeLjDw49Uh3W0iBeY+wH90D9HggoaTMMhmAaf6d
UtReMGJjKWo9rtdYPI2Fnub/endGB4k2YZkFhhEWKxaCDhponQY/PgwfoCrwsEYb
CRnkvHuAyXYlw6bypxhSWfpXOx/G7WoG9SQF5u38GiGKZ0kWvzLjQLe22jF76KbS
ELFQnjXGTN30qZ508wDutmrD0ykDbDlh0pMIkGf3xrLFXwHwmRpdhqVLKRa4iG/j
K0c7Ul/1zbHAHpRaAefWeSehX4hj4R1GI1KG384Z4URaFa932Qz4O8OEzILzTBYv
7p+o42RwYqUxe2SANExBR6KHnkoPneG2ScPTjmzrlbRWxYWBiH4QDeerLf8ewTEp
Bm4bXheWBst7A/KhHjnNMtHQEPN7WcjRgG/12q3RBLx6LDPaEhepHtSwvf0Vxr+R
8rrA5If4vS4MfdW31TzDfZExHiBEWGa29g3YvGQTovi2rgjvFWA=
=r8iX
-----END PGP SIGNATURE-----

--BWelGwrox45cy1D9--
