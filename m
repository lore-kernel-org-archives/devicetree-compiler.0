Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793584157;
	b=sWuXW08R31hA5jqgdqiCUWCABfMOsvaPlFyhvy/denMyydWQAqkCMfWpS1jcGbn59/ai
	 OfR7F59+xPLA3Pn7G2lcngNocUET45ay9IMU7sb/SwnuNtPikka7NfvlABi7yozNyOlYj
	 NLAkZsrPQPrvELyhF5OXdTFHj2/yPui7bZzP2GvUwUOLQcb8IkR2hVXlezw/0TiX/KgD9
	 EA60U+wZkDOWd88HWEANjOFxR6mnB/hG/zca+XzhTZHdLg45Pu13P0EjDHvVRnoxrUwXc
	 pi+UyeXK63vhzMFdNnBInwHWW9vG4BAjYaTsIMB7KotMpFDaL8GOaCacxtk9BAMDSPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793584157;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=6Tpgqa5jZssgVNHmQjUknIbmQ+SLetqHAHYnTPMzLG8=;
	b=LV7DDq7YknIdGNFJoFDCsIhX/WJC8F7PeVir6SFT22tj7PsVdW/ky41lBE9Ys17Fr0su
	 zPFvj7uToMHw+0jk/yyi4WOFLQJ5GwPrpcUkn32WW5BE+WvsA0A7BKrfyWEwdWk3iC476
	 z+nBUW7yVjYHDUtUxFnksBbwRzRym1KvtIoQ7BOTLIZBvhbitjttfbnOwlOShXZgJ0WqU
	 dvqrbNPl2QiVAGiF+q8wvH3qzDXHDM+BJCWvDhlvvNTvCUr33cKKXXfsfHxl0a/RvKQpG
	 MYUr/CYe8y1AwkFxmsWwDeXrmIlhUKWQB06eZdMk7lv1ICJuMy2atXLTS5bQh/1gI6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=LskCqYt+;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E174606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 01:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E174606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=LskCqYt+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793584153;
	bh=6Tpgqa5jZssgVNHmQjUknIbmQ+SLetqHAHYnTPMzLG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LskCqYt+YiUPRVs992NRh66oaojH+ijC6reL/pUXcerzqOgpfebU8MeWC6XPpQK9Q
	 ycESYAW/Vl8YxxSXRVtfWKn05yOqO8STkDclydIPCWvIkoRgGduEMxZID9HVjl2GcN
	 //qY8jhOQbB/j7fxtrIwv64IV40A4Uja+dSt/JAErj81meNJA14Ty8HDROQu/EU1lr
	 iJnV1pQYOEgmKaS6AMqOIv/cf+NnPyjVriabby4V7NlR3Xsd0vDruNxC/haomKoVTU
	 O/iq4CL7onNuyqckeJOEFnBsTX7KmzCbLtGBiVXtHrVQJTd3tTYmFBe+IZObMt8Oym
	 Hvgf8Q++dXmvA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHvkx4kYCz4wBB; Mon, 02 Nov 2026 12:49:13 +1100 (AEDT)
Date: Mon, 2 Nov 2026 12:41:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] dtc: Fix deletes within a section and before a
 redefinition
Message-ID: <aufqF92dKRRdb3V3@gractus.seuss>
References: <20261028093620.3705074-1-sjg@chromium.org>
 <auK0ERvxGCJGSc3p@gractus.seuss>
 <CAFLszTjtkEjBMhbKomVr6WhrZH7hN3AcAMBwN2mvdmf+T-DQdw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="CUIycpqjwyiIcKxQ"
Content-Disposition: inline
In-Reply-To: <CAFLszTjtkEjBMhbKomVr6WhrZH7hN3AcAMBwN2mvdmf+T-DQdw@mail.gmail.com>

--CUIycpqjwyiIcKxQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 04:35:50PM +0000, Simon Glass wrote:
> Hi David,
>=20
> On Wed, 28 Oct 2026 at 20:52, David Gibson <david@gibson.dropbear.id.au> =
wrote:
> >
> > On Wed, Oct 28, 2026 at 03:36:07AM -0600, Simon Glass wrote:
> > > A /delete-property/ or /delete-node/ in the first section of a dts, or
> > > in a node which a later section adds, is ignored and leaves its
> > > placeholder in the tree, where it can show up as a bogus duplicate. A
> > > node which is deleted and then defined again also returns to its old
> > > place, with its old subnodes in their old order.
> > >
> > > The first patch applies each delete within its own section and keeps
> > > the placeholders out of the tree. The second removes deleted entries
> > > from the tree, so that a node defined again comes after the existing
> > > ones. The third clarifies some comments. The fourth lets dtc-fatal.sh
> > > check the error message, which the fifth uses to test an error for a
> > > delete in an overlay fragment which has nothing to delete there, since
> > > an overlay cannot delete from the base tree. The sixth documents how
> > > deletes behave.
> > >
> > > Note that the second and fifth patches change existing behaviour. The
> > > second changes the output of existing dts files which delete and then
> > > redefine a node or property. The fifth breaks the build of two overla=
ys
> > > in Linux, whose deletes have never taken effect. Each patch explains
> > > why this seems the better behaviour.
> >
> > Sorry, I didn't catch this in v1: I think this does improve behaviour,
> > but I don't think it's the right approach.
> >
> > At the moment we handle the fragment merges right within the parser,
> > meaning we have a single unified tree as soon as we return from
> > yyparse().  That's already a bit confusing, and means behaviour isn't
> > quite the same between the first fragment listed and subsequent ones.
> >
> > This series improves that consistency, but it does so with kind of
> > ad-hoc alterations which are pretty hard to keep track of.  It also
> > moves towards the model where later things can overwrite earlier
> > things, even within the same fragment, not just between fragments.
> > Although it is a way of making the semantics more consistent, I think
> > going that way makes it easier to have uncaught typos in the dt
> > source.
> >
> > Here's the approach I think we should take instead.  I've had this in
> > mind for a while, but never got around to it.  Seeing this series kind
> > of crystalized the rationale for me.  It is more work, but I think it
> > will be worth it:
> >
> > 1. Have the parser treat each fragment / overlay separately, returning
> >    a forest of those pieces, rather than a single tree
> >
> >   1a. We'll also want dt_from_blob() to parse dtbo /fragment@ pieces
> >       and convert those to a similar forest.  That can be implemented
> >       later on, though.
> >
> > 2a. For base trees, call a function from ain() which merges the forest
> >     into a single tree, with similar logic to what we have now.
> >
> > 2b. For /plugin/ trees, call a function from main() which wraps each
> >     parsed fragment in /frament@NN/__overlay__ and combines those
> >     into a single tree
> >
> > 3. Start splitting the checks into two sets.  One set runs *before*
> >    the merge on each individual fragment.  The other runs on the
> >    merged tree.
> >
> > Under this scheme /delete/ placeholders will only exist in the
> > forest-of-fragments stage.  They'll either be resolved by actually
> > deleting the node/property in (2a), or trip an error in (2b).
> >
> > This can be more gradual, but by moving things like the
> > duplicate_node_names checks to the pre-merge phase we can catch more
> > errors within fragments, without breaking either compile time or
> > runtime overlay semantics.
>=20
> Thanks for the info, agreed. I've dug into the code a bit and am
> sending a series for the first step: the parser returns a list of
> fragments, which main() then merges.

Excellent!

> Re your plan, should deleting something defined earlier in the same
> fragment be an error?

Yes, that was my intention, though we can revisit it if that breakgs
things for people in practice.  This was the way it was before
source-level overlays were implemented, and still is for the "base"
tree fragment in a file.

> In an overlay, a top-level /delete-node/ &label can remove a node from
> another fragment of the same overlay, as Herv=E9 pointed out. I assume
> that should keep working, with only deletes of something in the base
> tree being an error. Is that right?

Uh.. yes.  In a sense this is a question of whether we try to
partially resolve the overlays in a /plugin/ dts or not.  i.e. Do we
attempt to merge those fragments we can, or do we translate every
fragment directly into the dtbo to be resolved at runtime.  I'm not
sure there's a clear correct answer here, so I'd err on the side of
maintaining existing behaviour.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--CUIycpqjwyiIcKxQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrn6j0ACgkQzQJF27ox
2Ge3UQ//ZALb6RIb1aCvfKpxXV1n61QP7LfIcAg7jnp0adrCGzJ9ek0lZgiDD4nO
6nnR6AtW+fmId6uNdT6JDD6R4GDyQvsmMGuAs+zA8o8L72n6Du8PXdD7ogzTAQZE
8B1e2DMWzye4OH3D/do5pUPoRlhTrl595vB7jsUtWMdRLlLXFbserdXYFrJF457m
DZ4RJKn8DQIC8m2M5EYF6SrLM5f33VRbMZPTT7BMh3pTlhXutHYKOYQOeKB1QcWH
sgkCaRrEiJxFtx6rHz0khaq4i+xKVivBv8bvKgQ6jgWkOOH1N1FGD+S/HrT21r/m
hrBzHf0iyj2lhkH9ghcV6nkjhboECLJF9wQCZC5i1LpKDXhlHAwVP1UMhhIRXpcp
Cs9m8UBrokMXxihcKRqg6JnhotpxFCTpXxD2anTDGG7ng26NbKAb2xQ5XZB790hx
yXEnrNtQqdZlheLFHUPbWawonpNA1HF87U2ipUj/dwKA3i6irnZUMZIaHwYGzidC
wnVBg9yjnQWcJtm7Zrh7O4eRXjjdnEexV5CG+kaO0sKUIUnlzlspYBc/QmcMrHuc
QqbaD0nOLBRNebnvWw9/fKjNKdX0unr3iBaortxl0AUkspG4s5x4HecTmsqRYgFg
jIQtk0/uU5glESW1O+Sm3BOv/j6VtmZ7+Z6fKdy3P8Vs7n+Ua5U=
=ztiF
-----END PGP SIGNATURE-----

--CUIycpqjwyiIcKxQ--
