Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F5928FD
	for <devicetree-compiler@vger.kernel.org>; Fri,  3 Oct 2025 06:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759472970; cv=none; b=bNHLpqEWDF2fBWB7Ra05FquJhZlLmSbHCFtyN5dYtYpa0Srj3i1NO1zVyaGLZeLdSikjv3oIWx2LDxqDZ6MzA2g7fBC3l0TQu8v5IojTdpDo91Pnl0VX35BrxQTu58myiAkgdTsRYKdnWwnqts9JFSP4/4qy2kQaxy1lmaMYhL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759472970; c=relaxed/simple;
	bh=RhTUO8Az/rkGze0XBSDSkeZTiv4iDhIQnXHGgvDXzvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHl67cA7K4rd7xfgJ5n7ZqG0qRhxsp6ppt/RkMm7feJvRcFNaj4Lha2FnDEcNlG34qbC19nK28ZYvQ2OyGSCg442HpqTdLm81hXFi6Q43wOR9pkvWiCiXYwC/4JO+CHw/nxMhdGlBNMJ/9XkEMm1sXHon+OvWvdrb+e0fhKahZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ZiH4pGvA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ZiH4pGvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1759472955;
	bh=eY6rhLgnQZqXCa0c1cqbeQd3Jxlux+ZyitRRkXqWcPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZiH4pGvAH1Xg87bq77bRvF/ep+HtcMZopk/mkqZOY/lm7Tv0L7jRI+pV6CtqWqsWu
	 F1MOrohM6/7j+XC96TltSFvgwih6On0ZE0BwEXeK2L3l8DVaCNaZFR7WXXy5LpNLpy
	 rUp+/05kFKql91jGzKqltNojw7REESaZyP65/c5CT5p+1Hs1r8eMV3RDrMtR5jk0Nu
	 tlwaM3IRKTsHy3yIMhSskVEZxPwbKmCCj7OZKMMKGFhrfdEJxxz2PPla9Xnp3V2g2F
	 tFtEJAn9Nj/SX2DUfChALESP6DwkFNZZc7O1GsKR1uSgzyuQWBNq5DK+rddwaORPO1
	 MOk4+MmlB5otg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4cdJfM3dLKz4wB7; Fri,  3 Oct 2025 16:29:15 +1000 (AEST)
Date: Fri, 3 Oct 2025 16:29:09 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: yuanlinyu <yuanlinyu@honor.com>
Cc: "devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH] label: collect labels to __phandles__ node in interger
 format
Message-ID: <aN9tNVi25NOxyJoW@zatzit>
References: <20250901122258.2557912-1-yuanlinyu@honor.com>
 <f1dc6b4b445a4429aaf416b00926b162@honor.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cpr6PMDj8PSBXkSb"
Content-Disposition: inline
In-Reply-To: <f1dc6b4b445a4429aaf416b00926b162@honor.com>


--cpr6PMDj8PSBXkSb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 02:33:19AM +0000, yuanlinyu wrote:
> Hi David and other devicetree developer,
>=20
> Could you help review this change ?

Sorry for the lack of reply.  I'm not going to apply this.  There's
currently a big discussion underway on this list (amongst others)
about better ways of doing runtime device tree modifications.  ("Re:
Device tree representation of (hotplug) connectors: discussion at
ELCE").

My main point in that thread is that we need to reconsider the design
of this end-to-end, and not add more hacks on top of the overlay
mechanism which was never really designed for this.

>=20
> thanks
> -----Original Message-----
> From: yuanlinyu <yuanlinyu@honor.com>=20
> Sent: Monday, September 1, 2025 8:23 PM
> To: David Gibson <david@gibson.dropbear.id.au>
> Cc: devicetree-compiler@vger.kernel.org; yuanlinyu <yuanlinyu@honor.com>
> Subject: [PATCH] label: collect labels to __phandles__ node in interger f=
ormat
>=20
> Currently labels are collect to __symbols__ node in path string format,
> the libufdt have no support of it when do overlay.
>=20
> Add a new method which collect labels in __phandles__ node which each
> entry is an interger format, it will allow libufdt to keep labels when
> do (stack) overlay.
>=20
> The new method including below points,
> 1. add an option -P for dtc tool, it will create __phandles__ node and
> labels in interger foramt
> 2. add new function in fdt_overlay.c to support merge __phandles__ node
> 3. add overlay test which test -P option
> ---
>  dtc.c                |  18 +++-
>  dtc.h                |   4 +-
>  libfdt/fdt_overlay.c | 250 ++++++++++++++++++++++++++++++++++++++-----
>  livetree.c           |  76 +++++++++++--
>  tests/run_tests.sh   |  84 +++++++++++++++
>  5 files changed, 392 insertions(+), 40 deletions(-)

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--cpr6PMDj8PSBXkSb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmjfbTQACgkQzQJF27ox
2Gf4XQ/+JMPjbQK/7HG4UGw7VUSlyopltCAICV8AN4Hh37OeP8oDgELvZLNHt6Tu
kCgd+dfe9e5u8BxiBR0oJWeu+WNpbswwcrkNtHjhZ8XW1ZfalQVTcTSW3JbHL8/n
GxPiykwgXmViG1OjzeEatOrYZYuXLCvEk4sJYxIxpTDEgF0x/F9GCi31SMCiqu5K
YulmrjOLfKUxVDH5TCq52n5gNGja++Ai3PtP1st1coKNx9gwY2oFQTkBP8WU5F42
4AWOk8GRqYaGUlcUQ7H4I04vIXtvgZwrnmExyJKHDDemNtKQ6b2l6wmm8101nV1T
EEXTfCLcos9BNBRQT6lFMAA4bkuMQ9JrniHNYZSrI0dx+eGzx7uTbStZABkXYZrf
TmqnSmn7nIEldXVri2lXJCKGHn+Wm8n0aFSRKIyrrZslqe8HwWYLrTvIORuV/kws
ihLsgT3f/MGFX+inXO22F+9BhtauYSEi1as7v3m/2Ec+W1cuFjKZThClGHnzJ46d
j6vkAXJM/r+1fiD/xgEcLcrfM0ibSIbjdu4ijHYRASS2VX5jR1wlRrbut2aUTdcB
t59YQIqQssv43yQemqnvlCHUCHoXqaJHxwYMfj02nQF8T+36+Af4/UDM1J/DlMVM
iNTwlkKbXtChEXDoHuaqMBv4QBu/yBAm/D5AlBpZOEmuIcu5HAI=
=nQI2
-----END PGP SIGNATURE-----

--cpr6PMDj8PSBXkSb--
