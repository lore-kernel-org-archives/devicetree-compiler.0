Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992DB2C3256;
	Thu, 29 Jan 2026 02:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769652050; cv=none; b=RT+yzJpqVGjWbKPFgVbtflAwEAi4WNhf6bQTb87NehRznXvlL+Jo95B5Xy8OVoBMsDyQOppiH8bPA7sIuM4hBTBhqYpQwniYt3nrMGh/ZopiPsPa2IBp87fYVbSEXprzE+kELG87MLQJCWJ1jFGKpTeEBKXG9YXlrPxm4JnYVXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769652050; c=relaxed/simple;
	bh=wyJxFCIQfnKyodOiLeAsU0aw9P7EDVvWbzBEKcJfXyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lrx24bRqRBSPcI1Ex4WMJThNJqtxyvdVGx59UUVJW36LKBe96AGc/rLx0DvsFFSD2EG3LseTt68Xfdl/Apf5jWv6owUKAY4mxYBJB8HC6Pw3hJII95ho4rwbUM/jEgyVyYliBnMbodEvJbaq8CdW0BLvDwdnlwzKgGW5rveNjrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=syUm0Fyj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="syUm0Fyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1769652032;
	bh=4ugxzwbGGFzgSfDr7NjRRS/tn8RZ4p6Ky/eY27GR6NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=syUm0FyjhCqQ0/gJtiLFc5H+wQVDTd0oSyKbuJm0pfwT3/wwOSwxDtP9iHRQpniht
	 s/vhs9DEgyu9CiASaCoow2Tqoo4kNP9RCoe/Gxd7J1mVUPZcDhDZ0J+C3Ix9dPAZOG
	 f9dspRZkAN706R46KcerpRVnuw8OczR/5DX6vKmqKB/IGxoAc0J1X3mviJAacPvx8s
	 t5vXzbAmsywMwRowfeOj80tsBR8sC2JgY4yWA8DWlxP6bYiJghYFTIKyQEPxzcvwHh
	 MD3YYmS0g8PliilYBoxiogxBGaiRdBZEeRkoT+w+T0ZiJfHiF5q1uMV7Hb7aFT6/On
	 Jy8441rzbSpJw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4f1j5r2ffTz4wDm; Thu, 29 Jan 2026 13:00:32 +1100 (AEDT)
Date: Thu, 29 Jan 2026 13:00:26 +1100
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
Subject: Re: [RFC PATCH 64/77] dtc: Add support for references by path
 involving orphan nodes
Message-ID: <aXq_On_DobrGt2fO@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-65-herve.codina@bootlin.com>
 <aWiQ05zlfPfcIaZk@zatzit>
 <20260119173831.3341e827@bootlin.com>
 <aXCXAwm34LobcW1h@zatzit>
 <20260121173012.2a087367@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ccsgJZB1nDPqHMHH"
Content-Disposition: inline
In-Reply-To: <20260121173012.2a087367@bootlin.com>


--ccsgJZB1nDPqHMHH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 05:30:12PM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Wed, 21 Jan 2026 20:06:11 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 19, 2026 at 05:38:31PM +0100, Herve Codina wrote:
> > > On Thu, 15 Jan 2026 18:01:39 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Mon, Jan 12, 2026 at 03:19:54PM +0100, Herve Codina wrote: =20
> > > > > Referencing a sub-node from an orphan node using a path is needed.
> > > > >=20
> > > > > Indeed, using the following snippet:
> > > > > --- 8< ---
> > > > > /addon/;
> > > > >=20
> > > > > &node1 {
> > > > > 	subnode {
> > > > > 		foo-phandle =3D <&foo_label>;
> > > > > 	};
> > > > > };
> > > > >=20
> > > > > &node2 {
> > > > > 	foo_label: foo {
> > > > > 		prop =3D <1>;
> > > > > 	};
> > > > > };
> > > > > --- 8< ---
> > > > >=20
> > > > > Even if node2 is an orphan node, foo is a local node. foo-phandle
> > > > > references the foo node using a label.   =20
> > > >=20
> > > > Another option would be to eliminate the idea of local references, =
and
> > > > require a symbol be attached to things that you want to reference by
> > > > label. =20
> > >=20
> > > Hum, new kind of references. =20
> >=20
> > No, I'm trying to remove a type of reference: I'm suggesting using the
> > same format as for external references on local references as well.
> > That might mean things referenced need to be both exported and
> > imported by the tree creating them.  That might be worth it to reduce
> > the number of cases.
>=20
> Hum, this means a new tags.

