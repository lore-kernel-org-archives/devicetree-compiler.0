Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06465EC5
	for <devicetree-compiler@vger.kernel.org>; Sun,  6 Oct 2024 05:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728191605; cv=none; b=DMujq5ORyqTtduhd5JGbcmBXBUxUQfkZUdEZIbXiI5vuwzJ9If/5YPn6qIfHQ/E/7QVcEq8Z0mobQhvISmNDb71JSYfr3v7PSt1039hKomVcTKgtI3h/TK10M+ihpjYn0S/if/e+aayv3IAVm7oieN7Fja6beyklAPfAi65q6xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728191605; c=relaxed/simple;
	bh=v3mfhiH+LoL0dv1MH6IY5rPmXlPf3jpnSdZOo2q1c0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aeN5533m9JqTJJvyLQMPzI+Bp44YW7zlBIBWx/Sgyme5GcwqgppEvkro5hY+sRhHmxcizFuTKQrLqxXHlGZdcx9tcJlw2E67tLh6WaYCa1RnUlEelQpEzEFbV6BWeu0Sza1WBpOV5I8V9hXh5FWiOtCuiHBiYWZZVSzgagTpN0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=cDETocBO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="cDETocBO"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71def8abc2fso1163123b3a.1
        for <devicetree-compiler@vger.kernel.org>; Sat, 05 Oct 2024 22:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1728191599; x=1728796399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCmKcvX0QfIJ2aaaCQrlAfzOD06J12okBFac5SSlQL4=;
        b=cDETocBOsvmiaM9GTiqnO2f/cT80gWTm7pscmcNjFnCCLl1wcfuN+v27rNj5W7y7zB
         BbAOfXvZ/6nvGVICzIDjKg+rlGLwpFgrI4qJwiHJKZSbhYq2i0IuhbAGD7O5BTSWd0nr
         HqR7nl6eCKqaw83wWR+A6dPkc6kg3uXFaVkyM73FSRTH+Cyhrt2e3Vh+grwpGdXiMvMF
         9aq9oWu0WtP0POuGvtY1ftjKc4OGgBqDvN/ZlRES/tQNwnmCu/Av6cWeds5KJ6MyXSMF
         4gS1UgRcKfBt8af4+vQzGlUa863+0YRdvwIXLHKQRawDWsxYKyHdofMMZCXp4661IcQx
         DQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728191599; x=1728796399;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nCmKcvX0QfIJ2aaaCQrlAfzOD06J12okBFac5SSlQL4=;
        b=m6vURjbpRamMNTwOMT7fwRWG7wpxmGDRz9MPd0hW6MRLyD7b0dIzb3IGfOlcHUOpha
         W8PSrOtvxmZhyKe1wIB1YrJWM9L5C0JrhuLx0ZnST5hq51ue4WtompMJwuR+1V1IjKy6
         8a07gG4tD/aCi8EaYniNQntW3UFyqgLu4ELGRyz0bMXQ5+8bES6HlmF6/g5OvZP4eISt
         lpxJt42GA02bEfbY/4IvM+66pGGZURIDVtiKMMhDwDoKqtRAKh+myMr3T3JWmZ+i2oyh
         7vHnJFT2UgRnPmyyuoLVlw1wRUTioTx0lSO/75tfwAOQqMwAuuW3uBd0MG5zBZ7hOkHQ
         2+wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwIbCsge1j4Zyx7FbXKQ6MMwxwbrjUGdjU9HtyLfKLZeHGskpGPbJeiuMN2UDbbIApzr7x5P9Pn8To4AN+nENFOs92@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfmx24BfyrcCtuay+9KT/sgqyPJrOMQ6Mh7rBL0ndsrCH+D2jf
	ZodBzbQs6BP/nR0A+Y3N47xt1ODQnpFwxF8Qih/LQq30Trldg1aRGA/JGT1W/tPniXAwUHtO63k
	=
X-Google-Smtp-Source: AGHT+IH9rwpGx6FVmhn2H7MINkNBwdXAeDQAQmG3RdCRk8MYvMavSMhIl3kaB6BIWSNrGmErpa7/7Q==
X-Received: by 2002:a05:6a20:6f8c:b0:1c6:fb2a:4696 with SMTP id adf61e73a8af0-1d6dfa3b86bmr11593884637.19.1728191599143;
        Sat, 05 Oct 2024 22:13:19 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c80:4777:2335:9333:3268:a231? ([2401:4900:1c80:4777:2335:9333:3268:a231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cbd8b8sm2256394b3a.1.2024.10.05.22.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 22:13:18 -0700 (PDT)
Message-ID: <1323e6cd-eff7-4fa4-93e7-1f4577e00a98@beagleboard.org>
Date: Sun, 6 Oct 2024 10:43:12 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Robert Nelson <robertcnelson@gmail.com>,
 devicetree-compiler@vger.kernel.org
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
 <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
 <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
 <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box>
 <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
 <Zuo8yWrRPGcqnEwN@zatzit.fritz.box>
 <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>
 <ZvDjW7W1096FW8XL@zatzit.fritz.box>
 <CAMuHMdXG32pj=nO9iGTD69QSLY7p9BoASqnMi87LBmBuQg0GAA@mail.gmail.com>
 <ZvEpHCeKDi_8XGcz@zatzit.fritz.box>
 <CAMuHMdWsKQZw+pDZ7t3X3amCV6ms76v4o_FsdZ6-XJEDrv4Gvg@mail.gmail.com>
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <CAMuHMdWsKQZw+pDZ7t3X3amCV6ms76v4o_FsdZ6-XJEDrv4Gvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/23/24 14:42, Geert Uytterhoeven wrote:

> Hi David,
>
> On Mon, Sep 23, 2024 at 10:41 AM David Gibson
> <david@gibson.dropbear.id.au> wrote:
>> On Mon, Sep 23, 2024 at 10:22:03AM +0200, Geert Uytterhoeven wrote:
>>> On Mon, Sep 23, 2024 at 5:41 AM David Gibson
>>> <david@gibson.dropbear.id.au> wrote:
>>>> So, essentially you're just adding new labels as aliases to existing
>>>> labels?
>>>>
>>>> Ok, I can see at least two ways of doing that which I think are a more
>>>> natural fit than allowing symbols to be phandles.
>>> [...]
>>>
>>>> # Method 2: /aliases
>>> Does the (Linux) DT overlay code support updating aliases?
>>> Last time I needed that (almost a decade ago), it did not.
>> Huh.  I hadn't realised the kernel kept a separate cache of aliases
>> that wasn't updated.  Assuming that's still the case, that would
>> complicate matters a bit.
> Indeed.
>
>>> "[PATCH/RFC 0/3] of/overlay: Update aliases when added or removed"[1]
>>> was never applied, due to me never getting to all of the requested changes.
>>>
>>> [1] https://lore.kernel.org/all/1435675876-2159-1-git-send-email-geert+renesas@glider.be/
> FTR, if anyone is interested in this, IIRC I have an updated version
> somewhere that did implement some of the requested changes. Just ask.
>
> Thanks!
>
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
Hi, I would be interested in picking up that patch series and getting it 
merged. Regardless of whether we use alias for mikroBUS, I think it is 
high time the devicetree support is improved in Linux kernel.


Ayush Singh

