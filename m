From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCHv2] libfdt: Internally perform potentially unaligned loads
Date: Wed, 25 Nov 2020 17:27:58 +1100
Message-ID: <20201125062758.GG521467@yekko.fritz.box>
References: <20201105165707.21916-1-trini@konsulko.com>
 <20201124054104.GC521467@yekko.fritz.box>
 <20201124122538.GI32272@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NJ3lxSTgSwfmyg6j"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1606285726;
        bh=+hIXT5qiJAs4STbayNuB7qM6rY5HIGTSrldPRO0+avM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P80MF6mxOiW0hJAuFIpssbcxTCgImG5L9qnQl7hvjgPgk6egAp36NGxd1vlfOSHgw
         VsITso3LyxS8aFRqxtwHj99hn+K4AZKNwvC/HS7NXceMq2Cjg9GVdF7oLfReAWRb/p
         pvUe5jslssH6LMP2NoDgJMQsdmc/rBXwbD321i0M=
Content-Disposition: inline
In-Reply-To: <20201124122538.GI32272@bill-the-cat>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


--NJ3lxSTgSwfmyg6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 07:25:38AM -0500, Tom Rini wrote:
> On Tue, Nov 24, 2020 at 04:41:04PM +1100, David Gibson wrote:
> > Hi Tom,
> >=20
> > Sorry I've taken so long to reply to this.  I was pretty busy, and
> > then on holiday away from my email.
>=20
> Thanks for explaining.
>=20
> > Overall I think this looks good, but there are some nits and some
> > inaccuracies in comments.
> >=20
> > On Thu, Nov 05, 2020 at 11:57:07AM -0500, Tom Rini wrote:
> > > Commits 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words"
> > > introduced changes to support unaligned reads for ARM platforms and
> > > 11738cf01f15 "libfdt: Don't use memcpy to handle unaligned reads on A=
RM"
> > > improved the performance of these helpers.
> > >=20
> > > On further discussion, while there are potential cases where we could=
 be
