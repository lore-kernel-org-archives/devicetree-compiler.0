Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886240855
	for <devicetree-compiler@vger.kernel.org>; Mon, 23 Sep 2024 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727080859; cv=none; b=MUf0eIJDMgRS3lqGA4PZV9VK3rNki/OQyOe0UKWbSd0KdQxTBjl3DbVupU6ZC8RJQ0azDVlkgjD3KboDmMBVJxxewbovqJUPMN1urWpqI6vZJbDTBpEMP74k3pApkENWsvmWoJjcu2PmIuNfEtfxMZyP2nrQSmslVDJ7XvxXbxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727080859; c=relaxed/simple;
	bh=JVqYXcFCHdbl7E/alWryqdTZxRF3qSCqzBb9lEWsAjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYzbt+7w37j/LQeyPnXbz4HbD667+V4RmTYvcCXgOc0hRNhLhJyBXO6JUJXw+HmqbMM2E4R/FNzzTBHmTq/FCcNGYpbD3bHZ7RSROMpeArgX7gUEGd4Ht9xYlyema1e3z9XLlZoye/yAua9NXPRFuStmSh1/NotxNBOUHNduirM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=olh4eao0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="olh4eao0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1727080852;
	bh=vZgWeZU8TT0iJYoYa/dZ/MSfa2GjARJwSHWyIXEgrCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olh4eao0QlmpU3LILcONt4BvuX9VUOiMaWDkdPzIQGvW663iDQX8Y7prS9/IJhUsC
	 iylqR9lUZDAPAlhdVPqBhdWfHuLFljtHezkr2EcvW10gwadvyj/joYRqjgNh+P1Sy2
	 U0aPJIGLC6n8c3YTrdqADOqiAKnYB347yPzham2WJzKcFF4I7DIuBtSR5okXxSirh9
	 kv8HU5l5FtUXKGGURnkn6XoI68u9ueu/XOQBZD0qY6PaK7iKmCZNJnMl6YIiWB4je5
	 tb573MmPBBHjhtf+OrkSQhK9Hnyw+EggRRnyFE//92XMd/8f1Uq7X8iXZTk9Wc2f/Z
	 QmqLnSkvZzZDw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XBxKJ24BJz4wcr; Mon, 23 Sep 2024 18:40:52 +1000 (AEST)
Date: Mon, 23 Sep 2024 18:38:52 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ayush Singh <ayush@beagleboard.org>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>, Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Message-ID: <ZvEpHCeKDi_8XGcz@zatzit.fritz.box>
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
 <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
 <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
 <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box>
 <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
 <Zuo8yWrRPGcqnEwN@zatzit.fritz.box>
 <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>
 <ZvDjW7W1096FW8XL@zatzit.fritz.box>
 <CAMuHMdXG32pj=nO9iGTD69QSLY7p9BoASqnMi87LBmBuQg0GAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g7wkgxKoeI3dqvie"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXG32pj=nO9iGTD69QSLY7p9BoASqnMi87LBmBuQg0GAA@mail.gmail.com>


--g7wkgxKoeI3dqvie
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 10:22:03AM +0200, Geert Uytterhoeven wrote:
> Hi David,
>=20
> On Mon, Sep 23, 2024 at 5:41=E2=80=AFAM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> > So, essentially you're just adding new labels as aliases to existing
> > labels?
> >
> > Ok, I can see at least two ways of doing that which I think are a more
> > natural fit than allowing symbols to be phandles.
>=20
> [...]
>=20
> > # Method 2: /aliases
>=20
> Does the (Linux) DT overlay code support updating aliases?
> Last time I needed that (almost a decade ago), it did not.

Huh.  I hadn't realised the kernel kept a separate cache of aliases
that wasn't updated.  Assuming that's still the case, that would
complicate matters a bit.

> "[PATCH/RFC 0/3] of/overlay: Update aliases when added or removed"[1]
> was never applied, due to me never getting to all of the requested change=
s.
>=20
> [1] https://lore.kernel.org/all/1435675876-2159-1-git-send-email-geert+re=
nesas@glider.be/
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--g7wkgxKoeI3dqvie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbxKRsACgkQzQJF27ox
2GcUEA//Rt2/jXJTpdOFXHxKMttwiWMQvr1XQXvjObA1m+81NCDMCwi73MwOvwo6
asYIMnY31a9+yEeKy8OT17zrWCiejUg6w4bVClkPNtOH0yITTxqnQUrZEPF3E5cM
KxKN1R7G07NR5OVBPXgnzf4P/QRuxdeNWtIthD6h9i1y3CfCeytFp/rPz+ww8LNO
R/bL7Py+4Ah6pR2OyqWqq8uQvkBRDZXmOa/jrX7LLsE/axTX+nAn5Iu9yKWm6Ou+
TvrbZn9wWt5AyhxUR1K7WbOJtZhpwDrJqMyjDP99zlaA4x+tmzgnVXHon9yGKJb1
gbogDksQ3/Ex+U9I9O/xI6x1FlX8nehxPmkR/vNyNhWdtIiW8f+RcEqTHW/+VvLU
fDCfQtBYU8x7XouwwiatUFVQtqcFRQRD7MEinrBk00OzPiAiiGpTiwW1DJlMoBrx
QvJZfGEzkcvjlp++mCse6Qydvt85sWpgmfAwd3+F2bWZXNcQGRTJim2jESfYf37n
sHFPa8Y1aLZduVlQOWVmh5xCxKs6Str2MLyyu++U6UaNXDizYRg5XHXAb/diR0uY
j7nragtSzcrcDbqpAunLafCqOGx/rwnVKu408dyUZUKLgxaWIHE8edA6qhQUH+kW
kkJJ642/YWxnZcYROVggn0CT4B8efLns34ppB4ArJgJsuKV58Ns=
=2XKi
-----END PGP SIGNATURE-----

--g7wkgxKoeI3dqvie--
