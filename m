Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879992;
	b=KUgsfW3k8zmTx0oQjd+8nvcjtL4js/BxOFYRh1BQkRWEITnh2o8yQY9GqeZ/tf9DUbEd
	 chpc0qSmy6tAa2K+SRZpfzsZzHgo4DiFAxoshdLaxyJf+E3GfTQ16BTGrR5SnKtdqL67Y
	 leOz7qBMFooWANiOqlnk0/vfnU+py21dSHJBVsbEqyOXjIUa6V58c0T4WbQ+U4BQXHEUB
	 np3a3i7d/fMHLg2jAgD1MSN2H3QpiV34L5DMujhDPJ5HD8ZYVxY+xXSz7yfMpdE92sDWu
	 1wpxnLMAj/Ul0DerGw1sohmeUch4bIn8sqJR3rGOqdeivcAmJ+GuvqcupomTd3+FO4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879992;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=FpnTKRtlZ6cGuVPuOQfH1/N5wjaj3Vnhk03P0K0tBj4=;
	b=Az8iCH58uNZq5fxZ4/3IN2eVJ88dIXgWmJoLmgNb0rhIdwxu4/2fFZCu9SF0kL4Kb1WR
	 ECpd8XSd0eQoW1pV6QbknvpyZs0aEIE0cAHL3ZO7rybAIiRYk134BKW4jvnlnc4GU0R0k
	 j8gBl+l8oI69yXU5faEeH+VbsfXtTmRStHatdlV+Lje96aa9zWvEZ3RxXSd3H+3kppiTH
	 c4dJuGjNKMGAS8XQ3gaO95+DlH7xCb114W+6TgTtuskycR/BZDIP7BnjoXj50MMIUNmHt
	 lPMuHOPRqP8oZ+h2VbtYHpGV8h2xmf8MuFWRyfp2Z5xJkar9FbzjaSh7aHl7ixhC6Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Z4PPxNfK;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B45C606A31C
	for <devicetree-compiler@vger.kernel.org>; Tue, 17 Nov 2026 01:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B45C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Z4PPxNfK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794879988;
	bh=FpnTKRtlZ6cGuVPuOQfH1/N5wjaj3Vnhk03P0K0tBj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4PPxNfK/bgyYA934ssYXV7s9OoAH0+4IXc/xqkX7J4k4JDl3ex1eUAQ3sJm4VnBz
	 PCp1BdU7mdRIVoH8r7eAXgpkw/reyK0o1D00+EP3OhdSPZoqLXoLgjb0ubtqh9LRU7
	 4WduhN7wbzWPGHLPR8yV7V0xXm7x/osXMl85yCnGFUSr1MVpooeJ6hI0QoUJfWVeNZ
	 tNGEwZD6iufT1V/McElm2y8Abq6tgNM7wayu8F3mo2O5xzuX/GVQdTNTFQ5kD0Iq5o
	 pC7CJG8t16LxSrLhzapuXpbWJUUU1iRN+qT8qkLQvMQPmcHOcri7IfvKEHFFUBBjxR
	 d7mtbz1Dyu3oA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jT6yr2fqxz4wSw; Tue, 17 Nov 2026 12:46:28 +1100 (AEDT)
Date: Tue, 17 Nov 2026 11:28:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Gabe Dijkstra <gabe.dijkstra@harmonic.fun>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: overlay: Bounds check local fixup offsets
Message-ID: <avufpMXjfUJ0EJYL@gractus.seuss>
References: <20261116210119.1562863-1-gabe.dijkstra@harmonic.fun>
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
	protocol="application/pgp-signature"; boundary="E4LSlI62VV6S65Va"
Content-Disposition: inline
In-Reply-To: <20261116210119.1562863-1-gabe.dijkstra@harmonic.fun>

--E4LSlI62VV6S65Va
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 09:01:19PM +0000, Gabe Dijkstra wrote:
> An unchecked /__local_fixups__ offset lets an overlay make
> fdt_overlay_apply() do a four byte read-modify-write up to 4 GiB past
> the property it names, outside the caller's overlay buffer.
> overlay_update_local_node_references() never compares the offset
> against the length of the property it is patching.
>=20
> Fix this by rejecting an offset that does not name a whole cell inside
> the target property, there and in the identical pattern in
> overlay_update_node_conflicting_references(), and add a test case.
>=20
> Assisted-by: Aristotle (Harmonic) <aristotle-harmonic@harmonic.fun>
> Signed-off-by: Gabe Dijkstra <gabe.dijkstra@harmonic.fun>
> ---
> The check used to exist: before 24f60011fd ("libfdt: Simplify
> adjustment of values for local fixups") the store went through
> fdt_setprop_inplace_namelen_partial(), which rejected an out of range
> offset with -FDT_ERR_BADOVERLAY.  That commit replaced the call with
> direct pointer arithmetic and the check went with it, so v1.7.1
> through v1.8.1 and current main are all affected.
>=20
> This is the same class of bug as fb7d79d7c6 ("libfdt: overlay: Fix
> out-of-bounds write on bad fixup offset"), and the fix mirrors it:
> compare by subtracting from the length rather than adding to the
> offset, guard the subtraction against underflow, and return
> -FDT_ERR_BADOVERLAY for a malformed overlay.  That commit hardened the
> shared helper, fdt_setprop_inplace_namelen_partial(), covering every
> fixup that reaches the blob through it; this one adds the equivalent
> check to /__local_fixups__.
>=20
> I have a standalone reproducer that builds an overlay with the
> sequential-write API, checks it with fdt_check_full() and applies it
> to an empty base tree, exhibiting the out-of-bounds read-modify-write;
> happy to post it if that is useful.

Merged, thanks.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--E4LSlI62VV6S65Va
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr7n6QACgkQzQJF27ox
2Gf9hA/6A8ev91VLfJfOtv543eSgM9rOGaLGodhTiGiUQKkwhzQw4LQSB6Nmi8aQ
I39EwV7AP9Zwf5fNyF65/uu/Td9Cibgaq8yNTmkqI9bsvLGqKm332dNox9YrCO+C
phgesVrU81u157yt7claL/0AanhzIJ1tsvxTZkDy/XLMWf1XqOcFOhnyzvALrPeb
VFLYbVTJFaMeGdzzXMGTTv1z++bmWxOkBQi9eFIIdRHxNzqzMSPtTv4d02+rUAnS
Q4ptIsHxZlvpInm3cA7haXsepVJv6JF5nszU3GL/F+LGkN+LXWP++kTb2pWmCfOi
JLHpgFRl1asUXjnTKqoYkGiG2SuY0ZLxY5ue1gzmVKY9BDpwjm+uH1Tr67NtaUeD
/5WeRO/brKEVcMoSm70/mMDFNf5zu+GqLa3+MdXG9vTTwstES8Zm295/VAUr3p3I
ZCPcFV+X7VfoOfBt5VQyq7LlDI+taL0dCUrCh0g2llYhsBMwK0IEXapfnSR8zzpl
duG7EwUEgRndrzQArQO7rEnIRmtRb7t0PxG+qoUDGzOtzRtJM+DBair2nqkjeirH
haIUkBrXZDreU4qhQQotpfwIf1/y5N1VpZBhPlTAnSt6Pg2SYfJ7o6x0poFKvdBO
O2V1yUgacrvmSOyA98VxCszfmPJpQVELA1TLrgNwPie1HN+x+LI=
=qxVO
-----END PGP SIGNATURE-----

--E4LSlI62VV6S65Va--
