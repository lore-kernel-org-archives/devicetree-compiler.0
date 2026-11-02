Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793595268;
	b=ov381bdSHk84AKRI1fwqwXakSokWDrWizSJyNrzSf05LYp9Jpr61tRSxLAbNGx/VZ4Dv
	 S5DI/4ee4xEfbkQ1zNYb2IDxcwvubomxKGSKuWhLgHkgV0dWFE6Ohnqe8X3SYmuFJPJO+
	 H7fIo5WJkWq2xCsk39glscamQPQH69W8oUpTCOKDcd+2f1vx5h/FmXBNRDXErh/naNw5x
	 IX8it+zv7Iikq/siNU4cIF1Fe7odZKIV2lAiHloBgUvUmVQ9qKEymLLau9KF9ob9wXLr5
	 c2xb9PIwxxDYiK6cKve+/6p0yRK1N0UszrQ+zsUre2zit2ahucSqZ7WiEDN+wdgaFYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793595268;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=oryzbm2+2GqLRGWrilJfdFhGeAJ9raHvAg5JruqITwM=;
	b=G7N0SG47xEaGh2c8R7hw2OLRR67IzJfpRHUowW9ATsKUG6SLYuMFjLmGNe1dU829iTfs
	 b9vk4zdr0uuSLH4NLrIwdq+ERe0btEgtg9y4FdSl7UNNzgnum+qQ1Ao4xexb6nWo1wJIe
	 3y4Cf2k4SPMd+l2QUGISHjUKLAhmX7MPwRuJGPfWW28IM+/4s4DOz2w8uL+F9TBl451KW
	 K4b77IZAHcsQdyZ7jha1vBG9p+gCd8dd6OnkQiOOv5BINW5GtdbJBoibEsNpfNYK8d7RB
	 GyBBFZN5tZvJOnzVQIoseIzs3Ir0QuSD4uuTDIM4Ob+n5euGFMQ910P+lVCLtRuPbwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=vFvB4Kiy;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EA6606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 04:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28EA6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=vFvB4Kiy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793595265;
	bh=oryzbm2+2GqLRGWrilJfdFhGeAJ9raHvAg5JruqITwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFvB4KiyT7IeTytc+dzRr+ztnK41hN6WbSjF+eoA5RReJ1kwNLNRe53kFVteb4kQ0
	 0xNSBEBx2/Lx7ob0vwZzcuNszdF9lyfgdPydwwo+jBMbwh8W5NWU/ZM3JR8xjYUJVE
	 AXP00CzOfeCEiVs/0c6atRPG7MsIXP4oRIyxeVpmVY/QwGot2IuG9374zeEOXy7lNK
	 vpSCWYgoCEcjUTpS7/RYCEP/ux4TCKZq1a4W9v4n5AcGa+qceZo34iw02VEGRbgkfX
	 MfpxAzqwrQW0y+Jpr6jRRwkoM9lvnGA8Rgel6s1HfkBLfiUbcRJjRZ8QR/TGJAGzKn
	 wBotFTsX1cKrw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHzrd5qS4z4w9g; Mon, 02 Nov 2026 15:54:25 +1100 (AEDT)
Date: Mon, 2 Nov 2026 15:54:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4] doc: dts-format: Describe later definitions and
 deletes
Message-ID: <augXZhDreP9IgSRQ@gractus.seuss>
References: <20261101164616.2467286-1-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="RvWiOll3w7GTYGf2"
Content-Disposition: inline
In-Reply-To: <20261101164616.2467286-1-sjg@chromium.org>

--RvWiOll3w7GTYGf2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 09:46:11AM -0700, Simon Glass wrote:
> dts-format.txt does not say that a node can be defined more than once,
> nor describe /delete-property/ and /delete-node/, so anyone wanting to
> use them has to learn from examples or the parser.
>=20
> Add a section on how later definitions are merged, how to delete a
> property or node, and that an overlay cannot delete anything from the
> tree it is applied to.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> ---
> The other patches from v3 are dropped: David is applying the /dts-v1/
> fix himself, and he would rather extend dtc-fatal.sh than remove it, so
> the test changes need a different approach.
>=20
> Changes in v4:
> - Send this patch on its own
>=20
> Changes in v3:
> - Describe only the general rules, leaving out the edge cases
>=20
> Changes in v2:
> - Add new patch to document deletes
>=20
>  Documentation/dts-format.txt | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
> index 41741df..da0783b 100644
> --- a/Documentation/dts-format.txt
> +++ b/Documentation/dts-format.txt
> @@ -87,6 +87,41 @@ elements, as NUL-terminated strings, as bytestrings or=
 a combination of these.
