Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188565;
	b=xKJDv/OCTkI4PoFMfQkJeWzz+LXInGj4TCsCH8jgTssXl8sYjciqrOOzTFN0CMRY8YXt
	 NEhajE7NdjLY5YSO6fb2ib/FDWbhNByJSrv0kJFB7+ermhMrR7HR+wV2dSe86sd5PZcWR
	 2MVCL2n8ux06Lh5B0NpzxJM2lOc6YS+m67aeT1Ycs+d1+hqpe1PFyTKiEzs2dG8HXPdqY
	 yQ5UvH5qQW5FENWN4sNB+1xh6LL66JPDFtD2cPr+w3fOvF1z7USQ8V0eq40szQ1ZFbJqq
	 KWkXWQPBsDw+Uo4pWT/mcDdftP8HhMzi6TJyKIO4Bo8DxWwt0hMwXr3NG9a+K68mwrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=DjTk1CWHGC1H08TBW3j7WrwU8Yl7Bux9rvyQByoacuk=;
	b=lz3aiWR5aa7KCZ5FvXojXzjIVhMN2tsIADm0YX8bHQOv7jc49jtirairy3XhP8GlBp2G
	 iyGxyw42g2rf+1olqBlf+lr87nwBgKWsM5i3DSawDfBW/JQ2yVhOI8D99PkTGkQ0kWuZ5
	 Uw+FibcFPI+QmE+46wTCczNvvdjHWy9zB2uzrx7PV+2rtHCj4oTd0qP3VqliK8Bl05wDb
	 matqBxZ89LqBit+SEmxP+AUq5A0P6tR/mpz2ztsDU2/j5KY3W2xSqS66yIiWo2OAHB3Us
	 /wYOSvhH0rr5+MgrA87hXsDxLehF9Gv97tIcZlDe0HK0D4Fb949hXP3jbiU5MqrZnIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hCzH85BV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8541606A320
	for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 15:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8541606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hCzH85BV
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso573426a12.0
        for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 07:29:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188564; cv=none;
        d=google.com; s=arc-20260327;
        b=Rhy8+/EMz18S8XQ9vEgfoegBZd1CSkdojppwTPIETaDX3QRBy4MZsCkpTl40sLlEvi
         d+HM1Ms+GFRaL/Zkfj0tzawtGJ5nTC5MHbwH70Ft44EAEC4NFLVoBwCZFeqZvkViKSeb
         GuyjVYBNWeN2HqEv5NVZBYT8IuM0qS/7QikglqWKv3H4gcC2BGMxokGcbxZKBREvY7Zp
         y/Cy9yPFD5qiVK10OgnY9DoeD6Mu5rbXaK1U/F0gy5LGuLWrIqhQB1EiTk3dX60/LqjK
         oNu6vkKDyBYvdheq1KxrjnGQUzHRwLTb0u4CDtunlHk7sbvw2ZYcMBDEa1844UhTqrU6
         m1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=DjTk1CWHGC1H08TBW3j7WrwU8Yl7Bux9rvyQByoacuk=;
        fh=hgCycmTRN5MUyllYI/DZysF06+e1YJv60AR+HqulbV0=;
        b=HqjP3lzSjVFXbFdLPfTq8ApuECmHeykOSncaa3d/vx3eSW5CIxeak4lMhLVM9wXCHd
         tPc7meiO8KERSmsCBsks2pBlqqQ2FCzpZvcHveASLecS4f2BiGxVygDwhB5fN6RIOAn4
         C8OeQLktqYT/3aWmM/xKpxKRIcqRgkOqs+0AXO9M6NUHvz3LAib2CN4Sq3RsPJFnwYkz
         jU4XlPBZBM+x6YbNuYshO1XRY3sq5V3NA5RauY6gej7caGhxDHZ0jm7FVS7Xck5d+Ip1
         AYPUpnXwZJNc7pJ1Z9HbLTabu1ts1NKXVEllj7Idx2iHuJrkiKv5WCI3H1i6+MdwvKJY
         +8uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795188564; x=1795793364; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DjTk1CWHGC1H08TBW3j7WrwU8Yl7Bux9rvyQByoacuk=;
        b=hCzH85BVPDhLO7lMrTvWeF/3llEmVxOgnazI38Q1Aw4R2uV++6lMSeDT86PyrWhCK/
         7FxiYQNuKkg5Szh+/Zun1ocRUKYdRdonyhbZq+3IcZvT0M3l6Wzoz6+FP4hdgW8NTCsJ
         fJLNAgsxfsNN8mM8MZeianG6lWMRzmh1BR2WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188564; x=1795793364;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DjTk1CWHGC1H08TBW3j7WrwU8Yl7Bux9rvyQByoacuk=;
        b=rFZc5yCnGEBpySRB66hWBBW5W+Xw2+A9di5Y29ZRhqnIvmWFmh5RW2VgzPS1BRklun
         e9eRIUMt1Kx+AVamvknnCSsPh1whk2i60KXrh//x0C8H8KCwkl+jE2XKxroUphL3JJMn
         tHKpVvBWFtXmSDdhaaZND3OOYbWjmopJ7ttcwvV/mUF7IyzGz/sTskk3MXSJovHdjMRT
         CzdB1DwK0t2fULhHWgZE21lay5nysUey0e1ykSqetB32DJ2FY7LjdW387lVoEW6qKhcK
         I0Zt2mS3ylwYYPyyr4kjoFNrqNjUnMtgkmo75BhHYTJoavmV/nfIEDzccfrlWaHiVl37
         SkLw==
