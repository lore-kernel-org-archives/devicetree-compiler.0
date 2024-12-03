Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3FB7E591
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211085; cv=none; b=oYpGHFvHqVXfsSor8bKGwzP9wb9i3sRkUuZqLeAwZju9VZdLuzsMCQt5kgmDWiXiz/tYeQZD4+Kn/nsK8fcGtiSL6fBRLkQf21TKntJuZ41WqNt//H9/Y7U+En0Y/sAMVicQNjgDtjM7/GPf/pKORcqwFLHKy7WjCbJe0iprAzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211085; c=relaxed/simple;
	bh=k9xS1pU2j28OqpWlnHmW+px99J3/VCDlNx4IJUoNYr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOEUmFZ3RFC8WtSJeBdwaehq6VPqRXxAHLh66T8Urh11PZt9ptcrXqArf/Vd1sAA5CpxzR1h7rgORl+G/q0fRNULeBzKH54z1B3VPHNwmxxJ2SM5PSbR9tF/Zp+UhUdf3e+N8LSvwvGSGHcaoyDohPiRkM8RKj5C5ieOi8569H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=YpClZgey; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="YpClZgey"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fbc65f6c72so4897464a12.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 02 Dec 2024 23:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733211083; x=1733815883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z21d4zOY90jcbUXIIu+kTgTSr3yYfcrqP2dtevDMfOM=;
        b=YpClZgey5KBF1Z5LWB//+jfMbRJHu5/EBUWB4yuUY2Rn7KhWoFKdUG2RgCx1SnA3s5
         W+m4AW+aZVSatcOuR5viO7UjK9S+a2MlXUbZnwkOGoTw0Q94H020L3Ep3v9xwQpp16Ii
         7Tp8NzJZ+jA1kmuRSX+N2S45EmKxeD10vn+6BktS55mSanZ+OKROgamS+1LAZ+h4rG/t
         C6k6NrDMSqU4y+qKqLyrchQlwaNixS/Op18jGQpN8WK4wtL/XTGBrJplZY/ES8kHn81z
         1sC0Oq4HoQuKEcUDh14xoeCvrwdz6RTQ0fwtyKBoAt4jyP4oBRwMrYB3qwapjApsG6wE
         1vQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733211083; x=1733815883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z21d4zOY90jcbUXIIu+kTgTSr3yYfcrqP2dtevDMfOM=;
        b=ANILOSrsPyEF6WY1pEt6IWBpeX7t6HDvcJCcBJdNAiQ7pnskyWmis3I2SifB5p7Jpw
         SgLxgvcf7LxOp1P1HYhsnK9nciEzXjaa13K5RILnRm6mAxUCKoMGOMelhJXpra13Nr99
         CnaHS2oD3tahmLYaHEH0V6pKaneti9DUjgtShECadpp4tIHFJN5GwOklIJyOZRantrfO
         8xOLemabiljGwKOqRdw3xsWw0EB9w4/gy5rTcfEFdisrJ6J9DYzEbX9kYrNgYDCyUItd
         rcBTwrTgzvcvZaFTyA0rNfGEOVt5pZA/iANRP60+nkjsv7+1q7ZD/FIGsmlwroKq9Xgo
         kTwA==
X-Forwarded-Encrypted: i=1; AJvYcCWMl/o1v4a8TR0hVGISJCnU9vkmqbd8IeEQQbcLF4EhWSGkYvhHvQCgoKwcCvLQlLp5O8pSjnEcsiOEcJdCKRMNF+ah@vger.kernel.org
X-Gm-Message-State: AOJu0YzuM943mr6TppIbeTmAh100fpqT2+az9m4Fmh11z9zIoDjdrQZn
	3KmuTPWDo5akq/5vSeAQz0qqCnb235aXyvr21gnQ3FDVlekE+c+KELWI/8LKSQ==
X-Gm-Gg: ASbGnct3lI4xPctz60MGJip2XmuI23dXJfvQS8ol9cKAOon8ZpRcRbPJHaJZtdslpPo
	nzQTYEK7hAHGn43ePB0CdIP/aaHUeg+yobpBydHTrejxzio3Tsq/Yyx2/5ZFEm2L/QQsb5Kpma9
	9xA6gszmZVI18J8sYN6WWPvKowuFxs5gChtyFmMVoNtiYNf+q073c6Hrj5q/IKhauzgJP0eZvnv
	6vxF5kLNkRTi3JEqHww3k204wbceoD+Bfk6+cdxazv045D4W1a6jt4FWA==
