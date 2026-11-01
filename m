Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793566500;
	b=pSsF85uVQPmPTePdORH0qaRkw94jSVP0/UmLSUIap8gq6h7kHZvCdqG4bCgPKH1EHlb2
	 cxZVdyrQbnjPzDsNiOWRMVltRrC9nOr36qYdvtn+jlCWt/IhTvDYFwtyeDkPYOG5XzvgU
	 e4ldXp2O9GUikLLWAm5coN3QQNH48Ye6EGaUyDvZ+TcVQ0Kz2UupajX61JR8n4Q3vaP9f
	 WYLnVlJttPzwnj2EJrMqd+Iu1Dky5CLE/S6h8ufXXQhSRC/+dh529+toBDebFXESRxv7j
	 Jx2BtRN+fqWndYoiSczrVkkcbL/CwlxmB4p51x5AMuVp/+zTLXtq67Vy2x6ousKxE2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793566500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 from:In-Reply-To:References:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
	b=sFdM3a85xKXSURfqJpsY89s03hD74R2Hit+GEYoX3v4UjGimhqN5BwELkQ1i8O4OlIcC
	 m4mH7d9SdpXlkvcGb5q+sJVJ0+8palz5YaUGlvDMk9EyMj5U3DLci9OZZqj862kk0j3xG
	 N1wEf3gYFNYvggpk13Qk4fU5J6FVtLNlekX3urCmeEsYiFi7aTuax07812OEGiwnvv4eA
	 f40xxbiRa3V+cblBcdazCy+2/eEPhLljQDtKWLKgP2egHPmQYj4jfVOdK7EESPyF5YL87
	 0WD1K1wPwAFiyogZ6kmfRu3LwVrnuKFCQGWVIeGxlgt85/p95YBHHv5Ca625kJri6NQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OxB94iZp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40955606A325
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 20:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40955606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OxB94iZp
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so2980171a12.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 12:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793566499; cv=none;
        d=google.com; s=arc-20260327;
        b=YbO1Iog7uJ1zyIj9pjLJpKsVaqykFMxi5+xCvWWWOguWIfBBq8gFvPAKIYOZLbl3r7
         SdxmKV300NNoXMNiPivvVjvd4eEVEoOn1Z/Mf/LmvSbN5xO20MTXWrcuTw0P3sfq6L+j
         qjx5mN33ogmujkoMgO+Z341GcFfqHmTUkd8JsHF9QNHNOW3xTrMhWx50uvBlpBwdo+bv
         RVq0VA+7yXwjb05AN0eXH9zbL2g5BVLf4sYmgW7aAkQ56X9BWa6D5T2CceDzga9SHDGO
         V8e0EgnPe6AetaaT8VA2FXV5Qzqf8FamRmHJRTaC2IzKCVNj8hLCxfBRjs8EBvR6AK5Q
         R/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        fh=YjlZJnhb1Pn3QwGycr71XugvVLyHtsSEKmjx5xp7hZw=;
        b=BUcqLs5SV8YYZl7irgFLEhV+5miVLVqVMEbJSWVg4bCTm+ZasecNY2k5TGzFBW51Xm
         MfooT6lv3kfHvzD+1Ot8L1GZnJILVZsNmnKzmlqi2VqAppgFoYltudI00eMmA20fFUIk
         sDYeJYZl7z/vst9iwRi9zWh0q5ntT823v1N+xvudcjOYtyfYZ1DfKMZX0OtI0tubeOkF
         qYi8FcHY3uuHsV77oqsfQKycecmQzL9dKlVOM5Jn5Qw+td6ykv5hTHOXW/Vc2QtUvJNr
         Zifo/8m4zqqKU56ucXKX1L4EBDkGtQRRY22VS1KnHSP76CoBhwlweKRBS6bIA3uKzwYb
         I6Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793566499; x=1794171299; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        b=OxB94iZp8kdfd8GGKl7b92g3lomCornpCWOX5vG+FCefMPIoOtL/O2J/UfZYK5YxrF
         Ivv6cnQUQcyQUIfr8TQDTGMme9b8bQMpK5Q4EOvhLX6eZsOHWv2ctm3ukB5MBhYYPoY5
         4u3OOXQt4eXFHxmaIMUeQ0mJTZaMyYE/c/7qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793566499; x=1794171299;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        b=ePZxG2UCPZYcMO6zCIHs8eZCazO8gXggDn4AfCPeUuyDxdD6m6zLJiNyFmXOKPTKSW
         3sddaWNq8vlCpmiI47Tq9HzzOGaWVzxnzfPYpRejR7fjmd5Nct1mCXlO2EmTdR94/vRI
         8YWENfWro05hRpwE7gs5Jh5Tv6yZw1fTQTnvngEODcH5haBy62fCc8NVWL8V/oH5Prnb
         xqrvOEswj9la7V/MMHN4+6J3z9FV5JpKwLMhREKGqYf9yC21ZnG8UitVQLfTL3Ckf8bI
         VSIYqRpWHRi6j35W9DjSTrmuJXwItC9uQgoBEzgYG9HFeC0BHGUnm3SiA+uIglp3RAsM
         aMAg==
