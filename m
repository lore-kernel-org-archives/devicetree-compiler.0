Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152040;
	b=ecf2+38wNnpy3fbLhvaAsGzG+io/jfViRgQBrBwAd185jbsLtZpHYDX+uFvZfw/HoNit
	 zfha/av9c08Eazsc7d2XsmomMzgMtsdepM5EWS4OD7av61Ft5ouKreRQ4g/5IdVEg0RHL
	 QvZm59RVXN5MLb5p2PBS9XMH8UWtn4VYChqrfCS3+14O8kduxyI5MLg0kusmb4LBPDOBY
	 uypP3/7oZe7ocAxYTkNRZ0AHPkY2VbBHyeCNCyuHdmj6V8BYa+bQBm+IAuZQLDTPJL3f/
	 IjWrZHC/iRvdZ0cpWqHNL3Er82H/PqlDhUyKxlWPk6ahxPXQ6CwHNnHDS8MnuiID/Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152040;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=JTi8F7BfRM0pfeZP4VJJdFmZg+WmHGZhE/pEmU4x+0g=;
	b=t+DTPbOkTW172eBHnP6T2IsZrZ1nwrGso+KiPekgbN0cG7KMkP/atEiH11p9Mk0cgRGw
	 alwHvJSz7jZr5vkD1tWrXXdzY3H+CSyE8ED/Z3kC68AKJMMWg0bAs671vFUdA6itR00Jr
	 Pkp7++VHhXc3SSYDWiZRMEmPNuE6MVsDfwE6brtg9vHwz+/jyF9KKHDfkBzKCwnh+kT8G
	 Is21voyJ1qjSLKDuuzOjjuDnxxqW6rFBtGmvYOHY47tJ6oX/4N5PKUDO32mPqa/0Ws8Lu
	 Btk/UwaCIOFqca/cp1sgglHAKZsb5zonlMnQpGjAHpdqDLYr75PXyi++6NlD0mrvcog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=mHIOu8p9;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC64606A31E
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 01:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC64606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=mHIOu8p9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793152029;
	bh=JTi8F7BfRM0pfeZP4VJJdFmZg+WmHGZhE/pEmU4x+0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mHIOu8p9MYWDn1sN9Iv2LK2n7yrIt5Tpw2ZVt42C2oVVt/NYoJ3tzN/GcF7TiwDq1
	 +5jQZNI5pAPG941i8zqTR02WG8DRHwo/eFfAfhr6PF/MkhCESLJ6DIvkzsScntrJWw
	 mQGQJlxVAbhRfQeQnGlKRSh+IQnBSxHnMD+jKyT9JthguWVh7Gzb6JPrTiRHHQRTRW
	 gUdbXOGdQdfRHxnXqw8+VAfuI782+kOqscOeFbnumD/sfLrd5mUL5bbx/df7wiWcND
	 vzRWmGpJxholcrcigVzKE9eXuB0/SkQ8sO5RnYJBMj9A4wDUghhsSxruNkAix+WFIE
	 +WQCbBx1mY9hQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jDqws143zz4wKF; Wed, 28 Oct 2026 12:47:09 +1100 (AEDT)
Date: Wed, 28 Oct 2026 12:43:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 4/5] fdtput: Name the property when it cannot be deleted
Message-ID: <auFTOCEGx_Fe0iy-@gractus.seuss>
References: <20261027120126.2613353-1-sjg@chromium.org>
 <20261027120126.2613353-5-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="bVDcjFANWX06KEwj"
Content-Disposition: inline
In-Reply-To: <20261027120126.2613353-5-sjg@chromium.org>

--bVDcjFANWX06KEwj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 06:01:18AM -0600, Simon Glass wrote:
> When 'fdtput -d' fails to delete a property, for example because it does
> not exist, the error names the node rather than the property:
>=20
>    $ fdtput -d test.dtb /chosen missing
>    Error at '/chosen': FDT_ERR_NOTFOUND
>=20
> This suggests that the node is missing, when it is the property that
> is.
>=20
> Report the property name instead.
>=20
> Fixes: aa719618a8b7 ("fdtput: add delete node and property function")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

I agree it would be useful to show the property name, but
	Error at '<property name'
Doesn't seem very usefully descriptive to me, and the node name _also_
seems useful.  I think we should print both in such cases.

> ---
>=20
>  fdtput.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fdtput.c b/fdtput.c
> index c9973d5..8636d5a 100644
> --- a/fdtput.c
> +++ b/fdtput.c
> @@ -334,7 +334,7 @@ static int delete_prop(char *blob, const char *node_n=
ame, const char *prop_name)
> =20
>  	node =3D fdt_delprop(blob, node, prop_name);
>  	if (node < 0) {
> -		report_error(node_name, -1, node);
> +		report_error(prop_name, -1, node);
>  		return -1;
>  	}
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

--bVDcjFANWX06KEwj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrhUzgACgkQzQJF27ox
2GdlNw/+NXTOCmIQjxgvkSCBSSsVilkonV7DXRU+07vD+Vjkupv1nJEoUq7sy1E1
jY3N4n+wtnVg0TvN6i8TwIXUIeEYGnYQgAwDXqbk72U/6obN7ceuNcIHkXFj9fMA
4A2HYdl8wuRv9RZKf3n3shklSI0te+PE3XNzA/4j2ZGjzDxzZgDlz0AuVnBAtbw6
PbELfewGZwHggsXKixpiUTBMf/e8Ef5f+cBDCXijLN9jD6dY6BA0aFYcck0CtgET
K0Kky/8yMcRjGqyct/kI6/1G9dHUEx6Mho5/iOMeISeNW2nkOjrDMB1fhTYrRE3W
dH7nLhkgMax5Fy9OvelmJMm1xp2EbIK7W/to841IjFuNX1UWBJfLLCDn2cCORB1K
Q0Q9R2jizxqSHcLAaaKshZhCaBbtaniEAqHmw9tfGE61BgAA4nQROrwPp4zBbebE
9PDBCVf6xYbyh7Fn/qsf/93GQpUu6tPepWIGE4rvAm9O5yvl7NhYuhLsW2JrgPMq
vsq6sDESjNpoDriZwbBEJH8TBWiMLl8R+Ar2XTB8VTizsNnZCZ0UyCSw8B1G4rfE
qoKQweoqGyHysUp46Qk4O3g2DNs073Nv+aswArEPWVlJ3+fcG9iPalg1j+YkGw4V
sxZLCyoYh7HwVhkbnSCmwGLuZ8Y02KmApnVoYyxAEQkcK7i5QUQ=
=+tXk
-----END PGP SIGNATURE-----

--bVDcjFANWX06KEwj--
