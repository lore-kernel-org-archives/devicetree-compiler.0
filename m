Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA39E309F0D;
	Tue, 13 Jan 2026 03:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768276464; cv=none; b=WYdgdW2KQG5OchOcfiDHUiw/pb7Imxsi2PMRcXCoQ8mdBLzl/pAu/fVhOTepHxAhUqBsDnAmkEEuJln6AA1GnzMMax3HoKoLzDeOqSrGUDQj7TW0sfgK4TdaSsMAoDJqHeF5ENX0Qxu+BxOgVRb5taChdpxtGSJduVknXDaF9jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768276464; c=relaxed/simple;
	bh=ZASkFRSjgVu5ZUMONX9/R2A9XEMTBCwgm8BMAW4ZVco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpoF1ROGC0sJ0CfkX37DvqV0YhRBwUC4QzfLfJu22IZpRjlYxkxwKov89N7YfK8w1BzQEO2Q+zYQlvBjTScBJOfLaGA85M9+/aAzVN3y5LwdMMMB9lUUeXtihnqY7dtK+pirUPh2lvh8Uw2yDvREhLmITqoZG0hal57OpbbCPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Xfiu0WOw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Xfiu0WOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768276457;
	bh=QJYI+osB6ixYsYRSNUmv0fTr5/x3vKBrXLfwQRk+s50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xfiu0WOwbNXkfQv5WGHcMZr0Uf5zHXsbxRWepOYp7KsRpdoYWSCcRfNovVe36r8g9
	 QDZVJLf8KCe2zFy9R7UPLkxm8wUDjEkmYYXbvVqIk6wfANBeKglifyY0nl1T2Z9kPa
	 tMomKuPWdQIX7dk83LYIO8kuzC6dkIqpVU3mFHal5BQwN3XZas4i3PhaTeo5AT2z5f
	 Wj/2Csa90B9TJpmz0qjtgczt0n4nl9A5SiDPdMlffm8PPMVZXQAU3O0UEXDAD6Tg3C
	 +PETJP6g24yGwW3P8wIoK5v0mvl9zGYcYSwrS0tuKZFbhxdzR9iS47L26FKmdPP6XT
	 jyn2qSlE02XnA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dqwNT60psz4wR4; Tue, 13 Jan 2026 14:54:17 +1100 (AEDT)
Date: Tue, 13 Jan 2026 14:08:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 01/77] checks: Use consistent type for strspn()
 returned value
Message-ID: <aWW3Rs_uoJdksA_n@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U4TYAayxXiDcnGav"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-2-herve.codina@bootlin.com>


--U4TYAayxXiDcnGav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:18:51PM +0100, Herve Codina wrote:
> strspn() returns a size_t value.
>=20
> The function is called in several places and in all places this value is
> stored in a size_t variable except in check_node_name_chars_strict().
>=20
> Fix the variable type used in check_node_name_chars_strict().
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

This one makes sense regardless of the rest, so, merged.

> ---
>  checks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index 5d09216..041e565 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -324,7 +324,7 @@ ERROR(node_name_chars, check_node_name_chars, NODECHA=
RS);
>  static void check_node_name_chars_strict(struct check *c, struct dt_info=
 *dti,
>  					 struct node *node)
>  {
> -	int n =3D strspn(node->name, c->data);
> +	size_t n =3D strspn(node->name, c->data);
> =20
>  	if (n < node->basenamelen)
>  		FAIL(c, dti, node, "Character '%c' not recommended in node name",
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--U4TYAayxXiDcnGav
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmllt0UACgkQzQJF27ox
2Gc85xAAloroKB6daEF5cEtaODCLmNsLjbXthojuUQpY/Z5DxmSv9iwtbJMDM6Hn
YoLow2cvOypdQNoUe1hFkroug9BGpf2EwTJd+v4woQS+CnzObepZgv+29DkxdrXV
v6wDABXXG9pm5i8KBmR2SfCCn5U6DqxEK3SsRv7Fr/qUIKcB16qOEQOv8W6piWJn
Mo6x73s1GoWADQooIieaC+IWUFEVILBk9NLZmdo1i9TRW5D5aTi4xmE3WWOT/ytu
qmyHFlUxheweIqKPP6h2jX68+iv/0bn8V4LqGsJQhndqoVv7/pM/Q6joY23S8xdT
JA72CFGYYHLBvUcy9ezNrkk+MInfzBunFsBks7YgkWRM96EQCuTgRDuhg5mUoQm4
sO6yt37zD9oxj4jOs0T/xfMmQvbsODYWSZgTyYuL1+cira451cI2QTDK9zS51edq
UuwO2bvOeiW2AIJpVpCzWCWZV7qlMZm7rqUSVTRMOqICsQaeXjRtgDMU9qg/1w8W
RctPSBy4D8z/UMruG50T5dDYw7KXMsfJSI0YgPUf2mmbmOkcf5T0q209HZV+KiRc
8xhKTjiXnTz+1MT/lsJxZoSxN4tP4+9H2lsnFhsWmJRQQGRk09QZXevzTXEyw5rW
1jaeWTgfJhTelfH2ZyycsuAE5wk5w+q1UUxS8ABonLfQsdOub5w=
=bwAN
-----END PGP SIGNATURE-----

--U4TYAayxXiDcnGav--
