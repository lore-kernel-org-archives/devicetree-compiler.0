Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793242338;
	b=ay7ADbwZ7t0YxX1NE6hGCB2PjBI4UCRYnS6ELiM2dTtQ5Ic95VBDP4qi9MJXSLxywtxI
	 yzbQ7rMaSZrAiSQgQV+onMh44poS6dvUFHWOwUBisQOjrRqoUmi0GV0sfaPIWu5P6Ee38
	 E3VzD3H29MACNMDzuWyIZUXz8ieImLOX/WIIudyNcp3gvCiGzCyzlbVShVP1TuCE0Mjub
	 kZtv/JIEWNcP78/WF8uKbvZzV/nfsJdbvWU6yN671RiLX4qbwYdw4pKMAxV25BXo/xOk8
	 mfmX6LQ8ga7YBEQuHiSNV/GEhjQ2QYMlXvdo9Nlx9XxG6YkQMpV3fFW0PlNZuBz556A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793242338;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=qeSNa13G5QSuz2MA120rABNNoRF3IpX2bR75yGKW8DU=;
	b=qfHrxCiuVotOga49lRh1/7TvBza5h1Bo60Xs8UZT7cXBEoVPvvbMh2Saj1JvNHyttW+0
	 TcFyuR0DirOubRRyGrpL+oyj9Eb1CGxCPF9mL5dHISX2da8u023q4C6n8xFom739QIyko
	 BE2mErUtOm7AKEUBdsYXk0J7x/vLa3XkPppM/V796UVy5vs98Rm5WvHnQvZ17b0epjmim
	 N8dV6BjLFaNKN6haf+C8Hu48TIWtWLy4LqfUzidEEjtOqkEH2lwYECrpCBg1eKZSsI8Bm
	 s9ozzAc41KWBNmkbmT3QapLcvgoDtnS7h95J+NdGL5AwtbaT3Hp92kRSdfv76nvTp7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=DVUFQhR1;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4409606A31A
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4409606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=DVUFQhR1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793242333;
	bh=qeSNa13G5QSuz2MA120rABNNoRF3IpX2bR75yGKW8DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVUFQhR13kpFs4exPcqzcYSVuMHo9o8y/6grAaruW33cm+DG1BJeo8jG8UbXlh5/n
	 b5sTsiVmDMl4fQWVy+6oT1pisWLHrCFMqB9y5FzOADWCfOTsH0p3MH9x+SF00PEV5L
	 dlXDntgyqKvYPcdiAth+33Cx2dkbVT9Q2X7ZIVDX2RD+7q0Fnm4SfQW1UC+rFU7sTE
	 0hPh/VbKvpAhbB2ik+EMXKXfnoSg7Lgtedr5k3yBOJid10jUGS4uOsaRAHAnQKsMml
	 hgvDH1ezuoeMfK25GakwiKmQbM3STnKSZJ8OkPPv8iNvuRqODYn3xIgknuEZxRyDFn
	 tcovjvuTXWEQA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jFTKT5yHfz4wKN; Thu, 29 Oct 2026 13:52:13 +1100 (AEDT)
Date: Thu, 29 Oct 2026 13:49:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] dtc: Fix deletes within a section and before a
 redefinition
Message-ID: <auK0ERvxGCJGSc3p@gractus.seuss>
References: <20261028093620.3705074-1-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="xm2B2rc7c8X0QL8t"
Content-Disposition: inline
In-Reply-To: <20261028093620.3705074-1-sjg@chromium.org>

--xm2B2rc7c8X0QL8t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 03:36:07AM -0600, Simon Glass wrote:
> A /delete-property/ or /delete-node/ in the first section of a dts, or
> in a node which a later section adds, is ignored and leaves its
> placeholder in the tree, where it can show up as a bogus duplicate. A
> node which is deleted and then defined again also returns to its old
> place, with its old subnodes in their old order.
>=20
> The first patch applies each delete within its own section and keeps
> the placeholders out of the tree. The second removes deleted entries
> from the tree, so that a node defined again comes after the existing
> ones. The third clarifies some comments. The fourth lets dtc-fatal.sh
> check the error message, which the fifth uses to test an error for a
> delete in an overlay fragment which has nothing to delete there, since
> an overlay cannot delete from the base tree. The sixth documents how
> deletes behave.
>=20
> Note that the second and fifth patches change existing behaviour. The
> second changes the output of existing dts files which delete and then
> redefine a node or property. The fifth breaks the build of two overlays
> in Linux, whose deletes have never taken effect. Each patch explains
> why this seems the better behaviour.

