Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2FD3A35C5;
	Wed, 14 Jan 2026 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768407514; cv=none; b=iKIXY2fD7HOtG/xZTr+bPqlh3Vx4zAzXPdzIrRDdPIy9PMNFTASxPcWiaUokaAwD56ZtkS5GRUk2kFVE6c+NQ+JzgRkpswcpN20fibSDAG+x32k7yc1g0cQD5mr1X/Ptd3vNUnWCsTLrthrQP9EPQwGHHYDVriq3dLJbBy88g/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768407514; c=relaxed/simple;
	bh=LkS1aFv+C1O9U2Z5sGYXPWpC6E4J1ceA2kJ7wPxqjhg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=btK7bm0z6ENLM2urlsb5AFD57vyL2s9yziS3oNaHD1/cFG/S9+x2JisSFsgWhDVmxjxJomeCZGhrbko6jIUWwtIW46mFJ66BDl13yTb+wRoJ450obkT5JEygIFmkrEQgYggUatV3N/Sy88onF9SfHFGDJOgXJkEeWVuqDf6TllM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F+0Rp8FP; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F+0Rp8FP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C13F5C1F6DB;
	Wed, 14 Jan 2026 16:18:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69EEC6074A;
	Wed, 14 Jan 2026 16:18:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A905010B6828C;
	Wed, 14 Jan 2026 17:18:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768407509; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TLnD61qP5ZBMkv6EgFlAJDkzsgnOcSQSowMp8xouw7g=;
	b=F+0Rp8FPhiiRLgvAQ03fhy7d8ubzYat3E0MMNidZYeHj7//bV08vlAE/jpLi87LdoTnl63
	s+dS4bk7TxpnPnxL37f84WU7pCh78dcR+gqP/feiN0XfGvVG9E65QDxMDBL1xdhuaKV1+B
	dZpyyFTzZAQ4mqUOoFgozj13MlhXthc2MU1e60yTzMZWlwErfFmQ39WXw2jOvk/hq2UoLC
	NLUj4+sLunYZltCnM6ozBOCu7YMwJahOf3qynh9GEm5Qdu7ayCPg6HxhPWhWbwLlRrDhIv
	VDXJ7+PE71D9cymMdq0YrpvEKeZF4qZw5Wje/CNu0n/BRvF+mZFC0NNaBIo3EA==
Date: Wed, 14 Jan 2026 17:18:22 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Krzysztof Kozlowski
 <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ayush Singh
 <ayush@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Hui Pu
 <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@kernel.org>
Subject: Re: [RFC PATCH 00/77] Add support for dtb metadata and addon
 device-trees
Message-ID: <20260114171822.2a44d2a5@bootlin.com>
In-Reply-To: <CAL_JsqK4nH0B-CfKz5wgg12C+Vzi31ceHeOes94Z8hg3uN=X1g@mail.gmail.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<CAL_JsqK4nH0B-CfKz5wgg12C+Vzi31ceHeOes94Z8hg3uN=X1g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Rob,

On Tue, 13 Jan 2026 12:44:07 -0600
Rob Herring <robh@kernel.org> wrote:

> On Mon, Jan 12, 2026 at 8:20 AM Herve Codina <herve.codina@bootlin.com> wrote:

...

> >
> > - A new kind of device-tree, an addon device-tree, in order to replace the
> >   usage of the overlay device-tree in this 'hot-plugging additional board'
> >   use-case.  
> 
> I guess "addons" is overlays 2.0. Do you envision any use for overlays
> 1.0 after this? I wouldn't think so other than compatibility for
> existing overlays.

On my side, with use cases I know about, I plan to switch to addons.

Of course, our connector use case which was the use case that leads to
series will use addons.

Also, I plan to move the overlay used in the LAN966x PCI use case (overlay on
top of PCI devices) to addons. I will do that when all needed support for this
feature will be available in the Linux kernel.

> 
> Maybe a conversion tool and/or function would be useful (not asking
> for that now).

