From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 12/12] tests: Introduce DT overlay tests
Date: Mon, 27 Jun 2016 16:47:46 +1000
Message-ID: <20160627064746.GP4242@voom.fritz.box>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-13-maxime.ripard@free-electrons.com>
 <20160627052658.GL4242@voom.fritz.box>
 <20160627063028.GN4000@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1BKOZKwX7DAU5odC"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1467010189;
	bh=u7oVbvNP8/A2m82AXqlg9eKG8nr4q6tpG1rUeAq68vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgZpQ7Md9POa4lIRFnNwnRrzqJGkGH0o1g+rBriND72GWbsfIH5QZgOaiQvPSlH4g
	 QmQL8fC7P51E0mxyKOTN+H90fiMCnxPYCQQ1sfe9aR1tDpYYDsvviYs50REtYd78OP
	 KT0ucuoA3Xf1sqWzLdfflRPVii3ZLNTlK2jbzbP4=
Content-Disposition: inline
In-Reply-To: <20160627063028.GN4000@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--1BKOZKwX7DAU5odC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 08:30:28AM +0200, Maxime Ripard wrote:
> Hi David,
>=20
> On Mon, Jun 27, 2016 at 03:26:58PM +1000, David Gibson wrote:
> > On Fri, Jun 24, 2016 at 04:27:57PM +0200, Maxime Ripard wrote:
> > > This adds a bunch of unit tests for the "fdt apply" command.
> > >=20
> > > They've all been run successfully in the sandbox. However, as you sti=
ll
> > > require an out-of-tree dtc with overlay support, this is disabled by
> > > default.
> > >=20
> > > Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >=20
> > These tests are geared for the u-boot tree, but for upstream
> > application we really need testcases that fit within dtc/libfdt as
> > well.  It would be good if you can adapt some or all of these tests to
> > work in that context.
>=20
> That's the plan ! :)

Ok, great.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1BKOZKwX7DAU5odC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcMwSAAoJEGw4ysog2bOSP10P/jmKkE4W4qc1r2vmPd5hGnqm
05ZsUJA4E71x+tX/n+ocRTG2uKjkS6z+UzGVSN3ew9pDdk3advNxl1fRlFv1uZOw
fVSzObpJP6x+GMUMg16IO+IIt6gdF1dHX6CQZ/JhavWSkyjb3Izu4LYoggSSpFBj
t8fMF7bOjlr3A9/Cnk/ccdQzT0/pxUxXeZC8rTUaM61XAx0Sid8+cYJ9nd222ecj
LPjFoHW1wXfbiHnCiY6OfQkDKNkuXn/5sr2b5qn+nGxdyi+6SgKFPyCx8/JAxGic
BEMf0E3+67r6Gaji8ZQN1I/pUfHeMEa0F49vCyEByjIYgQaDi5nqXhe9Ww7YwuF3
s2piml9iUpngQ10PAmx/kRMHKrSH+szbPRj4mWNsLjBkGrfseBp5b8W9AOOFRbAI
hEtLfTg0So3iuo3rLzC4zKJxw5Fy5m9DVDhNd/3NrcXS37B+fTI6FiQ0Y0/jH8HM
oUvJif9x4LsEdUpsCq3LifYMJ/i3w2RyJe7XqAI5QPH6zvh4vW9+x7lLxmtUH9KY
MgTBQeMCmYQgyNYa2M6KYcdc4RARRQVxwBbB0Nqv9QxsIRPIe1zsycu9oZs7j5Ho
/mYbV++HXAI5J6cwLPtVyezWNcPQjo4XUybNaUDdRv7mFBsvuaJEZLly2SQ2Dx8j
xeGlRZaFuZB74RfDbcY7
=DUnG
-----END PGP SIGNATURE-----

--1BKOZKwX7DAU5odC--
