Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8121513E3F5
	for <devicetree-compiler@vger.kernel.org>; Wed, 18 Dec 2024 05:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734499265; cv=none; b=fbKyNMHq6JhiG5qhaCky9Wv9DnM9TmcCbU04snUb8l1Kvul6BD5Tmy1HlM7eY8/cvn4v/7RV+ZOKL4N0B2dOP+reJPnh2utJIrZ7yIwo50vZOgVTxf9DCag6nOc4U4FKPXw4n8o6ODtnefZBDgp3OYKzyjhnlBCtc6q90CXyW0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734499265; c=relaxed/simple;
	bh=W20ceW2msYiJThodWgC/ASa5qamWpREv+kflp9vV6g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzZ2uHv5vuphsD4cxDezw3P24wrtv8jw9bLsQI6xTQT+eNCSkrsYtLHFBWSd+qbgvpefuD+4Hp6w5BHv9CsPyZ6MbJcYItT0QYiXoaY4oQzf8pp/KqIOkuUns7d6doKr4iDnCuEGoHZzEFEhHTpQ6KQjt+lB9TU7YeDN0VRAqvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Zgy1oN7s; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Zgy1oN7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202412; t=1734499255;
	bh=n0Qi6qBQmsYQCLS64kRg6bM3dniaNbaEGOpPCVB56yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zgy1oN7sBz0KCa1H7tJ6qbllvl4oJRKfWQcZHTuS2i9oZJ939siE0sTkU4lOZOJuk
	 FobJez84HsM4RCzXngzMr2HB1swQ8wfjVZcyK3s58NNr95P7U/34g7f6D2E3xjQZzK
	 WjzKUJdfMxXbzI8M9uq6ArPG8uTYWjK9CZVTekVethgVRykwdICva66AO+QHO0Awg4
	 kKqaOyBYaVHXRdRTU3WWjIkj+J0p8zkHQ2JQXC0Xf5JjqP94jwmTUkUSXUKpLlQHaI
	 TfBq49GF9IbZsWXOIbWEYRmapU74MTj76tUOeTqJ66LTPK5T5Olh18AlhWfrOD6+9H
	 B/6mq1MK0p2fw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4YChpv5vDtz4xdL; Wed, 18 Dec 2024 16:20:55 +1100 (AEDT)
Date: Wed, 18 Dec 2024 16:03:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Brad Griffis <bgriffis@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Warn about missing #address-cells for interrupt
 parents
Message-ID: <Z2JXtqDT8T9M78g6@zatzit>
References: <20241213141438.3616902-1-thierry.reding@gmail.com>
 <59988586-f518-47ec-ae08-6b98b52b6f4c@nvidia.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hVJJLJHBCeTf0GxD"
Content-Disposition: inline
In-Reply-To: <59988586-f518-47ec-ae08-6b98b52b6f4c@nvidia.com>


--hVJJLJHBCeTf0GxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 06:01:16PM -0800, Brad Griffis wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The device tree specification (v0.4) suggests that #address-cells is
> > mandatory for interrupt parent nodes. If this property is missing, Linux
> > will default to the value of 0.
>=20
> Just to clarify, this relates to interrupt-map specifically. In that
> scenario the device tree spec requires that both the child node and parent
> node specify #address-cells and #interrupt-cells. It further specifies if=
 a
> unit address component is not needed then it must be explicitly defined as
> zero. In other words, this does not seem to be just a suggestion, but more
> of a firm requirement.
>=20
> > A number of device tree files rely on Linux' fallback and don't specify
> > an explicit #address-cells as suggested by the specification. This can
> > cause issues when these device trees are passed to software with a more
> > pedantic interpretation of the DT spec.
>=20
> The device tree spec also says that in the case where #address-cells is n=
ot
> specified that a value of 2 should be assumed. So in this context, I find
> the kernel's current practice of assuming #address-cells =3D <0> also vio=
lates
> the spec.

Possibly.  However the assumed value of 2 is generally in the context
of 'ranges' and 'reg' properties, so there's at least some argument
that the kernel doing something different in the context of interrupt
maps is acceptable.

> > Add a warning when this case is detected so that device tree files can
> > be fixed.
>=20
> I think a warning is reasonable, but perhaps we should consider making it=
 an
> outright error. Though given the number of impacted device trees, perhaps
> that needs to be done in a couple of steps.

So, the suggested implementation adds it as another part of the
check_interrupt_map() logic, which is a warning (by default).  There's
no way of different sub-tests within a single named "check" have
different priority levels.  To do that you'd need to implement this
specific test as a separate check with its own entry in the table.
That wouldn't be an unreasonable thing to do, but it would be trickier
and probably require duplicating some other logic, so I can't really
blame Thierry for doing it this way.

Note that you can switch the interrupt map check as a whole to be a
full error with the command line option -Einterrupt_map

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--hVJJLJHBCeTf0GxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdiV7UACgkQzQJF27ox
2GfNoBAAiel9Y7RNt8Lf/iLWnIV3rrTsQijRW2B2riA6iW2JYnQIqHcs5eJyqAkn
WSAzm2gxpxLeXhQP4HICdCilnX8qkUabHSWbkM6D+c3rrQdUTOQdozS9j3nR7VII
wHBQ05LSix11Hp2iML6O56Xi8HpELjMXeE0GOHfdQ8c6q5qkVbvrKiMvL/BtDfTh
RHFKQdlLB5iOnO+LRHoiY1w/KGgw23g5Kb/WSZCJabUn38/59Kd0P2bkm7U2ASyz
6rij+15yHvICJQIuHeHExYouHKh1oAOSk9DTEIFF0GuUiZNPoslIZIdeBzmSiJIM
d0NhwAxy+eZozFumJTv/+46dN80qOXzvWxZKjf92Q/zishKNQ1kD/YM64a5oADK4
xVg+/VptFUSSVLsQiaA+4kc78z2xjf7va2TZgNGJtYyTAmfwR4XzfVnlNur0QNf0
uTaSo40tGJ4SjpVxpVwp4IEJjYYJeMIJzc7qAZ3pXjpXKoHVfzfpclgex1g1+Wqx
a6epTMKlMAdGTYjFVFHrbxHnHdtsJIgcFNBVwd2G+tVvEfUobuAoynR1T4lkOv4W
95DpveKs4BagmBlBjcMXDKUiOffCrNtXom1/ADFZbV+8ISUaDBj6rz0t3hl4k1qk
c7YNo/6oWrn/C23gJaGwYhHRa3pJR0esWlM6DUsCioxDEBPy1dg=
=42rk
-----END PGP SIGNATURE-----

--hVJJLJHBCeTf0GxD--
