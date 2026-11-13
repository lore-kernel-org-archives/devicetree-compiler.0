Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547452;
	b=xhr76ImTbyqEKqlb9LA66+O+ShI3fgSquf6/nu+U/R283aj+rhQYo1zjrqD32eXPmPFe
	 xJWNzAdV8y714ovNZelK2zcqjPv9gyhexaIQ4H/Bh/6PrVaiLsXCkud4uplB2zPR1Vm0m
	 RrTbQWSHs5l0djQ/h1x7o8hAwo5zTs4vtyWfFkPefIrast7IhUO95Mum1yEMECFehGnik
	 PpXKRG4NqU6+UK4DFKMbnrvEh6SZ7LQpWE89l7gIayzctX4plktpSl+/J1Q4Rumusm6Ky
	 5qQHDMdaL9Y4QDSzVvVbffN8Apw+sxeONue3kAQPTOFTTXkzaQWr6D8pW12lkrB7j3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=JmKJsnJY8MqWcs4Bpm4VF6uZO2VAnwIaLQAzmFCdCwU=;
	b=cjZLgfFNJfYkmu5vvTpM6de6qJO12X3Ap/Oggrcwsq0/IdcSbnp+QHR6KDz34uYMlAfW
	 Wup1BMd+qhKCd0s5qARXvylT6cLyrnBI1L/kZUM/2kt3V1xSBaYBpGZyHDx2q1a0Cf5WV
	 qDcv1CQhKB+/+AHxvoeFpAswK+2/mIktZ1JJvbucWO6h9lbAnVDdzax0ldsCzxZyHpa8b
	 wuhK1ZScc6kD84+tZY+qIALqYhxB/a+ae8Pa0rLZ/nQ9wqbzrFOaPBGK0+1PTOf5wcYu6
	 W+klQsCMtFfMmoDfygwlIvXQHE2vAcDdyr0lLvNKWXEoAaBf54m8UvGaBRLLwgrTQtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L4wED5Vk;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7C6606A336
	for <Devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 05:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E7C6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L4wED5Vk
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso1067827a12.0
        for <Devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 21:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794547450; x=1795152250; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmKJsnJY8MqWcs4Bpm4VF6uZO2VAnwIaLQAzmFCdCwU=;
        b=L4wED5Vk3CzgcrUGWbdfRv67ZEAATh3Fvd8mhdryyNK/57SlbLSWGF1ikYaig97Bq4
         eEaW9ABaODhor//9BAtNyHwfvj0RrQxZWCIQXDMEvTWUWqqZHRrBYPPo5adgiVyIPwNC
         uX36Bow89pS02J9a2oQ4emd1FB448jXTJ8Jx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547450; x=1795152250;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JmKJsnJY8MqWcs4Bpm4VF6uZO2VAnwIaLQAzmFCdCwU=;
        b=jfamqyJY4drT2v49hWVn2EWH6+Zf6nK0DQQvOAY6U4fIEKGjsmlIdl1gb+w4cSgWXB
         qVragm43F9xTLZi7rzFv2rNhWU3lbV1TvXbwP+J7P5OiQ65lSZDUya6Ed2ufRlbmZ7Lv
         6sn0QzjzEPezBFD2Cnithgon+Lzs2sasB7US+nVzFE5C0k6JHJ3qFgQeMwkIFfITGIhi
         N6g7pgHeJO7sfAltM2zec6aYeCk8Hm4/BHfmsv63WvziB6QK05hDsQE9bhqAh/XX67uC
         UnGany2N0kN1JJefyeFkcAU954+N8AGIKJuWMFEdxwjTfreLfAb1CQWcW4OsrlNaiWAl
         qa4Q==
X-Gm-Message-State: APuU4Z9z8aZRLIVn/e2WnXQDa7m4OZA4bhoMrfS7etKPNpKaNuRSnf8U
	uHoNmpI2rcIK0C+BbOHLolsXU28OHevG0NgWvu1LOw+kbo7YvzvNQ0mYOV8Sh2+TIHdJ+xbcd7B
	UOE/Y7iRA
