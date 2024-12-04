Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C458206F1E
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Dec 2024 23:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733355967; cv=none; b=rjdhO4BT5yxAEYb5KvxNIMclc1gnGusd287I4js/PuFv+ZlJcUq1B0turskUrNQZEYAL+H+cWpUiVT3j3ewRnvaM2NA7CtS9QVCrc0BYp+vkaoHrVMcHcehvvl3drYlgjXg8oQjCAO4g1y/YqG8bmWOQKrhwZ07roicwa/+4C1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733355967; c=relaxed/simple;
	bh=h1D8WmFAvgPI/pu+Db/E762ZNe+ioOpIP1uhFrV/7as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9ovKoBwbXyPceUftQyaI49zyeBImVINCFNYeqyC7p3HCeMudBsIsg/Mog6ovCRS2Cmew9whsOjzXGVbKEe+0XVwjxliqT3dq+CqDUwDNqJL1yaoOq5SfLkOaDeCTpPsbroTLbSPNlzGqUyZ3Qp4AVCvOEVgnJRJK5O5+CWS4h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=k/OkUzo6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="k/OkUzo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733355948;
	bh=HXx7fWvDblUBgcTfXJfCkoMgfnk+ehXM15auXqWR6+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/OkUzo6to8bpeV+0nljzpJgXYqcyi1TdesWrm+2kLBkqzVzz9wc1ZMcafFgMQTWU
	 lVIt3DiaRjVM6MnYOOdNYaeutA6pFbKHz3lTawp4V3EupGt+i84pys165pMZTrsq1n
	 j1boU5T47Q2YdyVIvqQNI478cDFFu5ss8afxQ+lga/JiQ5ZvGck6S3frIYOJgW/5hT
	 KADxjTJC5dqdy87JzodEDFBZOfTLeQFOmg7eWF8nuNb/gAsGKtQESLuoT6/HiG4WdY
	 lZsRTbabE42CZipeH9C1PWxhgKYiPaD9B2Ia4qnXUb7vQ1mnQP2AMb3IHAgFPeI9iL
	 T6H07N2D1QXmA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y3Z0D2Gxbz4xdQ; Thu,  5 Dec 2024 10:45:48 +1100 (AEDT)
Date: Thu, 5 Dec 2024 10:45:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 3/4] libfdt: Add fdt_setprop_namelen()
Message-ID: <Z1DpojG4q9-bD68G@zatzit>
References: <20241203-setprop-namelen-v1-0-d1ea333fbd6c@beagleboard.org>
 <20241203-setprop-namelen-v1-3-d1ea333fbd6c@beagleboard.org>
 <Z0-iguejSh5ck10h@zatzit>
 <125c0168-e6ba-4dc6-8ad7-fa9f283bfbf4@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y+s6n/CpEL/68Q8T"
Content-Disposition: inline
In-Reply-To: <125c0168-e6ba-4dc6-8ad7-fa9f283bfbf4@beagleboard.org>


