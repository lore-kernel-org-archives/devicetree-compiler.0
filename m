Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019415;
	b=GBqN2LEJ8OM6TuxTxeCJxezsKxIXhRrpSMPnvN1LhYxlO/bfbBfpmzTTLaQQRgJwj16+
	 fTcD1FP+gO9yNbB7rmjfSmvXLmgON3zSYXrJiTUpjrG3PN2Zc1Si9VFNl0h4i9HrbXSV3
	 BDk65x5sA+Flw0B6uM9kTv6UkUSZBEH95CEdgUlEpqf2IJOw+ITncKFWJWjotKMqnnjOT
	 Y2GI9hKVVbJr5tNI4u4ElWKq2xH8R0/maQyXsBmQ+jdWuE0+IXnmeJJbMdUBv7XRnBPEa
	 a5fkMSdtjdINGMof3yMlJwGvBPbh8KIqyifvJToaCuztpMatFF0OA33NUmDGYwrz96g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=4PVdxrjj92YH7Ioge0Z5YUxeZALza2C/7gTr5CnJ08U=;
	b=ZsKXKQwpEscgR3qGDE2K1rYUuBnDAuBKobPKyYB+XC32hvey2hoxDF4zlq3xWaWnH6BI
	 ozZbhIV7ts59IBsZqpF478lxOOC+lSwgPExQHBY4Zp5alBIIA9h2ULMUm3EtNMWQighJj
	 DodSd+A8Kbqixvl4FFhlppqPCox6Y39OB/GP56QyTLBybuxD50aCVPD+GWdyAtKZ27cZo
	 3psuHy3AVDa58hRNtZ30f/HKnx0daFUtCuaxfVfk+oYWRsNplecB7gxvO9CJa261x5AYq
	 TI/GW3vKieqOhqS2SvLiNJCH6Jp5bgYJULLVdijANTjFzbpxeT+aC96YaGZqHp/h+dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="jZu/4u8d";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15875606A33D
	for <Devicetree-compiler@vger.kernel.org>; Sat,  7 Nov 2026 02:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15875606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jZu/4u8d
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c414e5d282eso165546666b.1
        for <Devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 18:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794019413; x=1794624213; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PVdxrjj92YH7Ioge0Z5YUxeZALza2C/7gTr5CnJ08U=;
        b=jZu/4u8d6HWlVIgeu6dMhxefrFR5/m1nHKCAIXYnsP+D8KU5DJHSLmtxDj5qS3feGT
         ReNaWtc5xlQFheUCOvXM5+SPYV/RvILQXH32ZOeFHY70xxG0nPMJtYE/Af1i6CyhHmEt
         zBya0/mfjw+iAvqVktlZlfFLdld/8Pn7tKTSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019413; x=1794624213;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4PVdxrjj92YH7Ioge0Z5YUxeZALza2C/7gTr5CnJ08U=;
        b=aEayP/uY4BeMotBgb40ZmU5tX6aIRQvGAMfmga0Ubqu+p2+zi2AIrbCkrc74by81Fh
         4MKnz/wnfsZyz0e2Z9QmBAPpqLpqkyytr74X7GYjiWV3b1oqpjD4bdozdXIeIq8SlTj8
         cUZfmiiLUMozzj49Yg4rZx7nJWvFN8FBpNB/dFc7ZjO1oni7/KA9dWnT2MoMR9McnWzo
         o27E9/l7i6EPM67Hftcel05xLFQQoME4dIhLfBbEVlvqr0nYWnEKQVi9nRblyWepmuo2
         kGViX1muVIlyVN4n1oUuEwtMGcikX7nZRe/lRphW4UQ+12Ghtf7nMYN66mM/jJr62WQN
         j0HQ==
X-Gm-Message-State: APuU4Z9fFROBUEcOg9HhZSuNM6OJTJ98nbRdJAyzatgKLjcF1mJvrQ+R
	P0/CsHw7MLKJ+d1WGLCAe/Mdp/zfsgxPrzUwu1nkftXOaRA1CkGUJcjpOz01WXKvoU/+kEh6JkJ
	t9yvp58rS
X-Gm-Gg: AYBFou2VXvPCfrTARd3eWXgIhd74aGXX8EE/KNHNkCTVyiurzz4HxLa50IVoMWn6aYP
	1sZYDPut2gWIpttI0oHi7wAvQ4XS01N6Uf/KpgpzgsptykJdpxBV5vg0EkZ0VoOlv4IopyV03DE
	LGMigUAC5gYpTXik6fm8IYnWFvPZ1ONYFJ91I0J8tTbBxG/9qU1Dkpz4AYqou2lMkPhQlKU1acd
	L+xmvKqBS9s43YX74cMKvT5bETrRSprCphLCo69b5KfFxfSO9P5cxaFywQBou88SGXmJg35OD/7
	P1P2PIB/AfPMzmIlduocLpxfaZ0qYBA3h9q78HBke02ycd5ywpF7OZNrDRaf/z0pe/m45lxEKnm
	U+VeYu7+wRId1JM1j6WD8l7taEMEijlYLCHF1hiYQ5vJSJeKyK6nN4DTQvo3EoS1d3ZGPfk2tJv
	JqJyrvizyLOBu1Qri8uN/n6AYnh3/zE+CPCxubTR7Jbjn1QZ3lumJK+EEv7CR9FtVecukKUxqt6
	cGwmczIRP95IyRhfd8nxPl4pk4pH9CrIhZoENceUK6VIRMtYMsYZEFFgZR4XYbDXLM//Az55H2O
	22pJQCsXY8w+vif57LeH/5hj1d7cB9LAcSlYt41EfBakD5U8YvdhcrvOf1DGZ++VnIw=
