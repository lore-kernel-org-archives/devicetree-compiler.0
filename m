From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 07/12] libfdt: Add fdt_setprop_inplace_by_index
Date: Sun, 26 Jun 2016 10:09:33 +0200
Message-ID: <20160626080933.GH4000@lukather>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-8-maxime.ripard@free-electrons.com>
 <CAPnjgZ2iperwdKGa=+BF8ypH+yRJ8NnP24Fti-PbXDs5bfg3dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZYOWEO2dMm2Af3e3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2iperwdKGa=+BF8ypH+yRJ8NnP24Fti-PbXDs5bfg3dA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--ZYOWEO2dMm2Af3e3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Sat, Jun 25, 2016 at 08:53:50PM -0600, Simon Glass wrote:
> On 24 June 2016 at 08:27, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Add a function to modify inplace a property starting from a given index.
> >
> > This is especially useful when the property is an array of values, and =
you
> > want to update one of them without changing the DT size.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  include/libfdt.h     | 34 +++++++++++++++++++++++++++++++---
> >  lib/libfdt/fdt_wip.c | 13 ++++++++-----
> >  2 files changed, 39 insertions(+), 8 deletions(-)
>=20
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Thanks for taking the time to review it.

> I need to get fdt_setprop_inplace() upstream.

It's already there (unless you mean another upstream than dtc?)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ZYOWEO2dMm2Af3e3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXb429AAoJEBx+YmzsjxAgps0P/AlY6i/QidXJaSAJjZOtd+XX
EG7viQYGhOEnGA4dx+Yi+iOIj/YMKNwDz7lBJ5jxtxcntHPkIpPV54+nJxaYeeQc
jOnkKLvyGbmjEMYiQq3+2k2AZejzjon5MMAmoUOEE2cpR96kfkIXRXyE+O92R3z4
IWnKHarji2PM880h63wuFX36HCO1yMtfUgMfn4eLfwVYuvtSIxgT4wgx4Ld2IyUe
/q9bFnSLoxLkVoO7Xjulw6J9Jt96eq5VfGDSVgPvbCqeM6UBUAlWpmNDJlQ1HqtM
h9G0GoSIrjdvYskkTqj//NFxqp9hCtQcAaFEqx6Eupq36tCUsB+Ba9k0C2UeqBIt
3U6jl5MDF0ugtBDVtgAvfqJY+9W3zH/zQOAtBLhQUtReGR17A4nD9rImk4LKEGIY
mmsaZ715IC7AEb2rR0B0R6A99EUf6Yxl6HVQW0rbdgFCBiItpZpf1Hldj9/Cs2w4
rFcHc0e+Ntpsh6Xz2jG57MSsMRFpwIu9QkUObZb6czG1DPor1qFtugbRRQUeTCEN
iMjAMV5OWItsbsapuEU4Mv1W3l5Usgr3SF+bHfbGN6IJK5BxzwmS1/Qq2J3BGA2p
xmCaui6JRzC8hZFTTCDgbaOa207u5x1HrbNB6ItPEhVVg3eaabpcAW8uzgXVyNMr
3LHumIz3cmR+MgShGUT0
=8Ihi
-----END PGP SIGNATURE-----

--ZYOWEO2dMm2Af3e3--
