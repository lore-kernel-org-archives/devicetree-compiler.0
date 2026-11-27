Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795805096;
	b=I8NM2G9o8HTpzPG+IYf7Rpq4vMioWtukR1ZG6n1Gqmjostd90cG+6Ea1ifNj3bm4Pv/j
	 icIh7v7RfsG2ODs9QozQpRdGlCZQ0c3AMmXbZJGziTvUw1tfVp+1RIdbXM0MlFYH6pfyh
	 bEazCLNiQ6fmDXr2Hf+Jr6N7LqU9yvcUn7jETshS+jFZlnmL0ETz18zFjTBlbq4XmJ5XC
	 kKH8X/cK/09mjVXGkRlUL28znVtOa2+SPZ1wJh4BaCpS2Q93xAaczLz1dey0ukrT2n+LH
	 sBP9X/HJ9Oxx/oFBykxcKhFOCq7paKZ/R+wAZvLf8tTeSb5jcgS93CyPy08/aYpef6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 from:In-Reply-To:References:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=ZqaSpv/DXa3sD30Wrw0BLL67hLR+m1s8QOhfYuAvACk=;
	b=OgOJNQya1Asa7yBXjVM2+KlGuJCmOmD93YfRTDkTOlMd5HQOL+JOKbeZGz0wmpKW2GxH
	 RIcoU3fe/lYFdkSHZH2ciIin6bmI3c27a3SB6Jx6duttoQ/bbBZC6M/OtgZvvVIebZUyH
	 HWxDTd5k+dGKbjeZpEQ2FBrHWx3edwJT7KG40m9Fgo8j4cf6CVwz6QjLC+KiFLqtlY7N0
	 dPuvXJQK74+PuEoWxiRCHQwGtXssi9P5OhMinkdYcg7uGInC/yviwyaL20D2yQ9lvIS9Z
	 rvlOWPVg6HI+fIyX4+I0kI24uHrNO908kApMCeYOoJ4mHdGPQA4+sv0iv3ZPZYkon9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VfX5fmLq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B74606A31C
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 18:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VfX5fmLq
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso10297224a12.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 10:44:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795805094; cv=none;
        d=google.com; s=arc-20260327;
        b=Ea58Qt/afAAMxF1pedLfLMNtkmXClWXtd2yXkbWUldrgs8gUChzWOC2lAvKdRTPnlA
         GzWuSbPRjHpNGiVUzcuVHwgyWs2uR7EXOS6SBS3f4PvxOwKGac789lh7U4YKj1zWl37E
         /uvA+mTEnV+7tw8bgDzXE25Btu6QBQBrSOp4PaxQMq2PWdRr3N+AUdrCCVdXctuYzYEp
         JOKPPtcs9F4vJauGyClFUlwSU9yNpN4pSnjFeT/L4pwT3TlXAZiYj2jv/MrH3Up7Ay1V
         ZP+rRLNwDVvWbKgu1PiCTH+B9NmibUqVLbfgYiQADC6Md2xHZE4CrdNgazAjD4t3rUDv
         DzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=ZqaSpv/DXa3sD30Wrw0BLL67hLR+m1s8QOhfYuAvACk=;
        fh=mqQIQk6NAYxyS97NAWCo63T4PX2HDnM54/E1mUMNKCM=;
        b=q1C3jJEdsaDcsU64ksSMluY1XUV9qNAMA4a6paYxeyCM4vNcb37jw1dYLt6OlMALak
         xT1hf4lLyjaZQPGN6ScmNaRRDf9PjMDTF7zg73e6ptpl13U4GSCNybjeTAdpvKrPzQ7T
         BUk20cZJnwupA63SzWHHkODg9GPM+UOIdky29qVZ2vLBpBtK2WerhBQZgUFrW6C7DABn
         OtLmH6YROFOGb84zhi+2fn5eF1PIVLWDzR578vX5tziirux5YDZS88EKbkS9NXVoHM6D
         htg4AjbvOI3Kv9pwvyemhieFXqyNBemv0Fya60FNtpVinXFcU6EL7AadRixCt4f6uoCo
         /2tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795805094; x=1796409894; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqaSpv/DXa3sD30Wrw0BLL67hLR+m1s8QOhfYuAvACk=;
        b=VfX5fmLqVE/1Z0Mwuq46BshPSDnfcDSUnZdKOM8Wya9zeWDJTpZd986dBBhlk5tjWM
         U3rjYLxrWC5rQbnBsAfSYgJSUrDCej6aCDQAGaOHq3i1OemH4V7VucPqShsoujOLvuQg
         7e40cWstqHdvoS/AOo/l345hWbLsK0mohyZZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805094; x=1796409894;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZqaSpv/DXa3sD30Wrw0BLL67hLR+m1s8QOhfYuAvACk=;
        b=QaVgRcF/XUd9gpMLFRxeiVQHD5H5K+FVVijqZJsN8HY7VPDJsUymzJGI4mypcrB/s2
         a7/tnH3YLiWK6xRLFzyI0wpe851FRg6/BPSUIFN2KZYzQrTJjSspDcBb44UZA8ap8Tne
         RX1Qc771eEWpzBZMvfmfPb/JS+hiuVAhgfM02c0R8x44G/ItPYwLms/kFyVYtIW5UO8i
         sKy1ggPJhVUDAfogczS9l8ZKQa1zH29Df4oXLX0s41M5mwOghfCEBZi1wCZzwSlKT2S7
         XuYxv8Fxvtw/IjhTm22XCcZOXXQrEcef/3Tbo/wJWDI8Wf90GlEo5QIQVF+ZKKZ/bmmz
         DZzw==
