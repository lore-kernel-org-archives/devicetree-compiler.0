Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028671;
	b=VC0bS3sFtN7EKIU4D5xFsqm/zrIASp4qycYTS+HOrJqu8i9sRWuW7ewPp9gobHZmAbPX
	 LpGPeiUgxMh4JpjZ6/oDg3wbKL+LLLQrVtHzL1JzwG5oTeUMxJfBLv0U6r90J88wLc59I
	 PsAX9bPwlpXCGWTs1fqiWIf7nYWlqCmz9mfx4biXqey50kDe6V5UajKup4BsDjZLOT1M3
	 1T80jNvsf+pkNLJKoVETuRglRqtlV3Kqs4zt51/B5EdTJj/nD1p4pj5qEtAq8M5CPi5ql
	 SwvVDtNobeupgFD/6J1oItJGHWql7FZ4WiEEND1sJWQFP/XUST4PQxGbobwKy/ZpMJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=ByfudzbZBmPdop+tQLUNKnJBViZnQ8X/fNaZs09u0EI=;
	b=hsvUhreFlFEhC56JqhdvbXICYc0jVGSO2z9mTEty1tuw3gAqGQniaj1SFRHXGuwx9JeQ
	 92J1eAZLLT0ac/z1e1noD07Yg6LllQsFdgWqlgWWFjz99uJLPkHsrLgfJzZRNqlKMp3pb
	 UxCp/U5Q0vzLTNNltghbNGGUfZD2ZDy11L2vA7225Fz+iNmNaV7+vLhzW9XUiKNZwC0kj
	 xzd6SF1rGY/g+bpSToMyId84R0PESd/jg6PQfRGwGt9j5j1DkGUGRWq9x1jHOV90C4GDr
	 hY0JlFyt0ciiQUdRLw36mZNae+nEEkdWjox89GJOGG1GlTq4lMbPhNumQA3jPAKnq3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eeUdTxWj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E59606A322
	for <Devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 15:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E59606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eeUdTxWj
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so3703157a12.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 08:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028669; cv=none;
        d=google.com; s=arc-20260327;
        b=SxxFkC4wtcb/XL8TfTXytrN467pAsH9B3/0+4Z9Imr9FGx76FH5CqRXaYV58wTMBXt
         QTVG0r3cj1piMwoUxtVIqClY1hCtwpFJ8A3XV9PUijPBMuST/Ay+M5YwgTs4IllmBu0V
         nUY9rVsf7nXAdvE5ZX61F4WjHZUND684mtkvHjq2u7HClSJGARD4wwGM8zX1i925N6V3
         NuAyTafVen6dEJwMEDSvtuFnvuDrlSmYjJIQYt1dwlZGeJYMk8RnaNxQ+WbAIwGdH+rM
         BntxJDhRd6ecJCZmiOPokTSSOYVpzKBe+fP9+9UCgTu4Hl/Hg/u+oX9gQeqrQiUgXeub
         Yonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=ByfudzbZBmPdop+tQLUNKnJBViZnQ8X/fNaZs09u0EI=;
        fh=Nq2BAfzd3ZF5/5+yPYbxtIEuy5nctXJRFjgZ0JuXri0=;
        b=BYCWf05zI+1RUvWokmJ/6arVog5slp26uYIjvCirRvRHo7khMaKTA/67df7oLtXlJw
         FiE9dZ2qefPNMtq1X8jxBYN0xAjpsJF54ZIz5MVj7+AS7iL48GeZw8iximKTrofAK15H
         awBfRA34oaKzAuOEgBWdqlNfZ4csuwCxhjSoDD8uE8YPw1U9Tv4eddY4C0kdtBorhhzb
         W+FtL5Q0EEiAWvfUUoDolCI/lpWGvDFxrA55sU9OhdtjmJTngAivTObdyF+40MEdp5Xh
         lFdc9J/HhWSb6C/Po2wcRNFzcFAeXHbnYdR0kGm3F+Clict+B+waYuv/gyOpBHJGJQop
         vKbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793028669; x=1793633469; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ByfudzbZBmPdop+tQLUNKnJBViZnQ8X/fNaZs09u0EI=;
        b=eeUdTxWjeV2BMSDF3zCRg8gyP/54wUE0FH/JBsVDPCFxWA3XTNI7gi7qh9YgME7uU5
         etrQfmFijprc9k9xLYqu/fET30Z1Y6yi8TPbaDsiaGPcG4bC9dVPfowrQL1n4fKVAeRT
         LkxdATPlmVNernKWJEUhyH/Jn70atejAFfMYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028669; x=1793633469;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ByfudzbZBmPdop+tQLUNKnJBViZnQ8X/fNaZs09u0EI=;
        b=wD1mZU6gxRRh158dZcuJ7XtcKRC4TFfnRx1BxUN1XU6nzxlggPZ/JHnp7/TPUWjCcH
         3KgdjJLNLRhbr1I4uf3wf8i5V4r3zNHEoYYERzBKqFQpP1B453BjJwxo5RpuuC1oQ9cG
         mKZIY17mtRyQxRZcCTOZGijZVXHxtZwXiPz5FG4+wm9Klj17fLmnkoUTwNiRn/iFJ9D+
         Y4uoYxAYUuO+e6huO3RSd/IdHNURQ5ZePvNO7kSKwn5G7R+Fc6z8XeT2VopZMPcbkLA9
         ry7Avpxnk05LrE3kWzkphvZmurjgmc37lmmXxM714Ud83LNJjNHjHtajMF5Ssm7ri5lH
         nbSQ==
