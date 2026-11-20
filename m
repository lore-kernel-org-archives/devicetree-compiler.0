Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188037;
	b=ClI0VraeLu1sqgXjXho4BQ30fd/aB9ccqDc8fMn7lMhWYivnm/WbxYtaQ//h6O0+352O
	 ClNINlYM+7dFJolu+lFG8JCctpg8mYRtAWjUsQBkDwjB4PlwbNGNtvL5S+Svp4mHmlHMn
	 BU5bKY9DeF8BlB9rdVMR0FPmeNdP0RJg2C/Aso1uviBFKMn3Q/c9e6L9FseCHxc2FZc8h
	 dk8jfKesDAamkAhaSjtNonAXIz/2g/jnhbe+Jw1asuWrbEKkdju6v/gtJ5MeGtcJfq/41
	 zA5GPWDxv8j9OzCXCLFQ7+xt2XZxbohvX/J4vGTRUfO2hcqyFuWLufddP3RLYH1oSHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=XAPGvEQrLB1HXvB/eqEUppDavW95bHQ7K6tJw/flOAo=;
	b=fgg2i8QmBAsaUjMLQJ6GCO0SbpP0ncP5AJjU3atS1Z8+P3cV4KfYe9rVAeTrHS0egJDw
	 xY394EuDiN6FE8fjjg3gcgPYkS50JYa+sKtqRa5qyUrpQy3MLhu4z20MTlmRWzq9R7rrt
	 iVX/uSa9Qa5ugW7wrGBPpkiK/qn06OUv5go54mkdXwJbO5PprgN+yeQ2vOmbJgunoXqD5
	 Pi2NQIqIN8pokEngmwJO++NeEAgm6ChlL4D4adKFt6sqLDhG63sfdMpaZor+4xKevS1HK
	 NqwzXHET0sVMZTBI2UuHZXN4M5ZJWd+Xy70PfBv9B9H7lo1Jua1wkp6urF1gFLh68oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KrCLE9f0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B56606A339
	for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 15:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0B56606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KrCLE9f0
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso1316215a12.1
        for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 07:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188035; cv=none;
        d=google.com; s=arc-20260327;
        b=Yb1+Ixq0vMYEbKxQGsoXvLrPDoTqZh+6iyRVSktN6u4OwH9Xgt3DjRY7r0OeSmukqO
         lKvzeeke6CI+iWPjNoFRy8vbIOWCFBbyjvDOt1cCe4UK3LrUK59Zd7/4Yv1uefPOTyxU
         nMv/FBNV+cVLg5bKL1kkXkVLM1Mxy03q210NoNKJNtr1WWhfNPyOYCpS90cXwgDXt/JG
         sazhh0xwSZsGzVgRHLO9VvxYRmhq95bUWLuvySTXdaBfR7m4KEaGP7H6VItcqjLHjoNr
         ztBXi05BvouNd0xQiLb0FWvfyMcXRG+2q6kCDQTkx1zAw83upq2DXgxtTs0HH6i9RzTT
         0W4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XAPGvEQrLB1HXvB/eqEUppDavW95bHQ7K6tJw/flOAo=;
        fh=hgCycmTRN5MUyllYI/DZysF06+e1YJv60AR+HqulbV0=;
        b=rlDUNWcsBIcyFLC1rg3NltsJ9eGwP85m1RwiTkzyqfXguYcin91UYmm/pMoOS78vNp
         SePwbExlRxHFVD5HCG8qgJonxww5Ua8xJlxS8pNKTM0iuRtENgJsEWgL9taAntKcrRa/
         dp+l6EkaGAWcAgqr0k5ayKsc+4yOhssph3gSm/UyXR5Nu94QS2+mwPoBN9fqpLd/eCTV
         XMNfUxJuTGVK9s8SSqz3xenniBvfncfMG66GSQ04+SAQHL3PfWtHMYgKTVvAXJfwpaXA
         hPW+SbefRzaDSPdokJ4dRgjPlHquHVNQyX2ubKdI+Z5oW7F3w7K0tYGjFwBD5IEQ/MX/
         hKTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795188035; x=1795792835; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAPGvEQrLB1HXvB/eqEUppDavW95bHQ7K6tJw/flOAo=;
        b=KrCLE9f0l5kQICrTLb1eNF7JtQCvVuF5pqZmRGYh90Wdtxtc2EQ/byEDmslVTkS6G+
         Y//VKMfmofLsmNk/ui+8AMa7DPRNVJn7RU1PKbE37nSs9wL/SASUgwkuODsBC0fu0Dc7
         spKgJLyXh2jcWB4ScKLkSdjpaI9+qpIG0aZnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188035; x=1795792835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XAPGvEQrLB1HXvB/eqEUppDavW95bHQ7K6tJw/flOAo=;
        b=0gWwL/bMAnAMtHopSPh0VjE3/I5BT8eIZMTRcUW/VdSyd5Rfprdg7o/P4viD9nJ3YP
         Tu/dwEjX/hg24u9ptcYyxmxNzMEVwhXo2YjdH4Yr7CVOH60XYxuXLzB5ejKmv3ZfGHCL
         n+nHfBd4YBW9r/Pq6KQ27EAsIGFELXeyJoUyq3vbU7b1IyUJPMn+nV+wZAqNs5qy0Y6p
         P8vTSOt7Vb+49anXdAk148l5zpC60veSzmKUjoydeNomchyTLADSufaN4s+mj/0QZadC
         igOcqd9ueZ7VlfRXQL3lgYWxXi1liBucXiO07+yBeJIF0ixTjeiEunD4oba5/r55E7dt
         3UXw==
