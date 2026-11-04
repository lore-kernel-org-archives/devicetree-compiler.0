Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771274;
	b=ymj09LETV6bPWFY/VVdLxmLxiDGyR7M5aWIcbu9lBDprl073XfPsH/KgLiPbH0+vs1I1
	 9bZ6XwWccqAWSynQvB0nUrC4jgTW9KCe3MR97TNxur5Ff5Hhddm6tnbT8MI2SjfIHIArE
	 6c1Z1D7VgFOAS9+Q7+QkrODz8MUt2uAI41fVu4LZMydV35RTrY0CsLec29ZOlmsWIytUW
	 nyfTYxsgZeC9Gb5DLN5kwjC2k8RuEP87HuttbSkiSE4jN4dh+kHwg911cORXqQ6kK4w/0
	 qJrWKPy9Y8drdZhDBeV7+iu29UaKak5jGuzTRqdkVnCiT/Xyf++7OSjf1XadISX3WCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771274;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=uFQUio0g6JMuyA9EqaAzUVvqq8ESdaucvqVOF2EXjus=;
	b=bY5oyj7kB/GNm8VdKqD6RT0momuf0S3KHliHaY6yq87ehXAnj+dormdImI9yPF9XXJxy
	 77ablMB2PgmoT0wXLFcr9ZrFtRieIuFGdM4RvOqDBBGTclRG8CvHPJisXy3ClvdOius3I
	 D+l7JB4fMLJie0yOCJ6Pm3UUbPCg5noi1qUXhXl6YzpBYfCwtmuUNoA71Etz4gHGfL5On
	 EGG6dZ2dif04EzqBKoTZLOUc+EUev7kU65sREgoJe+f3NLbpVAYAOUUVBRUdO7WTgYXx7
	 fU4jyDwLRS3QoAMjxTDY6cqvkbNKwftcretV+brDMupD1pMy/kJcuo7WeBwKZt2J5Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=YBI5oyI+;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AFE606A31B
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 05:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3AFE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=YBI5oyI+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793771269;
	bh=uFQUio0g6JMuyA9EqaAzUVvqq8ESdaucvqVOF2EXjus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YBI5oyI+1aihPlRzyTt7XfSWicI0D5Y6hA0xY3Ebu6AUWOm80GlUBKHG4xDBE9CZW
	 PKx4g6lsLauQr0EWwWinoAhYaWcyM3pG76QILkZWhgCXaBYIM90RhaGx6ipOidKQn8
	 r6Sl3FddVMaOpDHfaU1yQ53/c8zjQwM2iWQ181MBgWHxNtFIRL3jyKgzG0Bmc84zka
	 6mwiuKzrizhUC90jHUs2dwYpDtO2chy32vzOPaq+lsRVPfKRdbCjdI04ZRHSzy7A/1
	 Z9GfLXFijZRoR8RK6k6P6fxgRvi1AbG61gAExFNMl/HRdHhYm3/lIKu/GcPWqBhs22
	 Eh6DYM6v6OFEg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jKDxK5cVCz4w9g; Wed, 04 Nov 2026 16:47:49 +1100 (AEDT)
Date: Wed, 4 Nov 2026 16:47:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: devicetree-compiler@vger.kernel.org, sourabhjain@linux.ibm.com
Subject: Re: [PATCH] libfdt: Add fdt_add_subnode_tail()
Message-ID: <aurG-frOaM-X-Ay8@gractus.seuss>
References: <20261103161425.1258558-1-vishalc@linux.ibm.com>
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
	protocol="application/pgp-signature"; boundary="ITBC3T/pELbtkfwW"
Content-Disposition: inline
In-Reply-To: <20261103161425.1258558-1-vishalc@linux.ibm.com>

--ITBC3T/pELbtkfwW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 09:44:25PM +0530, Vishal Chourasia wrote:
> fdt_add_subnode() always inserts the new node as the first child of its
> parent, after the parent's properties. Code that builds a list of nodes
> by adding them one at a time therefore ends up with the nodes in reverse
> order. That matters when the order is significant, e.g. when a blob is
> rebuilt from a live tree.
>=20
> Add fdt_add_subnode_tail() and fdt_add_subnode_namelen_tail(), which
> insert the new node right before the closing tag of the parent, so that
> nodes added in sequence keep that sequence. Like fdt_add_subnode(), they
> use fdt_splice_struct_() and so leave the blob unmodified if there is
> not enough room.
>=20
> Also add an Fdt.add_subnode_tail() method to pylibfdt.
>=20
> Add tests for both: a C testcase covering ordering, parents with and
> without existing children, the root node, duplicate names and running
> out of space, and a short pylibfdt test of the wrapper.
>=20
> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>

I'd need a stronger and more specific rationale to consider applying
this.  In general node order should not matter to consumers of the
device tree, which is why we make no attempt to preserve it the
fdt_rw.c interface,

The cited motivation doesn't make much sense to me for at least two
reasons.

1)  Order shouldn't matter in an fdt, but it has to exist as an
    artifact of flattening.  Order should matter even less in a live
    representation, and may not even exist (e.g. subnodes stored as a
    hash table).

2) The usual natural way of flattening a live tree is to use the
   fdt_sw.c interface, which *will* preserve order.
  =20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ITBC3T/pELbtkfwW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrqxvkACgkQzQJF27ox
2Gcs5Q//Q7o/NEhWxVfVOdPplUZfhMdpaFf/k0BnwKx5ord97Vc0FnSyUupMOfPI
sShFD7okCVuB2iQ2PqBLk7AelBz1+oBt5XSESVV5qiWGH/tg39qAiZ1DZ31njbMt
yd2WUmEjV48AvPcRXvs7B6IoOdHpobm36un7t7V5ZIl905pf1zW9cPhoo7FNop2p
FWAFaaQY5Z21UOE7GsczoWE+lQp6ja3QCpxSU4dq2B1k8QlEvcbs1NBaZQq6hxsG
PnC2wIla7M3fycodU6QTFGUiRdhRdtvty5C9NjaRm//1EWihqE5BdfbMJ7jrX9Gi
HJvG84e9dX/Zu+AcnWcJRai8bxJGslRcerIk0DOahoQJwUtlE7D6UjVdMqiBEXut
VnOLMPw5rKC5IfC3Tq/w6C7LPJTki6i5yFhPOEFVXybe798pyHKVhUb0W3yZVMHG
1v4mTO0EbauRLTUqCyaAaf27qJVs7A1SbK7Gv+lr0teK/8evnpLzb0u9l77tBDyD
jqFgkz8+460GRe7pJrQZeoKDULwj+bZQHcWdXcmDyHDgmDUR7MDe3ZZYseFCX9pk
s0iIrOuC/1bR2QLA0b3kMquYZcFkpzztTy4HiQKTEPlAk76nH+Y4CdESVGjhDUDc
ualwZf9G82lkEVyiEhi0fxEYH8m5BcsuZc1uWXg/TneyPnj7lDU=
=cOP5
-----END PGP SIGNATURE-----

--ITBC3T/pELbtkfwW--
