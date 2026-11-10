Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276738;
	b=mIn1+cY9uODuQWk96xutCbuJQbjply2mQUzBDG1SLHZSoqyaBV5NbsLIxC5gRn7mpFW6
	 jq2YQZdsiLptU7cwl2puNSr8F5TU/wJ8m6msMGLE0/ZLXXnlOjZFzYd9F22XdP9Gfgabf
	 DJnL7RtJqNwpSyOF1iKxLo/8X2QVFbrba9FRtvOe8HethSjGgn7OjMNutwsmZmUlBnifJ
	 vIgzHf5kuveOw7ouTHZD7P6wFNyt5ECKpsjNWko97dQupzpf95Mh5mNN46k9Jk4LpFA0b
	 NE2f2CEoXgl12uUe6f7Mlj1ZqxMAX6lBI2DMGtwbX0zeucvh6QhE3bIEJymaUxGki7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276738;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=irS42R6+DvFbO9i+VAkwWMQued7GWtppLzl2IM79+R0=;
	b=BKkcHQI7XIGVaEJWcFD0Mk3NS7+E/Pr+oOMJ8o5bojGfQlgt85L0iYBg+axP0a+op7KL
	 XlnRKTNf802T19XNYXhklKrayLQw8qNm5eLqacoxCoi4wnkvF9cGLiLJf7cIfUGi/x7HI
	 bz3uMeF+qCg8/9+UYifsu64keRtWZv9ELbS54a4QxN6VKb8Bw4JxmO1PfEf+IT8pCUTS0
	 60iOXDHr6wQonX1AaiWqo7Ji/LiMeTWTslWZauoUmkzMq0FSCrgyrqBP3W7m8JggFVm6a
	 b8vFPWOkIfd7+C1nzsLL6lOuB3Xl1Csg3Nx4EEYjKJtbeAkN30amfCVmtTk4rbm8jiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="vpQfZu0/";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009DF606A31C;
	Tue, 10 Nov 2026 02:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 009DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=vpQfZu0/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794276728;
	bh=irS42R6+DvFbO9i+VAkwWMQued7GWtppLzl2IM79+R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vpQfZu0/K5FY4Ri8ZPm3OThlykgbtYatCEuL1qj5/JKs8wZgAtRpS8vp9eVBxxawV
	 EkYiGUyAVuWXzkyLOpHlFNVVtUuLVyw5IOpqKfg9Ge6qHYRKDFNmICo0odsSayrmbN
	 39VJGnlUTdSkeBe7llmvuhl/FllSkS24EcMLW+zSS+Wcx8E+onshTn59zRpWYWqVPS
	 4+fB4ibvyY5obQqnVTR+75fKhhfh6HL/M16RRZrp/NbUwNtZ4P+u25IbdSjOfp+r5P
	 XvRBQCTbMY5nli94CFOdvNYLnLiAhaaSEuqf6aj4l0EiVwb+wV41XsPpoFPlOh6fXl
	 gez3m24/WUveQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jNqsh0vWSz4wKm; Tue, 10 Nov 2026 13:12:08 +1100 (AEDT)
Date: Tue, 10 Nov 2026 13:10:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree
 representation
Message-ID: <avJ88R_GDqtdBW1u@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org>
 <auhYb6FV2dPrbVxB@gractus.seuss>
 <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com>
 <aurMrnE3vD5eCEAV@gractus.seuss>
 <CAD=FV=UXCnBoU7V--1Sj0dzODCKgYNoBBLHH7N+aGYWzbUdpkQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="n7OeUluRuJBoVz+V"
Content-Disposition: inline
In-Reply-To: <CAD=FV=UXCnBoU7V--1Sj0dzODCKgYNoBBLHH7N+aGYWzbUdpkQ@mail.gmail.com>

--n7OeUluRuJBoVz+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 06:43:12PM -0800, Doug Anderson wrote:
> Hi David,
>=20
> On Wed, Nov 4, 2026 at 4:44 AM David Gibson <david@gibson.dropbear.id.au>=
 wrote:
> >
> > > +class Property(bytes):
> > > +    """Holds a device tree property name and value.
> > ...
> > > +    """
> > > +    def __new__(cls, name, value=3Db''):
> > > +        if not isinstance(value, (bytes, bytearray)):
> > > +            raise TypeError(f"Expected bytes or bytearray, got {type=
(value).__name__}")
> > > +        obj =3D super().__new__(cls, value)
> > > +        obj.name =3D name
> > > +        return obj
> >
> > Thanks!  I do wonder if we're doing this if we should update __eq_ and
> > __hash__ methods to take into account the property name.
>=20
> I don't think we can include `self.name` in `Property.__eq__` and
> `Property.__hash__` without breaking `Property` comparisons against
> plain `bytes`:
>=20
> 1. `fdt.getprop(node, name)` returns a `Property`, and existing callers
>    (including 10 assertions in `tests/pylibfdt_tests.py`, such as
>    `self.assertEqual(prop, b'test_tree1\0')`) compare `Property`
>    directly with `bytes`. If `Property.__eq__` required `other` to be a
>    `Property` with the same `.name`, `prop =3D=3D b'...'` would evaluate =
to
>    `False`.
>=20
> 2. If `Property.__eq__` only compared `self.name =3D=3D other.name` when
>    `isinstance(other, Property)` and still allowed `prop =3D=3D b'...'` f=
or
>    plain `bytes`, then:
>    - `=3D=3D` would no longer be transitive (`Property('a', b'x') =3D=3D =
b'x'`
>      and `Property('b', b'x') =3D=3D b'x'`, yet
>      `Property('a', b'x') !=3D Property('b', b'x')`).
>    - Python's data model requires `a =3D=3D b` to imply `hash(a) =3D=3D h=
ash(b)`,
>      so `hash(Property('a', b'x'))` must equal `hash(b'x')` if
>      `Property('a', b'x') =3D=3D b'x'` is `True`.
>=20
> In `DeviceTree`, properties are stored in `node.props` keyed by
> `prop.name`, so `node1.props =3D=3D node2.props` already compares both the
> property names and the byte values.
>=20
> What do you think?

Good point, never mind.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--n7OeUluRuJBoVz+V
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmryfPEACgkQzQJF27ox
2Gdtxg//VI/JCF7+MKwc7Y3gjycZy4wujOF3RLkBYUlHbcpCIiSpfA6vnKFVeisb
sJVh/oPAAk8r8Iw2PsBXnzWFsKi8qTJGrPaFZj34PZUzfjMeYsa2wVobn4fuaqQF
XbHBv1e8mngBZRvcsTicaX6TjyUMmQ23O5tE88eC+aWyymneb3W/2N0KJ90VpqUr
yE/oZpTrv8uOMs73YDz6YjWx57YdbFZXVxeH+3jDjCCCkbuBiOvQ0GYnC5sHNvak
6KCQk5Y2qiiEEkHMuAE7yKb52A85gwwSD+0ZKdGqfTYSODSH8uHmfVDQ1Jk4+wPT
hkCu+G4yU3C4xllxI3z4ZMcZXKjH84d5os4psNM5bZmNvBJa3kft1KhwxyBxq3rY
nARFahHoRVsfZ37Nl1BNe9G4i4wFahFTfKlB+GxZ3uNwc4O5CKMj5f/1pDmGbY+Q
tq3i/7VqYFHMsEomdbz9pfMaBv0aTwnv4Ts0QqJZ8bnKZh+zaJHMzhTSBW4dl0Zi
p/B6ST+N3u9NVCrGBo9uVbLHDztPCDUBspNIcBo16d0PEVroEZJAiS4Xx5O6qwV0
Punx+p1DNX4VRHAa0szCCGNmZItltujv00ywnRtl1Ws2OibXvUhVMoH7wp0rJac/
eJNT0USfWRTVxzURcWuT0V2Z94oVwdbF8LOzBQmg+VlVKF1C/kc=
=kEek
-----END PGP SIGNATURE-----

--n7OeUluRuJBoVz+V--
