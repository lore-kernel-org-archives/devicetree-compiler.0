Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA371FC8
	for <devicetree-compiler@vger.kernel.org>; Thu, 22 Feb 2024 06:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708583590; cv=none; b=djdryFtVDik9XfrDnfq8q80vgsRzWwHABOmcvk7hZNGIrTHCXJuAdu1nOJf5nfaPyFFBw07QV3ovlOpBSVDU19MF8rrFHShg2Zr+KdEHdNSiIS/+LYGXXUH95LqrkIYWHHdNbkFAQzQMdToOPwONKeLMUJI9HzO6WZPtO2WVvJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708583590; c=relaxed/simple;
	bh=w/Kv0FFYM9HwaefEGEWIF/0lcUGzFrbBKa5TUa+Ttso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mw1f3IxwIG9mYcI37qIENxouVwGd+LqiXKborMt96JlMa/1i+pdN2jAN7mMn69+DBnd45gR/CRwAPxRZ0O0+EcmyEQ5LRZAKhCxLFnBlLKkw2SVv/QYGKycmYmq7N6+KdfSSqYi7P/9dl5cMlc8PTvzgDuZhMYhYCnWqqhTIYMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=gL3TXq6g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="gL3TXq6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1708583585;
	bh=N/y8p3TKP8vO1x7xv08DWcH/q2x3yGUguWzx2ctpk4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gL3TXq6gcKJW/S8GJWX/rP/dMAYHaECUrvayonK+VFYSZEIaHsCmPr9V3pOfyLPEx
	 /YrthuvaxCJYSg6vvKwX8Cxjid9MnqASL4rxbQYka34eGw7B2HqUmiamznNX2pIX5g
	 lLSq17DX9AJLDwecgyuGcVl81GWfkR2nPS59U1SjK1kwvYRbvQwlKE9EHcfVWvy3oo
	 VTcT2JMK9nO1C5HyTtyPk2VR68D17Z4xQsglZRvesnIvKmHLjNAT+4K58so9xaHjba
	 Ec8LyG7CS/biQbA7MQ6zKirBjH9OppZrMqJSugPQDuH7uWm0fkEZe30gkHLcjLfuTm
	 vI+1wMtxBb7rw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4TgNcd292Lz4wby; Thu, 22 Feb 2024 17:33:05 +1100 (AEDT)
Date: Thu, 22 Feb 2024 17:33:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Yves-Alexis Perez <corsac@debian.org>,
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v2] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <ZdbqnDY2k6sU0JRy@zatzit>
References: <20240216181919.1648843-2-u.kleine-koenig@pengutronix.de>
 <fgyaporsv6l5jqtseabnhzykf4xlfwrxmnpokqanxoyfkzkkfi@kkdu7cfdkgnt>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0me13RAxAslSN0cQ"
Content-Disposition: inline
In-Reply-To: <fgyaporsv6l5jqtseabnhzykf4xlfwrxmnpokqanxoyfkzkkfi@kkdu7cfdkgnt>


--0me13RAxAslSN0cQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 10:06:37PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Fri, Feb 16, 2024 at 07:19:20PM +0100, Uwe Kleine-K=F6nig wrote:
> > A phandle in an overlay is not supposed to overwrite a phandle that
> > already exists in the base dtb as this breaks references to the
> > respective node in the base.
> >=20
> > So add another iteration over the fdto that checks for such overwrites
> > and fixes the fdto phandle's value to match the fdt's.
> >=20
> > A test is added that checks that newly added phandles and existing
> > phandles work as expected.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> After sending the patch out I had a nice idea for an optimisation here.
> It doesn't make the process faster, but improves the result.
>=20
> If phandle with the (shifted) value 17 is changed to 5, there is no
> phandle with the value 17 in the end. So while iterating over the fdto
> to replace all phandles with value 17 by 5 all values > 17 can be
> reduced by one. This way the phandle allocation in the resulting dtb is
> continuous if both inputs have continuous numbers.

Honestly, I don't think the marginal advantage of improving the
chances of contiguous phandles is worth the extra complexity.

