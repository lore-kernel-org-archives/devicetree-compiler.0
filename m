From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCHv2] libfdt: Internally perform potentially unaligned loads
Date: Tue, 24 Nov 2020 16:41:04 +1100
Message-ID: <20201124054104.GC521467@yekko.fritz.box>
References: <20201105165707.21916-1-trini@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/qNnUp0NPtZJWkzn"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1606196473;
        bh=L+6MoWZWY6q4liQPMsqVDDrhRxmQzFy5sXPq5OIWUsE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=asICU4u+Crj73oBdJhZ6bhR6vTeanNnPeitIDvM314BXUuBZsAAa0l/4/8JkgF7XK
         5D/Cc1r60D+0KT+XAaMd+mcv3fPuI/HS72iR8Tu0gt3bRMy45Hr1CjAhJY5uWoFbyU
         GG+lzFsSfLPDg5Jg/EWqLtEs+8hCG1KbB458BNPk=
Content-Disposition: inline
In-Reply-To: <20201105165707.21916-1-trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


--/qNnUp0NPtZJWkzn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tom,

Sorry I've taken so long to reply to this.  I was pretty busy, and
then on holiday away from my email.

Overall I think this looks good, but there are some nits and some
inaccuracies in comments.

On Thu, Nov 05, 2020 at 11:57:07AM -0500, Tom Rini wrote:
> Commits 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words"
> introduced changes to support unaligned reads for ARM platforms and
> 11738cf01f15 "libfdt: Don't use memcpy to handle unaligned reads on ARM"
> improved the performance of these helpers.
>=20
> On further discussion, while there are potential cases where we could be
> used on platforms that do not fixup unaligned reads for us, making this
> choice the default is very expensive in terms of binary size and access
> time.  To address this, introduce and use new _fdt{32,64}_ld functions
> that call fdt{32,64}_to_cpu() as was done prior to the above mentioned
> commits.  Leave the existing load functions as unaligned-safe and
> include comments in both cases.

So, leading underscore identifiers are off limits for libfdt - they're
reserved for the system libraries (the kernel can get away with it
because it doesn't use the system libraries, but we sometimes do).

The usual workaround is to use a trailing underscore instead
(e.g. fdt_add_property_(), fdt_splice_struct_()).  Although.. the
convention with those (similar to the kernel's) is that foo() is
usually a safer wrapper implemented in terms of foo_().  In this case
fdtXX_ld() is not, and cannot, be implemented in terms of fdtXX_ld_().

[snip]
>  const char *fdt_get_alias_namelen(const void *fdt,
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index b600c8d6dd41..3f36ed6d690f 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -126,12 +126,10 @@ static inline void *fdt_offset_ptr_w(void *fdt, int=
 offset, int checklen)
>  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
> =20
>  /*
> - * Alignment helpers:
> - *     These helpers access words from a device tree blob.  They're
> - *     built to work even with unaligned pointers on platforms (ike
> - *     ARM) that don't like unaligned loads and stores
> + * External helpers to access words from a device tree blob.  These func=
tions
> + * work in a manner that is safe on platforms that do not handle unalign=
ed
> + * memory accesses and need special care in those cases.

I actually prefer the old wording for the most part.  Could you just
tweak it for the changes, rather than rewriting the whole thing?

>   */
> -
>  static inline uint32_t fdt32_ld(const fdt32_t *p)
>  {
>  	const uint8_t *bp =3D (const uint8_t *)p;
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index d4e0bd49c037..785b8b45ad1c 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -46,6 +46,23 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_w_=
(void *fdt, int n)
>  	return (void *)(uintptr_t)fdt_mem_rsv_(fdt, n);
>  }
> =20
> +/*
> + * Internal helpers to access words from a device tree blob.  Assume tha=
t we
> + * are on a platform where unaligned memory reads will be handled in a g=
raceful
> + * manner and that we do not need to ensure our reads are aligned.  If t=
his is
> + * not the case there are _unaligned versions of these functions that fo=
llow
> + * and can be used.

Can you adjust this to emphasise a couple of points:
 * These helpers are intended for structural elements of the DT,
   rather than for reading integers from within property values
 * These are safe if EITHER the platform handles unaligned loads OR
   they're given naturally aligned addresses.  Currently you only
   mention the first, but the second condition is really the one we
   rely on, since it should be true in practice for the users of these
   assuming a compliant dtb loaded at an 8-byte aligned address.

Finally, given the history, I'm just a little paranoid that somebody
in future is going to hit some weird platform with some new weird
alignment issue.  So, I'm rather tempted to tie this to a new ASSUME
flag (though I'd be willing to have it default to on).  I'd envision:
  1. You use new internal load wrappers
  2. If can_assume(ALIGNED) or whatever, those wrappers expand to the
     load and byteswap only
  3. if !can_assume(ALIGNED), they call the external, unaligned-safe
     helpers instead

> + */
> +static inline uint32_t _fdt32_ld(const fdt32_t *p)
> +{
> +	return fdt32_to_cpu(*p);
> +}
> +
> +static inline uint64_t _fdt64_ld(const fdt64_t *p)
> +{
> +	return fdt64_to_cpu(*p);
> +}
> +
>  #define FDT_SW_MAGIC		(~FDT_MAGIC)
> =20
>  /**********************************************************************/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/qNnUp0NPtZJWkzn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+8nO4ACgkQbDjKyiDZ
s5L01Q/9HRv2oGr5REdBIpRmuThQa4NZjGLzAl0+PaXNgV5tBKAVGUSFXhq+/aX8
GUQh5I/oj8qC4PMOub0Sfh2WLbTEneYIYuqheKBH2//6tnKczQF/5BKuI0GHCL+k
OxLfrnyHZlJRwmpVq/au9sM/4pfGKF+DC+KvPVJFqMLNqDCo669fxpbdqSaYLa5J
nas/JWtCrAllFanFyo3uTSXn1eSbjPJIHi0qk+Eg70tZut4+o05cwPXEnay2bfcz
cTxOxoFjGAD5F7pmO3j6jn/4poIxFVJg4phQu3+WFqZAS2+9QJJGUt9qOIIpZkGJ
/ir+WgOIVtkGeB38M1GhxkIidwWoyjdy54YdD+iaN+xWNgsu8H1bxtIonF+PFIOA
owxRf2sog4Txqg7C2R5hxZODQyBXVpB5DaPo9hMgORze5/w7bv+YBoI9nOoffcxy
IvkemK1i1qdH1GRnMB+o3rWft9pxX9hB+2fmZFkMcV/fhoafQ18BzqGoGjmmS6xL
lBPG+7TRFe36NW+kRxTQRGqnifijFDjvET8/39m10Xr8yx6Us+yIMLGCJX30/g2u
PAQAMXDo3Jpe5/cUoG48/S0MU8nYac/RT7KrXUdv28YevdLkEFM7Mwx7MTJ4XufW
V5BP9VnTUELEQveV7tYhnS2RNeAos2XaI0BSLb/t8bDD25Ia6QA=
=gBAi
-----END PGP SIGNATURE-----

--/qNnUp0NPtZJWkzn--