X-Gm-Gg: AYBFou1r/CcZBe/+vgiI3pXIlRuHjPjtToOLDkGrrbEmbqDb8AAb4QtArEsdAAbx7tS
	/s8xgOZvG4bz6iQrXhLP5gA5gzMd3+yFZKIT/C2FmdUd9CFQVLCgKspp4EXd3aPYeHMiuSfBTai
	ZYFw16o2w4J0LWW0WlqweNh1Jjtd1t9fs5w8KXXYiLDA8K60ThN4Y1q+nZzMRCWMTsJfNFzdCB/
	9WgcT+PeH6fHTwSUm1jVljHcOkrZ+W/7ee3Q6ki+vKYDPk1m0xj1YlH9hPLYJRFSCEKh9YATCP/
	VZy9+hYx/8i/v/nD8a7hZHDvz5mZbMAltDQQXbB0G06GF9cVVfLIk4Ta8i23O1BpADJZ6pOjfVf
	iGh+OxRJ0WU8Ovt0/cePQ+083lIGl6fBVQ+vB3YgK51teTciy1ZwXbFPK8soHO05Tzjty6cKujM
	Y1uNk825cPBGrtJBMh25YowfH86Zpw73u5TaVF2LmB+H2hGJJj0sOc0OHYHkf7XiCrcIVfPOlvP
	wLDqEQKx1b87RMlVHFuoKuOzGxtEah8d6+2hvezll+5DxbLg5Ha2xkbizZG+L3C7xP4EpgEjNED
	TehfozA8Iuqow7G+NuYTEOOUlcTdFatFZqg95w7SynYQ0Izuj0zK2DLsEYi4LkQRu9doLYBlvte
	oF4S1b8Yqsn1SYQ==
X-Received: by 2002:a05:6402:3444:b0:6b4:1df2:244f with SMTP id 4fb4d7f45d1cf-6b7c0d08860mr934887a12.38.1794547450003;
        Thu, 12 Nov 2026 21:24:10 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23dde49sm523651a12.23.2026.11.12.21.24.07
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 21:24:09 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so3216805e9.3
        for <Devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 21:24:07 -0800 (PST)
X-Received: by 2002:a05:600c:4e05:b0:4a1:6517:ccf1 with SMTP id
 5b1f17b1804b1-4bb55a44ff0mr28193205e9.9.1794547446523; Thu, 12 Nov 2026
 21:24:06 -0800 (PST)
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
 <20261101220224.1436242-16-dianders@chromium.org> <avUlA_KSHKmmSz5p@gractus.seuss>
In-Reply-To: <avUlA_KSHKmmSz5p@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 21:23:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WGTD8FtjPFE5mFSJP343Z9-2HNXHH3g4usqpWPVuwPUg@mail.gmail.com>
X-Gm-Features: AclHuK_4zB7NHPQo84upfuBk9JkbLknfTYjE74uvl8_8rHyRokZIvN2zJ3Vj3W8
Message-ID: <CAD=FV=WGTD8FtjPFE5mFSJP343Z9-2HNXHH3g4usqpWPVuwPUg@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] fdtfactor: Add compiled FIT factoring support
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

On Wed, Nov 11, 2026 at 6:31 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 02:01:22PM -0800, Douglas Anderson wrote:
> >  * `-o`, `--outdir`: Output directory for generated `.dtbo` files and
> >    `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo` files,
> >    current directory for `--output-base-dtb`).
>
> Even though one's a directory and one's a file, using different output
> options for the FIT/non-FIT cases seems kind of awkward to me.

Makes sense. In my draft v4 I've unified both into `-o` / `--output`
(output directory in standalone `.dtb` mode; output FIT file path in
`-F` / `--fit` mode, defaulting to updating `--fit` in place) and
dropped `--outfile`.


> > +* `-F`, `--fit`: Factor `/images/fdt-*` blobs inside a compiled FIT
> ...
> > +* `--outfile`: Output FIT path when `--fit` is used (default:
> > +  overwrite `--fit` in place).
>
> That's a lot of fiddly detail to fit in the description of a single
> option.  Maybe move it out into its own doc section.

Done in my draft v4 -- split the `README.md` options (and `--help`
groups) into common options, a `### Standalone DTB Factoring`
subsection, and a `### FIT Factoring` subsection.


