Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BB92451CC
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Dec 2024 04:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733892701; cv=none; b=s1QF/L/ZeY0SyxS17SHotDWny7jCgWHY8Ay9eZj6Zv18FTsZ7IZGYDihu6hqyVtTyItPZMKvuTVKHLvFR9YVQWSNKEQRQjW17Pyx+3zAx4J43Im4uMd98NUlc34Bmm6jL5Wg62EpPfGlA8CPXONnzWNBLATFAALSios1hGfiMdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733892701; c=relaxed/simple;
	bh=Nzh4YMPI5ST1iGmtiX4vMyprw+I+CGz73yro5veYvrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kif18zP5ktWfZtoZGoE4p+h/7T5hSZGJ5XERV1R6gwCjHGKUN8Lolsc/EtoFjWoa6sMrai+Sgtlrm/fjud78VAUmLOwuYh8Wfup6aCF7ZTvrnqfMIr5KEIX5kbJbC4GEmttmtdRcRQG4MiR4/VvkiA3PBRF3Wi5g5Xb+GlkoAvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=m6ZyXaEr; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="m6ZyXaEr"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-728e78c4d7bso255015b3a.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 10 Dec 2024 20:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733892699; x=1734497499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oja17oUdV6C8d/zHpqiM10fesI0e6bQ6Hq93LpwYcs4=;
        b=m6ZyXaErOyh2/hGj3tAbU4hb1++Dtn1GDoEZlFN4DCTRxfKP1buFwh/qaWBry0ibpH
         97a5+/Zyco6BYa+tPGOeCeRXEUGLXlqdsdS3/aK6hRQZ5ig4Mg7Zh1n/p6VuGxCQiHQJ
         m+5ugxmQVlfLW0BMQKzbzQTYvSvni8w38xmq6ZsoUjarczCXen/e7yh02pJgVyDI+Q5a
         XzwBSKpzXFyBRom8VftnnOODSRmOar2OPtVUvVtsRaoPXYq+/5EWK1r8RtTwAcS7wo8i
         YBT+u1FwTEQeVvXHLuqoV6yxPZkAD4Sl0vkvE83w+5sHNpvy4LMi+OF+ViFwhG0MZgDj
         LRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733892699; x=1734497499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oja17oUdV6C8d/zHpqiM10fesI0e6bQ6Hq93LpwYcs4=;
        b=L0Lg/tnTGa6aoj+FMCId75nGudM3ZqXAfwGJtvM1GhcjFFiTdU8sDZfb1xSmE/zZ4e
         Y+w0ZP47O0Jf8YsfIlYThqgnvaPZ2jdTrfS+ZR+wca3LPZH8SyrsYxCcFBtcrDs6LjhI
         fXw3z+GMO4ZsQu3zscnLWPyyg0UN5D+Ifmp/BfXnuSl0ufZfGfEFoU/pRu902k4ZS+pp
         TLT+i6u0HFwu6CGEva/mJ6Qc9nEXjNid06EIZO1bI40dHJqs0m1+H8OiwlwkSahy2qz6
         lc7v6MxFr5YI3PrM1HgAc3lpt4ir81117bfnzIRolfOKn7i7QBlnmqWZujW+xTt4/WSV
         aRrw==
X-Gm-Message-State: AOJu0YzIy7IH+DtUBqto8jnCnKerenNWGqaUO2U8BZTv7vuiSOG4DN9H
	/YRyjnAlrbIFc0vzohuDZTafazkpblj2K25g8DkK3pfdE1Pl1ZH4rQQNF/Af3gJt36IEuCIOcmo
	=
X-Gm-Gg: ASbGncvGmkrkpoO0lPhXqyzabgikz825Dhu8TojsBfhsLr/1tR4TsGn2KUtYwxaaA0P
	ERl6B5y6qB3zxKH2mJPUOaZhNDAw49J9wSBrNV3o2V2JiITRHn9HLol6Un183+2YCvVKpIvkgZ1
	2ckcIYmmbvdetbv0UAV1Pj7hAZh54IzDNbJYQ1libNiJLwSPFetWaNbq0TWjV3R2MIMr6HKvtce
	tWTstOs4VY1pAeC10/Qw9fvqV3h0/FAtYkUU6WDusBD+XpA7PtNsNctJr4V5ySNILAIZvRBtu9V
	eewUNponx1GH8bdtpnvZy8jlO3wKzQ==
X-Google-Smtp-Source: AGHT+IG/pBkfk0txpohRymbMU8lvtkywNPRv4ve1Ha6S+Sw4AKPUveaS0i/p1soMF/rsErf0M3ByqQ==
X-Received: by 2002:a05:6a00:3686:b0:725:ef94:737a with SMTP id d2e1a72fcca58-728edbf6738mr2195872b3a.12.1733892698894;
        Tue, 10 Dec 2024 20:51:38 -0800 (PST)
Received: from ?IPV6:2401:4900:5afd:e2bf:d1aa:462b:3983:f0a5? ([2401:4900:5afd:e2bf:d1aa:462b:3983:f0a5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725c89c9978sm7462762b3a.50.2024.12.10.20.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 20:51:38 -0800 (PST)
Message-ID: <014ff56c-8596-4800-9123-cde7bf011073@beagleboard.org>
Date: Wed, 11 Dec 2024 10:21:31 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add capability to append to property
To: Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com,
 lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
References: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
 <58c44f5d-7b45-4489-bf26-2be36c44e39a@iopsys.eu>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <58c44f5d-7b45-4489-bf26-2be36c44e39a@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/24 21:04, Andreas Gnau wrote:
> On 2024-11-11 10:54, Ayush Singh wrote:
>> Allow appending values to a property instead of overriding the previous
>> values of property.
>>
>> Currently, we have /delete-node/ and /delete-property/, but lack
>> /append-property/. Hence we end up having to repeat all existing values
>> when appending to a property (e.g. see [1] appending to clocks from
>> [2]).
>>
>> This functionality is also important for creating a device tree based
>> implementation to support different types of addon-boards such as
>> mikroBUS, Grove [3], etc.
>>
>> In practice, it looks as follows:
>>
>> ```
>> dts-v1/;
>>
>> / {
>>     str-prop = "0";
>> };
>>
>> / {
>>     /append-property/ str-prop = "1";
>> };
>> ```
> 
> If we add /append-property/, why not add /prepend-property/ as well? 
> This is not only "nice for consistency", but it would also enable 
> solving a problem where SoC compatible strings from dtsi [1] need to be 
> repeated in board dts [2], because one cannot prepend to an existing 
> property.
> 
> ```
> dts-v1/;
> / {
>      compatible = "soc-vendor,soc1234";
> };
> 
> / {
>      /prepend-property/ compatible = "board-vendor,board-xyz";
> };
> ```
> 
> What do you think?
> 
> [1] https://elixir.bootlin.com/linux/v6.12.4/source/arch/arm64/boot/dts/ 
> renesas/r8a77951.dtsi#L18
> [2] https://elixir.bootlin.com/linux/v6.12.4/source/arch/arm64/boot/dts/ 
> renesas/r8a77951-salvator-xs.dts#L14

Well, it does seem useful. I can implement it after append-property 
support is merged.

Ayush Singh
