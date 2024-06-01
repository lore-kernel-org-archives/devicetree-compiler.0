Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1517A17FF
	for <devicetree-compiler@vger.kernel.org>; Sat,  1 Jun 2024 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717230683; cv=none; b=eTbE3VfUQ/AkKIDya2JWE8jMkFIudRzaKhTbTptfsFcpMCEWFgncUQwQBRo28NQmX+S78Djdq0NGkgiYQn4EmVd9kosYn/P4BHtWeIkQZX/yC3EGTo71f/fJoWvrqWUDYJEi6295GFJaHa1XgMuvt/OFUsqq8Mu8GoVIs9LdFSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717230683; c=relaxed/simple;
	bh=oo5MEddID+HbPrwhyVWcc0cWOmeNBqpw6jqInnJJy9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfxwDf6ZxTvFWgAcfujuooEQeujsi04p2srMUBgzqYe5QYRS674JqQxMZ1+DCDc0XR2C/eCtSvMcojtTsTQWeY+Jbo26c0T13o+P9Q4UhSi5baGwM5dN19vVsZY2hvgjs/3BuJywhMD3YtTrvXv2lnn3XD/QjfuycDFUSh8+L40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=g4iz2Pbo reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="g4iz2Pbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1717230671;
	bh=Ido9hMYo1fUd8/nh3XWgQedAeB+ozTWg3hfR0gZLMa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4iz2Pbo1Ruqjeq2RjATdqClBDNkZHscy6czAqrkdiEGFpDmEuSr+r9w0DEFTDm1d
	 TR5SM8OPtKyQ047wlH1zrgQxFXPrb4qxOQWzVRPq5CvXXm16bj35RNXFHQI2DoU0GH
	 Zygughbz8Hhw3HtR+/WV5tqptYmcu+Qv22Y5hSZ40hryUYgJoNrbvrchhz/DNnUNqQ
	 yWnpedJNbWn7Sk0rTDseBe7rcbhHTJvMasmfQyLRM0sRSkOPidd5Dm9NSFTGVjTfb8
	 QpNoeQeBgk0FOjKwGKMkO8M6HLS1HJ4eEJJclbzXV+qcf+P5zuhnqN6jgFnMboeWNd
	 LbwhHvTEIScsQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4VrtVl56QVz4xM0; Sat,  1 Jun 2024 18:31:11 +1000 (AEST)
Date: Sat, 1 Jun 2024 18:31:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Check the overall length of "interrupt-map"
Message-ID: <ZlrcSdOSx2MX1_6g@zatzit>
References: <20240531133149.1498139-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i/E6PZC538A3bm3s"
Content-Disposition: inline
In-Reply-To: <20240531133149.1498139-1-robh@kernel.org>


--i/E6PZC538A3bm3s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 08:31:49AM -0500, Rob Herring (Arm) wrote:
> It is possible the overall length of "interrupt-map" is shorter than
> expected. A likely scenario is if "#address-cells" in the interrupt
> parent is not accounted for and there is only a single map entry. With
> multiple entries, one of the other tests would likely fail.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thanks.  Of course, a test case for this would be a nice followup.

> ---
>  checks.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index 28f86ccff56b..1950c18dd333 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1677,6 +1677,10 @@ static void check_interrupt_map(struct check *c,
>  			parent_cellsize +=3D propval_cell(cellprop);
> =20
>  		cell +=3D 1 + parent_cellsize;
> +		if (cell > map_cells)
> +			FAIL_PROP(c, dti, node, irq_map_prop,
> +				"property size (%d) mismatch, expected %zu",
> +				irq_map_prop->val.len, cell * sizeof(cell_t));
>  	}
>  }
>  WARNING(interrupt_map, check_interrupt_map, NULL, &phandle_references, &=
addr_size_cells, &interrupt_provider);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--i/E6PZC538A3bm3s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmZa3DUACgkQzQJF27ox
2GcnUA//YmDEsY1ZyHa/hhQW43/bYvp8uDJOIueTF/IceJuO6IfEh4F+cR2skntW
Fcp687hhUQ0lBdEeXiwgvRZsVlaEAFEp5u2UcBUwISNztChVzQtK6neN0nsDWEa+
asCj8RcMSS6ic6h7Ilva7FnQ24KOEp3albr4ewYUbq/IjAltAyYjc+edDL+sWtIW
lKXk4jkhj7gK/Z1/+w7HMGEWHiuZrdkOukoQHmFJzSx1PzvQZFcWJb9/2gVNuHQi
jOHQDgjVPKCjPMOH5AH+3wpzgC430iM/rQZZe6M57FSKF/od9F6qV6yf5+fk8S/y
b4majxsSls+gn/apyw8RnqrRV3GNGVyCm5Q9IK4Q7kDsWDGVIS1UXc/eWdZKxXX2
yl/Pm8cOHG3/miH7N9eBtod4dFTDK6a9iP2ka0eGs3EqV6ClF5tmUIB6WF3yf6Ch
cVEnst84z5+9leOY28B7KhHfE787eK4uvB5Bc7h67eu35qvvPyh0yMniTzoVpiFk
adYhz4Y0JnK6CAfKfdGYoTplhXHRRsrIvVfk6vW9sVj84y/xjpwfj0x1I/t3XBw6
YQKfSsJLAV7oay2S6Msjl4mpNfnA8hUDcmXMvWLcIKtcjvCWJ0Piov978XnlrgqR
zngLNKGUkZ4bnnMD6SgXgMAfwZWRTwMO1ilF4X06HtGOU8EaoyQ=
=jIKz
-----END PGP SIGNATURE-----

--i/E6PZC538A3bm3s--
