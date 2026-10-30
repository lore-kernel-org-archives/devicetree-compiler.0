Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364625;
	b=LTcM0WBHwItl2srB4MVyGMBO8fPkp8HqPCqI+p54N38XazFAL625ZChULWWOXWr6qUuG
	 HbpCnMXkt9ahwzl4vCknFAmFus8or+UT94C4je8Q+mEQX3LXOspHVMy65+r0YZBbtMPau
	 wLRsJpztrQj9OQ6/rAs61OmTyA6Od8P+HWW2MpE/WzVPyWtOK3NWYCrImvhsxmRDZ0zw1
	 4dCD0NI/th41oUVTpK8cR18S2iOB7DPtTn215VscwQyoc6B3NoORReHkhhTk1evZxkJIq
	 lx7svclQFgkPMWOOeZmQG18JaOuSIltrDWP6oIAlD0f8O+WGDQ6nxC9uemWQ7fpg3rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=AM7nJD0O+1QUuM7/HgR9qm/EChud0qm48kcPoOZ3y3A=;
	b=1fDZ5PPhNBodTWkSwej7HOMEZfqxJE35fYIdkD/OSqkmv2gfEC+UEbfeIa5CKYu7t7/y
	 rSXhHL5yEwa+DAYmAOFMOCKYUlq1QQhq/Ohx/x9SUqVSJ72pPmxTYysVsxTjEpVKzmD4u
	 1bluE+Qz5rlclrufRHytFNlEZ//cKKWuU+fNIz0KRQmWXwkF77wl0+QF78Erwr4S597cB
	 /3zX3nBu4EBEw/tLxKkgZFVNvriF19H9IH5Usm5PEZdTc9Gab4pyBv2hV8BLXlnEyFnys
	 azayxugbU5FXVZKKm9Db3C9blQb/7IH17/BDMwQjggjne0pzg+fQSGGvc1PLmmwCbAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IXMoK4RO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31154606A322
	for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 12:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31154606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IXMoK4RO
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso838462a12.3
        for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 05:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364623; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+cSptfLyO2omWQ+BwvCPij/CDrZS7f3MDXLcCJu2hG8C5jhu3Y0ALupb+xNi/TFz1
         DYXthtV0hYgr3C+vve6V9TNOSKt8gKEkDOkmHLiC2X4pWlBrkQLv36lGrISdVKjNY109
         EYl/Wdtwu/EuGn/v2U6dGRXaLYgvzZHdV8EH/bi7y4MKZqhIJGGe2lLevZDwvp+6Uq1s
         Z5o8bygblAbNg9TjC+hheJxD9lfZUHzPkYijPPcTca9huVnpzsAbErIyOnQvpjNz1Exw
         ZdYc+oMf/yybkS1xGthQZnnQPMDC/1MHQLWX5bH86dmEue7VYbY5Awm4mNwSoLn26wSL
         T+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=AM7nJD0O+1QUuM7/HgR9qm/EChud0qm48kcPoOZ3y3A=;
        fh=v0GCJqyoWGhL0bL1BD0oUO+DkJ2nkPH0tE1OsgHyX7k=;
        b=GSY8+FKTg/ZkiD1WDumZkipKRoaMPNZWXVmUQzEW/xl1Q7FWklUvssNPu8IHS58BCv
         bPsSbjihUshRZwwjp4kY03Q+PsoIaMm+BQIWGopdltiiW63g7blhgvBAmoySmx/Vjc/T
         Ct0rCDKPk0KJul4JKyf5cUX5cYibDp4rQFfA7G9tFYhyWOKgCRyiV3HhpmC3R5CqAZ/k
         j+U3udtBexBkKW/2ab4UO3MxKMORFm//oHOVDS6a+0HJ+JR9r+gV4XWjKe/RMVLk9ofb
         LBfk01j+JOJx+gEDO0lo+JU6AFHt8CV1DOunremCgMqUR02zvgQFtYOUgPc+g1bkvCzE
         PQSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364623; x=1793969423; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AM7nJD0O+1QUuM7/HgR9qm/EChud0qm48kcPoOZ3y3A=;
        b=IXMoK4ROJSExgomuZwg8qswdcktPKBwPHqGiOEHr5qz96CfBr3Ci2U5aigCM+XNVlt
         d4T3bV4fyvZCcRGQ8wR7TnpmNGTvxWw8DGL6I4xS5SVrwMyIFkiKV2sngytFIGePKPpK
         XBiburHB7LnFiaSIURjCaKL17hViAeGlRn3c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364623; x=1793969423;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AM7nJD0O+1QUuM7/HgR9qm/EChud0qm48kcPoOZ3y3A=;
        b=OZGzsBKaZUDmjRkzaRCyYctIwmn8QlnzNNJqY54rBIz2Sm7flvW2aUSUGLBndKBYuJ
         2RhUBRWbAv00i9JsRwq68difHLtCEsZWSOg8DmB3j3OAAW4Ag30ThkhcFtVAFUoWdU5n
         f6dbhTuPd5ydgOfzc0TWMzBGBx4wIWZnrU077GRo9U8gYRNfoDDIyvuOAd/0B9WjS5hO
         SILOHlskzBs0GsN/EgVj+gbTTUqu014oVsQYLRLG1B1EQv/6OM0NOTwMs3WHdZ7/m7ki
         42drUoDTWn0lNfWZFdjUE3be9NHMrKdlpNRqvYFunLELElb8tRlEin3fs1tbmD+Zz4sI
         hHRg==
