Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01A225C80D
	for <devicetree-compiler@vger.kernel.org>; Thu, 14 Aug 2025 07:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156979; cv=none; b=LrSrauB95evOE/Hcg6DWgSWsyOKlWQ66m1QkgvIMsRZv38epQ30VprUatbcPISyTAJhoFek+Fo4agd6q3DPOlqhd2a++R0kelw4t8kTwLE99JH4Nx+pBfHfd6h92K7wOD4/PKpS9I4EImFvR/zfsT9nSFlfqegBkjkildNyq+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156979; c=relaxed/simple;
	bh=N4bFQrJrSkhLvqkpSzo7RkG7AVYVyIYp8DgnQrC+4Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIWrpuSFCvddLZWnYjIYhTmI1tGQN2H0WV9rcv9tt8if7bibJgZn4s9vl5kERovzjDXzk98Zn7TXqkCE2O4pIMJxLDgFz/js+OF42FPA994iyL5uXuZG/ItsBmdwwmSWAiYV3H0R+VuPQT6D3d68SleVAUZW+tmhmiBAwphl1SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=DG2MZ8Jf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="DG2MZ8Jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755156972;
	bh=yjIB4Fyr8BKLAWGNhFJBQHFs9c1ZSbkaGoQpp3hEMjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DG2MZ8JfpOgymHcuDC78YljyK5E2q2p+ho83/oio3StOaQyZkeVP9+EWp2dX3KPba
	 U+kWQNUd5octDRs3GcvJP5Iq+5PGbZejvad3Zl8OhuoZYLEr9auUpD6v0VpHIGWpNO
	 zQiv7KdNWefSrZRQLI7LOy97XtJUw7kylI4lF1VfOFi7lsMVBSygNtYKQgP0WNj/H5
	 mIimImskgENSgznWRivqS84DNY/yh2nmh0T+2KxvejuCZKFUzxcxg8WIAqXNps5DRX
	 5P5QdpW0CUhrbZ316UqdVcm4NK7PAm8OE3BIqXn8YOHm86Jkg1mhnTxVvt+rBRLeKg
	 1Rhg5W92s7ARQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c2cVh37SDz4xcw; Thu, 14 Aug 2025 17:36:12 +1000 (AEST)
Date: Thu, 14 Aug 2025 17:36:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] livetree: Add only new data to fixup nodes instead of
 complete regeneration
Message-ID: <aJ2R6LDucXrOFgZW@zatzit>
References: <20250801160031.624886-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aoTlNSruoHYDKOSX"
Content-Disposition: inline
In-Reply-To: <20250801160031.624886-2-u.kleine-koenig@baylibre.com>


