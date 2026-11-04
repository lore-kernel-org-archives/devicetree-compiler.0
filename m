Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773701;
	b=Qmygq5HqNYA12BRdRY9HKB0QZU8N0ONv087D1CLLPxuOEmM0wpedRpT3kcO3JKBzViNn
	 Oq5+2vri0LZGDpCYC/t0udtnTdwAbLCyx2S6BEcCS6I+9fp4GKUd5olN/3y5eUnb5/2Dy
	 BJH0Uy3Y1SAG820fqeIFK6srNIb+X9/C2zf1osnj7i0VfKrgRaa6IQXKntq5Gz9eO7uqW
	 Yfe7SoPD9EjDm7ZQOqAzAoywmBamiik3EJMkcKTVgrelEkxKY7h7nKyMxsDbzVBhGiAy9
	 5Wj9GRepX+PzOhORJUQKq+gPkvmPbd9UneYXg3dvGRCtjqWAGIGHUfJX6GgbrPYJ/wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773701;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=pFBConkjacg++m6mEkCniM1e8q9NmxO5FBNtxqaoOj8=;
	b=xRYqPz5P3dO9h4D1b1hS7VR06ySP2ie5yke8NSFJ8fv7dkwsLDa4MbLBM+J7LigNDCSE
	 aujZTSyf+BS25ysN5rLpoam5xS1D+RK6O8OdfOXLZCCcX0xVKXDjEYuNCfk5JRIXB9M9y
	 z+GNMsxMYHxaI7P+PVggptsuTgit+eJg1/SQj12nJ6StjNQybuH5etoHFfgRvzKVSZxuG
	 K0puKKHojB5R7GS88D2jYEonUaHutPB2Xocmm3XaPuVXoffQOdTbDrQuBaawjiT1pWcEf
	 ZKNki/bRSeLQe3PJpu+ZFvS/ZZGbTgHaMBKSKG9FPL0ufDRXpsaW7u8jVavftzBkvww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=npwFhn57;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACCD606A31B
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 06:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ACCD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=npwFhn57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793773692;
	bh=pFBConkjacg++m6mEkCniM1e8q9NmxO5FBNtxqaoOj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npwFhn57WuCOg93gmQauy9WMCLWqP21ekEf8131vrni/WYTeWcSCyo0PNz7pj3g6/
	 GNHZFwY8UjfTdfTcJsbNb446ChOL3WnM7HXGGCB785Nt+E+AaTZ9klxRBZ34vL3f5B
	 ujDFeZL5Z/9IZ3eaTFYLPTYCUWRYMa3XpZa1b4nBo1ds3X3tpLy8TwMBZatElrai5i
	 2/wOdnz9Y3Hi2kTEkQvGv+teUx5RLKAnJbb+gX3IqqTPGh0cpW+6azOI3Vek6QsNLl
	 ZoUtwVdJYZDQ1wSPZ6fqwpjomWSAHxDwrk2cm4x5KW5nXtTIeplf8bjZ2Pga42fuh2
	 6TVdFL3+TnbAA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jKFqw6vQ7z4w1V; Wed, 04 Nov 2026 17:28:12 +1100 (AEDT)
Date: Wed, 4 Nov 2026 17:28:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 02/13] dtc: Add a list for the top-level fragments of a
 dts file
Message-ID: <aurQaUpssn-1us3U@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-3-sjg@chromium.org>
 <20261103180714.4b987a45@bootlin.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="poT7rBThfsjXm3oq"
Content-Disposition: inline
In-Reply-To: <20261103180714.4b987a45@bootlin.com>

