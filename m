Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364640;
	b=cyvahNarZ31MPqlrADF80WuD/sryLWNlsk/hDVgIKxc/R+B5KfGzLhirCYQ0+J8SMIva
	 zw96LrweEXzf10U8gl+6Ubfwaa6aHhU9GuDdVno6sO+9Eya4qN1WY9iuxcPDmIaSoFr5i
	 xHREV4DV0BStCxemHYN7HitnM3TMKTp+zYVHgABDd/9DBEPONOpCTsi6tKJwpUcJM0fW3
	 mUlxMo6M21WUVoLx8kOZP/kP1kh2WB7T2o4ORmmeFBSKNPYmTqJQOEjLGG8RlXIFulkiL
	 9MUH9TWNvLXyYEZr/ejDHmug8GjHWJ0w2kB+kg1imGQy5RhPHgFh6OL07yEdLHO6mNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=FX9VeQdffmS4/jJpEL1BeyTCKEK291OuE2NXa5F9J/k=;
	b=Ux17aWg4MbxQPTf0frsOJrXiSF2Ph/BvV+delJDQTthvAaLmdeWynLPeYbVxS9npRsPL
	 xfkXzSkA0z5HChhVynu6ZKCrmpQos/s/AMQokZIqxIMtp1SPbyjPkSyXa+V+uriAta00Q
	 nJqhlrd011hQ0NEtnGIqPdCDTX1z9AHD2TkI1JuqgDAaDhY6BiUHsRmutGi5KQUZRBTKx
	 /90LoTdGDDbBBp6jddaWM/uoIJBKhm4VMLl5Ci5zRnNSGGhx47zLb8iymP+NjKxy6/XQh
	 YHXSQnIIH6a0KebADxYh31N4HewfL9d/W2SHXxzzoPgRsvDWIqVXXVGtj3yRzfTzqwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DAZ7mjsm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B6F60A2635
	for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 12:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B6F60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DAZ7mjsm
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso104852566b.1
        for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 05:50:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364639; cv=none;
        d=google.com; s=arc-20260327;
        b=BhqmOK9rZqDevz4KIdGOSOJQ17cbnK93jSmpcwI9Q2BkyRw2Fs1QaeHJjgwL7b9hUS
         +LBal8qn8ZfrYXI7sXJVzKVFmjZaUVwIEgStZp2LR2Q/s/oXBtP5vh6wWxO66wVRjZHZ
         JvBaqelRRakSdG6zLubPL3/kI7j1IUUr2PjMCv/DQdckJAMLSIPgm3qZ/0gF1rHYyoga
         DgS0GL/4kiRafFHq/0GL5ewz4aMxIjmdGj51mG2ZR2vXNGtwJfjJAVPmCf88BcP/Ykx0
         gV1P/d8xc9Fd1kE0ZjifUN6EMpgi8xmQPDUbUSO25rjyZX/0w7HvM2nWuYAPsrmKdnS4
         4/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=FX9VeQdffmS4/jJpEL1BeyTCKEK291OuE2NXa5F9J/k=;
        fh=v0GCJqyoWGhL0bL1BD0oUO+DkJ2nkPH0tE1OsgHyX7k=;
        b=JrCNNBXv0btEjX1CN3XNBKpgUEyMO3clHke8TFquOI32J9IfxEHseZJ0+QUUtTO3Yg
         wX0xdN0aD/1ZE3xVjVLypHYyqvlwuxOHk68VZYvh3dFwtB66H+4h1x6q4x0Pnnw4qmzO
         mtNmea/Jt50xrl+J51QEFM6pE8relum+0Uk4BrKEF1zeePUkFZchVt3QbUshcsEL0uyV
         Xt3qa8b5ogo8rMqMUZb1g6tTwm2ndI0FETTv5BICryM6E+0YrfyIx6Pa32VTpUqkoqQ4
         U6SKCL6x7BVW3i2tX80PCGC6vxjv3D2tvk5ikWlRei/Tpm+Y7K0BDQ4XB3o7fcOGRX5X
         G+Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364638; x=1793969438; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FX9VeQdffmS4/jJpEL1BeyTCKEK291OuE2NXa5F9J/k=;
        b=DAZ7mjsmwL9JHETg8ic2D7uVJPW/H86iM+OjshkUscEZXRjPvGiABUa0n/dop6UeP7
         6DEtoy51xJlFvCcR8RyAH0PgODy3FzHIvo5oLRbh/lVnbO0L05IsS2bT7xEnrLgN+OHG
         FQ3T9muyET2kQk6nKK2NH+rSqEyyOtIK2R86E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364638; x=1793969438;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FX9VeQdffmS4/jJpEL1BeyTCKEK291OuE2NXa5F9J/k=;
        b=h9jPkZ+gVknKYSh60jCycFD0+HivJ7pE7eNMqEJBC1EEpGOOUDUfM/ZP1eqMZHP4+r
         o8SNNKRRp+OU/KUjwawyV2MlDOOfY7ph3EPzOxaqArjTRLA9wwcR4xlr4Tes7aQMEmXT
         rNoB02JzeGNNwHUZ+BxJpvkjNWOtd6wUfLTotKquRCaGIe7KIqFzqf66cRLOU85aoF0c
         n9O8wY7syPDcHd1tXaGumfEUz9k4SssJKRwT+bgkoixxddcS4rjWu4h9ZACVARjC0Ex3
         tTX2ZopT5+lwpXCc5r+0fsj5vs48isNzXshpDguH4mG9cRAOTZ8zLmV5v5FhioGrt44d
         HYGA==
