Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588821;
	b=jvw8udJZGOuCRD8mw0c0T2mvB4Ors/Z9g4K3+urRS+zlqUIwLFb8CZV6v5lXpBRtPdf3
	 GKzgLcai7RdBO5T7ndbXBXLeInhgXr7lfPKdmxZyVA8gR/wZB/a4GCk6dCdViUCRpgxWb
	 P7L1/yvjiiLaU2G/RB2NiO6Ab1W08vsiyaB9QQrz/fJIC92hb22CujTpNOYdREMnljApi
	 BAHq6ZB1wTikTt8DQFnhBdpuo3H7u4rjLSk0lrXKk+FTVp6Fg2qzdB+JqiJmwj5ybzLix
	 x2cJNQq75M+rKw0S4VXpBwvfR4cvKaT4KvtJloLRbUe4+miMGxkiQlawDuaZFA6YwGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588821;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=kAtVSPS2FpwI3Qw1goAHUpw/aIBZXLTiKH3rA3cEMCI=;
	b=B4o6UJNfhWf4cr3qIc/ADEFhN6+8tNcUigWMGh1rm352GNbAMYZS22ZqCXE7w0wZIQAv
	 rooLdEjK4Fa0cyyfchKpiB90m2t2zkfQDv1U323IdfNf1YIJTtgXP2cpoMVAw37kCKgLF
	 F7VtBZ4+FFUP9NPRiBjLCDS4ISEfoiQ/DLAFuxG6/V2SlRGs1+8zM9YeFhBUHMm8e7bWa
	 yh27wjSGtGQQLFjyY5evKH4msgNf8cxVm8iXMeBfTf/cfJQDixCUMP73UjjCbMZm0uwIK
	 jgATNxOxUee8NldEEp349uWnRmbdPstuf47P2dXq/GoNELXELtqv3ZGS7EudrbL+4Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=KspJHQa8;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5936A606A331
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Nov 2026 06:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5936A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=KspJHQa8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795588818;
	bh=kAtVSPS2FpwI3Qw1goAHUpw/aIBZXLTiKH3rA3cEMCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KspJHQa8LcjDl3ybHZeTdFp87h6Js4g6PZXw/q0oHqshJsiJANGk+uVGCoZRNZYWN
	 zEmGQLGQKjTRxj47kwd5Z06ooCrnfdCpNHo8DqvoEwHEXSBWtGga+MNMVTtE5tEooF
	 CAeIyYL7SznX6RakgrlreNyrAa6ln1Pyx+ZqMZddVvkD/MyZAWb0/RuOU7TAi21590
	 snlR7jUyiqrUwSYeg0W2zvp/eYQC1kyaiB81PhIzfJviOQniYaHuReAfL1TlmA1UCV
	 auoAZ9UMi2S1lXDynhiwAfrfSbVPN0AfinMfjPm8kn6HBVmOaQtqeuuWZSjJaBsZHW
	 EJivd7cMC3Gpw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZ96B3klPz4wJL; Wed, 25 Nov 2026 17:40:18 +1100 (AEDT)
Date: Wed, 25 Nov 2026 17:24:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 10/10] dtc: Move first-reference handling out of the
 grammar
Message-ID: <awZ_BBMhpIAHjFeW@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-11-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="DamGCMYE5Sk2O1yJ"
Content-Disposition: inline
In-Reply-To: <20261116235813.935070-11-sjg@chromium.org>

--DamGCMYE5Sk2O1yJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:58:04PM -0700, Simon Glass wrote:
> In a plugin, the first top-level fragment can refer to a label or path
> instead of being the root node. The grammar action for this holds its
> merge logic, which makes an overlay fragment in a new tree.
>=20
> Move it into a new merge_first_ref(), passing it a struct fragment for
> the reference and node. This is the last user of is_ref_relative() in
> the grammar, so make that function static.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

I'm still hoping we can unify the first source layer handling with
other source layers a bit more neatly.  But this is an ok interim step
towards that.

