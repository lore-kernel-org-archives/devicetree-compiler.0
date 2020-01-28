From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 1/6] libfdt: De-inline fdt_header_size()
Date: Tue, 28 Jan 2020 19:24:02 +1100
Message-ID: <20200128082402.GG42099@umbus.fritz.box>
References: <20191113015422.67210-1-sjg@chromium.org>
 <20191113015422.67210-2-sjg@chromium.org>
 <20191120035121.GD5582@umbus.fritz.box>
 <CAPnjgZ0bP3Hmk7daknD275J0SxJR6XoxNXPustqKJ4k3POPqiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580200674;
        bh=sF616N/IxacJVR32HcIUWF3+WOI4L/LNPGVM1yX8lew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=STz/OzkhLnYh+scuvbXgzzPisR0zrpYrRxvebHUk3xCmePHgSFGiXbGvR/sNfz6k3
         rdniYzdmb6KOGVFOSTCbYJiU7rZgd6QCjQdva6CKuatKfO4V21jfQd3rphS2czFwFb
         rLqehJpTvsy6h4lwfCWmRpZKc0FyTcT44wutYaqg=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0bP3Hmk7daknD275J0SxJR6XoxNXPustqKJ4k3POPqiw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2019 at 06:07:16PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Tue, 19 Nov 2019 at 21:01, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >
> > On Tue, Nov 12, 2019 at 06:54:17PM -0700, Simon Glass wrote:
> > > There does not seem to be a strong reason to inline this function.
> >
> > Well.. I think my rationale was just that this function should be a
> > single load, followed by the call to fdt_header_size_().  I suspect
> > it's not called enough for removing that to balance out the code
> > overhead of an extra function.  Or have you made measurements which
> > show I'm wrong about that?
>=20
> Well it isn't called in U-Boot at all, other than via
> fdt_check_header(). The inlined version saves 16 bytes of code space
> on Thumb2.
>=20
> But even better would be to drop fdt_check_header_(). something like:
>=20
> size_t fdt_header_size(uint32_t version)
>    {
>    if (fdt_chk_version()) {
>       if (version <=3D 1)
>          return FDT_V1_SIZE;
>       else if (version <=3D 2)
>          return FDT_V2_SIZE;
>       else if (version <=3D 3)
>          return FDT_V3_SIZE;
>       else if (version <=3D 16)
>          return FDT_V16_SIZE;
>       }
>=20
> return FDT_V17_SIZE;
> }
>=20
> That saves an additional 8 bytes.

Uh.. I'm a little lost here.  Is what you're suggesting moving all of
fdt_check_header_() to the .h file, so it can be inlined (and
therefore constant folded)?

That could be a reasonable plan, though we'll need to make sure to
include an out-of-line version as well, for ABI compatibility.

