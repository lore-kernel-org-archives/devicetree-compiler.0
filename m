Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224720;
	b=zXc0NoS2Su3sAiwnP884ZlnSKO4ciQk3OIbx0TiU3zk5U9Xn7AlE4yIf9Tu/KsX/RTHm
	 eicjW3BNkdZPxTLgMnVWnpivDtL6OV9cooiPHwypKCYiNGuqCyWPpZ30bVjIArKhMjf7R
	 jceLPCzS/oGaoWC7cA5cFOB50JQgXNkl12UBMF/byaIaUCuDik/BAeQr+Wk3tsOhmA7vp
	 1DYJiF7OfIzCqSRuwvYjtVoRnV7u2Fg3LDHHce0NFLXk8rvuCd9o6GV1ahyNqNZauP7tp
	 hZeFQNxV+BeG0+cKNV5sy6MPLQYoFdDOzaYRWd8GmEh9prehB7P/UWim/aVm1umsZGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=yjBj6q9tc23c/gY7l0t6am+Be7ywusZAkkg+litsRmY=;
	b=J0DW1d96daHnVR+dW9h7boQPRjkH+L9orQSkgLUlycyqLrvXV1E3F8Pv6CxUxY+UKHIR
	 n46sRejkQIZ9tmD9OETjzpdyEgeSegmLOuTT4BzL9/zdnhQxtYTAifZCj7Bpq9e+elXzX
	 scTLA/5y4jusFcci/qpCiU1nJ1OLVVDBlD7uY8hk8LzoY7NeGkJE1ydmjCPX3ROY26+k+
	 N//DL0TjU7ENuOzs11UwouEwTtNMjvLnsxypTzHoanC2SfOnALh4JOMWEMNxCl7dn5J3a
	 eY4OC2r4BYyMzb/Nyce3wkPY/LQGOgwfTOeJ1DWUdczxpZ+LywtspfXj/290b3f6CRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hZY5lVlG;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF5C606A31D
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFF5C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hZY5lVlG
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4550d8ab15so202519766b.2
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224718; x=1793829518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yjBj6q9tc23c/gY7l0t6am+Be7ywusZAkkg+litsRmY=;
        b=hZY5lVlGh6o7TJ5roGNLjMtgNPp2FF4epdSqgQsS+bxJlntVfQpKnk2kKhQUj1ASwt
         7j5sBDwwI7ptHQ3kexsWdvgEKgRWMu++Ntl1xE3mUsv/4yOM1gwSnZcTnyMxaryvMrtS
         By5uTVMjXhNEpa9S4EoXe8rSaK/+yUCANZ9l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224718; x=1793829518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjBj6q9tc23c/gY7l0t6am+Be7ywusZAkkg+litsRmY=;
        b=MVgqhow5P7DM53tZWZhhSyZfdubwUnAIw/JCgms5wtTyP85j/hc5GZ21fJc9qsXvId
         4qumHbgjONoP/zX4t/7ZZH9K51Owwtjv+oGQ0K1HPSEhZVWkGaQVWVTCCr6RsWUcTyde
         Q7RckPCy4StzY1VduUEYjAh2+o/NVmiFB8OuDbEJizOw9ALUJjIZX1Esa9s8HRZQb9Ce
         B6BvNlCucEGL2FYvpK0f5kes7KcYPfzXz5onKQhcUH4jTMgwWmZBITqND500F4uKW5ex
         RMmlinyq/BjKRFbwImhej8StxdkpOsm+zUMAhAdNwEkFukILLrmLm2oBgyKOM0dcUaUZ
         aXSw==
X-Gm-Message-State: AFq9FYIVf8TgDfNjUaDd2i85Nk86tuejcD/2pIjsVS4xiH/RvCOZFJnA
	r4F1FcuM/A+Y+xoFZ2hQhDURvh3vIUowTvg7V304l0CtHh5LUWx2YG3ZcdhzSc/6o535i1NYWU9
	0CWc8TdIZ
X-Gm-Gg: AYBFou2gOkP8Z0BC69V5jf5rtMA8OFxyXaiXjPcjpH81JZz5zKjq/lvoQY1K6ndXBU8
	7Hh33O8D86DFwE5rbZ0dczKVKFrOJ+fKM0X55fBlaVi79zwWXS/vdeduDZkZEsqBdr8Q1Eink5n
	tQAnBzMFNg/gjoOIfpddpXZxG/aq7D/29IA1kP6PdKEfkViuOPAejsA8dhnpdrZJ920/uR2PIhA
	G10lqtM7qz31DEvn5yvkKd8adEheh1BUdZVTtKR1adsoVNnBLTYl3jZhaNE+gizxYLk+dmclkEH
	XSRf33oyo9/I90yv4TfrYPo+pcOOdFOJEWcLcbrx0lPjPXTsd8ZdwzrBfjoDX2f1I4JFwCYiIyN
	7BNBM29UrvW63AJ8S3XMT9O1yxwBLy9Cb/8tD4yFGQXj1ny9HrW27h7DvVQThiEMyvxmwfA+IPc
	V0FB9yg5063i+4qiIX8RQtsKZTvdhs2+0EDOv468gUhyL37YqFjUpEi0a2cNe/2yH40l8zScii9
	BX4LVd1IF+MbzTgRS1OPn2W/fPliaF4CDEYGt/pZsJMlYIfY+Z/hTOho2VpsE9Ql5yyp9N6rjad
	QtNPbTbtB5kqany5b1SwFGJpKSqtuj1zfSR0t0jAxHIIDFkHk5hvPJU5lY3tBQpGQJFi
