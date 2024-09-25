Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A782907
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Sep 2024 02:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727229890; cv=none; b=Vj2Ax1O/1FuicNyikKrdR7/qdz/dZ7cGm+zqtxRkveG1Yq4FZYGiEoLO85gDnFcb0a6833SqpspE+qq0OAjQQWs3KAVqyw2idJQ1NJChEwt7C9HT4HWMrD8TYFv99cSBDBwSz6Y7MgNWMHziHtXKc0WLP3suPJCgMZ1hw1vM6s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727229890; c=relaxed/simple;
	bh=auGfhXiPY5TsNd4GTog9PpNLtlHsKc7uPsRi0S4s7GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVdSFRswy1wYkMn9jC3jwsjuocgBy4p/KuLh3vg+uiQojf5c/8J5ZFTLII0caLKRVw0f6+OaIYanovKgGCNMGeNRAy+XKunV3n/kR44hpTh+CY/9QWF4NzgKPCyBx+6hBCDo02zDwJhx1AYsbI+jpCWkowfmK9nM+BJwnPtToRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=UoAVnDxo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="UoAVnDxo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1727229876;
	bh=eK7DP5UZmjwUzctf9uxrLxPxSLg/TtXM+CqVVdNoVVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UoAVnDxozJQaRxCIaeS8iz35iOhqQYAzv8tPYCIr8N3dzHrfwK3JhxHdQUCRdhgQl
	 6khW8mbj23HTW9zAxE7yvpTzX/sTisDBgXSyg3aoeSMwj9fKsnTpM6XD8mCmgXQH9w
	 SPuQ5xdi78m1XWS2mB/eP2R1HZ5l9ojZrPs67sFcznc98w2M3g2PZpd9tLZ2zFp/P7
	 ISdhBYvd7SXqnY7u4r1wDD5SzxtUbUo9IPbVIjltNdoZTWHHOHfEHtlD4XlK08EJvi
	 u8ZlbpIG6ryIZZK//NNclLg3idkEMA7QWSx96dbl1TVqmkKBkWzypi8HzADAJ+rIE1
	 aU7j/dyWLdQiA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XD0R84ygfz4xPc; Wed, 25 Sep 2024 12:04:36 +1000 (AEST)
Date: Wed, 25 Sep 2024 12:04:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andreas Gnau <andreas.gnau@iopsys.eu>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v1 1/2] util: Only read files until fdt_totalsize
Message-ID: <ZvNvotOXzlgN1Yha@zatzit.fritz.box>
References: <20240924145320.613246-1-andreas.gnau@iopsys.eu>
 <20240924145320.613246-2-andreas.gnau@iopsys.eu>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2KqWPK8zjr56+TOQ"
Content-Disposition: inline
In-Reply-To: <20240924145320.613246-2-andreas.gnau@iopsys.eu>


--2KqWPK8zjr56+TOQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 04:50:51PM +0200, Andreas Gnau wrote:
> When reading files, it is actually only necessary to read the amount of
> bytes specified in the FDT header. Any trailing data that is not part of
> the FDT is not relevant to the operation of any of the utilities and is
> discarded anyways. Stop reading when reaching either fdt_totalsize bytes
> or end-of-file.
>=20
> Stopping reading before end-of-file saves a considerable amount of
> memory when using FIT (Flattened Image Tree) [1] images with "external
> data" which are used by bootloaders such as Das U-Boot. In case of FIT
> images, the FDT is a few kilobytes, while the actual file can be several
> megabytes, which is quite a significant difference in memory usage.
>=20
> [1] https://fitspec.osfw.foundation/
>=20
> Signed-off-by: Andreas Gnau <andreas.gnau@iopsys.eu>

The idea is good, but the approach needs some work.

First, utilfdt_read_err() wasn't intended to be specific to loading a
dtb, although that happens to be all we use it for.  So I'd prefer to
see this replace by a new function named to indicate it's specifically
for loading dtbs.

Secondly, folding the totalsize logic into the existing loop is
unnecessarily complex.  If we're basing the load size on the totalsize
field, there's a much more straightforward approach:

 1. Load the (v1) header into a temporary buffer
 2. Check the magic number (to see if it really is a dtb)
 3. Allocate a final buffer based on totalsize, copy the header into it
 4. Read the remaining (totalsize - header) bytes into the buffer

