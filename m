Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805262;
	b=BqzfWoye5bvBKb0r44UrUEYfD/QOK59SKcjjj8BaoReSy+1iNyk7OLhvMlPjkNA0kEAC
	 uJLtYnDgytKUmPN4YxSNsgy8dMnaCyBSh4rnH/Gq2Pbk+qcA4TzrlEzrwplbqgiXY/Dh1
	 vRZHFr/IfEb95EtUjcG5vDmH3neeQOIsLkiePJYnW9LoRayaosKoNn/pkvWr0uQ73h8V8
	 9ZwKKtfg3CRi3AHKzuVnsCgHXecLtHTpKn8SXmgobgfr8XnSsVkG3xnLaE0jEUUF9OAtf
	 6E9poJkTlrGuKzqV7QJx3KAnB+nh6U3my7reujafKnH5g50wnZJSLYz8rzgQs8w7HYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=mq2xmNaUh2by6AqrAmPxCFK3z7fzGjmGK56NnFUbbQo=;
	b=4BZSmqC5tNuGeAVGyrGenUWJFAgymGpt6ASsq5GJ0HjWlPKUMt1gA3Bbc9LiwwDhTRy4
	 8OTHoT3DhPZPPvle/UoIsn8R8YjMxlptku0QxwNo/Sxca0nBWP0moxlwJxdBsTxUtVFng
	 DYjK7M+mqw3kzeINHWNcER0axKHBAUf1V9gyCsYppqk2/eH65ZvKoj3gdrOhyH0iAHPdc
	 r52bi8vt+TYDk2fg3m9+aDz57bSegVpE2VlLcPptt6e8mGuuAfijW4hVOce5WdY9wz0D2
	 UQDomWlZGhOD6cC4Zh/c276nSSXNeVmmWYAvcYUzV8iaGHpamwuVmrY696hEA9YTCyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YQ6wMMsG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DEF606D81A
	for <Devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DEF606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YQ6wMMsG
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1241699a12.2
        for <Devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805260; cv=none;
        d=google.com; s=arc-20260327;
        b=lcFZe6GhutYQhbeVdCiy1abYAoONZGLDNCxYG6nRsgC3z3YGDscth52LXzoopeRXq5
         5YugS2kZmca63DPEGuYxaZlwghrogrE6M9kO6vzwzosKO/thUQGeKMDyYsipZj8m2Z6d
         vzaWW4R5WHQeYINJ/pyaruDwPKpxyO2VadisPhUEIrPukF8rXUUABVfd4e19h7aQBZxD
         mKmD1ncQgQVrlv2mWed1K0jqlfLPnZLBXoxYxGE9wyQik//5x7zZbHe6KVfXaUU3C/K9
         6OY1OHpG/ZueBAV3KjoaMlXBUQ7d0u7SkxKNI9zqJuN18U3FPzpVYVsVAp2Osl0vcRTZ
         JD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=mq2xmNaUh2by6AqrAmPxCFK3z7fzGjmGK56NnFUbbQo=;
        fh=4BA7Iq9H0VSWaCP4Je+uW1rc04Fmu9gG6jldUSQQ6Y0=;
        b=SktEvnW2l0T66UM1sjgDo5g20gZe8KCjgtt3c0eE/yE/vwq4AOTRTnwon8pUlxXE7D
         P64ktg3bcLQtCtbzWkIjd5RHeTPn+TuNBiEKOvK8xZkr4gLqfbgfmEcuCiPYMocbEO03
         sm7uOyRdDOdZhMtvb56LC+bmz8ejqPPtOwS5OTcDE+p8/nG4Un+PgPepg3Qp9EQ6/yvu
         2YwJIarjcJ9gjP7qlRZ4m7QL1Np/yigjk3GzDlMyZXVeD/6SOEBs5FNNHHuGRWci1wrT
         PB2JypJ8dHWCjoegXIo6rH+ZEPpMhcvpvp1Osw66iNsMswE/6WR0iowMg9Ouhx7KdJ3Q
         Q1AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805260; x=1794410060; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mq2xmNaUh2by6AqrAmPxCFK3z7fzGjmGK56NnFUbbQo=;
        b=YQ6wMMsGBsQPo+F1c/0iM9292MWRRRqOc2Ys4vqqsUkmFM8CQzcH+G/eG0+UUNaWMX
         CiURxuJq5Hi8mWJ/PKKiOi0zj2HaopnbY20+WoMYMquZBJjzeJteLOrJpoDB8U3t9skf
         hPT4/waxCbaubuo1soDK7gkDX9MK84WldFjzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805260; x=1794410060;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mq2xmNaUh2by6AqrAmPxCFK3z7fzGjmGK56NnFUbbQo=;
        b=YMpxmPUqTYF7SCdzE7084+eFL5cQsaEyLIkPTg5T+U1hkw/OT+ovLca1CF9sBLbVa/
         b/TQPWbdprU5AqmfSnd8CUAepTGdRrZIOcCdTxd6rSsC2/BQhcxb/qp9NeWtbUdrn9sn
         C+i1VyIX+tuGy+l/voMewKFGMwkSbZpGcBgowq1/ilXSyqC1CdA34Ne8dJu3ZSJfSjIA
         rtVaX29JQoIP0EBfmhCk1p3XF7A5tIZWr3tEyrTGTKaq0zNvpymZCL1RfvDt10Mlrs/R
         UyCmqPQJsROZFdhXw3r1N6dKy+fDXf12OkiSbWRP9gwx+Nq40oxy/idpy25s85/L3bRp
         FG7A==
