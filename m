Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C3B35FF7C
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232524; cv=none; b=HA0f5iBi7M6rhlA4A6J0UW4KG5MpUPTwo/f10RxYncLrzEM5fEb1n7SVNZrMF6LAjw4AXIke4jyk+TgJBwaRk7L0zrikAAwBAjdKn2qjnvc1249FIALzzf63MXgk3lgeatUghci/JPTiwByhrootIM/pnOvnqXuGLhzhWXDaDFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232524; c=relaxed/simple;
	bh=0ixE+47sZp1DnXkk6AGHLM9Dm9yYyGa9dqQnhmIhPVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+SyX830b48OTW4fKoqxRrwBguMwVgb/VrQvxAKcZphiaeqRjq0pA01V1dBqp3ex8A67wYycLS1zNHLR15ZPmYTKN47Lh2csUbfMics7o2+2Vqo3oxeE606xv1FfzuC6PKj5F4ZmdlDP1eW+neRSatXNvwwJdSbqUN6oLBeRQgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=jjBNwUEt; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="jjBNwUEt"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81e98a1f55eso1406402b3a.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 07:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1768232519; x=1768837319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bqhlDu/L75Ix3r8QYS6oa0up7nb4YKhVtDS4khl9pXc=;
        b=jjBNwUEtRDVApahO6r5CjtaIF+SXfqv0SEksH3Px3eBXrkmHg91iP4lkJ9RQ+iLnOx
         6MYTTBJ9DrDrX1e3jzrObCgr/2Aa+rDCLGSoXAt/A8G+sTIjicVzAd07FcX6pJSpBul9
         ZRZ0POVpyIXFB0d72kmrhX7LzCFsVDys/6tcOMocczuhU0qOY2oWY89fGGI953P/XByt
         38ppsG4noFf1wjBJwITuPRcPSNgbBoUi/8aNIPVzmyLiD9S3JlmdKaZERNh/2fOdv13Z
         +60yWOPKW4aTFojPtWQl1YeYkq5WNzeG6mycI24TTKkQMk7xHzSX9OnDBIKL+df5Adwk
         OcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768232519; x=1768837319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqhlDu/L75Ix3r8QYS6oa0up7nb4YKhVtDS4khl9pXc=;
        b=LpfWyqMDmd9Aq8vE/ARW0eqbmvoLoBtb8Tyfen6bOWj9prIuU57eselFd0/FnN9DM9
         uOLlELQy+Dcp+Gj0C51pQbL0JdTk6aAr+XHpIC5b036PqrdIZp6tGmADBT3AtrjyWn1e
         1ZY1zO57iKluyyAGoJOVG964lQqJp/ryZ/eXeE/+RMxhUVau8uY0WwFFAbd4/saLVtiE
         mZqJ45g5wB+ouR/RgoeUfF6fseo8x/LLd0zMRUUHkXzu/34iQEDXcdudvBuion2piaAM
         unNquF8bJlMCZwsXoi0Peq0EUxizURAvmugNdD2LoXtYMm6D9eQ90mp8mgMSkotDxYT5
         7REg==
X-Forwarded-Encrypted: i=1; AJvYcCVXhSE7AL68BZRHOUsdT3fNgu6n6tef76kP6lWGzLFZbWhDgEAthqG7EJvQp4Fo0BK0q1LVYccTgd4+U2Iv864qteRh@vger.kernel.org
X-Gm-Message-State: AOJu0YyvGL8eHqgnmbrHcrQhW+PFhYE5TSxiyk91/oZOw5ze49TIM8Tq
	qhVDVEYN4g2UHATVe/etjNAYB+MiqOouaNbD1AgHM5rVtDIfOUTSMG5qOSRa64InVg==
