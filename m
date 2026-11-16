Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803692;
	b=So6CLr0+2sqsz7JuJjCA8NPpQvLxQMSRn5vO+L6yDJFAWxNV5aDNC5FgMCMJl7XQz7X4
	 njBEqOyoaMbkyOk1b2yUlPq1hj6z8/rqwh0PEhc3NDvNz1dLni/Y9uruSYFcvE8BQA6kh
	 O8uo0sZeMOq+f11Bg0eIOiC0cWmngjOxxP4NMmDUGebZZt+xIpVqLbgQaEh6XYyZn4q6f
	 Jwv3VcZfVxJKRckrDmbd6nqxFxwb9maLUN8nC1igJ1LGPrxQQI9ANIhA4oaebz9di3mJY
	 NSte42/x+TZ7x93uWXoQZjq3Hg5O4w+dF5/JZ7ji9HMS65+S6RRpyPkSqLuIxGl7k8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803692;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=h0XsyLBBq82cRE1w5YKapJOVQaW9KWsrktkd6Joofqk=;
	b=4lbcpmXn7VC2DIDfCCHPtsGlpZ0t3a6xcbr0E1Ng8NAMqw8TV+9FsaIuiqtBDQCurZHW
	 1cbemWKO8J8tpkRqH1MTFrvLM5gpETvIRBO1AorCEUBF4hYMcJAvxNxxrAtp01mjTjIDj
	 /3vFnovSCIIYz3Lztk69CsQombPtBdc48ZbJWIHvaslFg/fEbnhcJFRar6YDuSwzT1DT7
	 WC7JkpgKFF/pOVxJ33ERDdnfSbxiz8DJ5cuS0VLhg+6rn+xtpY0uDelm6GnGfqMUUm2Zt
	 IlvR6OgPXxW04JPhTG/6d5t4qEVGNdBp7Cixp168n4poKzZ3nnoQ6wbp1aT0/Vy1SJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=o1NA2s4x;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B78606A881
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 04:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B78606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=o1NA2s4x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794803680;
	bh=h0XsyLBBq82cRE1w5YKapJOVQaW9KWsrktkd6Joofqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1NA2s4x6XkPUHMiyvxS+woaNa1EDQaLy6A4PkP2MSFsPW0+UTfeDi/f+ecvF7qXk
	 G/CAyVTvauwKxj2fzKybJq+Du/n/o6wFnMNpV7FsY+hgKYpAPkqjmOaNdN0mYYR+Rs
	 yf+8B2LQ7/8NIo/4X8dG92ie+2lFKuD8ecyQIhLZ/23Lw9Tqr5ghpLK6oJUHJOBysG
	 SySoxvvkzpu6FNb3ynOzJQh5iRIVmDCECXJ9N0hio/Wr/jBbXVr3TKQ1nrQ34jjlcs
	 4ndDQRWN3rx9Ow+L9lmQUpyT30eW66rhW4TFkntuhzuY4ABFKxSuD4cxmAuWXgVD5N
	 D7Jqb4SGA0AQw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jSZlN25rfz4wSg; Mon, 16 Nov 2026 15:34:40 +1100 (AEDT)
Date: Mon, 16 Nov 2026 15:34:31 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 18/18] dtc: Add the overlay fragments after merging a
 plugin
Message-ID: <avqH1goKzmx8xUE3@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-19-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="3eHDuD9TPHiDXrIo"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-19-sjg@chromium.org>

--3eHDuD9TPHiDXrIo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:45PM -0700, Simon Glass wrote:
> In a plugin, merge_fragments() turns each fragment which refers to the
> base tree into an overlay fragment (a fragment@N node) as soon as it is
> merged. This puts the fragment@N nodes into the tree which later
> fragments are merged into, so converting the plugin to the overlay
> format is still mixed with the merge.

I think this is a good idea, to the point that it might be worth
mentioning that this is a later change coming in the commit message
for the earlier creation of merge_fragments().

> Keep these fragments in dti->fragments instead and add the fragment@N
> nodes from main() once the merge is complete. A later fragment can still
> refer to a label in one of them, so look up a label in these fragments
> as well as in the tree. Make add_orphan_node() return the fragment@N
> node, so that its full path can be filled in.
>=20
> This changes the output in three cases.
>=20
> Firstly, where a / { ... } fragment comes after one which refers to the
> base tree, the fragment@N nodes now come after the nodes which it adds,
> rather than before them.

