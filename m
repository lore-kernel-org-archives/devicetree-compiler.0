Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547376;
	b=ZTK1038VkQgdnne7+fytl/OAPV6FwGp4z0UcIN/cwp+qiFWF4Phg3tMitiqqKuMyW2vP
	 KgVV21gO+MOwD29m+gKVMiSneOobGHoTfU0Mf9gQRta3ZfdPid+4/zQ9STlO1q2gkfQUv
	 x4GSPfLTczLisRavsahmMuY2EebEty0wUQqKGpgdoaI4/6l3CBD/zdfHgX8ciicyoSYJx
	 huvW/fjhMLfMU753Ye/CEsG+At/8CIbfv2IAsB80w9vlKMAykC5VkW2colxzYphfMVV49
	 h+T35jUBql1UIOseDqwBnYQAIO9EnV2GcpHeFk+KB4vHwz87EIE24DQC7EP3+lzXqyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Ox4n6KYykVTZqhM4hkJTXpATyoWTeYxSGb9cMjYE3n0=;
	b=vwsPl0nzB/YIben3xaEdMPWE0Vdf4nLaNheqTxmboUEYLygKoinH/aq5pNZRSVNoyXRg
	 0jj+eJCehYzMj/jMBsYRHR2gUOFiqLnaoJDF9GZdq86ziBqgcFZqahH0oiLC5AsNEDB7s
	 XFALZwSunC1gd2LHglJl4Lmu3wISW2RJ4bGHM6drj0gkP9zs63OolJnkwDl8Lt+72jrxa
	 up+SQ1yXAjhDc29Lr0W2fniBPZQOdRL1zFSNSoR+lx0TJpBqnjgxBYbE6y80JYZMlMaGw
	 VR4dgpNk1nfId3Vjr1g4/bdsxRE0oypZXr+4ktCHxdfbOf3uf/7mXMobaMY3wktd5HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ORyzrsyU;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9A6606A334
	for <Devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 05:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9A6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ORyzrsyU
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so874648a12.0
        for <Devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 21:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794547374; x=1795152174; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ox4n6KYykVTZqhM4hkJTXpATyoWTeYxSGb9cMjYE3n0=;
        b=ORyzrsyUNHyf6tf3bsgXRFe/+l3PDrtG4iuRPNFvY1O2X4JRiM2t5j567/FdG+OMGm
         pIZVAcI7Jg2aZfqixaZ3H5m5X+Rme31UU9sGdnLeVorZXiUMV5iFHoulsskQ+Ew69l67
         b5QHBJG+A71KizUOdoo2tT/c6pW64Mq5I7CKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547374; x=1795152174;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ox4n6KYykVTZqhM4hkJTXpATyoWTeYxSGb9cMjYE3n0=;
        b=miXf3pW22IAU+lrc1rErXe3y4SJckBSco/7qmximU9CjF/WPwQcLLMrwVfMRHbGmsY
         V0TKzsYeDZPNg3oh3XJ8vGKpgfmSn6zJcF1XrwWCEiiBgpjfvYWPBNO7Hxz7YhYhya8m
         RZ2thmklhl5EEC6uCNxdYY6nQGL7D0/DmxpD7u/3w0ZVLNS8vQmM07R+G4epRxgJ36XJ
         vbc8yyNM+Y6W+4HGR9N1Si2GOy39rS6dtDAViC8eaJQe41GC2IRyHIcX/mnAFnDe/LHB
         v7x417Tx2k/Iq7z/LuqVeTLOlb4Wb4vG/VmiPOeZ93eTyNMqgYDV9a1H6HYZHpBTc2C1
         h8bQ==
X-Gm-Message-State: APuU4Z8t7Y2MJ3z+LQLIAGxn9fo0blnLMfmGWiMnF1eNOkLsHHWer2/G
	gBErt4YDaTmtCUu3Oz0PHpqMsd/aqmaYqKzdZjniSL/saQzUjA3Zu83S6tKaTVaEHWCK+M1KZ4L
	d+yohhfwL
