Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014917E1
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Dec 2024 00:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733272451; cv=none; b=iwLxdnuhzmGjpXPS0cpvEgH1b3VFKCQnG3JQsrMFBIx4jUS2w/bxbsjd5O6DMmg4cO8aSBMvNWlPdQS2Cd1lZGhYbbP4HZJmrctWvZsjH+EiaHPvP49wHy44ebDb3V7EXqPpRavmDaMbwCaevzhpDGTVbmUwp7SzIxfMoqz5ytQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733272451; c=relaxed/simple;
	bh=a4iVoyth8MVtC30Ms5Wp1MtotCMo+/B+lN6EL4q4GRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqdmTYtJ7hb6/i4LmjSnv2KHXUnrz46YQ0J6qvEPe7QcPJvP0a7ROcw3e++5RaB77o9onVkJXjN0SWzPrKV8Z4cuphTKY0mGTOSRNbskYR7IKyr16drRJig+eqUelFpVjIRiVf0ESoVRn6ahMb0hB40zEgvohMk31wbtHpC+Xwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=jWdpTHy/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="jWdpTHy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733272442;
	bh=U9sACK6Rw6pK7PZS+3IiLI3XdD61z0emKhYCsPbHTYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWdpTHy/6XmHKd8/PmT81XO2PsOVcjKd3qLWtVPAGT6ZSejZR0vmgoiDrojtLeb5O
	 I79E4rjZIfhINRYz5C4qKfmiK1F5ef/VsVEQQhQWsHxePT9xAFHgvS5b5nebNapn76
	 6tZ4dAg4oCvmyL+m6rhwUPT56pTEsTvOaU2nSNmtgR2vWS1mkrB8iy3wzqDS6mPPIN
	 LORv6WN3dKyRD1IoxJk5y+3kAJvyhSF8f+tKSsf0Tuq4aXz8gnvmjG6qk6cfuucnxa
	 WF4oxNLYhp7+8tPDNYtcyKuyeTf1s0AjgI22RIWK+oG265KdfCbq+UWdaoWzl8Gjju
	 AfncLYRmMPAIw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y2z6L1fByz4xfm; Wed,  4 Dec 2024 11:34:02 +1100 (AEDT)
Date: Wed, 4 Dec 2024 11:29:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 3/4] libfdt: Add fdt_setprop_namelen()
Message-ID: <Z0-iguejSh5ck10h@zatzit>
References: <20241203-setprop-namelen-v1-0-d1ea333fbd6c@beagleboard.org>
 <20241203-setprop-namelen-v1-3-d1ea333fbd6c@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T9MIN2Yr5808eE04"
Content-Disposition: inline
In-Reply-To: <20241203-setprop-namelen-v1-3-d1ea333fbd6c@beagleboard.org>


--T9MIN2Yr5808eE04
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2024 at 12:00:01AM +0530, Ayush Singh wrote:
> Allow specifying name length in setprop similar to
> `fdt_get_property_namelen` functions.
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

Two really minor revisions suggested below, otherwise this looks good.

