Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36268EEA9
	for <devicetree-compiler@vger.kernel.org>; Tue, 15 Apr 2025 01:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744681163; cv=none; b=XCciyImcer2CQp3brZfiyAr4RbzJ2tvKMM4UfehhWaSrPSQJ2R8rH3qyrilvufx/EQQ9HARfD5gAc303iJSaZK8A2wtXRFtxO5d9GPzXp9aY3WtSWdbGBUk0Uv9aV0p2KvEPX/ObTY8RpJT7slk3N0P4QRS2IKMiqsfAb66mXB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744681163; c=relaxed/simple;
	bh=pz9SDM9hc1qjJi3cqnZ8rI/me7BVlghpN9db+nT0Qd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAptDvY4jGlym7Mdre/aFVFNpc6JL9r2eTGvOw1ZAAPVH8JPLFeniQU6fSn+40xP/labBrFJGPHy4VufVlWTYg3HpUh1JpPN19XDhTiRzetCsjQ5aCqwiD9kbUkklda/Q6CoPZShsFbv840I43F6RgoCVpY20sOcckyepfapC8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Y1TLpiiQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Y1TLpiiQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1744681150;
	bh=BuK8CJdtkHj8xbx5bPZosI/vZMZFr9WXop38AWVKC9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1TLpiiQ7uDr8YExe6PWyunRng7k/UjMSyKkpooCna5MFJ2A5Nu9RaB24vqJSA4cJ
	 +Dhi8CtYhzEKGrcxihC5f8Y87GzKvxryPXqPvM/zant3miu4hzlonJX5PKI5Q2Zet9
	 adPGKYD9k1x2IOb6EQe1FfQiF4d1wxQ04L8wQrHi1UbaIfzADwwxkSn5puIYsz0/PZ
	 /sV/iEdUgUvQwpEEn7lp2rLO1+yBHt1Tu0ro4pPG6Mlb8UQmh5CLzYhe3HyCAzJfsz
	 YSGgQvWZzbRcHbAK8nh8aK0Y3meoPg/muVkgKrVJvYqfSb27QVZLQzfI6/JlYDDb8d
	 bzYwwlXI2c9Rg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Zc6JZ0SKcz4xM7; Tue, 15 Apr 2025 11:39:10 +1000 (AEST)
Date: Tue, 15 Apr 2025 11:39:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Yao Zi <ziyao@disroot.org>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [RESEND PATCH] flattree: Optimize stringtable_insert()
Message-ID: <Z_24t5n2WnmsqXAg@zatzit>
References: <20250412100351.9009-2-ziyao@disroot.org>
 <Z_yqFzoTQ4fpdd8g@zatzit>
 <Z_z7IUsK1zbikIp2@pie>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W0KyL7CaC9Baa4ro"
Content-Disposition: inline
In-Reply-To: <Z_z7IUsK1zbikIp2@pie>


--W0KyL7CaC9Baa4ro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 12:10:09PM +0000, Yao Zi wrote:
> On Mon, Apr 14, 2025 at 04:24:23PM +1000, David Gibson wrote:
> > On Sat, Apr 12, 2025 at 10:03:52AM +0000, Yao Zi wrote:
> > > According to perf result, stringtable_insert() is one of the five hot=
est
> > > functions, which is obvious since it depends on a brute-force,
> > > quadratic-complexity method to deduplicate the string block and is
> > > called at creation of every property.
> >=20
> > Right.  The optimization strategy of dtc and libfdt is pretty much "if
> > it's slow enough that it bothers someone, then we'll think about it".
> > Little effort has gone into optimization, in general, because device
> > trees are generally so small that runtime hasn't really been a
> > problem, even with very inefficient coding.
> >=20
> > > This patch optimizes the function in two ways,
> > >=20
> > > - Replace brute-force deduplication with libc-provided memmem(), which
> > >   is guaranteed to be in linear complexity on both glibc on musl libc.
> > >   This brings roughly 24.6% reduction in execution time.
> >=20
> > That said, this is a substantial improvement for a very simple change.
> > I'd be happy to apply this change, separated into its own patch.
> >=20
> > > - An open-addressing hashtable is maintained to track strings already
> > >   inserted. As property names are likely to be duplicated, this could
> > >   filter out many existing strings, avoiding traversing the string
> > >   block. This reduces another 1.2% of execution time.
> >=20
> > Honestly the substantial complexity this adds doesn't seem worth it
> > for a mere 1.2% improvement.
>=20
> Thanks for the feedback. At first I'm only interested in improving the
> deduplication with a hashtable -- but later it's found that reusing
> subsequences is also necessary and memmem() itself surprisingly brings a
> huge improvement.
>=20
> I'm preparing for v2 where the hashtable is split out and also used for
> optimizing get_node_by_label(). Although the changes are not ready for
> reviewing now, the new optimization reduces executation by another
> 6.4%. Do you think it's a reason strong enough to keep the the code?

Probably not, unless you can convince me there's a use case where the
performance is a pressing practical problem.

> Here's a summary of the changes,
>=20
> 	Makefile.dtc |   1 +
> 	checks.c     |   4 --
> 	dtc-parser.y |   4 +-
> 	dtc.c        |   4 ++
> 	dtc.h        |  19 +++++++
> 	flattree.c   |  68 +++++++++++++++++++------
> 	hashtable.c  | 141 +++++++++++++++++++++++++++++++++++++++++++++++++++
> 	livetree.c   |  35 +++++++++++--
> 	8 files changed, 251 insertions(+), 25 deletions(-)
>=20
> ...
>=20
>=20
> Best regards,
> Yao Zi
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--W0KyL7CaC9Baa4ro
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmf9uKYACgkQzQJF27ox
2GdzZA//alvNlwQxAhpw8XQ5OOTNmQUMFsgoSc0GO40Tu2c3124CCO7FFVg6qs6G
iAX1LEyYT81O2h8ENthk9tQrDq0lrNjIFBd/bCJxSZNyih6yEkNQ2Np6OXZ85mrs
bp6fCnxp86bWrsk1y9CDopnt0bejybit+8mzmatX5zopmEyxxw5tkgVPeozEAFuB
pZXEHS7k80LRkXGZ5iEVU73ncVmkDjry0obyYVE40hHvYnV+fF+Pc8OZ8qc0Fl5U
y+1I4rbBLcJ0VLZ3A0v6fnkMkzg9Aac7snS8uSnGfAekZLh1E5TQVOCBOfu5broO
BSh/W2XxoIUtm2mOGGGOBNy3rjnHvH0g3aArJLpwApoc3pINmqL9xEsMaqMxHfyQ
TCk/qN4RDLOif685eSkQZKfpXs3ARtvBcJhDaPJBbcZMRXB1MB2VE4dDu9PG9LqQ
tg6w+p8q7e12F+JfOPFCIfPmN0NEcOWWjtnxs/+uhDASHfX/vTOaxcbgDGm25XUM
3QHGvmQE8fXbM5yGsKDxCzrs94iL/8kC533OxHanA1nidADftArcTjchcEdEE0YD
vN+cN/XrRgtUUjbEx9sehnyg0QIEbyV0iUTV5/BLwGMXB7+cOqKEpsyPI+3J/wTQ
c0IcRaJSiXDr8JHLb5IOr5X8tk5C5aeyM1OyY38eJdYwha4+gnY=
=V4Kv
-----END PGP SIGNATURE-----

--W0KyL7CaC9Baa4ro--