--y+s6n/CpEL/68Q8T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2024 at 01:09:13PM +0530, Ayush Singh wrote:
>=20
>=20
> On 04/12/24 05:59, David Gibson wrote:
> > On Wed, Dec 04, 2024 at 12:00:01AM +0530, Ayush Singh wrote:
> > > Allow specifying name length in setprop similar to
> > > `fdt_get_property_namelen` functions.
> > >=20
> > > Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> >=20
> > Two really minor revisions suggested below, otherwise this looks good.
> >=20
> > > ---
> > >   libfdt/fdt_rw.c    | 41 +++++++++++++++------------
> > >   libfdt/libfdt.h    | 81 +++++++++++++++++++++++++++++++++++++++++++=
++++++++---
> > >   libfdt/version.lds |  2 ++
> > >   3 files changed, 103 insertions(+), 21 deletions(-)
> > >=20
> > > diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> > > index 3621d3651d3f4bd82b7af66c60d023e3139add03..33c60063cd721a147a3c6=
c0e70450c98d8dbd772 100644
> > > --- a/libfdt/fdt_rw.c
> > > +++ b/libfdt/fdt_rw.c
> > > @@ -124,31 +124,33 @@ static int fdt_splice_string_(void *fdt, int ne=
wlen)
> > >    *	allocated. Ignored if can_assume(NO_ROLLBACK)
> > >    * @return offset of string in the string table (whether found or a=
dded)
> > >    */
> > > -static int fdt_find_add_string_(void *fdt, const char *s, int *alloc=
ated)
> > > +static int fdt_find_add_string_(void *fdt, const char *s, int slen,
> > > +				int *allocated)
> > >   {
> > >   	char *strtab =3D (char *)fdt + fdt_off_dt_strings(fdt);
> > >   	const char *p;
> > >   	char *new;
> > > -	int len =3D strlen(s) + 1;
> > >   	int err;
> > >   	if (!can_assume(NO_ROLLBACK))
> > >   		*allocated =3D 0;
> > > -	p =3D fdt_find_string_(strtab, fdt_size_dt_strings(fdt), s);
> > > +	p =3D fdt_find_string_len_(strtab, fdt_size_dt_strings(fdt), s, sle=
n);
> > >   	if (p)
> > >   		/* found it */
> > >   		return (p - strtab);
> > >   	new =3D strtab + fdt_size_dt_strings(fdt);
> > > -	err =3D fdt_splice_string_(fdt, len);
> > > +	err =3D fdt_splice_string_(fdt, slen + 1);
> > >   	if (err)
> > >   		return err;
> > >   	if (!can_assume(NO_ROLLBACK))
> > >   		*allocated =3D 1;
> > > -	memcpy(new, s, len);
> > > +	memcpy(new, s, slen);
> > > +	new[slen] =3D '\0';
> > > +
> > >   	return (new - strtab);
> > >   }
> > > @@ -182,12 +184,14 @@ int fdt_del_mem_rsv(void *fdt, int n)
> > >   }
> > >   static int fdt_resize_property_(void *fdt, int nodeoffset, const ch=
ar *name,
> > > -				int len, struct fdt_property **prop)
> > > +				int namelen, int len,
> > > +				struct fdt_property **prop)
> >=20
> > Nit: I'd prefer to see name and namelen grouped together on a line,
> > then len and prop can go on the next.
>=20
> That exceeds 80 column limit. I am fine with 100 column limit to be hones=
t,
> but well, I would like that limit to apply everywhere (in any new changes=
),
> instead of just here.

Sorry, I was unclear.  I meant:

static int fdt_resize_property_(void *fdt, int nodeoffset,
                                const char *name, int namelen,
                                int len, struct fdt_property **prop)

