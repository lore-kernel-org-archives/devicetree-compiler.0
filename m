From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 4/9] libfdt: Add new headers and defines
Date: Mon, 13 Jun 2016 11:28:28 +0200
Message-ID: <20160613092828.GE4481@lukather>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-5-git-send-email-maxime.ripard@free-electrons.com>
 <D44ABB0F-69B9-4DA6-8F8B-6F74A5B4BFE1@konsulko.com>
 <20160611103035.GW9226@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+JUInw4efm7IfTNU"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160611103035.GW9226-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--+JUInw4efm7IfTNU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Sat, Jun 11, 2016 at 08:30:35PM +1000, David Gibson wrote:
> On Fri, Jun 10, 2016 at 05:03:36PM +0300, Pantelis Antoniou wrote:
> > Hi Maxime,
> >=20
> > > On May 27, 2016, at 12:13 , Maxime Ripard <maxime.ripard@free-electro=
ns.com> wrote:
> > >=20
> > > The libfdt overlay support introduces a bunch of new includes and
> > > functions.
> > >=20
> > > Make sure we are able to build it by adding the needed glue.
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > ---
> > > include/libfdt_env.h | 7 +++++++
> > > 1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/include/libfdt_env.h b/include/libfdt_env.h
> > > index 273b5d30f867..2d2196031332 100644
> > > --- a/include/libfdt_env.h
> > > +++ b/include/libfdt_env.h
> > > @@ -23,6 +23,13 @@ typedef __be64 fdt64_t;
> > > #define fdt64_to_cpu(x)		be64_to_cpu(x)
> > > #define cpu_to_fdt64(x)		cpu_to_be64(x)
> > >=20
> > > +#ifdef __UBOOT__
> > > +#include "malloc.h"
> > > +#include "vsprintf.h"
> > > +
> > > +#define strtol(cp, endp, base)	simple_strtol(cp, endp, base)
> > > +#endif
> > > +
> > > /* adding a ramdisk needs 0x44 bytes in version 2008.10 */
> > > #define FDT_RAMDISK_OVERHEAD	0x80
> > >=20
> >=20
> > We need to figure out what the upstream libfdt/dtc maintainer=E2=80=99s=
 take is on this is.
> > For u-boot we=E2=80=99re fine and for now it=E2=80=99s OK.
>=20
> These were sent to the upstream dtc list as well.
>=20
> The concept is fine, but there are a number of problems in the
> implementation.  I sent detailed review comments on the upstream
> versions, haven't seen a respin yet.

Yes, thanks a lot for your comments, I'll address them and resend a
new serie.

(it might not be before a couple of weeks though).

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--+JUInw4efm7IfTNU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXXny8AAoJEBx+YmzsjxAg2nwP/ivF0xdaykODnEvzKuPAkwk9
kYy26M9GaGPcjO5teFi4xKjP0d6RntjcMyoik4bCvhOY9nla4WU8t4meuGj1+iJQ
sEvTMLuhrcuh/p2KjxatKG5RgAYmJxYAdjW69iP1SMxPxtfZZL+RAOCh4wjlqHyx
DzPTd/aTYbdiPNShfviFAakATtjkALk63tII7wtnuDyGmYmOzeAMN8B5fca8sIhi
viO2AYpaDTpUge7FJlWBQab+BdazS3ClDYgeu2ZkZpg5WqsBV/UhtbcHrsnnMr74
jFrkg0xab/ljXpSnc/8Y+auSwxssUQZw2jix1w3urixsbFZ8pojHz8NwzrBE4ea3
UDcLykXAzSnLH/Vt77Q8l0I5AS4LnpfFckKMHpz0eLixn/3N1w9xsgeq7eHB6b6V
iuuNLDJ/91/aFZGM+J7hYgxF06lBmlAFl3q/8h/SKzK3JV0Emy7zCgAnSZ3txG2q
7mVkrCinEnnfcqTIYgO9faoTeEijQwL7Rrgi+zJYeQuC/c5OSx2bE21E0DgtxW+N
G+yMRqvRmEauQscQtdu1VjRCo3vOVzk9kql22lDyBuer4y99qvl/o7FRvTHxFCjm
yhDzMyi50Y59yOjcg6DpVejtcYudTXdyJ9DWhc5BrdpNtpJv8JeJ9VsIuA7QIy33
lpU2RdeKekJc11Q2f9bi
=RmN/
-----END PGP SIGNATURE-----

--+JUInw4efm7IfTNU--
