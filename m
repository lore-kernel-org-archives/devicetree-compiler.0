Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159470;
	b=qUMoIkqmOmIu6rSUbClxVS/PcPkezYvKAF1EV7U+hldt/mmf414fdKdW25wF1p1hjxx9
	 oW77efgL9/3wdR+5u/sgQp8b+CzJXe7SOrMCAiZF/CAH0jkI79ez5AsqqQntXFS7VXR6X
	 EyfC2d06dpsD9rKzLhhbZrH+frM5XQse7PJ7G3Gp0D2k2NThoWlahFYEvTYpDWipShaoU
	 4b2P7kDQxrQKDtQQZfbkAvER1Kll74GOm9WyjaF1dNlOO9k50SYlo59Dz8mgw607Pq2pN
	 +YYpLMghLLhtfChkqYY5LyMZZ2Y9/rglOUhzG13NVkwHBj0ynXLLuCM6ifnRmR3M2Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159470;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=BlYPh8k8TvD7965YRremTjTXLAMsist0vIj1XNte0Qw=;
	b=KkqpM5OwXl4FLw+ut5ENgt4mjQ9yifqkimKi4ezdAB9C/cCc3fkKEOIxtSEcQjyP1Dvt
	 aSPReR+4Be4UnfRNSakgZjolmAWz5yEVHgV3VgvURfr46Clzsu2++k2I2Q3CFgfI6CoDM
	 NEakild+SoH4nEBw4dufoqZbmBkpf/wOV+rxCpelaQt2HfIrnouweUcJjPZ6wBWDCiEeX
	 uovbzHuCTYjJhzEtk+0xTe9rRyBftvd58yXXKrhZTeE38MK2S6Z3JXKeFCE+jGgn+j7b3
	 gly94x3ywd+h8CsSzK34qfsBzNEZGKNuRiqXPcXFEiyZf/CnsKBSRZqK8pnFQPsj3uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=NQiV76Ex;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89726606A31A
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 03:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89726606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=NQiV76Ex
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793159464;
	bh=BlYPh8k8TvD7965YRremTjTXLAMsist0vIj1XNte0Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQiV76ExO/BR7vnvI2mwnojLaX1523VtoskZbT9pmvnm/ejnCTRRt7/DzxJg0eWPw
	 ndp0RmNjhw/4dKr6/Gi4gpgkvf4iLzDc5EPp332n0JqukleucTt9lTpHgBe1TnJ1t+
	 blv66Nxm9ZNArk7HEqeAIEad0YnTUlp4H+EQfc+gUASNbcHHrJydCLgMHF+5i+Whwn
	 siXNRIWULBfeI5AvYQX6ANgRpn43UZQlMfa/jC4FFCX3RfibbvW7P4vDffdKpFCeNR
	 nNxuUwrXppFPfFNgiff625+AVHy1d+fEDen6ZxqQb3MunxovSEzap752e2NObXUkma
	 pvJGgPbKPb5NA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jDtgr4Lr3z4w9R; Wed, 28 Oct 2026 14:51:04 +1100 (AEDT)
Date: Wed, 28 Oct 2026 14:47:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 1/2] dtc: Apply deletes in the section which has them
Message-ID: <auFwL0wwGhzdmc-J@gractus.seuss>
References: <20261026173529.3080952-1-sjg@chromium.org>
 <20261026173529.3080952-2-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="NCz534GYzh16+Yn/"
Content-Disposition: inline
In-Reply-To: <20261026173529.3080952-2-sjg@chromium.org>

--NCz534GYzh16+Yn/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 11:35:19AM -0600, Simon Glass wrote:
> The parser holds each /delete-property/ and /delete-node/ as a
> placeholder entry, flagged as deleted, among the node's properties or
> children. It only takes effect when merge_nodes() merges its section
> into an earlier one. In the first section of a dts it is ignored, so
> 'a; /delete-property/ a;' leaves 'a' in the tree. The same happens in
> any node which a later section adds, since merge_nodes() attaches a new
> child as it is. An ignored /delete-node/ also leaves its placeholder in
> the tree, which then shows up as '(null): Duplicate node name'
>=20
> Apply each delete when its node is built, by dropping the earlier
> entries of the same name from that node. Nothing can refer to the node
> yet, so they can be unlinked rather than flagged as deleted. Keep the
> placeholder, so that merging the node into an earlier definition still
> deletes there too.
>=20
> When a node joins the tree without being merged, as the first section,
> as a new child in merge_nodes() or as an overlay fragment, drop its
> placeholders, since there is nothing earlier for them to delete. This
> keeps placeholders and entries deleted within a section out of the tree,
> so that nothing which walks the tree has to skip them.
>=20
> Duplicate entries within a section are still reported as errors, since
> nothing is merged.
>=20
> Closes: https://github.com/dgibson/dtc/issues/37
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

