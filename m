Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793561696;
	b=ekLFRBKxDk3ovkSorM8oi0Kiy81c5mqTYP3H6xIwwsXWIpZkoXsi4dOClDdj7xvnbsnt
	 pmh+C0Sv+eClpCf5OjLPGrFQdzkjOmz3DB0IqoWtgzeVta3CDg/xUA2npVpaIBZ07XvQ9
	 lQPmTHyeifmbcBMFWJh0Nh/yEFu939M3Limmm8Q4BMkofQynbFVJINtZ+aRfMYGxfzZMm
	 bRpbMYWRj+HtVFLIcl9zS2cXqtj3Zy/zoG16em8x1PX3xyAQl8t8lM6p+jjBL5iZDSlmG
	 ZMwTva36OZ2Cb2ZrpvcIDEylunEM9+v4Pa/GUnEtBLZGQ5F4tVSoMMs9NQoPNyiWcSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 from:In-Reply-To:References:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
	b=YhE7vc5ciQAxs/4Xp/wUzvwlAt4Y53PavxO2B66ZU2jjL9weZnq3uKY81EaNb1HzDesi
	 dGJ9tQsjnTr7U6EG2SPca5tJUDlSQrKyGWBEgdJgpliuBckEn0Pu/jQce2oYjCUtCEkGJ
	 bkC/zBij1kRYFhWcYURbge8yB9L06BRcu4fh79f19s2L62TbB9vlgdU49EAoc8zqjwkrD
	 m6/vZ6wcfMVLsae088DNt3rXa7DK+tBQ9rHvqJkdqOyowvOZhXraLNOOS45jAVconoty9
	 hkgNh8l4hgz5o9IGJF2zd96lL8/HaljUloeKZJ75gyX5C9Jtx/kW16qQaE/v0jTE8qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Lfqcc5GG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40D1606A327
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 19:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C40D1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Lfqcc5GG
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso3411188a12.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 11:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793561694; cv=none;
        d=google.com; s=arc-20260327;
        b=qjv6FUkl4T8C00B4ssCvDmqhSBuGHhuhnTiUV7FFjS62Pcq0y0PngIB4afOU6H9Ixk
         nEvpCSy+81SpxJG40JwXszIiVmxROnLV6btcODwtIeU5TykkU8Uaz2CdTCfBbi4OHLu8
         DT5CNO0ivU5ewrlED0pfTTkNwV+3HMj5gZ7PDwuNRUgorlkyztKLr+3qsfCrnew4Ab5b
         3VHuX7fzT/aeWxAS0Trf7B+PxvoHZ/J6Bs7LUJIqQckuvskJtLbbQLeyML8zV6OgSGq/
         vo+aqFEA9NmjSLguS6s8J83pfYHolyOXKMHGNQEfX/M5ogJJDhry6pp78WLWMYSP24ST
         FBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        fh=v86gIfnSQotv8SMwvdy4jjZ1KKmKA5U0VQJITz6sR64=;
        b=O+TxSUj1SdNbB7gIVlmp6A0JZLft8vMgA3At9o3bDwkSChtnr+SK/sUMEwsWOjDG3U
         G5k1rDBEstATn7f5uM4EA0rV9sh6bDLm7i+fZEc2wiB12vLHsTSDFjeWq+iKjUolr+Wz
         4zopN1vpgKlPBaEMcXqr0KqetMwhQX/4/U4Q18OZhK0wbz4w7NCDvsMqRLMU5ka1UD3C
         sJ+MwVOW/PmdWgjmF5xYmWnz/4ulV4I5cqk95ixD7Hwfx+GCmL54PyzQL5/6JMXoLD0Z
         LvxNJi68PUNTDzF2+ElDaS54H737AXIFShcsKY+NPuZSLOFf0E32BE9tCNLqKciRCBa9
         rcRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793561694; x=1794166494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=Lfqcc5GG/SwjR7rhF6i9wN+51zewpGS58ukrmB9LGRdbbpKdip3M+YroJNl6U5AaZ4
         rF//L/DV6VSxmy/1UQsFeJhmoDWwkPFReDLBiC+oRpU55av1FrMnZVBw20fY7l4UynL3
         HVfRKiNvpd9FUkbDQyR76hW+g1Owj32N3MUEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561694; x=1794166494;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=r3f8oStVD7z5X6XXrZcnMS3TCw6lLbW1prrVmRmzSdfcrBFoT0vfDeRuYE/NZdOw04
         cnRib20AAhj6qyWfHeGQbIrxUr3a4AVATlZWS/eUixgmi9jLGD0d8Iv8I/Qs6nV9Rffd
         qedj9nSBuaQz00Fne0SDE3AQGdcbTh/DngjzmFPuepQe1T2P9TlCk1NoXGmq87jPwBn6
         BG1qKS2iuUU2+orxCi1FaoY8jgnZ3N2JTPUZhkKxgoqS/IEX25+O7QUHrEHuesoM1kex
         WOn2O45QFt8GiaLEwdGmesFk3y1RtPAE1Ff4oLyB7ei5YsznhAeXVCbwME+zpHwA8rh9
         Gveg==
