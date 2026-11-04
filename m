Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785683;
	b=IeeUYe0kbv9eeYB0At2nncw+nljnspsbSJjHR266DargEaF366RTg2Wu3NdrQAHs6Pub
	 mYWrpF8ePo2l2oSoQDgu+HHO3FyDXhUrG7MEYivQQ1/uNGi/Voa8112qJVgb5ro+a4mJR
	 3E9ou2CnQrERvlZM4djJcQltolgMciI/CezjkZqjaq7SfT81aqvt+2MpKbSn0YhYqanJl
	 e6bwAfcnngxUtvnuq9sR0q/C/Ruu0WVmlWqSOsaqK51vVTWxt7xPOpb7JwBeW8cTS8tWx
	 FCHWi+sbpt0BEouyOIHCSEGBiRkPio9ksvNwGfV62XnIx/dyOEQ3nmiziz8ld7cP4Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785683;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=mk7GHTPUboEC/W4gtNophlEwIxuNMzTAB8tXSbkrbuk=;
	b=LrAw9n/3FOV4v8ARXehZgDcovRIJNmwD/JgINTU9V8G2rXxmG5JtLOeNxHkuBnE5Ey9L
	 1uaDwhetprnkWjrpAmWaSU0Ud8HW/gNcMKpV/zEBpxZZ+zbhihJKV8h8UJtpF9YQDr+pS
	 Y/LuwvsJEvAfZDNdQCi93MeLexD+msVIg9m9LaNtCB2qrIKa0NJX0r9u8UL4ma0GkN2uA
	 wETPwuYk9WxHSDS0lxx6ZdwmW+4g7oV9ncK3Kc/fXI+XSrihAdDc8u+Ap5weqcor1MTNs
	 vlAomozU25hs5op9OSBWAgADHOcsU5gHfVqf/sq3MsncXQABJPwvEXZWXExZnDnzUvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873D2606A32E
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 09:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 873D2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793785672;
	bh=mk7GHTPUboEC/W4gtNophlEwIxuNMzTAB8tXSbkrbuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFDCBqskX4DqpQxunW8gOYvTsHkFRJmOgMy+iOiRkm5HSGmc/rBz2dPw5tmwL2tRq
	 c5f2KA2S0giG1zmr4mRPzOGwpwYYZ/VjfrNFQ+xGfDHIlKELroTzlzd4CPJW3+UPsH
	 +AoyshU+aWKjuwECp25aMuLIBCI0nCelCS45aSTxARGy9AFDZlZdSGcsm/Z56+JcNO
	 JqmVlzs1B2cStvRfnGug9cMYx3WOLzEzDHq9MxCQGhveO5F72wyUJnNM9u6UluIKYq
	 7JcIlupAWbnh0bf3uUYjjyMYhF5CbavltaTcQq/9W2K/D+2PYdRjvN6FNRsiYus8BG
	 Tx/Jp0rEWVksw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jKLGJ6j8Xz4w1b; Wed, 04 Nov 2026 20:47:52 +1100 (AEDT)
Date: Wed, 4 Nov 2026 20:21:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] dtc: Fix deletes within a section and before a
 redefinition
Message-ID: <aur5HLooljt7D__i@gractus.seuss>
References: <20261028093620.3705074-1-sjg@chromium.org>
 <auK0ERvxGCJGSc3p@gractus.seuss>
 <CAFLszTjtkEjBMhbKomVr6WhrZH7hN3AcAMBwN2mvdmf+T-DQdw@mail.gmail.com>
 <aufqF92dKRRdb3V3@gractus.seuss>
 <20261103140030.3aa7b134@bootlin.com>
 <aurKRLcMjjFA70CM@gractus.seuss>
 <20261104094834.5aaf1b17@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="EKKxE8e4fbJAdVSy"
Content-Disposition: inline
In-Reply-To: <20261104094834.5aaf1b17@bootlin.com>

--EKKxE8e4fbJAdVSy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 09:48:34AM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Wed, 4 Nov 2026 17:01:55 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Tue, Nov 03, 2026 at 02:00:30PM +0100, Herve Codina wrote:
> > > Hi Simon, David,
> > >=20
> > > On Mon, 2 Nov 2026 12:41:24 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >=20
> > > ...
> > >  =20
> > > >=20
> > > > Yes, that was my intention, though we can revisit it if that breakgs
> > > > things for people in practice.  This was the way it was before
> > > > source-level overlays were implemented, and still is for the "base"
> > > > tree fragment in a file.
> > > >  =20
> > > > > In an overlay, a top-level /delete-node/ &label can remove a node=
 from