Indeed, this kind of tool could be a nice to have.

> 
> > [3] https://lore.kernel.org/all/20250902105710.00512c6d@booty/
> >
> > This current RFC is the implementation of features discussed on the
> > mailing-list. A lot of things are new in dtb format (new tags) and dts
> > format (new keyword, new kind of references) and not yet mentioned in
> > the standard.  
> 
> spec follows code. :)
> 
> > The purpose of this big picture RFC is to move forward on this topic
> > based on code and some concrete dts / dtb example. Indeed, this RFC also
> > adds tests for each feature introduced. Those tests are performed using
> > dts files and the content of those dts files can also help in the
> > discussion.
> >
> > The first patch is just a simple fix and can probably be merged out of this
> > meta-data and addon discussion.
> >
> >   - Patches 2..12: Introduce new meta-data dtb tags based on markers
> >
> >     Those new tags are FDT_REF_LOCAL and FDT_REF_PHANDLE.
> >
> >     FDT_REF_LOCAL (details in patch 6) is used to tag property using a
> >     phandle and this phandle points to a local node (i.e. a node
> >     existing in the dtb).
> >
> >     FDT_REF_PHANDLE (details in patch 11) is used to tag a property
> >     using a phandle but this phandle points to a non local node (i.e.
> >     the node doesn't exist in the dtb). The reference to the node is
> >     present with the tag and the phandle value has to be fixed when the
> >     dtb is applied. This tag can only be present in plugins (overlays)
> >     and addons dtb.  
> 
> This is very much aligned with what I would like to see. We've
> discussed new DTB formats in the past and it becomes a laundry list of
> changes likely resulting in something entirely different. I think
> that's never going to move forward (it's only been discussed for 10+
> years). I think doing something like this is much easier to define and
> deploy.
> 
> I think the first step is just allowing the FDT format to have
> additional tags with metadata that's not yet defined. Ideally that
> would be just "allow unknown tags" instead of giving a parsing error.
> However, I think we have to at least know the length of data for
> unknown tags, so maybe we define a range of tag values which are
> followed by a length. Either way, that should be a pretty small change
> and easily deployed everywhere (that uses libfdt). After that, then we
> can start to define the specific tags and meta-data we want. I would
> like to see not just phandle info, but all type information for
> example.
> 
> The addition of phandle info is also useful for fw_devlink (which is
> the kernel's device dependency tracking), and I've been talking with
> Saravana some about an approach like this.
> 
> >   - Patches 13..17: Introduce addons device-tree
> >
> >     This part introduce the new /addon/ dts keyword
> >
> >   - Patches 18..30: Introduce /export/ keyword and related dtb tags
> >
> >     This part introduces the new /export/ dts keyword (details in patch
> >     20) and the related FDT_EXPORT_SYM and FDT_EXPORT_SYM_REF dtb tags.
> >
> >     FDT_EXPORT_SYM (details in patch 25) is used when the exported
> >     symbol involved is a local node and FDT_EXPORT_SYM_REF (details in
> >     patch 29) is used when the node involved is a non local node.  
> 
> More generally, would these just be "node metadata" tags?
> 

I think we can have metadata at 3 differents levels:
- Property
- Node
- Global dtb

With the suggestion you did on patch 6 related to FDT_REF_LOCAL and if I
understood correctly, you expect to have a kind of "container" tag to group
metadata on each level.

Also you expect to have the ability to handle all 'for now unknown' tag
smoothly and so, I agree, the length of the data related to a tag are
needed to be present with the tag itself. I see to kind of tag, some with
the length of data available in the u32 following the tag and other without
the length encoded.

Tags without length encoded are followed by one u32 field containing data
related to the tag. This allow to avoid a lot of 'TAG_XXX 0x04 u32_data'
Indeed, I have the feeling that quite a lot of tags will have only one u32
field as data part and so, having 0x04 encoded (cell aligned) each time.

A tag value is on 32bits. We can define the structure of this value.
  - bit 31 (msb):
     - 0: This is not a new kind to tag and so it doesn't follow this definition.
          All existing tags are in this categorie
     - 1: New kind of tag adopting this definition

  - bits 30..28:
     tag data length encoding
     0b000: No data related to the tag
     0b001: 1 data cell (u32) directly follows the tag
     0b010: 2 data cells (2 u32) directly follow the tag
     ...
     0b110: 6 data cells (6 u32) directly follow the tag
     0b111: Tag is followed by a cell (u32) indicating the size (in bytes)
            of data available just after this cell (including any padding
            if needed).
	    Because this size include some possible padding, its value is a
            multiple of 4 bytes.
            The offset of the tag + 4 + size points to the next tag.
          

  - bit 27..0
     tag specific identifier

With that definition, the following tags can be defined:
  - FDT_INFO_PROPERTY (new tag, length encoding): 0xf0000001
     This tag is available after a property.
     It is followed by a cell for the length of data, the data part is a
     sequence of tags (and related data) giving information related to the
     last property available before the tag.

  - FDT_REF_LOCAL (new tag, 1 cell data): 0x90000002:
     The cell after this tag is the offset in the property where a local
     phandle is available

  - FDT_REF_PHANDLE (new tag, length encoding): 0xf0000003
     Cf. patch 11 for definition
     It is followed by a cell for the length of data. The data part is
     composed of:
       - offset (u32)
       - label (string including \0)
       - padding if needed to have next item aligned on 32bits


With that defined, supposing the following dts example:
  --- 8< ---
  /* 'foo' is a reference to local node,
   * 'bar' is a reference to an external node
   */
  prop = <1 2 &foo &bar1>;
  --- 8< ---

The dtb will see the following structure:
FDT_PROP ...
FDT_INFO_PROPERTY (0xf0000001)
  28 (length = (4+4)+(4+4+12) bytes)
  FDT_REF_LOCAL (0x90000002)
    0x8                             <--- offset of &foo
  FDT_REF_PHANDLE (0xf0000003)
    12 (length = 4+4+1+3 bytes)
    0xc                             <--- offset of &bar
    "bar1" + its \0                 <-- reference to resolve
    0x00 0x00 0x00                  <-- 3 bytes padding

Adding FDT_TYPE_U32 later will consist in defining
its value, probably a 0x9 family (1 cell after the tag for the
offset value)

At any point, only looking at the higher part of the tag (i.e. 0xN.......), we
can skip the tag and its data if don't know about the tag.
 - 0x0: Old tag format
    -> Error if unknown

 - 0x8 to 0xe: New format followed by 0 (0x8) to 6 cells of data
    -> Ignore if unknown and skip the N cells of data to look at the next

 - 0xf: New format followed by 1 cell giving the size of following data.
    -> Ignore if unknown and read the length available in the cell after the
       tag, skip length byte of data to look at the next.
       If the length read is not a multiple of 4: Error, invalid tag.


For this series we need the container tags:
- FDT_INFO_PROPERTY for information related to a property
  Among known tags defined in this series, only FDT_REF_LOCAL and
  FDT_REF_PHANDLE can be grouped into a FDT_INFO_PROPERTY.

- FDT_INFO_NODE for information related to a node
  Among known tags defined in this series, only FDT_EXPORT_SYM_LOCAL
  and FDT_EXPORT_SYM_REF can be grouped into a FDT_INFO_NODE.

- FDT_INFO_DTB for information related to the dtb
  Among known tags defined in this series, only FDT_IMPORT_SYM can
  be present into a FDT_INFO_DTB.

IMHO, the new tag FDT_BEGIN_NODE_REF related to orphan nodes doesn't
have to be in one of those containers. Indeed, FDT_BEGIN_NODE_REF
is more a node definition than a metadata.

Rob, does this could fit with what you expect?

If it does, is it relevant to keep the length cell available in 0xf
family to be in bytes. It should be a multiple of 4 in all cases and
so it can be given in the number of 32bit words instead of bytes.

Best regards,
Hervé

