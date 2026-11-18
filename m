Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995662;
	b=iSe3zLHuXkA+yhqm7HCQZh8PzZN7tHxKgBTtIL6TIMOB6CICn5j6pc/yV1VJPO5Z9dmG
	 qSEDqdEwUIe++nMKZKBWoFsCDHxED878VzqgO6c0OcPPkacpTiragI777VrgDtMWhPEFq
	 gkFhKz7oA7TrIM+CyWvad3KdXZ2EPtOxGlDK1ShMjanV78ZxzdOyL7te7sYEwgRWjGh1S
	 gVQFcmIFWw07Q5un79z2EJC9hg4ogr3pKSrMU/5vAC/oP9G+OUcKhhFYwmp20aUXttv1o
	 eFA+zU9AWtTuEqDCobuhe9UAElZomfP9aQNBNsDFeodXAryJoa/Fb62W5eGvWNGMpAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=z0FxgduUeYAAYLU+x3UO1uC70A6tSSO4t+ElS8hcreI=;
	b=bvrPTrXUvii3Pl/sjyNx+RPIYJElHrl6z690meCeYZssqSRBimMyzyU1weUnC/iIH9JZ
	 K7QjeazOGpRSKfdYgYl23tAxTsAQR//h65gy78Ng08ZDu2AdRbN0L0KAQhkqtuVGQuA3e
	 qzJhzTgMV8oTyCJuU8iu7lcQ2STY+a7sDeXlTWUBdCFeW506bWPv6jeoejIWA/owxDK38
	 udgRsRN24N6kX5OXSmaxHTo/wKsUvrowVNNvvJO4e01TGGNbkj/Ivx8JwQ1qh1mV5Rp24
	 0D0BIQpuChtrnGpM1KIzC9rjPdVUgmqarLqQ5OzR4b0qWXaob0a068EOAE5blBpHjcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5eaYciq;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F83606A330
	for <Devicetree-compiler@vger.kernel.org>; Wed, 18 Nov 2026 09:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1F83606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5eaYciq
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso7380845e9.3
        for <Devicetree-compiler@vger.kernel.org>; Wed, 18 Nov 2026 01:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794995660; x=1795600460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0FxgduUeYAAYLU+x3UO1uC70A6tSSO4t+ElS8hcreI=;
        b=Z5eaYciqucY9tPvMWgtwpa6lHfPYOF2Xzo8ZpymIHEeYaM7ceXUy4cwkRDQH1/WaFo
         fKdLexn2Uo3Dq4t5efXPTUnGy/bRRy2QwmHyxG5iH/vKXImjNoqooAjOOPP7L34/nZqJ
         0SlDYecanghmzXaqkIKNSHvk9bG+A96Cqr9B5DJQ5NeHjJ3ehlKt5v7IIqVtl1Hy8f7f
         4ey+5qQT4d+CVRauLztzDPPOwNR5Z7d3LU4h2Y73wKsvSkAdYlN6fJA9P6e1XYnq6oQD
         SqeB3QBksir95uLM3TPA0ItzV/6IR/+55FRnZktc3DB/sa/vikwo+v54XfpkHBNUrYry
         KvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995660; x=1795600460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0FxgduUeYAAYLU+x3UO1uC70A6tSSO4t+ElS8hcreI=;
        b=Grn+GpS2bmL/BOZ45cs0jr2zWcOLkF/xhVwJKk8h29QwnezCR1Mx9AFCaO2sO2A9QV
         8IwJSGcRyTnDeeMGveL44TVDrGbLa1EH/wqsKmXgzQ+eN0R/IIRSSYDgCX41RFr5Jv83
         Vo8gGfIbX9Pq1j3jF74IdfTPP/7dayUFQwJ4Er+3BEeWrwA+GrBrkoX7MwQ9YJrdnIT0
         r/vo7J036OekC1TVFJffj+z1rtbjoStuDTDYit4AKMeU/1icAiUmriaJiA7lbEkTp6P3
         q2qNMb3Zjr5Prtk9wCVr+Vk7zMwGnkBjUBL0J3e12yuqf5l8lAhOKqb920UCNsFXLn8K
         PYAA==
X-Gm-Message-State: APuU4Z+1M9OrGQUQvip57hRjLw5nkNJi+7bqB1z6gyCKzdK/FaP2kYwL
	KP05GCtCekUhU4C1HPHlc7DzAOrBqgN8ZiVBRhz+yGoXhrK/Ig5VUPm9
