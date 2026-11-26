Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795716481;
	b=05G9CHrGLwV4FDNL/PpAfm9wqojvT8GcVxzoEbKhGLnchF25ZwvmPVMkYIUJ+0+ELv7i
	 O5hYhrwVxNsN1kC2HbVkt/auX5jWkW2/UlnKCm+XNV25Ap8vHqmZrqzutGT7RYegRARgG
	 GenXk+MsStcO1bCYOyalh14R+W25ZdmBcNg69QUIqsus2obLQyNolXRR/Buj4IkHbZLgC
	 nfyUSD/fGTc+PBclCNPmY3XOo7apOb5SNFdd9vmSMBtKwaxqDvy/67qGo72C/TK75jDOu
	 A0zVjsUrVJ0qNHi/4FrJ7ohY9QTDqSJFMYZFXr4ADneti3cb+aOBCyzrxVm5eLHPnqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=iEywlZ06J0N9TUWVokGRwAgkfG7Oj3IQ8W1B4XhV7zo=;
	b=mF9wpmHtyrg6liF8m3r1PKeRCKCsceaZXiy0fZKFeyOCewcOfmsQYLwkXidXiRyS1SRV
	 9SksScd1HQQx63GD4bGVGqGLLBGS96fa60Y/u/wCITFsCJDD0vDDzGdSsBmACgJiRK5AU
	 kjWJPZCjzLc3Tktfhlxaz3cHFmoK5C2zl4Igab5wjUwMoQ+m8fIoUwfiS8yE5Z+WdWklz
	 HyMWRzkf89Xth9ZUpGKrlGJlzM5DSPwJzot2UnSebcoQT2y+lZjRAQmgdOOU5WX+MlgvK
	 gyLwDxCXF6cvq9vnZ1zbquMSgLVZz6G+P9fuPKxhE2/tP11jh8SWVIgjFgk5EQ2j9sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GKysaETv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3F0606A31C
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E3F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GKysaETv
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so9415936a12.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795716479; cv=none;
        d=google.com; s=arc-20260327;
        b=emd60tAuYiHNPfgvLG0pBINUU/1LewWdJNLPEjc9a/5QUlhN+bJurMT369PXyszJ2J
         iNliBZ/TTp1Og/S+2kBlhZkHS0zpRO3vgkGqeOZdCCfUOc/j8ZxOwxhktLy3//bXxEeC
         SoXRXnDuxe1Qukax71ELDjoKV9kbjwL3egRW+FzaI1/JcsttqH1IX15GKVVkxUwf9bnV
         bV9TiSuSwlkwjkeoilHq/30EqOylciJGEyixnYfM92WIPnqw/MzEungT9rnsjdMvjR/e
         x4mfcMKsZER9BgqUZfgt+5nT58zRMMXWrQ784MeVZC/nxRA1tkFEwWke8/XF1e2jtljk
         dWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iEywlZ06J0N9TUWVokGRwAgkfG7Oj3IQ8W1B4XhV7zo=;
        fh=mqQIQk6NAYxyS97NAWCo63T4PX2HDnM54/E1mUMNKCM=;
        b=swQCoCDIrP1QVIcgJryG6jQjXgvgO1ebKJIo902lkdHHuM/UJeQ83K85B9y8SVxvtJ
         LcFQq1AoE/i3aTisfrAKA/tWRxt+nA/kP5HXBbev2Tm5hxjdUUe1AWwnn8oq0aXxtDbc
         +LZUyhvpD0lr6UB6zSCMnSOeKBY/70Bp61h9t749U6Sy8oxhNM6aKqlKmLjZj3hOH9WF
         O3vPbu9lyiTE9wRxmM4Fp5vhLGNDrTO25WmzLHiYDZRb5v5hZ3Uy9HyXKHah34kq7muo
         eeZ/pxmTChdV+wRZhSlsz1x0+28hHujKLlIjFol72LVkLzLsA9Oy8SxLvBPK+mbujrYW
         ys8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795716479; x=1796321279; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEywlZ06J0N9TUWVokGRwAgkfG7Oj3IQ8W1B4XhV7zo=;
        b=GKysaETvNLvpHfOZXQ53z8N/Nwgki15QH2aafbU3RiU/Z2ArsYKtlIxElHFI2mhdvZ
         e1XdEI+7O5DUY3fSRu5BI/22ySdWJuu7Mp+tFerfTox9TefF5bhMb7558xVY2DzgrSsv
         nnj5Tom2IY80ujju12sSHvXetibQGO8PdBVsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716479; x=1796321279;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iEywlZ06J0N9TUWVokGRwAgkfG7Oj3IQ8W1B4XhV7zo=;
        b=iWOox7SBhL/Dw0qdQ9bG01VGpAkHCxaTU4m5yYUyUMkV8ekoQomLhgEjZk01UPl0Xp
         A7uG/WVwBqPjyGlEpsx5Xy1GPQkAiEQY5BLcaJUtiZ1MseXvEo8tw/D2MC+cUJgU3x8O
         NIP6ZNBdHyR60MwOnBMaRiJonLUHFlnll1mPZNRIAMPW/eF3/9HCHvUVNpOAEcteu4BA
         umYs6+NtusTYfFZ3YnWMUeFt0u/k7HuoHSuOkUXyLm7VLpuqEgFLpyjPO5eHsC32N25Y
         rLr3Jcaftoi0/xwgn/GMcrsjT1x4u89UUxQi4Cp7jNTNtVCaN9wgBvyElubZTu0eTxDg
         nfnA==
