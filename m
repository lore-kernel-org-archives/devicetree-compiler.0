Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C168F6D
	for <devicetree-compiler@vger.kernel.org>; Tue,  6 Aug 2024 02:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722911469; cv=none; b=rsGGwFYb+CWlVvssbWI6hzf9PA3e4BNeS9Pf/R6qof8QEFMkfc7miMn0kwHL3GabqcGbTUqGBxcfLevMvW54K+JSUZuWkBvD6mFZOEvKUdkOVb3AnEiwR30CmDgRlrMt+pj4yijHrqtd3m/FpFv4IRVH6BqgTgtiAsRPR/+qmxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722911469; c=relaxed/simple;
	bh=RUfNc0mt2lvCNCWkl51CaJ7DdkhJwpxFv88d48boefs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khj7aROW1mwqLaPCvUDBCleBrv0G+e23DtJ1G8OF9HcHB7A4T310WjuIPtLe0Cj6H1Rey0xop58DR2WIQzsJ6WxmJ4cGn2Qo4Btvk8CBEQ+vwrObGosKkjJmzKpI7xkNN20q6Y6/uDj3N3wHf56Rge4aHkrkvfvVhVXl0P4zsD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=kx6es7AX reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="kx6es7AX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1722911465;
	bh=UQtl5Py5gF6OVUBmMjdNLITaHGfZBQBSIY/GKanIBPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kx6es7AXuaqJas/+se5fY2a7mD416J1QILU1wO12HjTmnCJiFN+5eSFDFaPbSoVkf
	 uTxYB8IAWrcAIvU4xzWfe3ih92wMnuMuN4isNZKYlyZE+4XgGqh832mMMh/gvbjLgd
	 xcv+Odwbp3ABhZHucYF2hFl/sHGWIASQk6LHS8nx8110wDyPF8I+mIgamJ/EaW2NhO
	 vB/Ec6DpbO0naCHyw4ozBgoLAwLiu3g67QT+mKXcQHa/Dzqg+proJA6yb29zb7PlRL
	 195LqyYtZqvoUs4Xx6X7QCM0xxDFuicAT+d16qeCNTFMis0hxSw+3vbKXsSVYmhvww
	 AKOobj3/yJbng==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WdHNn0vbGz4wbp; Tue,  6 Aug 2024 12:31:05 +1000 (AEST)
Date: Tue, 6 Aug 2024 12:19:38 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Hoover, Erich (Orion)" <erich.hoover@arcfield.com>
Cc: "devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Subject: Re: Array manipulation revisit
Message-ID: <ZrGIOi9eTBKsf_I1@zatzit.fritz.box>
References: <BN2P110MB1058FB69969C91282858C8ECF5B3A@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
 <Zq3QIVrmUTTc4gjC@zatzit>
 <BN2P110MB105818EC9B379BD63B261E20F5BEA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RA3+g2Kz9MmEwZrN"
Content-Disposition: inline
In-Reply-To: <BN2P110MB105818EC9B379BD63B261E20F5BEA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>


--RA3+g2Kz9MmEwZrN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2024 at 04:35:14PM +0000, Hoover, Erich (Orion) wrote:
> > From:=A0David Gibson
> > Sent:=A0Saturday, August 3, 2024 12:37 AM
> > ...
> > dtb overlays are kind of a hack layered on top of dtb, and don't have a=
 way to represent things at a granularity less than a whole property (excep=
t for special handling of phandles).
>=20
> I'm going to say that they seem to be a _very_ useful hack.

I won't disagree.

> > Introducing new syntax to dts always requires care to not break compati=
bility, but that's really the least of the problems here.  To implement thi=
s you'd need to invent a way of encoding partial property updates into dtb,=
 which would be an incompatible extension.  It would need to cover ways of =
describing the part of the property to be replaced more complex than fixed =
byte offsets to handle the string list case here.
>=20
> Maybe I'm being naive, but I think that this syntax could be very simple.=
  It looks to me like the current implementation disallows properties with =
brackets in the name, so I would propose taking advantage of that to create=
 an invalid property name:
>     PROPERTY[S*INDEX] =3D /bits/ BITS VALUE;
> where S (single byte element size) is one of 1,2,4,8 or s (string array).=
  I could see "S*" being filled in automatically from the RHS data type (bu=
t override-able if you need to do something special).  So, in our string ar=
ray case that means:
>     PROPERTY[INDEX] =3D "string";
> becomes a property named "PROPERTY[s*INDEX]" with the value "string" when=
 stored in the dtbo.

Eh, maybe, but as I say that's the least of the problems.

