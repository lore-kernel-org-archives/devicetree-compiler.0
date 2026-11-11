Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365455;
	b=SObPcGIZTAS6LkhVmKlcoHU78t/ueyyDINogiHEZgDgvgTiGJ46F+W6BiDXl0kXK3V45
	 3RJjmb3KwIDOXrTTcE62Z9b0xYTJhqFF37Ko+GyRwKSF5Hs4gpQcXtXdlJuyALg90wWQV
	 rR9p8gObQoUm6ulo2Pzk+SPbRrH5UQWEl5KK3sBQteEcq1LqZnEuDV+JVG+MIp+PkxTse
	 TUXjsuW/XTE9TPcUWvvs5J99pGagn2qNQtEyLkTePa3rJjiDBFAZSjgimeoyW5Hivu/vp
	 H/2Xff9zws4yYBd/gSyzGBNPHxTigyVf6F0Gr1Ju8/t7rkAsTewgWGIucN36oAax7Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365455;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=jANfbU0JZOfYfKL4qW4k4ooWLeg2XySQMp0W6vqGMSE=;
	b=xI3nDm77SJ29KwmE6Yq9ysu9edY3ARy3WYC0qe1zvW5iU+lOC+E+ZSCkiBK/XC1q6vU4
	 gfX0/B7MHUdJs1j9NcSSuCf6mSD6bZ7PC+vdWugK8bOoP1+PSmJEGQvOV+co1Rnyq/d3P
	 JukdeJLyIGN3qIEWFB6Im8qW4p46L/eTw8Q2/P7Jd/c2c9+ye3y3mv4ASLANOPD7CiaIR
	 d9DvIxIOuY8yF9ukxVsQwC9NVbVk89OGEf/Zt7/Ds8Q1v4cSQ8Vnez+zYPLBrD0IJHMSv
	 v6WODXUN02lxUjUcc3blrkHbXZYlW4JDBGnzEgxZsFf8S1/83xZtXGVi1T/xXj7CXbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="NP/qotKW";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAEF606A320
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Nov 2026 02:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FAEF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=NP/qotKW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794365445;
	bh=jANfbU0JZOfYfKL4qW4k4ooWLeg2XySQMp0W6vqGMSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NP/qotKWOYSizDqbBXmIZl3k7EecFt6pOIzQlY+Acuwqi6e+z5+LcTMga++gXn8MX
	 RyXCwkxI9Iq852Ahi/u0M2YHeheZJIVUGqx1RyPMbh2K1Rxe5eTS3tWRCV24xKfApu
	 4A31btcNZWY9ULTcb4oMgsNLRwM0JiNeJb4/fTyYt3E09ZpI7GHnosAZlrCCfM2/7X
	 npuacyYsw5gtpRDdUBZDVkslR/iTopFe3GMZucPuRaTdJj/Zs3G7SRlQNyQUQVbTAG
	 xYh3D/+MyyrbuDt2UoJiXvGJ1jtw458uYHQJkX7em/BQVo86kpoPuMrxCeiK2UslFy
	 bp8KibYRyqAbg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jPSgn02DYz4wSl; Wed, 11 Nov 2026 13:50:44 +1100 (AEDT)
Date: Wed, 11 Nov 2026 13:48:59 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Vishal Chourasia <vishalc@linux.ibm.com>,
	devicetree-compiler@vger.kernel.org, sourabhjain@linux.ibm.com
Subject: Re: [PATCH] libfdt: Add fdt_add_subnode_tail()
Message-ID: <avPXjuf-q_bukDZc@gractus.seuss>
References: <20261103161425.1258558-1-vishalc@linux.ibm.com>
 <aurG-frOaM-X-Ay8@gractus.seuss>
 <CAFLszTjTvXBSThF0VjC7Lq8gP+XfoGk_D_Z2GTW9Fmxggn3CEg@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="60WyybtJspl4VtCm"
Content-Disposition: inline
In-Reply-To: <CAFLszTjTvXBSThF0VjC7Lq8gP+XfoGk_D_Z2GTW9Fmxggn3CEg@mail.gmail.com>

