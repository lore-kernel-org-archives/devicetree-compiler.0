Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026672C08D1
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Jan 2026 22:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769551587; cv=none; b=PqZwfU3MWnKFEIHmhCaAoP0fkv+Dm82Qg+rQbItxuNyI+h2KEFA2pmEadPm253I2MJ292u7xdeog01ElxkLrFe7dN30YLD815OPp7zinaqRtEkrBvADRTwigfIfOAGkf5w6kRTXM4R/mkd5Lc2i8k3O9AizfdBjZN2ZJTlkaT54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769551587; c=relaxed/simple;
	bh=RfcVagdUTV88Kahd+Dc9O5qdG+kdzm3I9UF34Rjg7v8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YpwS3lofbfmm5yT8etH89U49mV4I94YdovHs9niFf/r/Gu2gFBBbCk7/oiNS+p5fMQahSyb9QkYB5TmlKGaG9fyYDfcbkuKLWZlQ6h6T+xnYVtCCPkann5LAkn0qJ6PFX9CSzaxhoKZEVlV/zWsBtxU/gbxlFin9WmMDqRNWuLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcN4/G8O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcN4/G8O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF85BC2BCB0
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Jan 2026 22:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769551586;
	bh=RfcVagdUTV88Kahd+Dc9O5qdG+kdzm3I9UF34Rjg7v8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PcN4/G8Oz+muJikhFPQDM0xrmhu1IKGCecxJ4UMGX9J7SQ5RIXQCHJ8nfVhfv80j7
	 cH5aQXgSRNzr8Yb13cop7Z5Ub6kwRacRkHOmy8OIBRruBFWeOIV5FX1MS0fHYvpSKd
	 Jxq78D+4CxVs9aD81yxZxS3vVNO/ie8tjZ9OhLLmTm52QtA0bYZJWPrG3Wh90hYwV8
	 TComA4l2U9/5Gnzb1Hm/aAw475IiprjAkrgMs/Ew9wCKUazCpIGeUk2hWFN6UCKe8z
	 4mNRl6PA8thD/YUANEljhUAnGbqva1abw9FO7ksKXJjpXEFzC1ctAvmt8xs+hHe+Z6
	 pM6DE/9ZYmPxA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6581af9c94aso11617908a12.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 27 Jan 2026 14:06:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHKtLsDjCKwR75TATlHLOref9OrSdNhaDAUmyJTqHnH3LdARSEUyVYKGQTvlpbvZhcUAQifiu0q9ts1mqPP1aBuvL1@vger.kernel.org
X-Gm-Message-State: AOJu0YzF/iX8U/nw2cnfqGCPaqFWXB0qC9SPqeVtY6o8fUUOOkw6GfJY
	vBd+VBNrr1IKZ30nHXve6XhtGaWTkccyG26PesJm6uPHufg6NnN3Jw/4Zv7yW2VXiWOEa75qZEA
	8KzRA5KoMl3pmcSC/gD7qvYJ8cUh+bw==
X-Received: by 2002:a05:6402:5246:b0:658:191a:31b9 with SMTP id
 4fb4d7f45d1cf-658a60a4d08mr2065670a12.27.1769551585134; Tue, 27 Jan 2026
 14:06:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <CAL_JsqK4nH0B-CfKz5wgg12C+Vzi31ceHeOes94Z8hg3uN=X1g@mail.gmail.com>
 <20260114171822.2a44d2a5@bootlin.com> <aW3IjNpBnnFE7-r7@zatzit> <20260127161907.23e62463@bootlin.com>
In-Reply-To: <20260127161907.23e62463@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Jan 2026 16:06:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49on8VfkP7CDvw@mail.gmail.com>
X-Gm-Features: AZwV_QiO-FsPw7PqASdps0MMd3o7LaYNuacdkgLexvuerHkx5YjRDAUAKv2cGPU
Message-ID: <CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49on8VfkP7CDvw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/77] Add support for dtb metadata and addon device-trees
To: Herve Codina <herve.codina@bootlin.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ayush Singh <ayush@beagleboard.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 9:19=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi Rob, David,
>
> On Mon, 19 Jan 2026 17:00:44 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>
> ...
> > >
> > > I think we can have metadata at 3 differents levels:
> > > - Property
> > > - Node
> > > - Global dtb
> >
> > This is a really minor point, but I don't especially like the term
> > "metadata" for the symbol / fixup information.  Although it's
> > technically accurate that it's metadata for the property bytestrings,
> > in most contexts "metadata" makes me think only of tree global
> > metadata.  By analogy, symbols and fixup information in a .so or .a
> > could be seen as metadata to the raw code / data bytes, but I wouldn't
> > normally use that term for it (whereas I might for, say, the soname or
> > certain .note sections).
> >
> > > With the suggestion you did on patch 6 related to FDT_REF_LOCAL and i=
f I
> > > understood correctly, you expect to have a kind of "container" tag to=
 group