> > It would need to cover ways of describing the part of the property to b=
e replaced more complex than fixed byte offsets to handle the string list c=
ase here.
>=20
> It seems like string arrays are the only complicated case,

Not really.  Mixed properties that have both integers and strings in
them get even worse.  Those aren't common, but they exist.  Or
properties that have a mixture of integer sizes - that's much more
common, since it can include 'reg', 'ranges' and 'interrupts'.

> and by
> knowing that it's a string array (like with the above "s" size byte)
> the implementation can count NULL bytes to find the correct element
> to replace.
>=20
> > Finally you'd need to update libfdt (and any other overlay implementati=
on out there) to process this new fixup information.
> >=20
> > So, yeah, it's not going to happen.
>=20
> Maybe I'm missing something, but if we're adding the information to
> the property name in a way that's currently invalid then does that
> solve this problem?

Ah, so you're suggesting putting those annotations in the property
name itself inside the dtbo.  That's not a bad idea as encodings go.

> For older utilities, or ones without the
> handling for this extra information, the utility generates an error
> or just adds a strangely named property that gets ignored (when I
> gave this a quick try by hex editing a DTBO, the kernel happily gave
> me a "gpio-line-names[s*148]").

Right, but then you silently get output that wasn't what you expected
which can be nasty to debug.

> > However.  If you're able to have an actual program on the target
> > processing things, rather than just applying an overlay, then
> > there are more options.  You can then do whatever logic you need
> > in your program, using libfdt to read update the dtb.  I'm open to
> > adding additional helper functions if they're useful for things
> > here.
>=20
> For my case I am already using dtmerge on the target to produce the
> final dtb, so I can easily add a hack to dtmerge to manage this
> process.  That said, I'd like to avoid making something "completely"
> non-standard.  My preference would be to implement the feature in
> the official tools (in a way that's acceptable to the broader
> community) and then hack our tools to work with the same thing.
>=20
> > Aside: you could argue that using a huge list of strings like this
> > is a poor design choice in the gpio binding, instead of, say,
> > having each gpio line as a different subnode using 'reg' to index
> > them explicitly.  But, spec design tradeoffs are always tricky,
> > and we're pretty much stuck with it now, anyway.  ...
>=20
> Yeah, I understand why they did it the way they did - but it
> definitely makes this particular task harder.  Some of our systems
> are incredibly storage-constrained,

Well, that raises another issue: this would add a substantial amount
of code to libfdt, which is supposed to be runnable in very
constrained environments.

> otherwise I would just throw the
> device tree headers and a compiler on the system and use a #define
> for each pin.
>=20
> Best,
> Erich E. Hoover, Ph.D.
> erich.hoover@arcfield.com

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--RA3+g2Kz9MmEwZrN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmaxiCsACgkQzQJF27ox
2Gfm8hAAmMlbOnCWizU//6UNAvtlVDAhPZiWyF7w3rPy3BX1iktvqJ1t7NX8NNuf
0nk7OIhIILNfOdzn+dTuQknaAL5HfoUOhc9tQ7t0NzFNV3EBVgot0v5dQA0T+gYt
mmPX6fP72nKBfIZJLNfDBU3FmbbHlUrqsVFSbuoQcAEbrF6l1Bg801FNNfSKWs4d
2bkxcUDiB9cD5joR+VMaCQUM3vXetpBLtlxEkLcv7jjgTdTXJ+xph/cxpmnAr+W0
CrxFp5Z0JrlUYlhtS8bQzmlwD3rErqh+6NMg6pfIP9tR8noLfNwDBHoXYito3TU9
sO7iZNAxO2iMCIbDH+JuWfPG6t3dCDZ3VHRyg9V8SoxBdq7/AJxaU8FzR1XmCakk
WeH5DQvVJejba1ZcRjWfcqNxHue+WMfWyRotPCDW3T44ZdXM/oFYk+nELX93jKDK
y9INeCSghYyEHX2qPppLnNCYL9skavP9AnJSNhLJLz1c/J4CYfqpz9ok1gwHkSxx
oLqyFE+iZFcpluekyLN/gPjJTzhoB6SgK6NlvbfY1nJoR4+50E8L0ktXqITRQTGr
uxR0JFFVRc2vCRPD6tdaufmEmQCiOMmSNNzJ7mmtmhlSPl65LL0y6x1TDnNugztZ
paHiqbBXqDWfUOxEzDCUtmxyUFtA1q7L9vzpAw556YhXGjeMy3o=
=l8X5
-----END PGP SIGNATURE-----

--RA3+g2Kz9MmEwZrN--
