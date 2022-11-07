From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] libfdt: add fdt_alignprop
Date: Mon, 7 Nov 2022 19:30:54 +1100
Message-ID: <Y2jCPhdETrPDojh8@yekko>
References: <20221106141247.867853-1-bjorn@mork.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RsTFgKYmbdviH+rO"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1667814867;
        bh=mG917G7WEnCT70TghgcXN1b3dG+VqCJ8TpoUO8mBxTc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RKaQulLPRqihtOEpMJbK2WSFNsIl4b5Z+iOjpob/CR1yMPIX690OBK/6GT+THIEL5
         n5xlVyxL7N3qy4xGLEFpJYwN3LPT2qb5OFdMdqJmLKaom/9J1XUumvKWRCvxzwxB89
         k137XsRvDBAzl5EhRRvYsepne/7HHk0nuOAcoko8=
Content-Disposition: inline
In-Reply-To: <20221106141247.867853-1-bjorn-yOkvZcmFvRU@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--RsTFgKYmbdviH+rO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 06, 2022 at 03:12:47PM +0100, Bj=F8rn Mork wrote:
> Properties are sometimes used to store data with stricter alignment
> requirements than the 4-byte fdt tag alignment. Aligning the offset
> of the property data will alloe a client to directly address it,
> without reloaction, provided the fdt is loaded on a similarily
> aligned boundary.
>=20
> One known use-case for this is the U-Boot FIT images, which may
> embed nested fdt blobs inside properties of the outer FIT fdt.
> Although strongly discouraged, U-Boot can be configured to use these
> embedded blobs "in place". This is discouraged because if only will
> work if the offset of the property value, i.e. the embedded fdt,
> happens to match the 8-byte boundary required by the devicetree
> spec.
>=20
> Adding the ability to align property data allows U-Boot tools to
> reliably create FIT images for such use.
>=20
> Other use cases are currently not known, but anticipated.
>=20
> Signed-off-by: Bj=F8rn Mork <bjorn-yOkvZcmFvRU@public.gmane.org>
> ---
> Throwing out this idea as an RFC here to get an idea whether
> this route is worth following or not.  I've not yet tested this
> on the U-Boot community so I don't know if they actually want
> it.
>=20
> But I would not be surprised if people find other uses for this
> than my example use case.
>=20
> Please comment, if only to say "go away!" :-)

Adjusting the positioning and filling with nop tags is a clever idea.
The main concern I have about it is that it's pretty fragile.

Calling fdt_alignprop() with align the property you requested, but
could unalign any property that lies after it in the blob (even in a
wholly unrelated node).  So if you need to align multiple properties
in a tree, you have to do it in order, which is a somewhat unnatural
mode of using libfdt, at least with the higher level functions.

Such alignment is alsonot likely to survive processing by other tools
(e.g. dtc), or indeed using any other read-write libfdt function.
Essentially alignprop calls would have to be done as just about the
last step in fdt preparation.

Given that, I wonder if we could come up with some interface that
enforces - or at least encourages - that use mode alone.  Maybe some
kind of finalize function that aligns every property that needs it
(according to a callback, maybe?) then finishes with an fdt_pack().

