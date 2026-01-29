Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0DA156236;
	Thu, 29 Jan 2026 05:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769663343; cv=none; b=jB0A6MsRliOnpSpj/gMj9ESmrNvZfR3bOMNy7Jm5+OYCJLiyd3vPzgW9ysda3oRDWFpFA69cXTWHB2N3if8qwMePwYj2icGZWQ2LHQ0a4l67xXzivGgPljh45/3pQA2OYqYGlRwZdkBIoLOQOVjpkOLNtn7MQ2qkFaDJHGFt8xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769663343; c=relaxed/simple;
	bh=SVSLzhIhDBNht46ZUCencG9Pf89VAI/C1MHdrY2Zy1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHnZ8cljgBtUrwCA8HzN6JDaObygGg6md5p2wqRxr/dEu7NGPKqffp7iTTLoL4iIiR0M5uxiXINfMvRrq5YC8yYeEbRImHpEbvcnbMtFotjQBhFwc8bgJEKgDUktJYiETPEI+/FpMKZCK5zgCq8EZXf4zDEOpRbSM8SYdq1sSE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Z69dE/ON; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Z69dE/ON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1769663338;
	bh=e1N3kyQ4rF1YOiMGhn4H4eSDhV/++xh6wo2DU8EzZsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z69dE/ON6RVSaoO48o6KPWOFIikymlmmL10wLQBetcHClkX7yJnFOlotf0bThbiLR
	 A7Su0osGTrKg3Ask/Z+A2GmGQc7ryN6+icPv+wZo2FJ0Q/bTZqd5qR2JP5JOYU5o5l
	 InN6d+afml/u+0dD9SLnJ3ykBFoXD9ADlK2hVrE6dyyC8uR9V8VLMnhGPlkU7mN4eK
	 Wi4O51uw7T67VliZ5Dz9ijLycSEOFGr5XGbPIgITRY23jo5ndoQ5uOCrXYfxHk/kqG
	 X26RzUpp7GKhi8OdthOXejhBXCTmGfAaV0FHqosshOf5O1oMGq6rUo1VQ54hNMk411
	 dvL8D/PwtNzgA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4f1nHG0W3Gz4wGT; Thu, 29 Jan 2026 16:08:58 +1100 (AEDT)
Date: Thu, 29 Jan 2026 16:08:51 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <aXrrYz4U70FjkEix@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <CAL_JsqK4nH0B-CfKz5wgg12C+Vzi31ceHeOes94Z8hg3uN=X1g@mail.gmail.com>
 <20260114171822.2a44d2a5@bootlin.com>
 <aW3IjNpBnnFE7-r7@zatzit>
 <20260127161907.23e62463@bootlin.com>
 <CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49on8VfkP7CDvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K9rhePGmAvqJDnoH"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49on8VfkP7CDvw@mail.gmail.com>


--K9rhePGmAvqJDnoH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 04:06:12PM -0600, Rob Herring wrote:
> On Tue, Jan 27, 2026 at 9:19=E2=80=AFAM Herve Codina <herve.codina@bootli=
n.com> wrote:
> >
> > Hi Rob, David,
> >
> > On Mon, 19 Jan 2026 17:00:44 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >
> > ...
> > > >
> > > > I think we can have metadata at 3 differents levels:
> > > > - Property
> > > > - Node
> > > > - Global dtb
> > >
> > > This is a really minor point, but I don't especially like the term
> > > "metadata" for the symbol / fixup information.  Although it's
> > > technically accurate that it's metadata for the property bytestrings,
> > > in most contexts "metadata" makes me think only of tree global
> > > metadata.  By analogy, symbols and fixup information in a .so or .a
> > > could be seen as metadata to the raw code / data bytes, but I wouldn't
> > > normally use that term for it (whereas I might for, say, the soname or
> > > certain .note sections).
> > >
> > > > With the suggestion you did on patch 6 related to FDT_REF_LOCAL and=
 if I
