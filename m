From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Internally perform potentially unaligned loads
Date: Thu, 5 Nov 2020 11:55:06 -0500
Message-ID: <20201105165506.GA5340@bill-the-cat>
References: <20201104222943.27508-1-trini@konsulko.com>
 <CAL_JsqKokvvjyUxe-skEvsRGisP+gm79VbbXFQuksitgkYHUcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5bpLHmJuVwROUVKC"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gbkGa/N2tQIU8bIgjHestvBSuYX+szRRVTMzti2+ECk=;
        b=NBYUjfUnvphDnHJZXT8nF1E85f++SuTJ9d9Iya+RDSF5r+DqaN/tl1U+uN/zjAjxo/
         t9TJ3Yu+YrHSa1JTP0q41msURel+mo9YR9qkd84lH0lsfYOkVAgXu0KIqMRwbolNQi5s
         rnqEdsRUtInWjGYK+UASV7DPNv4fbfzfWaYoo=
Content-Disposition: inline
In-Reply-To: <CAL_JsqKokvvjyUxe-skEvsRGisP+gm79VbbXFQuksitgkYHUcQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--5bpLHmJuVwROUVKC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 10:27:17AM -0600, Rob Herring wrote:
> On Wed, Nov 4, 2020 at 4:29 PM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >
> > Commits 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words"
> > introduced changes to support unaligned reads for ARM platforms and
> > 11738cf01f15 "libfdt: Don't use memcpy to handle unaligned reads on ARM"
> > improved the performance of these helpers.
> >
> > On further discussion, while there are potential cases where we could be
> > used on platforms that do not fixup unaligned reads for us, making this
> > choice the default is very expensive in terms of binary size and access
> > time.  To address this, introduce and use new _fdt{32,64}_ld functions
> > that call fdt{32,64}_to_cpu() as was done prior to the above mentioned
> > commits.  Leave the existing load functions as unaligned-safe and
> > include comments in both cases.
> >
> > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  fdtget.c        |  2 +-
> >  libfdt/fdt_ro.c | 20 ++++++++++----------
> >  libfdt/libfdt.h | 23 +++++++++++++++++++----
> >  3 files changed, 30 insertions(+), 15 deletions(-)
> >
> > diff --git a/fdtget.c b/fdtget.c
> > index 777582e2d45f..0f643eb20a2e 100644
> > --- a/fdtget.c
> > +++ b/fdtget.c
> > @@ -62,7 +62,7 @@ static int show_cell_list(struct display_info *disp, =
const char *data, int len,
> >         for (i =3D 0; i < len; i +=3D size, p +=3D size) {
> >                 if (i)
> >                         printf(" ");
> > -               value =3D size =3D=3D 4 ? fdt32_ld((const fdt32_t *)p) :
> > +               value =3D size =3D=3D 4 ? _fdt32_ld((const fdt32_t *)p)=
 :
> >                         size =3D=3D 2 ? (*p << 8) | p[1] : *p;
> >                 printf(fmt, value);
> >         }
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index 91cc6fefe374..414b417362a8 100644
> > --- a/libfdt/fdt_ro.c
> > +++ b/libfdt/fdt_ro.c
> > @@ -181,8 +181,8 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_=
t *address, uint64_t *size)
> >         if (!can_assume(VALID_INPUT) && !re)
> >                 return -FDT_ERR_BADOFFSET;
> >
> > -       *address =3D fdt64_ld(&re->address);
> > -       *size =3D fdt64_ld(&re->size);
> > +       *address =3D _fdt64_ld(&re->address);
> > +       *size =3D _fdt64_ld(&re->size);
> >         return 0;
> >  }
> >
> > @@ -192,7 +192,7 @@ int fdt_num_mem_rsv(const void *fdt)
> >         const struct fdt_reserve_entry *re;
> >
> >         for (i =3D 0; (re =3D fdt_mem_rsv(fdt, i)) !=3D NULL; i++) {
> > -               if (fdt64_ld(&re->size) =3D=3D 0)
> > +               if (_fdt64_ld(&re->size) =3D=3D 0)
> >                         return i;
> >         }
> >         return -FDT_ERR_TRUNCATED;
> > @@ -370,7 +370,7 @@ static const struct fdt_property *fdt_get_property_=
by_offset_(const void *fdt,
> >         prop =3D fdt_offset_ptr_(fdt, offset);
> >
> >         if (lenp)
> > -               *lenp =3D fdt32_ld(&prop->len);
> > +               *lenp =3D _fdt32_ld(&prop->len);
> >
> >         return prop;
> >  }
> > @@ -408,7 +408,7 @@ static const struct fdt_property *fdt_get_property_=
namelen_(const void *fdt,
> >                         offset =3D -FDT_ERR_INTERNAL;
> >                         break;
> >                 }
> > -               if (fdt_string_eq_(fdt, fdt32_ld(&prop->nameoff),
> > +               if (fdt_string_eq_(fdt, _fdt32_ld(&prop->nameoff),
> >                                    name, namelen)) {
> >                         if (poffset)
> >                                 *poffset =3D offset;
> > @@ -461,7 +461,7 @@ const void *fdt_getprop_namelen(const void *fdt, in=
t nodeoffset,
> >
> >         /* Handle realignment */
> >         if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
> > -           (poffset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >=3D =
8)
> > +           (poffset + sizeof(*prop)) % 8 && _fdt32_ld(&prop->len) >=3D=
 8)
> >                 return prop->data + 4;
> >         return prop->data;
> >  }
> > @@ -479,7 +479,7 @@ const void *fdt_getprop_by_offset(const void *fdt, =
int offset,
> >                 int namelen;
> >
> >                 if (!can_assume(VALID_INPUT)) {
> > -                       name =3D fdt_get_string(fdt, fdt32_ld(&prop->na=
meoff),
> > +                       name =3D fdt_get_string(fdt, _fdt32_ld(&prop->n=
ameoff),
> >                                               &namelen);
> >                         if (!name) {
> >                                 if (lenp)
> > @@ -488,13 +488,13 @@ const void *fdt_getprop_by_offset(const void *fdt=
, int offset,
> >                         }
> >                         *namep =3D name;
> >                 } else {
> > -                       *namep =3D fdt_string(fdt, fdt32_ld(&prop->name=
off));
> > +                       *namep =3D fdt_string(fdt, _fdt32_ld(&prop->nam=
eoff));
> >                 }
> >         }
> >
> >         /* Handle realignment */
> >         if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
> > -           (offset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >=3D 8)
> > +           (offset + sizeof(*prop)) % 8 && _fdt32_ld(&prop->len) >=3D =
8)
> >                 return prop->data + 4;
> >         return prop->data;
> >  }
> > @@ -519,7 +519,7 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeo=
ffset)
> >                         return 0;
> >         }
> >
> > -       return fdt32_ld(php);
> > +       return _fdt32_ld(php);
> >  }
> >
> >  const char *fdt_get_alias_namelen(const void *fdt,
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index b600c8d6dd41..d5f11d6df48c 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -126,12 +126,27 @@ static inline void *fdt_offset_ptr_w(void *fdt, i=
nt offset, int checklen)
> >  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
> >
> >  /*
> > - * Alignment helpers:
> > - *     These helpers access words from a device tree blob.  They're
> > - *     built to work even with unaligned pointers on platforms (ike
> > - *     ARM) that don't like unaligned loads and stores
> > + * Internal helpers to access words from a device tree blob.  Assume t=
hat we
> > + * are on a platform where unaligned memory reads will be handled in a=
 graceful
> > + * manner and that we do not need to ensure our reads are aligned.  If=
 this is
> > + * not the case there are _unaligned versions of these functions that =
follow
> > + * and can be used.
> >   */
> > +static inline uint32_t _fdt32_ld(const fdt32_t *p)
>=20
> As internal helpers, they should go in libfdt_internal.h.
>=20
> With that,
>=20
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

So, fdtget.c doesn't grab libfdt_internal.h.  Since we're talking a user
space program, I'm just going to leave it with the API callers instead.

--=20
Tom

--5bpLHmJuVwROUVKC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+kLmMACgkQFHw5/5Y0
tyw9ywv+Lo41WjxOkoM29CGcj4+tRViuZ1wnqHFHZ8vtyGUVhw1qkBVtVlzs228b
pOOLtx0cD4JEnjFAdhp3jS6bzaqW9vWRdy+JeVi/ncM8lcGAopi6Wj7smziB3vHp
BISMqitR8/1VU4QMystzvqsoV4G68ov23H6E3MOlrRSOx0aT32p5ivc1opOFGydv
tcDO4EHXBsPEcizLMgHfSrmSAKnLCoDDgKUOLb47NVwVM3m6ifpwBFRxmJeJlx9Z
sO0R3ZlmPlAG47D5ZMZNRm+fuMU/vVo/sJcObjmji2mOAWex2q+qb2JT/d94zIQt
sd1Gul0QO2SCF+0uP90rQyAZefyA33Sj39zmuFbAtxryKFJDupfL7ERftLkvWOeF
EUzO7F/AbvYVwEKBo3TC5R+YDx6sknRS7y+bQnkDR/fiwkNgYhvjTf81ZI4APSZ/
Q2YIutgzNxSYcYiyROkyQJlm4GU6Vz4ZEnFLGCi3BiogtK7bdrDdlsaST2Km0iJM
dgJGqFDI
=k8KM
-----END PGP SIGNATURE-----

--5bpLHmJuVwROUVKC--