Either I'm missing something, or I'm not explaining what I have in
mind well.  My itention here is to *reduce* the number of tags.

The proposal has two ways of adjusting a property referring to a
phandle: a) if the referenced node is within this tree fragment
(local), b) if the referenced node is external.

Clearly we need (b), but I'm wondering if there's any way we can
remove (a), using the method for (b) instead.  i.e. do local
references via label, just like external references.

Here's one possible idea: I've said elsewhere that I'm not convinced
the current proposal adequately handles the case of an addon that
requires several upstream connectors.  The obvious way of addressing
that would mean that imported / referenced symbols aren't global to
the whole addon, but instead are specific to a specified upstream
connector.  So, say each phandle fixup tag contained both a namespace
and a label.  The namespace selects which upstream connector we're
referrring to, the label says what symbol within that connector we're
referring to.

If we went with a scheme like that, we could reserve a special
namespace id to mean "this addon itself".  So, we can use the same
sort of fixup tag for both local and external references, at the cost
of having to explicitly "export" symbols/labels for the locally
referenced nodes.  So, something like

Base tree:
	...
	foo0: foobus@12345 {
		/export/ bridge =3D &foo0;
	   	/export/ intc =3D &/path/to/board/intc;
		compatible =3D "foobus";
		...
	};
	bar0: barbus@abcde {
		/export/ gpio =3D &/path/to/gpio/mux;
		compatible =3D "barbus";
		...
	};

Addon:
	/* Declare our upstream connectors */
	/requires/ foo "foobus";
	/requires/ bar "barbus";
=09
	&foo.bridge {
		local_intc: local-intc@XXX {
			interrupt-parent =3D <&foo.intc>;
			...
		};
		widget@YYY {
			compatible =3D "widget31415", "widget3000";
			interrupt-parent =3D <&LOCAL.local_intc>;
			interrupts =3D <...>;
			gpio =3D <&bar.gpio>;
		}
	}

By the time we compile to dtb, those namespace IDs could likely be
ints, rather than strings.

> local references: ok, phandle to to local node.
>=20
> external references: phandle to external node.
> This has to be resolved based on exports available in the device-tree the
> addon is applied to.
>=20
> Here, the node is not external. It is available in the addon and so it is
> a local node.
>=20
> No import/export mechanism is needed to resolve the phandle. Indeed, this
> phandle is already well defined (resolved) in the addon blob.

> Having a kind of 'local' import/export to allow local cross-tree referenc=
es
> is going to add an extra complexity where it is not needed.

Does it, though?  We already need the import/export mechanism, so what
prevents us from using it locally?

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ccsgJZB1nDPqHMHH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAml6vzkACgkQzQJF27ox
2GfMMhAAqHlEX7enr7bgiNAg34OQV+k/dkZ+STf+WxteUn+LykLGiLfnYqOgKKGi
uvFAeypWSavzS47HYpxJ+OY0ymh+uMk51JxXEgy7Gd5E6QGx4h5AayqVViryllzq
KrWmPCSmKTpzLECbYvEFAhSNA6FgyOAJKNS/wwYLxXYK50u5neJQNKdRltQwahGr
grtOkcb5sZ6ES/cC2CuF/x23f2d67IAZgRdz0L1dHitjZ8uzE4YEtOgy1YtPr2n/
O6FuwZrGk5PwFYPSb8/Am5TJbJuLGsvRHxH+Co0CGxVXXCF5x4PRJfelCjv850jn
4TJYwdDld62zl1dUOCMgCc34zRIGj6wY14qsLsqSVyH9lxmzTbN/HjG18x37Lv7q
phBMOb6MdSTwWA4ott4EOTB5Eh1cZGsB1KWUD81yH1HjF6R9nlF4WdNTodUTN7jx
AIBiFDPMbh0uwCyLljMKSxb4OGzjLAbGCmyyTcS4cmeFogqjUO2pyGfVcatgqXg1
v+/nYex+gj3yVkjHMhu9xAgjFjsuY7WQpiCFb20tGKtxWR3ztU5s00nHV+6R5sva
ty1A9SrgmLrEqEtKK15tEpIUfPtSkj4ioY2gYmEbx99tlsqj1xK6AcstePIJd6Fd
JP1R0O6wIuZxPnxzN++aGo2ZmQzIBnlTuZlX6jLicr0aEdPL/5o=
=HDzn
-----END PGP SIGNATURE-----

--ccsgJZB1nDPqHMHH--
