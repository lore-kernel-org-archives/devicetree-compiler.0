Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793331978;
	b=eUZlnFxTzkt0mn+MFR01LluMb2FQBFVfderwbQRudPq7xWxEcdXg+n/JlhTc+gjiP01N
	 WVqHg5dtDYjA5AQ63p9ge/9b15Uk5BH910/IhOE/Vl0ZcoU22iWHl57VtDQ4/yjkxsE7H
	 U9LdwQvEgOYSJ/2BQ+DQrSr/ulGNFZ42rArBqtA8ciq+9LU88bscvvcgF3E4w3na+hzsD
	 ADg+es5EvSBj06Vx/uCI6IBKFOJ71YOUpqLTe/dIOX7aGW34iR+yOaBtjPhuxmXNrwl3g
	 zXjw7TeR4fLTBI1b8ahJShnZjs2pR1l2wEuxzrs8J7poS4jBPRHCHfCKCzgjfZZRUHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793331978;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=5WW4w58xCY8f2B5edXLKd0rnXXVgway6Enz2FKtercs=;
	b=jesScr/bo4gpLtlALvK6939D8PXuiKMdL8j3aMYs1TcHf/qfvzGVNAXJuzU8XLgXm6LM
	 x9g8praj7bfevqO3lUrmt0mlEquWDJ8cwTiH0xWt3rMHjFXCM61kEfAOzN4TewDtcsTWp
	 LKbdP00giwq8MH9cM99IEghhkdlhOFQO6//gBpHDl5PsSdyo+T8psVCSP/LklMt73+2Y5
	 A6zGvymIlkEHP+5MyQbK1mnGQZUw0yA9s6hOsOjrhvSG9xuydqaeVUoqt+sfWAWsLkHIT
	 EG7nezHLRQ+WOS8YkIru+5lRTEu9Ke0vYg4YfZBLw6RoBM1DbJXvnQRy9SyjBfy4tMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=l1y1dzrR;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A972606A31A
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 03:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A972606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=l1y1dzrR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793331975;
	bh=5WW4w58xCY8f2B5edXLKd0rnXXVgway6Enz2FKtercs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1y1dzrRcUu9NJiFwpICb+5BNs0lvEiSPRS80slFcmALJZ3+Z1T769OY7grJWzhs0
	 UF5rJxLTQeSj3yA9vZ3n3WgCNRxDnU/I0HST2PwECwioxkuGj2F9RhUtcXyBB15F0Y
	 AEKS4PTG2GH87ndsjM2qYNMGfJQfJ3PQ/NTjTPwv49CN5/Uh0SAc+tiBJztZbYvp6Z
	 veqb2Ques4fOVvSFCx83RKyoiaRK4M9tSYi7y2+/upG3OFj42136YZQ12j649sakPt
	 Nv1GgrMFwaFLjJS7tNTaBRm4kYYcPm/ob/rMvMOy72p4pgvJcJlDTd2LjTQQvLRrnj
	 uBr7h2/Pc35Pw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jG6TM6nDsz4x7G; Fri, 30 Oct 2026 14:46:15 +1100 (AEDT)
Date: Fri, 30 Oct 2026 14:46:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] dtc: Report an error for a delete in an overlay
 fragment
Message-ID: <auQTAKdl_C0_svJ0@gractus.seuss>
References: <20261028093620.3705074-1-sjg@chromium.org>
 <20261028093620.3705074-6-sjg@chromium.org>
 <20261028191709.0a304dd8@bootlin.com>
 <CAFLszTjMdK1PfBAcQ0Lz-oxLCxxVntKBsaNPXZ31A2_9sNHGPg@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="3y1c5xzpyMwxCrLT"
Content-Disposition: inline
In-Reply-To: <CAFLszTjMdK1PfBAcQ0Lz-oxLCxxVntKBsaNPXZ31A2_9sNHGPg@mail.gmail.com>

--3y1c5xzpyMwxCrLT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 09:04:41AM +0000, Simon Glass wrote:
> Hi Herve,
>=20
> On Wed, 28 Oct 2026 at 18:17, Herve Codina <herve.codina@bootlin.com> wro=
te:
> >
> > Hi Simon,
> >
> > On Wed, 28 Oct 2026 03:36:12 -0600
> > Simon Glass <sjg@chromium.org> wrote:
> >
> > > An overlay cannot encode a /delete-property/ or /delete-node/, since
> > > applying an overlay only adds or updates nodes and properties. So a
> > > delete in an overlay fragment has no effect on the base tree, yet dtc
> > > drops it without complaint, which suggests that it works. A delete wh=
ich
> > > removes something earlier in the same fragment is fine, since the
> > > fragment is compiled without it.
> > >
> > > Report an error for a /delete-property/ or /delete-node/ in a fragment
> > > which does not delete anything within the fragment, naming it. Record=
 in