X-Gm-Message-State: APuU4Z/Qo3y/IkRULSic457oyyzGp1JHktRrbcORhSxlqN55rzES3wFN
	ghN7TlXBcFe2iyA62OTTgRTVaDP8Og3vz7dpdC49qetlb2TonyTuxvZvJjXe6wBPFWlTPijVNoa
	bqlxv/FdhmfcBQc0S6Ad5fz0UC4gmvH8llebSFslP
X-Gm-Gg: AYBFou2lv0O2wsB8v5mYM8vxzewDj5dooDGCeq4Psu5bNEMdsaAPo1YhQAO169aXQ0y
	+CUmtS57qBIFs1YCN5/64LwFk57jnz+gpYWwRojxRWirdYEzL6VheIL2y30mBB4gRkEP7YuU1BC
	BhW0BXfrlzimQWSdA8KvprGvxNPW0Nm5FlJrjzB85/HS/iENU03i0giYdC8Bd2zw3ghQSgdgI/J
	w2xxQad7ZLAxIdnGjUFYywNsbUluWLFcDvPwcrTQxkaFSWUKHg/SNfnPuG9++33sqPpJ/1mlQv5
	UKZhhdUXMTs8DFptwU09JHEtDze0fSjzqaaC44stKEPhsXfgUyOPo/OtJOykU84CWPKBp+mpNyp
	Xdk6QEbjtKn8sA2+eaXD+wFDTiOyjqzOsiE6Bi+QyPdUB/Nvqfoms+jgXvw8JvhMbTxmfa5M=
