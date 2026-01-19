Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA5327FD48;
	Mon, 19 Jan 2026 05:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768799937; cv=none; b=Xh9ppoj3dCVAs4Rm5D7j8G6myzUgyVdqIiqy9dRMK+we9QdxP+oPex2garC5/Q43EJuU8tT0gFOjX6yjbkrAaVpgf7Ed6z7lx/FD0PpPoTpqudip0KL8osBhZOWWZNE8tHup9hCWnY6/U1Sy0jqUrF82ncuSxiLSjLgOnYpVh5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768799937; c=relaxed/simple;
	bh=8skFBCxhnyWeb17gywywvs3qs+nNQAGZPAZ4ARMNVVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4Dn1vE8JSIMeQxzphG4+02LUWhmFog4YF+Tt4iVCYhohajZZiH31zbcyC9EWuRJLPgLyRYYhMIBkc/efgMNcExB2ES4nkWdl9PJTmwXolrd5zRfD4v1AV9BEcU0CWVOprvbINSQN+JC8JzLF1vskeEDMD9hIRgdsgwMj5D8AaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Ha0onx1W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Ha0onx1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768799927;
	bh=JpgKaoh+5pF44ToyjDyGiMrEp7XRy3+h+YqUqn9PfeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ha0onx1WCEFROBgFFR/goOIzy4ZviatZpQq8B67v1cevXO4yS4mqEp99nR5in72jU
	 yFpJoEQU8zHudAPssqRgyYNOYFAjablL9/oywN9rnpmgaTZ4SdGhSeuzjL9YwnXosn
	 l3TbCJCEi22JICFW+ImzDXYwz1sb328fN9PcV54tqVzQSWCBynT+E0ACMdvgnRpmNa
	 TObUlavkz8bEKjJxBzPSyT4pUWiAOR20xr7sT7B5U5SweSQlguNtN35T4QQo5zU5aT
	 qMX0oEPGRtVvkK06oVECq5CKqJVSz0WOXMf7AUCN5mfZ2d65xNElDK2qPoSJMgYO/R
	 OrsZwGm6nTRgw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dvdzC0tHYz4w23; Mon, 19 Jan 2026 16:18:47 +1100 (AEDT)
Date: Mon, 19 Jan 2026 16:18:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 07/77] livetree: Improve get_node_by_phandle()
Message-ID: <aW2-sxR3XwWJn3H9@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-8-herve.codina@bootlin.com>
 <aWg3vOBK4uKwyRp4@zatzit>
 <20260116115254.3002ca05@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+P9QTFgzSE1gAhEN"
Content-Disposition: inline
In-Reply-To: <20260116115254.3002ca05@bootlin.com>


--+P9QTFgzSE1gAhEN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 11:52:54AM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 15 Jan 2026 11:41:32 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:18:57PM +0100, Herve Codina wrote:
> > > get_node_by_phandle() allows to get a node based on its phandle value.
> > > It checks the phandle value against value available in internal node
> > > structure.
> > >=20
> > > This internal phandle value is updated during process_check() and so,
> > > get_node_by_phandle() cannot give correct results before the
> > > process_check() call.
> > >=20
> > > Improve get_node_by_phandle() to look at node phandle properties when
> > > the internal phandle value is not valid.
> > >=20
> > > This allows to return a correct matching node even if process_check()
> > > was not called yet.
> > >=20
> > > With the recently introduced FDT_REF_LOCAL dtb tag, this will be need=
ed
> > > to update internal phandle references before the call to process_chec=
k().
> > > Indeed, this tag allows to identify phandles and internal references
> > > need to be updated based on the phandle value before the
> > > process_check() call. =20
> >=20
> > Having two entirely different paths for get_node_by_phandle() is
> > really ugly.
> >=20
> > I suspect a better approach would be to special case updates to the
> > internal phandle field as we parse the phandle properties, rather than
> > doing it as a batch during the checks.
>=20
> Doing that when we parse the property will be quite complex. Indeed,
> when we parse a dts, the node internal object is not yet created when
> the property is parsed.

Ah, good point.

> What I think could be done is to set the phandle field just after the
> parsing of input (dts or dtb). In current implementation this is done by
> process_check() when fixup_phandle_references() is called.

Oof.  So, on the one hand, doing this indexing in the "checks" is kind
of weird - I implemented it that way because it just seemed a
convenient place that already scanned the full tree and had mechanisms
for dependencies between different steps.

However... these dependencies are a bit subtle.  Part of the trick
here is that the indexing has dependencies on the really basic checks
that we don't have invalid or duplicate node/property names.  If we
moved the phandle indexing before that, we'd have to explicitly deal
with the possibility of multiple "phandle" properties and other
weirdness.

Maybe we want to split the "checks" into two different phases.  One
for "structural" checks, which check the basic required properties:
characters in names, no duplicate names, no duplicate phandles.  That
phase could also handle fixups and indexing that aren't really checks.

A later phase could do the semantic checks (does the interrupts tree
make sense etc.).   We could do processing between those two phases if
it makes sense to do so.

> This fixup_phandle_references() call should be removed from process_check=
()
> and called right after the input parsing.
>=20
> I you are ok with that, I can propose something in the next iteration.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--+P9QTFgzSE1gAhEN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmltvrIACgkQzQJF27ox
2GfvBQ//enesRThOluBC0PDsvoCBildMcS/KotxTea3b1bmrTQVn/9BfNGT8dvyO
CjetPFyzESwrHGHlyyOTEi9Vq2UFuFtksl2QO+d0MZmEwhXyFUAxiC1seIAUb7lY
6CozBIyNMBWur/vZQajCXbmc+BBiC8tD2HUF5sYyCIraKyiCR6u3it1EACvB6/21
jzFLBLJ/sDIdQ9JKctEqkcg3F2A8iHWCfdrn83QAYG1iFzLgbBbBBlaFs4kJdPnI
yM5VeX9GplXIgdPwTmHScTQg4mClG7iS92YLFmPysZcDZ1b+RVo+A0NLjAY+r4sA
u4pwLR/QWgXEUpj3Z0bsaHTmUam2aq8x1GHYDWrjhqJhdf8Ndk/J0y0Bfa3tEnDb
FV5D9RcyWSDQNgwh0AS2jvDMQxE6QrCjxsm1rOmlLQN53crDWAD8t27KjgOSkSrD
aQbyKRgv+e96gsJcsMAse3P2QExM46GX2Wicb4fYF4qoHyj1+qCNihv6j22TL0/G
nRqUwHci58EhMDwvyXXXayvXX6cpGfibJw7Z9cDUnzUIHw/9MKK6zXgz6XRyWWeE
r6CZnynW9YhLPRD5SDkmYH7KAQl3qsM4NviaG/vYd5n1hOWxM1HrXg9vJsc8th0Y
hfeGrK7/ewULWC/H32aKvwxIT1exRCm7ronJeFy5nO6iyZq3TQs=
=8MhP
-----END PGP SIGNATURE-----

--+P9QTFgzSE1gAhEN--