> > > apply_deletes() which placeholders delete something, and add
> > > find_unapplied_delete() to look for one which does not. Do this for e=
ach
> > > of the three ways in which a plugin creates a fragment.
> > >
> > > Drop the deletes with nothing to delete from the overlay test, and add
> > > tests which check for the error, one for each way of creating a
> > > fragment.
> > >
> > > Note: This breaks the build of two overlays in Linux v7.3-rc7, whose
> > > deletes have never taken effect:
> > >
> > >    imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> > >    imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
> > >
> > > Linux needs to remove these deletes. Where the result matters, the ba=
se
> > > dts must change instead, e.g. by moving the property or node to the
> > > boards which need it, so that the overlay only adds to the tree.
> > >
> > > Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> > > Assisted-by: Claude:claude-opus-5-5
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > ---
> > >
> >
> > /delete-node/ &label;
> >
> > We can probably delete a node defined in the overlay but in an other
> > fragment.
> >
> > Is than handled ?
>=20
> Yes - I tried this with a plugin containing:
>=20
> &target1 {
>    node: node1 {
>       prop =3D <1>;
>    };
>    keep {
>    };
> };
>=20
> /delete-node/ &node;
>=20
> With both master and my series, node1 is removed from fragment@0 and
> there is no error. A top-level /delete-node/ &label is not inside a
> fragment, so the new check does not see it. The same goes for &node {
> /delete-property/ prop; } since dtc merges that into the overlay's own
> node1 rather than making a new fragment.

So, it looks to me like this is another odd inconsistency.  The parser
rule:
	devicetree DT_LABEL_REF nodedef

Always calls merge_nodes() if it can resolve the fragment target, even
for a /plugin/ and only calls add_orphan_node() if it can't resolve
the target _and_ we're compiling a /plugin/.

However the rule
	devicetree DT_PATH_REF nodedef

Always calls add_orphan_node() for a /plugin/, without checking if it
can resolve the target first.

I'm not immediately sure how much of that behaviour we'll have to
maintain for compatibility, but I think delaying the merges as I
suggested will at least make it clearer where and how that happens, so
we can design clear semantics about it.

> As mentioned before I'm dropping all of this for v3, but the case
> needs to keep working when the overlay error comes back, so let's keep
> it in mind.
>=20
> Regards,
> Simon
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--3y1c5xzpyMwxCrLT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrkEwAACgkQzQJF27ox
2GdsExAAoKvyNSN/1U6/OmKozCuIBK9cUTsti+XhpEWPAABmz3A7BvjynBfc+nhu
unZYKAi9A335doKWMUr0Bg4gNjOaRdY3jf3BiOBS/0y34dD8tADKZe9VBR3albvm
2Ygo39sOhWGGEYbSIWIyQa2Q++y2d1qkGR0nUbvufCC+FuGMp39RwHUbJvHPHRDv
vBHIP9ehFeJ2610HjwItADQCkZnrd0rBY/KVhQ4K7/kZSIK6CLLDz07Gk++q8yvp
j6ci5o7epq31Yz4+Ybi7DWLNeFwyT/zwIDxNEDLBZlhaITQSj6xFFJx7CJ2EXhBz
/SSP4VREx0H+/p8MnUKr7dzsW1rhJuPLZ/0N/VnK/tYmgDahm6dr8NFxGpNIPCSe
QUTl02qPQbd1RzQqJHn0meUfB5JasmYgZwWZlOgBEAhAIg7dSRpjMWWlq9VxDNeU
EHr0GqYrpvRnD5MwdvjAVLPlWcEwwylnOogrkpwuBna7L9yweTyWCLl+keuxCuP4
vXlA9OWaIAH0FGsaWPXtg89RH9wB4EixJeKaGHTTSJO4yfp/pXfDIh0l4+zImdk/
28sJ1bYezoYvVHbpyXEBPwws3fN7DIFVbrb5eAe23DWwUOd4b98oPGylmuQBz3Mf
uSHjCCQEQ4m7QtixyKnkUm1+ye6T5eUTlgw1c9kqLYhuLdifzfA=
=mZka
-----END PGP SIGNATURE-----

--3y1c5xzpyMwxCrLT--