X-Gm-Gg: AYBFou3EF/gqOi0evJ26M6JQa5wByvGXkutsQcqAFap181KNpvSxsQ7uEInLeYccZAL
	vNYIkVloFOFvK/a/Ynkd74JIkEMBp8dk7VIeZZEF8Bv6RUATNMUz6W3BBJjwcPb40ag06AsrQiS
	frrYLVUOqIq9dBUMCLAMevcx0+KV3KwlenZ63M+MCdGpDH41bkPls3/BclJsmSRK3aTwbUTBkno
	MFvRGEtBvMsp4hM90c2XxN3DQTf4RTIKEVoBT/8zT83vVK4SaguyWquOMGpFZ2Xoz8TqWSk2rNM
	2ZlRNk91SbDOPE6EwBNLr+yq6XLIToCWY2b6RpXHgoRp8vfC6q+8InSlfaYdOmwIWzkjJl9AYxn
	MJehi563txkeAFx0uAXr/x9g3mzBKYz7j4HOlDs3vjDgNMsqjGfwdB9v8A/Q/lh0SGjLquSuwMy
	TDtjFC4Vh82igrIoheXqfgteihuTaK9VwT7x8EG/IkyB19foVh0wQaLaYkvFZOMJ7Lf89q0WjJ5
	olDhzf65wzQre4ErFSPvbBXCMbFuokgwEGNvJcDs6vKgVS1GsFDDOCxA63MOR0T2BfGSEuFY+vj
	/ZyW7Zcd81kPVZQvqwq7RUNwQSA9bGd+5NnIeX49XxQyg6LyoaqfJ1d4JNqT9pa6J1ZA
X-Received: by 2002:a05:6402:44d4:b0:6b5:79f4:8d52 with SMTP id 4fb4d7f45d1cf-6b7c0bdfec5mr862467a12.20.1794547373962;
        Thu, 12 Nov 2026 21:22:53 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c25df671sm547033a12.32.2026.11.12.21.22.50
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 21:22:52 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso651370f8f.2
        for <Devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 21:22:50 -0800 (PST)
X-Received: by 2002:a5d:4f86:0:b0:48d:f831:2681 with SMTP id
 ffacd0b85a97d-49c71f334a4mr2062026f8f.38.1794547369976; Thu, 12 Nov 2026
 21:22:49 -0800 (PST)
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
 <20261101220224.1436242-13-dianders@chromium.org> <avPsIBLWNrNexcbt@gractus.seuss>
In-Reply-To: <avPsIBLWNrNexcbt@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 21:22:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uy0dxbzoMN6hA7FY3R6hyqcL2j8d2-YeivS=_+dA7NfQ@mail.gmail.com>
X-Gm-Features: AclHuK_tr2qaJcNGS3TJ5jGwHVn7SwIIvG0pdGd-5SNir7fQgEzYdizCECgdiOU
Message-ID: <CAD=FV=Uy0dxbzoMN6hA7FY3R6hyqcL2j8d2-YeivS=_+dA7NfQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] fdtfactor: Add tool to split DTBs into a base
 DTB and overlays
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, Nov 10, 2026 at 8:16 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 02:01:19PM -0800, Douglas Anderson wrote:
> > diff --git a/README.md b/README.md
> > index fcfc2e55d804..61fefc4424fe 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -112,6 +112,49 @@ $ meson setup -Dpython=disabled build
> >  More work remains to support all of libfdt, including access to numeric
> >  values.
> >
> > +## fdtfactor
>
> Pre-existing, but it would be nice to have blurbs for dtdiff,
> fdt{get,put} and the other anciliary tools we already include.

Agreed -- in my draft v4 I've added a preparatory patch adding brief
`README.md` sections for `dtc` and the ancillary tools (`dtdiff`,
`fdtget`, `fdtput`, `fdtdump`, `convert-dtsv0`, and `fdtoverlay`).


> > +        self.filename = filename
> > +        with open(filename, 'rb') as f:
> > +            raw_bytes = f.read()
> > +        self.raw_bytes = raw_bytes
>
> AFAICT, self.raw_bytes is never used again (unlike the raw_bytes
> local).