--poT7rBThfsjXm3oq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 06:07:14PM +0100, Herve Codina wrote:
> On Sun,  1 Nov 2026 09:36:56 -0700
> Simon Glass <sjg@chromium.org> wrote:
>=20
> > A dts file is made up of top-level fragments: the root node, later
> > definitions of a node by label or path, and /delete-node/ or
> > /omit-if-no-ref/ with a reference. We would like to deal with each
> > fragment on its own before it is merged, for example to apply deletes
> > consistently or to run some checks on each one, but that requires
> > keeping the fragments apart. At present the parser merges each one into
> > the tree as soon as it is parsed.
> >=20
> > Add a struct fragment to hold one of these, functions to build one, to
> > append it to a list and to free it, and a list of them in struct dt_info
> >=20
> > These are not used yet.
> >=20
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >=20
> >  dtc.h      | 47 ++++++++++++++++++++++++++++++++++++++++++
> >  livetree.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 107 insertions(+)
> >=20
> > diff --git a/dtc.h b/dtc.h
> > index 473552e..c0d8e8f 100644
> > --- a/dtc.h
> > +++ b/dtc.h
> > @@ -322,12 +322,59 @@ struct reserve_info *chain_reserve_entry(struct r=
eserve_info *first,
> >  struct reserve_info *add_reserve_entry(struct reserve_info *list,
> >  				       struct reserve_info *new);
> > =20
> > +/*
> > + * A fragment is one top-level part of a dts file, after the header an=
d any
> > + * memory reservations: the root node, a later definition of a node wh=
ich
> > + * refers to it by label or path, or a /delete-node/ or /omit-if-no-re=
f/ with
> > + * a reference. Fragments are kept apart until they are merged into a =
single
> > + * tree.
> > + *
> > + * This is not the same as an overlay fragment (a fragment@N node), al=
though
> > + * in a plugin a fragment may become one when it is merged.
> > + */
> > +
> > +enum fragment_type {
> > +	FRAGMENT_ROOT,		/* / { ... }; */
> > +	FRAGMENT_REF,		/* [label:] &ref { ... }; */
> > +	FRAGMENT_DELETE_NODE,	/* /delete-node/ &ref; */
> > +	FRAGMENT_OMIT_IF_NO_REF, /* /omit-if-no-ref/ &ref; */
> > +};
> > +
> > +/*
> > + * Which fields are used depends on the type:
> > + *
> > + *   FRAGMENT_ROOT            node
> > + *   FRAGMENT_REF             ref, path_ref, ref_srcpos and node, plus=
 label
> > + *                            and label_srcpos if there is a label
> > + *   FRAGMENT_DELETE_NODE     ref, path_ref and ref_srcpos
> > + *   FRAGMENT_OMIT_IF_NO_REF  ref, path_ref and ref_srcpos
> > + *
> > + * Unused fields are NULL or false.
> > + */
> > +struct fragment {
> > +	enum fragment_type type;
> > +	char *ref;			/* label or path referred to */
> > +	bool path_ref;			/* ref is a path, i.e. &{...} */
> > +	struct srcpos *ref_srcpos;	/* position of ref */
> > +	char *label;			/* label to add to the target */
> > +	struct srcpos *label_srcpos;	/* position of label */
> > +	struct node *node;		/* the node definition */
> > +
> > +	struct fragment *next;		/* NULL at the end of the list */
> > +};
> > +
> > +struct fragment *build_fragment(enum fragment_type type, struct node *=
node);
> > +struct fragment *build_fragment_ref(char *ref, bool path_ref,
> > +				    struct srcpos *srcpos);
> > +struct fragment *append_fragment(struct fragment *list, struct fragmen=
t *new);
> > +void free_fragment(struct fragment *f);
> > =20
> >  struct dt_info {
> >  	unsigned int dtsflags;
> >  	struct reserve_info *reservelist;
> >  	uint32_t boot_cpuid_phys;
> >  	struct node *dt;		/* the device tree */
> > +	struct fragment *fragments;	/* not yet merged into dt */
>=20
> Why to we need the fragment list in struct dt_info ?
>=20
> This list is a temporary list built_dt_info() could have the list as para=
meter and
> handle it leading to the struct node *dt fully updated.
>=20
> Other function using the struct dt_info should never see the temporary fr=
agment=20
> list and so, IMHO, there is no reason to store it in the struct
> dt_info.

That's true for now, but the aim of this change is to delay the merge
until later.  We want to be able to do things (like some checks)
before the merge, but after dt_from_*() and therefore after
build_dt_info().

I'll agree that having the redundant dt and fragments list side by
side in the structure is a little ugly, but not enough that I think it
requires a rework at this stage.  I'm open to better names than
"dt_info", but nothing is immediately occurring to me.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--poT7rBThfsjXm3oq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrq0GkACgkQzQJF27ox
2GfckA//ev9elIXB6Yoc0W2lQMeLPxHX4kMt17CyEGFRqxBat2I5BWApUFts6vw9
MMh0TFytwTBh9y5Z+KTsUsNa36Tn0qrTb0Vw6aZAAzydmPnjr1CX8h+jqFfm3WuU
cbUNeu8gCdvwIkn2d1B+Qmns3J8VF0dv4HrkMGaEJHdVlefzIRNlIWavI68wzBhE
ABmNJdSYZ0c67eKBTQ96dfqYO3HPU4AxAY7l/kvUCXdPr7MHWD+y7ji8lu/VGOrH
LY5v/bOEISh6Payn5YFPvIzx6E3HvjK7HNm0uq8fQ83iw7bkRUqPPSxBDJ3bs8Jo
ElD8Ft1daMewEDNrMbuR3JUDKRY1/PQK4209BNm7y+yatGcN+dAVLkQFHC1nvzrg
TZ4/I1HDdLUCINoF1NN643k/Z7NvX5JQ+gLSN74/OSQIuOqwuTfnrDDtdB+PYPEf
lKriwRtdAQp1DhXtYFGebs02xbpQ90TGPK1YmDVUk3FZ0hOb0EVunmilqBwUjIZ0
pvjRgK+LVh1DePFVcBdMxwKd6aSWzHh9r+3nBbIHU1d/5VNXYjr1Cwr8QgwKmHrl
eIUXXdGXfU+8ZT+mwI/y7T3j2Rn59EGAjWs3/j2y4le/EpeRA2mQmzCWkuqc+MRZ
6xfam9Sbc/bMAOsUfWz16sb2ArvYTYzWypduhmoBLW/SufjBI4o=
=MxM6
-----END PGP SIGNATURE-----

--poT7rBThfsjXm3oq--
