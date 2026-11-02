Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793596304;
	b=AoBZML7p1MyHGg5dRfOp0G6431L+15BLjalWE2FeY5QO7sk0SgbsP3N2aFwyDbZFBnua
	 KtbGY4YTiLZ6kgMuO1d9qPuqJzuY73H4XAmNzqS7tzP/I88QywB2O0dPdF7SPnsxOaGW3
	 dPFiWvoX/YbnKr4K0wbmB9cgFxFTcUmislj2aFrTxJiuQxwVrL11tlrpPJYX7UOXZgPb9
	 iBpN6dc995cGEkvoVU0TGqsf7SORmQT/8RTIVsYKDEVdLK2uMqBYJxsQyEGo8sr30+rqY
	 Zc5s1PbfSXxmRp28MWS+Pc3qhfFK9lAQ0ZlPAj8IhZquWVbD3JfOPtx1uJYXdTRUOIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793596304;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=DuSmUO3WO5YGU/XflTBygYq6rczGNrEy4qLxsXg6X+w=;
	b=YmX8D3VYPxJ8Xx7bppelkNWD1uyD78DiOHGMVnmyQWETvWXgE3S9rj0U/rta5xd5czI/
	 DUFyMsNxa8+geP32WL+gQfdSsb/AcG9U/yaa01SKQqH6AVjh3LS4SXQ/p874WtXaqQjej
	 iiDyiaLRQiB+v94pJsQTjVvDV4hUJuRCrvFErGAYIg5biakCYLF8yOjga5zzAhLCsf6ng
	 XPDchBt2/SI/hqUNBUAb17NUDQHXtjgN7UpADt1dWAJRJhJT/cfIE0WwyMREznj84j4Gw
	 55pVfI0cbLNbe6r7yGt8rvIty4N2yMMK45zd1SeRIzcx43cyqi3WGKCZSyBmxMW/FsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=PhHxNLqh;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E72606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 05:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E72606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=PhHxNLqh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793596296;
	bh=DuSmUO3WO5YGU/XflTBygYq6rczGNrEy4qLxsXg6X+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PhHxNLqhs4o1OK6k3HsZNgUriWKSQjNSpFSxhOHhLy1q3v3rdwiPpJbhln3zWyZJr
	 D/F9pY3FM+vcmLAIcIp8aS8Z12VOkyu4xEBgu7EQGuZ8/48r38rlh/wyJuhQ3EUAs5
	 0jc2/xP/GhPtAkm8te3+rQ++LjfCtVpLmF41YfhcjDsFGsyHVDuN7Fx55Rj+1huwB+
	 E43myonIV0JKFYxG4iql+UX9D0I7475/XGLIp0sM+VY5XT6mDK6S0sYd8EJ180e7iP
	 K5pB8hMrq0HlQEkRwumzO9O+uPpOOQpprL9Y1eonaCRr6Z2i5XYSLZL3gW8S+HoHAb
	 kzwFiBxhchJ7A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ0DS2L6cz4wC8; Mon, 02 Nov 2026 16:11:36 +1100 (AEDT)
Date: Mon, 2 Nov 2026 15:59:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Kelvin Zhang <zhangkelvin@google.com>
Cc: devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] libfdt: Check node names in one pass in fdt_next_tag()
Message-ID: <augYjBR-lLcsZcE-@gractus.seuss>
References: <CAOSmRzjuJmPc=59ebUaGfbWuDsd07RpoPM+Zu7qZomPB_zTx_g@mail.gmail.com>
 <augPyPn7VSk8G3HG@gractus.seuss>
 <CAOSmRzgXSJ_KbXfiwjdBh6hNHbZZUbRS5zXDunviPzaWtxzbrg@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="U4r0UKYzKZ76csad"
Content-Disposition: inline
In-Reply-To: <CAOSmRzgXSJ_KbXfiwjdBh6hNHbZZUbRS5zXDunviPzaWtxzbrg@mail.gmail.com>