>  	e.g. prop =3D [ab cd ef byte4: 00 ff fe];
>  	e.g. str =3D start: "string value" end: ;
> =20
> +Later definitions and deletes
> +-----------------------------
> +
> +A node may be defined more than once, for example in an included file
> +and again in the file which includes it. A later definition refers to
> +the node by '&' followed by its label or full path in braces, or
> +repeats the path from the root. The definitions are merged in source
> +order: a property which is defined again takes the new value, and new
> +properties and child nodes are added.

Sorry, I meant to say this earlier, but I think it got lost with the
other shuffles.

I don't think this wording is very clear - I think we want to
explicitly describe the "fragment" structure of the dts, and how those
are combined together.  The specifics of the /delete/ logic will make
more sense given that context.


> +	e.g. / {
> +		serial: serial@1000 {
> +			status =3D "disabled";
> +			clock-frequency =3D <100000000>;
> +		};
> +	     };
> +
> +	     &serial {
> +		status =3D "okay";
> +		/delete-property/ clock-frequency;
> +	     };
> +
> +Within a node definition, a property or child node can be removed with:
> +	/delete-property/ property-name;
> +	/delete-node/ node-name;
> +and outside any node, a node can be removed with:
> +	/delete-node/ &label;
> +
> +A delete in a later definition removes the property or node from the
> +earlier ones. Like child nodes, /delete-node/ must come after any
> +properties in a node definition.
> +
> +An overlay (a file with /plugin/) cannot delete anything from the tree
> +it is applied to, since the overlay format has no way to express this.
> +
> =20
>  File layout
>  -----------
> ---
> base-commit: c22868416b8db8354ce5db29d3494dda688a2ae3
> branch: delete-markers4
>=20
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--RvWiOll3w7GTYGf2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroF2YACgkQzQJF27ox
2GekGxAAhPWJkcgDL2xhbf5WpHY467TO/1whdfZdmQfB5SD468V1x/P67UY68QkF
2SL6Yu2tUsqCUpV/OSybPKqyLXwmJcNjtFt9+neDRXf8SIahlHu1u9yB9JfpqdtQ
nAjtO08TkiO0jnF7bUmHH+RqvxfHWNFoEkRqfZOAKU4nOZvC2/XFImaaxHDhxWCk
1pWeGPfGbD/gqgrp6OeZ67WZvjD98w4FsAuoSyOzfGtAW7CWFYbgcMrSpTLiqdl6
952JwEt9V+gAU3cMPQD/xUZXywhHYC4TWAR8aYcq4071zwVmTalNcKK7VH5ldJdG
jKN6XPDU+6eyTjdSHkv/Yd1moRdapTjuI8OapxUkYX5SW3ssP0wWZgd38FiUX3tj
gaYGLxNbTWIhasejIoiiNaETo2a1pXYQAWXh4LhqqSI3pzmYaraMtwaDx3DiFQdJ
HwmOT0XNdkaFkP1eOgIsJi8Bn0u8vkJBCtB2VxG+9yKdp6JIf/1t6PHizVzLsjcr
ooAv2nXL60+6UrdZirLxNYz89w1/V6KTcsKmhkZs9F9ea2JOyggJP55t1yLl9k9t
sQWUFBVlxfx9uIIDQR3f+CEib3/ZHODaM1y+niBq2KqfSLCLtghnz9WCI7Eq0VWW
4xp0G2MG0c4dTlLyrLFfPcXbsa53gmJWMDBEDM7HkwzAnSp4Iz8=
=8War
-----END PGP SIGNATURE-----

--RvWiOll3w7GTYGf2--