X-Gm-Gg: AY/fxX4NAoptEuBceM9FpLzskTGeTO+I2bWxlcafQzNA1sjF1dQCeo6+g6/WCKQPR7m
	MBHSmbxIepBYHAHzug2phWpPTtBWMv+p5puO8oWjbwkHi/AuH68PalhJ/lonoV/6RFLFqyfJ5Ix
	gwg7OyaikKJFYrjVgkqUm3TEiotE0P9fHKZlS3YlOBX73xJrkTtMWtTCJBZfFqH0nfTkYzfe7it
	hAc5n8OGKah5iWMClvD031TsYEO7tlfRglm1NpfjPqvYSLTJPAtL7LNxX+Z/pfTQC7JRLJxa+q0
	sI82ciV03JGUi4K702zvvZMNYGmwZ/bqWxJ+pjBV+RlvdWk5x49QjHxG0A6tDp3rs9b5VqDTaPq
	DNUxn8Zt+Yzw6An1eCBDRyDNNlPpNJHTb/IkW7ZkgFe9202Qbw9JL8iVSScQ2KrSPc+O22C7ys4
	LZueC7n6lW31P9D6S9cmTEfmRQQuVhxly5GEm+vfA94GnPZGRA3LrkAIHOGe+7SbHj7CKJ2pND
X-Google-Smtp-Source: AGHT+IHOB4LYJU5QTAG2Ul6rg9vyz3AWxpUuvs8avyxsKiTX32XGDXkc1itlFYqjbE+2xfhlFG+XTw==
X-Received: by 2002:a05:6a00:450a:b0:81f:44f9:7c1a with SMTP id d2e1a72fcca58-81f44f98a4fmr5072782b3a.3.1768232519053;
        Mon, 12 Jan 2026 07:41:59 -0800 (PST)
Received: from ?IPV6:2401:4900:1f3f:e311:7179:901d:930c:942? ([2401:4900:1f3f:e311:7179:901d:930c:942])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f43dfd462sm5574405b3a.27.2026.01.12.07.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 07:41:58 -0800 (PST)
Message-ID: <ceaa0a9a-8d72-44c0-943d-dc212f1aa5db@beagleboard.org>
Date: Mon, 12 Jan 2026 21:11:52 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/77] fdtdump: Change FDT_PROP prob handling to ease
 future addition
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
 <20260112142009.1006236-6-herve.codina@bootlin.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260112142009.1006236-6-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/26 7:48 PM, Herve Codina wrote:

> In order to ease future tags addition, perform operation related to
> FDT_PROP when the tag is explicitly FDT_PROP instead of relying to a
> kind of default value case.
>
> Handle the FDT_PROP tag exactly in the same way as it is done for
> other tags.
>
> No functional modification.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>   fdtdump.c | 34 ++++++++++++++++++----------------
>   1 file changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/fdtdump.c b/fdtdump.c
> index ec25edf..95a2274 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -129,23 +129,25 @@ static void dump_blob(void *blob, bool debug)
>   			continue;
>   		}
>   
> -		if (tag != FDT_PROP) {
> -			fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "", tag);
> -			break;
> +		if (tag == FDT_PROP) {
> +			sz = fdt32_to_cpu(GET_CELL(p));
> +			s = p_strings + fdt32_to_cpu(GET_CELL(p));
> +			if (version < 16 && sz >= 8)
> +				p = PALIGN(p, 8);
> +			t = p;
> +
> +			p = PALIGN(p + sz, 4);
> +
> +			dumpf("%04"PRIxPTR": string: %s\n", (uintptr_t)s - blob_off, s);
> +			dumpf("%04"PRIxPTR": value\n", (uintptr_t)t - blob_off);
> +			printf("%*s%s", depth * shift, "", s);
> +			utilfdt_print_data(t, sz);
> +			printf(";\n");
> +			continue;
>   		}
> -		sz = fdt32_to_cpu(GET_CELL(p));
> -		s = p_strings + fdt32_to_cpu(GET_CELL(p));
> -		if (version < 16 && sz >= 8)
> -			p = PALIGN(p, 8);
> -		t = p;
> -
> -		p = PALIGN(p + sz, 4);
> -
> -		dumpf("%04"PRIxPTR": string: %s\n", (uintptr_t)s - blob_off, s);
> -		dumpf("%04"PRIxPTR": value\n", (uintptr_t)t - blob_off);
> -		printf("%*s%s", depth * shift, "", s);
> -		utilfdt_print_data(t, sz);
> -		printf(";\n");
> +
> +		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "", tag);
> +		break;
>   	}
>   }
>   


This seems reasonable refactor independently from the rest of the patch 
series.


Reviewed-by: Ayush Singh <ayush@beagleboard.org>

