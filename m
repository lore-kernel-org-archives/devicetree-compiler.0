Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793595004;
	b=YstNgaDmxDTpdcxEF0pJhyvmC8kWh4tRZo4n3CVszNgIV8qcuAraOGP8IAuv8J7KFwzf
	 rUk/hTUj/D53cINlCc5ambf8kgl1hm7wa60MKo2DIr3pukHcj46WnDN9l5qHPmCsbfIOF
	 nB8ngtc4N1tDGXJJByvqOSqu5QnCrHrgD2Tof3Qj2202AJyMYAHmSZRAJ7djxp03PkbT2
	 uhCtS1mWYlbXt/IQzzlkGV3R92Kc/PY1+5GJtNficRjp7Sysf/WgRP5SU/XHIj4UFWT6g
	 62HrU9mYaL7W950DzGLKf3IVd/FlwkKyT2xvx/sy063Yz0Z9G1Kyuz9mZ5zlXoIThMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793595004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=mh9VsrFBqaLTlsIQ1pJ8IQg691qW2VXQaef8151OtHE=;
	b=YSyJGlTzEqdOC0V7Sz81pdewph9GCpRshZ9ciu+Cin0ANzSY2VF22AdYJ+ibe21DtvSG
	 4lsjfMp55MuIXlZ1lHGoUt82S1vqtY8j0OQNS12OkDSacebbu/B7y1v2y9dYVDEoVoZk+
	 OyaqCpL4uXZB0UXwwvm1dtp5+bpk4JZaYvCT+i39gHvDGedquwwo6kITPO5zwVh1KDYuo
	 CFgaa7qaYc0+L1efxkkiYMYBnRXl4I55vbZCHpl8RBt6tjsdZoGfdbFDi9eteH2corrg5
	 fIVm1QSeXjfjxgMfX8NG7P5pbfAB4LbCcX3Xhw3uqxMvSlZ8lQ5Ik9HxhYuYHYQEIwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R+0JUnIg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4542D606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 04:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4542D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R+0JUnIg
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14fc585291cso1974307c88.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 20:50:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793595003; cv=none;
        d=google.com; s=arc-20260327;
        b=gYhoNS/AFqn0lrItl/+SuDbjUTtZf2DiHMvP8j5aU7j6n+6zyAF/xecrZnEzRpB08E
         G/t1qrwCpUp+9X82UQnCNJ8cepqWopthzHRtvcAGEPQlM40++hZ2RAgJU+Qk1h6nFnaB
         tXbpwpAfrtRIRaoEhFn35+JS6jw/COIeMSXm8QYR661KSsIG6aVziLkHQQDMkXrpMOMd
         a9UNF8hWpXfMu0cOl35uUpzeVA1OG96IAZVFa9AKx/XDFgGbsJ6y24e+YRGqBNpPC6Tr
         W2TbubtHLWqk/2WrayAP2cL7arWfebjOjlKxKFrX3kaaKzGLT5J7Dkb2KR8fqBzXAMk4
         cmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:references:in-reply-to
         :dkim-signature;
        bh=mh9VsrFBqaLTlsIQ1pJ8IQg691qW2VXQaef8151OtHE=;
        fh=LwZuX6kQalh9RiAEJnPvDX6WlMTPbb5T7LzhEiHFSRs=;
        b=OKdHpGD8ue0outmaBM7eRIrPoySyTwBGN6l230mQyaGAP6nVvkH51sVbrCLhuXP+06
         n32v0kG4INrTypcuRBtluHmXQn9X+U/4smeK5ctPekRZeYhY0pnLzJ6t81CgKLAS6gY0
         n+jupLf3d28HGgZ13VesLTPl4dvzT0H7UsrslduXiTgjZHTvVC2F4N5vH/NcM2JNCCe5
         +IYTuy61Kr+AKpe4PKNHJFvqY6V9vAPuuq3th6+yclktvTpIwn+6pWtttyOwhOuVWeYs
         gRIuo5XqrqQDH7rd2pVvkxUiA6tVOpN3mP64+xKz6Zgq8qoo36F7cZmGLHCbFayr6Kq5
         c4Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793595003; x=1794199803; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mh9VsrFBqaLTlsIQ1pJ8IQg691qW2VXQaef8151OtHE=;
        b=R+0JUnIgVc6VUKqZPy71fZMBU2P/UTJOI80+MU7cPNpuRo90U61BzaEPppF17IHVK+
         i8KAeWLdI8RuTT62awUPIq3NO+4jxUbB3BazhKgDUkgqbkYFV2dQJ557v1sukyhNpcBs
         KPblXxPAEAn8OHrpmVR0S2YH6W8EkFXuHJwPDB3ncu1dlj+MdR0FcTTaJ0HRwb43YDfZ
         3ObON8+JdNXDNwXh9pqCGoROCCvk5ZoZM8lYBKBkCSyBU4NTv5zYP/qULpqhzeoNUpRo
         hDXie/pwzxRUOKZn1ahzbmeYYdDlzVcV2le4pukJBS4uKaJb1f0ZXNjbJcmylli6ME5T
         eUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793595003; x=1794199803;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mh9VsrFBqaLTlsIQ1pJ8IQg691qW2VXQaef8151OtHE=;
        b=jvGL9tXPWLj3qYMqfaH/gmvbiu609jMGF+Sqgpp988zs871znKAX9HLjOLr4X5u4WR
         7GRQ9/ixqzSp34VbrRXDpbWiRuLi65W26lI1VH41z17JoAgROsHykyIlTlsH6aZHxuV1
         e0dtDwT9WJnsw1LzTDKl4sXfQHtBJYYB5MSoh9xp1koMquZ48YEHpGbuY8u7oWaCwMWV
         CwuGy2GhTwS75EIm6lxBsOfRvQ+/6Xwgz0nJI6OLvDV4Ic7zpcK/6Z02laNNkM1tdfN6
         /vIul9GBKhIfzSBOd8ZBH1GDTD5apJInNjjWM146PIaiB0v2osU93L049nhl1+6nxFmw
         /MSA==
