From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] overlay: ensure that existing phandles are not
 overwritten
Date: Sun, 7 May 2023 19:25:04 +1000
Message-ID: <ZFducBimOTs/fqNZ@yekko>
References: <20230426100231.484497-1-u.kleine-koenig@pengutronix.de>
 <20230428180906.vb4i7447u4uvuhpn@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AmBoHOoyWDymoiD5"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1683451531;
        bh=qrItrRo3mJUpDN3li1OChCLf1ouUge+PWCbN8RuWpE0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BNsE0N0be4hVWvZi9h9D0D3sAhNsC4xcAZqSdDPC3mp/XaJOJ125wKXZSIBRMOyu/
         DNqlZM2cEKhP14mpjQptmwppzXtloujTjY0c88uYmM4V/k7/n9tI+8jOCTd01caOSm
         O82jiJjia7mUUs5FC/gTkx01nIWZFGEEgs+u+7vw=
Content-Disposition: inline
In-Reply-To: <20230428180906.vb4i7447u4uvuhpn-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Yves-Alexis Perez <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org


--AmBoHOoyWDymoiD5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 08:09:06PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Wed, Apr 26, 2023 at 12:02:31PM +0200, Uwe Kleine-K=F6nig wrote:
> > -static int overlay_adjust_node_phandles(void *fdto, int node,
> > -					uint32_t delta)
> > +static int overlay_adjust_node_phandles(void *fdto, int nodeo,
> > +					uint32_t delta, void *fdtbase, int basenode, uint32_t *phandlemap)
> >  {
> > -	int child;
> > +	int childo;
> >  	int ret;
> > +	const fdt32_t *phandlebase;
> > +	int phandlebaselen;
> > =20
> > -	ret =3D overlay_phandle_add_offset(fdto, node, "phandle", delta);
> > -	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> > -		return ret;
> > +	/*
> > +	 * If the base fdt has a phandle already reuse the value to not break
> > +	 * references that already exist in the base fdt.
> > +	 */
> > +	if (fdtbase) {
> > +		phandlebase =3D fdt_getprop(fdtbase, basenode, "phandle", &phandleba=
selen);
> > +		if (!phandlebase && phandlebaselen !=3D -FDT_ERR_NOTFOUND)
> > +			return phandlebaselen;
> > +		if (!phandlebase) {
> > +			phandlebase =3D fdt_getprop(fdtbase, basenode, "linux,phandle", &ph=
andlebaselen);
> > +			if (!phandlebase && phandlebaselen !=3D -FDT_ERR_NOTFOUND)
> > +				return phandlebaselen;
> > +		}
> > +		if (phandlebase && phandlebaselen !=3D sizeof(*phandlebase))
> > +			return -FDT_ERR_BADPHANDLE;
> > +	}
> > =20
> > -	ret =3D overlay_phandle_add_offset(fdto, node, "linux,phandle", delta=
);
> > -	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> > -		return ret;
> > +	if (fdtbase && phandlebase) {
> > +		ret =3D overlay_phandle_set(fdto, nodeo, "phandle", fdt32_to_cpu(*ph=
andlebase), phandlemap);
>=20
> Compiling that on Ubuntu stable emits a warning here that phandlebase
> might be uninitialized (see
> https://github.com/ukleinek/dtc/actions/runs/4831386302/jobs/8608771064).
>=20
> While looking into that, I think the code is correct, but can be
> simplified by using fdt_get_phandle() instead of open coding it. I'll
> rework the code and test a bit more. So please don't apply this version
> of the patch.

Ok, will do.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AmBoHOoyWDymoiD5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRXbmMACgkQzQJF27ox
2GfAKQ/5Ael4S9Ust2YWLKyhj40AiKyxXRdBAo+8+3pJ2NgMJ3SyFFUMdVQ5SHDZ
xVdgpVdi9LxJwrohBrB4Tyjqsc6jrSNuMMY3SXoomJZzjjrMpyprqG8K8ZGi49FF
0Iw5xbyOMVo5H2XLY73O27KwFe7jPqU5J3Vgfg1tDYi5phYijzf5QuJdTOKzFR0W
LLZQkerXm7itOOvR2LWYtRM1poMnaIbCPQZ29HY3sn1CJre5L6gmYpEOMnTi275x
VuNOhf5Gn6CPKndufa0ctFHmyLnKXHrYQYFh4e9z6kqHNPLQrASKUZyY4OkS7FR/
L4oAltjObjQCKu1YNpsGTMUkNJ8JOxNenHkxaawHQ07cwiKlV5pMKJ414lUQ9wXy
8I/LxpwYLAljJD/xs31zxsz16d1NzWoIAlr19uZpWqDn9Qgv+W8MO3omEsYQC9YP
3KlLKztO77TR/JciS3qzy+S4upP2bsyd4G5efm47lxuS61NmigI+ZRgFCgeHveho
yCj/QXqPUnV20kLcVy6pnFa3ezfpX1KATl8iKVmwtLcOwNaj+KSC8BoST+apfhE6
97kZ8Pu0rXOjA2MMqtf37CkeMwbQvtrLFhEpEaiqsDWXBBbhNqzHyHoUNqyi/QtH
3jzsmJmcrZoTuZJB1LBYrwMBgsDNE4qVWG9bTEof20GLmzLQudc=
=J8zK
-----END PGP SIGNATURE-----

--AmBoHOoyWDymoiD5--
