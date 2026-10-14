Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA682D23A6
	for <devicetree-compiler@vger.kernel.org>; Wed, 14 Oct 2026 06:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791957970; cv=none; b=PuYNoldWddbYT2kNN5D8Oo0+yqympZm6E+b+tRzo/h34jhT6F/lK74f/vbD1wBz/iU8YXtUPMengOyMGYIAuZ0c/xWxH/XeY/ta8Gag4JhevCtjnmH/yyZ/3FRxyuryUuh/6ji8uyDOJTD7A/7AzGEE5OUXJcxghlr4h86YfAw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791957970; c=relaxed/simple;
	bh=/44DCn3HEZ5Ei1YRjxBBbgreFpjnRimZ8vJyULR0y2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7/2L4Wyn5cYSWj68ZlrYREYHx/i1sWAVXCpaoxfuKRbU7GBJ8l7haZSm+tT4Gh6L2KwMiwbzBRt2qGoqP8OrvT8KMn9vpV/zco5eATkcdqEQ1iPH1dNVpSgPwT+21YcUgKdomCA5lCk4XsGpu5aE3JN/xenxCOcb7G67JFkKf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=XNgBa/3L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="XNgBa/3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1791957965;
	bh=XKuFDslFRjuUg1u8W76XP80bTW9Z1KzepRT0RbCU7QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNgBa/3L/sKXHsjtE3WpRAXqJAPtkLFNgqGi1un/jzTmnXgqqXg6EwBgtlL0SiP2v
	 l7KnZBp9GgzZhSh0jAHT1JyVhxqbfjfqo3Ajrd4bkKhoA//HiuU1moqcQChtdfSr7p
	 ZQ3pkDKyX1IT7ssJ1rZGjgu2912qDiHqoRAJSC51cCQPqs298/sSU1SByuQRRpFpUG
	 M2PYTLtBRtq8pgJOlEwRsBpy6Ouq4d5vejPf2lO7U3nz4TvDWS2zfC5pBuU0Vxg/iE
	 e2EKt/xIa6an4SyY+fdyDq/wQKxtwxmsiB5diEXoGI0RI1Dn4inyoL6KcHNvKXta9r
	 3TvFDXHIIZcGg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j4LL531gMz4wGB; Wed, 14 Oct 2026 17:06:05 +1100 (AEDT)
Date: Wed, 14 Oct 2026 16:40:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] libfdt: Fix fdt_get_path() reading before the start of
 the buffer
Message-ID: <as8VzAevIZu1eQCK@gractus.seuss>
References: <20261001121036.2910243-1-ayan.kumar.halder@amd.com>
 <asRkJHpQ_gbAgC1t@gractus.seuss>
 <CAFLszTgkLjcNNYB+0sUAnpWK5n3tP5ZPUQB3-oF9Z8jB3YRi5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NaU54xJVvdirRTkt"
Content-Disposition: inline
In-Reply-To: <CAFLszTgkLjcNNYB+0sUAnpWK5n3tP5ZPUQB3-oF9Z8jB3YRi5w@mail.gmail.com>

