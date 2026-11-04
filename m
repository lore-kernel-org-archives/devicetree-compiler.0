Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773965;
	b=Z24GAueA2ecagespt18nLpEJEyoLC5hDUMpM2bpUqoVF2mttQVNm4vbdQpHeh580a0mZ
	 kPRruvR20p/2ybqXw4YsK7nCmUfH7fXa/uwHjhN8qv2lYDydTmXAyzY1Jbzd0eWLBX2V7
	 c97mZRZnWvMEeNSk2sdRFWDPV1V83+jD6Q2yMBmIOK9RlY90jklNc4M+/aXjVYl98vSDF
	 7w9cBlGUNP6JjIZjHUFydsiwZHAsM8SaZosrv3C7Uy3CPJl9ZOV/n+XxoGH3W+arxw6Wy
	 XZ2CBNTBWRK4igmq+TqyVApA3VjotPjdELjJS2GuYawBsOVD++xYUVQKIU3qk6LhsSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773965;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=pz1VtrkXJ7Zrj5TUXsJNNp7WTkwkCi9gARDTSfKR+wc=;
	b=Mw1Jcqu5QoqRtJVlzF/ji3x4BpQbhOpD7zeE+Vg805ZubOYtGePKUyr6uRPgZTnDoW6X
	 p3ZHgNw1iAGI65OBqhf+UYAqSjzg8zU1ZAB1v08U9v9Enfc/tMC5aRaqnXXKY5nhEmNCi
	 9cjsyHmepVro/H9ILQprjsK7+beGiVgL1o041nlcXFMqEnGmIoWgjRhJ5V/Z36e7/aPze
	 DA+Rc2i21f+O+Kl7xhrCh4lyG8tBK6UNGKoixuv/bp7icXueBBmsoEkfVK4ws3TGZ/y9h
	 QYdBJHmnkhqHZXgMCJ7C8cabqUyJbNamCLNQHuv3r3OEwSTJd2cwHR93v6QITtitoFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=YgSpRdHn;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D5F606A329
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 06:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D5F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=YgSpRdHn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793773962;
	bh=pz1VtrkXJ7Zrj5TUXsJNNp7WTkwkCi9gARDTSfKR+wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgSpRdHngAmZ/kZkpS7VG3JJM8a15LYGyr1JJfxIf22398tYUuiZb3IWITzyCWLwy
	 IcF9kC8wrBFZOk8sPc8NInvYARQmDz3RAEBLNZlEbLlBoWU30/XkL+Gspm1aVoKKoj
	 Vd8jw3Su++BEG6Ky4vuIoHubHd1sylf7XHKn3VDYiCqHaj2gsV7OdvXA2sXgjLtA9t
	 VpnkytLBnxCJe7juKM7HTE6NKSNarhExQXdMZ8Jv1O2bXjXaDNhuUBphFvJZrb8IZx
	 Y8Co2uSbhmaBUsE5P8pLuWugkpwQA12+hq3wWRwaYqDBmjvXRwRWcVDWU77EzCeYxA
	 Xz1AKybmrDFcg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jKFx668y3z4w2F; Wed, 04 Nov 2026 17:32:42 +1100 (AEDT)
Date: Wed, 4 Nov 2026 17:32:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 02/13] dtc: Add a list for the top-level fragments of a
 dts file
Message-ID: <aurRguellIz-7spN@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-3-sjg@chromium.org>
 <auhctwoLtdWs9p-7@gractus.seuss>
 <20261103185620.3bba770a@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="tJWUeelpB1hyMP3g"
Content-Disposition: inline
In-Reply-To: <20261103185620.3bba770a@bootlin.com>

--tJWUeelpB1hyMP3g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 06:56:20PM +0100, Herve Codina wrote:
> On Mon, 2 Nov 2026 20:49:48 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Sun, Nov 01, 2026 at 09:36:56AM -0700, Simon Glass wrote:
> > > A dts file is made up of top-level fragments: the root node, later
> > > definitions of a node by label or path, and /delete-node/ or
> > > /omit-if-no-ref/ with a reference. We would like to deal with each
> > > fragment on its own before it is merged, for example to apply deletes
> > > consistently or to run some checks on each one, but that requires
> > > keeping the fragments apart. At present the parser merges each one in=
to
> > > the tree as soon as it is parsed. =20
> >=20
> > Btw, I'm extremely open to a better name than "fragment" if one occurs
> > to you.  I believe I originally thought of these as "overlays" but
> > that's confusing since runtime overlays were invented.
>=20
> "A dts file is made up of top-level fragments: the root node, later
> definitions of a node by label or path"
>=20
> A node reference by a label or a path is not a definition of node, it is
> a reference to a node.
>=20
> Once those references are merged (if possible), we only have a root node
> and orphan nodes (nodes without a parent node). Indeed, those orphan nodes
> reference a node out of the current devicetree (dts or dtb).

Yes..

> Orphan nodes are just references that cannot be merged in the current
> devicetree.
>=20
> Instead of "fragment", "unresolved" ?
>=20
> &label {
>    prop;
> };
>=20
> Is an unresolved node while &label is not resolved to an existing node.
>=20
> We try to merge those unresolved nodes (label resolution + merge) and any
> unresolved nodes that are not merged (label not resolved) are orphan node=
s.
>=20
> The exact same occurs when we use paths instead of label. The only differ=
ence
> is that a path can always be resolved. Having an unresolved path is an er=
ror.
>=20
> With that in mind, having a look at orphan nodes in the addon series [0] =
(patch 44
> and following ones) could give some ideas.
>=20
> Does it make sense ?

That's all true, but I don't see what you're suggesting.  Here I'm
looking for a name for the syntactic top-level construct, whether or
not it's resolvable within this file or not.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--tJWUeelpB1hyMP3g
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrq0YIACgkQzQJF27ox
2GcqqQ//QV9WZk69PpYR07GQUj+HFfYi5onPEhqCC+bQyKAV0qhQz6Ze8H8TJ1Hn
N6pdeugBIU4bMsxWnPj3ldVvhaOOeU4Ww7QG5viyjrCBz0o+nehfvJWzqV4sXNej
AYbNA8sZKgpzsHFvpzrlViwk3qQ+qc57Mp3yMWodA1f9m2PSHJcB8TSk6u7/bJ72
8jSzkZJdl1X4s6eoTWJDNLblxzVHnms9voV065cyJy6bMADcjAAejGnsw1YSXZ4k
2amxguJoYayz8LpNPQb4Xvey7jYvUY56mrmTxgkemIkYuxiOjk00mZ0wdf6VzyVq
lz2O4ZgbqOF0b1iaGaoYopU2tC3rzWUwkGioqpqsWIvZUCqZNPS7YOtORcnGljo3
ktZaodT/MLsicSCaSdqLbTeQsTgMLEAYuVh31UGaEv/xrYwd8P0SNPAtZs2LxU1m
cphv6CasrEP0dxtRJk/hujQyTrzBbR//6Ig899mGQM26mQZ9OsCzEvhvTIpKTvca
+hIucHFQltfqMISy7LLfMtQXNN8DBdUpgVeGrGeD3eQer42i3K4ZJMpoHFVwzZGJ
GQuCl9dbXGeHycZSWHQkAZRzxsQpOl38Q/n7BDjQlTaNCb9CNbONi3N/GMGT7Czl
nU58u+WE1eFXadbDDFZyHtHxdnftDpkze5t37Nv5j/SeASwmFn0=
=AWf2
-----END PGP SIGNATURE-----

--tJWUeelpB1hyMP3g--