> ---
>=20
> Changes in v4:
> - Free the fragment after merging it
>=20
> Changes in v2:
> - Return true on success from merge_first_ref()
> - Use dt_ref instead of fragment_ref
>=20
>  dtc-parser.y | 14 ++++++--------
>  dtc.h        |  2 +-
>  livetree.c   | 30 +++++++++++++++++++++++++++++-
>  3 files changed, 36 insertions(+), 10 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 6f7ef24..0f254b5 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -164,19 +164,17 @@ devicetree:
>  		}
>  	| dt_ref nodedef
>  		{
> +			struct fragment *f;
> +
> +			f =3D build_fragment_ref(NULL, $1, &@1, $2);
>  			/*
>  			 * We rely on the rule being always:
>  			 *   versioninfo plugindecl memreserves devicetree
>  			 * so $-1 is what we want (plugindecl)
>  			 */
> -			if (!($<flags>-1 & DTSF_PLUGIN))
> -				ERROR(&@2, "Label or path %s not found", $1);
> -			else if (is_ref_relative($1))
> -				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1=
);
> -			$$ =3D add_orphan_node(
> -					name_node(build_node(NULL, NULL, NULL),
> -						  ""),
> -					$2, $1);
> +			if (!merge_first_ref(&$$, f, $<flags>-1 & DTSF_PLUGIN))
> +				treesource_error =3D true;
> +			free_fragment(f);
>  		}
>  	| devicetree DT_LABEL dt_ref nodedef
>  		{
> diff --git a/dtc.h b/dtc.h
> index c5b8aee..f856edb 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -351,7 +351,7 @@ struct fragment *build_fragment_delete_node(char *ref,
>  struct fragment *build_fragment_omit_if_no_ref(char *ref,
>  					       struct srcpos *ref_srcpos);
>  void free_fragment(struct fragment *f);
> -bool is_ref_relative(const char *ref);
> +bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin);
>  bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
>  bool merge_delete_node(struct node *dt, struct fragment *f);
>  bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> diff --git a/livetree.c b/livetree.c
> index cf6849a..4756946 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -535,11 +535,39 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  }
> =20
>  /* Check whether a reference is relative to a label, e.g. &{label/node} =
*/
> -bool is_ref_relative(const char *ref)
> +static bool is_ref_relative(const char *ref)
>  {
>  	return ref[0] !=3D '/' && strchr(&ref[1], '/');
>  }
> =20
> +/*
> + * Make the tree at *dtp from a first fragment which refers to a label o=
r path,
> + * rather than being the root node. This is only valid in a plugin, wher=
e the
> + * fragment becomes an overlay fragment.
> + *
> + * Returns true on success, false on an error, which has been reported.
> + */
> +bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
> +{
> +	bool ok =3D true;
> +
> +	if (!plugin) {
> +		srcpos_error(f->node->srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		ok =3D false;
> +	} else if (is_ref_relative(f->ref)) {
> +		srcpos_error(f->node->srcpos, "Error",
> +			     "Label-relative reference %s not supported in plugin",
> +			     f->ref);
> +		ok =3D false;
> +	}
> +	/* Make a new, empty tree with a fragment@N node for the reference */
> +	*dtp =3D add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
> +			       f->node, f->ref);
> +
> +	return ok;
> +}
> +
>  /*
>   * Merge a fragment which refers to a label or path into the node it ref=
ers to,
>   * adding any label in the fragment to that node.
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--DamGCMYE5Sk2O1yJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGfwQACgkQzQJF27ox
2GdOVQ/9HjtviV1pUeNQGyXNEKAqbeA7201BRil17H4Wxc3vKmomTQ2npEDBuUb6
wZ9UEPC8sdPO+IpNZkSF55c8kfzAc9OSOivUQSkqCwS1GrWXSCR5Esbr/R/H9sZ0
ww4/w0dH6ztBO66P95lXbRuirhxI/+4K2qk8BDUl/hgkP9HSVgUoR/+1P/Us/A6t
JrtssyaaAvQ4l68J1i4oB52gLkkO+Xw+Fr7APSsvBzs7ciAKzJftrdCRM+9BCgTp
Yl99K7sJFIJPCg+Ut3XOjF5W9GGyCjEU7DuZ97DYeB7e0zOMUETxekaMpOFqH31p
WttKCQbxg3bR1bPXyRcqV/FSavynXZ0/8vLDwCsbP+9KIJfYmq+u60zxKYEUEZib
/MNjhmUGCP5WmM/LsogBzwsOlIuR0YOEvkZyQ2eXv051PLWzexI4P7Ik344+T47F
ZNfLoBb429ypuESmEK9Yudr23vyoUwNpVecvBPC6szz2cfQRePeFz9Mf4NtvjYe1
5S2X2hbm2xB9C7pgOj9mT75tLhj0Sg0v+7anV4LqrVLor03cDcV3XLMEt0YDIWqN
QkklLahvU005s2l0E3HFHVRf5Of5mB5a1Sa1Mn0zX9QkInQhZgtxu92z5Zi2xqtV
E/ILVMcAoU+LmTQ8myXWzpNFuji/iDcJ7O1AGJ2RhvyYTCka/ko=
=mfcn
-----END PGP SIGNATURE-----

--DamGCMYE5Sk2O1yJ--
