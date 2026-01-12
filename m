Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533B82DA75C
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229723; cv=none; b=iv3Lotj7aWSpO0uFSjc7q2eZ++TenOQ6JXvezWUyv7QhmloqLaVx23fGe2EzvD+cOCawNM2HMuR3VAaHXZj1ALrDI9LfYPohcV7V9P2Kd5eAhr2l3fP8f0p9vPfoOWpJuDXPkNmly+BofvTSdGf0opSx6ocyfMJQ6zvVhQ9ure4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229723; c=relaxed/simple;
	bh=udw57NFssotqrqEj8KCqBZXIM1DX+Oq6n2i7cO+vzXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XB6Vze18iOY6S6aA00EtX+Dg71SiOWGEYpouPo7zOpOGlyuGAgCTd3ZJJuKS/+WZMX+Z4ndxr0+0iA5MkpqyF+Sq6XrSAePLYP6RSa2A3euu/IQZIja83OO2z4K/Z/T/OuNqCqP4m3qUrTncL/DqkKzDKR5QkB8E0XIbvFxaGcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=fQLVxZON; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="fQLVxZON"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bbf2c3eccc9so2051776a12.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 06:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1768229717; x=1768834517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCeoeD1NcujYFAQDlchiAtvGNFTdOsvTnQ6PwbSGdbo=;
        b=fQLVxZONYxMDVdpj/3G6ippit2tlMlUNxItSJKjLNhC2yp8EPMOFaTDuMQ7PvtQYR3
         r5iL0G0hErDPbnCi1MzZlz3uAtSoO1q0pmyFnQN8NyKCmxEb52kyDss+WkxFQnRHjuWa
         xhGR/Ik9bAPkNIvHFQR55exKY6om8qSpurcwfSgiJIT2BhQGzP2hSB6ndz0p6Y3+VGco
         XZSNvXTuHM7P8XSvdXkvtagh8HR/6By2lOygz2pPqanB3SKBDegJMoLLl1QlRBX1KDUO
         qlvT+14T5zbH/BaXg9/4xpjbmHreusFHhYm2YJ2bBSI8niyjLiYJr+0XeQwsWGJc28+u
         BZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229717; x=1768834517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCeoeD1NcujYFAQDlchiAtvGNFTdOsvTnQ6PwbSGdbo=;
        b=CSPR/d+kxwQYx7C980/3mNIwjw4P9Bj3FoKSHJNu46FTy5JR7vKjc4lyr7NrJEHLWg
         RnHB0YPkqfph9K/oAt7jmEnnZuU/Bwuum21v/DYBwJdulFWA/qKpMzH1Mgqv5QuC4r+0
         /hU3wrGAErTwVy6q+KQYRKS99zZgTM/RWkapx8UT7wORU6DLce3/2hRBJ1M4jZKQwqHm
         qroJiU/ViG5X2Ps64AYLw7KDQLfsF5YzNnvhhlgeCVKbnhXCoYAHjCxFajRvuOJ4n9Fp
         hGsPwG7dCbm7vhxBY5SJfJ9vWUHtaMUoKhQG5HnJBqit6tvsbKs5TzyOkd755oe9vCQb
         VNWg==
X-Forwarded-Encrypted: i=1; AJvYcCXqRIpQJPLu6d72/Z8E4CUksGnjXDk1N0+koz8dj/OcTkrBHJxCqY+CpoEHgl85Ic+rwJOCwqBBesPIBL0JBTwaw3Vf@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWGcA6cSSoMwDxwC5tId90r52ZWHMDLiOv37ABhi8YMZMyzbe
	8542IRTDIjERyiV9jz92GrkZQKB1uG+iBNWvbMVH9dhYOIpN9r5qRaiircRS1PVbkg==
X-Gm-Gg: AY/fxX7Zjf/xh8Xi8FPTAFOKWx3JV9pa3wGvavdy3YIQMsK6fs+WdTIBFXKeOYgEgr6
	BV8DFMb9z1sIhjJbyiwG0//0P8Bi2KX0mmVAGyUrWzt1bPRjErdKOPuMiXSLAR3xoqgWd86IrFi
	zxwM8ITvh6A5cvVlopnSpur8nI6dAW5aQGxrarhBSF+ncJ6eF4waBwsTmTLpXbQR66RONdZmhb+
	3mMLUlFO293jAifGHtAzcrAexrSYzkwHAcFdf4zeTI8L9qtmamsWxWnvNTDf7K6YF8QLWLGYI6T
	RAvkpl6fApuuHbz6GCoffYPXA8EDTSzEKI3bIuc9yWsTwAMO2ujcOZvu00unJqb4Y0VjUa4Lk+2
	NG2ctBSdR8P1VC3Xe6Cw6Di6iLwY5QLL1jmpDPzDaTQjPsguuy3IjR8zJe2wOykwtu0ygDWx8ds
	EVr3PGqLHeUmYEyZlDgIKYRrSk5PNWUJpKLRr82PUujyUiMSmVsgQuHVmW7tSgkQ==
X-Google-Smtp-Source: AGHT+IFtAul1lYvdpQwZc3IOUtzJ/XS1Y7WP0i8vum43wraXPGoTXB6Ts5DFcP4wiioQIdrskbtilw==
X-Received: by 2002:a17:902:da8f:b0:2a0:c92e:a378 with SMTP id d9443c01a7336-2a3edb24516mr170956045ad.7.1768229716815;
        Mon, 12 Jan 2026 06:55:16 -0800 (PST)
Received: from ?IPV6:2401:4900:1f3f:e311:7179:901d:930c:942? ([2401:4900:1f3f:e311:7179:901d:930c:942])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8d76sm177066875ad.84.2026.01.12.06.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 06:55:16 -0800 (PST)
Message-ID: <c725c753-c3a1-461f-856f-7080eb8a97ba@beagleboard.org>
Date: Mon, 12 Jan 2026 20:25:10 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/77] checks: Use consistent type for strspn()
 returned value
To: Herve Codina <herve.codina@bootlin.com>,
 David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
 Hui Pu <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-2-herve.codina@bootlin.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260112142009.1006236-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/26 7:48 PM, Herve Codina wrote:

> strspn() returns a size_t value.
>
> The function is called in several places and in all places this value is
> stored in a size_t variable except in check_node_name_chars_strict().
>
> Fix the variable type used in check_node_name_chars_strict().
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>   checks.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/checks.c b/checks.c
> index 5d09216..041e565 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -324,7 +324,7 @@ ERROR(node_name_chars, check_node_name_chars, NODECHARS);
>   static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
>   					 struct node *node)
>   {
> -	int n = strspn(node->name, c->data);
> +	size_t n = strspn(node->name, c->data);
>   
>   	if (n < node->basenamelen)
>   		FAIL(c, dti, node, "Character '%c' not recommended in node name",


Reviewed-by: Ayush Singh <ayush@beagleboard.org>

