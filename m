From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 04/12] libfdt: Add new headers and defines
Date: Mon, 27 Jun 2016 09:25:27 +0200
Message-ID: <20160627072527.GQ4000@lukather>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-5-maxime.ripard@free-electrons.com>
 <20160626153906.GQ15625@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CVXKxAdNG2kQIXaJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160626153906.GQ15625-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--CVXKxAdNG2kQIXaJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Jun 27, 2016 at 01:39:06AM +1000, David Gibson wrote:
> On Fri, Jun 24, 2016 at 04:27:49PM +0200, Maxime Ripard wrote:
> > The libfdt overlay support introduces a bunch of new includes and
> > functions.
> >=20
> > Make sure we are able to build it by adding the needed glue.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Is this intended only for downstream u-boot only, or also for upstream
> libfdt?

U-Boot only.

> If it's u-boot only, you don't really need the #ifdef UBOOT.

Unfortunately, libfdt_env.h is also included by some userspace tools
in U-Boot, which make use of strtoul while simple_strtoul is not
defined there (and we should rely on libc's anyway), leading to
link errors.

Maxime


--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--CVXKxAdNG2kQIXaJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcNTnAAoJEBx+YmzsjxAgQyMQALbQtAoSLETvkPbuXk9lrvQj
jY9qp/1DVCilLeBBaJ2DSj5WKExd2sfhFGiQhaKFfJdLOmXSqoYj/agKjVLItmH5
geKdK2hrWgYChDtcmWM+BtOlGugYxhEHyVoE9lSV9P/RBjeQSjD3WwjSdDKOFRqV
j/vwTBxFAwg5LCIQP1+Seryaa54YtZaLIAn9uunoceEz1K+pNDKKqP/h3o5X9dB4
iGpwpZpWHe5M9XaKoTD6Aij2nUh2/Ro5J6DLrO4pZOT2atcIXowC78IHZ4sLsim/
+dxB5Bz6+vCss5kiL9Aa7ANJP471ectPlH7f2zF8ABya5Tut6sZSlI1X/jz66/SG
ritXR1BOU3PD4mu6v6soTTBL6lG93YHZQ4pndJAj0EIJtQ1ULg7CtLJ9WnR76A+H
9/VYXU3yNtbXD28YHIwJg/oQa5WeCYfVNMID9Bri+SiIeaLMLqc0KTJ8AusMgrML
unWNGSuDRAxqFLfFUeG1HTkD+xIMm1F2ga4ybOHEQ+w+czJp/SvQ/XP0kOMNv+Fu
ndFT2EafB/k7s805fMmJZG3eU4bPqoIvUyxNfGnbq8dKnjvmM60FbhQsZG/gDOJL
4z8tCLKzDDLO2OgUyIPna1eQpXajcZXZbhxc6cL9rEhu0w//ZVwWMQNi9ILcfWHl
SODeCMRnkfDGc4c13bp7
=bgCR
-----END PGP SIGNATURE-----

--CVXKxAdNG2kQIXaJ--