> > > > understood correctly, you expect to have a kind of "container" tag =
to group
> > > > metadata on each level.
> > > >
> > > > Also you expect to have the ability to handle all 'for now unknown'=
 tag
> > > > smoothly and so, I agree, the length of the data related to a tag a=
re
> > > > needed to be present with the tag itself. I see to kind of tag, som=
e with
> > > > the length of data available in the u32 following the tag and other=
 without
> > > > the length encoded.
> > > >
> > > > Tags without length encoded are followed by one u32 field containin=
g data
> > > > related to the tag. This allow to avoid a lot of 'TAG_XXX 0x04 u32_=
data'
> > > > Indeed, I have the feeling that quite a lot of tags will have only =
one u32
> > > > field as data part and so, having 0x04 encoded (cell aligned) each =
time.
> > > >
> > > > A tag value is on 32bits. We can define the structure of this value.
> > > >   - bit 31 (msb):
> > > >      - 0: This is not a new kind to tag and so it doesn't follow th=
is definition.
> > > >           All existing tags are in this categorie
> > > >      - 1: New kind of tag adopting this definition
> > > >
> > > >   - bits 30..28:
> > > >      tag data length encoding
> > > >      0b000: No data related to the tag
> > > >      0b001: 1 data cell (u32) directly follows the tag
> > > >      0b010: 2 data cells (2 u32) directly follow the tag
> > > >      ...
> > > >      0b110: 6 data cells (6 u32) directly follow the tag
> > > >      0b111: Tag is followed by a cell (u32) indicating the size (in=
 bytes)
> > > >             of data available just after this cell (including any p=
adding
> > > >             if needed).
> > > >         Because this size include some possible padding, its value =
is a
> > > >             multiple of 4 bytes.
> > > >             The offset of the tag + 4 + size points to the next tag.
> > > >
> > > >
> > > >   - bit 27..0
> > > >      tag specific identifier
> > >
> > > As noted elsewhere, I'm not necessarily opposed to having a general
> > > length encoding.  However, for each new tag I think we need to think
> > > carefully about whether it really is safe for older software that
> > > doesn't understand it to just skip it.
> > >
> > > > With that definition, the following tags can be defined:
> > > >   - FDT_INFO_PROPERTY (new tag, length encoding): 0xf0000001
> > > >      This tag is available after a property.
> > > >      It is followed by a cell for the length of data, the data part=
 is a
> > > >      sequence of tags (and related data) giving information related=
 to the
> > > >      last property available before the tag.
> > >
> > > I'd prefer to avoid an additional layer of nesting here - I'd rather
> > > just have multiple top level tags.
> > >
> > > >   - FDT_REF_LOCAL (new tag, 1 cell data): 0x90000002:
> > > >      The cell after this tag is the offset in the property where a =
local
> > > >      phandle is available
> > > >
> > > >   - FDT_REF_PHANDLE (new tag, length encoding): 0xf0000003
> > > >      Cf. patch 11 for definition
> > > >      It is followed by a cell for the length of data. The data part=
 is
