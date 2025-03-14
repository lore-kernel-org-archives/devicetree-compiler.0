Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2622E13D53B
	for <devicetree-compiler@vger.kernel.org>; Fri, 14 Mar 2025 05:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741930073; cv=none; b=Kjee4XnU+kM4FNcfNUbA4CKk7N4LZwbrmFx709+8PvikRnm7DPIEp39WljaCw5ZY1gm0C0tYgjyEnzAgpXKKuR2EhiXgl8XcPwA6hOD6REuhhJ12bROXr7nGLRaxIYoM3YunY6SyjUWrDza4XVp+HQEXj9sVqZec1vJYjPkrxOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741930073; c=relaxed/simple;
	bh=UGbyUtdaX7XyHcdCVI/hrw+2mLFwW7qWCm1joO6rtr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=g6IkkJhfqWwZDek/44v7mScxb261enTAK41JtTBV3sGGpQvWnkG5ux6gPpm+MSpx27qKobPNjC2DdRjjb4a1MqhyqifwMf3ddfJkEZTV/63R2umPcU5CJ9y6egAYMFo72k2H0W1Gmfn8SUGBBrdKb4VzyKBcfAMWS8c5XfBXGvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M7fB0vRC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M7fB0vRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741930070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vkvB5P6beXEfszxW3gCI1r9TRVJhzKSjUefKCulXrkQ=;
	b=M7fB0vRCYnuAuPg1pbgqxWB1AIr7E/AZ1tix6tlekbxjXsEvHwfIT5MLTLknAV8fuaKTkW
	hBR4eK677lzgIFTWI3RIYtwbAbzdv9ASfLTkICSpABC0X1UV7UfY1Wldu2JFzcVzc4b2E9
	L9h+/MDgPye8PNEkAjvm/3y2MGdarFw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-MfGIte_DNP-0SsKIkRHNAA-1; Fri, 14 Mar 2025 01:27:47 -0400
X-MC-Unique: MfGIte_DNP-0SsKIkRHNAA-1
X-Mimecast-MFC-AGG-ID: MfGIte_DNP-0SsKIkRHNAA_1741930067
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf446681cso9474775e9.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 13 Mar 2025 22:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741930066; x=1742534866;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkvB5P6beXEfszxW3gCI1r9TRVJhzKSjUefKCulXrkQ=;
        b=WNunJ/KgkGBOGeErrjhe0b8Q7LQhSWtWJZO412+wt+wKpTMAnA+LLf+DKd2z5jwGNM
         UWyNrQs6cewRsmnUKZZX+rZSLYhahCrIehzq4nkeWG4c2y5iFTxoUQsLsJW4/MY9rL4U
         mQ6f3zuDSQZB3HSWXIQwmE9KDlJkyBS441N1TENKrqxiWhvA9FZZsUQitbowDziv7kBg
         W9caPpFqCNsG+0B0ix9jBNtkN9iDoJtkmScS2dSkaxTmCGlbrUs5HQCj5hRKq03WnkVx
         qR64jPvp96HvMOQo8AAwiwjqjoz4zFygZ+OQNdeHdE52+pL5RQ+0wWqge+ZgdPC0m8rm
         MDoA==
X-Gm-Message-State: AOJu0Yzfl5pA4+li4MnEF2t/zX9aW8UIxbiwONpLe5ZGrESr5Hsst9kh
	imoFJifQLnc5vm3OqRiUF7jWOPDQPdNwvzqTL1Qp2O9Nzc4gFYc62qwGIhrnKZyh0ydx6pAcmmv
	Mb6HR295v3QTUmJXfoKiH/3Orcf8O7u1DXUauzfzT+CGMBXZyYQq4JvZ50vFPyYBY9WcjlEdsd8
	rvONk=
X-Gm-Gg: ASbGncuZaLHPnhpcgVltMw6s3yt6S42i4HvChELZBbswTcsgTKfAP9KfVegehNDqlrg
	q5FsHO934DYYLx4T6Z2knxF+cLuEjaze1ELkCLO/uQ7OGpzvj3O2gpqfIg3M5w8IcPr96o/g7Al
	D+Ejmenz67bJQge+ArGEGlqCCSqvKpuXOeiKjOyJI1fvjn49XfA3lFJ1BKhR8DLC3CJd4X3ulH4
	6I3EkLTCZbOEZQcvLLJQUs50fQxR84Pz5Nb5fbVYr6YLXK/DNHC2JxWTzLWQJz0ETvuELtL0aYU
	/XpSi/2WW+53ayeNI8x8THyHtDoBbCt8tQDKicSODaRDU+0=
X-Received: by 2002:a05:600c:354d:b0:43c:f4b3:b08b with SMTP id 5b1f17b1804b1-43d1ec64089mr14954255e9.3.1741930066635;
        Thu, 13 Mar 2025 22:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSD7AHUkrUz2zO2Wux1rD7aUKt3VpzuyB4RoF6qFV25iQ7wg5UyMiwBWXd4p//YVVzU6Zh2A==
X-Received: by 2002:a05:600c:354d:b0:43c:f4b3:b08b with SMTP id 5b1f17b1804b1-43d1ec64089mr14954105e9.3.1741930066285;
        Thu, 13 Mar 2025 22:27:46 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-51-207.web.vodafone.de. [109.42.51.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe60ad4sm5351745e9.29.2025.03.13.22.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 22:27:45 -0700 (PDT)
Message-ID: <9d891dd7-849c-414a-b8d9-3284d96ef9c6@redhat.com>
Date: Fri, 14 Mar 2025 06:27:44 +0100
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Remove duplicated words in documentation and comments
To: David Gibson <david@gibson.dropbear.id.au>
References: <20250313190527.1556019-1-thuth@redhat.com>
 <Z9OZEMY0iD9FNEO2@zatzit>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Cc: devicetree-compiler@vger.kernel.org
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <Z9OZEMY0iD9FNEO2@zatzit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/03/2025 03.48, David Gibson wrote:
> On Thu, Mar 13, 2025 at 08:05:27PM +0100, Thomas Huth wrote:
>> Let's avoid repeating single words here!
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Applied, thanks.
> 
> What brings you to making dtc patches?

I'm currently trying to clean the __ASSEMBLY__ vs. __ASSEMBLER__ stuff in 
the kernel, where I saw that they have a copy of fdt.h in their tree, so the 
origin needs to be fixed, too. While checking dtc, I noticed that I had this 
long-forgotten patch here sitting in my local copy of the repo since years, 
so I thought it would finally be a good point in time to finally send it out :-)

  Thomas

