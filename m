Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591535;
	b=UbF3szoWyR+76PBuQ0zV4MZ34syH/huEJWI9l3KF52dHbYByqKFWvJewlQ+jP6VQQ2Dd
	 VOaSwwKxxdC6XBSoGXhOpg5D/IuIzQPVXywdS8FlqLL43e3t3LXXQ4VDUdW/sPxq/y1LX
	 vGjz+sJbxpX7vhnwBu97cYz1AUavu7r75bqhbwEjnq3cY5xDBAiHQJM7T+6ZJQ+4HoGey
	 EuXyKiA5fs7qEi96n2Kk++7UEiADpuAmnOz4Yzv6aVRqmgv7+FaYJKFSWPfxbUdnOeyb2
	 W/TyymEc7dXM++KD9W79rh7IO5Z8wDit1WFEr7g5TMi5WzAtO6Wvp1Hf0ydNXpMlMZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591535;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Sf+CKH9C9EBHpKPR+2FSq40gm8Dps7dc6Hm3+Jd3v5c=;
	b=Gz9sfAaliwqUwndboRy6kjHFR6KZuegElA4PSI/pF7BH2LB6V3kj/mRpKlLXfoN19646
	 JwUYQatNGtksnaqQUGnirJhXh4gxCaC1pFRYFyTPlLG2KguHznyazYRKxCsaJEu7IqDGb
	 oPad2VK48Svx2NVwTKHDxrPniJ//LZyqNHIaba83eXWS7r34+vSLp6FxzEH/gTFlg3AR+
	 O8pPsn07Bz+/cX7/vuUIEEEPKqcTTAzA3Az+3tl05MASlLzrTKOvgLG5d+UFH0zJZB9j3
	 KWYzdUm1iBxTDK4cpd8LhlvwalC7qU1cZl9QmnAVOlWt1V8G2jI0MXg+H8xbkxBNleg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=JtbCHgIV;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41DE606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 03:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B41DE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=JtbCHgIV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793591530;
	bh=Sf+CKH9C9EBHpKPR+2FSq40gm8Dps7dc6Hm3+Jd3v5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JtbCHgIVSNXkcw+Tw1kt8RPqCp6fjdZaXQnwqN/SifJavda54L9bZBZcxcVKEIN/k
	 EiSlELr+gay9IYYzBhAy9ykvfJ+vxxe9khY3RFrHEOmgKF/oy1cgnpNbVV758rKx0e
	 8uCfXikUcSDKHFRngIJ73chEy6qXJICCLjYGLNJcN9P4uQOlzoTiz8ln3yfkph1/mT
	 qjY03qFYY+GnOY6GJG9IENwv0y6nDZV5nEm+KcxZWK2b6Uif0GSZiD3lY9gMhXU+qN
	 JcMAgm2Clk/regTQDkRqbJX7JVyrMf6dvgNqo0Mq1KxX673Sv8HuoKd112cYgTMl0q
	 3JNQKFWC2Babw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHySp47GSz4wCM; Mon, 02 Nov 2026 14:52:10 +1100 (AEDT)
Date: Mon, 2 Nov 2026 14:52:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Kelvin Zhang <zhangkelvin@google.com>
Cc: devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] libfdt: Don't search for the terminator in
 fdt_get_string()
Message-ID: <augI1QfvUaWHR1ZC@gractus.seuss>
References: <CAOSmRziU2Nw2kMVN9VCseiwcuCa0SxBe=d+33=nVnCZxFXkKnw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="Okd/Prm8QMF7zRwo"
Content-Disposition: inline
In-Reply-To: <CAOSmRziU2Nw2kMVN9VCseiwcuCa0SxBe=d+33=nVnCZxFXkKnw@mail.gmail.com>

--Okd/Prm8QMF7zRwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 06:30:52PM -0800, Kelvin Zhang wrote:
> Unless FDT_ASSUME_MASK includes ASSUME_VALID_INPUT, fdt_get_string()
> finds the end of the string with memchr(), bounded by the end of the
> string block, which also checks that the string is terminated. A
> string block normally ends with a NUL, and then every string in it is
> terminated. Check that byte instead, so that fdt_string() doesn't
> scan the string at all, and only compute the length when the caller
> asks for it.
>=20
> This helps callers that look up many property names. With a 612 KiB
> tree on x86-64, built with gcc -O2 and the default FDT_ASSUME_MASK,
> calling fdt_string() for the name of each of its 17,899 properties
> takes 108 us instead of 160 us, not counting the walk that finds
> them. libufdt, which Android bootloaders use to apply overlays, calls
> fdt_string() at least once for every property it reads: tens of
> thousands of times to apply one overlay to a 445 KiB tree.
>=20
> Signed-off-by: Kelvin Zhang <zhangkelvin@google.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  libfdt/fdt_ro.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index ddfb8b9..44f3c7f 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -80,6 +80,18 @@ const char *fdt_get_string(const void *fdt, int
> stroffset, int *lenp)
>  	}
>=20
>  	s =3D (const char *)fdt + absoffset;
> +
> +	/*
> +	 * If the range ends with a NUL (always the case for a string block made
> +	 * of NUL-terminated strings), the string is terminated within it, so
> +	 * there is no need to search for the terminator.
> +	 */
> +	if (len && s[len - 1] =3D=3D '\0') {
> +		if (lenp)
> +			*lenp =3D strlen(s);
> +		return s;
> +	}
> +
>  	n =3D memchr(s, '\0', len);
>  	if (!n) {
>  		/* missing terminating NULL */
> --=20
> 2.56.0.385.gac671c819a-goog
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Okd/Prm8QMF7zRwo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroCNUACgkQzQJF27ox
2Gcx3A//SfxEQCnPmibCblbCuezm7aKGQTjsScQku2VlMhvGe/Xxr2W2Uc+c62V2
jnMJiyMgXliudGL/lsaXQXT7tytDlcQHg6ifigYBN/bn808yF7JcnFQ0J+Ci5PO1
bCE4IAGJZjygvqIXi35oLmC9bEg05Pd2Iuh2m5D7ypZQl8sCIoM+BSlfzdPy2+QP
Zylr+zwm562isZrBWIolHU1sx+gFEFHtzgU/SS6lljPLw3Jc+/oPkoX9WmC2qzuw
rVn85PegW1CA5XMy133LBLVm91Wv6X48Giq4d7At8fFXCvU+OSb09x8Xa2eu/VJD
YU1i1VtkFPLKHYhnWMH/SdngGYt70mfDPMGc0JHmR3e+00bGtsoJaBUqEoq5uoU4
UxCcnsLAlPNnym/EPknnTFzC3aSJ4UIHRiUQ/EUQQl6Deojwmhey00rkLbn5WP26
R9/son9vaGrGTB6jawtCfChO4jjhscF7/4AoiGBvazRUxphO5f3y/+LThJDfKxl8
bjU3Et8GfwFnw9kBjm/YVK6xvBOBjT33BnmQlffIDIVmLp98qXV4f9+M5fjvFIKL
a9xNk4z5V5/ddbw1HSRNIkSipIIFCe5rB8Um3gMFodHKi4qxtNTkEPg8R4LIxeCN
3BhSeuxGYohWBkEkuY2BWbjrhW5LEFEa6E+IUE5+jj75uYFZx34=
=UN10
-----END PGP SIGNATURE-----

--Okd/Prm8QMF7zRwo--
