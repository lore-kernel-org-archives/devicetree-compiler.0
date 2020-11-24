From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCHv2] libfdt: Internally perform potentially unaligned loads
Date: Tue, 24 Nov 2020 07:25:38 -0500
Message-ID: <20201124122538.GI32272@bill-the-cat>
References: <20201105165707.21916-1-trini@konsulko.com>
 <20201124054104.GC521467@yekko.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RKpxPxAhf7+cN71p"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X/zwNT5QV7Ln6JGzFGW9pmUn/QkrmQ66e1Gmrwu8aTk=;
        b=EM3x6qhu5IKJUGPGBCEkBWYP3NsCoflkrvBzWWIf2YJ8J/To5+brgnEdC7MNMY4lWd
         50b/kHa8CwaZGhbo3QoK/mresnJkJK32Cll9yP8SxgOsTCVM79R4Y06Gc+FhDxH/MBuc
         1Hs98K0EISVrgIvS/7lYjbolFvJIo2IBJGCxI=
Content-Disposition: inline
In-Reply-To: <20201124054104.GC521467-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


--RKpxPxAhf7+cN71p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 04:41:04PM +1100, David Gibson wrote:
> Hi Tom,
>=20
> Sorry I've taken so long to reply to this.  I was pretty busy, and
> then on holiday away from my email.

Thanks for explaining.

