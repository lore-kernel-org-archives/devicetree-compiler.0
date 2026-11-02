Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593825;
	b=vq9pHkBy2qyZ9ZBw31p8YeuNzryh6EceATbssCpp3DFGcZ8YtliazV2l5U7T1L8j3jf4
	 XI4ihjU43PJLtCyLyIdOwbnhNJsvlqnc0FeWdotHwvbX03xoMBhgGcTgF81HeVm7eQXaw
	 OSWr9HYz8Y5V3dFNP4QNhIUcfiCnCG3vYcbhfmDO9QUGxZ1iO3c6xyBg5/4ntlRgbbHft
	 /1t3EROcDRufHu61tUYHYmCy6j7Ju6wq3ywQia3ErCTz3jQCXvZvkASePjTW1EQ3ZnO7X
	 o49fZkc5htC+PGa31g8OuQzM2AGbZlGYq6VlyNDwvtuMKekts3v7QLXCVL0JVCq4RKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593825;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=J+TqHP2bF/63VzIBmgbda0BiatTB8BHlh2Ty28eB7R8=;
	b=NaIuryP/AW0rWNKd0SlnWxnFSw+h0r7/es2amtfJCe7fTpKBf/H6HFNUKq270IqIWWU4
	 ctGh/pp/snJmSVQ2LcTvKx9+i5U04sUbxqReeVnZG3QDSDWp3KRi89VtP2DeHDbnIenN+
	 HO0dTIi2daqXHOJwt758n1lgW/pd65OJSoy0wNz8HmUDf/SWLvBhNEYzDNUJmcXEaCqBv
	 nAj3OE4eGEoZkQoIcOQ42ww10uXfEBpTbv8hzlmpz+QjR1Egx7HZh4PFQwIkSluQ1IhEJ
	 VAFLqICO2lUk63VP4/ns4PA4V/XHoDI/3DPiIwEijxcp+jEp5kZ+a543c6cEE5ZiPsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=XCeatWwd;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEAA606A324;
	Mon,  2 Nov 2026 04:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BEAA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=XCeatWwd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793593823;
	bh=J+TqHP2bF/63VzIBmgbda0BiatTB8BHlh2Ty28eB7R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCeatWwd9BF4pup/+V7jztKAp35KWlS0IybNdNMhddIE0Owhe6Xnr5hk+bXdi1Z1c
	 LDE6/AAtOwmWGIofXVn3qrppHXy5L0202YlihjjFXD1Hy2nsi0GxgADggcA+XTJz3n
	 DJlziUVJR4i0ah17ObPPw7yYMULhcwZYEeZhqP8Wdtt+Qz+Cj67VPUKHshDk0L2JTU
	 PtAO2I1s1Ee5quafymrlobIUdTKuzvfoq7BZu4WhNZQxVirVP/1iomcJ/99jAUlPCC
	 XhNMRy10DLmsFOtKlB+SXUGiLWgll9Txg8UtRQjb4eSrfXsQCvYMJNYukJqbst6jQc
	 b3ZDIKD6xn9hQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHzJv0lrGz4w9g; Mon, 02 Nov 2026 15:30:23 +1100 (AEDT)
Date: Mon, 2 Nov 2026 15:30:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH v3 02/15] libfdt: overlay: Drop redundant *sep != ':'
 checks after memchr()
Message-ID: <augR2uCK9tTrNBwJ@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-3-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="vzkvR1MNFKW8SaHM"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-3-dianders@chromium.org>

--vzkvR1MNFKW8SaHM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:09PM -0800, Douglas Anderson wrote:
> In `overlay_fixup_phandle()`, `sep` is obtained via `memchr(..., ':',
> ...)`. When `sep` is non-NULL, `*sep` is guaranteed to be `':'`, so the
> `|| *sep !=3D ':'` checks are redundant. Drop them.
>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
> Changes in v3:
> - Split the removal of redundant *sep !=3D ':' checks out of "libfdt:
>   overlay: Prepare fixup and fragment path helpers for reuse" into a
>   standalone patch
>=20
>  libfdt/fdt_overlay.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index c6dc4774cff3..8d96428af04f 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -432,7 +432,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdt=
o, int symbols_off,
> =20
>  		path =3D fixup_str;
>  		sep =3D memchr(fixup_str, ':', fixup_len);
> -		if (!sep || *sep !=3D ':')
> +		if (!sep)
>  			return -FDT_ERR_BADOVERLAY;
> =20
>  		path_len =3D sep - path;
> @@ -442,7 +442,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdt=
o, int symbols_off,
>  		fixup_len -=3D path_len + 1;
>  		name =3D sep + 1;
>  		sep =3D memchr(name, ':', fixup_len);
> -		if (!sep || *sep !=3D ':')
> +		if (!sep)
>  			return -FDT_ERR_BADOVERLAY;
> =20
>  		name_len =3D sep - name;
> --=20
> 2.56.0.317.g454f8302e1-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--vzkvR1MNFKW8SaHM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroEdoACgkQzQJF27ox
2Gfp1A/9HhJF7Z6YrkQt5zvLWM8j58Mr/x9d4MKOnFo6EWFSNTPZHbXXLx8QTThM
CL6lJMSMBqxIyCQMI9al264EeOwOMakD6025h3nACnP40VOMwQZrtS8r3Tb4p+H2
d9dSR5XA7ww3xV9E3VT+Z8VSPulgXqt31lZH/bdXt4VjebKjXFSdmghddN8Q9Ckc
qdIAXz6EumyQsnyyJiz1NIoLG3QzeImxXqgAuwTmMzcu1IMguBlMwHozMve2Ci4Y
QeEtOSDzoeu80GxL1FiaL1UFGc8sqo1y0xWMJbiOpPZ4DQUd4c88iFW8MGm8KWXA
a7t9SU0InfPp/n8Udl3H2m3jArppWGtBnKsx52KkBhsvZUWTOsF1BGy//HqlVGhm
aooam60JDoiF9cQusojKFXtKNBaGDGM1L2kPLEZal/wZY42aCtgO5Awtl0NvOo2D
aM4ioGc8ODdLi9uAbWgqy4ALKe9dUA1LyL7sQzYK7mULGy0g8FJWxhDGQyGmJQ1U
MEtAGmh0xpHtW771EJ2W08qpdL7B1YFOMY6Dl5sqULl1AFCmYSA9S3fu2WfRjy/i
zKzfCZHdEHs3qzpJT+tawmEqsOH+Dh/DvbGi8sREo2jaL/HxmV4n2AsfrriC7SJg
02AhqUK6nfHMaB36szHqxbbimvY0TqohW3Sb20IBqejOV7BM6rc=
=V81s
-----END PGP SIGNATURE-----

--vzkvR1MNFKW8SaHM--