> Bj=F8rn
>=20
>=20
>  libfdt/fdt_rw.c          | 26 ++++++++++++++++++++++++++
>  libfdt/fdt_wip.c         |  2 +-
>  libfdt/libfdt.h          | 30 ++++++++++++++++++++++++++++++
>  libfdt/libfdt_internal.h |  1 +
>  4 files changed, 58 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 3621d3651d3f..797132cfef74 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -330,6 +330,32 @@ int fdt_delprop(void *fdt, int nodeoffset, const cha=
r *name)
>  	return fdt_splice_struct_(fdt, prop, proplen, 0);
>  }
> =20
> +int fdt_alignprop(void *fdt, int nodeoffset, const char *name, size_t al=
ign)
> +{
> +	struct fdt_property *prop;
> +	int err, len, diff;
> +
> +	FDT_RW_PROBE(fdt);
> +
> +	if (align !=3D FDT_TAGALIGN(align))
> +		return -FDT_ERR_BADOFFSET;
> +
> +	prop =3D fdt_get_property_w(fdt, nodeoffset, name, &len);
> +	if (!prop)
> +		return len;
> +
> +	diff =3D FDT_ALIGN((uintptr_t)prop->data, align) - (uintptr_t)prop->dat=
a;
> +	if (!diff)
> +		return 0;
> +
> +	err =3D fdt_splice_struct_(fdt, prop, 0, diff);
> +	if (err)
> +		return err;
> +
> +	fdt_nop_region_(prop, diff);
> +	return 0;
> +}
> +
>  int fdt_add_subnode_namelen(void *fdt, int parentoffset,
>  			    const char *name, int namelen)
>  {
> diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> index c2d7566a67dc..10a75058f0f0 100644
> --- a/libfdt/fdt_wip.c
> +++ b/libfdt/fdt_wip.c
> @@ -48,7 +48,7 @@ int fdt_setprop_inplace(void *fdt, int nodeoffset, cons=
t char *name,
>  						   val, len);
>  }
> =20
> -static void fdt_nop_region_(void *start, int len)
> +void fdt_nop_region_(void *start, int len)
>  {
>  	fdt32_t *p;
> =20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index d0a2ed2741f3..6c4060c9e492 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -2016,6 +2016,36 @@ int fdt_appendprop_addrrange(void *fdt, int parent=
, int nodeoffset,
>   */
>  int fdt_delprop(void *fdt, int nodeoffset, const char *name);
> =20
> +/**
> + * fdt_alignprop - align property data to a given boundary
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node whose property to nop
> + * @name: name of the property to nop
> + * @align: requested alignment boundary in bytes (must be multiple of 4)
> + *
> + * fdt_alignprop() will align the property data to a chosen boundary
> + * by injecting nop tags in front of the given property.  The
> + * alignment must be a multiple of 4.
> + *
> + * This function may insert nop tags in the blob, and will therefore
> + * change the offsets of some existing nodes.
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
> + *		move the property to the new boundary
> + *	-FDT_ERR_NOTFOUND, node does not have the named property
> + *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
> + *		or the requested alignment was not a multiple of 4
> + *	-FDT_ERR_BADLAYOUT,
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_BADVERSION,
> + *	-FDT_ERR_BADSTATE,
> + *	-FDT_ERR_BADSTRUCTURE,
> + *	-FDT_ERR_TRUNCATED, standard meanings
> + */
> +int fdt_alignprop(void *fdt, int nodeoffset, const char *name, size_t al=
ign);
> +
>  /**
>   * fdt_add_subnode_namelen - creates a new node based on substring
>   * @fdt: pointer to the device tree blob
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 16bda1906a7b..ce4aedd19965 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -22,6 +22,7 @@ int fdt_check_node_offset_(const void *fdt, int offset);
>  int fdt_check_prop_offset_(const void *fdt, int offset);
>  const char *fdt_find_string_(const char *strtab, int tabsize, const char=
 *s);
>  int fdt_node_end_offset_(void *fdt, int nodeoffset);
> +void fdt_nop_region_(void *start, int len);
> =20
>  static inline const void *fdt_offset_ptr_(const void *fdt, int offset)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RsTFgKYmbdviH+rO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmNowjcACgkQgypY4gEw
YSJpEA/8CYhJEg8jYQAys9lkPrCnRuchkC46aVU+desrc0HMQSiCzoMwW0tZH2p8
s53EtHDSKKo794xNgBC/Y3i+yzlx3JVeYxxRxnnzxaRaRiOpEG5si6lgWt8D8fHP
VuUmIY1B7r5xVJrD/bLQTdkgXZyuhU70mOm+LmAWUS9Jztx72txW/oVJfhI4sgmn
PQuf4H7flJJfy8Da8emfwebRVLEWWaS59vH6TnUoSL6ccdTL/zSMM8BB6qngO8Kk
Hmlgu5vIj/HpvmYfqAgG+3HqWORok0921vVlIABaB0+A3ZTtFv7XjZplBaP9UEgT
AB3XXp6MHUR3UkEGtBVy3hR7WI5a1hR1DyOkHM/6bb0vAD6y4FK35p7dqtL5uHhL
DD24HINSd/a9iMiBQAfNapLj/gQlrhP3RRgR+nimRHcONqIDl6rH/07Btc8xoBfc
G1gUc8zJieEoO20Mew3Fyt6h4RsUHYNTFAun7drhXJm2Kg047Nf4KDYgYbqGq3jQ
b2eLWx7ODUaaIjE0bkm0lOI+ByoyPWmcvV7Ixily4fA5WHVnpzdlqKU62haR3hHv
UDWQ8J3By/RBQ02cwHIZsjWhC5Aukv1hkbnwrCgUX5wsTxbWBWdKZ1RSWiL3iV6Q
QXWPKtHBGkIuS54khjvIZlUvbEaUkQ0PNghqdlGRhpuhAIFgCT0=
=vvO1
-----END PGP SIGNATURE-----

--RsTFgKYmbdviH+rO--