X-Received: by 2002:a17:906:f8f:b0:c49:cf38:3baf with SMTP id a640c23a62f3a-c49cf383bcfmr104703366b.5.1793224718316;
        Wed, 28 Oct 2026 14:58:38 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm655788866b.56.2026.10.28.14.58.36
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:58:37 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15616235e9.3
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:58:36 -0700 (PDT)
X-Received: by 2002:a05:600c:6989:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a9647aabc3mr76897285e9.2.1793224715600; Wed, 28 Oct 2026
 14:58:35 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-5-dianders@chromium.org> <CAFLszThA+Fau4_0NEhXA3ntUmPB8wnuaabVvzNU=CMSpoQQgkA@mail.gmail.com>
In-Reply-To: <CAFLszThA+Fau4_0NEhXA3ntUmPB8wnuaabVvzNU=CMSpoQQgkA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:58:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WacyUDJWaH0W09BVBkhFGabUZ3SJ+6L386QHQLhrE9QQ@mail.gmail.com>
X-Gm-Features: AclHuK-VauY5jFIV9iZhwrCVa183QIFYKTVeSrQKaKqMsei3LLLan46HVAC43ng
Message-ID: <CAD=FV=WacyUDJWaH0W09BVBkhFGabUZ3SJ+6L386QHQLhrE9QQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] fdtfactor: Add compiled FIT image factoring support
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Mon, Oct 26, 2026 at 8:31=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blo=
b, dtbo_blob,
> > +    dtbo_comp_sizes =3D []
> > +    for entry, dtbo_blob in zip(entries, dtbo_blobs):
> > +        img_node =3D entry['node']
> > +        dtbo_comp_bytes =3D compress_blob(dtbo_blob, comp)
>
> One thing I'd like to check, since the README says this targets
> U-Boot. In U-Boot, boot_get_fdt_fit() loads each overlay with
> FIT_LOAD_IGNORED, and decomp_image() skips decompression in that case.
> So a compressed overlay goes to fdt_open_into() as-is and fails, which
> means the lz4 FIT that the test produces would not boot with U-Boot. I
> suspect U-Boot should be fixed. Until then it would be worth having an
> option to leave the overlays uncompressed (they are small anyway), or
> at least a note in the README.

Added a note in the README for this.


> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blo=
b, dtbo_blob,
> > +            for sub_name in list(conf_node.children):
> > +                if sub_name.startswith(('signature', 'hash')):
> > +                    print(
> > +                        f'Warning: Stripping invalidated {sub_name} su=
bnode '
>
> This only strips signatures from the configurations that are changed.
> But the whole FIT is rewritten with FdtSw, which lays out the strings
> block in a different order from dtc. A configuration signature also
> covers the strings block (via 'hashed-strings'), so I believe
> signatures on untouched configurations break too. The user has to
> re-sign with mkimage after factoring anyway, so it might be simpler to
> fail when any signature node is present and say so. What do you think?

_extract_fit_fdt_entries() now raises an error if any
/configurations/<conf> has a signature* or hash*(1) subnode or any
/images/<img> has a signature* subnode


> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blo=
b, dtbo_blob,
> > +def _derive_base_dtb_description(entries, base_dtb_node_name, comp):
> > +    """Derive a `description` string for a factored base FDT image nod=
e.
>
> This is a lot of heuristics for a human-readable description, and the
> results are not obvious (e.g. ['sc7180-trogdor', 'sc7280-herobrine']
> gives 'sc-base.dtb'). It would be worth using something simple and
> predictable instead, such as 'fdt-base-1.dtb' or a description listing
> the images it serves. That would also simplify the tests.

Yeah, makes sense. Done.


> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blo=
b, dtbo_blob,
> > +        placed =3D False
> > +        for grp in groups:
> > +            if grp['key'] !=3D header_key:
> > +                continue
> > +            ref_nodes =3D grp['ref_nodes']
>
> 'ref_nodes' is only the node set of the first entry in each group, so
> the grouping depends on the order of the nodes in /images. For
> example, if the first board in a family has many extra nodes, its
> siblings can end up in a separate group. Comparing against the group's
> common node set (which is what ends up in the base) might be more
> robust. What do you think?

Sounds good. Done.


> For the argparse description, you really have two completely different
> cases...I suggest the FIT part of it should be worded differently so
> it is clear that the result is an update / new FIT.

Reworded in v2.


> mkimage uses -F to indicate an inplace FIT - with -f used for the
> source .its file. It might be better for your tool to use -F instead
> of -f, and then -O (confusing for dtc?) or --outfile to specify
> writing a separate file.

Done.