X-Gm-Message-State: AFq9FYL9yytADm+NtlZSOFfzmpaW23wiT+ed3vDNq3HrXlh0UKzFlnRa
	EFwzHvDhOAYUC1t6GCuklY+xJ2cYahK8dz1IPWzg59H5fXeTXM0jkkHWJSHnkvCqcNt2ro5lx3+
	RNqWFlBm3JveuJrWxRQ2z41u9n61V0n6tpLNH5TtA
X-Gm-Gg: AYBFou120E3PwAA/FsC+QtI3JZ9yItDu906YGWLktkck2uqF4lDlKYuNhjwCTjENlhG
	w/cwC72jfhY/nssDRpV1/9jfxj5c7O+1Cc8uqnT//bC6y6HX8P2VjnqGQnp2EStxkl0nuChYvja
	QEO1ofbUB8FLxN2nw0hDIB7E1ErFw6OXntb0Q6lztQodVC/FCOP7l3blW2SG2U8nWdNnwbEFhR1
	svM6ajJJ2Z8haQwGEY0XHOqqHqo7m6wVzopKMDGkAV99WP4ugXsXWkafH4uLhzIyEkyCjJr1weM
	Mj1uD/e2W0L+5rv8v9sQ4JgL1DQududlYZOZkY37xWz2y5adehkBPBnDszhRvYYG2vM2aLgY2lF
	z0/UjNZCg9XMJiDrROx9ELa0BW1IamqsQwMA=
X-Received: by 2002:a05:6402:4021:b0:6b4:583b:daf5 with SMTP id
 4fb4d7f45d1cf-6b4583be5a2mr6346972a12.43.1793028668229; Mon, 26 Oct 2026
 08:31:08 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 08:31:06 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 08:30:42 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261015182221.2931742-5-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org> <20261015182221.2931742-5-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2026 08:31:06 -0700