Both (1) and (4) can be done with a classic "read_all()" helper to
deal with short read()s.

> ---
>  util.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/util.c b/util.c
> index 507f0120cd13..093303078d5f 100644
> --- a/util.c
> +++ b/util.c
> @@ -249,6 +249,7 @@ int utilfdt_read_err(const char *filename, char **buf=
fp, size_t *len)
>  	char *buf =3D NULL;
>  	size_t bufsize =3D 1024, offset =3D 0;
>  	int ret =3D 0;
> +	uint32_t totalsize =3D UINT32_MAX;
> =20
>  	*buffp =3D NULL;
>  	if (strcmp(filename, "-") !=3D 0) {
> @@ -257,7 +258,7 @@ int utilfdt_read_err(const char *filename, char **buf=
fp, size_t *len)
>  			return errno;
>  	}
> =20
> -	/* Loop until we have read everything */
> +	/* Loop until we have read until the end of file or end of FDT */
>  	buf =3D xmalloc(bufsize);
>  	do {
>  		/* Expand the buffer to hold the next chunk */
> @@ -272,14 +273,24 @@ int utilfdt_read_err(const char *filename, char **b=
uffp, size_t *len)
>  			break;
>  		}
>  		offset +=3D ret;
> -	} while (ret !=3D 0);
> +
> +		/* assumes that the size is always stored in V1 part */
> +		if (totalsize =3D=3D UINT32_MAX && offset >=3D FDT_V1_SIZE) {
> +			totalsize =3D fdt_totalsize(buf);
> +			if (totalsize <=3D 0)
> +				/* read file up to INT32_MAX in case of errors */
> +				totalsize =3D UINT32_MAX;
> +		}
> +	} while (ret !=3D 0 && offset < totalsize);
> =20
>  	/* Clean up, including closing stdin; return errno on error */
>  	close(fd);
> -	if (ret)
> +	if (ret <=3D 0)
>  		free(buf);
> -	else
> +	else {
>  		*buffp =3D buf;
> +		ret =3D 0;
> +	}
>  	if (len)
>  		*len =3D bufsize;
>  	return ret;

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--2KqWPK8zjr56+TOQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbzb6EACgkQzQJF27ox
2Gelow/+MCP34vGfTrKIYn/T1/njdoTUcB22MzhV85JsyMH11asH/ZyIa7s40br3
iWBsaA2Dpsz8UUNILcj+16vA/SKF+AJFZmgI+lSzWEYp3YyvhRx+5hQowbp7LE5n
PS48BqCUYOsFy53iCbLpbQ7aHFCJVhrCdU63bzH1cHAaqI1a7mHJOcZgLuXlss/W
2j0se2+AttKLf/bpr5VpgfjSbMxae91yv/pBXr0En10dEZ75Dj4l6p+gv2dPKxEa
7ZsEDYnlwey+8UltLxtc1Lwq1MBEmWXCmnCikV945XEsalj0RsrI7Aze1VPR0dED
00CfMDXa389aN5sT6UGgu2yo8FNvWwUVwDT7JNaXl+VLMNs8pHzo3MXGWie/vYjk
A0Bd4T5SisqBVkVgGr7RR/SmAhFl4G4/+4gx4NDBIJxqBBmWB/Z1Q7RvCSTZAG9b
J6ZpfYqw9xHxVX4gEjtdG3DEPyoNyq+tp8HRYRxCxryDgmDPX3rCh9YZmeqpWoQM
utRCS+AphzuY2o6W/hgddwF/44XEZEUYN709y53jbijZMVUYwN40aH2p1KnT3umo
836jffofrCXxBFFwM5FecGhkXugsiOC2L4kcIxgL3loQBtplCkumcMkqSkmz2f4P
dNLEampK+NpK9vaaJffsHJ/+XqRsN8ZArbLhxQ/3YZKDLUnmDfo=
=iEkw
-----END PGP SIGNATURE-----

--2KqWPK8zjr56+TOQ--
