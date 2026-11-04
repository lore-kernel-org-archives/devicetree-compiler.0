Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805246;
	b=xnsq36aH2Q1wyJlc8CzwSuGBcebe1QZv6W6fWIGsq36WJz416qPwYXH6EKyCGDHgrZ/B
	 LjfjxLFGiIOddyFKcv4xE8vNUf0E+U8Zmev6eUMxs22veMiDpQwLFkfKlL6wEj3sJPNZs
	 9K9JUpH7aDMLGKkytTXErJYxYnl60VU760zSPiRCP7nX0O4f3NteaGncT31Ub0Zwnod8F
	 NXT1is86g3sYpp0G/rI/Is5IMEULTTXV8mQVMoKrDcHJCl4EktfeQz3HYdXOj7Ft2ud1+
	 MecTVeXu31+MG7PBc4I9lNlHZhK47RFJIWTKDyAq7hW25V9S6Cu7BE+YBHCzaiEONGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=4g9YM8zm/dWu62h/iQllU2IDBggnX7RoorSZH28+ZKk=;
	b=dFxWLv/8i51ku67wNwe5TT1zAK+CLEohNMrK+g2qaHF8uZFKGQhy54dGnw4etZx/YcYA
	 7sZhWBJr34tcVMD6V8i7ObFrr82QJt9gfnuH6g+3UciSU86l91bmuPtXHwDZ1wwpQSlY/
	 Mcpfm6x1yuoft3+SY72EWlpMSoxyksiBddAWzOlDwvClojTkTFboP/yIbBP9TTohFDhbg
	 Tg8H/VwXoO+cXYXnDMSW1i8HasCMy25rluwF4KS9lSIm5gsHuzt6r/xkCl3kTiO8J0Osp
	 /35Q3YarKehGref2DQ+aBrLZF1of25CWjiPGj59jiWmrj0O/ZPYEcerR4H/qMryWr+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VtJh+cIV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186C9606A326
	for <Devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 186C9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VtJh+cIV
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e946155442so7484255ad.3
        for <Devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:14:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805240; cv=none;
        d=google.com; s=arc-20260327;
        b=FX5EO1/UwzqqUVsjIrd/8BlOGEWRPpaDNdLujTFQFqpkLWIcTlBd43hpPLr860A+L+
         88pL7tpF/EExILYht+nGKh8R858cuWGo9gfKmrkA89jgQlUfu179SjXgLe3P2tT5Z3y5
         S9ZDZdRXxJ/u275q6AUbeAUBmXSLyyZRbk1/vU2TlVkOElT6n+sY3zmg04HjqA+YzZGR
         5Wzc8yRB4K3Ikozz8KbhEvUJkxWUlkCTc5u1F9MpoUoVeU8rYzYMzakvjRsM08oTRFZG
         AQVLoueMIkjNl5SqVXWJ2Tfw/xOlKUbdWuoYtdSmeQKuLTO94sKVJFg79MAnbKmr04aE
         TWbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=4g9YM8zm/dWu62h/iQllU2IDBggnX7RoorSZH28+ZKk=;
        fh=4BA7Iq9H0VSWaCP4Je+uW1rc04Fmu9gG6jldUSQQ6Y0=;
        b=AuQeNP3WtsKxc2jbW2DJXRswkA4RRMz8URwWSnFfWpm+CThi5K4DhkT5qKib6bdHJq
         J1zZObZOUUTlsk1FfSVvmLiXDT3oeKJDYASU6PtG6v8OPAZSbICo4+9Qhx6SklgsVuW8
         htvFBVYzHPI3cpMFl6GCcP2OGZtw6pzvm//GGLx9YrvKlaJF+rg5ngOX8N+95ReiFhvB
         vIAhmXPCNmZh9PB1SVBcx9tNlBpjz/yG6CZBzMb/Y2tx1tz5zcDHnSShIN9axKpqOL5Z
         /+ucXbdkFpLu0jPgc+JJnyuYqsGYX6iB/36lB2rm0/sauQiuBvonCDYuNsgZHSDZs08K
         mlQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805240; x=1794410040; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4g9YM8zm/dWu62h/iQllU2IDBggnX7RoorSZH28+ZKk=;
        b=VtJh+cIVINZ2MEkevn7WmaVLFyNqkYyFIlTjBabgCax68zscjXmpFt5Y7E1GOEb49l
         pDOUbJBi0y+xmNJdzmbHtQA2TFQPErpEVtwgj0CtnEh2reAllsNP4W9y8xkt6LapFBzp
         gxu+t5ur1lKG0trClOunZczrodyKLqK1AFA1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805240; x=1794410040;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4g9YM8zm/dWu62h/iQllU2IDBggnX7RoorSZH28+ZKk=;
        b=R0NpRVYEGt8Yjt9IGRyRytvF4Z3E3Aomq97HCYXETns8uQc3qmMGWbELfihmQAeDqy
         pj3RNaYWzmgXp4AuZ4ZzXvLkoKsYueY6X3SIeV0c2fTLWw+/a/O+p0Rs7mx0oNpN3SR9
         ayb+41SvoHlakhJLjDJM179+cYYClfBvriiGfE28LwSDI3eWcl6uUe8hdIeseuBhiCfd
         0jtKgUsnJ6tX/2FoKGlBOQ9nvtfY5dKt78dIaO3q/1EepEl10Y2nlUvfiF6684XEYjWi
         iBlkuPYmtTueOiUTuf/NXHrJsTQx2kA386EZrLv2uJdHzKGL2mg2qheRgV9kXRONzDKk
         cl1w==