X-Gm-Message-State: APuU4Z/lGrb1KEPqxYI7LSl5sbW3pPEeMGjkEtllBHLDV/n5wjp2rWa1
	GRsGJDUZ73+YtMPuFWh8T2/nXBOI1jvXdsPAQhttTxH9+fZ49Dw56Nx0aSkK8Tl3jOGzauzM7aP
	lidkIHFZMlTaE7USoKVRBnjdid+jl/SUzdXNLB7mW
X-Gm-Gg: AYBFou1L+0QH1CKSrRaFOL8NcNF7X2azj3XPVtUhMUv6NRUghMKtegt25HW0TeCSpfW
	gEtxCtZ8mjcFTx0m/hPOwreghhoDSWBvI0el3aQzb6JzFpG8n2gJ3zp8nHOh8vUO4LC2W/VHx4i
	Aez+M1cVNOgkkzWzVOvTb/hg26kBsl5nlhIipEAyL6BY63WD4l/D92Yv0j30Yfrblj2rRuUz9uu
	Q/76Ot8gNQky4ZgL2JAz54i4Vn+RmEUv2dK/iORbd7sfssTXeolhUerTuFyqJkzVEkoZtbNfldl
	jNAJdBtH40PhepKZWqyBbf4ZT7QTqYcoCjWB9y50bTaXA+IkAJj/9UpRWsZDetW8SR/56YVey9h
	bhvjG/aGEyz+i+TAOQeAXP4ZiPOJCeONYwVmjXlek7RT5ss163lfb/tiBVL5lE1BQ0bemiR2a
X-Received: by 2002:aa7:da45:0:b0:6b3:e89b:128f with SMTP id
 4fb4d7f45d1cf-6b4d4d6d938mr4052419a12.9.1793561694122; Sun, 01 Nov 2026
 11:34:54 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:51 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:38 -0800
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
Date: Sun, 1 Nov 2026 11:34:51 -0800
X-Gm-Features: AclHuK-OENc2MfogrHTK6nr_VXdYPKQaHTgRVjZY6Us3vAfjaHxM1Qejmm0CbCs
Message-ID: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:

> Putting the metadata in the configuration's `description` property came
> out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> already uses configuration descriptions for similar board matching).

Thanks for the background. The Xilinx case is a bit different, though:
the same project writes the string (the binman .dts) and parses it
(board.c), so it can change both sides together. Here the kernel would
write the string and the Pixel bootloader and outside packaging tools
would parse it. That makes it a cross-project ABI, and I'd rather that
ABI were typed properties than an unwritten string format.

> The proposal I've tried to push a few times is that it's OK that
> different loaders have different types of information available
> to them, but people don't like that. They want a universal standard,
> which nobody can come up with.

I agree with you here. We don't need a universal set. I've sent a
proposed spec change [1] which lets a configuration node hold one or
more match sub-nodes. Each one names its scheme with a vendor-prefixed
compatible string and carries the properties that scheme defines, for
example:

    conf-1 {
        compatible = "google,lga-...";
        ...
        match-1 {
            compatible = "google,board-id";
            board-id = <...>;
            board-rev = <...>;
            soc-id = <...>;
            soc-rev = <...>;
        };
    };

Trogdor would use its own scheme (board name as a string, rev and SKU
as u32), and Michal's loader could do the same. Each loader still gets
what it needs, the types are explicit, and nobody has to parse
'description'. Please can you take a look and comment there? If it
works for you, you can point to it in v2.

> Should I give it a shot for v2?

Yes please. The DTB list already reaches make_fit.py from the Makefile
through the @file argument, so the new file only has to say which DTBs
to include and what metadata each one gets. We'll need a simple
per-platform file next to the .dts files, passed with a new option
through FIT_EXTRA_ARGS

Running fdtfactor can then be another make_fit.py option, like --decompose-dtbs

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Regards,
Simon
