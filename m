Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22FE47B434;
	Wed, 21 Jan 2026 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986177; cv=none; b=F21T3jb9rqsYKBwnDDRVH91OGHDLdxF/a/kyZv7E3Fk0ro83vFfykIDS8Yvh1PW/1X0ufLU2lde32uiXWa4zX05j5EbKfp0b3cm6i7laltvWb5yvmqFJHelPr8MnVtjx0F5cjyAcIe6F4hCXxzBY4hsqjHL5ih1RDswZESrzITE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986177; c=relaxed/simple;
	bh=ka0ULQIUKqMh3b2RNXuVY1ex+ABAEEFnzmDs/hLvR6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqmlbRHAyPcAAxjeamkqI/GVnmaC82bfCQqhgptdvn9VzawKRXc5zzfM5n//sYZLYFRw80A3RXB//fHnJubUBSTio1UGKlMcVPKzEZ+dbNEc68bvS/Iz2MOh6r/SK80140LbHwzFjpjtEL6lqV+DL01fw84Zov2E0lVwUZ9z8E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=nQmKwT1Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="nQmKwT1Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768986170;
	bh=RS0262C9EZHDE/Ozhos9LH8uJQHNrcXTnFMYPJDC3Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQmKwT1QDP28AFpcupcbMpC3aWQjsRMgnuT3+628INvWb3WjF64K50uGxcUeKhNA3
	 SUL1toGeyfiFFnBhhOolA72jn2ajFTxoEJc9BhOV0kp5tjyLk7nZMouyfAIvlLdpTb
	 KNnnyPq3Yws13Qhvc64kSFnL2ht35U9bLaaYFGrYIts4v9vEA6kmoklEshA5a4WA/Z
	 3HyPiQbBm7zaV16vy6VLS8tEk42ZxIuUC8nXmM41sbQNO9VUHc5aSL+89d/8IFepcQ
	 eucou6ddGP4APkUgvPFIJkdInclouFsI1lG5CpveNStow3JrrfcxIgIJYJ2x0N5O/o
	 IavI+c2pvN1hg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dwyrp4cG5z4wCH; Wed, 21 Jan 2026 20:02:50 +1100 (AEDT)
Date: Wed, 21 Jan 2026 20:02:33 +1100
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
Subject: Re: [RFC PATCH 46/77] dtc: Introduce dti_get_marker_label()
Message-ID: <aXCWKf_hvdPsMNKL@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-47-herve.codina@bootlin.com>
 <aWiOcrj-1EB4cfO-@zatzit>
 <20260119170240.47437a8f@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ESkxfyR4Qodtky1"
Content-Disposition: inline
In-Reply-To: <20260119170240.47437a8f@bootlin.com>


--6ESkxfyR4Qodtky1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 05:02:40PM +0100, Herve Codina wrote:
> On Thu, 15 Jan 2026 17:51:30 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:19:36PM +0100, Herve Codina wrote:
> > > The future introduction of orphan nodes for addons device-tree will l=
ead
> > > to more than one tree in the addons data. Those trees will be:
> > >   - the classical root tree starting at the root node
> > >   - trees related to orphan nodes
> > >=20
> > > Also, an addon device-tree can have only trees based on orphan nodes.=
 In
> > > other words an addon device-tree is valid without having the classical
> > > 'root' tree.
> > >=20
> > > To prepare this change, introduce and use dti_get_marker_label().
> > >=20
> > > dti_get_marker_label() retrieves a marker and its related node and
> > > property based on the label value. It behaves in the same way as
> > > get_marker_label() but it works at the struct dt_info level.
> > >=20
> > > It handles the case where a 'root' device-tree is not present and will
> > > handle orphan nodes trees as soon as they will be introduced.
> > >=20
> > > This introduction doesn't lead to any functional changes. =20
> >=20
> > For all of these functions, if the new one is basically replacing the
> > old one, don't change the name, just change the signature.
>=20
> The old function is kept an used internally (move to static).
> It is not a simple replacement.

It's a replacement in the sense that all the existing callers are
moving to the new function.

> When I introduce orphan node later on, those dti_xxxx() functions call
> the old function multiple times. One call for the root tree and other cal=
ls
> for orphan trees.

> But anyway, If you prefer keeping the old name with a new signature,
> I can do the following:
>  - move function_name() to __function_name()
>  - Update the function_name() signature and call __function_name().

That's a better plan.  Except don't use __function_name().  _ prefixed
names are reserved for the C library.  Use a _ suffix instead
(e.g. see fdt_get_property_by_offset_()).

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--6ESkxfyR4Qodtky1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlwlh0ACgkQzQJF27ox
2GfVXQ//RtZrNUfiUzLMX6Ez9zIWtNtlRvi7GzcRRvtDilwRUtAx1uAjh1Z5Jjem
WBkpPUZxlwOE/UBYISPDL4vy2zTddChVb9Dvg3GBHed0rwiYwgsn9jjB+Ne6rfjv
ozEQd+DmMNzx83Pb6BQAJsX9Twy6oBYxysdackblfRlJ4oNEreGRhzXaNhqTks7A
Tu172rK9+gANZ+xDTQgE1ulSSAAm1lPWfn0uxWLdv9PkZvhg7puKwlEld4VseZb5
bn5TmG1B4KNawyzb9lOHtG/vhuRWqy2RQnL6WB+n/QBMhNofTQpCgDSzao1h1Kcu
ybM/yRSHS5QezXcIJ9NelQJclY0IxNPHOjdzmC+AzOMFi+lf1BDIOHOUFZxLU76R
p1AzmPFjrc96MO3zrMg5w8m5iodDV/AZzPxAaCvDsiSEoWQ5GhUoHZVmIlBUT0e6
pLlMQ/lkYcYnHM0TWIVp1f54Okm2mnbhkRSHOBJnvsKmpVasczv1U5Ix1suudflS
qzWvoYl9iBkM0GejbjAjgu77R7nob6hVeSdcbkvCsjJg0fbCGoEAKrzLDUxHcJg0
n9OJ26Zkyw97EP+O7Wp85nZ0qUWHqwpnTLJr6GgylNYbDQvwoI2eFoka8i2wVgvw
gQQpb8k2EbfWfzpsoYrL+g/PgkE5mmygi7kR0cD8rOMI+zWYQqg=
=EXxc
-----END PGP SIGNATURE-----

--6ESkxfyR4Qodtky1--