> > > >      composed of:
> > > >        - offset (u32)
> > > >        - label (string including \0)
> > > >        - padding if needed to have next item aligned on 32bits
> > > >
> > > >
> > > > With that defined, supposing the following dts example:
> > > >   --- 8< ---
> > > >   /* 'foo' is a reference to local node,
> > > >    * 'bar' is a reference to an external node
> > > >    */
> > > >   prop =3D <1 2 &foo &bar1>;
> > > >   --- 8< ---
> > > >
> > > > The dtb will see the following structure:
> > > > FDT_PROP ...
> > > > FDT_INFO_PROPERTY (0xf0000001)
> > > >   28 (length =3D (4+4)+(4+4+12) bytes)
> > > >   FDT_REF_LOCAL (0x90000002)
> > > >     0x8                             <--- offset of &foo
> > > >   FDT_REF_PHANDLE (0xf0000003)
> > > >     12 (length =3D 4+4+1+3 bytes)
> > > >     0xc                             <--- offset of &bar
> > > >     "bar1" + its \0                 <-- reference to resolve
> > > >     0x00 0x00 0x00                  <-- 3 bytes padding
> > > >
> > > > Adding FDT_TYPE_U32 later will consist in defining
> > > > its value, probably a 0x9 family (1 cell after the tag for the
> > > > offset value)
> > > >
> > > > At any point, only looking at the higher part of the tag (i.e. 0xN.=
=2E.....), we
> > > > can skip the tag and its data if don't know about the tag.
> > > >  - 0x0: Old tag format
> > > >     -> Error if unknown
> > > >
> > > >  - 0x8 to 0xe: New format followed by 0 (0x8) to 6 cells of data
> > > >     -> Ignore if unknown and skip the N cells of data to look at th=
e next
> > > >
> > > >  - 0xf: New format followed by 1 cell giving the size of following =
data.
> > > >     -> Ignore if unknown and read the length available in the cell =
after the
> > > >        tag, skip length byte of data to look at the next.
> > > >        If the length read is not a multiple of 4: Error, invalid ta=
g.
> > > >
> > > >
> > > > For this series we need the container tags:
> > > > - FDT_INFO_PROPERTY for information related to a property
> > > >   Among known tags defined in this series, only FDT_REF_LOCAL and
> > > >   FDT_REF_PHANDLE can be grouped into a FDT_INFO_PROPERTY.
> > > >
> > > > - FDT_INFO_NODE for information related to a node
> > > >   Among known tags defined in this series, only FDT_EXPORT_SYM_LOCAL
> > > >   and FDT_EXPORT_SYM_REF can be grouped into a FDT_INFO_NODE.
> > > >
> > > > - FDT_INFO_DTB for information related to the dtb
> > > >   Among known tags defined in this series, only FDT_IMPORT_SYM can
> > > >   be present into a FDT_INFO_DTB.
> > > >
> > > > IMHO, the new tag FDT_BEGIN_NODE_REF related to orphan nodes doesn't
> > > > have to be in one of those containers. Indeed, FDT_BEGIN_NODE_REF
> > > > is more a node definition than a metadata.
> > >
> > > That's a perfect example of a new tag that absolutely cannot be just
> > > skipped if not understood.  Software *must* hard error if they
> > > encounter this and don't understand it.
> > >
> >
> > I have started to implement this "unknown tag" feature based on the tag
> > values definition presented here and with complementary feature (bit
> > allowing to skip an unknown tag) as presented in patch 2 discussion [1].
> >
> > I didn't introduce any FDT_INFO_xxx tags. They introduce nesting tags
> > and David seems not agree with that.

Right.  I don't see that they provide any advantage, so it's just
extra complexity.  I'm open to persuasion if it turns out there's a
concrete reason for it.

> > I use simple test tags to have some "unknown tags" in dtb and looked at
> > the way to handle them.
> >
> > When we read a dtb, no problem, we just skip "unknown tags" if we are
> > allowed to (flag in tag value).
> >
> > The issue comes when we modify a dtb.
> >
> > libftd allows to modify a dtb. It allows to add/modify/remove properties
> > and nodes. Bootloaders for instance use this capability to update a dtb
> > before passing it to the kernel.
> >
> > How should we handle unknown tags in this context?
> >
> > We don't knwow about the meaning of those tags (unknown tags) and so, we
> > don't know if those tags are still consistent with modifications done?
>=20
> I don't think we have any choice, but to remove the tags.

Agreed.

> > A property can be followed by an unknown tags related to this property.
> > Also a property can be followed by an unknown tag related to the node.
> > We simply don't know.
>=20
> We should be able to distinguish between node and property tags at
> least. Either by value or location. IOW, node tags must follow a
> BEGIN_NODE tag and property tags must follow a property.

This seems reasonable to me.  The fact that these properties are
considered tied to a specific node or property should be stated
explicitly in the general description of "ignorable" tags, though.  As
Herve pointed out, we still have the option of adding more "old style"
tags if we need something that doesn't fit the new constraints.

