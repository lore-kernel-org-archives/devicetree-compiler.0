Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF812BD5AF;
	Wed, 28 Jan 2026 02:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567275; cv=none; b=SnuSSBraY99EhFrujd/mu0225Dxv06VeVKxJvpofxiTVG/Ifz8ZgTD0fG4bS16HHHGucpfx6i1y/bUxg5hR4DUWJgEaTPNaizu1k9aj8YoMBPRm50IiCMcFadYX917T7Sb538MTbiRIz6EpgGIBcm8rMs9RF5MpfqwYLnplZsqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567275; c=relaxed/simple;
	bh=GztNx/y6nVrcJ757mSW3Jpuu/xAjKoOGe1DCDWOqFFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPAVZE41rKjbc9b/5Cb6Ex+nRLWO7U7CoRghX6A27YjZ0U9hTVLK8rQdAuuv5o9LtOkkXz8i7OezUqGkjxr+y0q6ZSTb9IVpB7pnBqAPNEoKYSPIdueO1WHGGiwnBF7SMT7KLC0/vIvaRvpibBshDokYjRn2YI8mBhYKpvV2q9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=mHIPpK5i; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="mHIPpK5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1769567269;
	bh=Wu4BPTK9Yper0yPB6gAXC9AxTaKnLfEBKXF+9g/sfhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mHIPpK5iLsoaMyxtK7DOXipdT8xXbzTTbL1dZM8Fh1Wu2IiiT3paXT8Fth2RvIDqr
	 CMtV2Sh+xMxdQcKsa4mln4Yj2DxVOAp650xTW8tUX2aI0crzOR2SzzCYwpui5+kKXU
	 PjR5JgnkhaYcxdnGb1KrRivu0U5cCDbADlS1uDGD/iJr5SmIO/EYpP9o2p+sLuZenu
	 1giFzURNfZnB5luHTUKmoOr7jNeZTrXTtqQdbPs9zW1KoIhizVGxuQHmIggUi4NTA5
	 2rPruUUIOg04ghU9PueUOaQZQbfcxbnBSMdwzdHfPS2kv8m0WaRQDPart4GuXYfeuS
	 oX3buNw9lPrYA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4f15ln6GVPz4wCx; Wed, 28 Jan 2026 13:27:49 +1100 (AEDT)
Date: Wed, 28 Jan 2026 13:25:53 +1100
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
Subject: Re: [RFC PATCH 35/77] Add support for FDT_IMPORT_SYM dtb tag
Message-ID: <aXlzsYleV1AG4ISO@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-36-herve.codina@bootlin.com>
 <aWiMB8MljbOl-RRX@zatzit>
 <20260119153629.26fa0f94@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hPcM8Ky6YfWbhBz9"
Content-Disposition: inline
In-Reply-To: <20260119153629.26fa0f94@bootlin.com>


--hPcM8Ky6YfWbhBz9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 03:36:29PM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 15 Jan 2026 17:41:11 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:19:25PM +0100, Herve Codina wrote:
> > > The FDT_IMPORT_SYM dtb tag is a meta-data tag defining an imported
> > > symbol. It can be present globally in an addon dtb (i.e. outside nodes
> > > definition) meaning that this symbol needs to be resolved when the dtb
> > > is applied.
> > >=20
> > > The tag is followed by two values and possible alignment paddings:
> > >   - name (string including \0)
> > >       The import symbol name. I.e. the name used to reference this
> > >       imported symbol.
> > >   - padding:
> > >       Padding (0x00) added to have the next value aligned on 32bit.
> > >   - compatible (string including \0)
> > >       The compatible string that can be used for symbol resolution.
> > >       This string can be an empty string if it is not relevant.
> > >   - padding:
> > >       Padding (0x00) added to have the next value aligned on 32bit.
> > >=20
> > > Example:
> > >   FDT_IMPORT_SYM 'foo1' 0x00 0x00 0x00 'bar,foo'
> > >=20
> > >   This means that 'foo1' is an imported symbol and it is 'bar,foo'
> > >   compatible.
> > >=20
> > >   This is what is encoded in the dtb when the related dts has the
> > >   following imported symbol defined:
> > >     /import/ foo1: "bar,foo";
> > >=20
> > > If several symbols are imported, several FDT_IMPORT_SYM are present.
> > > Each of them defining one imported symbol. For instance, importing
> > > 'foo1' ("bar,foo" compatible) and 'baz1' ("bar,baz" compatible) leads
> > > to the following sequence:
> > >   FDT_IMPORT_SYM 'foo1' 0x00 0x00 0x00 'bar,foo'
> > >   FDT_IMPORT_SYM 'baz1' 0x00 0x00 0x00 'bar,baz'
> > >=20
> > > If FDT_IMPORT_SYM tags are present in the dtb, they are present after
> > > the root node definition (i.e. after the FDT_END_NODE related to the
> > > first FDT_BEGIN_NODE).
> > >=20
> > > Add support for this new dtb tag. =20
> >=20
> > Since these are global to the whole tree, would a new block make more
> > sense?
>=20
> I don't know.
>=20
> Exports symbols are in node blocs and that makes sense. I wouldn't expect
> imports out of the dtb "structure block".
>=20
> They could be grouped into an other tag, FDT_INFO_DTB for instance (part =
of
> the "structure block").
>=20
> If you think that a new block is really relevant, I can implement this new
> block.

On further thought, I don't think this is a good idea.  For one thing
adding an extra block makes resizing edits way harder to implement.
For another adding support for multiple upstream connectors might mean
they're no longer quite as global as they are.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--hPcM8Ky6YfWbhBz9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAml5c6IACgkQzQJF27ox
2GdNOg//SVrxBdsOPQ5y7gvWb26GgXbMFIT7M5jNFRaoVQo55hPJ/9ueWp3isGuJ
4bnTOVh3ohOfy4+oHY9WEyguue2c6N1BvlitkTb4syMeED2cQzwWM0tfrRKhiDYJ
BKCwSG6ohz3O7hjTL5hocltv+E6moynjJaUEYPc51bA93pi8CfBPEtOAhU0qkL1y
wLR60EAPhRMjtJsZ7yv3awFW1eZs3fBIUHOtbQsGVYi8NGDe/0pMGXmQuDbDRCGi
eYNMTV/aPYr0vUEEjwtgxUGp6/YJX6F2lFTnx1vBniCIU/spBf7xjHvIvbKRj/Dp
xo8JT2nwlNYzdmUAiNZaVIgvgGwVI6157rCbNm2O2Je+se6MYPxCBlKJf9a95oqC
PmjivCpGNNQj+wvwTlOy/sSEoxftWFg+1XSzYDS5f1+hXyg9AjSMS9xZrqkFySug
r0drL8zqbkTOFxSNvvLGpTLgT4xuPxCAVzleA8uAsRPW4hpWYnc7l9XQTkfsLah1
sp9c2beGbimx0pvin25oau77oIHsV4lCSj1k7R3y0kJdB3O3YX0/KKNs/n+SKVsl
wgQMyfInyObK13nAT8prRg4luoDfItMQt04Sl1TbBabD+1K4yYKtdkiyosaDkUHI
795K9RISdXbHDk9pp6WFRWDjxlQoemrEewuks2pB5GnkKOXuSsU=
=ajKA
-----END PGP SIGNATURE-----

--hPcM8Ky6YfWbhBz9--