X-Gm-Message-State: APuU4Z+iXuFe9WoGcmGjLCr/MyKGJlBF9xEqP6IT1tzEAQ7ljB97gjWW
	gi3gEGQhQizg7uyxlNCC3ldYcfhi9JRJI/mdsgjXjme1jO2lR89QkFo6mWMJspuRHYUZpWalYvT
	a2caIUbWLGkvpdfbo/E2zZMqYsvI9pS6w8ThdBvS7
X-Gm-Gg: AZFdTZfUEEM7RxVvFk49eJgtLTupnzUR+w0CVkXkhU1NlouJ03j0wip0VrLOtdV+D/X
	+kLvj/DiyKHVflCi0Mk2EYDiilloupcg/l82i+DaLMpJIy2jronNO/TcdJb7vcwK47Au6a4j8Z0
	3B7m4V8S7WrEHGWDh1/m0D3Rrk+OSr6bi3F40a1jXmLcRPfFwzslOtf3UNTcQ08V+rTw5SROxuJ
	QS7OI9imG7karIi+myNORMgoKp6znv44tJAWnh588c/aY59H9GQu3u/pxiN25BTpYVQHur4rzwA
	KiqbRm3KlJkcQwcJDta7XzJrVt1gBhMgpscqhg7HRUHlVSLKoJhuF68Zv5xMThBMlqqy/4DTWPu
	bYinR1vxx6JiYYoUz3ybdPDmv/8dz29gkDG5t29SdVFhcmh2oTXPt7sU4hz7VwpOOXPlzzEw=
X-Received: by 2002:a05:6402:548c:b0:6ba:12e2:46fb with SMTP id
 4fb4d7f45d1cf-6ba37ec1c67mr15907680a12.33.1795716478984; Thu, 26 Nov 2026
 10:07:58 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116235813.935070-1-sjg@chromium.org> <20261116235813.935070-11-sjg@chromium.org>
 <awZ_BBMhpIAHjFeW@gractus.seuss>
In-Reply-To: <awZ_BBMhpIAHjFeW@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 26 Nov 2026 11:07:46 -0700
X-Gm-Features: Aa3M54oF9Z8YjAlX4CH4aCyO456YMpOTAGBySFKavuGbDGLZhmZxuvNRLNipYz8
Message-ID: <CAFLszTju_FmwFh3V_8DoAoJwXYzyMGrPZWiOLs0Hwk0nLmtSNQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] dtc: Move first-reference handling out of the grammar
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, 24 Nov 2026 at 23:40, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Mon, Nov 16, 2026 at 04:58:04PM -0700, Simon Glass wrote:
> > In a plugin, the first top-level fragment can refer to a label or path
> > instead of being the root node. The grammar action for this holds its
> > merge logic, which makes an overlay fragment in a new tree.
> >
> > Move it into a new merge_first_ref(), passing it a struct fragment for
> > the reference and node. This is the last user of is_ref_relative() in
> > the grammar, so make that function static.
> >
> > The output does not change.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
>
> I'm still hoping we can unify the first source layer handling with
> other source layers a bit more neatly.  But this is an ok interim step
> towards that.

Yes, will look at this for the next series, where the parser returns
the list of source layers.

[..]

Regards,
Simon