> > > metadata on each level.
> > >
> > > Also you expect to have the ability to handle all 'for now unknown' t=
ag
> > > smoothly and so, I agree, the length of the data related to a tag are
> > > needed to be present with the tag itself. I see to kind of tag, some =
with
> > > the length of data available in the u32 following the tag and other w=
ithout
> > > the length encoded.
> > >
> > > Tags without length encoded are followed by one u32 field containing =
data
> > > related to the tag. This allow to avoid a lot of 'TAG_XXX 0x04 u32_da=
ta'
> > > Indeed, I have the feeling that quite a lot of tags will have only on=
e u32
> > > field as data part and so, having 0x04 encoded (cell aligned) each ti=
me.
> > >
> > > A tag value is on 32bits. We can define the structure of this value.
> > >   - bit 31 (msb):
> > >      - 0: This is not a new kind to tag and so it doesn't follow this=
 definition.
> > >           All existing tags are in this categorie
> > >      - 1: New kind of tag adopting this definition
> > >
> > >   - bits 30..28:
> > >      tag data length encoding
> > >      0b000: No data related to the tag
> > >      0b001: 1 data cell (u32) directly follows the tag
> > >      0b010: 2 data cells (2 u32) directly follow the tag
> > >      ...
> > >      0b110: 6 data cells (6 u32) directly follow the tag
> > >      0b111: Tag is followed by a cell (u32) indicating the size (in b=
ytes)
> > >             of data available just after this cell (including any pad=
ding
> > >             if needed).
> > >         Because this size include some possible padding, its value is=
 a
> > >             multiple of 4 bytes.
> > >             The offset of the tag + 4 + size points to the next tag.
> > >
> > >
> > >   - bit 27..0
> > >      tag specific identifier
> >
> > As noted elsewhere, I'm not necessarily opposed to having a general
> > length encoding.  However, for each new tag I think we need to think
> > carefully about whether it really is safe for older software that
> > doesn't understand it to just skip it.
> >
> > > With that definition, the following tags can be defined:
> > >   - FDT_INFO_PROPERTY (new tag, length encoding): 0xf0000001
> > >      This tag is available after a property.
> > >      It is followed by a cell for the length of data, the data part i=
s a
> > >      sequence of tags (and related data) giving information related t=
o the
> > >      last property available before the tag.
> >
> > I'd prefer to avoid an additional layer of nesting here - I'd rather
> > just have multiple top level tags.
> >
> > >   - FDT_REF_LOCAL (new tag, 1 cell data): 0x90000002:
> > >      The cell after this tag is the offset in the property where a lo=
cal
> > >      phandle is available
> > >
> > >   - FDT_REF_PHANDLE (new tag, length encoding): 0xf0000003
> > >      Cf. patch 11 for definition
> > >      It is followed by a cell for the length of data. The data part i=
s
> > >      composed of:
> > >        - offset (u32)
> > >        - label (string including \0)
> > >        - padding if needed to have next item aligned on 32bits
> > >
> > >
> > > With that defined, supposing the following dts example:
> > >   --- 8< ---
> > >   /* 'foo' is a reference to local node,
> > >    * 'bar' is a reference to an external node
> > >    */
> > >   prop =3D <1 2 &foo &bar1>;
> > >   --- 8< ---
> > >
> > > The dtb will see the following structure:
> > > FDT_PROP ...
> > > FDT_INFO_PROPERTY (0xf0000001)
> > >   28 (length =3D (4+4)+(4+4+12) bytes)
> > >   FDT_REF_LOCAL (0x90000002)
> > >     0x8                             <--- offset of &foo
> > >   FDT_REF_PHANDLE (0xf0000003)
> > >     12 (length =3D 4+4+1+3 bytes)
> > >     0xc                             <--- offset of &bar
> > >     "bar1" + its \0                 <-- reference to resolve
> > >     0x00 0x00 0x00                  <-- 3 bytes padding
> > >
> > > Adding FDT_TYPE_U32 later will consist in defining
> > > its value, probably a 0x9 family (1 cell after the tag for the
> > > offset value)
> > >
> > > At any point, only looking at the higher part of the tag (i.e. 0xN...=
....), we
> > > can skip the tag and its data if don't know about the tag.
> > >  - 0x0: Old tag format
> > >     -> Error if unknown
> > >
> > >  - 0x8 to 0xe: New format followed by 0 (0x8) to 6 cells of data
> > >     -> Ignore if unknown and skip the N cells of data to look at the =
next
> > >
> > >  - 0xf: New format followed by 1 cell giving the size of following da=
ta.
> > >     -> Ignore if unknown and read the length available in the cell af=
ter the
> > >        tag, skip length byte of data to look at the next.
> > >        If the length read is not a multiple of 4: Error, invalid tag.
> > >
> > >
> > > For this series we need the container tags:
> > > - FDT_INFO_PROPERTY for information related to a property
> > >   Among known tags defined in this series, only FDT_REF_LOCAL and
> > >   FDT_REF_PHANDLE can be grouped into a FDT_INFO_PROPERTY.
> > >
> > > - FDT_INFO_NODE for information related to a node
> > >   Among known tags defined in this series, only FDT_EXPORT_SYM_LOCAL
> > >   and FDT_EXPORT_SYM_REF can be grouped into a FDT_INFO_NODE.
> > >
> > > - FDT_INFO_DTB for information related to the dtb
> > >   Among known tags defined in this series, only FDT_IMPORT_SYM can
> > >   be present into a FDT_INFO_DTB.
> > >
> > > IMHO, the new tag FDT_BEGIN_NODE_REF related to orphan nodes doesn't
> > > have to be in one of those containers. Indeed, FDT_BEGIN_NODE_REF
> > > is more a node definition than a metadata.
> >
> > That's a perfect example of a new tag that absolutely cannot be just
> > skipped if not understood.  Software *must* hard error if they
> > encounter this and don't understand it.
> >
>
> I have started to implement this "unknown tag" feature based on the tag
> values definition presented here and with complementary feature (bit
> allowing to skip an unknown tag) as presented in patch 2 discussion [1].
>
> I didn't introduce any FDT_INFO_xxx tags. They introduce nesting tags
> and David seems not agree with that.
>
> I use simple test tags to have some "unknown tags" in dtb and looked at
> the way to handle them.
>
> When we read a dtb, no problem, we just skip "unknown tags" if we are
> allowed to (flag in tag value).
>
> The issue comes when we modify a dtb.
>
> libftd allows to modify a dtb. It allows to add/modify/remove properties
> and nodes. Bootloaders for instance use this capability to update a dtb
> before passing it to the kernel.
>
> How should we handle unknown tags in this context?
>
> We don't knwow about the meaning of those tags (unknown tags) and so, we
> don't know if those tags are still consistent with modifications done?