>=20
> >=20
> > >   {
> > >   	int oldlen;
> > >   	int err;
> > > -	*prop =3D fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
> > > +	*prop =3D fdt_get_property_namelen_w(fdt, nodeoffset, name, namelen,
> > > +					   &oldlen);
> > >   	if (!*prop)
> > >   		return oldlen;
> > > @@ -200,7 +204,7 @@ static int fdt_resize_property_(void *fdt, int no=
deoffset, const char *name,
> > >   }
> > >   static int fdt_add_property_(void *fdt, int nodeoffset, const char =
*name,
> > > -			     int len, struct fdt_property **prop)
> > > +			     int namelen, int len, struct fdt_property **prop)
> > >   {
> > >   	int proplen;
> > >   	int nextoffset;
> > > @@ -211,7 +215,7 @@ static int fdt_add_property_(void *fdt, int nodeo=
ffset, const char *name,
> > >   	if ((nextoffset =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
> > >   		return nextoffset;
> > > -	namestroff =3D fdt_find_add_string_(fdt, name, &allocated);
> > > +	namestroff =3D fdt_find_add_string_(fdt, name, namelen, &allocated);
> > >   	if (namestroff < 0)
> > >   		return namestroff;
> > > @@ -255,17 +259,18 @@ int fdt_set_name(void *fdt, int nodeoffset, con=
st char *name)
> > >   	return 0;
> > >   }
> > > -int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *n=
ame,
> > > -			    int len, void **prop_data)
> > > +int fdt_setprop_namelen_placeholder(void *fdt, int nodeoffset, const=
 char *name,
> > > +				    int namelen, int len, void **prop_data)
> >=20
> > Sorry, I gave you bad advice in my earlier message.  I'd prefer this
> > to be "fdt_setprop_placeholder_namelen()" (compare
> > "fdt_add_subnode_namelen()").
> >=20
> > >   {
> > >   	struct fdt_property *prop;
> > >   	int err;
> > >   	FDT_RW_PROBE(fdt);
> > > -	err =3D fdt_resize_property_(fdt, nodeoffset, name, len, &prop);
> > > +	err =3D fdt_resize_property_(fdt, nodeoffset, name, namelen, len, &=
prop);
> > >   	if (err =3D=3D -FDT_ERR_NOTFOUND)
> > > -		err =3D fdt_add_property_(fdt, nodeoffset, name, len, &prop);
> > > +		err =3D fdt_add_property_(fdt, nodeoffset, name, namelen, len,
> > > +					&prop);
> > >   	if (err)
> > >   		return err;
> > > @@ -273,13 +278,14 @@ int fdt_setprop_placeholder(void *fdt, int node=
offset, const char *name,
> > >   	return 0;
> > >   }
> > > -int fdt_setprop(void *fdt, int nodeoffset, const char *name,
> > > -		const void *val, int len)
> > > +int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
> > > +			int namelen, const void *val, int len)
> > >   {
> > >   	void *prop_data;
> > >   	int err;
> > > -	err =3D fdt_setprop_placeholder(fdt, nodeoffset, name, len, &prop_d=
ata);
> > > +	err =3D fdt_setprop_namelen_placeholder(fdt, nodeoffset, name, name=
len,
> > > +					      len, &prop_data);
> > >   	if (err)
> > >   		return err;
> > > @@ -307,7 +313,8 @@ int fdt_appendprop(void *fdt, int nodeoffset, con=
st char *name,
> > >   		prop->len =3D cpu_to_fdt32(newlen);
> > >   		memcpy(prop->data + oldlen, val, len);
> > >   	} else {
> > > -		err =3D fdt_add_property_(fdt, nodeoffset, name, len, &prop);
> > > +		err =3D fdt_add_property_(fdt, nodeoffset, name, strlen(name),
> > > +					len, &prop);
> > >   		if (err)
> > >   			return err;
> > >   		memcpy(prop->data, val, len);
> > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > index 7d0c252a34970f4ca841935f8088410a3970127a..c9c81f039365b6d244932=
786a84a05f065e67c33 100644
> > > --- a/libfdt/libfdt.h
> > > +++ b/libfdt/libfdt.h
> > > @@ -1666,6 +1666,38 @@ int fdt_del_mem_rsv(void *fdt, int n);
> > >    */
> > >   int fdt_set_name(void *fdt, int nodeoffset, const char *name);
> > > +/**
> > > + * fdt_setprop_namelen - create or change a property
> > > + * @fdt: pointer to the device tree blob
> > > + * @nodeoffset: offset of the node whose property to change
> > > + * @name: name of the property to change
> > > + * @namelen: length of the name
> > > + * @val: pointer to data to set the property value to
> > > + * @len: length of the property value
> > > + *
> > > + * fdt_setprop_namelen() sets the value of the named property in the=
 given
> > > + * node to the given value and length, creating the property if it
> > > + * does not already exist.
> > > + *
> > > + * This function may insert or delete data from the blob, and will
> > > + * therefore change the offsets of some existing nodes.
> > > + *
> > > + * returns:
> > > + *	0, on success
> > > + *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
> > > + *		contain the new property value
> > > + *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
> > > + *	-FDT_ERR_BADLAYOUT,
> > > + *	-FDT_ERR_BADMAGIC,
> > > + *	-FDT_ERR_BADVERSION,
> > > + *	-FDT_ERR_BADSTATE,
> > > + *	-FDT_ERR_BADSTRUCTURE,
> > > + *	-FDT_ERR_BADLAYOUT,
> > > + *	-FDT_ERR_TRUNCATED, standard meanings
> > > + */
> > > +int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
> > > +			int namelen, const void *val, int len);
> > > +
> > >   /**
> > >    * fdt_setprop - create or change a property
> > >    * @fdt: pointer to the device tree blob
> > > @@ -1694,8 +1726,44 @@ int fdt_set_name(void *fdt, int nodeoffset, co=
nst char *name);
> > >    *	-FDT_ERR_BADLAYOUT,
> > >    *	-FDT_ERR_TRUNCATED, standard meanings
> > >    */
> > > -int fdt_setprop(void *fdt, int nodeoffset, const char *name,
> > > -		const void *val, int len);
> > > +static inline int fdt_setprop(void *fdt, int nodeoffset, const char =
*name,
> > > +			      const void *val, int len)
> > > +{
> > > +	return fdt_setprop_namelen(fdt, nodeoffset, name, strlen(name), val,
> > > +				   len);
> > > +}
> > > +
> > > +/**
> > > + * fdt_setprop_namelen_placeholder - allocate space for a property
> > > + * @fdt: pointer to the device tree blob
> > > + * @nodeoffset: offset of the node whose property to change
> > > + * @name: name of the property to change
> > > + * @namelen: length of the name
> > > + * @len: length of the property value
> > > + * @prop_data: return pointer to property data
> > > + *
> > > + * fdt_setprop_namelen_placeholder() allocates the named property in=
 the given node.
> > > + * If the property exists it is resized. In either case a pointer to=
 the
> > > + * property data is returned.
> > > + *
> > > + * This function may insert or delete data from the blob, and will
> > > + * therefore change the offsets of some existing nodes.
> > > + *
> > > + * returns:
> > > + *	0, on success
> > > + *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
> > > + *		contain the new property value
> > > + *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
> > > + *	-FDT_ERR_BADLAYOUT,
> > > + *	-FDT_ERR_BADMAGIC,
> > > + *	-FDT_ERR_BADVERSION,
> > > + *	-FDT_ERR_BADSTATE,
> > > + *	-FDT_ERR_BADSTRUCTURE,
> > > + *	-FDT_ERR_BADLAYOUT,
> > > + *	-FDT_ERR_TRUNCATED, standard meanings
> > > + */
> > > +int fdt_setprop_namelen_placeholder(void *fdt, int nodeoffset, const=
 char *name,
> > > +				    int namelen, int len, void **prop_data);
> > >   /**
> > >    * fdt_setprop_placeholder - allocate space for a property
> > > @@ -1725,8 +1793,13 @@ int fdt_setprop(void *fdt, int nodeoffset, con=
st char *name,
> > >    *	-FDT_ERR_BADLAYOUT,
> > >    *	-FDT_ERR_TRUNCATED, standard meanings
> > >    */
> > > -int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *n=
ame,
> > > -			    int len, void **prop_data);
> > > +static inline int fdt_setprop_placeholder(void *fdt, int nodeoffset,
> > > +					  const char *name, int len,
> > > +					  void **prop_data)
> > > +{
> > > +	return fdt_setprop_namelen_placeholder(fdt, nodeoffset, name,
> > > +					       strlen(name), len, prop_data);
> > > +}
> > >   /**
> > >    * fdt_setprop_u32 - set a property to a 32-bit integer
> > > diff --git a/libfdt/version.lds b/libfdt/version.lds
> > > index 989cd89f1051ce59255a3b3e60493be4e5e985cc..76ba8f6758cef16efbad2=
813464e824de594b646 100644
> > > --- a/libfdt/version.lds
> > > +++ b/libfdt/version.lds
> > > @@ -43,6 +43,7 @@ LIBFDT_1.2 {
> > >   		fdt_add_mem_rsv;
> > >   		fdt_del_mem_rsv;
> > >   		fdt_set_name;
> > > +		fdt_setprop_namelen;
> > >   		fdt_setprop;
> > >   		fdt_delprop;
> > >   		fdt_add_subnode_namelen;
> > > @@ -71,6 +72,7 @@ LIBFDT_1.2 {
> > >   		fdt_find_max_phandle;
> > >   		fdt_generate_phandle;
> > >   		fdt_check_full;
> > > +		fdt_setprop_namelen_placeholder;
> > >   		fdt_setprop_placeholder;
> > >   		fdt_property_placeholder;
> > >   		fdt_header_size_;
> > >=20
> >=20
>=20
> Ayush Singh
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--y+s6n/CpEL/68Q8T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdQ6aEACgkQzQJF27ox
2Gfa3g/+OqOYnYDFSfx1SEzNhWw/HlYQRTQVU3YJZFYHs1Vadf16u9RDvzNVv6SW
TePl0rNkzt9rgra2R94FsKn16+EEdIGnCsps9qvUD07PxgvN/oE2yNr4C5Y21xcl
k3YLMOv2yTQ1Q3RHvyDjAn/joQCEKRW3elc3cEMqpesSIENQo/K6xpGIU7usYbS2
x7nrPGN3RgDIg4i4siusPk3Pr7UvxK5up0eoKyaU9O7xxr1Zm76HPBllG8mmar0Z
ETVFO4oiGUgjneh9V94ohSfEAVt2VjAYqlzYzqi69xBd0P5gXHIdu5NWlh7RQ4QP
wOF/U2zyrkuQ97Dwvp42xslRiwswKbvFs7Q3N6KeHgBqxXpJHYQsUc9wrHBiKk+R
WFt1mOFobpsgAk9px2Ug8kW076o0YLgM9LpIecrFFyovNRuHCvDNulLVwCfmgx4y
X4JDvXgPRqLLi69FhmFanSwNzfld8TgvQ/jQ7enTiafsuvES2jGI1yV4+tnpxSyw
poe1Pqlkhos2l4aXSUegC/VqH7o0SDTnuBcVwc+Z2FiO0hy5AgP3RyFki0KFzC66
jaGBz9tNi9FD9uX3ts0Dn1OrGWJmm+W/l9VzU71CvCDSJ3kmCqd8wWL1HxHSQpJN
kOSmsDXo+GZ1T8a/Jp2UUq9X6MV9tx5aUfnb3qDKtpA00spLW3M=
=+6Qx
-----END PGP SIGNATURE-----

--y+s6n/CpEL/68Q8T--