--aoTlNSruoHYDKOSX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2025 at 06:00:31PM +0200, Uwe Kleine-K=F6nig wrote:
> Removing the complete __fixups__ and __local_fixups__ tree might delete
> data that should better be retained. See the added test for a situation
> that was broken before.
>=20
> Fixes: 915daadbb62d ("Start with empty __local_fixups__ and __fixups__ no=
des")
> Closes: https://github.com/dgibson/dtc/issues/170
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>=20
> this fixes the fallout of commit 915daadbb62d ("Start with empty
> __local_fixups__ and __fixups__ nodes") that was found while discussing
> https://github.com/dgibson/dtc/pull/151 .

Thanks.

> I'm a bit annoyed by the github workflow, so here comes a patch on the
> mailing list :-)

That's fine.

Sorry it's taken me so long to look at this.

>  livetree.c              | 75 +++++++++++++++++++++++++++++++----------
>  tests/retain-fixups.dts | 29 ++++++++++++++++
>  tests/run_tests.sh      |  5 +++
>  3 files changed, 92 insertions(+), 17 deletions(-)
>  create mode 100644 tests/retain-fixups.dts
>=20
> diff --git a/livetree.c b/livetree.c
> index d51d05830b18..24f7c561d77e 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -356,6 +356,60 @@ void append_to_property(struct node *node,
>  	}
>  }
> =20
> +static void append_unique_str_to_property(struct node *node,
> +					  char *name, const char *data, int len)
> +{
> +	struct data d;
> +	struct property *p;
> +
> +	p =3D get_property(node, name);
> +	if (p) {
> +		const char *s;
> +
> +		for (s =3D p->val.val; s < p->val.val + p->val.len; s =3D strchr(s, '\=
0') + 1) {

This isn't quite safe.  You check s is within bounds on each
iteration, but if the property is malformed and doesn't end with a \0,
the strchr() itself could read beyond the property's bounds.

strnchr() could work, but is awkward: it would return NULL if there
are no further \0 within the property, and on most systems NULL <
p->val.val + p->val.len would return true, so you'd have to check for
that case separately.  You could use strnlen() instead, but that's
also a bit awkward - it doesn't include the \0, so you'd need to add
+1 - but in the malformed case that would put you one beyond the end
of the buffer.  That would probably work in practice, but creating
pointers beyond the buffer they're within is technically UB.

> +			if (strcmp(data, s) =3D=3D 0)

This also relies on the \0 being there.  Any fix for the above, will
probably result in being able to get the length of each string segment
fairly naturally, so it would make sense to use memcmp() instead.

> +				/* data already contained in node.name */
> +				return;
> +		}
> +
> +		d =3D data_add_marker(p->val, TYPE_STRING, name);
> +		d =3D data_append_data(d, data, len);
> +		p->val =3D d;
> +	} else {
> +		d =3D data_add_marker(empty_data, TYPE_STRING, name);
> +		d =3D data_append_data(d, data, len);
> +		p =3D build_property(name, d, NULL);
> +		add_property(node, p);

You can add the property first, then share the data_append_data()
logic with the previous case.

> +	}
> +
> +}
> +
> +static void append_unique_u32_to_property(struct node *node, char *name,=
 fdt32_t value)
> +{
> +	struct data d;
> +	struct property *p;
> +
> +	p =3D get_property(node, name);
> +	if (p) {
> +		const fdt32_t *v;
> +
> +		for (v =3D (const void *)p->val.val; (const void *)v < (const void *)(=
p->val.val + p->val.len - 3); v++) {
> +			if (*v =3D=3D value)

Probably more elegant to get the length of the property in words
first.

> +				/* value already contained */
> +				return;
> +		}
> +
> +		d =3D data_add_marker(p->val, TYPE_UINT32, name);
> +		d =3D data_append_data(d, &value, 4);
> +		p->val =3D d;
> +	} else {
> +		d =3D data_add_marker(empty_data, TYPE_UINT32, name);
> +		d =3D data_append_data(d, &value, 4);
> +		p =3D build_property(name, d, NULL);
> +		add_property(node, p);
> +	}
> +}
> +
>  struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
>  {
>  	struct reserve_info *new =3D xmalloc(sizeof(*new));
> @@ -939,7 +993,7 @@ static void add_fixup_entry(struct dt_info *dti, stru=
ct node *fn,
> =20
>  	xasprintf(&entry, "%s:%s:%u",
>  			node->fullpath, prop->name, m->offset);
> -	append_to_property(fn, m->ref, entry, strlen(entry) + 1, TYPE_STRING);
> +	append_unique_str_to_property(fn, m->ref, entry, strlen(entry) + 1);
> =20
>  	free(entry);
>  }
> @@ -1020,7 +1074,7 @@ static void add_local_fixup_entry(struct dt_info *d=
ti,
>  	free(compp);
> =20
>  	value_32 =3D cpu_to_fdt32(m->offset);
> -	append_to_property(wn, prop->name, &value_32, sizeof(value_32), TYPE_UI=
NT32);
> +	append_unique_u32_to_property(wn, prop->name, value_32);
>  }
> =20
>  static void generate_local_fixups_tree_internal(struct dt_info *dti,
> @@ -1056,29 +1110,16 @@ void generate_label_tree(struct dt_info *dti, con=
st char *name, bool allocph)
> =20
>  void generate_fixups_tree(struct dt_info *dti, const char *name)
>  {
> -	struct node *n =3D get_subnode(dti->dt, name);
> -
> -	/* Start with an empty __fixups__ node to not get duplicates */
> -	if (n)
> -		n->deleted =3D true;
> -
>  	if (!any_fixup_tree(dti, dti->dt))
>  		return;
> -	generate_fixups_tree_internal(dti,
> -				      build_and_name_child_node(dti->dt, name),
> +	generate_fixups_tree_internal(dti, build_root_node(dti->dt, name),
>  				      dti->dt);

It's not obvious to me why this change follows from the rest.

>  }
> =20
>  void generate_local_fixups_tree(struct dt_info *dti, const char *name)
>  {
> -	struct node *n =3D get_subnode(dti->dt, name);
> -
> -	/* Start with an empty __local_fixups__ node to not get duplicates */
> -	if (n)
> -		n->deleted =3D true;
>  	if (!any_local_fixup_tree(dti, dti->dt))
>  		return;
> -	generate_local_fixups_tree_internal(dti,
> -					    build_and_name_child_node(dti->dt, name),
> +	generate_local_fixups_tree_internal(dti, build_root_node(dti->dt, name),
>  					    dti->dt);
>  }
> diff --git a/tests/retain-fixups.dts b/tests/retain-fixups.dts
> new file mode 100644
> index 000000000000..7b7b52210659
> --- /dev/null
> +++ b/tests/retain-fixups.dts
> @@ -0,0 +1,29 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +	fixup-node {
> +		property =3D <0xffffffff>;
> +		property-with-fixup =3D <0xffffffff>;
> +		property-with-label =3D <&somenode>;
> +		property-with-label-and-fixup =3D <&somenode>;
> +	};
> +
> +	label: local-fixup-node {
> +		property =3D <0xffffffff>;
> +		property-with-local-fixup =3D <0xffffffff>;
> +		property-with-local-label =3D <&label>;
> +		property-with-local-label-and-fixup =3D <&label>;
> +	};
> +=09
> +	__fixups__ {
> +		somenode =3D "/fixup-node:property-with-fixup:0", "/fixup-node:propert=
y-with-label-and-fixup:0";
> +	};
> +
> +	__local_fixups__ {
> +		local-fixup-node {
> +			property-with-local-fixup =3D <0x00>;
> +			property-with-local-label-and-fixup =3D <0x00>;
> +		};
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index fecfe7cc09b3..1c9278d93689 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -666,6 +666,11 @@ dtc_tests () {
>          run_test dtbs_equal_ordered $tree.test.dtb $tree.test.dts.test.d=
tb
>      done
> =20
> +    # Check preservation of __fixups__ and __local_fixups__
> +    run_dtc_test -I dts -O dtb -o retain-fixups.test.dtb "$SRCDIR/retain=
-fixups.dts"
> +    run_fdtget_test "/fixup-node:property-with-fixup:0 /fixup-node:prope=
rty-with-label-and-fixup:0 /fixup-node:property-with-label:0" retain-fixups=
=2Etest.dtb /__fixups__ somenode
> +    run_fdtget_test "property-with-local-fixup\nproperty-with-local-labe=
l-and-fixup\nproperty-with-local-label" -p retain-fixups.test.dtb /__local_=
fixups__/local-fixup-node
> +
>      # Check -Oyaml output
>      if ! $no_yaml; then
>              for tree in type-preservation; do
>=20
> base-commit: 84d9dd2fcbc865a35d7f04d9b465b05ef286d281

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--aoTlNSruoHYDKOSX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmidkecACgkQzQJF27ox
2Ge+vA//f3jKR3LYM4tonjfMScHRPWC6OcyBItfD6eFaF17cLYVZbKfkSOGWj32G
IFyLMsX+H1hVxWVe84lT/R/etqdTMeN9UO5SpZWimpYuM9FmDWt48gNgVINshsDO
009P795XvEjDAVQKFziW/xuuPyCz7089Sidl51IsJre6hfI9t1R7L7VkG1+Ip82/
T7FZ+7P/IUcWZJHeUgFUt+jEeneWf6k5gy7m3rT4/50J9YWpf8mU9wwCkHNRF89G
U6UQaVNwc+B0k8xUnPbxR80BLrFzcb8P8sYoScKCPjT+lBAaUMGfk+xrD/FDHeGE
ydpUnYccGLC8lQxxIYw+fEOFHsKOfn+yidQqzBFMK68mwE3F41vzrFyXnxoIfzGK
Fxu3gSW1dO9y3jyBnaqfZ2BHoGuKW0l3fBeGNQ9VHgewlkOGJk1amCGPH3XB/2v/
3FRozHcu98v/qYaphDaV0UI6FJVRp8ZQHxUxYB7jp5Z7GfkgKQpZ1c8FHXlhW+tD
ZiIjFUQUe7pfZaP3huXHfsFQK2WmXQIHAFHp7+YAtUWvM6IefI1SXBtnDR+RpgRw
GjXTyJiKspUgOFpKe1KUInChsm6M6wSJBC/1tgNVFw86507VmPtSzzZ0UpKlpSJG
EN7TNqsFKKUAVrDJ8xLyyeHp287jpmDr2G/JtU5v9t7SS1ccr74=
=8ScJ
-----END PGP SIGNATURE-----

--aoTlNSruoHYDKOSX--