X-Gm-Message-State: APuU4Z/kLiCNEzL3pbG0CtQTyEgRSMnGPBRpmO4X/0RqkBzKHlTj53/B
	SEmOpZ6LVdHnhyPB6HkLuOI10c5R3uN99n9534mmNfWrcOZhVQ+3rUthgKl0riUaH06CX1i1Xdq
	Xc8PgkFDaIVIU6CoPR43YIMlLXzPRKprc9ObhzxBt
X-Gm-Gg: AYBFou0GRybGGtCnzXN2XHOcYHOqc6yQZoDfCTBaBt+3ugVtaCEq6pGEIWPMtSC81zt
	O0nBbM2CmV2WdFhCRNO8FvgIUnpMZlsAE3g6FS4Q9FwNcIch5Y39CSzVQKDyqYUdc3Cj2S/3wcl
	i/3H9zUZK3clLp78/VwXkJmA8n6H/oTyi0F+4uKYkrmL7fELfsp2qc//8IzJf0wZyY3976ULZRE
	anFi27HljQcnrmlCvJfLhK+XgJyirq2wcBUyZKIoBH6vSON3TzyaUoWo1p9ksvLPLaYVpobkTJW
	Mp6Jp3n5UEf7YWaIeYyv0CUV2fjjQ5OCtvsH/C68QmMvz3MNhBf0y1/MPX4dOVczwZcS1hI4k3C
	GpyuqM18Om8jEiiuGyV38IzOrPoU65wqQ9ctO+qd1PYeNk1Gb8dDRbsl+RNA8/B/vIW9JZM1oN6
	ZqzxBua9P5EEDQjnfz
X-Received: by 2002:a05:6a20:3d07:b0:3e1:89d6:ba1 with SMTP id
 adf61e73a8af0-401493a748cmr4551292637.3.1795188563880; Fri, 20 Nov 2026
 07:29:23 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 07:29:21 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 09:29:04 -0600
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261116205320.1621386-15-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org> <20261116205320.1621386-15-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Nov 2026 07:29:21 -0800
X-Gm-Features: AclHuK9eiK6dJA-hmCi_yTft6UpmFh3_W8w1gc2pLqne4iXEAqPidl99ghlI8xc
Message-ID: <CAFLszTjEczj5OYCV4sXuAHieg4rWZk7F24V-uME9Jvv--=9x0A@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] fdtfactor: Parallelize blob compression and decompression
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Douglas,

On 2026-11-16T20:52:57, Douglas Anderson <dianders@chromium.org> wrote:
>
> Because Python's `zlib` and `_lzma` C extensions and `subprocess.run()`
> for `lz4` all release the GIL, add a small `_map_blobs()` helper using
> `concurrent.futures.ThreadPoolExecutor` to decompress input blobs and
> compress output base/overlay blobs across worker threads in
> deterministic input order whenever multiple compressed blobs are
> processed.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  fdtfactor | 190 +++++++++++++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 138 insertions(+), 52 deletions(-)

> diff --git a/fdtfactor b/fdtfactor
> @@ -140,6 +141,32 @@ def compress_blob(raw_bytes, comp, filename=''):
> +    if pool is not None:
> +        return list(pool.map(lambda t: func(*t), tasks))
> +    with concurrent.futures.ThreadPoolExecutor() as new_pool:
> +        return list(new_pool.map(lambda t: func(*t), tasks))

Is the shared pool worth it? Creating a ThreadPoolExecutor is cheap
next to compressing even one blob, and factor_dtb_files() already
relies on the pool being created here. If _map_blobs() always creates
its own, the 'pool' argument can be dropped from
_extract_fit_fdt_entries(), _strip_fit_unfactored_local_fixups() and
_factor_fit_group(), and factor_fit() doesn't need to be re-indented.
What do you think?

BTW the default is up to 32 workers, so with lz4 this can start up to
32 processes at once, regardless of any -j limit in the build that
calls the tool. It would be worth a -j/--jobs option, perhaps as a
follow-up.

> diff --git a/fdtfactor b/fdtfactor
> @@ -1668,7 +1731,24 @@ def factor_dtb_files(args):
> +    dtbs = [
> +        ParsedDtb(
> +            p,
> +            comp=comp,
> +            fdt=_open_fdt(raw, p),
> +            uncompressed_size=len(raw),
> +            compressed_size=len(fblob),
> +        )
> +        for p, fblob, raw in zip(input_dtb_paths, file_blobs, raw_blobs)
> +    ]

This was the last caller which relied on ParsedDtb reading and
decompressing the file itself, so the 'if fdt is None' path in
ParsedDtb.__init__() is now dead code. Please can you drop it, make
'fdt' a required argument and update the docstring?

Regards,
Simon