I don't think we have any choice, but to remove the tags.

> A property can be followed by an unknown tags related to this property.
> Also a property can be followed by an unknown tag related to the node.
> We simply don't know.

We should be able to distinguish between node and property tags at
least. Either by value or location. IOW, node tags must follow a
BEGIN_NODE tag and property tags must follow a property.

> Any modification can impact unknown tags and make them inconsistent.
> Here again, we simply don't know.
>
> Should we avoid any modification when a dtb contains unknown tags?

You answered that below. :)

> Should we simply remove all unknown tags when a modification is done?

For that node or property, yes. For the whole DTB, no. Though does
modifying a property constitute modifying a node?

>
> Bootloaders need to modify the dtb. Avoiding modification is a no-go.
> Removing "unknown tags" when a modification is done will lead to removing
> all unknown tags at bootloader stage.
>
> Rob, David, any opinion related to this specific issue and the strategy w=
e
> should follow when modification are involved?

Perhaps we should separate the 'version we can read' and the 'version
we can write'. Let's say it is v18 that allows unknown tags, but v19
that actually adds any specific tags (or adds tags that are not safe
to ignore). Then a DTB with last_compat_version=3Dv18 and version=3Dv19
can be read by libfdt supporting v18+, but requires v19 libfdt to
write it. We'd still have to allow writing a v19 DTB with v18 libfdt,
but we'd have to downgrade the version to v18 (or downgrade if we had
to drop some tags).

The DT and bootloader/firmware are typically bundled together and in
that case there shouldn't be an issue of different versions. You can
have a newer DTB instead of the firmware one, but that doesn't need to
have the new tags (if the OS does require them, then it broke
compatibility).

Even with this series, I think everything can be ignored if you are
only looking for compatibility with what we have now. It's only if you
want to support the addons, then you need v?? which defines the set of
tags for addons. So I'm not certain a tag bit is the right way to say
safe to ignore or not. I think if we have a new tag that every client
has to understand and handle, then that's a major version change. I
think the original intent with the versions was 0x10 (aka 16) was a
new major version, 0x13(v18) would be another minor rev, and 0x20
would be the next major version.

Rob