X-Forwarded-Encrypted: i=1; AKwUvBxBpInueFujdlYoo4F2FyOZ1y17PmkeADkoPD7JVqT/jbuK1L0G0Cihkp37UQ6h0sMfm9br5qVX99RNGhDbQKHof/hK@vger.kernel.org
X-Gm-Message-State: AFq9FYJL/wVrYzNuOlJteIJf60XEC/LAbUyRBudy6gJC4NyLzYcWVSc7
	y7b5E7y/2od5OEpcRPDgI6W63WfNneSK8uie7aG9f/hRYiN6+KhsyxnUVPxXc6hao8a1COR685z
	qKMhOV+KejXabOdnSoc49cK43kG+nvxA2hjz2j8yM
X-Gm-Gg: AYBFou0FFRihFpa54hRsgaPF3bp8kla2PuakyjmJeuMkC7FmPERpr0PjDsvdK/kuiIj
	bE2I1F9HMiroqgV0aVpGhKnto0W+IzNaefDDM7vsTkJyd8mWpZQxtL4oYTTgzaXaY+co31nNLrL
	QoVr+2LBn1S+1JXAqhVJIFcBObxrWMXrbWgNOcIDDgjcbv7XZeLZa9/7p7yio52+fVh2huPJU3m
	+I932mirGaVbnQLqL/FAJslj1L6wc6/gI+HtxAp8X8heU3d4dNzAu+8tHlpUHDHgvsQS/DU8obp
	3bftCjOQat4B8NAvFNT0Vdg0s97I0X8Om/TbDF1rx2Se3JwnfsRBdrtQMZh+piH6sHTmxBmsz43
	7yUrlY7UuwwV6pjlc6xF8A/NZlB4KzGEab3ARlcZh8rzvmV/qWLLLqOFK/P/ZdWKbXw8=
