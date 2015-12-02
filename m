From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] libfdt: check for potential overrun in _fdt_splice()
Date: Wed, 2 Dec 2015 13:12:03 +1100
Message-ID: <20151202021203.GA3107@voom.redhat.com>
References: <1439231942-28830-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1449016990-12730-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449016990-12730-1-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2015 at 04:43:10PM -0800, Bjorn Andersson wrote:
> From: Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>=20
> This patch catches the conditions where:
>  - 'splicepoint' is set to a point outside of [ fdt, fdt_totalsize(fdt) )
>  - 'newlen' is negative, or 'splicepoint' plus 'newlen' results in overfl=
ow
>=20
> Either of these cases can be caused by math which overflows in calling
> functions, or by sizes specified through dynamic means.
>=20
> Signed-off-by: Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Applied, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWXlNzAAoJEGw4ysog2bOSUKIQALJ+Ay0nbW00kz6Un/tapKu/
irMClJSvUht8AwHDDj18ZnExxvdLavsU/NFm7LdCerEzX0jiRmnhv1YKSzHJ4E1S
/98MRLIZArTnO7JYD3ohi1hFgFLUb3XnV7BO0Fv5mHeVUE/Uq7tqppwJWGw9A0VH
yip72FMLgivsRC1WeRq0d32vI6A+cq7iE4chWBTDiN6NGYdbtTvMfqqj1Pq1Pz1v
u9fYfQMeBrbcbJ7dOhEeMMnqxlZT7GymiTZa5/JKJGAYOX6oNHSjMNpr1mSRL7o6
l3O2tYsPQmuTo49AbvB4Y7OZV5d9ma+3ThMzi7CnWxx6aB2IRUDDm38igd9RZ+s3
7pYGjVfPmfFEOck3ma6WRaMp1vLoaU1RkuOUhoQ5nWF0Cnb4R5GWNvPJiyvEu6Jc
dCbswGOVX7Fkxii6zIMhosWbr+XCws8yhoX8nEgNZj+3xwJd2AdMASIef1blww03
O7G/gO/bg4w5W2tam+oFJHvQ8LjLDrBua/fKlMkPOi7ZbHYUgH4tJXi2p/O/d5MH
irBE0bv237YvwP2O++86H3I8selA6vCdFeRo79jxt/9fodJzldusp0V83BR+2vMv
L/F/D4ABkafBZ1jc4EWK01dhfV5rj+jCbU10UAPly4unijM0bfS+CnHYfFA34UEQ
Oe1E3UpA3aTrfX+Q8g3Y
=mFTy
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
