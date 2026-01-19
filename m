Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F8778F2B;
	Mon, 19 Jan 2026 06:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768802481; cv=none; b=j29w+TJpaLacOx346rB0DnxB44oVtbYU36e0Vn6RH3gSCUjhH+ziyBYSXSLgJXozZTZUktk8mYY+seRp/aEx+WuprrY/FGkj8V1Q6hN6abQ5SHksLbzMvwEOciXCq0MHKgkJL6p5PYFkPK+lEz5cS8zMMeDB9zOvU8nFujnD6Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768802481; c=relaxed/simple;
	bh=e8e6qAe5DR6AAQf0mhWbE7dmoEgUUfiiQR5O1uGZpmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajH1cL+J2ALRex25fFaXItgn+ms2jb0Ed6sovhTDd3gM2IVHIP0loJoVkAyi2YV2zP4csbQhrfgG6Q3miXMaFbrjG5SxOshj0BtdMJYeFiSYvBwxM9vFnCa9sWH/R/nxbwfFvt/jNJS+4faPVFH53lFr9G0bMV2lLDbKwxAERoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Wrl5nm00; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Wrl5nm00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768802477;
	bh=mlOq8tDZKltsi0nWAs+xXGaw/NEq68Jo8P6ZS1AkHDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wrl5nm00f/saSlXXGj9EWO1cX0I++da4+ilrUYneLcpNMUg4ttVtgbGHe+aLT16Pi
	 4rPrd8AxQA2lcbab7gUpUMxxXSVJt9tV269OL1Hkjv7oNfdDf6AOlGACDZYsJPH+2p
	 XyEYoB18/Ayc5rmfzOCHEXOQHg9fAGXEPQQyo9fcZplPCusFNRkJ6ngvcREtswhCnx
	 mIj9NNnRiu6RnV5aovK0y6MdTCJlR8JIIEr47JdWu5egBhXAUW+k2Fy2unNPDvfCEO
	 hyWBw70oxf2vPsSPrTPkz8JUtZOzi1xvoV2MNnA8pZChAn31arwCymzTKrDzWRNEMq
	 ocpgMqJKbJUeQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dvfwF1zQWz4wGT; Mon, 19 Jan 2026 17:01:17 +1100 (AEDT)
Date: Mon, 19 Jan 2026 17:00:44 +1100
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Saravana Kannan <saravanak@kernel.org>
Subject: Re: [RFC PATCH 00/77] Add support for dtb metadata and addon
 device-trees
Message-ID: <aW3IjNpBnnFE7-r7@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <CAL_JsqK4nH0B-CfKz5wgg12C+Vzi31ceHeOes94Z8hg3uN=X1g@mail.gmail.com>
 <20260114171822.2a44d2a5@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v6ocbXjxXlrgJL/a"
Content-Disposition: inline
In-Reply-To: <20260114171822.2a44d2a5@bootlin.com>


--v6ocbXjxXlrgJL/a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 05:18:22PM +0100, Herve Codina wrote:
> Hi Rob,
>=20
> On Tue, 13 Jan 2026 12:44:07 -0600
> Rob Herring <robh@kernel.org> wrote:
>=20
> > On Mon, Jan 12, 2026 at 8:20=E2=80=AFAM Herve Codina <herve.codina@boot=
lin.com> wrote:
[snip]
> > >   - Patches 13..17: Introduce addons device-tree
> > >
> > >     This part introduce the new /addon/ dts keyword
> > >
> > >   - Patches 18..30: Introduce /export/ keyword and related dtb tags
> > >
> > >     This part introduces the new /export/ dts keyword (details in pat=
ch
> > >     20) and the related FDT_EXPORT_SYM and FDT_EXPORT_SYM_REF dtb tag=
s.
> > >
> > >     FDT_EXPORT_SYM (details in patch 25) is used when the exported
> > >     symbol involved is a local node and FDT_EXPORT_SYM_REF (details in
> > >     patch 29) is used when the node involved is a non local node. =20
> >=20
> > More generally, would these just be "node metadata" tags?
> >=20
>=20
> I think we can have metadata at 3 differents levels:
> - Property
> - Node
> - Global dtb