X-Received: by 2002:a17:906:794e:b0:c29:f5d5:5a9c with SMTP id a640c23a62f3a-c4d34cb5099mr351088966b.38.1794019413497;
        Fri, 06 Nov 2026 18:43:33 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562df86sm119093866b.24.2026.11.06.18.43.31
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 18:43:31 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so13909095e9.1
        for <Devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 18:43:31 -0800 (PST)
X-Received: by 2002:a05:6000:41fb:b0:48c:49bd:62df with SMTP id
 ffacd0b85a97d-49272a39cd8mr7633241f8f.1.1794019410521; Fri, 06 Nov 2026
 18:43:30 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
In-Reply-To: <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 18:43:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
X-Gm-Features: AclHuK8Xumyik2VqnkjFm63bJgkuewGEq01Nnd9YLjze9SUsNf5q53Jz9OESWbY
Message-ID: <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Wed, Nov 4, 2026 at 6:08 AM Simon Glass <sjg@chromium.org> wrote:
>
> Hi Doug,
>
> On Sun, Nov 1, 2026 at 4:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > Add `devicetree.py` providing `DeviceTree`, a non-flattened in-memory
> > representation of a devicetree node and its subtree:
>
> Please can you start with the motivation, i.e. why a live tree is
> needed and what will use it? The list below mostly repeats the
> docstrings.

Makes sense. In my draft v4 I've updated the commit message to lead
with the motivation and condensed the summary so it doesn't repeat the
docstrings:

    `pylibfdt`'s `Fdt` and `FdtRo` classes operate directly on flattened
    device tree blobs, where inserting or deleting nodes and properties
    shifts subsequent node offsets. That works well for in-place queries and
    localized edits, but makes multi-tree comparison, structural diffing,
    and bottom-up tree construction (as needed by the upcoming `fdtfactor`
    tool) awkward and error-prone.

    Add `pylibfdt/devicetree.py` providing `DeviceTree`, an in-memory live
    tree representation where each node holds `props` (a dict mapping
    property name to `libfdt.Property`) and `children` (a dict mapping child
    node name to child `DeviceTree`), along with `unflatten()` and
    `flatten()` to convert between `FdtRo`/`Fdt` blobs and live trees, and
    helpers for path lookup, node creation, and pre-order traversal.

    Add unit tests in `tests/devicetree_tests.py` covering `DeviceTree`
    round-tripping, subtree unflattening, duplicate-name and corrupt-tree
    rejection, and navigation helpers.

> > diff --git a/devicetree.py b/devicetree.py
> > new file mode 100644
> > index 0000000..f81b8fc
> > --- /dev/null
> > +++ b/devicetree.py
> > @@ -0,0 +1,226 @@
> > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> > +"""devicetree - Non-flattened in-memory device tree representation in Python."""
>
> I'd forgotten about this but PyPI has Zephyr's python-devicetree
> [1][2], which installs a top-level 'devicetree' package.
>
> I'm not sure what to suggest. Would libfdt_devicetree be too awful?

Right. I'm OK with libfdt_devicetree. David: do you have any objections?


> > +    @classmethod
> > +    def unflatten(cls, fdt, offset=0):
> > +        """Unflatten an FdtRo subtree starting at `offset` into a DeviceTree.
> > +
> > +        Args:
> > +            fdt: An `FdtRo` (or `Fdt`) instance.
> > +            offset: Starting node offset (default 0 for the root node).
> > +
> > +        Returns:
> > +            A `DeviceTree` representing the node at `offset` and its
> > +            descendants.
> > +
> > +        Raises:
> > +            ValueError: If a node contains duplicate property names or
> > +                duplicate sibling subnode names.
> > +        """
> > +        node = cls()
> > +        for prop in fdt.properties(offset):
> > +            if prop.name in node.props:
> > +                raise ValueError(f'Duplicate property {prop.name!r}')
> > +            node.props[prop.name] = prop
> > +        for suboff in fdt.subnodes(offset):
> > +            subname = fdt.get_name(suboff)
>
> We should try to stop on a corrupt tree - so I think this needs error-checking.

In my draft v4, I've rewritten `unflatten()` to a single pass and the new
implementation should catch this. I've also added a `testCorruptTree()` unit
test in `tests/devicetree_tests.py` to verify this.


-Doug