>=20
> This can be implemented by the patch below on top of the patch I'm
> replying to.
>=20
> Best regards
> Uwe
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index 914acc5b14a6..bfdba50dee50 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -529,15 +529,25 @@ static int overlay_adjust_node_conflicting_phandle(=
void *fdto, int node,
>  	int child;
> =20
>  	php =3D fdt_getprop(fdto, node, "phandle", &len);
> -	if (php && len =3D=3D sizeof(*php) && fdt32_to_cpu(*php) =3D=3D fdto_ph=
andle) {
> -		ret =3D fdt_setprop_inplace_u32(fdto, node, "phandle", fdt_phandle);
> +	if (php && len =3D=3D sizeof(*php)) {
> +		if (fdt32_to_cpu(*php) =3D=3D fdto_phandle)
> +			ret =3D fdt_setprop_inplace_u32(fdto, node, "phandle", fdt_phandle);
> +		else if (fdt32_to_cpu(*php) > fdto_phandle)
> +			ret =3D fdt_setprop_inplace_u32(fdto, node, "phandle", fdt32_to_cpu(*=
php) - 1);
> +		else
> +			ret =3D 0;
>  		if (ret)
>  			return ret;
>  	}
> =20
>  	php =3D fdt_getprop(fdto, node, "linux,phandle", &len);
> -	if (php && len =3D=3D sizeof(*php) && fdt32_to_cpu(*php) =3D=3D fdto_ph=
andle) {
> -		ret =3D fdt_setprop_inplace_u32(fdto, node, "linux,phandle", fdt_phand=
le);
> +	if (php && len =3D=3D sizeof(*php)) {
> +		if (fdt32_to_cpu(*php) =3D=3D fdto_phandle)
> +			ret =3D fdt_setprop_inplace_u32(fdto, node, "linux,phandle", fdt_phan=
dle);
> +		else if (fdt32_to_cpu(*php) > fdto_phandle)
> +			ret =3D fdt_setprop_inplace_u32(fdto, node, "phandle", fdt32_to_cpu(*=
php) - 1);
> +		else
> +			ret =3D 0;
>  		if (ret)
>  			return ret;
>  	}
> @@ -609,23 +619,27 @@ static int overlay_update_node_conflicting_referenc=
es(void *fdto, int tree_node,
>  			 */
>  			memcpy(&adj_val, tree_val + poffset, sizeof(adj_val));
> =20
> -			if (fdt32_to_cpu(adj_val) =3D=3D fdto_phandle) {
> +			if (fdt32_to_cpu(adj_val) < fdto_phandle)
> +				continue;
> =20
> +			if (fdt32_to_cpu(adj_val) =3D=3D fdto_phandle)
>  				adj_val =3D cpu_to_fdt32(fdt_phandle);
> +			else
> +				adj_val =3D cpu_to_fdt32(fdt32_to_cpu(adj_val) - 1);
> =20
> -				ret =3D fdt_setprop_inplace_namelen_partial(fdto,
> -									  tree_node,
> -									  name,
> -									  strlen(name),
> -									  poffset,
> -									  &adj_val,
> -									  sizeof(adj_val));
> -				if (ret =3D=3D -FDT_ERR_NOSPACE)
> -					return -FDT_ERR_BADOVERLAY;
> =20
> -				if (ret)
> -					return ret;
> -			}
> +			ret =3D fdt_setprop_inplace_namelen_partial(fdto,
> +								  tree_node,
> +								  name,
> +								  strlen(name),
> +								  poffset,
> +								  &adj_val,
> +								  sizeof(adj_val));
> +			if (ret =3D=3D -FDT_ERR_NOSPACE)
> +				return -FDT_ERR_BADOVERLAY;
> +
> +			if (ret)
> +				return ret;
>  		}
>  	}
> =20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0me13RAxAslSN0cQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmXW6psACgkQzQJF27ox
2GdqMw//U8vs6aSD+HIC9feJGOBcCnQL4uRfcg+sH0oBobomT6Fpz+tK/lz9+Ezy
jNEoYLBo2bCFpgEUKuzl6Cn2yukYwMoIR11hWmMsbWGCRfz/AhqduW+uo8bOQygk
bpaj3iQ+6aDj21W+IX6L8aEkGiZ18liHMEV9mbEWqHSOdAZ8FyNTvivxV3C7XPM9
5dUqfKEXhNh2jTdlZ8bfJujvesIeM+oQMzDcYTZgwS0JIOKTpHwue2II3KYxra+W
EO3+uov7Tl077JIM2OELmkkbsreIikV7BXNJRdW4rivUB9jDVRgUkqW0zuqhMg0w
xwKRLolxQOGDTIOSMun5z+gaglJnmwTbdH4Ll94dGq0zl/9VPSO9SXdpsA649PXE
5Fz/2N7LmV5259XEbRhRKygE4ZfmFWo3jHiTgFIYRdBg9kSWgw8P8PZAtrXTldQq
dasRlyBIS/S3TbI6lLWjGXkvnzqmV7EXyK0LDRJSaz6/2sXa231/CDiagNoO7fyn
wLjkuK6nhY8ffYl4YvhK84Ti5Vqm3FkzbyEO/9rkco5RpjlhlSX2P9IvkCBuR1HH
xew4AGkpDOlGpGQe1vte7/r7wZmeZvBifMo1UOb7Tg4dKcbiJEdxIBtUoghUGROM
/OJ+W1n/pwRCKVQHaz2Qq5Q6LsgTUy7ZDv5HLFfxQMzkYE5+QCs=
=hn58
-----END PGP SIGNATURE-----

--0me13RAxAslSN0cQ--
