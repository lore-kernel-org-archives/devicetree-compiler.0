From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 12/12] tests: Introduce DT overlay tests
Date: Mon, 27 Jun 2016 08:30:28 +0200
Message-ID: <20160627063028.GN4000@lukather>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-13-maxime.ripard@free-electrons.com>
 <20160627052658.GL4242@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BtmVPk+Smchi6n7w"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160627052658.GL4242-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--BtmVPk+Smchi6n7w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Jun 27, 2016 at 03:26:58PM +1000, David Gibson wrote:
> On Fri, Jun 24, 2016 at 04:27:57PM +0200, Maxime Ripard wrote:
> > This adds a bunch of unit tests for the "fdt apply" command.
> >=20
> > They've all been run successfully in the sandbox. However, as you still
> > require an out-of-tree dtc with overlay support, this is disabled by
> > default.
> >=20
> > Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> These tests are geared for the u-boot tree, but for upstream
> application we really need testcases that fit within dtc/libfdt as
> well.  It would be good if you can adapt some or all of these tests to
> work in that context.

That's the plan ! :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--BtmVPk+Smchi6n7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcMgEAAoJEBx+YmzsjxAgmxcQAKszdQUpr/7ZUr8Q/j/rU04V
PjMVR0tIxkx3zkdWi0i3EH7QpHoev6I1p62LRz/1lgs3VHqkRlL2UjAHhrZ4ifvC
s8TJRcYWu6LX7hbEiiMDTpW4umqtEI5lbusTOpG31pv/6ocjVGWIsBPt1LtnGJy8
07MXvSjPH9kG8WbYRg65GCod86w6++7Lw081iOk0P0mysLM7qDM/VCGKWxSGaV/R
cuRlNVRirDO9hp2OUB3gn0nGBfe8Tf7CAG3MHjz9lUzeLv/zmc3lQkn1/SA/5W2z
R2zLqURhfGfi9g9RGS7tP5oLnaZ4DbyfY4IJS14QNbvg0ycAyaptOAM7kNJM3SPz
XiU/LlTLfuPcZZHr0RNENar1C233FRVfEDn67Z8l0y1DAftjkMpzm27/5nm35BdK
Lt6kQ+jmc3StTcGXR9DZf+QkK4T9SnYNPYwqe0oBHCurWn0Hl07uAdisnuci03Qo
jN8tv5cPfSR/OeQy8KmcVnMkjYed+qmmRR4W0YcHXZju94bdVA10TLEvSv9cT+e2
SUlCpx/j7UunAdLgyO1itYRTvj2KKRtgYgEHT2Kkj3g+pf3NfeS9fOvYPWCVe+4Y
xzeU85RHTB/FS6VKpteAo7l9x5NrW1d/vqE8lU7x1UZ5iHADrhKnEXV/CKTMndsz
VGxxHteEiVWvSXZOBUgp
=aPLC
-----END PGP SIGNATURE-----

--BtmVPk+Smchi6n7w--