X-Gm-Message-State: APuU4Z/2SNWhOz4kzQgUiHzpyzxptc3IQpmHyNH/B51pgzhAFgKKryEo
	yEY7XrGtKY3PdKzeiyEMei0RaCTt157EFg1J67gNhQYevklKtuzfRE/OydPIN1L1RQGg0XpX5Z/
	VrnJVI9+rZo7mBRU3SeSnDMG9k5rlkX94xHbWd0tq
X-Gm-Gg: AYBFou37BPBrIcQkTkDaK0yzzGcTCOva/Imazdui8bb83CYMkmdbPbJLTzWhqFkULdS
	A48qXPp9BQFKlBdW+TkIrUrI11wFd7yJiKUpUsK0smqDcDh46rgDR0wrCVTa7NaGW5i61UC5SK+
	jfTzFbnh4aDzPIHn411HQdSDxQx7/C4u03psTXo/RemWXUYCIvrIh/TT5b9OPoBvo+bcKZwx2y/
	OSq8dg5NT5JI4w6+wAM2AsjbCoxg9hYseRSRiZDPLxyfLJDTxpeFNwjDkJNERzaQlRydC0Mb1Ta
	0/eUDHP9X9OpQ5ID+ea4T0Lq8KIacY7tnYsOE7pKvPmliQ15mQ+BoYGgaMC7zRJsdqHet5f4R5p
	pBEQgRDZH9B2ZzKhpTpkrp5U2HthOpk2hIlLDoJ2VZ8ZLq1hIuZmrxM3CA+aw6KU1MB72KTM=
X-Received: by 2002:aa7:c1cc:0:b0:6b1:bb19:deb3 with SMTP id
 4fb4d7f45d1cf-6b4d4d6f96amr4159175a12.25.1793566498639; Sun, 01 Nov 2026
 12:54:58 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 12:54:57 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 12:54:24 -0800
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com> <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
Date: Sun, 1 Nov 2026 12:54:57 -0800
X-Gm-Features: AclHuK_IoQTHoKBTaMx-KZNiIPIi7_TIlou2gkeHseuy-klQIv193ZXwZZvOcw4
Message-ID: <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:
> I think that was in the the "after the cut" part, where I said:
>
> You can see the fdtfactor post at:
>  http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

OK, that covers where the tool comes from, and the question goes away
once fdtfactor is imported. Text below the cut doesn't reach the git
log, though, so a sentence or two in the commit message on why this is
wanted would still help.

> The goal was to make sure that we could fully reconstruct
> __local_fixups__ after applying the overlay to the base. v2 of the
> fdtfactor series handled this more properly, and I'm planning to see
> this through and land it unless there are major objections.
>
> By default here, I'm running fdtfactor with "-S" to strip the
> __local_fixups__ out with the assumption that today people don't
> really need them. However, someone could easily override that locally.
>
> I'm a little unclear how things would silently produce a bad overlay, though.

Sorry, I should have been clearer. This is about overlays which kbuild
applies at build time, not runtime ones like Beaglebone capes. An
entry such as:

    lemans-evk-camera-dtbs := lemans-evk.dtb lemans-evk-camera.dtbo

is merged by fdtoverlay into a plain lemans-evk-camera.dtb, which the
make_fit.py path then puts in the FIT like any other DTB. There are
several hundred of these on arm64.

My concern is the input to fdtfactor, not its output. In the in-tree
libfdt, fdt_overlay_apply() uses the .dtbo's __local_fixups__ and
__fixups__ to resolve its phandles, then overlay_merge() copies only
the __overlay__ contents into the base. Only __symbols__ is merged, so
the __local_fixups__ in lemans-evk-camera.dtb cover just the
lemans-evk.dtb part. Cells from the .dtso such as:

    avdd-supply = <&vreg_cam1_1p8>;
    remote-endpoint = <&imx577_ep1>;

end up as plain numbers, with nothing marking them as phandles. If
fdtfactor needs to renumber them, or puts those nodes in a per-board
overlay, it cannot tell they are phandles, so the overlay applies
cleanly but the links are wrong. Stripping the fixups from the output
with -S doesn't change that, since the information is already gone
from the input.

Does v2 make fdt_overlay_apply() keep the overlay's __local_fixups__?
If so, composite DTBs would be fine once that is synced into
scripts/dtc, and my concern goes away. If not, one option is for
FIT_FACTOR_DTBS to imply FIT_DECOMPOSE_DTBS, so that make_fit.py puts
the original .dtb and .dtbo files in the FIT separately and the .dtbo
keeps its own fixups. Leaving composite DTBs out would be a simpler
fallback. What do you think?

Regards,
Simon