> > > > > another fragment of the same overlay, as Herv=E9 pointed out. I a=
ssume
> > > > > that should keep working, with only deletes of something in the b=
ase
> > > > > tree being an error. Is that right?   =20
> > > >=20
> > > > Uh.. yes.  In a sense this is a question of whether we try to
> > > > partially resolve the overlays in a /plugin/ dts or not.  i.e. Do we
> > > > attempt to merge those fragments we can, or do we translate every
> > > > fragment directly into the dtbo to be resolved at runtime.  I'm not
> > > > sure there's a clear correct answer here, so I'd err on the side of
> > > > maintaining existing behaviour.
> > > >  =20
> > >=20
> > > David, I don't see you point here.
> > >=20
> > > IMHO, /delete-node/ and /delete-property/ keywords present in a dts
> > > apply to the generated dtb.
> > >=20
> > > A dts with /delete-*/ will generate a dtb with related node/property
> > > deleted.
> > >=20
> > > A dtso with /delete-*/ will generate a dtbo with related node/property
> > > deleted.
> > >=20
> > > David, I don't see why resolution is (or should be) involved here. =
=20
> >=20
> > So the restructure I'm now suggesting here means that processing those
> > deletes doesn't happen during the parse, but as an explicit later
> > step.  For dtb output, that must result in a single tree.  For dtbo
> > output although we may be able to merge some parts, we don't expect to
> > be able to fully resolve them.
>=20
> Yes.
>=20
> > Given that, and ignoring deletes for now, the merge step could be
> > entirely skipped for dtbo output: just emit each dts fragment as a
> > dtbo fragment and let them be resolved at runtime, regardless of
> > whether they modify things from a base tree or from earlier fragment.
>=20
> IHMO, having possible merges done is better but well, we can have
> unmerged fragments.

Yes, I tend to agree, but it's a choice we should make consciously.

> > However, once we consider deletes we need an intermediate
> > representation of "a delete" within a fragment.  But that can't be
> > encoded into dbto format.  So, deletes in a /plugin/ dts require that
> > we attempt to resolve the fragment merge (as much as we can), rather
> > than leaving it all to runtime.
> >=20
>=20
> Ok.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--EKKxE8e4fbJAdVSy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrq+RwACgkQzQJF27ox
2GeiERAAkfw8/+hhKd+WRbIK8EQfRCMcwcEd53pFt8xAPKVxN7lyR9EVsO3V6QB4
NQjf8qFkp5qNRWQkfnjze+m6MIbAIgAQ60ZSv+MoJlf7G4XZ2plB4hJsvgaPt97r
XCKMXYSdk4Q10t/HOgfM3EeUXvmq9ZjlMC8mhL0mUmQahWt/96105QMBM6Lj44Dt
Y9W1IMqClpCwuPxRCnqEY1ZiMdgvs074B/wMS5xcNgPcD0+G+mXszx0r0JuYBU5Q
E08miXm2HvS/aoQb01vk73gFLGb9XNSllGkztLUaTfCmBJatnOm9bEJYqj+CCBvg
UDaNL30Eg33CrTHX81O2XtxXxEtuKJuBxuhZUhlN5sHmE4AHHzwBcnGFyOOQxLWr
1ywqngKGlKMEUuh9Ql3kMtHDhJdqvLg8DESqgOG4Y2QG5RUlXwWe/VmrwMSaXWyC
X35uI31SR8gzCwonvRRmEKkZeqTsZ1pQows84xLWA/+CQI6ipzhCsfS22CMLNpmo
+kPkohehuHIAK9PixzAA0hI/pfi5d0vMnsWmyQstMlZlRpR9y1DVRal33RHs+9yn
2EIT7WouRRFpINgq6OPCh83h6tig7TW+ADt6I6Nw43gTWDY0G125/vfREi1M1h1w
udJmF8LLPDsRuLeKD+1Rf0+SNFIVS1bPdtmKD0sK9xmYOuadIVI=
=q/2O
-----END PGP SIGNATURE-----

--EKKxE8e4fbJAdVSy--