X-Gm-Gg: AYBFou2loULSKc3ibNtP6HoGmb/DBEzteWpwsApXB0L5HGWLCbwOlj1kVl0X1DPs3S5
	4PK3Qcbt5aszpvcAjVEkNFpxhsff0YMR9tCG07Ia/aseZn2JXGolEDhI+hWDs2sstiBtF5aC+Em
	ENYZjbfZsyDR/F4v49HZwlfdUqISY565c8eLIET3GFWl0f3OPbuIqjd+OHTeEG8a3T5rXID2k7f
	mfQjoGRcFfjZDlTJCssc5zsYnhv+48Dj1/aORF5rvrpxbeuoHZe+9wIEMSgZG29MhsL0sslW5pM
	nKsiWhgoMnxc1tnNl/HorKbFR1rDK3MlDDdWUagzIjWcWTihZLVDRvr1AfOa6WMsT9anG8YaE4v
	glqsIBYdCH/7/YVpKYR3i3vs1ObkvUpeQwvS1G6S7sc1fiVODDu8PtqzKQC+Z1INcs/FArU2ixP
	kFNcu9IlYxOHOKXa/QVnodGkU3q2LHOGvvmnSqoftbg9lXSmtasD7bZnXKHmOt9CusamEs7eMn0
	hIDgPnhvA5cKFRjjqzAPmZHNqD2GDJZvC8jcUri1EPkoS+8jhT9Periwi2/6U4XSGh6JjYfa9Pf
	+ItTRHIBfIQx/Cr6Xrwd2Oaty/NEe2zeo7nHWYeI7s4zVi95AnszU4FLwm1eK11ylw==
X-Received: by 2002:a05:600c:4fc6:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb7da23baemr38830375e9.15.1794995660149;
        Wed, 18 Nov 2026 01:54:20 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e50e992sm24034685e9.0.2026.11.18.01.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:54:19 -0800 (PST)
Date: Wed, 18 Nov 2026 09:54:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Saravana Kannan <saravanak@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?B?QW5kcsOp?= Draszik
 <andre.draszik@linaro.org>, Simon Glass <sjg@chromium.org>,
 linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 Peter Griffin <peter.griffin@linaro.org>, Julius Werner
 <jwerner@chromium.org>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with
 memchr()
Message-ID: <20261118095418.51d30ee8@pumpkin>
In-Reply-To: <20261116205320.1621386-9-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
	<20261116205320.1621386-9-dianders@chromium.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 12:53:05 -0800
Douglas Anderson <dianders@chromium.org> wrote:

> `fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
> across the string table (`for (p = strtab; p <= last; p++)`). When
> building or modifying trees with large string tables (such as DTBs and
> overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
> `fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
> byte dominates serialization time.

Are those symbols just in a linear list with embedded '\0' ?
That doesn't scale well at all :-)

> 
> Advance `p` between candidate first-byte matches using `memchr()` (with
> an explicit `slen == 0` check for empty property names and a `tabsize <
> slen + 1` bounds check before computing `last`), preserving identical
> suffix-sharing behavior.

Might it be better to scan for the '\0' that terminated/separates the strings?
Then you do one memcmp() for each string/symbol rather than for each time
the first character appears in any string.

Even with the code below you want to do the !p[slen] check before the memcmp().

David

> 
> On one stress test (running the fdtfactor tool across 438 arm64 Qualcomm
> DTBs) this reduced `fdt_property()` time by ~5.6x.
> 
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Found this speedup while benchmarking fdtfactor. It's not critical to
> functionality, but seems like a nice win.
> 
> Changes in v4:
> - New patch speeding up fdt_find_string_len_() with memchr()
> 
>  libfdt/fdt.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index d9ccb70345d0..c7cedfba7815 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -348,12 +348,20 @@ int fdt_next_subnode(const void *fdt, int offset)
>  const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
>  				 int slen)
>  {
> -	const char *last = strtab + tabsize - (slen + 1);
> -	const char *p;
> +	const char *last;
> +	const char *p = strtab;
>  
> -	for (p = strtab; p <= last; p++)
> +	if (tabsize < slen + 1)
> +		return NULL;
> +	if (slen == 0)
> +		return memchr(strtab, '\0', tabsize);
> +
> +	last = strtab + tabsize - (slen + 1);
> +	while (p <= last && (p = memchr(p, s[0], last - p + 1)) != NULL) {
>  		if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
>  			return p;
> +		p++;
> +	}
>  	return NULL;
>  }
>  

