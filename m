From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Fix the undefined behavior in fdt_num_mem_rsv()
Date: Tue, 20 Apr 2021 11:30:09 +1000
Message-ID: <YH4uoWoR+6IBB9sh@yekko.fritz.box>
References: <20210330095645.515056-1-bmeng.cn@gmail.com>
 <YGU9FH3WccMBrfl1@yekko.fritz.box>
 <CAEUhbmVsszFcUC8tEYmJ4djPvyDmXspDg-gb9rYZpm8zWwxc1g@mail.gmail.com>
 <YG5wZa/ti6klXEZQ@yekko.fritz.box>
 <CAEUhbmWeTpRHPdqMtcNWdF-ORJ0OXcMi1YJeN+KUpbkqGKvFGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1nnLbXG5ZRXRM3ZW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1618882214;
        bh=VOkhQRnxphLZLZxiIpWvWREN3MbOTORLT0efjkTTiLQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eaIc+AfPzNxZNxf2N/+A5nWWadimdizgkXVKAjEU9mQrRIfyAa0VS3UfAropzBXJ+
         eh0RZ1SCxkA/tcCfneRBuVybdGdlTkIqGqLbUmu+3CzXB0h8EEgKyy2dXNgIig00Ah
         yqkwmT4O3ALqHqwFuxzmoCOHtzsw3cwspyep84pY=
Content-Disposition: inline
In-Reply-To: <CAEUhbmWeTpRHPdqMtcNWdF-ORJ0OXcMi1YJeN+KUpbkqGKvFGg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Fangrui Song <maskray-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--1nnLbXG5ZRXRM3ZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 11:21:52AM +0800, Bin Meng wrote:
65;6203;1c> Hi David,
>=20
> On Thu, Apr 8, 2021 at 10:59 AM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Fri, Apr 02, 2021 at 12:52:43PM +0800, Bin Meng wrote:
> > > Hi David,
> > >
> > > On Thu, Apr 1, 2021 at 12:30 PM David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >
> > > > On Tue, Mar 30, 2021 at 05:56:45PM +0800, Bin Meng wrote:
> > > > > With LLVM 10.0.0+, the following codes in fdt_num_mem_rsv() does =
not
> > > > > work any more for an fdt that is at address 0:
> > > > >
> > > > >     for (i =3D 0; (re =3D fdt_mem_rsv(fdt, i)) !=3D NULL; i++) {
> > > > >         if (fdt64_ld_(&re->size) =3D=3D 0)
> > > > >             return i;
> > > > >     }
> > > > >
> > > > > Due to LLVM's optimization engine utilizing a UB in C, the follow=
ing
> > > > > code pattern:
> > > > >
> > > > >     if ((pointer + offset) !=3D NULL)
> > > > >
> > > > > is transformed into:
> > > > >
> > > > >     if (pointer !=3D NULL)
> > > > >
> > > > > because if pointer is NULL and offset is non-zero, the result of
> > > > > (pointer + offset) is UB. So LLVM is free to exploit such UB to
> > > > > perform some optimization.
> > > > >
> > > > > In this case, fdt_mem_rsv() gets inlined and returns (pointer + o=
ffset).
> > > > > And LLVM in turns emits codes to check fdt against NULL, which wo=
n't
> > > > > work for fdt at address 0.
> > > >
> > > > I don't think this really fixes anything.  It might fool LLVM into
> > > > doing what you need right now, but I don't see any reason to expect=
 it
> > > > will keep doing so.
> > >
> > > This specific UB optimizer changes [1] have been merged in LLVM for at
> > > least 1.5 years, and it has been there since LLVM 10/11.
> >
> > Ok, but that doesn't change the basic fact that this is just fooling
> > the compiler into behaving differently - it doesn't actually remove
> > the UB.
>=20
> As I explained, it removes the pre-condition of the UB optimizer
> effect. The UB of (pointer + offset) when pointer is NULL, is safe as
> long as it is not in the statement of flow control.

Yes, I understand what it's doing.  But the fact remains you're not
"fixing" any UB at all - the exact same UB is still there, you're just
working around the specific behaviour of LLVM's optimizer.