> > > used on platforms that do not fixup unaligned reads for us, making th=
is
> > > choice the default is very expensive in terms of binary size and acce=
ss
> > > time.  To address this, introduce and use new _fdt{32,64}_ld functions
> > > that call fdt{32,64}_to_cpu() as was done prior to the above mentioned
> > > commits.  Leave the existing load functions as unaligned-safe and
> > > include comments in both cases.
> >=20
> > So, leading underscore identifiers are off limits for libfdt - they're
> > reserved for the system libraries (the kernel can get away with it
> > because it doesn't use the system libraries, but we sometimes do).
> >=20
> > The usual workaround is to use a trailing underscore instead
> > (e.g. fdt_add_property_(), fdt_splice_struct_()).  Although.. the
> > convention with those (similar to the kernel's) is that foo() is
> > usually a safer wrapper implemented in terms of foo_().  In this case
> > fdtXX_ld() is not, and cannot, be implemented in terms of fdtXX_ld_().
>=20
> Alright, so not _foo().  foo__() to indicate it's special?

Just foo_() will be ok.  Two underscores doesn't really clarify
anything.  fdtXX_ld_aligned() would be clearer, but are also really
verbose.

> > [snip]
> > >  const char *fdt_get_alias_namelen(const void *fdt,
> > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > index b600c8d6dd41..3f36ed6d690f 100644
> > > --- a/libfdt/libfdt.h
> > > +++ b/libfdt/libfdt.h
> > > @@ -126,12 +126,10 @@ static inline void *fdt_offset_ptr_w(void *fdt,=
 int offset, int checklen)
> > >  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
> > > =20
> > >  /*
> > > - * Alignment helpers:
> > > - *     These helpers access words from a device tree blob.  They're
> > > - *     built to work even with unaligned pointers on platforms (ike
> > > - *     ARM) that don't like unaligned loads and stores
> > > + * External helpers to access words from a device tree blob.  These =
functions
> > > + * work in a manner that is safe on platforms that do not handle una=
ligned
> > > + * memory accesses and need special care in those cases.
> >=20
> > I actually prefer the old wording for the most part.  Could you just
> > tweak it for the changes, rather than rewriting the whole thing?
>=20
> I rewrote it because I didn't like the level of accuracy in the existing
> comment.  As Rob detailed in the other thread, yes, ARM could be a
> problem, but only if you don't enable the feature that's virtually
> always enabled on cores that have it.

I'd be fine with adjusting that to say "like certain ARM
configurations" or something similar.

> But, I don't feel so strongly
> about it that it's worth delaying this either.  Do you prefer:
>=20
> External helpers to access words from a device tree blob. They're built
> to work even with unaligned pointers on platforms (like ARM) that don't
> like unaligned loads and stores.
>=20
> Or:
>=20
> External helpers to access words from a device tree blob. They're built
> to work even with unaligned pointers on platforms that don't like
> unaligned loads and stores.

I'd prefer to give some example, but changing that example to be more
accurate would be welcome.
>=20
> > >   */
> > > -
> > >  static inline uint32_t fdt32_ld(const fdt32_t *p)
> > >  {
> > >  	const uint8_t *bp =3D (const uint8_t *)p;
> > > diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> > > index d4e0bd49c037..785b8b45ad1c 100644
> > > --- a/libfdt/libfdt_internal.h
> > > +++ b/libfdt/libfdt_internal.h
> > > @@ -46,6 +46,23 @@ static inline struct fdt_reserve_entry *fdt_mem_rs=
v_w_(void *fdt, int n)
> > >  	return (void *)(uintptr_t)fdt_mem_rsv_(fdt, n);
> > >  }
> > > =20
> > > +/*
> > > + * Internal helpers to access words from a device tree blob.  Assume=
 that we
> > > + * are on a platform where unaligned memory reads will be handled in=
 a graceful
> > > + * manner and that we do not need to ensure our reads are aligned.  =
If this is
> > > + * not the case there are _unaligned versions of these functions tha=
t follow
> > > + * and can be used.
> >=20
> > Can you adjust this to emphasise a couple of points:
> >  * These helpers are intended for structural elements of the DT,
> >    rather than for reading integers from within property values
> >  * These are safe if EITHER the platform handles unaligned loads OR
> >    they're given naturally aligned addresses.  Currently you only
> >    mention the first, but the second condition is really the one we
> >    rely on, since it should be true in practice for the users of these
> >    assuming a compliant dtb loaded at an 8-byte aligned address.
>=20
> OK.
>=20
> > Finally, given the history, I'm just a little paranoid that somebody
> > in future is going to hit some weird platform with some new weird
> > alignment issue.  So, I'm rather tempted to tie this to a new ASSUME
> > flag (though I'd be willing to have it default to on).  I'd envision:
> >   1. You use new internal load wrappers
> >   2. If can_assume(ALIGNED) or whatever, those wrappers expand to the
> >      load and byteswap only
> >   3. if !can_assume(ALIGNED), they call the external, unaligned-safe
> >      helpers instead
>=20
> But the entirety of the history of the problem is caught with the other
> patch, fail directly if we're not 8 byte aligned.

Hmm... yes, I guess that's true.  Ok, let's leave out a new assume
flag for now, we can add it if we really do hit a problem in future.

> That said, if we renumber the ASSUME values so that
> ASSUME_SAFE_UNALIGNED_LOAD, I would hope that the compiler would do the
> right thing and optimize things the way we need them over in U-Boot.
> But I have to experiment first there to be sure.

All the ASSUME flags are intended to work that way - they're
written as runtime tests in the source, but the expectation is that
they will be resolved at compile time.  If that's not true, it needs
addressing.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NJ3lxSTgSwfmyg6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+9+WoACgkQbDjKyiDZ
s5INUw//VkJZ3i4sBjuo7/ImYfVKEbeakRA4HNCsO9q1d7dPH/P0cV61C3F3JetP
CGDGTbSp/c7BSj9/ur5WdJV9pS1CEGCjOqejCuyb2qph42rP+3kRynJ/BjBbO6QS
sue9D6Yn7TnTYWZqbWXX+HjvvfGvLu2j4/lJDb4D+EO0sfqUMH+Bf0ITftn8Ms3l
EKpmyN/5pu+d31rPHJwW2DcD79qmfb1MxG3ica0aq3m0u/PQGpE978uEIjbHuRgu
ANIhu9Gcr2Q9WtLXNqC/bo+I/cqAr2gAxfNlOhSG/hmQl8eXan8XTK8CGHTTLzZw
q8SO1dVk+VwHy2Q+PJl1Aru9p820ZvxxNGqmq9S58BhhRCLp5b40x5hQVvwMdAlA
nfONzSMsIIc3vKCVuug1SZBApCgloohZIuXwYitqhh9wcsearSbEvVBtkAo7DLTJ
JVe4FOaZUF5Rpew6ffKGXB1nRKB8YmQkYUXm0mNiiWqbo8HnxbLA0CUoHL9V+3n2
b70fJHq1yIiYuK7m/oCJQleKQiWjlx0B8e6fFRH6gEUQRB5Nk8+PD86t9glTVt6V
TNX4rLOUAbOmugGEw+EwPF2vALpxAEH4509KAP6QSp30FLmFOkVQ7hf7jXh6JplJ
A4elXKAr2efgeVnQd3VEJYV7ILtwt6jGNnk6HjlHxhgoD+0bmak=
=qvC7
-----END PGP SIGNATURE-----

--NJ3lxSTgSwfmyg6j--