Sorry, I didn't catch this in v1: I think this does improve behaviour,
but I don't think it's the right approach.

At the moment we handle the fragment merges right within the parser,
meaning we have a single unified tree as soon as we return from
yyparse().  That's already a bit confusing, and means behaviour isn't
quite the same between the first fragment listed and subsequent ones.

This series improves that consistency, but it does so with kind of
ad-hoc alterations which are pretty hard to keep track of.  It also
moves towards the model where later things can overwrite earlier
things, even within the same fragment, not just between fragments.
Although it is a way of making the semantics more consistent, I think
going that way makes it easier to have uncaught typos in the dt
source.

Here's the approach I think we should take instead.  I've had this in
mind for a while, but never got around to it.  Seeing this series kind
of crystalized the rationale for me.  It is more work, but I think it
will be worth it:

1. Have the parser treat each fragment / overlay separately, returning
   a forest of those pieces, rather than a single tree

  1a. We'll also want dt_from_blob() to parse dtbo /fragment@ pieces
      and convert those to a similar forest.  That can be implemented
      later on, though.

2a. For base trees, call a function from ain() which merges the forest
    into a single tree, with similar logic to what we have now.

2b. For /plugin/ trees, call a function from main() which wraps each
    parsed fragment in /frament@NN/__overlay__ and combines those
    into a single tree

3. Start splitting the checks into two sets.  One set runs *before*
   the merge on each individual fragment.  The other runs on the
   merged tree.

Under this scheme /delete/ placeholders will only exist in the
forest-of-fragments stage.  They'll either be resolved by actually
deleting the node/property in (2a), or trip an error in (2b).

This can be more gradual, but by moving things like the
duplicate_node_names checks to the pre-merge phase we can catch more
errors within fragments, without breaking either compile time or
runtime overlay semantics.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--xm2B2rc7c8X0QL8t
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmritBEACgkQzQJF27ox
2GdsgRAAjpOrRIxiswb+8DaiDTyzIES/rmUv+fu8mBq7D5Svnwvsv7egRJQzkc/K
WJHh6L+iwG+Fk/V9wK6ayxno5f4oFi2S7Eg57KkqhBYnVYpvuLPUsLKcOJC57Nok
zvPzvfpMqlz2VrUOyRV/86cDyIM+k6jLe+AVSzCBP/4y1bZaaKcUJNTxqITdzEz+
P3SFzUKZpf4LwEPTVN9dD3NTRRwfcwH7BYyYUj30sv35AFzXlIWUxFqc3YeZz1PL
AyTTRpHDUotfIUISoKVMsJfERYtvjgyvLT3YhzcW1rMdqTU2DgC/oFUB9xmfLIWq
KlKJqeIEbRDC3BFpPeAJo5o+YfEGJ38CEVBpVZOuBYTYULlJxl65Yv0VTN+oWrsK
v5Y5DtB3yfI6oascb50hY6+lwIYCcRRRG+yjdODqSmNIKVbohoqEU0A3RRhTWJ50
8NgDek+BH39yV/ycGv/s5kJUAClI06wPRhOAzaF3RNrViHEyre9DxtCG2ov29T/2
wZjUMhOlqneivElq0a1R6mtsGYIkC4KLLslTNaZsut+5tKPSyNSScqWLlgvx392y
RFsERflbLye2ap0SbSuo+HUUu0HttiJX2rGWfyfXnINv061JAv8H/1kcMH8d7dTy
FB0hCBvc69J+KIaWN1PRvQhtWm9uoINX+9+0eapLBOfXSid24TY=
=Llhb
-----END PGP SIGNATURE-----

--xm2B2rc7c8X0QL8t--