X-Gm-Message-State: APuU4Z+RtmR5PyJNidUbeGDwxKtn0r4+aDuSkp5p+k5JF7ygdZd4VWmT
	blKaTRruQowjUh0O3kMWfzPoZcHiWJWePMKXDwZMHEILHZ4MEiJptfV2F9+g6KlQSNwSSe6FZLX
	TUsB0cBe4e0qA0290u0DWoPKt5SZ3B5y2x8oOU8lQ
X-Gm-Gg: AZFdTZe0tqHjykaGDUoYandtksgrpNyTetFHFkHBYsQB1abr47cBBmWJDmAizdNAh3n
	qOD1TRl3Wjj/gOMNQRNyVUniu9xq97kiDYwg279Oxpi0mNPRSo3sZu9KCrIwdaRZSWSkLQVw+pM
	vcQRQqzFiHs/hnNrbMd/sjX/hyqVjFIyRNeHZvNJoQ7Xrok4gUcILuPDHZyXq96U6+TC9uf8/cg
	SPE8WOpfPBWrz7ubSAkdXg7q+64d9oowtpEN2j+LWAiMMiU1uYz3lu6Otd0WXKlzhEjv3KIanQ2
	s1qpvTLGKaMziDkmwJ+3sU1p5Y4t+FJE+CIP0PiLtVT6RCckODWdJdEilGd0XqgMq3WjB+r5w9a
	Wad7477oaX+cXUoVcKzzwa6A1rm2rg9p8YgwU+vXZC8jZmsssgPUykjFl
X-Received: by 2002:aa7:c249:0:b0:6b7:d0c7:4aad with SMTP id
 4fb4d7f45d1cf-6ba37c75ef9mr2328640a12.6.1795188034912; Fri, 20 Nov 2026
 07:20:34 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org> <20261116205320.1621386-8-dianders@chromium.org>
In-Reply-To: <20261116205320.1621386-8-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Nov 2026 08:20:23 -0700
X-Gm-Features: Aa3M54psUBrQPUKXYteeAD9WgtZ-YuEDe8s7JLMYNK5VihZIqFHf2DJoFUBm_As
Message-ID: <CAFLszThHKUSDbiDqbmhSd7SDpMOvpeGcU_NdizYb1azYhejrow@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] libpydt: Add DeviceTree live tree representation
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

On 2026-11-16T20:52:57, Douglas Anderson <dianders@chromium.org> wrote:
> libpydt: Add DeviceTree live tree representation
>
> `pylibfdt`'s `Fdt` and `FdtRo` classes operate directly on flattened
> device tree blobs, where inserting or deleting nodes and properties
> shifts subsequent node offsets. That works well for in-place queries and
> localized edits, but makes multi-tree comparison, structural diffing,
> and bottom-up tree construction (as needed by the upcoming `fdtfactor`
> tool) awkward and error-prone.
>
> Add `pylibfdt/libpydt.py` providing `DeviceTree`, an in-memory live tree
> representation where each node holds `props` (a dict mapping property
> name to `libfdt.Property`) and `children` (a dict mapping child node
> name to child `DeviceTree`), along with `unflatten()` and `flatten()` to
> convert between `FdtRo`/`Fdt` blobs and live trees, and helpers for path
> lookup, node creation, and pre-order traversal.
>
> Add unit tests in `tests/libpydt_tests.py` covering `DeviceTree`
> round-tripping, subtree unflattening, duplicate-name and corrupt-tree
> rejection, and navigation helpers.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  pylibfdt/libpydt.py    | 184 +++++++++++++++++++++++++++++++++++++++++++++++++
>  pylibfdt/meson.build   |   2 +
>  tests/libpydt_tests.py | 106 ++++++++++++++++++++++++++++
>  tests/meson.build      |   2 +-
>  tests/run_tests.sh     |  13 ++--
>  5 files changed, 302 insertions(+), 5 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