This is a really minor point, but I don't especially like the term
"metadata" for the symbol / fixup information.  Although it's
technically accurate that it's metadata for the property bytestrings,
in most contexts "metadata" makes me think only of tree global
metadata.  By analogy, symbols and fixup information in a .so or .a
could be seen as metadata to the raw code / data bytes, but I wouldn't
normally use that term for it (whereas I might for, say, the soname or
certain .note sections).

> With the suggestion you did on patch 6 related to FDT_REF_LOCAL and if I
> understood correctly, you expect to have a kind of "container" tag to gro=
up
> metadata on each level.
>=20
> Also you expect to have the ability to handle all 'for now unknown' tag
> smoothly and so, I agree, the length of the data related to a tag are
> needed to be present with the tag itself. I see to kind of tag, some with
> the length of data available in the u32 following the tag and other witho=
ut
> the length encoded.
>=20
> Tags without length encoded are followed by one u32 field containing data
> related to the tag. This allow to avoid a lot of 'TAG_XXX 0x04 u32_data'
> Indeed, I have the feeling that quite a lot of tags will have only one u32
> field as data part and so, having 0x04 encoded (cell aligned) each time.
>=20
> A tag value is on 32bits. We can define the structure of this value.
>   - bit 31 (msb):
>      - 0: This is not a new kind to tag and so it doesn't follow this def=
inition.
>           All existing tags are in this categorie
>      - 1: New kind of tag adopting this definition
>=20
>   - bits 30..28:
>      tag data length encoding
>      0b000: No data related to the tag
>      0b001: 1 data cell (u32) directly follows the tag
>      0b010: 2 data cells (2 u32) directly follow the tag
>      ...
>      0b110: 6 data cells (6 u32) directly follow the tag
>      0b111: Tag is followed by a cell (u32) indicating the size (in bytes)
>             of data available just after this cell (including any padding
>             if needed).
> 	    Because this size include some possible padding, its value is a
>             multiple of 4 bytes.
>             The offset of the tag + 4 + size points to the next tag.
>          =20
>=20
>   - bit 27..0
>      tag specific identifier

As noted elsewhere, I'm not necessarily opposed to having a general
length encoding.  However, for each new tag I think we need to think
carefully about whether it really is safe for older software that
doesn't understand it to just skip it.

> With that definition, the following tags can be defined:
>   - FDT_INFO_PROPERTY (new tag, length encoding): 0xf0000001
>      This tag is available after a property.
>      It is followed by a cell for the length of data, the data part is a
>      sequence of tags (and related data) giving information related to the
>      last property available before the tag.

I'd prefer to avoid an additional layer of nesting here - I'd rather
just have multiple top level tags.

