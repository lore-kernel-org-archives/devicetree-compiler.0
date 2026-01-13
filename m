Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D634EF10
	for <devicetree-compiler@vger.kernel.org>; Tue, 13 Jan 2026 18:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768329860; cv=none; b=pRkBvpZWipyvyH/W1KUngqLpgi6YDwCTG6dLF9brFZMIUhqdURY2rRCv8y0rvuVaC0nARJM9l7tPEB4xXRD7jKr/pf+fRtnfQU7/oUc3GpLQ+B6/JsILpZg6/kFL+j1iDrPTbQqbQsKtsHd0Wk7iG+bUPQwGTY/o7bAvhWS+048=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768329860; c=relaxed/simple;
	bh=YmnpZrWEYb3owOC5vtn94wPb4Hzl5Nku4ksMZFuEwp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOBFAskAry9ZHZ9uu8IhPwUIAbp0PxNe0JdeXx7hl4GwSpQhYHOxXn2I3aoQfUBlCFkvP0jF+/aWxs2puVwWl3yULuklPJ6aydoapMTQcoe0Ged1S43hxF0aBg05Ar6f+W7YvHkYolAsVYdsCd6FyLVCGb94OG90b6GphlcrevI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbE5hG6V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbE5hG6V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C13C19425
	for <devicetree-compiler@vger.kernel.org>; Tue, 13 Jan 2026 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768329860;
	bh=YmnpZrWEYb3owOC5vtn94wPb4Hzl5Nku4ksMZFuEwp4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TbE5hG6VLArRtn5yxOif6UZSF38ExWPiot/Cc+i2UzW3MceYCdbml9u+pR4DEwGtY
	 RVIGQwP5bATFrELRPK9JXKJ3PnrdugWNpNJctEendTdvTbflJiopDcgjFapCzUK4+8
	 9Cv36vqQRlyIE87lq05Mxgbpn5W5Ps4bzbpWKYp9T3ra/l89+aLgDezwg44u8ut+X3
	 BPqvs3VCE1uPDkQjUezp2mRUWvb7JPzytYwdpLX8pOPu6uSVKngcsU8u7aDQK+aWE4
	 pxwfe9tQp6cyuxCpwqArJjel/REBPCf6/J+NDcw/jFInCBE0jJNvpcyEUbSgftEZ1g
	 i54Bq8EqNSlYw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b802d5e9f06so1119801866b.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 13 Jan 2026 10:44:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiGW2j4PnJdUslgr8nKZ6hgY8fdxN92//02RkRM3PhPki3caX7e0BvfrRbUA4mbfiFZTJosumLxj+bLsFAx0aUHFqK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+mtlJ1pVhYybR0t3BC5r9umL+e1g/u5NP1/w79JmII0pm0ND0
	TQzNeavlEHu1MNQX4whE0otIT8O9AGmj6No+lMkCzYHX3zmxAIwTYccnNafuaA3YyXKLQAVb/Uv
	6YTSCQOdaC6mjAg+psGw6SWHh2gCAqQ==
X-Received: by 2002:a17:907:1dd9:b0:b87:2410:5957 with SMTP id
 a640c23a62f3a-b87612c9af7mr5133566b.48.1768329858499; Tue, 13 Jan 2026
 10:44:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
In-Reply-To: <20260112142009.1006236-1-herve.codina@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Jan 2026 12:44:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK4nH0B-CfKz5wgg12C+Vzi31ceHeOes94Z8hg3uN=X1g@mail.gmail.com>
X-Gm-Features: AZwV_QguzAJ6QjUogFRm5vtmFPkPYOitVYkV6P63_cFT_2dOb18frP9V1_1V-Kw
Message-ID: <CAL_JsqK4nH0B-CfKz5wgg12C+Vzi31ceHeOes94Z8hg3uN=X1g@mail.gmail.com>
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

On Mon, Jan 12, 2026 at 8:20=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> This big picture series adds support for dtb metadata and addon
> device-trees.
>
> Before giving details about the series content, let me give a little bit
> of context.
>
> The use-case is to support additional boards that can be hot-plugged to
> a connector available in a base board. This connector is standardized in
> terms of resources available on each pin. Any additional boards
> compatible with the connector should be able to be connected to base
> board and all base boards where this connector is implemented should
> support any additional boards.
>
> TLDR: The last patch, patch 77, gives an example of dts and dtsa (new
>       addon device-tree) handling this use-case. It provides an example
>       of a realistic base board description (dts) and an realistic
>       additional board description (dtsa).

From a quick scan, that seems reasonable looking to me. The main thing
that got my attention was the namespace labels thing which I'll need
to study more.

