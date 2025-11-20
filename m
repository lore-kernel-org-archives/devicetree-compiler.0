Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FE5182B7
	for <devicetree-compiler@vger.kernel.org>; Thu, 20 Nov 2025 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763676617; cv=none; b=fA7UxsSbjis8d6ccTKYcdBYQ7jd8Wsu7mJ4nfvcpAiWXIYyKetLBJeKjbn7+H4AeSuegl4/NrxviH45wgC4LaWIjRIIZ5i51ch1wRX+x0MARfj6bQ/w9ON/mkUEcQMpd8Nam8TZoe6hru/jqVxrUMX9RFrkWM9c01F79O9LOEvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763676617; c=relaxed/simple;
	bh=XuDzQzGl3b0fYV5Tzmep0amiSysM/d2qlcM9Lc9i/Lo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Keaw1tqfqA4jjHIPWQXyqcq2Dt2U14dEk04WSMbL3yBBba1ktzMG8GKnbFpkoJFQfmALafw6efC15ICAsKPa8GxfYbnr3rUV8st79Fg6WoJgN8ZYts8jYvJgh3At6ZvSzDikdq0AMqS6mRZcywP/lDvgxe7Qmd5/JGNBZ8pFfQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LoJot8Zu; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LoJot8Zu"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so2284615a12.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 20 Nov 2025 14:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763676612; x=1764281412; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XuDzQzGl3b0fYV5Tzmep0amiSysM/d2qlcM9Lc9i/Lo=;
        b=LoJot8Zu0Z8vzNxKx7RFuvtbuz3hEiyW8H5HabpWTHF3ED4hu+ntLLj6EpA7cRMdLG
         SP3nnZ/at+tKiow3Xc32T//ERYgvkaKcSVJ4h28v5uy460C+SU+Q2w9KltXNb4dyPxkj
         /ZSIGsw0qPC5aKV3XpUeIa/MM6w2Oi7YanmTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763676612; x=1764281412;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XuDzQzGl3b0fYV5Tzmep0amiSysM/d2qlcM9Lc9i/Lo=;
        b=HMVeBR6me+yKa4itYel9SnA+0C2hqrxwwK6+s6i+1MsjlLjEgH443OomrDMvbdeTVB
         HAQrDef/hvoT8dJKkx4+HbQB/2RFZ7Nmc+bpeFuti9VMqJwVrR8dJrkXcuzQTI90zzC3
         4eHLi3lKdQ1mJZu/Ox7169gwgkhqZ+wawUBnCHTEo8KAgQyblQMqQADyHpupvOguOHoW
         JLrtQWnlWZPE3fUXWsYHmAgLyr71MWuEXyqHQumwrl0LUhpvWaM079b4vfcwJWnsxkW5
         Xc0MLUDdpzDOVIIaAtSvRj/JyIHlKIXRuzBCeEIO2/zgFQVhEwUlQk+qH0jQbEBreWDR
         CsFA==
X-Gm-Message-State: AOJu0YwdwMU2WpP8RlHaVoh4UDBBqBGrcsT26lG9AAlr0zv2Kx52fg4f
	Whzkci+jb1peiXIlnxZw26t0xlu6bIMrs9gZluoBa1dfft6kSQA5yhJ4Jkuw/z3TQFUYFgajqFg
	6CNIbJZ8z104M7yJlGnT1TzVjq9XN/YFBakxp8z4AXA36xUoaF/B0XA==
X-Gm-Gg: ASbGncsTtuA/ymgiRO5ccXrluSYhkDMKDkcMFCtTbmlRBFpqzWiA+rjPt/Y1MuKE/ZW
	GX7WY0ilECCDaYujz+zaKDOrlk/gj7FJmzCKbH1HzCXVCzLi4/YkHyQY3lgwyobPd0FKh8YHTjm
	t3aiAXJz7zoB4+UXBewydI7AzwDW5A/kJqbvFgAdRnlXURqxXqhI4gGyESybDiMffXOHntiVdkm
	ysMgWU6f44tzc4wxJq2vasGnnKHPIlUjfEgukoz+9NLJYk7dMGbqm9d1qIWdpsjXs3BiQ==
X-Google-Smtp-Source: AGHT+IEGMJNDK/uazbNK2CreaFs4DzJ1lOC2QwcJE70W/KWnZCccjVAqTX3nw7+ZWGJNM9IfDEBNN68fg7d4Huige6o=
X-Received: by 2002:a17:907:3f87:b0:b72:c1e9:5f1e with SMTP id
 a640c23a62f3a-b7654c86d3cmr506860366b.3.1763676612521; Thu, 20 Nov 2025
 14:10:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
Date: Thu, 20 Nov 2025 15:10:01 -0700
X-Gm-Features: AWmQ_bkWpIv2Qd88bwdlKELKxkYSjrCOIcGVjkEVxcJ5o5f2VbYAmAOddUag7g0
Message-ID: <CAFLszTgYUVScwyd3_SS+AR305XCUHbiQgCurQVtK3nYfSXe7dw@mail.gmail.com>
Subject: Rust library?
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Does anyone know of a good / official Rust library for libfdt?

If not, this one[1] seems somewhat sane, although a bit limited. Would
it make sense to try to create an 'official' version based on that? It
would need quite a bit of work as it only supports reading.

Any advice or thoughts are welcome!

Regards,
Simon

[1]https://crates.io/crates/fdt
