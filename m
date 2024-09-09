Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464871B1503
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Sep 2024 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866682; cv=none; b=qx5c9kSPnWOngbEYP3TR+3uQ/Zl7SxcxpZF4DdAhrioo5nsB75OMnL/hMXxXCt0K1MWSk3/fwJRodTXYg3+qZKP3gZUPphoPysExXBQ7D2L1gh8xL6b79LRz8YNZE3pK2qD2fL1JK/N05QbOGvXPXDlooXvtFo4XScQz4rSMRAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866682; c=relaxed/simple;
	bh=Nc7bmBExu+pLYQc81JiB6+uNQyVRBos5LS/s4Ioyohw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=er21a+wcr9euYsqaFKGI6q3YcqYAwvLDkWnjphSNM5GCLfM0nvSW0hZacs9KkwAfW+A+CdObkYvf1+HOy6CxeiGJsaFJ+WOBARp6qNCR2kv9NCzRWvdlEZHTakTnNf45ftoAlzkXT4n1tBMZ8PcZ6igk6evNrxi5vbGu2fi/z3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=EHsaJMgM; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="EHsaJMgM"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-718e6299191so668427b3a.2
        for <devicetree-compiler@vger.kernel.org>; Mon, 09 Sep 2024 00:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1725866679; x=1726471479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OPmmf5h85ZgIL98kxz1rWTklbshn9Ofd2a2Wwu5tco=;
        b=EHsaJMgMVpFE6kGBjnvW0hh57vsBiV2H2GbBJUBnQk/F1Wi2Qv7Gi71wsNCAN9fkmX
         kXK2Uuz5ztSBWYpFxom23NEa68WeZGH0Ryx76xT+561ng7H/muyhKl1f2qqY8r6RM861
         ed9Hnw/QOl9SYBG8inRWjyi6KWxbrLzwxPKnivKFoAnrwXP5VZymFS2lWdsGdUBUT/xI
         WnjSsoZj0S9NTZCmSTt4O9NC5mtpcRwKtkDbt1XOR6EAtOe0gK8z/I6QrbOit3hX8huu
         st9JwI7NLsxl1J/GB6o9QHck5X3L8QnYSYyLWSoKwGt88zyUlfAanm4kYUpNNeToe+2Y
         8t0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725866679; x=1726471479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OPmmf5h85ZgIL98kxz1rWTklbshn9Ofd2a2Wwu5tco=;
        b=ICFfRigNJLqJqFlbpkj+C1HO/gsCqjsAh7rncocjRIXOvpBR2IJpUHktldrIvdc0G4
         JKkgKLb4/R+ScnmSVl3xEi+szaQxK9nLvgSmVlVUBdvoXXp0TD7ulO8YaRMAlwJH9Fo1
         lOgqMNiqBuPS2uy277TFsg4KwDG9D5ntroHuLheIByc18fLDYy3NGG2O8FCvBIUrZLXj
         K+NgyjyMyjtEDm53f0XuejIl9EUxgujwBVJua2Ln4CI37gDm4yIPgdDzoNJXwHdTJdi8
         2xjmlbE96YXS1DHYnMNDVAEi3/D5bZYu1rddafCnNF8FqX2+VIP18N0Qk84zUJQt/Rxd
         sPew==
X-Forwarded-Encrypted: i=1; AJvYcCWXEjCzXAMMvS40KjpgNrFSOHKSgYO/VMg494g2n2bljxq3FMKVyatH73cfvPmPRD93SGJ1SrcJtcgooSALZaP06r9i@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQQj4naeguVCzZWpOOPa4wy6tWjQu6fUNnpexWHpFRSIo8F56
	PhODPUg1qXbve2kQHPXJHIWRGkqAfb84ax5cCNun7W5+JyHUJDlBCjWRo/n+ZA==
X-Google-Smtp-Source: AGHT+IFk46VCwz5wUN7TosOuhHLIU9XBAx5S3ASfkJ9Ukm64VByqMrtT9SQ3qrr52bo15iDugw9t4A==
X-Received: by 2002:a05:6a20:4387:b0:1cf:287a:414e with SMTP id adf61e73a8af0-1cf287a416cmr8261278637.1.1725866679389;
        Mon, 09 Sep 2024 00:24:39 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1f38bsm28266195ad.200.2024.09.09.00.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 00:24:39 -0700 (PDT)
Message-ID: <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
Date: Mon, 9 Sep 2024 12:54:34 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
 <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/24 10:33, David Gibson wrote:

> On Mon, Sep 02, 2024 at 05:47:55PM +0530, Ayush Singh wrote:
>> Add ability to resolve symbols pointing to phandles instead of strings.
>>
>> Combining this with existing fixups infrastructure allows creating
>> symbols in overlays that refer to undefined phandles. This is planned to
>> be used for addon board chaining [1].
> I don't think this "autodetection" of whether the value is a phandle
> or path is a good idea.  Yes, it's probably unlikely to get it wrong
> in practice, but sloppy cases like this have a habit of coming back to
> bite you later on.  If you want this, I think you need to design a new
> way of encoding the new options.

Would something like `__symbols_phandle__` work? It should be fairly 
straightforward to do. I am not sure how old devicetree compilers will 
react to it though?

I really do not think having a different syntax for phandle symbols 
would be good since that would mean we will have 2 ways to represent 
phandles:

1. For __symbols__

2. For every other node.


I also am not in the favor of doing something bespoke that does not play 
nice with the existing __fixups__ infra since that has already been 
thoroughly tested, and already creates __fixups__ for symbols.


Ayush Singh