X-Gm-Message-State: AFq9FYLZ2G9HC9n/72Upek+kNpGDlFXE14ax7oyFiXHO9lG/LBlOdaxb
	P/PO3l4IzTnk8AmnFiMT4ZXOxi/WnuddP14AmN1WjFtbnXlDC6L12bvTzHMm11zEZdV7xrhf/sJ
	3LkCXzN/wmSjEQahvePksraaWYG0FpoLZteLGJk8/
X-Gm-Gg: AYBFou14qSCepM/PDMNLqXrAX/9HktZdKoTVTQ8ylFqdEEN7Pw2PbFvkDIYS3+vbdMS
	2FjWticC6PSE/U3hjKKq2w81tCU1q8o78tgs8WO6cu87ZPfWXt6//w4+vBc/quc7cpDQQxez1Jp
	v5eE1ozHQsKHDBgzBF1wUlKH/fjNrMsR4lPrnQ74CR22PgoMjfshCT8MwUQkLr9ObGEzkCDYBwP
	D0UQ1G5XO5LL/1KwjV9sHzh7j0k7m/HtKDDtA1MUo83JKOwx9pdkzucI4I06Y1Car/o6tZUQvIZ
	yMjEHfuSTzGmsQHCqLt1VbiXFXQq4ZweHU3uu2j5xyRBlPXDYFtWyRRbDs0iAXuYSjNe5IrucDi
	OwmiojwkBSV81ac5JmhuL4M94GL8139VS2WJyJBw7hori18ZeWjy694u4OCgMZxfrcWEL0Jk=
X-Received: by 2002:a05:6402:c2d6:b0:6b1:b9da:2047 with SMTP id
 4fb4d7f45d1cf-6b4d4688ab9mr1142320a12.16.1793364623523; Fri, 30 Oct 2026
 05:50:23 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:20 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:38 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-5-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-5-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:20 -0700
X-Gm-Features: AclHuK96Zoq6b12CCYQmhyhkE9oH8gdbmzobxXBS8az3EflQGAJeY3UBNWa_dYg
Message-ID: <CAFLszTgOSFyu8PLvYwpTT5iOkENQWthmNnROrZoVAhXnCNG2KA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] libfdt: overlay: Factor out fixup and fragment
 path parsing helpers
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
> libfdt: overlay: Factor out fixup and fragment path parsing helpers
>
> In preparation for updating the base device tree's `/__local_fixups__`
> node during `fdt_overlay_apply()`, factor out two helper functions in
> `libfdt/fdt_overlay.c`:
>
> - Factor out `overlay_parse_fixup_entry()` from
>   `overlay_fixup_phandle()` to parse `"path:name:offset"` entries in
>   `/__fixups__` properties.
> - Factor out `overlay_split_fragment_path()` from
>   `overlay_symbol_update()` to validate and split
>   `"/<fragment>/__overlay__[/<rel>]"` paths into the fragment name and
>   relative subnode path.
>
> This commit is pure code movement with no functional change.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  libfdt/fdt_overlay.c | 226 +++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 154 insertions(+), 72 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