X-Received: by 2002:a05:6402:5295:b0:6b5:5fc8:9cac with SMTP id
 4fb4d7f45d1cf-6b55fc89e42mr1846232a12.40.1793805260561; Wed, 04 Nov 2026
 07:14:20 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:17 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:01:33 -0800
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-12-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-12-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:17 -0800
X-Gm-Features: AclHuK8qa3D63ZO_9r8BX5LxaLgLW4FwLJ9apCehDmSsDt5GX7DSX6uYUevIrMw
Message-ID: <CAFLszThLk8zag3CK6FD2-vbGD1qiWoAXu9AturXgWbJS9vQ=7w@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] libfdt: overlay: Update base /__local_fixups__
 on apply
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Douglas,

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
> tree matches what `dtc -L` produces).
>
> `fdt_overlay_apply()` updates the base tree's `/__symbols__` via
> `overlay_symbol_update()`, but leaves the base tree's
> `/__local_fixups__` untouched. As a result, applying an overlay to a
> base tree with `/__local_fixups__` leaves `/__local_fixups__` missing
> the phandle references introduced by the overlay (both from the
> overlay's `/__local_fixups__` and from its resolved `/__fixups__`), and
> leaves stale offsets if the overlay overwrites a base property that
> previously had phandle references.
>
> Add `overlay_local_fixups_update()`, controlled by a 3-state
> [...]
>
>  Makefile                 |   6 +-
>  libfdt/fdt_overlay.c     | 527 ++++++++++++++++++++++++++++++++++++++++++++++-
>  libfdt/libfdt.h          |   7 +
>  libfdt/libfdt_internal.h |  21 ++
>  meson.build              |   5 +
>  meson_options.txt        |   2 +
>  tests/overlay.c          |  80 +++++++
>  tests/run_tests.sh       |  19 ++
>  8 files changed, 663 insertions(+), 4 deletions(-)

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -1135,6 +1134,524 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> +			next_lf = fdt_add_subnode_namelen(fdt, node, name,
> +							  namelen);
> +			if (next_lf < 0)
> +				return next_lf;
> +			if (next_lf <= ancestor) {
> +				int delta = fdt_size_dt_struct(fdt) -
> +					    old_struct_size;
> +				char *new_name;
> +
> +				target += delta;
> +				ancestor += delta;
> +				name = fdt_get_name(fdt, ancestor, NULL);
> +				new_name = (char *)(uintptr_t)fdt_get_name(
> +					fdt, next_lf, NULL);
> +				memcpy(new_name, name, namelen + 1);
> +			}

Almost, but the pointer passed in still goes stale (my suggestion of
re-reading the name missed this). When /__local_fixups__ comes before
the target in the blob, 'name' points into data which the splice in
fdt_add_subnode_namelen() moves, so its memcpy() reads from the wrong
place and can overlap the destination. The final tree is correct
because this code rewrites the name afterwards, but the overlap is
undefined behaviour. With ASan and -fno-builtin-memcpy, I get
memcpy-param-overlap at fdt_rw.c:405 for a base with /__local_fixups__
immediately before the target node, where the name is longer than 4
characters.

Please can you avoid passing a pointer into the blob? A small internal
helper which does the splice and then copies the name from its new
location would also drop the cast, although it needs care not to add
size to IGNORE builds. Using memmove() in fdt_add_subnode_namelen() is
the smallest fix, but it still copies a stale name. What do you think?

Also, gcov shows that the tests never reach this creation code, in
either direction. As far as I can tell, each target is either the root
or already has a node under /__local_fixups__. Please can you add a
case where the target has no such node, with /__local_fixups__ both
before and after it in the blob? tests/overlay.c already creates it
first in the root, so that ordering should be easy to cover there.

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> @@ -1141,6 +1141,25 @@ fdtoverlay_tests() {
> +    # verify that /__local_fixups__ in a -L base blob is updated when applying an overlay
> +    run_dtc_test -@ -L -I dts -O dtb -o overlay_base_phandle_lf.test.dtb "$SRCDIR/overlay_base_phandle.dts"
> +    run_wrap_test $FDTOVERLAY -i overlay_base_phandle_lf.test.dtb -o overlay_base_phandle_lfO.test.dtb overlay_overlay_phandle.test.dtb
> +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b a

These assume UPDATE, so 'meson test' fails for me with
-Doverlay-local-fixups=0 (7 failures in the fdtoverlay suite).
tests/overlay.c handles each mode with #if, so please can you do the
same here, e.g. by passing the setting to run_tests.sh and skipping or
adjusting these checks?

Regards,
Simon