I have trouble deciphering that - an example would help.

>=20
> Secondly, a / { ... } fragment can no longer add to a fragment@N node by
> giving its name, which now gives a duplicate-node-name error. dtc
> generates these nodes and numbers them in order, so a plugin should not
> rely on their names, and an error is better than silently changing a
> generated fragment.

Doesn't this break the test introduced in the previous patch?  I think
this is a sensible semantic change, but then why introduce the test?

> Finally, /delete-node/ and /omit-if-no-ref/ can no longer refer to a
> node in an overlay fragment by its path, such as
> &{/fragment@0/__overlay__/node}, since that path does not exist until
> after the merge. The path also relies on a generated name, whereas a
> label, which still works, refers to the node as written in the source.

I think that's a good change too.  Those things were only permitted
previously by accident.

> Update the tests for these three cases.
>=20
> Suggested-by: Herve Codina <herve.codina@bootlin.com>
> Link: https://lore.kernel.org/devicetree-compiler/20261105100714.47bf0434=
@bootlin.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> None of these changes affects any .dts or .dtso file in Linux
> v7.3-12284-g3799eeb906c9

Worth mentioning that in the commit message proper, rather than after
the ---.

> Changes in v3:
> - Add new patch to add the overlay fragments after merging a plugin
>=20
>  dtc.c              |   1 +
>  dtc.h              |   6 ++-
>  livetree.c         | 105 ++++++++++++++++++++++++++++++++++-----------
>  tests/run_tests.sh |  20 ++++-----
>  4 files changed, 94 insertions(+), 38 deletions(-)
>=20
> diff --git a/dtc.c b/dtc.c
> index 73e5d76..13a9963 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -301,6 +301,7 @@ int main(int argc, char *argv[])
> =20
>  	if (!merge_fragments(dti))
>  		die("Unable to merge input tree\n");
> +	add_overlay_fragments(dti);
>  	dti->outname =3D outname;
> =20
>  	if (depfile) {
> diff --git a/dtc.h b/dtc.h
> index 437efbc..0062e3d 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -330,7 +330,8 @@ struct reserve_info *add_reserve_entry(struct reserve=
_info *list,
>   * tree.
>   *
>   * This is not the same as an overlay fragment (a fragment@N node), alth=
ough

Didn't notice it earlier, but this comment does suggest suggest we
should try to create more precise terms.  Even if we have to fall back
on the rather awkward "source fragment" vs. "runtime fragment" or
something.

> - * in a plugin a fragment may become one when it is merged.
> + * in a plugin a fragment which refers to the base tree becomes one afte=
r the
> + * others are merged.
>   */
> =20
>  enum fragment_type {
> @@ -378,7 +379,7 @@ struct dt_info {
>  	struct reserve_info *reservelist;
>  	uint32_t boot_cpuid_phys;
>  	struct node *dt;		/* the device tree */
> -	struct fragment *fragments;	/* not yet merged into dt */
> +	struct fragment *fragments;	/* not merged into dt */
>  	const char *outname;		/* filename being written to, "-" for stdout */
>  };
> =20
> @@ -391,6 +392,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  			      struct node *tree, struct fragment *fragments,
>  			      uint32_t boot_cpuid_phys);
>  bool merge_fragments(struct dt_info *dti);
> +void add_overlay_fragments(struct dt_info *dti);
>  void sort_tree(struct dt_info *dti);
>  void generate_labels_from_tree(struct dt_info *dti, const char *name);
>  void generate_label_tree(struct dt_info *dti, const char *name, bool all=
ocph);
> diff --git a/livetree.c b/livetree.c
> index c5fec49..3413a26 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -232,7 +232,7 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
>   * or a label (target, as a phandle reference). Fragments are numbered i=
n the
>   * order they are added.
>   *
> - * Returns the root node, dt
> + * Returns the fragment@N node
>   */
>  struct node * add_orphan_node(struct node *dt, struct node *new_node, ch=
ar *ref)
>  {
> @@ -262,7 +262,7 @@ struct node * add_orphan_node(struct node *dt, struct=
 node *new_node, char *ref)
>  	free(name);
> =20
>  	add_child(dt, node);
> -	return dt;
> +	return node;
>  }
> =20
>  struct node *chain_node(struct node *first, struct node *list)
> @@ -602,15 +602,37 @@ static bool check_relative_ref(struct fragment *f, =
struct srcpos *pos)
>  	return false;
>  }
> =20
> +/*
> + * Look up a reference in the tree merged so far or, for a label, in bas=
e_frags,
> + * the fragments for the base tree so far, since a plugin may refer to a=
 node in
> + * one of these
> + *
> + * Returns the node, or NULL if it is not found
> + */
> +static struct node *find_ref(struct node *dt, struct fragment *base_frag=
s,

What makes the frags "base"?

> +			     const char *ref)

I'd prefer to call this get_node_by_ref(), renaming a new helper for
the single-fragment search if necessary.

> +{
> +	struct node *target =3D get_node_by_ref(dt, ref);
> +	struct fragment *f;
> +
> +	if (ref[0] =3D=3D '/')
> +		return target;
> +	for (f =3D base_frags; f && !target; f =3D f->next)
> +		target =3D get_node_by_ref(f->node, ref);
> +
> +	return target;
> +}
> +
>  /*
>   * Look up the node which a fragment refers to, reporting an error if it=
 is
>   * not found
>   *
>   * Returns the node, or NULL if it is not found
>   */
> -static struct node *lookup_ref(struct node *dt, struct fragment *f)
> +static struct node *lookup_ref(struct node *dt, struct fragment *base_fr=
ags,
> +			       struct fragment *f)
>  {
> -	struct node *target =3D get_node_by_ref(dt, f->ref);
> +	struct node *target =3D find_ref(dt, base_frags, f->ref);
> =20
>  	if (!target)
>  		srcpos_error(f->ref_srcpos, "Error",
> @@ -622,7 +644,7 @@ static struct node *lookup_ref(struct node *dt, struc=
t fragment *f)
>  /*
>   * Make an empty tree at *dtp for a first fragment which refers to a lab=
el or
>   * path, rather than being the root node. This is only valid in a plugin=
, where
> - * the fragment becomes an overlay fragment.
> + * the fragment is kept to become an overlay fragment.
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> @@ -653,8 +675,8 @@ static bool merge_first_ref(struct node **dtp, struct=
 fragment *f, bool plugin)
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> -static bool merge_ref(struct node *dt, struct fragment *f, bool plugin,
> -		      bool *for_basep)
> +static bool merge_ref(struct node *dt, struct fragment *base_frags,
> +		      struct fragment *f, bool plugin, bool *for_basep)
>  {
>  	struct node *target;
>  	bool ok =3D true;
> @@ -664,13 +686,13 @@ static bool merge_ref(struct node *dt, struct fragm=
ent *f, bool plugin,
>  		ok =3D check_relative_ref(f, f->label ? f->label_srcpos :
>  					f->ref_srcpos);
>  		if (!f->label &&
> -		    (f->ref[0] =3D=3D '/' || !get_node_by_ref(dt, f->ref))) {
> +		    (f->ref[0] =3D=3D '/' || !find_ref(dt, base_frags, f->ref))) {
>  			*for_basep =3D true;
>  			return ok;
>  		}
>  	}
> =20
> -	target =3D lookup_ref(dt, f);
> +	target =3D lookup_ref(dt, base_frags, f);
>  	if (!target)
>  		return false;
>  	if (f->label)
> @@ -685,9 +707,10 @@ static bool merge_ref(struct node *dt, struct fragme=
nt *f, bool plugin,
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> -static bool merge_delete_node(struct node *dt, struct fragment *f)
> +static bool merge_delete_node(struct node *dt, struct fragment *base_fra=
gs,
> +			      struct fragment *f)
>  {
> -	struct node *target =3D lookup_ref(dt, f);
> +	struct node *target =3D lookup_ref(dt, base_frags, f);
> =20
>  	assert(f->type =3D=3D FRAGMENT_DELETE_NODE);
>  	if (!target)
> @@ -703,9 +726,10 @@ static bool merge_delete_node(struct node *dt, struc=
t fragment *f)
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> -static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
> +static bool merge_omit_if_no_ref(struct node *dt, struct fragment *base_=
frags,
> +				 struct fragment *f)
>  {
> -	struct node *target =3D lookup_ref(dt, f);
> +	struct node *target =3D lookup_ref(dt, base_frags, f);
> =20
>  	assert(f->type =3D=3D FRAGMENT_OMIT_IF_NO_REF);
>  	if (!target)
> @@ -717,13 +741,14 @@ static bool merge_omit_if_no_ref(struct node *dt, s=
truct fragment *f)
> =20
>  /*
>   * Merge a fragment of a dts file into the tree at *dtp, which is NULL f=
or the
> - * first fragment. A reference is looked up in the tree as merged so far=
=2E If
> - * the fragment is for the base tree, *for_basep is set to true.
> + * first fragment. A reference is looked up in the tree as merged so far=
 and in
> + * base_frags, the fragments for the base tree so far. If this fragment =
is for
> + * the base tree too, *for_basep is set to true.
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> -static bool merge_fragment(struct node **dtp, struct fragment *f,
> -			   bool plugin, bool *for_basep)
> +static bool merge_fragment(struct node **dtp, struct fragment *base_frag=
s,
> +			   struct fragment *f, bool plugin, bool *for_basep)
>  {
>  	struct node *dt =3D *dtp;
> =20
> @@ -740,13 +765,13 @@ static bool merge_fragment(struct node **dtp, struc=
t fragment *f,
>  	switch (f->type) {
>  	case FRAGMENT_NODE:
>  		if (f->ref)
> -			return merge_ref(dt, f, plugin, for_basep);
> +			return merge_ref(dt, base_frags, f, plugin, for_basep);
>  		*dtp =3D merge_nodes(dt, f->node);
>  		break;
>  	case FRAGMENT_DELETE_NODE:
> -		return merge_delete_node(dt, f);
> +		return merge_delete_node(dt, base_frags, f);
>  	case FRAGMENT_OMIT_IF_NO_REF:
> -		return merge_omit_if_no_ref(dt, f);
> +		return merge_omit_if_no_ref(dt, base_frags, f);
>  	}
> =20
>  	return true;
> @@ -754,39 +779,67 @@ static bool merge_fragment(struct node **dtp, struc=
t fragment *f,
> =20
>  /*
>   * Merge the fragments of a dts file into a single tree, in source order=
=2E In a
> - * plugin, each fragment for the base tree becomes an overlay fragment.
> + * plugin, the fragments for the base tree are left in dti->fragments, f=
or
> + * add_overlay_fragments() to deal with.
>   *
>   * Returns true on success, false on errors, which have been reported.
>   */
>  bool merge_fragments(struct dt_info *dti)
>  {
>  	bool plugin =3D dti->dtsflags & DTSF_PLUGIN;
> -	struct fragment *f, *next;
> +	struct fragment *f, *next, *base_frags =3D NULL;
>  	struct node *dt =3D NULL;
>  	bool ok =3D true;
> =20
>  	if (!dti->fragments)
>  		return true;
> =20
> +	/*
> +	 * At the start, dti->fragments holds all the fragments in source order,
> +	 * dt is NULL and base_frags is empty. Merge each fragment into dt and
> +	 * free it, unless it is for the base tree, in which case move it to

I find this confusing.  If it's "for the base tree" doesn't that mean
we _should_ merge it into dt?

> +	 * base_frags so that later fragments can refer to its labels. At the
> +	 * end, each fragment has been freed or moved to base_frags, and
> +	 * dti->fragments is set to base_frags below.
> +	 */
>  	for (f =3D dti->fragments; f; f =3D next) {
>  		bool for_base =3D false;
> =20
>  		next =3D f->next;
> -		if (!merge_fragment(&dt, f, plugin, &for_base))
> +		if (!merge_fragment(&dt, base_frags, f, plugin, &for_base))
>  			ok =3D false;
>  		if (for_base)
> -			add_orphan_node(dt, f->node, f->ref);
> -		free_fragment(f);
> +			base_frags =3D append_fragment(base_frags, f);
> +		else
> +			free_fragment(f);
>  	}
> =20
>  	dti->dt =3D dt;
> -	dti->fragments =3D NULL;
> +	dti->fragments =3D base_frags;
>  	dti->boot_cpuid_phys =3D guess_boot_cpuid(dt);
>  	fill_fullpaths(dti->dt, "");
> =20
>  	return ok;
>  }
> =20
> +/*
> + * Add an overlay fragment (a fragment@N node) to the tree for each frag=
ment of
> + * a plugin which is left after merging, i.e. which refers to the base t=
ree
> + */
> +void add_overlay_fragments(struct dt_info *dti)
> +{
> +	struct fragment *f, *next;
> +	struct node *node;
> +
> +	for (f =3D dti->fragments; f; f =3D next) {
> +		next =3D f->next;
> +		node =3D add_orphan_node(dti->dt, f->node, f->ref);
> +		fill_fullpaths(node, dti->dt->fullpath);
> +		free_fragment(f);
> +	}
> +	dti->fragments =3D NULL;
> +}
> +
>  /*
>   * Tree accessor functions
>   */
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 92e4d2c..73ab5f8 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -841,21 +841,21 @@ dtc_tests () {
>      run_fdtget_test "/fragment@0:target:0" merge-label-base.test.dtb /__=
fixups__ baselabel
> =20
>      # In a plugin, a node in an overlay fragment can be deleted by its l=
abel,
> -    # and the overlay fragment comes before the later node in the plugin
> +    # and the overlay fragment comes after the nodes in the plugin, sinc=
e it
> +    # is added after the merge
>      run_dtc_test -I dts -O dtb -o merge-overlay-order.test.dtb \
>  	"$SRCDIR/merge-overlay-order.dts"
> -    run_fdtget_test "fragment@0\nnode\n__fixups__" merge-overlay-order.t=
est.dtb -l /
> +    run_fdtget_test "node\nfragment@0\n__fixups__" merge-overlay-order.t=
est.dtb -l /
>      run_fdtget_test "bar" merge-overlay-order.test.dtb -l /fragment@0/__=
overlay__
> =20
> -    # In a plugin, a / { ... } fragment can add to an overlay fragment by
> +    # In a plugin, a / { ... } fragment cannot add to an overlay fragmen=
t by
>      # giving the name which dtc generates for it, and a node in an overl=
ay
> -    # fragment can be deleted by its path
> -    run_dtc_test -I dts -O dtb -o merge-overlay-name.test.dtb \
> -	"$SRCDIR/merge-overlay-name.dts"
> -    run_fdtget_test 1 merge-overlay-name.test.dtb /fragment@0 prop
> -    run_dtc_test -I dts -O dtb -o merge-overlay-path.test.dtb \
> -	"$SRCDIR/merge-overlay-path.dts"
> -    run_fdtget_test "node2" merge-overlay-path.test.dtb -l /fragment@0/_=
_overlay__
> +    # fragment cannot be referred to by its path, since the overlay frag=
ments
> +    # are only added after the merge
> +    run_sh_test "$SRCDIR/dtc-checkfails.sh" duplicate_node_names -- \
> +	-I dts -O dtb "$SRCDIR/merge-overlay-name.dts"
> +    run_wrap_error_msg_test "merge-overlay-path.dts:13.15-47 Label or pa=
th /fragment@0/__overlay__/node1 not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-overlay-path.dts"
> =20
>      check_tests "$SRCDIR/bad-name-property.dts" name_properties
> =20
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--3eHDuD9TPHiDXrIo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr6h9YACgkQzQJF27ox
2GfmrA/8D1VVmKZKPmin7l5wiubqCPCfUxXy3q+eFfJdueXUruN94jjEOOMDB0Ve
1brgQWBJA92ro662Py3KUGgdn7HWp3dD1SkSPiGLVKlID/Wnd2vN0qJnq7+aKg+4
xy4ANd4Dr5nj5OoW/UIMvjpHduxAt5b0qXV8y+gdIFf7Y+oKGj14l6yyi1rldA3f
8sHTaw5B8ZLBXjum1JzIYfp/nNFLr0SpHLxpiPemkfW8SerbyZXQW3jx5LOsGnLp
QK0NRsSwMxv739RU9wGksnBVWbkpvf5TKkevx3TIVbAskvdYNiV6g3LulNlsQvWE
YX7sohMJ+lqW+eiLgxiHyBZUsDJsmmB0fYhBchiDRSK8XN8l9ppFX85jmp7P5Szj
rGpZTflDkEesMAAIe193JbZ17B2UTB0KCLp4MhFgFsSXAdknbVmoGGz3KaY57um4
zDLa14lh6dc/SZqTTlbP38CHPl4OawxBFtLfgFOyCIMloFNJCoWib2A9jtvjNNN+
dTd9F9zI/Vw0RQRudsyCDj3JNe8B/cJ5ATNkZdbuw0DBoNx/bYqKakYvZqR85sGy
mD56sE7MK7qQLaQiymMw8OdgPeskZA+PJZB01rawrBaev3R1yV+9VuQZ/BF1EXxt
U8Y6XNQN+ErL0nJszVXl1svAZPpHD8eT73xsMXQPbWjCnupAXHs=
=mXlg
-----END PGP SIGNATURE-----

--3eHDuD9TPHiDXrIo--