X-Google-Smtp-Source: AGHT+IEIIr+3/kXQ2YWC+8QXNpyzDxGgDCBZvOoKjd3DaF5j/j2YyJ+/DtPaOCzFEn7CFjrTx09Zhg==
X-Received: by 2002:a05:6a20:c70b:b0:1e0:dacd:fef with SMTP id adf61e73a8af0-1e1653b7d5emr2217420637.15.1733211082802;
        Mon, 02 Dec 2024 23:31:22 -0800 (PST)
Received: from [172.16.117.191] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254180fcb0sm10022799b3a.147.2024.12.02.23.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 23:31:22 -0800 (PST)
Message-ID: <0c5e3d1f-766b-43d8-a4f6-1aa36efb3f8f@beagleboard.org>
Date: Tue, 3 Dec 2024 13:01:17 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] libfdt: Add namelen variants for setprop
To: David Gibson <david@gibson.dropbear.id.au>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-2-ac3e121359e9@beagleboard.org>
 <Z06FR1Qqp9BvdxPM@zatzit>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <Z06FR1Qqp9BvdxPM@zatzit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/12/24 09:42, David Gibson wrote:
> Sorry I've taken so long to reply.
> 
> On Sat, Nov 16, 2024 at 08:30:20PM +0530, Ayush Singh wrote:
>> Helper functions to setproperty with length of property name similar to
>> getprop_namelen variants.
> 
> The idea of this patch is good, independent of the rest of the series.
> I'm kind of surprised we don't already have a setprop_namelen()
> actually.
> 
> Unfortunately, this implementation isn't usable as is.

Ok, I will fix things and send this as a separate patch series. I will 
need to make a lot of changes in the rest of the patch series anyway, so 
it should work out well.