X-Received: by 2002:a05:7022:38b:b0:1aa:47e7:97e3 with SMTP id
 a92af1059eb24-1ac5c45fd1dmr16327199c88.15.1793595002345; Sun, 01 Nov 2026
 20:50:02 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 20:50:01 -0800
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 20:50:01 -0800
In-Reply-To: <augPyPn7VSk8G3HG@gractus.seuss>
References: <CAOSmRzjuJmPc=59ebUaGfbWuDsd07RpoPM+Zu7qZomPB_zTx_g@mail.gmail.com>
 <augPyPn7VSk8G3HG@gractus.seuss>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Kelvin Zhang <zhangkelvin@google.com>
Date: Sun, 1 Nov 2026 20:50:01 -0800
X-Gm-Features: AclHuK8C5f0EnC3V21n3DvT4heEJmwuEmsfcZxKpQ6-FCPCG6LSsOZtsKkIs8LY
Message-ID: <CAOSmRzgXSJ_KbXfiwjdBh6hNHbZZUbRS5zXDunviPzaWtxzbrg@mail.gmail.com>
Subject: Re: [PATCH] libfdt: Check node names in one pass in fdt_next_tag()
To: David Gibson <david@gibson.dropbear.id.au>, Kelvin Zhang <zhangkelvin@google.com>, 
	devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

Thanks for the thorough review!

> I'd suggest this return an int, rather than unsigned, since int is how
> offsets are generally represented in the API.
...
> Since fdt_off_dt_struct() and fdt_totalsize() return uint32_t, it's
> probably better to do the arithmetic in uint32_t, rather than plain
> unsigned int (though they'll almost always be the same thing).
...
> Having created this function, it would be good to rewrite
> fdt_offset_ptr() in terms of it, to avoid logic duplication.

Done in v2: fdt_struct_limit_() now uses uint32_t internally and returns
int (-1 when off_dt_struct > totalsize, so even len == 0 is rejected),
and fdt_offset_ptr() is rewritten as:

	return fdt_offset_ptr_limit_(fdt, fdt_struct_limit_(fdt), offset, len);

> I'm assuming the vast majority of the speedup comes from the
> FDT_BEGIN_NODE case, and these other uses of the precomputed limit are
> trivial.  Given that, I'm not really sure it's worth the more awkward
> interface for those other cases.

I measured the breakdown on the 612 KiB tree (3,012 nodes, 17,899
properties):

- Unpatched fdt_next_tag() full walk: 291 us
- Only FDT_BEGIN_NODE using the precomputed limit (other three checks
  calling fdt_offset_ptr()): 227 us
- All four checks in fdt_next_tag() sharing the precomputed limit: 131 us

So ~60% of the full-walk speedup actually comes from those other three
checks (tagp, lenp, and the final offset - startoffset check). Because
the tree has ~6x as many properties as nodes, those three sites run
65,745 times during the walk (vs ~36,000 byte checks in FDT_BEGIN_NODE),
and the compiler does not inline/hoist fdt_offset_ptr() across the
*nextoffset stores in fdt_next_tag().

In addition, when the bootloader is built with stack protection enabled
(e.g. -fstack-protector-strong), those out-of-line bounds-check calls
become noticeably more expensive, especially on our test device where
the CPU runs at a relatively low clock frequency (600 MHz) during boot.

> The 1-byte offset_ptr() is a little awkward here.  I wonder if it
> would be nice to create an fdt_offset_ptr_string() which internally
> computes the limit to safely pull a \0 terminated string from a given
> offset.

Agreed that passing len = 1 was awkward. Since fdt_next_tag() already
has limit in hand, v2 checks offset < 0 || offset >= limit directly in
FDT_BEGIN_NODE before calling fdt_offset_ptr_(fdt, offset) and memchr().

Sending v2 shortly (also stripping the function names from @@ hunk
headers so Gmail's outbound gateway doesn't wrap long hunk header lines).

Best regards,
Kelvin
