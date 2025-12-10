Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0160E2376FD
	for <devicetree-compiler@vger.kernel.org>; Wed, 10 Dec 2025 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765349442; cv=none; b=WLX75jOj2MFI+H8tKhyFBms2GtAqQWzHTCmvAgGmN+Q292V8tezMXTXB0c/yMYwcmzKSeKrLsqtWNXKTWRvitSv0XHg4jjCFNUOdiVrFQdiXjF8QMJPBLydapyBWUDWIcjR+h0w2HaGv1387KEqGVVo8jwQ72ZpuZy/moaf8qOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765349442; c=relaxed/simple;
	bh=bN6v8e30rSQAnF19DSUyb3mXWn36+Jj8LknoIx+x/Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgeikNy/Zetk8bgUUQbwfP/CVHo0ahtAsnTFQG2C4BKC5SNEyay4GJ/BmCvObGahzHZ88kaUHc/jS8orIPmRSjRBtDqtA/paMHdamHGG/zh/6wDuDnvZYdvmNQ/idoiYOA1M65oAO4n80MoX8p54Z3tV0vmQhPHiDRxKH2DyKio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=NlGGS9/x; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="NlGGS9/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1765349437;
	bh=6nur6wM/lsWw9GAZEMH7EddpXQ3Cmiz4rYMiUb3kXKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlGGS9/xaVtPhWwrYI6sdx60VYwFm/nAcbFvgMlvhKtNeUsim2a4SvQRJsF5X9yRg
	 rQcCyPxw3rJ1smEeLSmFwWA0wzIN7w+xTceq6LGl4hBMSlClhOqzpLwXWtSSB39WBt
	 B5+Gdejkbelv9QjrivBolt8s8/O060eJahRQM+MnoLf9laUgNsILHTbGNlZo954voq
	 YLhKmcNz8hVsoi4v1S3dRHEmzYqNO4f1Te22gtEVU216JJdssO2clxdxpVbVZeyBMv
	 XaneQZyoZWH6oWWgptOuD1Qvpz219uQb303PBylKyCcLZ/KiffHh6bw4M4TO6j8nQm
	 F1hvsxUb1fOUQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dR5vd6jwyz4wHH; Wed, 10 Dec 2025 17:50:37 +1100 (AEDT)
Date: Wed, 10 Dec 2025 17:46:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Tom Rini <trini@konsulko.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 2/3] libfdt: Improve size savings in FDT_RO_PROBE slightly
Message-ID: <aTkXVOPm3BoinU24@zatzit>
References: <20251210022002.3004223-1-trini@konsulko.com>
 <20251210022002.3004223-3-trini@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pTRcVuYbhb26h9T+"
Content-Disposition: inline
In-Reply-To: <20251210022002.3004223-3-trini@konsulko.com>


--pTRcVuYbhb26h9T+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2025 at 03:50:52PM -0600, Tom Rini wrote:
> In the case where we have set FDT_ASSUME_MASK to disable
> ASSUME_VALID_DTB checks, we can improve the FDT_RO_PROBE macro slightly.
> The first thing that fdt_ro_probe_() does when we can_assume(VALID_DTB)
> is true is to return whatever the contents of the totalsize field of the
> DTB is. Since the FDT_RO_PROBE macro only cares about a negative value
> there, we can optimize this check such that we are to assume it's a
> valid DTB, we don't need to do anything here.
>=20
> Signed-off-by: Tom Rini <trini@konsulko.com>

Applied, thanks.

> ---
> In the case of U-Boot SPL (and similar very early stages) we are
> extremely concerned with binary size, and also assume the device tree is
> valid. This patch here is not a huge savings for us, but every little
> bit helps when talking about something that impacts more than half our
> build configurations.
> ---
>  libfdt/libfdt_internal.h | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 9eb32394eb79..0e103cafa714 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -11,11 +11,13 @@
>  #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
> =20
>  int32_t fdt_ro_probe_(const void *fdt);
> -#define FDT_RO_PROBE(fdt)					\
> -	{							\
> -		int32_t totalsize_;				\
> -		if ((totalsize_ =3D fdt_ro_probe_(fdt)) < 0)	\
> -			return totalsize_;			\
> +#define FDT_RO_PROBE(fdt)						\
> +	{								\
> +		if (!can_assume(VALID_DTB)) {				\
> +			int32_t totalsize_;				\
> +			if ((totalsize_ =3D fdt_ro_probe_(fdt)) < 0)	\
> +				return totalsize_;			\
> +		}							\
>  	}
> =20
>  int fdt_check_node_offset_(const void *fdt, int offset);
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--pTRcVuYbhb26h9T+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmk5F1MACgkQzQJF27ox
2Gdjzg//dbGXP/BSEgWJSlSb/FZM7iQuEQ+FHyf+u8MCa8dQ23KHZFyQfWYewrlV
nei+6ZgK3V9yFEoSkIxOxuFCRhc7m1gvvthk34k2XwRNC/pQa0+VId0kUsGd/tjv
7eSQjb2yiwx9aH6Am4IJX5PY0ZqsVRY2D2JnI6PGSVZs4kaY0wQuQL9vT/8pl+t8
EsD3m4m4AU682xr/8qIarSFxjJuD/TPb4lU6zyP1k6GmI5Tk5UwCDiuolxHABw9g
/NGpsk77vGOeJ+rc2I/3XbfjWrYATEZ3uxv3x0ixpUQDTvYo8h093zike81DMu72
jZ1NthZQPWVavu1hFHdbr86e8RgeNjS64LXca1IxTx4DkcOmNouiAbA7g61ZeqxW
fCDus/aRTNR6EtvgXXofNsmrCGCKC7uVQHNR+BTNqlJ3xIXIE0DvtZTmKFlbXFZB
HX1j6y5PuAJlxIGR/5IvL/44nbtRkoncUJGAmD/YenydtiYjQhXhJzboqMS8ax9y
mCLBHVoR+hxSXSHzTn8sS+k7wsfOK/Cj4mYLiXAmBwh25h4XjlhRnwngIWZhF750
LfAp+FsN7n1pTPka7bOmmsiE2q5Y2iGNNH1CDp+JJabqOjok5XAnAOj0Y+nhldCX
2iUCnYD5wDwGuVwqEOMHQkVg+OPyL2kkc/4xyUZ9tfSPFYzgJqc=
=J49W
-----END PGP SIGNATURE-----

--pTRcVuYbhb26h9T+--