--NaU54xJVvdirRTkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2026 at 01:15:44PM +0100, Simon Glass wrote:
> Hi,
>=20
> On Tue, 6 Oct 2026 at 04:01, David Gibson <david@gibson.dropbear.id.au> w=
rote:
> >
> > On Thu, Oct 01, 2026 at 01:10:36PM +0100, Ayan Kumar Halder wrote:
> > > fdt_get_path() walks the tree from the root, appending each node's na=
me
> > > to the caller's buffer as it goes down and removing the last component
> > > again as it comes back up.  It keeps the number of components current=
ly
> > > in the buffer in pdepth, and removes components while pdepth is great=
er
> > > than the depth reported by fdt_next_node().
> > >
> > > fdt_next_node() reports that it has left the tree by taking the depth
> > > negative, but the offset it returns at that point is the offset of the
> > > end tag, which is not negative.  The loop only tests the offset, so f=
or a
> > > nodeoffset at or past the end tag it runs one more time with a negati=
ve
> > > depth.  pdepth still counts the components in the buffer, so the remo=
val
> > > loop is asked to remove more components than are there: it takes the
> > > index down to zero and carries on scanning backwards for a '/' that is
> > > not in the buffer.
> > >
> > > Stop the walk when the depth shows it has left the tree.  Offsets that
> > > far along are rejected by the error paths below in any case, so this
> > > does not change what callers see.
> > >
> > > Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> >
> > I think this is a bug in fdt_next_node() rather than in
> > fdt_get_path().  It should not be returning offsets that are not valid
> > node offsets (excepting negative error codes, of course).
>=20
> The bug is only with an invalid nodeoffset past the root's FDT_END_NODE
>=20
> I don't think fdt_next_node() should change - fdt_node_end_offset_()
> relies on it returning the offset after the FDT_END_NODE when depth
> goes negative, and fdt_nop_node() and fdt_del_node() use that. For the
> last child of a node, that offset is the parent's FDT_END_NODE, so it
> is not a node offset.

Huh, good catch.  Looks like I deliberately changed it to be that way
in ce4d9c0f ("libfdt: Rework fdt_next_node()"), but I'd forgotten.

> One option would be to reject nodeoffset up front with fdt_check_node_off=
set_()

I'm not entirely sure where you're suggesting putting this.  I think
the original proposed fix is correct, although having an additional
offset test for robustness might not be a bad idea as well.

> For the commit message, as you mention, use 'FDT_END_NODE' rather than
> 'end tag' and make it clear this needs a bad nodeoffset - also try to
> explain the problem in the first paragraph.
>=20
> Also please add a bad-offset case to tests/get_path.c

Right.  I now think the fix itself is good, but some changes around it
are desirable:
  * Correct the commit message as indicated
  * Update the commit message to explicitly reference commit ce4d9c0f,
    which explains why fdt_next_node() works the way it does
  * Add a test case

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--NaU54xJVvdirRTkt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrPFcwACgkQzQJF27ox
2Gd+8A//bvVqv/tTe8oyZe6er7gRd2V71M+sRQ6zQtOmzuvVGkga4CZcjfvGVf8L
eT50a/Ju0IVO08pyo96ivAdRXwQdLPBtbC8E8JEKXOIV55lE+1OtETrkrgYr/t+J
TDta8C8J6bebjbfXpOF/2hvKt9khNpx4CV3drkz0wWdWrdKqbxMgSbyyv2F9L/Pt
VTjXOydawcyLRPcQ9FILACxr+hj57ceDU6q48bjYKwmf3flVro10i3YMUZNPvLHn
MSWVrrzvNLPzR5JXCC52Pc3VjjAI+7KpufXQyNTLWH2KUMfWeBJoFO54Yz8vtXFq
ReFV8HGn78U6pjfev9WUGneZmMYIcvmdUTU6q25AVixWWs9Xfx/tfLYbZhnobO1K
zyRw2COhh8pB8tgxjMWIUd0ySS1M3g03fiueX1dHUvH3ocOjeLt/cTbsQ0++/drk
VcswvD6aUSrjIYtnROjKYm2RnnhKDvHp2hKaJJ+x5DqWc9Dh5T6NyoaRoxwiY26+
/RGgbqv8dUTkVGjyx1UpoNFIpM9kqHfSrHSlhpHvXfzPyOePAmPBkiYgXyvfaFtS
AdilcoOsSUmhA94J6ppyXhWTV8zzrcAcB46CkwQEt/aWpAidu8X3NmsgphN7XKeS
SbQWjXpf7oo+E5Ochpd35TvgIvr9ar8hIv4nXrjdQPIs4k8b4Lo=
=zw0J
-----END PGP SIGNATURE-----

--NaU54xJVvdirRTkt--
