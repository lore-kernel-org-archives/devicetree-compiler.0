From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Fix the undefined behavior in fdt_num_mem_rsv()
Date: Thu, 8 Apr 2021 12:54:29 +1000
Message-ID: <YG5wZa/ti6klXEZQ@yekko.fritz.box>
References: <20210330095645.515056-1-bmeng.cn@gmail.com>
 <YGU9FH3WccMBrfl1@yekko.fritz.box>
 <CAEUhbmVsszFcUC8tEYmJ4djPvyDmXspDg-gb9rYZpm8zWwxc1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OmjJuRom+ZMSLfON"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1617850792;
        bh=vDxqGnoDn2I9gJre7SRLCBgpbCKZ1WMuJj4ItYYvZKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LUXqsTetlEqqx1FpylNOydnoPozMloOFOnPXObCpmO/J3YK/bz/mJi8M8I8XW38Xy
         iFCPgrXJ3gkwd5L2el8h2xFmTITim2l+BZHtc+wXgTmwowjaK6uq6ZcGfKhDNKsf5f
         2ngBXgNcMmqe86c4GmexycBO1GJ+DHSo0V9hutFo=
Content-Disposition: inline
In-Reply-To: <CAEUhbmVsszFcUC8tEYmJ4djPvyDmXspDg-gb9rYZpm8zWwxc1g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Fangrui Song <maskray-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--OmjJuRom+ZMSLfON
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 02, 2021 at 12:52:43PM +0800, Bin Meng wrote:
> Hi David,
>=20
> On Thu, Apr 1, 2021 at 12:30 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Tue, Mar 30, 2021 at 05:56:45PM +0800, Bin Meng wrote:
> > > With LLVM 10.0.0+, the following codes in fdt_num_mem_rsv() does not
> > > work any more for an fdt that is at address 0:
> > >
> > >     for (i =3D 0; (re =3D fdt_mem_rsv(fdt, i)) !=3D NULL; i++) {
> > >         if (fdt64_ld_(&re->size) =3D=3D 0)
> > >             return i;
> > >     }
> > >
> > > Due to LLVM's optimization engine utilizing a UB in C, the following
> > > code pattern:
> > >
> > >     if ((pointer + offset) !=3D NULL)
> > >
> > > is transformed into:
> > >
> > >     if (pointer !=3D NULL)
> > >
> > > because if pointer is NULL and offset is non-zero, the result of
> > > (pointer + offset) is UB. So LLVM is free to exploit such UB to
> > > perform some optimization.
> > >
> > > In this case, fdt_mem_rsv() gets inlined and returns (pointer + offse=
t).
> > > And LLVM in turns emits codes to check fdt against NULL, which won't
> > > work for fdt at address 0.
> >
> > I don't think this really fixes anything.  It might fool LLVM into
> > doing what you need right now, but I don't see any reason to expect it
> > will keep doing so.
>=20
> This specific UB optimizer changes [1] have been merged in LLVM for at
> least 1.5 years, and it has been there since LLVM 10/11.

Ok, but that doesn't change the basic fact that this is just fooling
the compiler into behaving differently - it doesn't actually remove
the UB.

> > IIUC, you're saying that the specific problem is that adding a
> > non-zero offset to a NULL pointer is UB, which happens inside
> > fdt_mem_rsv_() if n !=3D 0.  But with your patch, that UB still exists..
> >
>=20
> The UB exists only when the fdt pointer is NULL.

Yes...=20