> Overall I think this looks good, but there are some nits and some
> inaccuracies in comments.
>=20
> On Thu, Nov 05, 2020 at 11:57:07AM -0500, Tom Rini wrote:
> > Commits 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words"
> > introduced changes to support unaligned reads for ARM platforms and
> > 11738cf01f15 "libfdt: Don't use memcpy to handle unaligned reads on ARM"
> > improved the performance of these helpers.
> >=20
> > On further discussion, while there are potential cases where we could be
> > used on platforms that do not fixup unaligned reads for us, making this
> > choice the default is very expensive in terms of binary size and access
> > time.  To address this, introduce and use new _fdt{32,64}_ld functions
> > that call fdt{32,64}_to_cpu() as was done prior to the above mentioned
> > commits.  Leave the existing load functions as unaligned-safe and
> > include comments in both cases.
>=20
> So, leading underscore identifiers are off limits for libfdt - they're
> reserved for the system libraries (the kernel can get away with it
> because it doesn't use the system libraries, but we sometimes do).
>=20
> The usual workaround is to use a trailing underscore instead
> (e.g. fdt_add_property_(), fdt_splice_struct_()).  Although.. the
> convention with those (similar to the kernel's) is that foo() is
> usually a safer wrapper implemented in terms of foo_().  In this case
> fdtXX_ld() is not, and cannot, be implemented in terms of fdtXX_ld_().

Alright, so not _foo().  foo__() to indicate it's special?

> [snip]
> >  const char *fdt_get_alias_namelen(const void *fdt,
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index b600c8d6dd41..3f36ed6d690f 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -126,12 +126,10 @@ static inline void *fdt_offset_ptr_w(void *fdt, i=
nt offset, int checklen)
> >  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
> > =20
> >  /*
> > - * Alignment helpers:
> > - *     These helpers access words from a device tree blob.  They're
> > - *     built to work even with unaligned pointers on platforms (ike
> > - *     ARM) that don't like unaligned loads and stores
> > + * External helpers to access words from a device tree blob.  These fu=
nctions
> > + * work in a manner that is safe on platforms that do not handle unali=
gned
> > + * memory accesses and need special care in those cases.
>=20
> I actually prefer the old wording for the most part.  Could you just
> tweak it for the changes, rather than rewriting the whole thing?

I rewrote it because I didn't like the level of accuracy in the existing
comment.  As Rob detailed in the other thread, yes, ARM could be a
problem, but only if you don't enable the feature that's virtually
always enabled on cores that have it.   But, I don't feel so strongly
about it that it's worth delaying this either.  Do you prefer:

External helpers to access words from a device tree blob. They're built
to work even with unaligned pointers on platforms (like ARM) that don't
like unaligned loads and stores.

Or:

External helpers to access words from a device tree blob. They're built
to work even with unaligned pointers on platforms that don't like
unaligned loads and stores.

> >   */
> > -
> >  static inline uint32_t fdt32_ld(const fdt32_t *p)
> >  {
> >  	const uint8_t *bp =3D (const uint8_t *)p;
> > diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> > index d4e0bd49c037..785b8b45ad1c 100644
> > --- a/libfdt/libfdt_internal.h
> > +++ b/libfdt/libfdt_internal.h
> > @@ -46,6 +46,23 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_=
w_(void *fdt, int n)
> >  	return (void *)(uintptr_t)fdt_mem_rsv_(fdt, n);
> >  }
> > =20
> > +/*
> > + * Internal helpers to access words from a device tree blob.  Assume t=
hat we
> > + * are on a platform where unaligned memory reads will be handled in a=
 graceful
> > + * manner and that we do not need to ensure our reads are aligned.  If=
 this is
> > + * not the case there are _unaligned versions of these functions that =
follow
> > + * and can be used.
>=20
> Can you adjust this to emphasise a couple of points:
>  * These helpers are intended for structural elements of the DT,
>    rather than for reading integers from within property values
>  * These are safe if EITHER the platform handles unaligned loads OR
>    they're given naturally aligned addresses.  Currently you only
>    mention the first, but the second condition is really the one we
>    rely on, since it should be true in practice for the users of these
>    assuming a compliant dtb loaded at an 8-byte aligned address.

OK.

> Finally, given the history, I'm just a little paranoid that somebody
> in future is going to hit some weird platform with some new weird
> alignment issue.  So, I'm rather tempted to tie this to a new ASSUME
> flag (though I'd be willing to have it default to on).  I'd envision:
>   1. You use new internal load wrappers
>   2. If can_assume(ALIGNED) or whatever, those wrappers expand to the
>      load and byteswap only
>   3. if !can_assume(ALIGNED), they call the external, unaligned-safe
>      helpers instead

But the entirety of the history of the problem is caught with the other
patch, fail directly if we're not 8 byte aligned.

That said, if we renumber the ASSUME values so that
ASSUME_SAFE_UNALIGNED_LOAD, I would hope that the compiler would do the
right thing and optimize things the way we need them over in U-Boot.
But I have to experiment first there to be sure.

--=20
Tom

--RKpxPxAhf7+cN71p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+8+74ACgkQFHw5/5Y0
tyyaSwwAmcTYLvZZFGTDfwzBuuqwI3gnEZ5bzOlGPJy7z0qOG1OXk68yRiBJV75X
Liqct+HTO0pghzrSDdu3uvm0mdBMtiDegpJ2wHtGkvq2unLddPwMLYrki/+QjvPo
PYAN/j5hYE5xrOJjaBJtYf84EEsTkwOWRmJH7AexkTkNM8u45Rgm+UeSz8YkHeTu
IAMpzDE6ZsGEaWiSoTyK2XFGdrSr/JhsVZundpkVBj8tycK/OXOhzxqcBWDA/2Th
P/OpcA2hewOuD0olE8sKhm4Uwe4VP5nJHfkYidHaPmfY227TGkS8+8Vcfs+fiOKK
f3HtZIJFt8aWi0RcM9xpto7yagKYpSJ3LdFfc3wUyRgPMhyt4CCmpZ1N1e7f/R0d
vEJKFFS8yZA0TbQltQT0nDn95AlBAmvyQ6+1l39i3X7H7OtGOPKwRTfmcJM7wozb
dzaO5TqoQ+rnvB0gX68WWcVPW3P+ItEvxMTm2IlFbqjy5SIN4XrLHTkOng86cex7
8Z+ui+6U
=A43I
-----END PGP SIGNATURE-----

--RKpxPxAhf7+cN71p--
