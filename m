Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8741D17C68
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 04:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733201206; cv=none; b=R8nDm8javiCvnXjKE/ppy8+LkcRx/dQ4ynnucqnMDuc+giMkydvfVVMnfIQEgTSUrHDlp9yej/CNe1bClwsNwwPO40H7QEjy8d4RWekPZrp4JxwVpMarFPBR0LyVYxbfbMSRHSrZ50atKN+loQnerLQvfRy8S1jO/IPjZ3NRFCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733201206; c=relaxed/simple;
	bh=WVQWhdaKoyRhKt2YgHfngC+hs03z9r25aLK4Xz3gk5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfObSSiCCjX+g2/kqkPMpYMZpyiMe5AZSrJWmRdDOKmH00oeosjmaPS+KErlRFoT91XyGQaZqS925ywiP5jBKyEKiWe8tjsd71TO+IzsFtQibFANcNn/AttXXuv7YDnazZ4Ab8fCSDllszngQi7SvpQ40JVHbaF70TQX7Rc/dEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=FgQaVjQ7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="FgQaVjQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733201192;
	bh=uiAv73Sl72WdYbKer/VXqupJcplhFGYqCezI2TRxv5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgQaVjQ7dBOzrBEOfqirc8wYPEN5b1UGCin1F4jPsiB9UC5sLqtb3bAwOG7Ch2kTf
	 mezOO4+lHirfAD/aexELYZIUVbziti6q+q4YojYWp4bJNY2HTaqG4DGYJepuht1P8j
	 dODUQt+J9r9I/n6RM6LmZsJG4KNGPRDtQzGJtYlMao/J2igdWJITevp15oNOKX+GiV
	 gM5k8BtVCbxRtTwYiIV2/BGTbDGhoC7ZU3Lln2Gq81v9HwNoebVqlZSRt1wFdljaow
	 0RR95IeC43rv3OeTQ61K9+mweIBY8PYRZhfdAXhHOIMIZuOD6c3lnYZ0eCCkKztNwz
	 lmp1wqnMxDEyw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y2Sm82M0lz4x65; Tue,  3 Dec 2024 15:46:32 +1100 (AEDT)
Date: Tue, 3 Dec 2024 15:12:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 2/5] libfdt: Add namelen variants for setprop
Message-ID: <Z06FR1Qqp9BvdxPM@zatzit>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-2-ac3e121359e9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kxH4j9Z3joVakuCu"
Content-Disposition: inline
In-Reply-To: <20241116-overlay-path-v1-2-ac3e121359e9@beagleboard.org>


--kxH4j9Z3joVakuCu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Sorry I've taken so long to reply.

On Sat, Nov 16, 2024 at 08:30:20PM +0530, Ayush Singh wrote:
> Helper functions to setproperty with length of property name similar to
> getprop_namelen variants.

The idea of this patch is good, independent of the rest of the series.
I'm kind of surprised we don't already have a setprop_namelen()
actually.

Unfortunately, this implementation isn't usable as is.

>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  libfdt/fdt_rw.c | 19 +++++++++++++++++
>  libfdt/libfdt.h | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  util.h          |  1 +
>  3 files changed, 83 insertions(+)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 3621d3651d3f4bd82b7af66c60d023e3139add03..9e66c2332bf4d3868c1388c29=
4a195b152b6aefd 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -7,6 +7,8 @@
> =20
>  #include <fdt.h>
>  #include <libfdt.h>
> +#include "../util.h"
> +#include <assert.h>

libfdt is designed to compile and work in limited environments (early
stage bootloaders, for example).  Therefore it's very limited in what
libc functions it's permitted to use: basically it can only use the
things listed in libfdt_env.h.

assert() is not ok, malloc() is right out.