--U4r0UKYzKZ76csad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 08:50:01PM -0800, Kelvin Zhang wrote:
> Hi David,
>=20
> Thanks for the thorough review!
>=20
> > I'd suggest this return an int, rather than unsigned, since int is how
> > offsets are generally represented in the API.
> ...
> > Since fdt_off_dt_struct() and fdt_totalsize() return uint32_t, it's
> > probably better to do the arithmetic in uint32_t, rather than plain
> > unsigned int (though they'll almost always be the same thing).
> ...
> > Having created this function, it would be good to rewrite
> > fdt_offset_ptr() in terms of it, to avoid logic duplication.
>=20
> Done in v2: fdt_struct_limit_() now uses uint32_t internally and returns
> int (-1 when off_dt_struct > totalsize, so even len =3D=3D 0 is rejected),
> and fdt_offset_ptr() is rewritten as:
>=20
> 	return fdt_offset_ptr_limit_(fdt, fdt_struct_limit_(fdt), offset, len);
>=20
> > I'm assuming the vast majority of the speedup comes from the
> > FDT_BEGIN_NODE case, and these other uses of the precomputed limit are
> > trivial.  Given that, I'm not really sure it's worth the more awkward
> > interface for those other cases.
>=20
> I measured the breakdown on the 612 KiB tree (3,012 nodes, 17,899
> properties):
>=20
> - Unpatched fdt_next_tag() full walk: 291 us
> - Only FDT_BEGIN_NODE using the precomputed limit (other three checks
>   calling fdt_offset_ptr()): 227 us
> - All four checks in fdt_next_tag() sharing the precomputed limit: 131 us
>=20
> So ~60% of the full-walk speedup actually comes from those other three
> checks (tagp, lenp, and the final offset - startoffset check). Because
> the tree has ~6x as many properties as nodes, those three sites run
> 65,745 times during the walk (vs ~36,000 byte checks in FDT_BEGIN_NODE),
> and the compiler does not inline/hoist fdt_offset_ptr() across the
> *nextoffset stores in fdt_next_tag().

Huh, interesting.  Thanks for checking.

> In addition, when the bootloader is built with stack protection enabled
> (e.g. -fstack-protector-strong), those out-of-line bounds-check calls
> become noticeably more expensive, especially on our test device where
> the CPU runs at a relatively low clock frequency (600 MHz) during boot.
>=20
> > The 1-byte offset_ptr() is a little awkward here.  I wonder if it
> > would be nice to create an fdt_offset_ptr_string() which internally
> > computes the limit to safely pull a \0 terminated string from a given
> > offset.
>=20
> Agreed that passing len =3D 1 was awkward. Since fdt_next_tag() already
> has limit in hand, v2 checks offset < 0 || offset >=3D limit directly in
> FDT_BEGIN_NODE before calling fdt_offset_ptr_(fdt, offset) and memchr().
>=20
> Sending v2 shortly (also stripping the function names from @@ hunk
> headers so Gmail's outbound gateway doesn't wrap long hunk header
> lines).

Ok.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--U4r0UKYzKZ76csad
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroGIwACgkQzQJF27ox
2Gfc8A//fqDBT1wNYPRWdmWpw3K6fs1cQxoOGjI5/GFZqiNY7ETgrevCK21PB5am
HpDGhnn8GAyo/oi1hAlGnUC/F0OUFneo2ZUCpVhyPTsMm1dT4pijSnI0t1Zhp8Ku
tSJhztDtSQMjiy26p+kGXbUNoqKlWYSwVji7GjePpO9ahjFzvAg6Jj4wVCJc8WaB
/p2bRHqiM13Bcpieh0h9Z+gssLS4GhR3xkD+OXEFF4s5Cn5WpA8uA/WyLiQV1CzZ
pNE03yDB2S3mCZCmL0Ut9EEB4l7F7Vu0R3jgAbQgeUfo6zbmqwMtpcPJk0080deA
ovCKQnq67ComaVvwnKolTXxa8Zc52gGlIq+PqYqnMVsOcuqevxyGafX24iXaAcOQ
0bT565B3paRrLQZOSHgrWjwOKM633iV0Sp2usQ8Ds21T5IysmhQFRfgHUAou8o4l
mK625dEIUQJdGCYsWfQlZNYqIYEYiWktN1WjunhAZ0gUYOXita+i77JEY0rEmmBA
gzP4s8NBo4YScb1SEWSkJKYHO9S3Dbt2UR9gqYraV3spnNgj8nqWTLzaeuMF66fm
lo0w8nNFp3BQyyIzyAwWaV1koUvxwuYfOBWLf//KpNuH1q+otoYQLMJhSgSc5AYt
BzlbL6Enr2VNuC7oJQlwyo3QFJcb4TsfP4gmLe/Eu9VT4rJcujw=
=9x2k
-----END PGP SIGNATURE-----

--U4r0UKYzKZ76csad--
