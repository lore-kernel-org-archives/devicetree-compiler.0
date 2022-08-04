From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdt_get_phandle: Return invalid phandles as 0
Date: Thu, 4 Aug 2022 14:57:15 +1000
Message-ID: <YutRq2IgPf4+1gmM@yekko>
References: <20220801123134.1499236-1-ptosi@google.com>
 <YujId/uczDRrdJ9v@yekko>
 <20220802134437.b75rj4mjvhosvh36@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="awiocHqvv+kReAVY"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1659589434;
        bh=VjKw2XFu+Kq4Ajqi4OiZmqIhWUI7NjHrlHvHxFjmCac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XWRz27Kb55SYURl4l63Kgh2mFGwFZcPxoHlUSqSVu/tLxcAblmd4O52WWB08G0o8e
         rKUgJVCsC38JVK1ebi7cpgoq+erVLnZFXyxdNO0/lk3vxSh7UTdSyHB2pF3ZF7BRN+
         1ec3Q5VLPUP7PP5AFjoN8szAHg16bIVuZQfsE40E=
Content-Disposition: inline
In-Reply-To: <20220802134437.b75rj4mjvhosvh36-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--awiocHqvv+kReAVY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2022 at 02:44:37PM +0100, Pierre-Cl=E9ment Tosi wrote:
> On Tue, Aug 02, 2022 at 04:47:19PM +1000, David Gibson wrote:
> > On Mon, Aug 01, 2022 at 01:31:34PM +0100, Pierre-Cl=E9ment Tosi wrote:
> > > If a tree contains an invalid <u32> value as its <phandle> property,
> > > mask it with '0' (invalid value) instead of returning it from
> > > fdt_get_phandle().
> > >=20
> > > Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> >=20
> > Hm.. I don't really see the point of this.  Because FDT_MAX_PHANDLE is
> > 0xfffffffe (-2), the only effect this has is to change 0xffffffff (-1)
> > into 0 when returned.  Both are, indeed, invalid phandles, but they're
> > sometimes used to mean slightly different things in incomplete trees,
> > so it seems more useful to return these separately
>=20
> I can see how returning the u32 as-is (without masking invalid values) ca=
n be
> convenient in internal code giving a different meaning to the field as, i=
n that
> particular context, those "invalid" values actually become valid.
>=20
> However, my worry is that, as this function is exposed by the library, cl=
ient
> code could rely on it and assume that any non-zero value it returns is va=
lid:
>=20
>     phandle =3D fdt_get_phandle(fdt, node);
>     if (!phandle)
>         /* handle error */
>     /* (~0U) is considered valid! */
>=20
> instead of the more verbose and less obvious
>=20
>     if (!phandle || phandle =3D=3D ~0U)
>         /* handle error */

I see your point, and if we were designing the interface anew, that's
probably a better way to handle the error cases.  However, I think the
risk of errors like you describe is outweighted by the risks of
changing existing established behaviour for this function.

> or (written to be robust against an evolving FDT_MAX_PHANDLE)
>=20
>     if (!phandle || phandle > (uint32_t)FDT_MAX_PHANDLE)
>         /* handle error */

FDT_MAX_PHANDLE really can't ever change.  Even back to the old OF
days, 0 and -1 were the only values that weren't valid phandles.
Since there may be existing trees out there using 0xfffffffe as a
valid phandle, we can't reduce FDT_MAX_PHANDLE.

> leading to potential bugs.
>=20
> To address your concern, if that extra meaning for phandles in incomplete=
 trees
> is only internal (not exposed out of libfdt), would it make sense to repl=
ace all
> calls to fdt_get_phandle() by an internal function that behaves like
> fdt_get_phandle() does today (returns the _actual_ phandle) and make
> fdt_get_phandle() only return valid phandles?

Eh.. "internal" has some fuzzy boundaries here.  Anything working with
overlay dtbs before they're applied to a base tree might see
unresolved phandle references.

> Alternatively, libfdt could provide to its clients a function similar to
> phandle_is_valid() (from dtc.h) and document in fdt_get_phandle() the nee=
d to
> validate its result through that function? That wouldn't fix existing (bu=
ggy)
> code but would at least make the API clearer.

That's not a bad idea.  I was mildly surprised we don't have something
like that already.

> Lastly, if none of the above can be implemented, the documentation of
> fdt_get_phandle() should at least reflect the fact that its result, even =
if
> non-zero, may not be a valid phandle.

Yes, we should definitely update that.

>=20
> >=20
> > > ---
> > >  libfdt/fdt_ro.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > index 9f6c551..7d1da6d 100644
> > > --- a/libfdt/fdt_ro.c
> > > +++ b/libfdt/fdt_ro.c
> > > @@ -507,6 +507,7 @@ const void *fdt_getprop(const void *fdt, int node=
offset,
> > > =20
> > >  uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
> > >  {
> > > +	uint32_t phandle;
> > >  	const fdt32_t *php;
> > >  	int len;
> > > =20
> > > @@ -519,7 +520,11 @@ uint32_t fdt_get_phandle(const void *fdt, int no=
deoffset)
> > >  			return 0;
> > >  	}
> > > =20
> > > -	return fdt32_ld_(php);
> > > +	phandle =3D fdt32_ld_(php);
> > > +	if (phandle > (uint32_t)FDT_MAX_PHANDLE)
> > > +		phandle =3D 0;
> > > +
> > > +	return phandle;
> > >  }
> > > =20
> > >  const char *fdt_get_alias_namelen(const void *fdt,
> >=20
>=20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--awiocHqvv+kReAVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLrUZMACgkQgypY4gEw
YSIwDQ//f43XLADOlh9cp1kpb2gb3M/cnMKzqzS7VG0LuCtZEfTHjiDUKZ5Ia5ZL
yBzBSbasE9zAS7ArSSsVZP12yPfdwKPCW5N8NMhqGme57x6Te3Mz8cpy08rANToI
IDsrf+fru6gTiZG0KbJG7DnkFMue/qKdtXm6FHIjy0zpFcfnblmpBNrYTQazDUvP
BkLBHZvfseKkRkzkDVNJXdQS0sGdzEDXzYd49/PpA0odL1T4rWmsAEz/JLRPxG42
VDcO8h54CFeQcWgC89yNlWawbJBLTr0G+i0mILRTUlmi6OPcrW7u0SaKMeXvAzHc
ivmxMMOzw4werPwnkahR2/zk6tfgpv1Ep1I2Cuwnb+nfs4O7qOcz5g0h3GBU7AQ3
j7XdkKPEB0Qo1PEsVRN5WYBBNdGspD3VVL6orftgmlyftrvy8NA4UArMGAfTpEja
f5VIyqosR+HZcpLwJlpivrvQ1BJNrj+o3IeeAFPIFnWi8jsx4kIL8rWqxtC7gmPu
hF2ipjcUqQRLKSvpz54uMTdaX8xyXayxHyYq6izAVh2U3atDToU4Ni6ZBYAbnJJU
RtvVQ1wMfu1jm/Sx/yaeLIPeWjD/3f+hy758n/mBa/bgFiIyazYQeSYI+ZAYEE/X
aHMK0VV/FGEbZQSRKKp7mgAQZYy8t80Gdc8BCDicJusVi+RXmgs=
=czpA
-----END PGP SIGNATURE-----

--awiocHqvv+kReAVY--