--60WyybtJspl4VtCm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 05:50:45PM +0000, Simon Glass wrote:
> Hi,
>=20
> On Tue, 3 Nov 2026 at 22:55, David Gibson <david@gibson.dropbear.id.au> w=
rote:
> >
> > On Tue, Nov 03, 2026 at 09:44:25PM +0530, Vishal Chourasia wrote:
> > > fdt_add_subnode() always inserts the new node as the first child of i=
ts
> > > parent, after the parent's properties. Code that builds a list of nod=
es
> > > by adding them one at a time therefore ends up with the nodes in reve=
rse
> > > order. That matters when the order is significant, e.g. when a blob is
> > > rebuilt from a live tree.
> > >
> > > Add fdt_add_subnode_tail() and fdt_add_subnode_namelen_tail(), which
> > > insert the new node right before the closing tag of the parent, so th=
at
> > > nodes added in sequence keep that sequence. Like fdt_add_subnode(), t=
hey
> > > use fdt_splice_struct_() and so leave the blob unmodified if there is
> > > not enough room.
> > >
> > > Also add an Fdt.add_subnode_tail() method to pylibfdt.
> > >
> > > Add tests for both: a C testcase covering ordering, parents with and
> > > without existing children, the root node, duplicate names and running
> > > out of space, and a short pylibfdt test of the wrapper.
> > >
> > > Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> >
> > I'd need a stronger and more specific rationale to consider applying
> > this.  In general node order should not matter to consumers of the
> > device tree, which is why we make no attempt to preserve it the
> > fdt_rw.c interface,
>=20
> Yes 'when a blob is rebuilt from a live tree' needs more detail. What
> is the use case that drove this?
>=20
> The spec doesn=E2=80=99t say that sibling order is significant, but it do=
esn=E2=80=99t
> say that it isn=E2=80=99t either. It only requires properties to come bef=
ore
> subnodes.

I guess not, because the modern(ish) spec is specifically describing
the flattened format, which necessarily has some sort of order.
Non-significance of the order might be implied by compatibility of the
device tree contents with IEEE 1275.  In IEEE 1275 the tree is not
flattened (access is via Forth firmware methods), and I don't think it
precludes an implementation which uses a hash table to store
properties and subnodes.

> rom my side, one use for this new function could be with Binman[1]
> which builds firmware images. The nodes describe the ordering of
> binaries within the image - example at [2].

I would strongly advise you not to design something which relies on
property or node order within the fdt format.

> Binman knows the current libfdt behaviour and is careful about
> ordering when it is generating nodes / processing templates.
>=20
> Specifically, the code at [3] (a Python interface on pylibfdt which I
> am looking forward to replacing with Doug's one) has to add nodes in
> reverse order and then rotate its own node list to match what libfdt
> produced. Inserting a node anywhere but first means deleting all its
> siblings and recreating them ([4]), and template expansion in binman
> ([5], called from [6]) has to walk its sources backwards.
>=20
> An fdt_add_subnode_tail() would let this code add nodes in the natural
> order, without the reversals or the delete-and-re-add step.
>=20
> Regards,
> Simon
>=20
> [1] https://github.com/deinde-dev/binman
> [2] https://binman.readthedocs.io/en/latest/binman.html#a-first-image
> [3] https://github.com/deinde-dev/dtoc/blob/1e8b69d7e95970f7c226d1a4d6cb9=
0b3e067ee61/dtoc/fdt.py#L684-L696
> [4] https://github.com/deinde-dev/dtoc/blob/1e8b69d7e95970f7c226d1a4d6cb9=
0b3e067ee61/dtoc/fdt.py#L577-L597
> [5] https://github.com/deinde-dev/dtoc/blob/1e8b69d7e95970f7c226d1a4d6cb9=
0b3e067ee61/dtoc/fdt.py#L735-L786
> [6] https://github.com/deinde-dev/binman/blob/7a9cfb456ddeaba09f0cefc3dfd=
6c801978c6509/binman/control.py#L498-L523
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--60WyybtJspl4VtCm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrz144ACgkQzQJF27ox
2GfGaxAAi3fI4Wq6u8lNlK2XHmqRsdGYoPI5CpndrYvj7uC9kpIZ2Jom0aSnsifT
loKN6atLlox0wKYooNrvV1VNYsMiIse2x98cXVuVTGUmGFiA5IRRhZjmPn5LnWRF
MTM6ceVxmHqx21VuuRO0noqEoGF5NURLQv/M0pADsZgFVuWzwbouwT/QgS0gUZDD
yUmGlZy8ufUoYzGSejXU8rBpJcE83ozDWD6qbYyEpadrd9xSp/RS7UnRigUVm8gL
qdxZs/LLGbzvIUzygWpCGs7jdXDlNFVR+pPHsmH/IWuRIEhhihfTiKXl1dAn22u1
ibk0r/vg+4qaIv+/lanCDb0aIljhDTXOQvwEYW9cSFLBl7N+87M8x8H5L6sH+xM0
1A5v7CChuVsJbQi6rjZUKPvwBAW52nLP4Z5CTGIDXxdLLwcQ1Knhrlka7jjY4YJq
zK+BzXX0lFMdIKsKKsEIM/Hk5B8YeoIcpBvwvpkXeG7sU7ch1rq7tM/yLvJtOx4x
8oigcSY185ufxTC0/F9IkKWHpwWOCGgJ8WMNmLbRovdYq9KwZQIPJfF8zLNM+zIf
FscoqQoFKEQUhPo9kJRHIxxlwb7D2ajTema1hE1uGLviz5HduCEEXLGqDJRT7J72
RGEbXTFCX4VI6Ze+bNGStLAG744zqECi2Aq13l7B9fim0R2dl1I=
=NSmn
-----END PGP SIGNATURE-----

--60WyybtJspl4VtCm--
