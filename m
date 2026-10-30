Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330205;
	b=WfhwDHskC9lXXnFH1+fzpuE/bBZjI60uzOeDo6PH4KVVtRGsczA9a2Pd4UCg99/PYfag
	 oR9mw4JOHWWVYoBK5r4POGIpbhIShOs5HVfFsQVEaz7X/sQtVaViDupnP+HlQBV76fr5U
	 AZ5fsMflwkK0teYf64QRPjnbFGxL5bdFRSy2JuHSZwjvhN+OgBHmFU6/i8r1o3gW6IsVj
	 Y2qENLwjZkTzaEuDCTvYHng7ogJmu8KnL7kHT/RhQh94YbSILjQb3S56b1itVKrkB1P39
	 NZk1pERwdwBVWDcT0j/o2JQlBFegzqJvMUkTFrUtFgMaP7xDuqz7WCaiuisVeqjrJfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330205;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=En8yY8KXGrQdIILu0HVwTrQ4HEZe1v/FeVq4dnRDUBc=;
	b=qteV3skluTH7yRocnF6v4/1cRgH8eqSzMLhF4eoVyC+Q4ClkgjdQToU0mSBVkIkgrFK9
	 1HutcLr//sGzcNwZGXcWzDI7HkFM8d/ZdRA8HaDlXTbuMEzfE0J6aOmsTyoR8d997Ybp1
	 GRA76ZvrLMDbGlVZhCkSTPPU6kwoFHOYLvL1kG61F/cpyWsdBRXOlb+hLaB3uD2VN1wBH
	 VUgxIJDK/bKTa1RW2YyPL0/j8uLEdS3FCF52GNfsd8oNnJbjZA0I5b033EE632z0rI8EZ
	 7xgy0EUtnLLTBUTtj92sXFdwyr5dRmHPHpMfqaN14PeS1zLA6S0miOh32PBrYdvVYgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=q2tOsp5m;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B06606A31E
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 03:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B06606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=q2tOsp5m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793330194;
	bh=En8yY8KXGrQdIILu0HVwTrQ4HEZe1v/FeVq4dnRDUBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2tOsp5mqV3PodbQWi4Z+aHZR5C9HeZhZOwqSiWMpPPHtYSEO8fliWM5q61FvDbkC
	 2MtXWZwKmNC3jPEbALpdVC5yRwlvVoyFnDMlNijl2InAUEfEeMlBdM8Rl+loQCGu8b
	 gfsTrq7AmHxejgDVuXvQyAjKOQTirXm8sSnLPQJGM7L6F6lvCC3L5UjethgUTEOMb4
	 XpGTbaw7Jg9OHAMz43o12tjVFv8puhanGxmjx+oMuWCUnY2Vrgqo+AbKTiM1Fy5eWc
	 OIJvspzOkNz1O9W6BlXtIb17ek3R2TR1qG2ich1aUtKDGfTD9LfTyhasS93oinCdI1
	 WVOjUeHU1XsKA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jG5q634nPz4x4W; Fri, 30 Oct 2026 14:16:34 +1100 (AEDT)
Date: Fri, 30 Oct 2026 14:11:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 3/4] doc: dts-format: Describe later definitions and
 deletes
Message-ID: <auQK46cxeP_27idl@gractus.seuss>
References: <20261029093115.3647778-1-sjg@chromium.org>
 <20261029093115.3647778-4-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="Pnaf5VlVQO6o18Jd"
Content-Disposition: inline
In-Reply-To: <20261029093115.3647778-4-sjg@chromium.org>

--Pnaf5VlVQO6o18Jd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 03:30:56AM -0600, Simon Glass wrote:
> dts-format.txt does not say that a node can be defined more than once,
> nor describe /delete-property/ and /delete-node/, so anyone wanting to
> use them has to learn from examples or the parser.
>=20
> Add a section on how later definitions are merged, how to delete a
> property or node, and that an overlay cannot delete anything from the
> tree it is applied to.

This is good information to add, but I think it can be expressed
better than this draft.

>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
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
> +and again in the file which includes it.

This is true, but kind of misleading.  Being able to "double define"
isn't really inherent to include files.  The problem here is that this
document never describes source-level overlays / fragments.  The "File
layout" section should be updated to cover that, rather than amending
the description there in a later section.

I think we want to be explicit about how those fragments overlay /
overwrite each other as a way to describing why and when a second node
definition makes sense.  As noted in my comments on the semantic
changes for merges, I think it would be preferable to _only_ allow
those overwrites on fragment merges, not allow them within a single
fragment (though of course either would be better than doing it
inconsistently as we do now).

Describing that source level fragment syntax would also then lead
naturally into extending this document to cover the /plugin/
directive and source for dtbo files.

It might be safer to leave updating this file until we've finalised
the cleanup of the actual semantics of merge, to make sure it remains
accurate.  This document has been wrong (or at least, incomplete) for
a decade, it can wait a little longer.

(Also, btw, converting the doc to Markdown might be a nice idea).


> +A later definition refers to
> +the node by '&' followed by its label or full path in braces, or
> +repeats the path from the root. The definitions are merged in source
> +order: a property which is defined again takes the new value, and new
> +properties and child nodes are added.
> +
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
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Pnaf5VlVQO6o18Jd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrkCuMACgkQzQJF27ox
2GdY/g/+PwrEzMBfNkmCh4lJ/yGOpvk1Zq6++uW8pZ7J1ja2u/IwoRGaiPb1zBc4
4y7BUsk2AB/yrpsG5Z0CFZDRwbozMH68CS58N5Urv+qgLGtnJ6mUHWGY2TphJhxU
BgFvRty/vwKLeKzIRRYS3MYfOC4du1nTFntJCFraBZz1J+qxQQDaFt8ks3544CSc
0P0YX+kSNt7Kj+/NaUokP0qQziNNxORCJH3VaVbVW2LxTrT35Xqj+v5wEcCggvko
4dcCC5lr++Rvv1t8dtvNSCLMupNUfUylNk3kZLNSAzGNb4ls6afMPCSY7ut2Cu9F
BNZOaC2c3n4BxHyzVXxnY40tc2zspVvXZTGWZWInpTvLTHPMpeT9ktvXo/BiTlKX
CljzBornWgVMitSiX2baIx8vzCvNwhVrsH2YTTHmRggdkJqmjUbzCYDBX2V46KpN
li+zubYWEtz1T01MNMnqY9Z7FQ2B49x83ODL7NrmPxM43vKCpc45clV5H4fVaM9D
BqPVKYALzSlBUlL555NvRWsYF5Kde2e9ELN2GLXxCPg+6mBAOFccu2I8G1gvpIX+
lWkyDbXwPJBoQ4LkIl3qwUMSdVqa014z2gRLLsmAAcMdBMF5slbGMQFZZYlvHmzv
9KZLc1WeBxXwh7WOlqt+maSQfd+jLbfZOy1XOWLbxQIzzGRgh7Y=
=erYU
-----END PGP SIGNATURE-----

--Pnaf5VlVQO6o18Jd--