X-Gm-Features: AclHuK8AS3l64pCtBVyQ04xvPLa_xotvoD7mTGNS-Ci5w-XHpRDF-10--cetNjY
Message-ID: <CAFLszThA+Fau4_0NEhXA3ntUmPB8wnuaabVvzNU=CMSpoQQgkA@mail.gmail.com>
Subject: Re: [PATCH 4/4] fdtfactor: Add compiled FIT image factoring support
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-15T18:21:33, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add compiled FIT image factoring support
>
> Bootloaders such as depthcharge on Chromebooks and U-Boot use Flattened
> Image Tree (FIT) images to bundle a kernel image with multiple board FDT
> blobs (`fdt-1`, `fdt-2`, ...) and per-board configuration nodes.
>
> Add `-f`/`--fit`, `-F`/`--fit-out`, and `--single-base-dtb` options to
> `fdtfactor` to factor a compiled FIT image directly:
>
> - Parse non-overlay `type = "flat_dt"` nodes under `/images`,
>   decompressing their `data` blobs according to their `compression`
>   property (`none`, `lz4`, `lzma`, `gzip`).
> - Partition the `flat_dt` blobs into compatible factor groups (by
>   compression, architecture, FDT header fields, and node-path overlap)
>   so a single FIT image containing multiple board/SoC families produces
>   a separate `fdt-base-1`, `fdt-base-2`, etc. for each family.
> - Support `--single-base-dtb` to force all `flat_dt` blobs into a single
>   base DTB regardless of node-path overlap, failing only if their FDT
>   headers, architecture, or compression differ.
> - Insert each `fdt-base-N` node into `/images`, replace each factored
> [...]
>
>  README.md                  |  15 +
>  fdtfactor                  | 726 +++++++++++++++++++++++++++++++++++++++++++--
>  tests/Makefile.tests       |   2 +-
>  tests/fdtfactor_other1.dts |  69 +++++
>  tests/fdtfactor_other2.dts |  69 +++++
>  tests/fdtfactor_test.its   | 109 +++++++
>  tests/run_tests.sh         |  69 ++++-
>  7 files changed, 1033 insertions(+), 26 deletions(-)

David is leaving this patch until patch 2 has been reworked, so these
are just things to carry into the next version.

> diff --git a/fdtfactor b/fdtfactor
> @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +    dtbo_comp_sizes = []
> +    for entry, dtbo_blob in zip(entries, dtbo_blobs):
> +        img_node = entry['node']
> +        dtbo_comp_bytes = compress_blob(dtbo_blob, comp)

One thing I'd like to check, since the README says this targets
U-Boot. In U-Boot, boot_get_fdt_fit() loads each overlay with
FIT_LOAD_IGNORED, and decomp_image() skips decompression in that case.
So a compressed overlay goes to fdt_open_into() as-is and fails, which
means the lz4 FIT that the test produces would not boot with U-Boot. I
suspect U-Boot should be fixed. Until then it would be worth having an
option to leave the overlays uncompressed (they are small anyway), or
at least a note in the README.

> diff --git a/fdtfactor b/fdtfactor
> @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +            for sub_name in list(conf_node.children):
> +                if sub_name.startswith(('signature', 'hash')):
> +                    print(
> +                        f'Warning: Stripping invalidated {sub_name} subnode '

This only strips signatures from the configurations that are changed.
But the whole FIT is rewritten with FdtSw, which lays out the strings
block in a different order from dtc. A configuration signature also
covers the strings block (via 'hashed-strings'), so I believe
signatures on untouched configurations break too. The user has to
re-sign with mkimage after factoring anyway, so it might be simpler to
fail when any signature node is present and say so. What do you think?

> diff --git a/fdtfactor b/fdtfactor
> @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +def _derive_base_dtb_description(entries, base_dtb_node_name, comp):
> +    """Derive a `description` string for a factored base FDT image node.

This is a lot of heuristics for a human-readable description, and the
results are not obvious (e.g. ['sc7180-trogdor', 'sc7280-herobrine']
gives 'sc-base.dtb'). It would be worth using something simple and
predictable instead, such as 'fdt-base-1.dtb' or a description listing
the images it serves. That would also simplify the tests.

> diff --git a/fdtfactor b/fdtfactor
> @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +        placed = False
> +        for grp in groups:
> +            if grp['key'] != header_key:
> +                continue
> +            ref_nodes = grp['ref_nodes']

'ref_nodes' is only the node set of the first entry in each group, so
the grouping depends on the order of the nodes in /images. For
example, if the first board in a family has many extra nodes, its
siblings can end up in a separate group. Comparing against the group's
common node set (which is what ends up in the base) might be more
robust. What do you think?

For the argparse description, you really have two completely different
cases...I suggest the FIT part of it should be worded differently so
it is clear that the result is an update / new FIT.

mkimage uses -F to indicate an inplace FIT - with -f used for the
source .its file. It might be better for your tool to use -F instead
of -f, and then -O (confusing for dtc?) or --outfile to specify
writing a separate file.

Regards,
Simon