X-Gm-Message-State: APuU4Z94pKSM6J7LeCxJWy2dml3kmafkRT6IgveC4Jjn+9taTndbPGcj
	6DoW41z541pAsd1iKO8FbWgRUbzQq5o7St4KkDhrG0IuIabFnO+Y0nBNDzDFDzP7z+y9sc1X02G
	UnmIoMDRpB1Q6pnuV+HyiryGhC/GHIT2XXU7AlnFw7i1uGcwcwKOY0w==
X-Gm-Gg: AZFdTZe4u4BPgok50E0V4hoDaTLGwxlKro+vHHE859vnLmrKbmhp4veoiI/bdctRpja
	Y/It1IMq8bpIx+kxach1YDrCg5jXCxYWaGRACIPXFejdu/BkKKAzYvyoKjvrfxfouh0KLuPgDQN
	nH55vvVcWQfKuH4LyvdS1lpYLKlLWTOBw0EKljFDHpXUjNWxotS910bGpuVQjeomFE4AIqga1xH
	nB47m4kYFRAMHU1RO+a1h9HxpbcCAasMruGAOLvvex+16q5zMwT2cH0kUeAR44UL4CRX7pYdYnX
	hv9yEFmFe3Lc5UnS/RrXAeBU8FRZdXWQy/zZl+bD25WwpJnzl/Y/WeLJXollyYC38zNkuVSdK9b
	tGYRiPqLWoxOs8rrA8xuiH+bI16aAHQjHyb333mMZOY5lamXdWh53+9qq5pNQbxW7IN/9VBs=
X-Received: by 2002:a05:6402:1e92:b0:6b7:d55:87e4 with SMTP id
 4fb4d7f45d1cf-6ba37e831demr19159587a12.25.1795805094579; Fri, 27 Nov 2026
 10:44:54 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 13:44:52 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 13:44:51 -0500
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
In-Reply-To: <awj8MGUjqkTZTOsR@gractus.seuss>
References: <20261126184126.1472738-1-sjg@chromium.org> <20261126184126.1472738-10-sjg@chromium.org>
 <awj8MGUjqkTZTOsR@gractus.seuss>
Date: Fri, 27 Nov 2026 13:44:52 -0500
X-Gm-Features: Aa3M54ook82UF-vA6SIGrV9RzoeIfPmDkjZKb32PhBobm8tCe58CiSlIMLUylyE
Message-ID: <CAFLszThr0-C=5R3T5G4sRV3Q=tv1bM9Vbgqs1uiL30neJ2_+=g@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] dtc: Move labelled-reference handling out of the grammar
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On 2026-11-27T03:43:01, David Gibson <david@gibson.dropbear.id.au> wrote:

> I think I may have implied earlier that it wasn't possible to handle a
> construct like:
> 	newlabel: &oldlabel {
> 	};
>
> in a plugin.  But that's not the case.  An overlay *can* add symbols
> to the base tree, by labelling /fragment@XXX/__overlay__ - AFAICT
> that's already supported by libfdt/fdt_overlay.c.  The support in dtc
> has odd gaps though.

OK. I'll drop the claim in the comment here that dtc cannot do this, and
add two new patches to put the label on the __overlay__ node.

libfdt nearly supports it: overlay_symbol_update() gives the symbol for
the __overlay__ node itself a trailing /, e.g. /foonode/ in the
existing stacked_overlay_addlabel.dts test, so I'll add a fix for
that.

> - That construction is rejected at the grammar level as the first
>   source layer.  That really doesn't make any sense.

I'll add a rule for it. A /memreserve/ can have a label too, so this
gives two shift/reduce conflicts unless the memreserves rule is
left-recursive, so I'll change that too.

> - If given as a later source layer, it parses but gives a non-existint
>   label "oldlabel" error, which doesn't make sense in a /plugin/.

I'll make an overlay fragment for it, as without a label. This means a
labelled path reference always targets the base tree too, even if the
plugin has a node with that path.

Regards,
Simon