>  #include "libfdt_internal.h"
> =20
> @@ -288,6 +290,23 @@ int fdt_setprop(void *fdt, int nodeoffset, const cha=
r *name,
>  	return 0;
>  }
> =20
> +int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
> +			size_t namelen, const void *val, int len)
> +{
> +	int ret;
> +	char *name_temp =3D xmalloc(namelen + 1);

As noted, we don't use an allocator in libfdt.  In fact that's a large
part of the reason the _namlen() functions exist in the first place.
To add this, you'll need to start with an fdt_get_property_namelen_w()
in terms of fdt_get_property_namelen(), then make
fdt_resize_property_() and fdt_add_property_() take the name length,
then finally fdt_setprop_placeholder_namelen() and
fdt_setprop_namelen().  The current fdt_setprop_placeholder() and
fdt_setprop() can then become trivial wrappers around the namelen
versions (like fdt_getprop() wraps fdt_getprop_namelen()).

> +
> +	assert(namelen <=3D strlen(name));
> +
> +	memcpy(name_temp, name, namelen);
> +	name_temp[namelen] =3D '\0';
> +	ret =3D fdt_setprop(fdt, nodeoffset, name_temp, val, len);
> +
> +	free(name_temp);
> +
> +	return ret;
> +}
> +
>  int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
>  		   const void *val, int len)
>  {
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 96782bc57b8412d73dff92d6e0ad494ec0a23909..999b3800dff5c001b9c1babf3=
70d45024c81a9aa 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1690,6 +1690,38 @@ int fdt_set_name(void *fdt, int nodeoffset, const =
char *name);
>  int fdt_setprop(void *fdt, int nodeoffset, const char *name,
>  		const void *val, int len);
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
> +			size_t namelen, const void *val, int len);
> +
>  /**
>   * fdt_setprop_placeholder - allocate space for a property
>   * @fdt: pointer to the device tree blob
> @@ -1839,6 +1871,37 @@ static inline int fdt_setprop_cell(void *fdt, int =
nodeoffset, const char *name,
>  #define fdt_setprop_string(fdt, nodeoffset, name, str) \
>  	fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
> =20
> +/**
> + * fdt_setprop_namelen_string - set a property to a string value
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node whose property to change
> + * @name: name of the property to change
> + * @str: string value for the property
> + *
> + * fdt_setprop_namelen_string() sets the value of the named property in =
the
> + * given node to the given string value (using the length of the
> + * string to determine the new length of the property), or creates a
> + * new property with that value if it does not already exist.
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
> +#define fdt_setprop_namelen_string(fdt, nodeoffset, name, namelen, str) =
   \
> +	fdt_setprop_namelen((fdt), (nodeoffset), (name), (namelen), (str), \
> +			    strlen(str) + 1)
> =20
>  /**
>   * fdt_setprop_empty - set a property to an empty value
> diff --git a/util.h b/util.h
> index 800f2e2c55b150d3c30101d1e1f1daaa0e4e3264..3e2ebaabe1e8c7e9ad6821ac2=
ca17a72e7f4f57d 100644
> --- a/util.h
> +++ b/util.h
> @@ -6,6 +6,7 @@
>  #include <stdarg.h>
>  #include <stdbool.h>
>  #include <getopt.h>
> +#include <stdio.h>
> =20
>  /*
>   * Copyright 2011 The Chromium Authors, All Rights Reserved.
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--kxH4j9Z3joVakuCu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdOhT4ACgkQzQJF27ox
2GfzYw/9FIpoKKmlxp9H/ECPxZkjtN6y7UAQJjIYcHo6oOkNuLTGrErNdkMQAICv
UPyFxWczjc2/ItWGo/9Wy+JsKFgDRn3rZGA1XrLC7zy1gaGC0V05LlYWptyf+SZ/
jFVrra8Se/W7ACAOi3fqO9ICMllomOK+SGMQ+oxmwNoO74ALhtXVfmt8sV9lpC7A
cws4JFqyPI7yRQaIq3uXhvaoc+ZxMMODlWxtBu715O1issXFn7nn0uii2gFppUqr
lw/Jq2V9O62pn3E2HuoAMSBk27mQZeF1mQ+jJU/xagI+AxZbSrPiovkXi554/Yob
aSBBplXAYYFZMQ3QX1imJFrT61jT239FI98MANnrb74ioWimAOqM4Nftzpya7oJv
hSyi8haKFA25DpV2Mbz07iVtJ944Iew9XLy+3Zt2bubFIHE6plp7Y+ZNyyiX8e8P
LyWoFPxDmIQS4HL0/V375spf7W5j9VkYQs+SKK7Vxe2pchqAeatXVZ02A1svEI68
p6S+7pYB/mPqQc4BvPPlzwlDp3dzsuff6KSTSiyMAwSVFbNgWZEyefXSAO1fAL74
H6HnSaGbKoz0tii2kyvSPlLE5CkK++xUc2qIWbTpl/0lhiIJtc5SY/jMkaNwYqY2
VDlWbdCj3bfQEryZv55CnVITZXBfSt7cLSVVm0eWpFBiRporqFI=
=xwrB
-----END PGP SIGNATURE-----

--kxH4j9Z3joVakuCu--