> Each base board is described by its own device-tree and the real
> resource connected to the connector depends on each board. For instance
> an i2c bus on the connector can come from the i2c1 controller from base
> board A and i2c5 controller from base board B. This is obviously the
> case for all resources wired to the connector.
>
> On the other hand, the device-tree describing the additional board has
> no reason to be changed based on the base board the additional board is
> going to be connected. Indeed this device-tree describes the additional
> board hardware and this hardware doesn't change if the additional board
> is connected to the base board A or the base board B.
>
> In order to extend a device-tree at runtime, a device-tree overlay can
> be used. The drawback of current overlay implementation is that an
> overlay is tightly coupled with the base device-tree it is applied to.
>
> If a symbol of the base device-tree has to be used by the overlay, all
> symbols available in the base device-tree need to be visible by the
> overlay and the overlay can use only those symbol without any kind of
> name translation.
>
> With current overlay implementation, a overlay depends on the base
> board. Indeed, if an overlay wants to add an I2C device on the I2C bus
> available on the base board A connector, it needs to reference the i2c1
> bus whereas it needs to reference the i2c5 bus if it used with the base
> board B.
>
> In order to fix the issue, the 'export symbol' concept has been
> proposed. This concept allows some specific node to 'export' symbols in
> order to be seen by an overlay applied to this node.
>
> The use-case and the export symbol proposal have been detailed during
> a talk at ELCE 2025. Have a look at the slides [1] and/or the video [2]
> to have a clear view of the topic
>
> [1] https://bootlin.com/pub/conferences/2025/elce/ceresoli-hotplug-status=
.pdf
> [2] https://www.youtube.com/watch?v=3DC8dEQ4OzMnc
>
> The export symbol proposal based on an export-symbol node in the
> device-tree have been rejected by device-tree and dtc maintainers.
>
> A discussion about the topic has been started on the mailing-list [3].
> This discussions led to:
>
> - The addition of meta-data in dtb instead of having __fixup__, __local__=
fixup__,
>   an similar nodes in the device-tree used by overlays
>
> - A new kind of device-tree, an addon device-tree, in order to replace th=
e
>   usage of the overlay device-tree in this 'hot-plugging additional board=
'
>   use-case.

I guess "addons" is overlays 2.0. Do you envision any use for overlays
1.0 after this? I wouldn't think so other than compatibility for
existing overlays.

Maybe a conversion tool and/or function would be useful (not asking
for that now).

> [3] https://lore.kernel.org/all/20250902105710.00512c6d@booty/
>
> This current RFC is the implementation of features discussed on the
> mailing-list. A lot of things are new in dtb format (new tags) and dts
> format (new keyword, new kind of references) and not yet mentioned in
> the standard.

spec follows code. :)

> The purpose of this big picture RFC is to move forward on this topic
> based on code and some concrete dts / dtb example. Indeed, this RFC also
> adds tests for each feature introduced. Those tests are performed using
> dts files and the content of those dts files can also help in the
> discussion.
>
> The first patch is just a simple fix and can probably be merged out of th=
is
> meta-data and addon discussion.
>
>   - Patches 2..12: Introduce new meta-data dtb tags based on markers
>
>     Those new tags are FDT_REF_LOCAL and FDT_REF_PHANDLE.
>
>     FDT_REF_LOCAL (details in patch 6) is used to tag property using a
>     phandle and this phandle points to a local node (i.e. a node
>     existing in the dtb).
>
>     FDT_REF_PHANDLE (details in patch 11) is used to tag a property
>     using a phandle but this phandle points to a non local node (i.e.
>     the node doesn't exist in the dtb). The reference to the node is
>     present with the tag and the phandle value has to be fixed when the
>     dtb is applied. This tag can only be present in plugins (overlays)
>     and addons dtb.

This is very much aligned with what I would like to see. We've
discussed new DTB formats in the past and it becomes a laundry list of
changes likely resulting in something entirely different. I think
that's never going to move forward (it's only been discussed for 10+
years). I think doing something like this is much easier to define and
deploy.

I think the first step is just allowing the FDT format to have
additional tags with metadata that's not yet defined. Ideally that
would be just "allow unknown tags" instead of giving a parsing error.
However, I think we have to at least know the length of data for
unknown tags, so maybe we define a range of tag values which are
followed by a length. Either way, that should be a pretty small change
and easily deployed everywhere (that uses libfdt). After that, then we
can start to define the specific tags and meta-data we want. I would
like to see not just phandle info, but all type information for
example.

The addition of phandle info is also useful for fw_devlink (which is
the kernel's device dependency tracking), and I've been talking with
Saravana some about an approach like this.

>   - Patches 13..17: Introduce addons device-tree
>
>     This part introduce the new /addon/ dts keyword
>
>   - Patches 18..30: Introduce /export/ keyword and related dtb tags
>
>     This part introduces the new /export/ dts keyword (details in patch
>     20) and the related FDT_EXPORT_SYM and FDT_EXPORT_SYM_REF dtb tags.
>
>     FDT_EXPORT_SYM (details in patch 25) is used when the exported
>     symbol involved is a local node and FDT_EXPORT_SYM_REF (details in
>     patch 29) is used when the node involved is a non local node.

More generally, would these just be "node metadata" tags?

Rob