`_print_dtb_stats()` actually used `len(d.raw_bytes)` further down to
compute `orig_uncomp` when `--stats` is passed, though nothing ever
reads the buffer contents again after `__init__()`. In my draft v4 I've
replaced `self.raw_bytes` with `self.uncompressed_size = len(raw_bytes)`
(pairing with `self.compressed_size` in the compression patch) so we
don't keep all the uncompressed DTB buffers in memory just for their
lengths.


> > +            if 'phandle' in node.props:
> > +                node.phandle = node.get_u32('phandle')
> > +                del node.props['phandle']
> > +
> > +            if node.phandle is not None:
>
> Changing this to:
> if node.phandle is None:
> continue
> reduces nesting and IMO, would make this a little more readable.

Done in my draft v4 (and did the same for a couple of other `for` loops
in `fdtfactor`).


> > +                offsets = sorted(set(lf_node.get_u32_list(prop_name)))
>
> I don't think there's any reason to convert the list to a set before sorting.

Done in my draft v4 (`offsets = sorted(lf_prop.as_uint32_list())`).
Neither `dtc` nor `libfdt` emits duplicate offsets in
`/__local_fixups__`, and dropping `set()` also means any duplicate
offset in a malformed blob will be caught by the overlapping-offset
check right below.


> > +    base_root = FactoredTree()
> > +    next_ph = 1
> > +    for path, _ in dtbs[0].root.walk():
> > +        if path not in common_paths:
> > +            continue
>
> I think this makes the loop equivalent to:
> for path in common_paths:
>    ....
>
> > +        if path and base_root.get_node(path.rpartition('/')[0]) is None:
> > +            continue

We can't iterate `common_paths` directly here because `common_paths` is
an unordered `set`:

1. The `base_root.get_node(path.rpartition('/')[0]) is None` check right
   below relies on parents always being visited before their children so
   that if an ancestor was excluded, its descendants are skipped too.
   Iterating a `set` can visit `/a/b` before `/a`, causing `/a/b` to be
   wrongly skipped.
2. Walking `dtbs[0].root.walk()` preserves `dtbs[0]`'s subnode ordering
   in `base_root` and keeps sequential `next_ph` assignment
   deterministic across `PYTHONHASHSEED` values.

I've added a comment above the loop in my draft v4 explaining why it
iterates `dtbs[0]`'s nodes in pre-order instead of iterating
`common_paths`.


> > +        has_phandle = any(
> > +            d.root.get_node(path).phandle is not None for d in dtbs
> > +        )
>
> I expect this will work in practice, but arguably the condition you
> really need here is whether the node is referred to by any fixup in
> any non-common property.
>
> > +        if has_phandle and path and path not in common_sym_targets:
> > +            continue
> > +        base_node = base_root.create_path(path)
> > +        if has_phandle:
> > +            base_node.phandle = next_ph
> > +            next_ph += 1

For the `common_sym_targets` exclusion (`if has_phandle and path and
path not in common_sym_targets: continue`), that's true in principle
with respect to `/__fixups__`: an overlay only needs a symbol in
`base.dtb`'s `/__symbols__` if a non-common property ends up referencing
`path`. There are a couple of catches if we tried to relax this, though:

1. Which properties are common vs. non-common isn't known yet here --
   `_build_base_tree()` decides that next, and its candidate eligibility
   depends on which fixup target nodes are in `base_root` (so resolving
   both together would need an iterative pass).
2. Even when no non-common property references `path`, `base_node` still
   needs a `phandle` in `base.dtb` if `path` is referenced by a *common*
   property in `base.dtb`, or if `path` has a symbol in `/__symbols__`
   (from `dtc -@`) so the reconstructed DTB retains its `phandle`
   property and remains valid as a base for any further runtime overlays
   targeting that symbol. Conversely, if one board had a `phandle` on
   `path` (e.g. a board-specific label) and another board didn't,
   putting `path` in `base.dtb` with a `phandle` would add a `phandle`
   property to the second board's reconstructed DTB that wasn't in its
   original DTB.

Since in `dtc -@` inputs almost every node with a `phandle` also has a
label in `/__symbols__`, checking `has_phandle` up front keeps this
single-pass and exact. I've expanded the docstring on
`_find_common_nodes_and_phandles()` in my draft v4 to note this.

-Doug