> 
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>>   libfdt/fdt_rw.c | 19 +++++++++++++++++
>>   libfdt/libfdt.h | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   util.h          |  1 +
>>   3 files changed, 83 insertions(+)
>>
>> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
>> index 3621d3651d3f4bd82b7af66c60d023e3139add03..9e66c2332bf4d3868c1388c294a195b152b6aefd 100644
>> --- a/libfdt/fdt_rw.c
>> +++ b/libfdt/fdt_rw.c
>> @@ -7,6 +7,8 @@
>>   
>>   #include <fdt.h>
>>   #include <libfdt.h>
>> +#include "../util.h"
>> +#include <assert.h>
> 
> libfdt is designed to compile and work in limited environments (early
> stage bootloaders, for example).  Therefore it's very limited in what
> libc functions it's permitted to use: basically it can only use the
> things listed in libfdt_env.h.
> 
> assert() is not ok, malloc() is right out.
> 
>>   #include "libfdt_internal.h"
>>   
>> @@ -288,6 +290,23 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
>>   	return 0;
>>   }
>>   
>> +int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
>> +			size_t namelen, const void *val, int len)
>> +{
>> +	int ret;
>> +	char *name_temp = xmalloc(namelen + 1);
> 
> As noted, we don't use an allocator in libfdt.  In fact that's a large
> part of the reason the _namlen() functions exist in the first place.
> To add this, you'll need to start with an fdt_get_property_namelen_w()
> in terms of fdt_get_property_namelen(), then make
> fdt_resize_property_() and fdt_add_property_() take the name length,
> then finally fdt_setprop_placeholder_namelen() and
> fdt_setprop_namelen().  The current fdt_setprop_placeholder() and
> fdt_setprop() can then become trivial wrappers around the namelen
> versions (like fdt_getprop() wraps fdt_getprop_namelen()).
> 
>> +
>> +	assert(namelen <= strlen(name));
>> +
>> +	memcpy(name_temp, name, namelen);
>> +	name_temp[namelen] = '\0';
>> +	ret = fdt_setprop(fdt, nodeoffset, name_temp, val, len);
>> +
>> +	free(name_temp);
>> +
>> +	return ret;
>> +}
>> +
>>   int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
>>   		   const void *val, int len)
>>   {
>> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
>> index 96782bc57b8412d73dff92d6e0ad494ec0a23909..999b3800dff5c001b9c1babf370d45024c81a9aa 100644
>> --- a/libfdt/libfdt.h
>> +++ b/libfdt/libfdt.h
>> @@ -1690,6 +1690,38 @@ int fdt_set_name(void *fdt, int nodeoffset, const char *name);
>>   int fdt_setprop(void *fdt, int nodeoffset, const char *name,
>>   		const void *val, int len);
>>   
>> +/**
>> + * fdt_setprop_namelen - create or change a property
>> + * @fdt: pointer to the device tree blob
>> + * @nodeoffset: offset of the node whose property to change
>> + * @name: name of the property to change
>> + * @namelen: length of the name
>> + * @val: pointer to data to set the property value to
>> + * @len: length of the property value
>> + *
>> + * fdt_setprop_namelen() sets the value of the named property in the given
>> + * node to the given value and length, creating the property if it
>> + * does not already exist.
>> + *
>> + * This function may insert or delete data from the blob, and will
>> + * therefore change the offsets of some existing nodes.
>> + *
>> + * returns:
>> + *	0, on success
>> + *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
>> + *		contain the new property value
>> + *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
>> + *	-FDT_ERR_BADLAYOUT,
>> + *	-FDT_ERR_BADMAGIC,
>> + *	-FDT_ERR_BADVERSION,
>> + *	-FDT_ERR_BADSTATE,
>> + *	-FDT_ERR_BADSTRUCTURE,
>> + *	-FDT_ERR_BADLAYOUT,
>> + *	-FDT_ERR_TRUNCATED, standard meanings
>> + */
>> +int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
>> +			size_t namelen, const void *val, int len);
>> +
>>   /**
>>    * fdt_setprop_placeholder - allocate space for a property
>>    * @fdt: pointer to the device tree blob
>> @@ -1839,6 +1871,37 @@ static inline int fdt_setprop_cell(void *fdt, int nodeoffset, const char *name,
>>   #define fdt_setprop_string(fdt, nodeoffset, name, str) \
>>   	fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
>>   
>> +/**
>> + * fdt_setprop_namelen_string - set a property to a string value
>> + * @fdt: pointer to the device tree blob
>> + * @nodeoffset: offset of the node whose property to change
>> + * @name: name of the property to change
>> + * @str: string value for the property
>> + *
>> + * fdt_setprop_namelen_string() sets the value of the named property in the
>> + * given node to the given string value (using the length of the
>> + * string to determine the new length of the property), or creates a
>> + * new property with that value if it does not already exist.
>> + *
>> + * This function may insert or delete data from the blob, and will
>> + * therefore change the offsets of some existing nodes.
>> + *
>> + * returns:
>> + *	0, on success
>> + *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
>> + *		contain the new property value
>> + *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
>> + *	-FDT_ERR_BADLAYOUT,
>> + *	-FDT_ERR_BADMAGIC,
>> + *	-FDT_ERR_BADVERSION,
>> + *	-FDT_ERR_BADSTATE,
>> + *	-FDT_ERR_BADSTRUCTURE,
>> + *	-FDT_ERR_BADLAYOUT,
>> + *	-FDT_ERR_TRUNCATED, standard meanings
>> + */
>> +#define fdt_setprop_namelen_string(fdt, nodeoffset, name, namelen, str)    \
>> +	fdt_setprop_namelen((fdt), (nodeoffset), (name), (namelen), (str), \
>> +			    strlen(str) + 1)
>>   
>>   /**
>>    * fdt_setprop_empty - set a property to an empty value
>> diff --git a/util.h b/util.h
>> index 800f2e2c55b150d3c30101d1e1f1daaa0e4e3264..3e2ebaabe1e8c7e9ad6821ac2ca17a72e7f4f57d 100644
>> --- a/util.h
>> +++ b/util.h
>> @@ -6,6 +6,7 @@
>>   #include <stdarg.h>
>>   #include <stdbool.h>
>>   #include <getopt.h>
>> +#include <stdio.h>
>>   
>>   /*
>>    * Copyright 2011 The Chromium Authors, All Rights Reserved.
>>
> 

Ayush Singh

