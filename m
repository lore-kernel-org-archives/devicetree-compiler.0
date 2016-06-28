From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 04/12] libfdt: Add new headers and defines
Date: Tue, 28 Jun 2016 13:02:55 +1000
Message-ID: <20160628030255.GX4242@voom.fritz.box>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-5-maxime.ripard@free-electrons.com>
 <20160626153906.GQ15625@voom.fritz.box>
 <20160627072527.GQ4000@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WVf18ZLo9bznw8Mz"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1467085574;
	bh=HKv2U5w6DYZo0BKVIzKhr7i5EE79UV3sP3yv1LfZaNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ULVEFst/GYhi48dVdTVXTLYu+8DoByx+CwhgK5T5YxJHWBgX/1NHYN45uomdEQwK/
	 aZGt03Tsuo5rsOyCkmK6AQ61LPL6of2PGRIaKY66BuDM14KPxLI0OSTjj1my1tx/uj
	 vSol3ovr8cAmMyOwNEdjn2+dB6Izk2AugEwcZag0=
Content-Disposition: inline
In-Reply-To: <20160627072527.GQ4000@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--WVf18ZLo9bznw8Mz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 09:25:27AM +0200, Maxime Ripard wrote:
> Hi David,
>=20
> On Mon, Jun 27, 2016 at 01:39:06AM +1000, David Gibson wrote:
> > On Fri, Jun 24, 2016 at 04:27:49PM +0200, Maxime Ripard wrote:
> > > The libfdt overlay support introduces a bunch of new includes and
> > > functions.
> > >=20
> > > Make sure we are able to build it by adding the needed glue.
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >=20
> > Is this intended only for downstream u-boot only, or also for upstream
> > libfdt?
>=20
> U-Boot only.
>=20
> > If it's u-boot only, you don't really need the #ifdef UBOOT.
>=20
> Unfortunately, libfdt_env.h is also included by some userspace tools
> in U-Boot, which make use of strtoul while simple_strtoul is not
> defined there (and we should rely on libc's anyway), leading to
> link errors.

Ah, ok.  The ifdef makes sense then.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WVf18ZLo9bznw8Mz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcejfAAoJEGw4ysog2bOSoDoQAOAp0BjImfEX5LUetLkLhCtI
GcYUkV9X7tH5GAb7ubIAEXBsnlZZkIkzHTAs4/tVK8wYMp3hHSi/ZGmfn6c8gQTV
b8wh4kihlUFGBw+J6ERYYk6JfG9Wy4IAqcTHzDh1qHWl6E/kj4v6JHikxGn17FsD
oZAtC4f5S9jVQLdfHM3NCf3+XoeUg5poZscD5D7DixFOF1H8kxhxEWHzGn7v0+fT
jswot8dhVBFM5Q2CPRKiP08kyTkMZ/5jj3GBMZtcAbHr1DxSJQW3Q91Qfy1m0MKy
SwezzhEe8QdqBSGosdK6rxAX5qAeeCw6bGLTUWUD7iXKAP/e+bS7pxXiPT4KZVLS
xtRrFPuOOMe/B72WVCbD9vbTZ4zAJZQY4HQ2Hh36dD2mVRXWO3RdGFbALmUqY374
mVNyJ4DtaD3ibnw6d32hrTagVRxSL17y9oDUnKzU7WsRC97iMKZCQh5P7g32hws7
X++7v7g0m6N2rDsF8PT4JfmOtCIHl1KZa8h0cmgiSFUg5bd12dFvDAxMVLSZKAvr
4MtOjRBj5nvY5/sCzy1W0JfoIERYVXtQsNjBLYn+ng5gCg6ttjqhbs78z8mcuCgB
EZTj/j5lBtCUBDezWoqGJRR2UAUC8MqW32vqOts8P3Z2AJ1VB1Z4zQob4aSxDp+O
292uEZH9rTOz4ItatBww
=W6Mk
-----END PGP SIGNATURE-----

--WVf18ZLo9bznw8Mz--