I think this is an improvement over the current situation, hence,

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

However, there are some semantics that could do with tweaking further
in future.

> diff --git a/dtc-parser.y b/dtc-parser.y
> index e47f80d..0282f7b 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -160,6 +160,7 @@ dt_ref: DT_LABEL_REF | DT_PATH_REF;
>  devicetree:
>  	  '/' nodedef
>  		{
> +			drop_delete_placeholders($2);
>  			$$ =3D name_node($2, "");
>  		}
>  	| devicetree '/' nodedef
> diff --git a/dtc.h b/dtc.h
> index 473552e..3e5109d 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -277,6 +277,7 @@ struct node *omit_node_if_unused(struct node *node);
>  struct node *reference_node(struct node *node);
>  struct node *chain_node(struct node *first, struct node *list);
>  struct node *merge_nodes(struct node *old_node, struct node *new_node);
> +void drop_delete_placeholders(struct node *node);
>  struct node *add_orphan_node(struct node *old_node, struct node *new_nod=
e, char *ref);
> =20
>  void add_property(struct node *node, struct property *prop);
> diff --git a/livetree.c b/livetree.c
> index abe73de..b474a05 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -85,6 +85,68 @@ struct property *reverse_properties(struct property *f=
irst)
>  	return head;
>  }
> =20
> +/*
> + * The parser holds each /delete-property/ and /delete-node/ as a placeh=
older
> + * entry, flagged as deleted, among the node's properties or children. A=
pply
> + * each one by dropping the earlier entries of the same name in the node=
=2E The
> + * placeholders stay, so that merging the node into an earlier definition
> + * deletes there too
> + */
> +static void apply_deletes(struct node *node)
> +{
> +	struct property *prop, **pp;
> +	struct node *child, **np;
> +
> +	for (prop =3D node->proplist; prop; prop =3D prop->next) {
> +		if (!prop->deleted)
> +			continue;
> +		for (pp =3D &node->proplist; *pp !=3D prop;) {
> +			if (streq((*pp)->name, prop->name))
> +				*pp =3D (*pp)->next;
> +			else
> +				pp =3D &(*pp)->next;
> +		}

This leaks, but that's more or less accepted practice in dtc.

> +	}
> +
> +	for (child =3D node->children; child; child =3D child->next_sibling) {
> +		if (!child->deleted)
> +			continue;
> +		for (np =3D &node->children; *np !=3D child;) {
> +			if (streq((*np)->name, child->name))
> +				*np =3D (*np)->next_sibling;
> +			else
> +				np =3D &(*np)->next_sibling;
> +		}
> +	}
> +}
> +
> +/*
> + * Drop the /delete-property/ and /delete-node/ placeholders from a subt=
ree
> + * which joins the tree without being merged, since there is nothing ear=
lier

I find this description a bit confusing.  I think the salient point is
that this is called on a subtree that's the first in the list of
things to be merged.

> + * for them to delete
> + */
> +void drop_delete_placeholders(struct node *node)
> +{
> +	struct property **pp =3D &node->proplist;
> +	struct node **np =3D &node->children;
> +
> +	while (*pp) {
> +		if ((*pp)->deleted)
> +			*pp =3D (*pp)->next;
> +		else
> +			pp =3D &(*pp)->next;
> +	}
> +
> +	while (*np) {
> +		if ((*np)->deleted) {
> +			*np =3D (*np)->next_sibling;
> +		} else {
> +			drop_delete_placeholders(*np);
> +			np =3D &(*np)->next_sibling;
> +		}
> +	}
> +}
> +
>  struct node *build_node(struct property *proplist, struct node *children,
>  			struct srcpos *srcpos)
>  {
> @@ -100,6 +162,7 @@ struct node *build_node(struct property *proplist, st=
ruct node *children,
>  	for_each_child(new, child) {
>  		child->parent =3D new;
>  	}
> +	apply_deletes(new);
> =20
>  	return new;
>  }
> @@ -212,8 +275,10 @@ struct node *merge_nodes(struct node *old_node, stru=
ct node *new_node)
>  		}
> =20
>  		/* if no collision occurred, add child to the old node. */
> -		if (new_child)
> +		if (new_child) {
> +			drop_delete_placeholders(new_child);

I think this is only correct if merges are always applied left to
right.  I think that's the case, but it's not terribly obvious right
here.  It effectively makes the merge operation non-associative, which
might be confusing.

>  			add_child(old_node, new_child);
> +		}
>  	}
> =20
>  	old_node->srcpos =3D srcpos_extend(old_node->srcpos, new_node->srcpos);
> @@ -245,6 +310,8 @@ struct node * add_orphan_node(struct node *dt, struct=
 node *new_node, char *ref)
