From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 4/9] libfdt: Add new headers and defines
Date: Sat, 11 Jun 2016 20:30:35 +1000
Message-ID: <20160611103035.GW9226@voom.fritz.box>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-5-git-send-email-maxime.ripard@free-electrons.com>
 <D44ABB0F-69B9-4DA6-8F8B-6F74A5B4BFE1@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aWODCRBxMR7ARF42"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465735756;
	bh=vqJBSEAIGIp73WNEZHezTwh15+PZGN2KpG+gfBc1n9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hi0fUcoyZreKoaeP1PuGCTuGa0rlpdzD2RVx5bd3FPllhiq8l3MbIO78Fm5FoX96R
	 El2NAq6TxOopQqwoQM//MGKZOmo2srWXmejuK6aLB9Q5UPyBy5+P5X7KeBRXm57Y0f
	 NoLanPGg1rgPEMQR6Z45pA58tM/FRvlq1hI1C0xk=
Content-Disposition: inline
In-Reply-To: <D44ABB0F-69B9-4DA6-8F8B-6F74A5B4BFE1-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--aWODCRBxMR7ARF42
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2016 at 05:03:36PM +0300, Pantelis Antoniou wrote:
> Hi Maxime,
>=20
> > On May 27, 2016, at 12:13 , Maxime Ripard <maxime.ripard@free-electrons=
=2Ecom> wrote:
> >=20
> > The libfdt overlay support introduces a bunch of new includes and
> > functions.
> >=20
> > Make sure we are able to build it by adding the needed glue.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> > include/libfdt_env.h | 7 +++++++
> > 1 file changed, 7 insertions(+)
> >=20
> > diff --git a/include/libfdt_env.h b/include/libfdt_env.h
> > index 273b5d30f867..2d2196031332 100644
> > --- a/include/libfdt_env.h
> > +++ b/include/libfdt_env.h
> > @@ -23,6 +23,13 @@ typedef __be64 fdt64_t;
> > #define fdt64_to_cpu(x)		be64_to_cpu(x)
> > #define cpu_to_fdt64(x)		cpu_to_be64(x)
> >=20
> > +#ifdef __UBOOT__
> > +#include "malloc.h"
> > +#include "vsprintf.h"
> > +
> > +#define strtol(cp, endp, base)	simple_strtol(cp, endp, base)
> > +#endif
> > +
> > /* adding a ramdisk needs 0x44 bytes in version 2008.10 */
> > #define FDT_RAMDISK_OVERHEAD	0x80
> >=20
>=20
> We need to figure out what the upstream libfdt/dtc maintainer=E2=80=99s t=
ake is on this is.
> For u-boot we=E2=80=99re fine and for now it=E2=80=99s OK.

These were sent to the upstream dtc list as well.

The concept is fine, but there are a number of problems in the
implementation.  I sent detailed review comments on the upstream
versions, haven't seen a respin yet.
--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aWODCRBxMR7ARF42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXW+hLAAoJEGw4ysog2bOSfnMQANCjRzXH1B7K9Re1hCiCZ1N0
5E4mV6q1/yk5hE6bpSxl4eX8z3v1c78Pz6SZePyU6XXLwiPVTSubguhdrrErwE8V
x/J6PkMHLUaPQALitYDar2Qc+vmgeHB+/c98OgU/oDIvNbTrAa/qYK2ONY/9VdVf
Z3AV9C5kXQFOUscht80bhc9Jj6a6yC4/oq5rn0wuA7MBM8QikPxIxP8KRZJTN4vV
KUGvWo967zw3oOImfaVZ2FiUihLF8D/KpmFdpscJ6nGGw5SuhN1akPSmHhut/qDJ
FyG/JPTyR2Rqw8mfFpWsrChi57SIY3axMtnJP9nhu3BjlhrSYvx1ksMsG9D939f9
zA9urNh9ppvhWZrUzw8OYN2asKWA/sIabFX7l6Ke6/NWApab7mD/VjUd2vjeIHZw
5WowyzX3IliXpmaQyImZvl79ABtrY9pz7CDomHzJ4k9AgN1FQ3OR2ez6eDGtSf/W
xVdZb4Sb1Q/XLDFfRa7gi7yCZ359D20WyTBJ2afKQpFMX30XNeTPRmGQTkXT6aZD
Fw2NlsyW4GCyp43visDQvijKr0QLkkjdYq4yytBTmvhoSdw/fCjwl7U+LFmWJnBj
Qveam4LYQ1YevIjUKFmAZnOxmOevstKcDqBqO41OZUY5vU/cr6oqEvkxJhEgMybj
VUmKL1Zaz9bEANU6WJ19
=U/wP
-----END PGP SIGNATURE-----

--aWODCRBxMR7ARF42--