>   - FDT_REF_LOCAL (new tag, 1 cell data): 0x90000002:
>      The cell after this tag is the offset in the property where a local
>      phandle is available
>=20
>   - FDT_REF_PHANDLE (new tag, length encoding): 0xf0000003
>      Cf. patch 11 for definition
>      It is followed by a cell for the length of data. The data part is
>      composed of:
>        - offset (u32)
>        - label (string including \0)
>        - padding if needed to have next item aligned on 32bits
>=20
>=20
> With that defined, supposing the following dts example:
>   --- 8< ---
>   /* 'foo' is a reference to local node,
>    * 'bar' is a reference to an external node
>    */
>   prop =3D <1 2 &foo &bar1>;
>   --- 8< ---
>=20
> The dtb will see the following structure:
> FDT_PROP ...
> FDT_INFO_PROPERTY (0xf0000001)
>   28 (length =3D (4+4)+(4+4+12) bytes)
>   FDT_REF_LOCAL (0x90000002)
>     0x8                             <--- offset of &foo
>   FDT_REF_PHANDLE (0xf0000003)
>     12 (length =3D 4+4+1+3 bytes)
>     0xc                             <--- offset of &bar
>     "bar1" + its \0                 <-- reference to resolve
>     0x00 0x00 0x00                  <-- 3 bytes padding
>=20
> Adding FDT_TYPE_U32 later will consist in defining
> its value, probably a 0x9 family (1 cell after the tag for the
> offset value)
>=20
> At any point, only looking at the higher part of the tag (i.e. 0xN.......=
), we
> can skip the tag and its data if don't know about the tag.
>  - 0x0: Old tag format
>     -> Error if unknown
>=20
>  - 0x8 to 0xe: New format followed by 0 (0x8) to 6 cells of data
>     -> Ignore if unknown and skip the N cells of data to look at the next
>=20
>  - 0xf: New format followed by 1 cell giving the size of following data.
>     -> Ignore if unknown and read the length available in the cell after =
the
>        tag, skip length byte of data to look at the next.
>        If the length read is not a multiple of 4: Error, invalid tag.
>=20
>=20
> For this series we need the container tags:
> - FDT_INFO_PROPERTY for information related to a property
>   Among known tags defined in this series, only FDT_REF_LOCAL and
>   FDT_REF_PHANDLE can be grouped into a FDT_INFO_PROPERTY.
>=20
> - FDT_INFO_NODE for information related to a node
>   Among known tags defined in this series, only FDT_EXPORT_SYM_LOCAL
>   and FDT_EXPORT_SYM_REF can be grouped into a FDT_INFO_NODE.
>=20
> - FDT_INFO_DTB for information related to the dtb
>   Among known tags defined in this series, only FDT_IMPORT_SYM can
>   be present into a FDT_INFO_DTB.
>=20
> IMHO, the new tag FDT_BEGIN_NODE_REF related to orphan nodes doesn't
> have to be in one of those containers. Indeed, FDT_BEGIN_NODE_REF
> is more a node definition than a metadata.

That's a perfect example of a new tag that absolutely cannot be just
skipped if not understood.  Software *must* hard error if they
encounter this and don't understand it.

> Rob, does this could fit with what you expect?
>=20
> If it does, is it relevant to keep the length cell available in 0xf
> family to be in bytes. It should be a multiple of 4 in all cases and
> so it can be given in the number of 32bit words instead of bytes.
>=20
> Best regards,
> Herv=C3=A9
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--v6ocbXjxXlrgJL/a
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmltyIsACgkQzQJF27ox
2Gd7Dw//Z87+jMoli3YsNfNs/uX/nKTqffSULR3cCi/cz1LFeMeDumJnKV1wwS7G
qyg8c4v9wUOQiscxe9c5oPFIAEmCmRE8mZoposJahrHnvZdoUaye8+5mJ4qL9yY0
46Dt0zAtCqul3BHy/uhdvl7zE2FIpZoXHk5RdQHjI8+3MD0JXfZVNy/KNe9wR6cZ
P5DwO3N2oVEl9AwSgTfkouaRFBmWxzV4/Oo1kUiIZe0aBEnmtO0YIG77vwoGAlOh
YD3ox/TXoit8TA+2iWu6cS4IzDvOqdkLmVB9hFdq/yv3E0BcY+bHKNFT4ot7I7oe
Zb/zy//gf7eY+cceG6GIyHz1QjbQ22dcXz701R9ups4dhGI1CMDXvgvnZIWvbh9j
r7I2fhF1sJiYsmbNJ+pehIXGaJVISxS851LemgHunkfv5xNw3JwHYG2EwBJHtNFy
U/x+OtMTMo51dMOgrlFvE9KLKLtUVMhgPJwwLvCoJ5DBTamKvd5HQ9oVTEZUje7Z
1T/jkv3vdovKuMOWFyKj3fuAy/R2JmrrpKDYfVtAYcXC9vpOvALRErH1CGgg0Y2A
ip/XPmHXMjj3x4kf37cDncp+Eq9AAnWblq7yviPkUA4sPHhWAgLrh/c+afKXOYMa
sY+1d1t/DGHDZP9de29NrmDQB/nawA8kbaBcDRUBacnDzWWjDYk=
=tiYz
-----END PGP SIGNATURE-----

--v6ocbXjxXlrgJL/a--