>  		p =3D build_property("target", d, NULL);
>  	}
> =20
> +	drop_delete_placeholders(new_node);
> +

Dropping placeholders here is semantically consistent, but possibly
risky.  Accepting a fragment with /delete/s without error might give
the impression that those deletes will take effect when the overlay is
applied, but that's not the case (runtime overlays have no mechanism
for encoding deletes).

I think it would be preferable to give an error if a fragment has any
unapplied delete markers.

>  	xasprintf(&name, "fragment@%u",
>  			next_orphan_fragment++);
>  	name_node(new_node, "__overlay__");
> diff --git a/tests/delete_in_section.dts b/tests/delete_in_section.dts
> new file mode 100644
> index 0000000..e742e79
> --- /dev/null
> +++ b/tests/delete_in_section.dts
> @@ -0,0 +1,125 @@
> +/dts-v1/;
> +
> +/*
> + * Delete properties and nodes defined earlier in the same section. This=
 is
> + * the first section, so nothing is merged into an earlier one
> + */
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	gone-prop;
> +	/delete-property/ gone-prop;
> +	kept-prop;
> +	again-prop =3D "old";
> +	/delete-property/ again-prop;
> +	again-prop =3D "new";
> +	both-prop;
> +
> +	/* Deleted and added again here, then changed by a later section */
> +	redel-prop =3D "old";
> +	/delete-property/ redel-prop;
> +	redel-prop =3D "new";
> +	reset-prop =3D "old";
> +	/delete-property/ reset-prop;
> +	reset-prop =3D "new";
> +
> +	gone-node {
> +	};
> +	/delete-node/ gone-node;
> +
> +	again-node {
> +		old;
> +	};
> +	/delete-node/ again-node;
> +	again-node {
> +		new;
> +	};
> +
> +	lbl: node {
> +		inner-prop;
> +		/delete-property/ inner-prop;
> +
> +		inner-node {
> +		};
> +		/delete-node/ inner-node;
> +	};
> +
> +	redel-node {
> +		old;
> +	};
> +	/delete-node/ redel-node;
> +	redel-node {
> +		new;
> +	};
> +
> +	remerge-node {
> +		old;
> +	};
> +	/delete-node/ remerge-node;
> +	remerge-node {
> +		new;
> +	};
> +
> +	/* Checks must not see what is deleted here */
> +	named-node {
> +		name =3D "other";
> +		/delete-property/ name;
> +	};
> +
> +	bus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		child@1 {
> +			reg =3D <1>;
> +		};
> +		/delete-node/ child@1;
> +	};
> +
> +	/* Deleted here, then added again by a later section */
> +	readd@1 {
> +		reg =3D <1>;
> +		old;
> +	};
> +	/delete-node/ readd@1;
> +	/delete-node/ placeholder@2;

I feel like not throwing an error on deletes of things that don't
exist is a footgun.

