Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5E41AAE28;
	Mon, 19 Jan 2026 05:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768801901; cv=none; b=fZ6rTnC648nQ/bM3vtzletzMNsv5HFvpY/UPu1QgnkOFooEspc51EvvJfJUxKZa0qVYGnUXgeIAcwCDCfJPeLcmTAdPaEmgkAo14GbzyUezS38HdEFxMjAw1Ssj1vf99MlmuAOkBnjKoxFF8BBgMPopqTc1uv+/zFk6j5QpPitY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768801901; c=relaxed/simple;
	bh=wnvUVzPu9v4y8VN4wmV9J60CmwVh1C/Z4RNHC4rALdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8cWFGDN/gIDODNkWWdQHxyQWYgtheBd+UUmdd/zFeyFNOB6i1fNElbUWT63vhxtIDRWWp7nvt1iuFnsONjfKqZs40lShpFRRShXRBrYJbrP84hq3ng48v7K0n0fE5gbX/zrazdnvZc7Eg4W83wQOw6+t++5QtA1+wzwuDQWBKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=bWTE4gkL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="bWTE4gkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768801898;
	bh=TJRDolFEcTzxKf4zpepxQOCVZuXHWZxja5krdFYMmCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWTE4gkLSxJIUqopGqw1jslkRDdshsIZr0Hr2OqjUYKyeQPBqfz6+qpC7XvhNzqK9
	 MxNDGgY7M8nMrdV/91FxCmj7httx01Min+4SotUzbNjOL+6dsCyBunzxHirr8tvqgL
	 dAHAX5UzA+cTUYRIvzIpjI0SxWxR4x2IaBe8eirCEROgCL23pIJKMQ6r9ofN5WUqU1
	 2AJ25ZoCHYHR9WKerGQSwrP1ZK70YnwNE5AWmEgj1mw9gCHiRWt9Ayw++do2BUjMd7
	 b5u8s4Koq+QxrqkSmiSsAkU0RJVw39JO8gR3XwofhlXaPjo1/XebVjSIf4ovDjmT4z
	 fB6CkRHseuJhA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dvfj615yQz4wCJ; Mon, 19 Jan 2026 16:51:38 +1100 (AEDT)
Date: Mon, 19 Jan 2026 16:46:37 +1100
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
Subject: Re: [RFC PATCH 09/77] dtc: Introduce mark_local_phandles()
Message-ID: <aW3FPbd7Dw0Rdqtc@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-10-herve.codina@bootlin.com>
 <aWg5bD4zWYAQOYai@zatzit>
 <20260116140912.3d18ae39@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uuWLrCl/xHRRX4mh"
Content-Disposition: inline
In-Reply-To: <20260116140912.3d18ae39@bootlin.com>


--uuWLrCl/xHRRX4mh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 02:09:12PM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 15 Jan 2026 11:48:44 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:18:59PM +0100, Herve Codina wrote:
> > > In order to have the new FDT_REF_LOCAL tag present in a dtb, the phan=
dle
> > > reference needs to be identify as a local reference.
> > >=20
> > > This is the purpose of mark_local_phandles().
> > >=20
> > > It identifies a phandle reference as a local reference when this
> > > reference points to a local node.
> > >=20
> > > With that node, the related FDT_REF_LOCAL tag is set in the dtb. =20
> >=20
> > I dislike caching redundant information (whether the ref is local) -
> > it's an opportunity for them to get out of sync and cause bugs.  Is
> > there a strong case that you can't just determine whether it's local
> > only when you actually go to use it?
>=20
> Well, I can't find any strong case.
>=20
> I would like to avoid passing the full dti (struct dt_info) to flatten_tr=
ee()
> in order to determine if the ref is local or not to set a FDT_REF_LOCAL or
> a FDT_REF_PHANDLE tag.
>=20
> Also, this flag, set when a FDT_REF_LOCAL tag is parsed from a dtb, is
> useful later when the ref has to be found based on the phandle value.
>=20
> Indeed, because the is_local flag is set, the phandle value available in =
the
> property *must* reference an existing node in the dtb.
>=20
> In other word, in update_phandles_ref_internal(),

Hmm, I see.  As with the "known phandle, unknown ref" vs. "known ref,
unknown phandle" cases, I think this might be clearer with different
marker types.  During parse we make everything "known ref, unknown
phandle", then later change to either "known ref, resolved to local
phandle" or "known ref, needs external resolution" markers.



> --- 8< ---
> 	if (m->is_local) {
> 		phandle =3D propval_cell_n(prop,
> 					 m->offset / sizeof(cell_t));
> 		refnode =3D dti_get_node_by_phandle(dti, phandle);
> 		if (!refnode)
> 			die("Node not found for phandle 0x%"PRIx32"\n", phandle);
>=20
> 		m->ref =3D refnode->fullpath;
> 		continue;
> 	} else {
> 		...
> --- 8< ---
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--uuWLrCl/xHRRX4mh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmltxTwACgkQzQJF27ox
2GeVMBAAqCS6qA2lZxZQ7nHvt4qS1Yc75KlxtYjZ+bVJ5tPxVxyqFKz4cAeSE6e6
qIp2mCA+QxbfYyIMmHcf0Uu4IuhnmAhFUYA3plxq8ztGkq5BnczmqQudXcLT4UiH
ePl75JwKipVzHYT2UQw2eE40Y47SoCNWzYMVhm7rocbNhk8LXa5X/5sg8i+7aZ+E
73fu/+sG976272mjjtyQqD7AEURF+i+CVf5OX2uIhtFmxU2EbgVhkcLMS3IY3VPx
+lWPQxe2jcnWt/mREK6oSu3uc9yP6MhxqT7DaDtQE/zcW2hyJKk3WiBdhi0yUMEr
Lij6ZAaq45eaMW7NphwEWpyX6UQi8TEj7xs3Jdh/aZwMesO4R6/m8a0w/HtMvVMj
csvv3eSPQHMlo/zoTJDCw3xSX+1M2vaHe04YHmVP6NeDLG1gVIVERRMcBd8PZPec
x+jsXmYPnRjqPbYhVQHA5yjAMlf/vSWAgU3Ohu8kqlIYhcf6PvrZQJLY8+fjogxl
TmQ09otj+px7feyuMDYrlisgNlKjN2pncS4WBPB3u5ZHr8CpYRsK1qSDX6mfLqWB
BDoEY2SEbSKlpIiYtqlbfkorokbBW5NEGeBrwbJE4l9bY/6sgDhSuGn6my1et/n0
RnSbAdxmNR+cv4aGwsYWqMgLdhGmT1jHC/1Okfq+OCmJPVovzG8=
=Gmy3
-----END PGP SIGNATURE-----

--uuWLrCl/xHRRX4mh--