> ---
>  libfdt/fdt_rw.c    | 41 +++++++++++++++------------
>  libfdt/libfdt.h    | 81 ++++++++++++++++++++++++++++++++++++++++++++++++=
+++---
>  libfdt/version.lds |  2 ++
>  3 files changed, 103 insertions(+), 21 deletions(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 3621d3651d3f4bd82b7af66c60d023e3139add03..33c60063cd721a147a3c6c0e7=
0450c98d8dbd772 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -124,31 +124,33 @@ static int fdt_splice_string_(void *fdt, int newlen)
>   *	allocated. Ignored if can_assume(NO_ROLLBACK)
>   * @return offset of string in the string table (whether found or added)
>   */
> -static int fdt_find_add_string_(void *fdt, const char *s, int *allocated)
> +static int fdt_find_add_string_(void *fdt, const char *s, int slen,
> +				int *allocated)
>  {
>  	char *strtab =3D (char *)fdt + fdt_off_dt_strings(fdt);
>  	const char *p;
>  	char *new;
> -	int len =3D strlen(s) + 1;
>  	int err;
> =20
>  	if (!can_assume(NO_ROLLBACK))
>  		*allocated =3D 0;
> =20
> -	p =3D fdt_find_string_(strtab, fdt_size_dt_strings(fdt), s);
> +	p =3D fdt_find_string_len_(strtab, fdt_size_dt_strings(fdt), s, slen);
>  	if (p)
>  		/* found it */
>  		return (p - strtab);
> =20
>  	new =3D strtab + fdt_size_dt_strings(fdt);
> -	err =3D fdt_splice_string_(fdt, len);
> +	err =3D fdt_splice_string_(fdt, slen + 1);
>  	if (err)
>  		return err;
> =20
>  	if (!can_assume(NO_ROLLBACK))
>  		*allocated =3D 1;
> =20
> -	memcpy(new, s, len);
> +	memcpy(new, s, slen);
> +	new[slen] =3D '\0';
> +
>  	return (new - strtab);
>  }
> =20
> @@ -182,12 +184,14 @@ int fdt_del_mem_rsv(void *fdt, int n)
>  }
> =20
>  static int fdt_resize_property_(void *fdt, int nodeoffset, const char *n=
ame,
> -				int len, struct fdt_property **prop)
> +				int namelen, int len,
> +				struct fdt_property **prop)

Nit: I'd prefer to see name and namelen grouped together on a line,
then len and prop can go on the next.