>=20
> >
> > > > IIUC, you're saying that the specific problem is that adding a
> > > > non-zero offset to a NULL pointer is UB, which happens inside
> > > > fdt_mem_rsv_() if n !=3D 0.  But with your patch, that UB still exi=
sts..
> > > >
> > >
> > > The UB exists only when the fdt pointer is NULL.
> >
> > Yes...
> >
> > > > > Signed-off-by: Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > ---
> > > > >
> > > > >  libfdt/fdt_ro.c | 17 +++++++++++++----
> > > > >  1 file changed, 13 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > > > index 17584da..4db4013 100644
> > > > > --- a/libfdt/fdt_ro.c
> > > > > +++ b/libfdt/fdt_ro.c
> > > > > @@ -157,18 +157,26 @@ int fdt_generate_phandle(const void *fdt, u=
int32_t *phandle)
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > -static const struct fdt_reserve_entry *fdt_mem_rsv(const void *f=
dt, int n)
> > > > > +static bool fdt_is_mem_rsv(const void *fdt, int n)
> > > > >  {
> > > > >       unsigned int offset =3D n * sizeof(struct fdt_reserve_entry=
);
> > > > >       unsigned int absoffset =3D fdt_off_mem_rsvmap(fdt) + offset;
> > > > >
> > > > >       if (!can_assume(VALID_INPUT)) {
> > > > >               if (absoffset < fdt_off_mem_rsvmap(fdt))
> > > > > -                     return NULL;
> > > > > +                     return false;
> > > > >               if (absoffset > fdt_totalsize(fdt) -
> > > > >                   sizeof(struct fdt_reserve_entry))
> > > > > -                     return NULL;
> > > > > +                     return false;
> > > > >       }
> > > > > +
> > > > > +     return true;
> > > > > +}
> > > > > +
> > > > > +static const struct fdt_reserve_entry *fdt_mem_rsv(const void *f=
dt, int n)
> > > > > +{
> > > > > +     if (!fdt_is_mem_rsv(fdt, n))
> > > > > +             return NULL;
> > > > >       return fdt_mem_rsv_(fdt, n);
> > > > >  }
> > > > >
> > > > > @@ -191,7 +199,8 @@ int fdt_num_mem_rsv(const void *fdt)
> > > > >       int i;
> > > > >       const struct fdt_reserve_entry *re;
> > > > >
> > > > > -     for (i =3D 0; (re =3D fdt_mem_rsv(fdt, i)) !=3D NULL; i++) {
> > > > > +     for (i =3D 0; fdt_is_mem_rsv(fdt, i); i++) {
> > > > > +             re =3D fdt_mem_rsv_(fdt, i);
> > > >
> > > > .. here ^^.
> > > >
> > > >
> > > > Basically if your compiled is going to optimized based on (NULL +
> > > > something) being UB, and the NULL pointer is address 0, that's
> > > > fundamentally incompatible with storing a device tree at address 0.
> > >
> > > As long as we don't put (pointer + offset) into a statement of flow
> > > control, it is fine. You can still get the correct value of (pointer +
> > > offset) when pointer is NULL and yes, it is still a UB but we can
> > > expect such usage is safe.
> >
> > People always say that about UB until it isn't.  This is just way to
> > subtle a distinction for me to be comfortable relying on it.
> >
> > Fundamentally the problem is that you want to store your fdt at
> > address zero, but that is just not compatible with your compiler,
>=20
> I am not sure it is a compatibility issue when language layers were
> defining the C spec without considering the fact that RAM address zero
> is absolutely OK on some systems. In normal programming environment we
> don't store data at address zero so NULL can be used as an indication
> of invalid pointer, but this practice may not apply on low-level
> environment like for example, when bootloader passes the FDT at
> address zero for kernel to handle it, or a bootloader environment
> where FDT is placed at a ROM address 0 ...

Yes.  A C implementation using address 0 as a NULL pointer is
incompatible with manipulating real data at address 0; that's exactly
what I'm saying.  Historically people have gotten away with it because
the compiler hasn't usually optimized this way, but as compilers get
smarter it has broken.

This change is just a really non-obvious workaround for a specific
compiler optimizer.

To fix this properly you need to either:
 * Use asm code to copy the fdt to a different address, then use C

or

 * Tell your compiler to be dumber and not apply this optimization.

> > since it considers that a NULL pointer.
>=20
> Regards,
> Bin
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1nnLbXG5ZRXRM3ZW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB+LqEACgkQbDjKyiDZ
s5JFPhAAlhF9tHGBZH+w79G4REJQFGkOVsCo5cO4I16zUV/SdEuvCyb+grXmo1Ki
CzZq9LjGwPkfiWMfhc8u/z/OIqCRK1BE6HH3+C3kOOn6iIb9CIM892o9UwkqXDhp
KL+8LsMAacok3QbFCHvsiuOIAb4eJihDJZXPizIrVyelMQy6vUnF5a50MRK4TNU4
v9qANBnisIioSD/GCidKqIprXuPwepki5mn8Uc1f8CLRwIYvJONoWbZvJIqHFZqH
pNhhJH03FDrqX1ZvH9++dtYTSsuD0YFxa0o8TF0QAn0N5nptel6eeBwmdAwHVbKY
xJ8FQQle+KdZEpQe+EQQovU57St7LNCF5L5v2WsAFWcFbwtJFjtXJ8rU02sqX3LS
OidOqRen7YaCB1q7Ies3u+uw90G+eaNk/PysoJ0acfHYQcRKkg262YDWuWOzjabK
2Jav+DLjmsfI0oRqfqQibkPEMaou/MatYvoLAhovgu7te5E85XOuUdmc99Z089o3
RZHPSMLDT5yULlZbpWCFoTgIO74O25jwTgycTSZ7ZJxCPbvzu0Q4sXzv+HuqyMta
Slvg1K5UR82aYIaRhX4/zltvS4xEyaxzNGXN/fvy/6ozZrD10Kk2Hw4cB2CxuDyo
UQrKEaQ2X2wGexUzAzT+DU/sGVBUFxbOxR4ie1NYGApHJfn+hgA=
=iwTB
-----END PGP SIGNATURE-----

--1nnLbXG5ZRXRM3ZW--
