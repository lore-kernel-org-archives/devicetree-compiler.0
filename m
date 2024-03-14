Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBC86EB55
	for <devicetree-compiler@vger.kernel.org>; Thu, 14 Mar 2024 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710412871; cv=none; b=kP/C4LYjdnjEvg2StixwPkYmqPTMvV8S+ArKKn0PrDfgpyj5qjco9djVguv25n9ickdES0MQgF2uyEmSXmHPlStl5a2+81hS/ldDstragXKzR2NUbdmRCSAPsWzWNpyrupJZLJUPhD/0v2TSAOtukTAz6ABzZM1sAQF25LVfqw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710412871; c=relaxed/simple;
	bh=SQ/zksb7LGk9JJM6nZRz3/yvYWCY44KmOC/dGc+ImYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpfLD7ETQqmluCO5MRvvfyN2XwNBuQ7VIWEj6sFJVi+vsT+nhZEjJOEX4Kz504eQ6IEyBzFgYEM1DL8swuFPbSybEhcH8IzolAZIShZ7nQm2eiQm3FD+jrWWUlPLeoHFCR/kdC674+6D9+QBQH1JCJUlRTGhJZD1u2Ezn1tEIOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=G2qIWutm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="G2qIWutm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1710412864;
	bh=zmHBoZSGRClnO8VzPD8+hCCFac7q+4EnJqreOBtfb2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G2qIWutmjF9uq5ckOrR/jf2keoHGlwPeIMWRTPoD4BUQ/dWIvtSin7ZcsLvES3yRm
	 qZg7rVaASk7/QoupPFmmX1FXAOOVC9IEw41Y/qjZKeXYu6I2STcomBDgtbNaH9vnIq
	 fU4YK4MI1NkojyyCZE8yYHED/CYEyWQN9QGVIE4d64ru07nV7N1caB7r30ZMXXZqbI
	 ZSD0I0n9gqV/YgQF59/0XRgws4xsFRu1eqqyBiKFiNJEpbwdLlXYSPGZehi+MNHLk4
	 3pHsoyuuLQQ+v1a9HYPdeG/39dTxTConXaS9PWW/EQ8ZdIoesHgT4zdgsmQN/aVOpo
	 y9So+5FtWziCw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4TwP7432g5z4wqM; Thu, 14 Mar 2024 21:41:04 +1100 (AEDT)
Date: Thu, 14 Mar 2024 20:40:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Yves-Alexis Perez <corsac@debian.org>,
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v3] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <ZfLUMAYG-uHeYK6N@zatzit>
References: <20240225175422.156393-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rWFCMNpLI+EIHrpb"
Content-Disposition: inline
In-Reply-To: <20240225175422.156393-2-u.kleine-koenig@pengutronix.de>


--rWFCMNpLI+EIHrpb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 06:54:23PM +0100, Uwe Kleine-K=F6nig wrote:
> A phandle in an overlay is not supposed to overwrite a phandle that
> already exists in the base dtb as this breaks references to the
> respective node in the base.
>=20
> So add another iteration over the fdto that checks for such overwrites
> and fixes the fdto phandle's value to match the fdt's.
>=20
> A test is added that checks that newly added phandles and existing
> phandles work as expected.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> here comes the next iteration of the patch that fixes overlay
> application to not overwrite existing phandles.
>=20
> It is rebased to current main branch. The changes since v2 are:
>=20
>  - Add documentation
>  - Apply the simplification from 24f60011fd43 ("libfdt: Simplify
>    adjustment of values for local fixups") in the functions added here.
>  - Rename functions using shorter and better names
>  - Changed the test device trees to yield a hole in the phandle space
>  - Checked each phandle value not being overwritten separately
>=20
> Note I didn't switch the order of overlay_prevent_phandle_overwrite() and
> overlay_fixup_phandles() because the overlay's phandles must be resolved
> before I can do the recursion needed in
> overlay_prevent_phandle_overwrite().
>=20
> Best regards
> Uwe

Applied, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rWFCMNpLI+EIHrpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmXy1BYACgkQzQJF27ox
2GftbA/+LWM0B6yvbwTe16t6j3B1b0q4o2KJZH2czmriv4N5RxlaxfADVVwGBFLh
ILbtALeoeLEQV8ZQzq85V0SeqxzNQvlhV6V1bxiJyquIw++g7xHx5Pkua5GBhQl5
JKwhd1weaRui+khxJRLB0yJ24K8BaQqU8k2ZrVlvcuqz8r/7JTc9SVunPBlSXpFv
UDncpUv4tW8k2RTOqVmlGK4+T+qR0GT+hSz5oAI1zZ/X2XXJFeLGI07ULUTq9fLW
ZcyoF4omQJQph+x29wMuMAe4poXSXqlKF2fQboviSkoDQHjkUECyXN8ZhhqqaEDc
9UCGPWFB1S6GWNq6e6LNXguxpkCjI8V0Mgt5Dy+v/WzXcGSFyOxlohh7zN2UTNFi
wIb16hQ0Djq9f8z0obWh6DXWEXkOedaXM4wUHkbxszzq30R7mckX3sGwpnmJr35g
l+SJCQHZfeSRsiEDuGPvX6wMJcZ3+jjObLC9a8jtPzXAIgmJkIlg1ZyuqqDYZ0ex
SSzOfpdX3zhvQRr82Nhc63nfzSplT91jL3/wMRQCtXHyEcIFbJbG+qVHY2Rd/7OD
Wnj2sDO8JOAJhSHCR7dNYX0i6xR59TLCbzP9errEXkPY+h2VV0PNSW9uGXU3jc15
XWo8RvGJ9ymIVPi7OnJKlcj1EP7XCMufmEFEvy5C7rdWxuLULhM=
=fr5f
-----END PGP SIGNATURE-----

--rWFCMNpLI+EIHrpb--