> > Any modification can impact unknown tags and make them inconsistent.
> > Here again, we simply don't know.
> >
> > Should we avoid any modification when a dtb contains unknown tags?
>=20
> You answered that below. :)
>=20
> > Should we simply remove all unknown tags when a modification is done?
>=20
> For that node or property, yes. For the whole DTB, no. Though does
> modifying a property constitute modifying a node?
>=20
> >
> > Bootloaders need to modify the dtb. Avoiding modification is a no-go.
> > Removing "unknown tags" when a modification is done will lead to removi=
ng
> > all unknown tags at bootloader stage.
> >
> > Rob, David, any opinion related to this specific issue and the strategy=
 we
> > should follow when modification are involved?
>=20
> Perhaps we should separate the 'version we can read' and the 'version
> we can write'. Let's say it is v18 that allows unknown tags, but v19
> that actually adds any specific tags (or adds tags that are not safe
> to ignore). Then a DTB with last_compat_version=3Dv18 and version=3Dv19
> can be read by libfdt supporting v18+, but requires v19 libfdt to
> write it. We'd still have to allow writing a v19 DTB with v18 libfdt,
> but we'd have to downgrade the version to v18 (or downgrade if we had
> to drop some tags).
>=20
> The DT and bootloader/firmware are typically bundled together and in
> that case there shouldn't be an issue of different versions. You can
> have a newer DTB instead of the firmware one, but that doesn't need to
> have the new tags (if the OS does require them, then it broke
> compatibility).
>=20
> Even with this series, I think everything can be ignored if you are
> only looking for compatibility with what we have now.

Not if you rely on reading phandle values.

> It's only if you
> want to support the addons, then you need v?? which defines the set of
> tags for addons. So I'm not certain a tag bit is the right way to say
> safe to ignore or not. I think if we have a new tag that every client
> has to understand and handle, then that's a major version change. I
> think the original intent with the versions was 0x10 (aka 16) was a
> new major version, 0x13(v18) would be another minor rev, and 0x20
> would be the next major version.

I don't think it was thought out in that much detail at the time, but
that seems a reasonable approach to me.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--K9rhePGmAvqJDnoH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAml662IACgkQzQJF27ox
2GeRyA//TTf5FZV56ScKBvdYqtoT+xdcol9dOlx5Cje23R/6CskLnBliRXswmZ25
a5WVxftL/0h/c7p22m50Xm6EHN9SILAbLILd6i9aKvsI/DrNBwkvt77Qe0KOV4Xf
vBVWJN0mqI00S7hGSQyMMmmOYeKkHvmsTA0+DT3Os6M/feom7pXWOYZ+IaxWj7pz
9ZjxM395f51n30eUCaazlm42dVa0m1XP4Ggr7aphMUuSUN+B91x6j7vZ3LWvxi89
myoZ8aurcDQCPsr+I8eBZPy0UIxWVL4QKPMkfl/mwqGG6fpXAh/pWbnVbUfWHfx0
W07g3MKACu2u6+gglo8t8Gl7iiTz+xS1THAsSdpRyNEt08LBnev5ntszdvcYnQjL
GFhGf/fmdeVSZHzSuD7kU1NgyLrUJD3A+YaKWJumULT3sGOKSfZUVBM7sBlXR2DR
lXucGC1APsSzh6dV7L6ARvA5Z+WsbyD/4rzI4Ec1EKT43qLR/pYAsrYX87ECQKGo
0VAZ97AeBeasrN+LwbU4ljBiSzHnSj4cIFKX1JqrjMYhgDc2qI3OLwJWA8VzqQ6u
BLSaNWo1yHhx39WDJ3HBqqmAcbW04UoNYqhEskKwoMHrUThamNq4F/19mDEQicGV
di6afmT7lmb7e7v7XO2erPkzzHPWCfRA/Xc3A1gv0nvWdUuw4IM=
=iTRX
-----END PGP SIGNATURE-----

--K9rhePGmAvqJDnoH--
