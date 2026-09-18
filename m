Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2733F274FE3;
	Fri, 18 Sep 2026 04:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789706490; cv=none; b=WOeBwsrB7YD5GOh0ntIj2IHJabfwRfMsebT2dqJ0TrMEklcLTs2wFi2tIdp2smE8Q08e/DoX4abBhBcEMTSrBxBYImeVVtxoOF7k9MIBAo1NpbNfsxwpmBaJ2m62RiO+yTeTRRpBC8bEX2sgfgsTC/SG4nyjWK3XtVY11+Bbm9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789706490; c=relaxed/simple;
	bh=CuFOojAP62T7MYKiqZCGa9ZPajWRFULZpI5H8u0dQEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKNBW1VeJ3XffQYEreGV1Y73xjD3UvyaePmdCwAL4+ygD5Xu8Z1vs2uSOtaY5rq2WA8RjocnsK75cLAkjc8eEgrD55sWrRCMoxoDAP6myDyBjvNlgjon2fEoqOkuwvlloBEism+w7bFbAt71WauKifChQ4T87Shwq4y3TKHlZ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Rf61a5St; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Rf61a5St"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789706460;
	bh=5YvKe2sgzfEsEjTqcACY7LzLKnKyTxmmOVn4NIxQWiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rf61a5StdONBadyzTV/AItlxZQnLdmCYGijmlqJTBVPFrwnhrF+T49vsuQNy9hwR6
	 8Mv7zd0lodfqan5KHAcdBjW/MVwCDvqQD4OI6oLGDbMomAryumCBI8bIOUqN/zFYi2
	 Oq96/SzJqUwwL2+H7dj2kvM3YASFNEtISy7olRPkmHvt+gOsauhcYf6/vXy2xgO1al
	 jtQVb14UGbxjj0I35JBEiyhueDaxcp52ejjBaFgnNBg1oZFlnBqhcKqK0Fb00M9hYj
	 lAm008tCjJTaSsmA6weUGs2z36RJn2uyjDq9Taxgapzar+v8ruHp8PhZtltPHzHZ5x
	 kCC+FwkF0gZjQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hmKgw0J8xz4wT6; Fri, 18 Sep 2026 14:41:00 +1000 (AEST)
Date: Fri, 18 Sep 2026 14:41:11 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 06/15] Introduce structured tag value definition
Message-ID: <aqzA11pFzN_3_Nhf@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-7-herve.codina@bootlin.com>
 <aqI3KnnQnUytqkEc@gractus.seuss>
 <20260910094126.4bf4cae6@bootlin.com>
 <aqJ5OhJcv4k-ZAj8@gractus.seuss>
 <20260911091653.37b22b0f@bootlin.com>
 <aqS6HmkaVYbrePtN@gractus.seuss>
 <20260914121937.5b7fa2bb@bootlin.com>
 <aqonNkbVqW9tf6Bg@gractus.seuss>
 <20260917090450.770c107a@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NA5mlXpuAz45brcl"
Content-Disposition: inline
In-Reply-To: <20260917090450.770c107a@bootlin.com>

--NA5mlXpuAz45brcl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 09:04:50AM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Wed, 16 Sep 2026 15:21:15 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Sep 14, 2026 at 12:19:37PM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Sat, 12 Sep 2026 12:34:24 +1000
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >=20
> > > ...
> > >  =20
> > > > > Do you mean that we should avoid the DATA_LEN_ENCODING and always=
 have the
> > > > > 32-bit value right after the tag to give the size for all "skippa=
ble" tags?   =20
> > > >=20
> > > > Yes.
> > > >  =20
> > >=20
> > > I did a test using a dts file available in kernel sources. I used (ar=
bitrary
> > > choice) juno.dts [0].
> > >=20
> > > Without any new tags, the size of the compiled dtb is 27067 bytes.
> > >=20
> > > With new metadata tags identifying phandles in properties (FDT_PROPDA=
TA_PHANDLE),
> > > the size of the dtb becomes 29027 bytes and so 29027 - 27067 =3D 1960=
 bytes for
> > > those FDT_PROPDATA_PHANDLE tags (+7.2%).
> > >=20
> > > The tags used are composed of:
> > > 32-bit: FDT_PROPDATA_PHANDLE value encoding 1 x 32-bit for data
> > > 32-bit: offset in the property where a phandle is present.
> > >=20
> > > Removing the '1 x 32-bit' information from the tag value and adding a=
 32-bit
> > > 'length' in all cases will lead 3 x 32-bit values for a FDT_PROPDATA_=
PHANDLE
> > > tag (tag + length + offset) instead of the 2 x 32-bit (tag + offset).
> > >=20
> > > Back to juno.dts instead of 1960 bytes, the FDT_PROPDATA_PHANDLE will=
 need
> > > 1960 * 3 / 2 =3D 2640 bytes (+9.7%). This leads to around +2.5% of th=
e whole
> > > dtb just to have the 32-bit for length. This +2.5% can be easily avoi=
ded.
> > >=20
> > > Also, I will not be surprised to see more tags in the future adding s=
ome more
> > > metadata information and so increasing dtb sizes.
> > >=20
> > > Quite often you have mentioned memory constraints system where libfdt=
 should
> > > be as small as possible. On those system, the dtb itself is embedded =
in the
> > > binary close to libfdt. The size of dtb should be taken into account.=
 =20
> >=20
> > Yeah, those proportions are high enough that I think it's worth it.
> >=20
> > > If the SAFE_SKIP bit is removed, I even plan to use this now free bit=
 in the
> > > length encoding part:
> > >   0b000: No data
> > >   0b001: 1 fdt32
> > >   0b010: 2 fdt32
> > >   ...
> > >   0b110: 6 fdt32
> > >   0b111: On additional fdt32 to encode the length of data.
> > >=20
> > > IHMO, length encoding bits in tag value definition should be kept and=
 used