> >          if _is_dtbo_overlay(fdt):
> > -            raise ValueError(
> > +            raise OverlayBlobError(
>
> This change seems unrelated to the rest.

In a FIT `/images` node, both full `.dtb`s and pre-existing `.dtbo`
overlays use `type = "flat_dt"`, so `_extract_fit_fdt_entries()` had
added `OverlayBlobError` to catch and skip `.dtbo` nodes while letting
other `ValueError`s propagate. Using an exception for that control flow
was clunky, though -- in my draft v4 I've dropped `OverlayBlobError` and
check `_is_dtbo_overlay()` directly in `_extract_fit_fdt_entries()`
before constructing `ParsedDtb`.


> > +        algo = sub_node.get_str('algo')
> > +        sub_node.props['value'] = libfdt.Property(
> > +            'value', _compute_fit_hash(algo, data_bytes)
>
> This assumes the FIT naming of hash algorithms is identical to the
> hashlib one, which seems a bit risky.

Agreed. In my draft v4 I've replaced `hashlib.new(algo_name)` with an
explicit `FIT_HASH_ALGOS` dispatch table mapping the standard FIT `algo`
names (`crc32`, `md5`, `sha1`, `sha256`, `sha384`, `sha512`) to their
`zlib` / `hashlib` implementations and raising `ValueError` on unknown
names.


> > +def group_fit_dtbs(fdt_entries):
> > +    """Partition FIT `flat_dt` entries into compatible factor groups.
> > +
> > +    DTBs are grouped by `(compression, arch, load, entry, boot_cpuid_phys,
>
> Why should compression play a role in the grouping?  The internal dtb
> data doesn't depend on that.
>
> I'm not sure what the 'load' and 'entry' fields do, so it's not
> obvious to me whether they make sense here either.

* `compression`: Agreed -- in my draft v4 I've removed `compression`
  from grouping (and from `--single-base-dtb`'s compatibility check),
  recompressing each overlay `/images/fdt-*` node according to its own
  `compression` property and `fdt-base-N` according to the group's first
  entry's `compression` property.
* `entry` and `load`: In the FIT spec, `entry` is the CPU entry-point
  address for executable images (`kernel`, `standalone`, `firmware`) and
  isn't meaningful on `flat_dt` nodes, so I've dropped `entry`
  completely. `load` is an optional physical RAM address telling the
  bootloader (e.g. U-Boot's `boot_get_fdt_fit()`) where to load the base
  FDT before applying overlays: two `flat_dt` nodes with different
  `load` addresses can't share a single `fdt-base-N` node (since
  `fdt-base-N` can only carry one `load` address), and `load` is
  stripped from the `.dtbo` overlay nodes so a bootloader doesn't copy
  an overlay directly on top of the base FDT at `load`. I've added a
  comment explaining `load`.


> > +    mem_rsv)` and node-path overlap (>= 50%) against the group's common node
>
> Overlap >= 50% seems a very arbitrary condition here.
>
> > +            common_nodes = grp['common_nodes']
> > +            union_len = len(entry_nodes | common_nodes)
> > +            overlap = (
> > +                len(entry_nodes & common_nodes) / union_len
> > +                if union_len
> > +                else 1.0
> > +            )
> > +            if overlap >= 0.5:
> > +                grp['common_nodes'] &= entry_nodes
> > +                grp['entries'].append(entry)
> > +                placed = True
> > +                break
>
> Reimplementing the common path analysis, rather than somehow utilizing
> the calculations you already implemented in the factoring itself seems
> unfortunate.

The usage model for `group_fit_dtbs()` is a multi-SoC kernel FIT (for
example, building `arch/arm64`'s `image.fit` across all enabled Qualcomm
or ARM64 boards, which bundles hundreds of DTBs spanning many distinct
SoC families).

Looking at your two points here, I initially tried dropping the overlap
percentage altogether by running `create_base_dtb_and_overlays()` on
each candidate group and merging whenever factoring reduced total size.
Testing that on a FIT containing all 438 upstream arm64 Qualcomm DTBs
was much too slow, though: rebuilding `base.dtb` and every member's
`.dtbo` on each candidate check (`O(N^2)` `.dtbo` builds) took nearly
90 minutes.

To address both of your points while only building `.dtbo`s once per
final group, in my draft v4 I've:
1. Replaced the unweighted node-path overlap check with byte-weighted
   overlap over `ParsedDtb`'s already phandle-normalized `(path, name,
   prop, fixups)` properties, reusing `select_best_candidate()`'s
   `_prop_byte_cost()` calculation directly and picking whichever
   compatible group has the highest overlap.
2. Added `--min-overlap PERCENT` (default `50`) so the overlap threshold
   is configurable rather than a hardcoded constant.

Testing `fdtfactor -S -F` on the 438-DTB Qualcomm `image.fit` finishes
in ~12 seconds, grouping 426 of the gzipped DTBs into 41 `fdt-base-*`
groups (leaving 12 single-board SoCs unfactored). Compared to a
standard `image.fit` built without `-@ -L`, that shrinks the embedded
DTBs by 61% (9.27 MB -> 3.59 MB gzipped; overall FIT 22.48 MB ->
16.81 MB including the 13.09 MB kernel).

-Doug