> > > Signed-off-by: Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >
> > >  libfdt/fdt_ro.c | 17 +++++++++++++----
> > >  1 file changed, 13 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > index 17584da..4db4013 100644
> > > --- a/libfdt/fdt_ro.c
> > > +++ b/libfdt/fdt_ro.c
> > > @@ -157,18 +157,26 @@ int fdt_generate_phandle(const void *fdt, uint3=
2_t *phandle)
> > >       return 0;
> > >  }
> > >
> > > -static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, =
int n)
> > > +static bool fdt_is_mem_rsv(const void *fdt, int n)
> > >  {
> > >       unsigned int offset =3D n * sizeof(struct fdt_reserve_entry);
> > >       unsigned int absoffset =3D fdt_off_mem_rsvmap(fdt) + offset;
> > >
> > >       if (!can_assume(VALID_INPUT)) {
> > >               if (absoffset < fdt_off_mem_rsvmap(fdt))
> > > -                     return NULL;
> > > +                     return false;
> > >               if (absoffset > fdt_totalsize(fdt) -
> > >                   sizeof(struct fdt_reserve_entry))
> > > -                     return NULL;
> > > +                     return false;
> > >       }
> > > +
> > > +     return true;
> > > +}
> > > +
> > > +static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, =
int n)
> > > +{
> > > +     if (!fdt_is_mem_rsv(fdt, n))
> > > +             return NULL;
> > >       return fdt_mem_rsv_(fdt, n);
> > >  }
> > >
> > > @@ -191,7 +199,8 @@ int fdt_num_mem_rsv(const void *fdt)
> > >       int i;
> > >       const struct fdt_reserve_entry *re;
> > >
> > > -     for (i =3D 0; (re =3D fdt_mem_rsv(fdt, i)) !=3D NULL; i++) {
> > > +     for (i =3D 0; fdt_is_mem_rsv(fdt, i); i++) {
> > > +             re =3D fdt_mem_rsv_(fdt, i);
> >
> > .. here ^^.
> >
> >
> > Basically if your compiled is going to optimized based on (NULL +
> > something) being UB, and the NULL pointer is address 0, that's
> > fundamentally incompatible with storing a device tree at address 0.
>=20
> As long as we don't put (pointer + offset) into a statement of flow
> control, it is fine. You can still get the correct value of (pointer +
> offset) when pointer is NULL and yes, it is still a UB but we can
> expect such usage is safe.

People always say that about UB until it isn't.  This is just way to
subtle a distinction for me to be comfortable relying on it.

Fundamentally the problem is that you want to store your fdt at
address zero, but that is just not compatible with your compiler,
since it considers that a NULL pointer.

> > >               if (fdt64_ld_(&re->size) =3D=3D 0)
> > >                       return i;
> > >       }
> >
>=20
> PS: I added Fangrui who is an LLVM developer to this loop and he can
> provide a better explanation than me from the LLVM perspective.
>=20
> [1] https://reviews.llvm.org/D66608
>=20
> Regards,
> Bin
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OmjJuRom+ZMSLfON
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBucGUACgkQbDjKyiDZ
s5L3hRAAjZy/Y/q8kt2EdBY4n/zkhprtJSyqs/7z3YtRwUZ0r6UnusYzDpfVqvy3
b2Ch/f5kxm0AmTS8Bff3DAOWbb1PmUy0WT/Vx+IfLynLEGeDxdY7dvo5xQ5WUlSP
106EAl6ta7x5lL/VEDcptGCOv+mKZdK/uWyehDgDTYGzcdLQtfP0EoxnqqUk5m+v
lxz+Lua+58//MEGOFIOc+x4F5mMmG2r3XAn1++YBmXuQRNEm50qpxypzfmPsPeTx
PdL6F0DvPqznq3BLjmANXQovZXuWe22rhNFeZPlTyc2BFtzpkkLxQZILj7sDyB9F
zkyD3PBsN9/GLaNkuPe8Pux9YSoYrcEJ3ZeA6aI8IIE+CxM74j0P+Sxjakk6XNXH
dM/WCNEOPBLTrdg/ogZCA5Ke591M6Y3Pt/r67YCksZk0VYH8jzunVD6tunxS9nWo
bzQdOIEAwpjtYl7uQMGSRcLTcMvMrM/uSsCK9j/Lna/6oTWWmT3ccB1l777EfTEd
HQGNe596guU223CV0svIA0EvWyWEgIprwEijSDVEZDqCU3O989E9xMmPGgHfnduX
fhVEQhQJjKs8TnjrcGWyfci0/0ePEjUVX8ZauFwlQk6s55sGxyk8l47otMGVZpJB
fZ7a3inIaQzeHWC7tTUsvKK3yG6fLK7CpWSt3dC7fipSL8QL+BI=
=KzzG
-----END PGP SIGNATURE-----

--OmjJuRom+ZMSLfON--
