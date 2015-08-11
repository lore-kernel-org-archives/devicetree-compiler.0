From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: check for potential overrun in _fdt_splice()
Date: Tue, 11 Aug 2015 10:52:07 +1000
Message-ID: <20150811005207.GA19634@voom.fritz.box>
References: <1439231942-28830-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1439231942-28830-1-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2015 at 11:39:02AM -0700, Bjorn Andersson wrote:
> From: Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>=20
> Signed-off-by: Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>


The logic looks ok, but this needs a commit message explaining the
details of what condition it is protecting against, and how it might
arise.

> ---
>  libfdt/fdt_rw.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 70adec6c371b..8be02b1f68f3 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -101,6 +101,8 @@ static int _fdt_splice(void *fdt, void *splicepoint, =
int oldlen, int newlen)
> =20
>  	if (((p + oldlen) < p) || ((p + oldlen) > end))
>  		return -FDT_ERR_BADOFFSET;
> +	if ((p < (char *)fdt) || ((end - oldlen + newlen) < (char *)fdt))
> +		return -FDT_ERR_BADOFFSET;
>  	if ((end - oldlen + newlen) > ((char *)fdt + fdt_totalsize(fdt)))
>  		return -FDT_ERR_NOSPACE;
>  	memmove(p + newlen, p + oldlen, end - p - oldlen);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVyUc3AAoJEGw4ysog2bOSSTsQAJdEc1RVIaGNP5QEa2MrvxGV
ma/R/M+sbX3fVrW12D1/aR8BJcHvKiahNrTVQegKDEiuTw7Ep1ElOiHNZvnneZDC
mShjMFGGJWQzZKA56ALTgX7aIIRs9+GjSro+wTAIEokPLdjpsqbg7ht8/rSi8kV3
srpyGSb1ecA8V9za/0bibmPPmcHnbyW5Ogf2hKLZkDwKyeXGMO3bl7o42HhD6i5x
+RWwBUR2RKM9cpNinc3XahMTu/ZfiQZoiUc9zm9mpT34z3yLJ1IsllKSvZkS8kP5
N+NurN/xfWNSe7QHt+5S5Tf/Y466qF2sKHI41lJ6whv4kLl87ps2LHg3N0IVXbcy
DY+u6w/15AMqqeZ6y+cOq43fiqqBFCmwDZgU76cgIV5RgQspkR54APUGEU7jACEo
1qo+b85SkrvKCXxRfcY3KdVcfRQbEv5uYDvPAlUFaSNTRtboXjU76a2KxgI8MlUl
Wo5scqjZ0b0y4PXSYDcJDvIceG0SzZHOpcFrdSDQG5Hm/aPj0IdUbEk6B3269kO9
NnzIVQCQzuNElcgUgez93pHRs6Gd68h1NCRW4h+N2RsSN5e+brp6c0IEt+GM2FNs
A/Kod5WhDP3bnU1PHdr+G4/6g05aDjDbX42XrD6UdV3ECHLhpJq2Vq1uuGJnYpPF
MUmc8IwtQyTWdhvmMVpW
=mGCa
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
