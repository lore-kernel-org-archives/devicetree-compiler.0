Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348A31E9907
	for <devicetree-compiler@vger.kernel.org>; Mon,  3 Mar 2025 10:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740996454; cv=none; b=cfLRuNO0kdVcWZUqdTfDHoCqwdSWBnmDQvRnm0GtGts3tUpZVaBlC/vz9Y1gefVcuq3XyCSTRsuH2M0juNL1bkBPsuTTxKmGQ/rAMXcR561YiuN4PmNoYNZVM7p47kPRV7upVWiy8PbJAieWgy+tkAwNWsDEuX6jRZ0GC6Q1OWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740996454; c=relaxed/simple;
	bh=dA0sd8R41PALmRd/7CHuyIN9bK7RWSqMzjVJfumRCLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7Raka7H5VDksaYEnxf5gcYg5DEfB6iW/VpOTiYw2NMkCzRWfpCvbmkWgOhjRGJOHCxby5fUaPvHLMdmtEQHpHEZjoNsOCeOc+oM3374uuLEjqXnkKrQp+Y2NzqEGDigIOFeeG6OnPE1msFOE3YBX4LIynpmW5/yoBHgN1+EPCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=eZp/MvMF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="eZp/MvMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202502; t=1740996449;
	bh=cFyhjNvgkhh0vK/BGV8qcB0eWbrFE9lVxtIcrVrA/YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZp/MvMF37RDvb1rAecUfTm3f0Gx5glQyqf9zCiiY+2rtUaIEMptoPNOx37RS275f
	 k07H+XKwqKJ9BBsl+qXK6RM5pJDnNSD6RRYInbTiFUGGat1Stdu0CBtgo1DsfR+YU/
	 6pjxmtAlFosoMjWmO4t9H5Bs/fQquumeNU6vmxLk/YAy3f4gbbiW1PAimxLV3eFw9x
	 OVZbrS6OUDghwQEEzSYNuCTCiG0yNohPp0WIjhCov6j0Dsoj120/3gAK5ztQEEmBS6
	 Y9q5EQSDx1ieKZamsLUO/mLIujfoGm1389vkRUnyFZVnC3gIDSyZ2L9FMWPajmEiym
	 ebMGilwD24AZw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Z5vcx1rydz4wj2; Mon,  3 Mar 2025 21:07:29 +1100 (AEDT)
Date: Mon, 3 Mar 2025 20:02:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Glass <sjg@chromium.org>, devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 0/3] Add capability to create property from old property
Message-ID: <Z8VwCsTCGXkFD46h@zatzit>
References: <20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CCV8KIXam3hOGJWX"
Content-Disposition: inline
In-Reply-To: <20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org>


--CCV8KIXam3hOGJWX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 01, 2025 at 06:55:01PM +0530, Ayush Singh wrote:
> Allow construction of new values for a property using old property
> value.
>=20
> This was originally suggested in /append-property/ Patch series [0] and
> can be used to achieve the same results (and much more).
>=20
> In practice, it looks as follows:
>=20
> dts-v1/;
>=20
> / {
> 	str-prop =3D "0";
> 	int-prop =3D <0>;
> };
>=20
> / {
> 	str-prop =3D /./, "1", /./;
> 	int-prop =3D /./, <1>, /./;
> };
>=20
> Open Items:
>=20
> - Integer array:
>=20
>   Currently, the use with integer arrays looks as follows:
>=20
>   /dts-v1/;
>  =20
>   / {
>           int-prop =3D <0 1>;
>   };
>  =20
>   / {
>           int-prop =3D /./, <2 3>, /./;
>   };
>=20
>   This will produce the correct code, and I personally prefer the
>   current syntax to ``</./ 1 /./>``.

You've made the correct choice.  We don't exactly keep track of types
in dtc, but we do some things close enough that you can kind of think
of things in terms of types.  </./ 1 /./> would make no sense from a
typing point of view, because you're putting a bytestring value /./ in
an operator that expects integers < ... >.

> - dts to source output can look somewhat weird
>=20
>   The above dts produces the following with annoation:
>=20
>   /dts-v1/;
>  =20
>   / { /* base.dts:3:3-5:3, base.dts:7:3-9:3 */
>           int-prop =3D <0x00 0x01>, <0x02 0x03>, <0x00 0x01>; /* base.dts=
:4:9-4:26, base.dts:8:9-8:36 */
>   }; /* base.dts:3:3-5:3, base.dts:7:3-9:3 */
>=20
>   It isn't a real problem since it allows easily tracing that some parts
>   were constructed at other places, but is differnt from how a normal
>   array would appear.

Right.  This is just another example of the fact that properties are
just bytestrings, so how we format them for -Odts is a guess as to
type.  I sometimes think that preserving some "type" information
during the run so that -I dts -O dts will give output more similar to
the input was a mistake, since it can increase the false impression
that the dtb format is self-describing.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--CCV8KIXam3hOGJWX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmfFcAYACgkQzQJF27ox
2GfyNg/+PJLaguBsewvB6S8EDB3i3vi5EzC4p5B7ZqJDyY+4bTktvZz2NK1TgSLP
4XKC/UdSYRkYWkvFi82BDEcQ+b28t5PvQLkYENA0Tc9V8PRyu3uJLvmpF93rEi0Z
fEboCrUYfXBEZJMXtegJgCcp2Ti3Fqu/qWfKN7pUYqpP6lC2bBClMNauFtSV3TQ7
x75b30i0Y3POHN1Z2RUHfFZSFi3zYvSD/Z0tT5/T7MVc+P9Q7w6NYHEktRQPDo9I
SQObLNBrvELhQWXqMaZDUzzpbcKQHxHwF3gj8l6qWEN0Mtgx4IL8mLfCSDSmLMUj
BHkZ/6Ow/7A/ZV30Kxvw4d1hPe5PfsR7+S0VZJ9hBgNrLytyg+9O7SMA/b71rbyC
4DXaVmttIkwUoIp5CX8bsJnNkglcBegHcYkFWjf2kCn/vAgrIuMBnL54fkcGbkfk
InCdnXQrSqfvSMCDhaepAsq8Fez2fU9V0Q+H//jys3+veqItxNuWlKi8pUYaIMbM
DaFB1HOLDhz90jMi+XJH9VXJX7OJdYXn1zS9fdn/9olEHcpAs+Y1iQKxUFY0CFEM
J07D41kMhaYLFGr7P8fL7LZ9Sjgv/jLLdh+NFjdj4gHCRr2Cs+RRVHF6R0+NIEeG
cPnLcEGp6b/3PqS9w478edeMsZPOPZK8SoywK8Kk2Y4pdXqJb4k=
=pEtR
-----END PGP SIGNATURE-----

--CCV8KIXam3hOGJWX--