> > > for all tags where the length is fixed and can be encoded using
> > > these bits. =20
> >=20
> > Well, I'm convinced we want some sort of compact encoding of the
> > length, but I think we can do better than the current proposal.  It
> > seems implausible to me that we'll need 2^29 different metadata tags,
> > so I think we can spend some more of the tag bits on the length.  How a=
bout:
> >=20
> >    0x80000000		structured tag bit
> >    0x7fff0000		tag type
> >    0x0000ffff		tag length
> >=20
> > So we have up to 2^15 (32k) different structured tags each with a
> > length of [0..65534] bytes (length=3D=3D65535 reserved for those that n=
eed
> > a full 32-bit length word).
> >=20
> > I believe that will avoid the extra length word for everything you
> > have currently drafted.
> >=20
>=20
> Yes, this will avoid the extra length field. The drawback is the that the
> tag value is no more a well fixed value. Each time we have to check the t=
ag
> value we have to filter out the tag length.
>=20
> For instance:
> - FDT_PROPDATA_PHANDLE
>   fixed data size 4 bytes for offset
>   tag value: 0x80010004
>=20
> - FDT_PROPDATA_PHANDLE_REF
>   data: 4 bytes for offset + N bytes for a string
>   tag value 0x8002ssss with ssss for the size
>=20
> This will lead to code like this:
>   tag =3D fdt_next_tag();
>   if (tag =3D=3D FDT_PROPDATA_PHANDLE)
>     /* Do something */
>     =20
>   if (TAG_GET_ID(tag) =3D=3D FDT_PROPDATA_PHANDLE_REF)
>     /* Do something */

True.  But.. a similar problem kind of exists with the original
proposed encoding too: we *expect* a tag with fixed 4-byte contents to
use the "1 cell" flags, but we need to consider the case of encoding
it as VARLEN with a length field of 4.  We could choose to make that
forbidden, but we'd still need to consider who's responsible for
enforcing that.

Similarly, if a variable length metadata tag happens to have length 4
or 8 in a particular place, is it valid to encode it with the 1-cell
or 2-cell flag?

As a variant on my proposal, I'd also be fine with dividing the
structed tags into several classes with bits indicating which is
which.  Either:

 * "short" vs "long": "short" always has the length within the tag
   word (and so cannot exceed 64k, or however many bits we set aside)
   whereas long always has a length word
 * "fixed" vs "variable", fixed length tag types always have the same
   length, so the length can be considered part of the tag.  Variable
   would have a length word.

Not sure if that makes things any easier, but they might, and I'd be
fine with either option (or some combination).  In any of these cases
we do need to spell out what the requirements are: for dtb writers,
for dtb readers and for whoever defines a new tag.

> Further more, in the code you will both a mix of both construction:
>   while (tag =3D=3D FDT_NOP || tag =3D=3D FDT_BEGIN_NODE ||
>          TAG_GET_ID(tag) =3D=3D FDT_BEGIN_NODE_REF);
> =20
> with #define TAG_GET_ID(tag) ((tag) & 0xffff0000)
>=20
> Also when we write dtbs either in libfdt or dtc, tags value
> have to be built with the length when needed.
> #define TAG_VALUE(tag_id, length) (((tag_id) & 0xffff0000) || \
>                                    ((length) & 0x0000ffff))
>=20
> I am totally fine with that but we need to have it in mind.

Right, that's not a deal breaker for me - especially since I think
we'll need some similar stuff even with the original proposal.

> Of course, I can encode FDT_PROPDATA_PHANDLE_REF with 0x8002ffff + length
> field but we lose all the benefits
>=20
> Ready to see TAG_GET_ID(tag) and TAG_VALUE(tag_id, length) when needed in
> the code?

I think so, though that could change depending on what it ends up
looking like in practice.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--NA5mlXpuAz45brcl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqswNcACgkQzQJF27ox
2Gd+GQ/9FPkTUQTcK17WTxhNCpujkh1eYZlxJ8PZgdfuc2hIvcgggIS9FvrLpwnP
NbfZWnoaHA3+aSrKUqgLOWv3iiZcpefFblZ/ZopE6vqad68csvB2KwdSga1O9uf0
qq1MZS3rkNkwrm/k8BoGfniwyJRDRwBQftX99Kxs46nwFRjBNTMdY4NhE1PWvPQV
zLrf00N19CK2RTUAqvYKfkmaWewNFwGwXK0pVjWiYHuCPmau2J620c8vUWOA3yWk
1gbOg0OOEwH0Noi7ls7w1Z8J8bgq/rUF5+MmiNVpnJR/KXcNtnPK7SaqFSZ7eDu+
SrHN3HC3Rj1T07Sdmz7cEzuPpFm8q5/jlTPPMeCVgfnPVDMxu3KDnay0Q/gAhCQK
eTOlH2OBY6JKUVAExUfi3uXrv0nigknmPVylaEyAfIvvSg9yILjL46ScozT8SA2g
3qp/3SPWChk2h2TBDKzQmiwwztIy/zp2qrRVCls/d5hozSJmvXx9Nn4IHikt7YW8
u09RZyvOFhhE4SWdVnyqH6CtMwDN4QP0KqegTJ9L9qwRwNAXiMseFsduYhVM4tq/
h2SBrG50LV9Cbb+5gdC80bD9T4U3mZcPmvImFoSV4bz0qREers0AoqE6VtZvFTu3
/ekUtTnXD4TLOUIKXImZwxgKY2oPvLUjv1DRVSpXxg7N4D1vXgI=
=jHtC
-----END PGP SIGNATURE-----

--NA5mlXpuAz45brcl--
