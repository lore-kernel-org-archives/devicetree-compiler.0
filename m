From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 04/12] libfdt: Add new headers and defines
Date: Mon, 27 Jun 2016 01:39:06 +1000
Message-ID: <20160626153906.GQ15625@voom.fritz.box>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-5-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gblAvmLjk8yGG9If"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1466956117;
	bh=H1H1uktbgjPszPmURkf7neR+kFeD+LZQfE9d0Rp3uhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSDonMrqczJMOpHyY0NbSjMEtBoQobJIMoPstCZAL+cKJ5MsT2gYRhyEhT8B+acuJ
	 zi9UTEa5+6RCiiLz2fnaU9RCNJphbj3i4z76DJGNHhCVLH/5NXYeu8tLmRCjRzPbAy
	 A9d51iZ8V6PzMKul8kQmeGD/OIzCduJwiRLOL3D8=
Content-Disposition: inline
In-Reply-To: <20160624142757.32735-5-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--gblAvmLjk8yGG9If
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 04:27:49PM +0200, Maxime Ripard wrote:
> The libfdt overlay support introduces a bunch of new includes and
> functions.
>=20
> Make sure we are able to build it by adding the needed glue.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Is this intended only for downstream u-boot only, or also for upstream
libfdt?

If it's u-boot only, you don't really need the #ifdef UBOOT.  If it's
for upstream, then it shouldn't have u-boot specific stuff.

In general the environment into which you're embedding libfdt (u-boot
in this case) should provide libfdt_env.h.  The one included in
upstream libfdt is essentially just an example version designed to
work with POSIX userspace.

> ---
>  include/libfdt_env.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/include/libfdt_env.h b/include/libfdt_env.h
> index 273b5d30f867..6c6845f76cf7 100644
> --- a/include/libfdt_env.h
> +++ b/include/libfdt_env.h
> @@ -23,6 +23,12 @@ typedef __be64 fdt64_t;
>  #define fdt64_to_cpu(x)		be64_to_cpu(x)
>  #define cpu_to_fdt64(x)		cpu_to_be64(x)
> =20
> +#ifdef __UBOOT__
> +#include <vsprintf.h>
> +
> +#define strtoul(cp, endp, base)	simple_strtoul(cp, endp, base)
> +#endif
> +
>  /* adding a ramdisk needs 0x44 bytes in version 2008.10 */
>  #define FDT_RAMDISK_OVERHEAD	0x80
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gblAvmLjk8yGG9If
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXb/caAAoJEGw4ysog2bOSOMsQAKckuw27KowHmW26JnlaxRJV
6STqr3X9YVRU80DCQQ+mrmFnSMwX6vitxZHFD9ZDiVw3MTwnUFHrNen0SQd7lXM+
evWWU2X1OyZ1F3lxcPA45pmMMNdQ2dAvYZhrXS9ZKBSMn39PJmbEaUecbF9BwhWV
i++NHP7C77thHGoFCvYRF0ClcIpVaM8Z98BPvUux3cNbaVppQgXD1/MXtwWLgXNQ
Ot2lHs9G+1TuM/x0n1ETcx6AD8LtO3YJObY8fufeKNiwB8McARRIStE2BHH1Xf08
QoPGMyrdKiIdtMg28VeS+yJm4GervtoGz5p3ToQWdEABKSGDsaJM6j87ChLd7wpS
5YMCYb83zXAeGrq0JVtfuOpnNVWJddxUclbuOp7qpKofDl2ujb+eSCqWgaXCUUzl
UgADtkhsDgI8M/Jo7OSbr1GfPHhyVIluZD7s4URYWPbelJdTC+Q2sgODmBsl1iEr
5BCQSQLvyQ1u7ITrTmAtZOGrVDuKO1glApHHDXkcorwxy/Wf7n5TXwmv+18jW2nh
842WbI6WMkGXk+rWYF3i+52l5uaGR5jwvIPIINd9Ko/d7J2GQV6LYyguFbpNMz/o
wbQaLLTDjErAN5k12gFHdwgrlHGa2ME72RuglBrGc5UPfwcvS6wBPeDLRdyc3h9F
4bN4eAnfpflwT4Fciyt3
=Hh+s
-----END PGP SIGNATURE-----

--gblAvmLjk8yGG9If--
