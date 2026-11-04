Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775115;
	b=0u7v8uojdQkaQRo150+0keVM6T9OsWLsQxIgQmXR1RGEhJAIkmux5v35L/2XSxPIw3/t
	 89z91lztAA9sPVBD9rOccOlBpg7S6dBLmgUX6e28lImrI0tzSsZmRdm7u41Roug8YCmMZ
	 NIbEohZ3Wlpstvzzt5VESqZ6zKmrNnUwpqgm4mFeOkAVsG3VdYtcFmVKAmOQQKNzCEFYT
	 4snKEE1FCGgYXbMrI73br2/wTfplUAOQ2FfdbLvZcnCiFx8NzPumF65symdBDCjkKtXII
	 S7rTM+H6+/dZFV7SGJ1UTkj+mTedp13Ff3wnINi9WUqAau+TkMon6o9+G3nHNgp4Zhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775115;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=X1PxyizCYy9GXWgpkKjPeKxyjutWNdaX/StSXI843d4=;
	b=flC9EXWkx9GsA5A0bxo6W8WDCHjlBv9AJ0RUTTzuJYJv7tpdOXDt7zL50T35BEGVC7a1
	 Xt5fSYhQ6blW8PdcA6nR7fBBl72S+o2NMH1YpzwTXMSSs0JLtdGiKz8U5WnMMLe4MQSv+
	 sfKiEKGVk7MV/c+B5pjRKys68aMZZBGpf8rwA39f0QYC2Y/ubCfqfQiioaOiIL0edwzdz
	 AMlBWpawHtAbkL+NW70woVA0ujaBXH6tCd/TLio0WlYoh3T4fFzQMFm7pBlUp4HV7EgsN
	 vnOw5LpFfOlcl9fUBHiYf3iikEdsen1deiJjm0y2QsmQhwDGUi4wIld405zv97Df+jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=T7heXVDX;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC4E606A31B
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 06:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC4E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=T7heXVDX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793775111;
	bh=X1PxyizCYy9GXWgpkKjPeKxyjutWNdaX/StSXI843d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7heXVDXrLTAB9CSiLFDJBKKRDm9jbcYFZhwXzYLqhQ6s688dLliwhYEdEwk6hOLV
	 5R3ccWlgqpuwH2SUMAabTvRfHZan8Z6dx+pZA7AfqACG3+Q6BOYGPje7QFL6OV2L+L
	 +TblHtluiKHJL8bBt4HdDkZ2pS7trxTq9qA10SVoyeQn5DTwOm8uTB8qD/bfCOv/ua
	 DTo2n+SDt8o1aeTyG2PiQpmgjlTkV4eM8NRVJ6GVP4o0ThI4Kb4sCLatXZIn7mPlk9
	 +EXBEf1K78Uuo/khFczPhIVaDJ+VyNdl5HLGYRLkBvZFy1d72QONugCjlCA7E0VB2i
	 8Mx3J2lxWtN2w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jKGMC5KQVz4wDJ; Wed, 04 Nov 2026 17:51:51 +1100 (AEDT)
Date: Wed, 4 Nov 2026 17:49:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 11/13] dtc: Add helpers for the errors when merging a
 fragment
Message-ID: <aurVWI8-FFnIwdGh@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-12-sjg@chromium.org>
 <20261103182344.4c9c488e@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="VyDTs1ESlAWuiQg0"
Content-Disposition: inline
In-Reply-To: <20261103182344.4c9c488e@bootlin.com>