> +};
> +
> +/* Delete within nodes which a later section adds, and within the merge =
*/
> +
> +/ {
> +	both-prop =3D "new";
> +	/delete-property/ both-prop;
> +	/delete-property/ redel-prop;
> +	reset-prop =3D "later";
> +
> +	new-node {
> +		new-prop;
> +		/delete-property/ new-prop;
> +		kept;
> +	};
> +
> +	/delete-node/ redel-node;
> +
> +	remerge-node {
> +		later;
> +	};
> +
> +	readd@1 {
> +		reg =3D <1>;
> +		later;
> +	};
> +
> +	placeholder@2 {
> +		reg =3D <2>;
> +	};
> +};
> +
> +&lbl {
> +	child {
> +		child-prop;
> +		/delete-property/ child-prop;
> +	};
> +};
> diff --git a/tests/delete_in_section_badref.dts b/tests/delete_in_section=
_badref.dts
> new file mode 100644
> index 0000000..79a40e4
> --- /dev/null
> +++ b/tests/delete_in_section_badref.dts
> @@ -0,0 +1,11 @@
> +/dts-v1/;
> +
> +/* A reference to a node deleted in the same section has nothing to refe=
r to */
> +
> +/ {
> +	ref =3D <&gone>;
> +
> +	gone: node {
> +	};
> +	/delete-node/ node;
> +};
> diff --git a/tests/delete_in_section_labels.dts b/tests/delete_in_section=
_labels.dts
> new file mode 100644
> index 0000000..fbde838
> --- /dev/null
> +++ b/tests/delete_in_section_labels.dts
> @@ -0,0 +1,28 @@
> +/dts-v1/;
> +
> +/*
> + * A label moves to the new definition of a node deleted in the same
> + * section, and labels on deleted nodes stay out of __symbols__
> + */
> +
> +/ {
> +	ref =3D <&moved>;
> +
> +	moved: node {
> +		old;
> +	};
> +	/delete-node/ node;
> +	moved: node {
> +		new;
> +	};
> +
> +	gone: gone-node {
> +	};
> +	/delete-node/ gone-node;
> +};
> +
> +/ {
> +	later: later-node {
> +	};
> +	/delete-node/ later-node;
> +};
> diff --git a/tests/delete_in_section_labels_ref.dts b/tests/delete_in_sec=
tion_labels_ref.dts
> new file mode 100644
> index 0000000..5d8cf38
> --- /dev/null
> +++ b/tests/delete_in_section_labels_ref.dts
> @@ -0,0 +1,9 @@
> +/dts-v1/;
> +
> +/ {
> +	ref =3D <&moved>;
> +
> +	moved: node {
> +		new;
> +	};
> +};
> diff --git a/tests/delete_in_section_overlay.dts b/tests/delete_in_sectio=
n_overlay.dts
> new file mode 100644
> index 0000000..e3e8f71
> --- /dev/null
> +++ b/tests/delete_in_section_overlay.dts
> @@ -0,0 +1,21 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/* Delete within the fragments of an overlay */
> +
> +&target {
> +	a;
> +	/delete-property/ a;
> +	b;
> +	/delete-property/ c;
> +
> +	gone {
> +	};
> +	/delete-node/ gone;
> +	/delete-node/ d;
> +};
> +
> +&{/path} {
> +	p;
> +	/delete-property/ p;
> +};
> diff --git a/tests/delete_in_section_overlay_ref.dts b/tests/delete_in_se=
ction_overlay_ref.dts
> new file mode 100644
> index 0000000..48f36b3
> --- /dev/null
> +++ b/tests/delete_in_section_overlay_ref.dts
> @@ -0,0 +1,9 @@
> +/dts-v1/;
> +/plugin/;
> +
> +&target {
> +	b;
> +};
> +
> +&{/path} {
> +};
> diff --git a/tests/delete_in_section_ref.dts b/tests/delete_in_section_re=
f.dts
> new file mode 100644
> index 0000000..20d459a
> --- /dev/null
> +++ b/tests/delete_in_section_ref.dts
> @@ -0,0 +1,44 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	kept-prop;
> +	again-prop =3D "new";
> +	reset-prop =3D "later";
> +
> +	again-node {
> +		new;
> +	};
> +
> +	lbl: node {
> +		child {
> +		};
> +	};
> +
> +	remerge-node {
> +		new;
> +		later;
> +	};
> +
> +	named-node {
> +	};
> +
> +	bus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +	};
> +
> +	new-node {
> +		kept;
> +	};
> +
> +	readd@1 {
> +		reg =3D <1>;
> +		later;
> +	};
> +
> +	placeholder@2 {
> +		reg =3D <2>;
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 842b543..2650df6 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -725,6 +725,27 @@ dtc_tests () {
>      run_dtc_test -I dts -O dts -o delete_reinstate_multilabel.dts.test.d=
ts "$SRCDIR/delete_reinstate_multilabel.dts"
>      run_wrap_test cmp delete_reinstate_multilabel.dts.test.dts "$SRCDIR/=
delete_reinstate_multilabel_ref.dts"
> =20
> +    # Check deletes within the section which has them
> +    run_dtc_test -E reg_format -E avoid_unnecessary_addr_size -I dts -O =
dtb \
> +	-o delete_in_section.test.dtb "$SRCDIR/delete_in_section.dts"
> +    run_dtc_test -I dts -O dtb -o delete_in_section_ref.test.dtb \
> +	"$SRCDIR/delete_in_section_ref.dts"
> +    run_test dtbs_equal_ordered delete_in_section.test.dtb delete_in_sec=
tion_ref.test.dtb
> +    run_dtc_test -@ -I dts -O dtb -o delete_in_section_labels.test.dtb \
> +	"$SRCDIR/delete_in_section_labels.dts"
> +    run_dtc_test -@ -I dts -O dtb -o delete_in_section_labels_ref.test.d=
tb \
> +	"$SRCDIR/delete_in_section_labels_ref.dts"
> +    run_test dtbs_equal_ordered delete_in_section_labels.test.dtb \
> +	delete_in_section_labels_ref.test.dtb
> +    run_dtc_test -I dts -O dtb -o delete_in_section_overlay.test.dtb \
> +	"$SRCDIR/delete_in_section_overlay.dts"
> +    run_dtc_test -I dts -O dtb -o delete_in_section_overlay_ref.test.dtb=
 \
> +	"$SRCDIR/delete_in_section_overlay_ref.dts"
> +    run_test dtbs_equal_ordered delete_in_section_overlay.test.dtb \
> +	delete_in_section_overlay_ref.test.dtb
> +    run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references \
> +	-n duplicate_node_names -- -I dts -O dtb "$SRCDIR/delete_in_section_bad=
ref.dts"
> +
>      # Check some checks
>      check_tests "$SRCDIR/dup-nodename.dts" duplicate_node_names
>      check_tests "$SRCDIR/dup-propname.dts" duplicate_property_names
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--NCz534GYzh16+Yn/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrhcC8ACgkQzQJF27ox
2GcQbA//TjywDSNj/RNAZgxQrPO07fiTDF7HIXR8iRDvewPU3ue0eQcDfvkTGtQw
uYK7ziKDo2FidhUA0kMHL85AUfGXGnhV1sl58EeCilz2bUQ0O2PERr35bsj10asB
8kZ0AnnVK8HhAEvvD1RqkR8ThtZwihKtm+tLFJmJ3Dw65nc5UNJQvDpMWPTKD1qr
CBKTZVusH7UrEzaBgyWx2aDSWwrl6dCGxKwhmJ4/DbNcWwf6DqvqReg6Rx8HxT40
tZDYgz+Lag4NeV9OFw10mmjVrtowiDC7AYqiG+NuCBrWglT0nAML4UrWngdYy9g4
BxuqcdiGAsuVsyJCd0w8dAqAK7+WITht22r6TDhPB8BFFH9wL1Ym3AShZGNQRrJq
Y9NgF4bPKYkmLJaOinfHHbR96RTqiKHDjj05BWRKM1Hp8vivt2PLoeJ1u7q6FQw0
uNpU633Y9RiO6lMIQJVqYP7THCwe7BZ7Pi1dC3rvaEG77J2JiAdBMseKq+C5XMU8
o/P2da5L+xP0mrgJDcSYIIJitHKVRjn/LzLX6jEJAmCIVlDXcUyBTAkZo8/S/L8r
qcmSHmk27x4esqbeIVmalp2sJY+uG7nxLbGqrwnsaVk5xDGZgklpDO93fI4O/7Fh
qNsHtECxCxAKIIkUIKG3vYc1pQ3GkvluLLqnIXyk+cLvBi2eLBY=
=QsZr
-----END PGP SIGNATURE-----

--NCz534GYzh16+Yn/--
