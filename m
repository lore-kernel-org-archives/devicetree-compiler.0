Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689211DC9B5
	for <devicetree-compiler@vger.kernel.org>; Sat, 16 Aug 2025 04:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755320091; cv=none; b=n6rGWSW8HuGjLQmyE0yhJoOIqCc/+4YB+fYUSQnHrK46WfauYIjgZNDYeYRxNVsXDhkcTkzS1EcwHBCjRBHK84pLtYXpVDgGqhCTiv+FKcVa+jseXCAIF2bklJW4aTG80CXfhojxrB5AlAfwRsauL+3PH/FWy20NLKiP/2Py/jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755320091; c=relaxed/simple;
	bh=HrCRS+uDaZVZhQvlLMIj3MKCvtiGdVzZMHBy+ciEsvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mq9sNPja66VWRbMP6dC8vvTFqEKlMUd1uoSrPY+KzR1hpqsAPO6H/wchYsFCoPDy/Zy2xokd/lVMIQDE+mhD/CfAsVj7s/qvr+j7yTwkkn5hpIOzRBV495qLKyBheVA9i2STVrcXjhns4iXBOIg82Pe35YeMe6ESFH5+g5SEc3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=U5qBq2BX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="U5qBq2BX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755320081;
	bh=MBifry1t5v+KerfIfx4BqRAJb5dH9Q0orFgL60Uf+J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5qBq2BXcylMzzGpsQhScw60Ov4Gm3BbCaKGg/pdd30COeXIbgNTqEHZKv267J7l0
	 TfqBBMrftyLL1zfgy6xsoAe5vtvxuX6vVALrzPFrO9JwYMS1nCf8yEQH/bRaAN9jKC
	 YchsT7HdWw+KanYOimjJNH0r3fCW6+DpS+o4JTLpPXwPO+nLG8p/rY5DdH/4RJM2c6
	 vSJ9qBwvYp2Rm8De07TemhGSVsa8WgD2vJxSnVhgdEheiVl5gfzew6NI/T6W98Th9A
	 Uu2T9paZj9b04hQLP54zKgJEM0DS557FVmLG8RIXEbK2wHgiLw1dgi6ezyXVyRDSN5
	 neoA/jOuzSrug==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c3mqP0v4Bz4xfJ; Sat, 16 Aug 2025 14:54:41 +1000 (AEST)
Date: Sat, 16 Aug 2025 14:54:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 2/2] livetree: Add only new data to fixup nodes
 instead of complete regeneration
Message-ID: <aKAPA4EAI_RAm64c@zatzit>
References: <cover.1755264521.git.u.kleine-koenig@baylibre.com>
 <68b0f2845c5b7b439c3d5decb518ec3e236c426c.1755264521.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tnbaHwz11LuOzZKS"
Content-Disposition: inline
In-Reply-To: <68b0f2845c5b7b439c3d5decb518ec3e236c426c.1755264521.git.u.kleine-koenig@baylibre.com>