>  {
>  	int oldlen;
>  	int err;
> =20
> -	*prop =3D fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
> +	*prop =3D fdt_get_property_namelen_w(fdt, nodeoffset, name, namelen,
> +					   &oldlen);
>  	if (!*prop)
>  		return oldlen;
> =20
> @@ -200,7 +204,7 @@ static int fdt_resize_property_(void *fdt, int nodeof=
fset, const char *name,
>  }
> =20
>  static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
> -			     int len, struct fdt_property **prop)
> +			     int namelen, int len, struct fdt_property **prop)
>  {
>  	int proplen;
>  	int nextoffset;
> @@ -211,7 +215,7 @@ static int fdt_add_property_(void *fdt, int nodeoffse=
t, const char *name,
>  	if ((nextoffset =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
>  		return nextoffset;
> =20
> -	namestroff =3D fdt_find_add_string_(fdt, name, &allocated);
> +	namestroff =3D fdt_find_add_string_(fdt, name, namelen, &allocated);
>  	if (namestroff < 0)
>  		return namestroff;
> =20
> @@ -255,17 +259,18 @@ int fdt_set_name(void *fdt, int nodeoffset, const c=
har *name)
>  	return 0;
>  }
> =20
> -int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
> -			    int len, void **prop_data)
> +int fdt_setprop_namelen_placeholder(void *fdt, int nodeoffset, const cha=
r *name,
> +				    int namelen, int len, void **prop_data)

Sorry, I gave you bad advice in my earlier message.  I'd prefer this
to be "fdt_setprop_placeholder_namelen()" (compare
"fdt_add_subnode_namelen()").

>  {
>  	struct fdt_property *prop;
>  	int err;
> =20
>  	FDT_RW_PROBE(fdt);
> =20
> -	err =3D fdt_resize_property_(fdt, nodeoffset, name, len, &prop);
> +	err =3D fdt_resize_property_(fdt, nodeoffset, name, namelen, len, &prop=
);
>  	if (err =3D=3D -FDT_ERR_NOTFOUND)
> -		err =3D fdt_add_property_(fdt, nodeoffset, name, len, &prop);
> +		err =3D fdt_add_property_(fdt, nodeoffset, name, namelen, len,
> +					&prop);
>  	if (err)
>  		return err;
> =20
> @@ -273,13 +278,14 @@ int fdt_setprop_placeholder(void *fdt, int nodeoffs=
et, const char *name,
>  	return 0;
>  }
> =20
> -int fdt_setprop(void *fdt, int nodeoffset, const char *name,
> -		const void *val, int len)
> +int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
> +			int namelen, const void *val, int len)
>  {
>  	void *prop_data;
>  	int err;
> =20
> -	err =3D fdt_setprop_placeholder(fdt, nodeoffset, name, len, &prop_data);
> +	err =3D fdt_setprop_namelen_placeholder(fdt, nodeoffset, name, namelen,
> +					      len, &prop_data);
>  	if (err)
>  		return err;
> =20
> @@ -307,7 +313,8 @@ int fdt_appendprop(void *fdt, int nodeoffset, const c=
har *name,
>  		prop->len =3D cpu_to_fdt32(newlen);
>  		memcpy(prop->data + oldlen, val, len);
>  	} else {
> -		err =3D fdt_add_property_(fdt, nodeoffset, name, len, &prop);
> +		err =3D fdt_add_property_(fdt, nodeoffset, name, strlen(name),
> +					len, &prop);
>  		if (err)
>  			return err;
>  		memcpy(prop->data, val, len);
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 7d0c252a34970f4ca841935f8088410a3970127a..c9c81f039365b6d244932786a=
84a05f065e67c33 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1666,6 +1666,38 @@ int fdt_del_mem_rsv(void *fdt, int n);
>   */
>  int fdt_set_name(void *fdt, int nodeoffset, const char *name);
> =20
> +/**
> + * fdt_setprop_namelen - create or change a property
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node whose property to change
> + * @name: name of the property to change
> + * @namelen: length of the name
> + * @val: pointer to data to set the property value to
> + * @len: length of the property value
> + *
> + * fdt_setprop_namelen() sets the value of the named property in the giv=
en
> + * node to the given value and length, creating the property if it
> + * does not already exist.
> + *
> + * This function may insert or delete data from the blob, and will
> + * therefore change the offsets of some existing nodes.
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
> + *		contain the new property value
> + *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
> + *	-FDT_ERR_BADLAYOUT,
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_BADVERSION,
> + *	-FDT_ERR_BADSTATE,
> + *	-FDT_ERR_BADSTRUCTURE,
> + *	-FDT_ERR_BADLAYOUT,
> + *	-FDT_ERR_TRUNCATED, standard meanings
> + */
> +int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
> +			int namelen, const void *val, int len);
> +
>  /**
>   * fdt_setprop - create or change a property
>   * @fdt: pointer to the device tree blob
> @@ -1694,8 +1726,44 @@ int fdt_set_name(void *fdt, int nodeoffset, const =
char *name);
>   *	-FDT_ERR_BADLAYOUT,
>   *	-FDT_ERR_TRUNCATED, standard meanings
>   */
> -int fdt_setprop(void *fdt, int nodeoffset, const char *name,
> -		const void *val, int len);
> +static inline int fdt_setprop(void *fdt, int nodeoffset, const char *nam=
e,
> +			      const void *val, int len)
> +{
> +	return fdt_setprop_namelen(fdt, nodeoffset, name, strlen(name), val,
> +				   len);
> +}
> +
> +/**
> + * fdt_setprop_namelen_placeholder - allocate space for a property
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node whose property to change
> + * @name: name of the property to change
> + * @namelen: length of the name
> + * @len: length of the property value
> + * @prop_data: return pointer to property data
> + *
> + * fdt_setprop_namelen_placeholder() allocates the named property in the=
 given node.
> + * If the property exists it is resized. In either case a pointer to the
> + * property data is returned.
> + *
> + * This function may insert or delete data from the blob, and will
> + * therefore change the offsets of some existing nodes.
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
> + *		contain the new property value
> + *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
> + *	-FDT_ERR_BADLAYOUT,
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_BADVERSION,
> + *	-FDT_ERR_BADSTATE,
> + *	-FDT_ERR_BADSTRUCTURE,
> + *	-FDT_ERR_BADLAYOUT,
> + *	-FDT_ERR_TRUNCATED, standard meanings
> + */
> +int fdt_setprop_namelen_placeholder(void *fdt, int nodeoffset, const cha=
r *name,
> +				    int namelen, int len, void **prop_data);
> =20
>  /**
>   * fdt_setprop_placeholder - allocate space for a property
> @@ -1725,8 +1793,13 @@ int fdt_setprop(void *fdt, int nodeoffset, const c=
har *name,
>   *	-FDT_ERR_BADLAYOUT,
>   *	-FDT_ERR_TRUNCATED, standard meanings
>   */
> -int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
> -			    int len, void **prop_data);
> +static inline int fdt_setprop_placeholder(void *fdt, int nodeoffset,
> +					  const char *name, int len,
> +					  void **prop_data)
> +{
> +	return fdt_setprop_namelen_placeholder(fdt, nodeoffset, name,
> +					       strlen(name), len, prop_data);
> +}
> =20
>  /**
>   * fdt_setprop_u32 - set a property to a 32-bit integer
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> index 989cd89f1051ce59255a3b3e60493be4e5e985cc..76ba8f6758cef16efbad28134=
64e824de594b646 100644
> --- a/libfdt/version.lds
> +++ b/libfdt/version.lds
> @@ -43,6 +43,7 @@ LIBFDT_1.2 {
>  		fdt_add_mem_rsv;
>  		fdt_del_mem_rsv;
>  		fdt_set_name;
> +		fdt_setprop_namelen;
>  		fdt_setprop;
>  		fdt_delprop;
>  		fdt_add_subnode_namelen;
> @@ -71,6 +72,7 @@ LIBFDT_1.2 {
>  		fdt_find_max_phandle;
>  		fdt_generate_phandle;
>  		fdt_check_full;
> +		fdt_setprop_namelen_placeholder;
>  		fdt_setprop_placeholder;
>  		fdt_property_placeholder;
>  		fdt_header_size_;
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--T9MIN2Yr5808eE04
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdPooIACgkQzQJF27ox
2GfziBAAk7n31g3EEBm95Ui10dTo2sMHmh4lBdunLLUOnNfjX9NrgMuYbs36DLw9
T2BJI8Xa0hu1qApVK3Ktt13l8FtWlWqLMkWFYueSSsv7HFwuS1+kW+GgQxUmH04q
tzxZpikWcYri6g2fADNmO4Jgfp0ovMDrY30SIe7+XFbNsMfrWvedce1p4EpVMqDf
SvZ+zIVmfArGbD5BPEIJ654j90YMvwVHg4C2g186tJ3Xp9IQRESf1pNsah/I+A8s
z8XgU+VZ62ch5eb42ryESwg2ouQeKdO0VOAIezidvhsTqIGfSG5S3XYb7QeKS0Op
2Uiov6P9Rc3alQr6Cm7uk/RAFhjq3GVIajRGt9tpxLrv8JcahQgvKh/Wqr++tbhL
1PIQj2hOk6BmS7UvEulvSmfShn42IRSr1xBw6LdlV/m641I+D1DtnBQRFdVRkv9F
w2tkjOsFPZNeXPhX8uZ33uCMuV/ll+PawsTNHw9MEfL+Flvwx5n47hM5/ABJXBCA
mrBBM+7MXewinm5BJ+fxY0csxPpvC+rbRgNuCMvqnBSF920ZJNLmRKwNr8yU0IGN
yISuXIDyZvIE7k5EYzS0nMDwJTWWVGJYOhAHGJtf0U7BOef5VKAqIPfxxGtQ/HM5
LquofI4S021g0gWjD7CqmukC5WgQEF7y+NwdmGHQtJl6F06FjG0=
=Hz7m
-----END PGP SIGNATURE-----

--T9MIN2Yr5808eE04--