> > > Also
> > > we are about to add some extra code to it which will increase its siz=
e.
> >
> > Will they, though?  As far as I can tell, the only changes you make to
> > this function in this series should be resolved at compile time.  So
> > that it should either be identical object code to what we have now, or
> > even simpler (in the assume case it will be returning a fixed value,
> > so in fact you'd probably get even better code size by allowing that
> > to be inlined).
>=20
> Hmm yes that's true about it resolving at compile time.
>=20
> But inlining a compile-time check presumably is no better than having
> it in a normal non-inlined function, since it is a compile-time check.
> For your second part, see the function I wrote above.
>=20
> >
> > > Move it into fdt.c and use a simple declaration in libfdt.h
> > >
> > > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > ---
> > >
> > > Changes in v4:
> > > - Add fdt_header_size to version.lds
> > >
> > > Changes in v3:
> > > - Add a new patch to de-inline fdt_header_size()
> > >
> > > Changes in v2: None
> > >
> > >  libfdt/fdt.c       | 5 +++++
> > >  libfdt/libfdt.h    | 9 +++++----
> > >  libfdt/version.lds | 1 +
> > >  tests/testutils.c  | 1 -
> > >  4 files changed, 11 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > > index d6ce7c0..3e37a4b 100644
> > > --- a/libfdt/fdt.c
> > > +++ b/libfdt/fdt.c
> > > @@ -70,6 +70,11 @@ size_t fdt_header_size_(uint32_t version)
> > >               return FDT_V17_SIZE;
> > >  }
> > >
> > > +size_t fdt_header_size(const void *fdt)
> > > +{
> > > +     return fdt_header_size_(fdt_version(fdt));
> > > +}
> > > +
> > >  int fdt_check_header(const void *fdt)
> > >  {
> > >       size_t hdrsize;
> > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > index fc4c496..48f375c 100644
> > > --- a/libfdt/libfdt.h
> > > +++ b/libfdt/libfdt.h
> > > @@ -266,11 +266,12 @@ fdt_set_hdr_(size_dt_struct);
> > >   * fdt_header_size - return the size of the tree's header
> > >   * @fdt: pointer to a flattened device tree
> > >   */
> > > +size_t fdt_header_size(const void *fdt);
> > > +
> > > +/**
> > > + * fdt_header_size_ - internal function which takes a version number
> > > + */
> > >  size_t fdt_header_size_(uint32_t version);
> > > -static inline size_t fdt_header_size(const void *fdt)
> > > -{
> > > -     return fdt_header_size_(fdt_version(fdt));
> > > -}
> > >
> > >  /**
> > >   * fdt_check_header - sanity check a device tree header
> > > diff --git a/libfdt/version.lds b/libfdt/version.lds
> > > index ae32924..7ab85f1 100644
> > > --- a/libfdt/version.lds
> > > +++ b/libfdt/version.lds
> > > @@ -20,6 +20,7 @@ LIBFDT_1.2 {
> > >               fdt_get_alias_namelen;
> > >               fdt_get_alias;
> > >               fdt_get_path;
> > > +                fdt_header_size;
> > >               fdt_supernode_atdepth_offset;
> > >               fdt_node_depth;
> > >               fdt_parent_offset;
> > > diff --git a/tests/testutils.c b/tests/testutils.c
> > > index 5e494c5..53cb35f 100644
> > > --- a/tests/testutils.c
> > > +++ b/tests/testutils.c
> > > @@ -261,7 +261,6 @@ void vg_prepare_blob(void *fdt, size_t bufsize)
> > >
> > >       VALGRIND_MAKE_MEM_UNDEFINED(blob, bufsize);
> > >       VALGRIND_MAKE_MEM_DEFINED(blob, FDT_V1_SIZE);
> > > -     VALGRIND_MAKE_MEM_DEFINED(blob, fdt_header_size(fdt));
> > >
> > >       if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
> > >               off_strings =3D fdt_off_dt_strings(fdt);
> >
>=20
> BTW I didn't see any other comments on this series so though I might
> as well reply on just this one patch.

Sorry, I've just had real trouble making time for this amongst my day
job.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4v76IACgkQbDjKyiDZ
s5LvEhAAt9/aCixB/vc4j/7rT+/lXddL7aHC0M4bReyNy14WJTPp/yiUpTfhEgvj
gOqlgdGKbc4k+cIdBtZ0zniT25oEKgUPZtbqwZ7EXheKOlyVak54R3t6P++87BUN
iotSO1dsdXzKRIRlIhG07QNSETdPsyaGCFgCK42blt9OEGQD0hajjmmznODgDMGt
CzhnHbm6hTh8gsK/QarX79nG54+4eoHwEGN7/ZU4skNtPdNbwOB7gA8ebXZxDiK8
zfPXYY2fCbrxoJI7i60CQ2KZjQy48nHj4Ks0GIH6sgzx27W6AZ2cFBJHE9urc2HK
9PLdjJIqgVekuTyU+ZFooNjDHxbgId4E7ZTsfBnOW8RlG+hHXRIbzXHLinasNyxS
mii4/LyppfRATU/1sTCtkL+r785TVz2zlUomhKFqCD+5+CnM+Rym6RoPxcSIIBYD
+oGUfhsp391Lx4o3zXhVJJ/5inn19naj6gzpInjGfY4Qh65AXxD9LKZENwwaC/oj
W6Iy5xVn+FBV+N3dvG4UFiQ0exaf+IgGz2EWEvG54G8KusVXodjEBBt8qMnhxLT9
FdO4XGI4+ridxdGrVKj2OgWGqNzvM1K5JT6Z/lxecKzq4zrkcKjmgrtFF81ogZw6
XGV3S68CGd1raXCEZQUc5F3I2kAtOhkyAHZ08+wDH2cSSavS2j8=
=Ld7j
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--