X-Gm-Message-State: APuU4Z/lFN0d88opiDe7f6Qvki27HoCXarCYsTjlv3HQeq6pRz3tWW8l
	s9FYrq3M+mxF1DUIQuHAqztanlfR1Xfg4G5Wt6QYI3+mnHV3lBM9pUZtsHqWJvnyv2RJXjLx0y2
	jpX2US0VHAGIuNTErQbUMBCUR8E0+h5BTXlvKI4qm
X-Gm-Gg: AYBFou24N1NMX/lbna7mapnD+p65EW5b5i/YjWLI5tfmJ0S5MfKi/ApUe8L/n0F52Nv
	7bm8S3vHJfPmCHaqh3d3GOvhAOPh7fubIskzR7xEpAGZORrfR8DCBFBSQQ2a54Ojvw6lk61MNa3
	bqjHuC9MXpn4R6cwkeUZPbBdfRbZrv5K7UOpCEjDU8U6n79S4wdWIYgkH9MVt3/QYaIoaPJJpa2
	F5tXD1nMjhgaVlXrP7iEPz/SU0tn9vqwjL9NqPGrLujRYyQpjWBL/1njxFMc7fow2b4jQLibE17
	p6MnBldKbJCFYrnVfrQtBfCSA7q8cwtM2VkWUIG5sg8vZ8NHFEdLepKNVctAw/p/u3R5BmpwzBA
	WYWb9+JT7+zuCj+zGzJxlwVF86dp0oD9GSw7fLZTyl8lAYdbht3Vc3QgvKoXNNjkpyuIw7tvo9E
	w+SJ3Jl/lTwH/pZCNT
X-Received: by 2002:a17:902:db01:b0:2e9:a16b:c251 with SMTP id
 d9443c01a7336-2eb36415052mr159360075ad.3.1793805240352; Wed, 04 Nov 2026
 07:14:00 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:13:56 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:06:30 -0800
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:13:56 -0800
X-Gm-Features: AclHuK8bgHY5g2vquuY3HnPyoGGgOhTHoSnTSctVzT9j5B7g5SwdvJLxwGfXVIg
Message-ID: <CAFLszThgCnOx=M0655rjro0wShSm9oix+PKP=pM4fhmrLYUObg@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] fdtfactor: Introduce fdtfactor to auto-factor overlays
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

Hi Doug,

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:

> Before introducing `fdtfactor` itself, the series starts with a few
> preparatory patches: adding a `DeviceTree` live-tree abstraction in
> `devicetree.py`, and teaching `libfdt`'s `fdt_overlay_apply()` to update
> `/__local_fixups__` on the base tree so overlays can be applied in
> multiple stages.

Just to check, is this still the motivation? Stacked overlays work
without it, since fdt_overlay_apply() does not read the base tree's
/__local_fixups__ when resolving an overlay, and the stacked_overlay
tests pass in a -Doverlay-local-fixups=0 build. The commit message
gives a different reason (keeping phandle metadata in merged trees).

Regards,
Simon