X-Gm-Message-State: AFq9FYJ93nXVxQ7EGpHDlcBF3iIOTLUvJZn/cbeI00WqP8ASBenvVKhE
	hjnm9nx5Tl+TjBALJDVbOLEYRKH3qn08AJQ0SqsmofLzlc3Auki7QDNWN/Wr/XU+ftaEIgKxXZ8
	SDzg5NlsTTO5aT5fZaXcFBpF+gFFwQb3NEwF1zPyi
X-Gm-Gg: AYBFou3fS2rodD925K3GgbjOxqZKgwO2Y6bYY/kM4UvdHiT2IPKl4yo8jeCVXSrSITC
	xFtMcW9ic9WhZ96lGP6IfjKOtzqfpMLNRwKM/EdbZ7SRoKcAizQnBfnpImw1Y1Zyaou8sA+ZGpF
	RLmXvV0EAtPvr1AHpgS1GQlvFGy9OGlfIr64CnDCSNkejcQopexXU9xJ8SJx24QXNwdPbhh9s6G
	YzlxnW1xqschZFY3xlY4rJKpK6M/OntLz38bkXlwHPRmVBE5xaINnmniXBkaNODJ2J0jH05c9xC
	qvHcrwIrMyL3x4V5DkUx76a1P/wFYiZz5p0tnRlWzinCAo0iahekr4FHGGjT8W1HccomkLUfV4M
	51G2NYK78lzcs8KaqxXmuChWG5GhuKhHLgP1WTCJVTiFGxVm9W5UAH6X4s/FYGNnkfZ3BbYQ=
X-Received: by 2002:a17:907:1b0e:b0:c46:a5bb:5740 with SMTP id
 a640c23a62f3a-c4ca7935979mr211532566b.5.1793364638552; Fri, 30 Oct 2026
 05:50:38 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 07:50:36 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:06 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-11-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-11-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 07:50:36 -0500
X-Gm-Features: AclHuK8TuSBAtrZecOD2tH8pJthaXl3o4LfHFWTO4xNv6q-hCysffxjLZ6tbXlg
Message-ID: <CAFLszTgXZ8fcHuMbMAorsDaebj43gU47bS48pO8dKtnL0JF+Fw@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] fdtfactor: Add compiled FIT image factoring support
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add compiled FIT image factoring support
>
> Bootloaders such as depthcharge on Chromebooks and U-Boot use Flattened
> Image Tree (FIT) images to bundle a kernel image with multiple board FDT
> blobs (`fdt-1`, `fdt-2`, ...) and per-board configuration nodes.
>
> Add `-F`/`--fit`, `--outfile`, and `--single-base-dtb` options to
> `fdtfactor` to factor a compiled FIT image directly:
>
> - Parse non-overlay `type = "flat_dt"` nodes under `/images`,
>   decompressing their `data` blobs according to their `compression`
>   property (`none`, `lz4`, `lzma`, `xz`, `gzip`).
> - Reject FIT images containing `signature*` subnodes under `/images/*`
>   or `/configurations/*`, as modifying FDT blobs and configurations
>   would invalidate cryptographic signatures.
> - Partition the `flat_dt` blobs into compatible factor groups (by
>   compression, architecture, FDT header fields, and node-path overlap)
>   so a single FIT image containing multiple board/SoC families produces
>   a separate `fdt-base-1`, `fdt-base-2`, etc. for each family.
> - Support `--single-base-dtb` to force all `flat_dt` blobs into a single
>   base DTB regardless of node-path overlap, failing only if their FDT
>   headers, architecture, or compression differ.
> - Insert each `fdt-base-N` node into `/images`, replace each factored
>   `fdt-*` node's `data` with its compressed `.dtbo` overlay, recompute
>   any `hash*` subnode digests, and prepend `fdt-base-N` to each matching
>   configuration's `fdt` string list while preserving all other
>   configuration properties (`description`, `compatible`, etc.,
>   populating `compatible` from the board DTB's root node when omitted)
>   and any pre-existing overlay entries.
>
> Add uncompressed, LZ4-compressed multi-family, signed-FIT rejection, and
> `--single-base-dtb` FIT image test cases to the `fdtfactor` test suite.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  README.md                  |  17 ++
>  fdtfactor                  | 588 ++++++++++++++++++++++++++++++++++++++++++---
>  tests/Makefile.tests       |   2 +-
>  tests/fdtfactor_lz4.its    | 109 +++++++++
>  tests/fdtfactor_other1.dts |  33 +++
>  tests/fdtfactor_other2.dts |  33 +++
>  tests/fdtfactor_test.its   | 109 +++++++++
>  tests/run_tests.sh         | 158 +++++++++++-
>  8 files changed, 1018 insertions(+), 31 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

BTW, 'FIT image' actually means an image in a FIT, so I think you
should try to call the whole thing a 'FIT' instead.