--VyDTs1ESlAWuiQg0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 06:23:44PM +0100, Herve Codina wrote:
> On Sun,  1 Nov 2026 09:37:05 -0700
> Simon Glass <sjg@chromium.org> wrote:
>=20
> > Four of the merge functions look up the node which a fragment refers to
> > and report 'Label or path not found' if it is missing, and three check
> > for a label-relative reference in a plugin. Each of these has its own
> > copy of the error, so a change to a message or its position must be made
> > in several places.
> >=20
> > Add lookup_ref() to look up the node, reporting an error if it is not
> > found, and check_relative_ref() to report a label-relative reference.
> > Use these in the merge functions.
> >=20
> > The output does not change.
> >=20
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >=20
> >  livetree.c | 90 +++++++++++++++++++++++++++++-------------------------
> >  1 file changed, 49 insertions(+), 41 deletions(-)
> >=20
> > diff --git a/livetree.c b/livetree.c
> > index 6a290fb..1e012d4 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -548,6 +548,40 @@ static bool is_ref_relative(const char *ref)
> >  	return ref[0] !=3D '/' && strchr(&ref[1], '/');
> >  }
> > =20
> > +/*
> > + * Report an error at pos if a fragment uses a label-relative referenc=
e, which
> > + * a plugin does not support
> > + *
> > + * Returns true if there is an error
> > + */
> > +static bool check_relative_ref(struct fragment *f, struct srcpos *pos)
> > +{
> > +	if (!is_ref_relative(f->ref))
> > +		return false;
> > +	srcpos_error(pos, "Error",
> > +		     "Label-relative reference %s not supported in plugin",
> > +		     f->ref);
>=20
> You suppose that srcpos is valid and so this function and remaining ones =
are
> be called only from dt_from_source() with the parsing done by dtc-parser.=
y.
>=20
> Not sure that this is a good assumption for the future.
>=20
> IHMO, it will be better to decouple those functions from the type of pars=
ing
> or just add a simple 'if (pos)' before calling srcpos_error().

It's a good point that eventually we'll want to get fragments from
dtbos as well as from source, in which case we won't have srcpos
information.  But when we are coming from source, the position
information is valuable.

This case of maybe-present srcpos information is common enough, that
the way to address it might be to alter srcpos_string() to accept
NULL, returning "<unknown>" or some other suitable placeholder when
srcpos information isn't available.

>=20
> Best regards,
> Herv=E9
>=20
> > +
> > +	return true;
> > +}
> > +
> > +/*
> > + * Look up the node which a fragment refers to, reporting an error if =
it is
> > + * not found
> > + *
> > + * Returns the node, or NULL if it is not found
> > + */
> > +static struct node *lookup_ref(struct node *dt, struct fragment *f)
> > +{
> > +	struct node *target =3D get_node_by_ref(dt, f->ref);
> > +
> > +	if (!target)
> > +		srcpos_error(f->ref_srcpos, "Error",
> > +			     "Label or path %s not found", f->ref);
> > +
> > +	return target;
> > +}
> > +
> >  /*
> >   * Make the tree at *dtp from a first fragment which refers to a label=
 or path,
> >   * rather than being the root node. This is only valid in a plugin, wh=
ere the
> > @@ -557,17 +591,14 @@ static bool is_ref_relative(const char *ref)
> >   */
> >  static bool merge_first_ref(struct node **dtp, struct fragment *f, boo=
l plugin)
> >  {
> > -	bool error =3D false;
> > +	bool error;
> > =20
> > -	if (!plugin) {
> > +	if (plugin) {
> > +		error =3D check_relative_ref(f, f->node->srcpos);
> > +	} else {
> >  		srcpos_error(f->node->srcpos, "Error",
> >  			     "Label or path %s not found", f->ref);
> >  		error =3D true;
> > -	} else if (is_ref_relative(f->ref)) {
> > -		srcpos_error(f->node->srcpos, "Error",
> > -			     "Label-relative reference %s not supported in plugin",
> > -			     f->ref);
> > -		error =3D true;
> >  	}
> >  	/* Make a new, empty tree with a fragment@N node for the reference */
> >  	*dtp =3D add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
> > @@ -584,20 +615,12 @@ static bool merge_first_ref(struct node **dtp, st=
ruct fragment *f, bool plugin)
> >   */
> >  static bool merge_labelled_ref(struct node *dt, struct fragment *f, bo=
ol plugin)
> >  {
> > -	struct node *target =3D get_node_by_ref(dt, f->ref);
> > -	bool error =3D false;
> > +	struct node *target;
> > +	bool error =3D plugin && check_relative_ref(f, f->label_srcpos);
> > =20
> > -	if (plugin && is_ref_relative(f->ref)) {
> > -		srcpos_error(f->label_srcpos, "Error",
> > -			     "Label-relative reference %s not supported in plugin",
> > -			     f->ref);
> > -		error =3D true;
> > -	}
> > -	if (!target) {
> > -		srcpos_error(f->ref_srcpos, "Error",
> > -			     "Label or path %s not found", f->ref);
> > +	target =3D lookup_ref(dt, f);
> > +	if (!target)
> >  		return true;
> > -	}
> >  	add_label(&target->labels, f->label);
> >  	merge_nodes(target, f->node);
> > =20
> > @@ -615,26 +638,17 @@ static bool merge_path_ref(struct node *dt, struc=
t fragment *f, bool plugin)
> >  	struct node *target;
> > =20
> >  	if (plugin) {
> > -		bool error =3D false;
> > +		bool error =3D check_relative_ref(f, f->ref_srcpos);
> > =20
> > -		if (is_ref_relative(f->ref)) {
> > -			srcpos_error(f->ref_srcpos, "Error",
> > -				     "Label-relative reference %s not supported in plugin",
> > -				     f->ref);
> > -			error =3D true;
> > -		}
> >  		/* Add a fragment@N node which applies the node at the path */
> >  		add_orphan_node(dt, f->node, f->ref);
> > =20
> >  		return error;
> >  	}
> > =20
> > -	target =3D get_node_by_ref(dt, f->ref);
> > -	if (!target) {
> > -		srcpos_error(f->ref_srcpos, "Error",
> > -			     "Label or path %s not found", f->ref);
> > +	target =3D lookup_ref(dt, f);
> > +	if (!target)
> >  		return true;
> > -	}
> >  	merge_nodes(target, f->node);
> > =20
> >  	return false;
> > @@ -672,13 +686,10 @@ static bool merge_label_ref(struct node *dt, stru=
ct fragment *f, bool plugin)
> >   */
> >  static bool merge_delete_node(struct node *dt, struct fragment *f)
> >  {
> > -	struct node *target =3D get_node_by_ref(dt, f->ref);
> > +	struct node *target =3D lookup_ref(dt, f);
> > =20
> > -	if (!target) {
> > -		srcpos_error(f->ref_srcpos, "Error",
> > -			     "Label or path %s not found", f->ref);
> > +	if (!target)
> >  		return true;
> > -	}
> >  	delete_node(target);
> > =20
> >  	return false;
> > @@ -692,13 +703,10 @@ static bool merge_delete_node(struct node *dt, st=
ruct fragment *f)
> >   */
> >  static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
> >  {
> > -	struct node *target =3D get_node_by_ref(dt, f->ref);
> > +	struct node *target =3D lookup_ref(dt, f);
> > =20
> > -	if (!target) {
> > -		srcpos_error(f->ref_srcpos, "Error",
> > -			     "Label or path %s not found", f->ref);
> > +	if (!target)
> >  		return true;
> > -	}
> >  	omit_node_if_unused(target);
> > =20
> >  	return false;
>=20
>=20
>=20
> --=20
> Herv=E9 Codina, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--VyDTs1ESlAWuiQg0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrq1VgACgkQzQJF27ox
2GcpwQ/9En0jwxhb/YFMkHRxk+OKQhrmA74zztf38D55RkvxIhEfMp6VD0SJmpMz
kYu7PDNL6odG55S+TfXNtmyQfJRJ1pCBmVCG4LJQenMLyNplt4uat29h8XziUqFq
IvTgz8EH2KPMc0iMHe+WzQ60CNXvrtCocSQyDb/7q7VR1J5pyWulMMSC9ssTNKpu
P0owMcthXchzUHg/yjwSy+W1DqvuiVWySuPeXcofxJWQ815+IxrV3eJ0UHVLWcJu
WmkWX2+c4AZIwDpSFLy5TY37WDbKnADrjU7UVAoN+91nIE+Mn2jXDY9jacdQ5zrr
ArPmWHML5RLAwePD7PE/kodOUVD+lxR5uzUfqXZoIdKyITCUjRgiO12s/zJcK32e
qErxG8XtJC65vmHJSQ9kNfH5NZZiB04lw2EibiDM4wu+oYJWt9TRMDS6CM9bYtss
AAcUBhgLt+dJejO6puP6U8JghwI1e8FytSQvoSbj+OGilVdZkR2HR0tYERDeikh4
ay8Tv7Wazmp6PU79XbewJGnjLOwo8AGToDotC3/wpkFSzBRt8lmgzqLSP7Z5eyyx
W/nzyBgpMn5pDvAuRPoTZbL8t1xoK+KT/+QxpfJ3sj0awODNCD9jQEneMBnN8Lcd
VKK4lXzAitX7JW5+s6ikoi6F1HGqfkWEa6+KM/6YWlddf94RkXQ=
=UkGj
-----END PGP SIGNATURE-----

--VyDTs1ESlAWuiQg0--