--tnbaHwz11LuOzZKS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 03:34:54PM +0200, Uwe Kleine-K=F6nig wrote:
> Removing the complete __fixups__ and __local_fixups__ tree might delete
> data that should better be retained. See the added test for a situation
> that was broken before.
>=20
> Note that without removing /__fixups__ and /__local_fixups__ in
> generate_fixups_tree() and generate_local_fixups_tree() respectively
> calling build_and_name_child_node() isn't safe as the nodes might
> already exist and then a duplicate would be added. So build_root_node()
> has to be used which copes correctly here.
>=20
> Fixes: 915daadbb62d ("Start with empty __local_fixups__ and __fixups__ no=
des")
> Closes: https://github.com/dgibson/dtc/issues/170
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
>  livetree.c              | 75 +++++++++++++++++++++++++++++++----------
>  tests/retain-fixups.dts | 29 ++++++++++++++++
>  tests/run_tests.sh      |  5 +++
>  3 files changed, 92 insertions(+), 17 deletions(-)
>  create mode 100644 tests/retain-fixups.dts
>=20
> diff --git a/livetree.c b/livetree.c
> index 6127d604d528..f23988483b01 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -352,6 +352,60 @@ void append_to_property(struct node *node,
>  	p->val =3D data_append_data(p->val, data, len);
>  }
> =20
> +static void append_unique_str_to_property(struct node *node,
> +					  char *name, const char *data, int len)
> +{
> +	struct property *p;
> +
> +	p =3D get_property(node, name);
> +	if (p) {
> +		if (p->val.val[p->val.len - 1] =3D=3D '\0') {
> +			const char *s;
> +
> +			for (s =3D p->val.val; s < p->val.val + p->val.len; s =3D strchr(s, '=
\0') + 1) {
> +				if (strcmp(data, s) =3D=3D 0)
> +					/* data already contained in node.name */
> +					return;
> +			}
> +		} else {
> +			fprintf(stderr, "Warning: appending string to non-string property %s/=
%s\n",
> +				node->fullpath, name);

I don't think carrying on with the operation when the original
property is malformed is a good idea.  This message will also be
pretty confusing in the one place it will occur.  I think it would be
preferable to return an error code here.  The caller, which knows what
the purpose is can then report that the relevant property is malformed
- if that's the case, I think we can just give up on updating
__fixups__ / __local_fixups__.

> +		}
> +	} else {
> +		p =3D build_property(name, empty_data, NULL);
> +		add_property(node, p);
> +	}
> +
> +	p->val =3D data_add_marker(p->val, TYPE_STRING, name);
> +	p->val =3D data_append_data(p->val, data, len);
> +}
> +
> +static void append_unique_u32_to_property(struct node *node, char *name,=
 fdt32_t value)
> +{
> +	struct property *p;
> +
> +	p =3D get_property(node, name);
> +	if (p) {
> +		if (p->val.len % 4 =3D=3D 0) {
> +			const fdt32_t *v, *val_end =3D (const fdt32_t *)p->val.val + p->val.l=
en / 4;
> +
> +			for (v =3D (const void *)p->val.val; v < val_end; v++) {
> +				if (*v =3D=3D value)
> +					/* value already contained */
> +					return;
> +			}
> +		} else {
> +			fprintf(stderr, "Warning: appending u32 to property %s/%s with an una=
lign length\n",
> +				node->fullpath, name);

Similar comments here.

> +		}
> +	} else {
> +		p =3D build_property(name, empty_data, NULL);
> +		add_property(node, p);
> +	}
> +	p->val =3D data_add_marker(p->val, TYPE_UINT32, name);
> +	p->val =3D data_append_data(p->val, &value, 4);
> +}
> +
>  struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
>  {
>  	struct reserve_info *new =3D xmalloc(sizeof(*new));
> @@ -935,7 +989,7 @@ static void add_fixup_entry(struct dt_info *dti, stru=
ct node *fn,
> =20
>  	xasprintf(&entry, "%s:%s:%u",
>  			node->fullpath, prop->name, m->offset);
> -	append_to_property(fn, m->ref, entry, strlen(entry) + 1, TYPE_STRING);
> +	append_unique_str_to_property(fn, m->ref, entry, strlen(entry) + 1);
> =20
>  	free(entry);
>  }
> @@ -1016,7 +1070,7 @@ static void add_local_fixup_entry(struct dt_info *d=
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
> @@ -1052,29 +1106,16 @@ void generate_label_tree(struct dt_info *dti, con=
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
> index 000000000000..ec09db8b441c
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
> +
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

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--tnbaHwz11LuOzZKS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmigDvwACgkQzQJF27ox
2Gdu6A/8DDVlj2OINvaHKAFaHricuHcUJeDYgZxfrzWAwZsHKpwFuIP9e4jygQwq
vC4Oq11OYAlQARJ1yaheLCeee+cV6tyVxUbHS9cg0Ntixq82dgDD3u3Es6vrHQtQ
CuESUxwgsCbiFm7hPoD6ieZC1Mxt7B1WrkRwU/RTq1/W4lTsUddLQz/UZY0TZQQt
F6q6RbWUEhkpxK2TvIadN1BuftjfuPuiD9M8N5Cu6wfuqf2bKG979mNSZ0GupkE5
yOJhw2+ABysG9p9YqRf7fM+mxUXeoKZvqLXqzFWl4F7dAwksqrqDJeRhgMBD3XVh
SbC0P9vx8/y0+f7t4JwOwuTAlEeSNF5kOX92w5+SipTR849f4x/NudDvWolbOFUB
jh7bDbStAZM2A/97q1fOmNrWSHks5OaZICLxHPoAhmlqnB7mEqyKv9TfCPtxPOmv
o+FAIMyoemo33XU//6iCmIMTwkzT94IZT688mhiha5BV9dMEZbz7LIBbTls/CM8k
HSq0fFa8nTdvJIlvgsyWF+qsNnxWAwL0H3lLXZSFcq9zPDuqXK+B1azfo5w62YBO
8AgUls9T1bRPmQbHbAn2cj5ZmN8T56lyUKnVvNxeA0mpzUkokV5anLPE5mGFV+xV
rfcrLrllv8B4P5Lkbg8H6poWDTHC+ygQ3WJJy+3ZdHZlsbDbIIQ=
=0mht
-----END PGP SIGNATURE-----

--tnbaHwz11LuOzZKS--
