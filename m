Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAA813D281
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Dec 2024 07:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733297962; cv=none; b=e7vRE0pCbYMv68uESK1aC4WejVSbTPfE95myGVJmr0OSo1y4m6tjeKL4BEA+qua3QISEa3/Az7iehtCGTgDOZvT/IxBRBRjzDbx2JkNKTE+AD5ererg7pGsbBE7V/FTHE9o1zlzz2u104cMdA1hGwkU9He25ujEgjohCOKiReQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733297962; c=relaxed/simple;
	bh=FvIpMaplBgUe00cA3qJdxUj8lkhCDb66B++Uu9iPqx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pULFEowGIwWMHPjJWI2lOb+RHklEMZNbxNXsY2EWinGmOqSC2cpuV/ty+e2N3vhTtJv3DekmJn+0n7m7jPudb7gOGbh0COSCliCIiiqb/7kHckg1mWbS8keCSEHEzzmm4JefIwwHOTuO6zfTGhkUCeqv1xLbIi+cp0uEt5n8N10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=KSHfGmC9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="KSHfGmC9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-215909152c5so31261185ad.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 03 Dec 2024 23:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733297958; x=1733902758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQmJp8eYuVY8almfiPGTVZrsH2+5aDXK+iVzgTe4XsY=;
        b=KSHfGmC9NcvAs8EfB/iHdPv8pgYGxOWHDJ6xuOj15dHeDuDOXskIqT8lA/Nrk8GpO1
         FlscNU9fQhukL+FLVrORG8KX7rb+BlRW5EVC9KoqveXo3nvNCq32DPRicfd/zOq+XpAg
         0D1t/7FwH5+vmN2BY2+pT7yUz+bpyRSCIatjRHu6K8zzw+dBwkkjS/RPHRhPJMbup0pl
         cy5dOw6fY0fKyHcRZanhl29Mrkc3QqF5GDTiF+aR2eCjq6KKopFJ3gHl8maku3v6Ka9m
         oKHNG/tHtmiIHOGlwAkAkiuGKTtye4TttQ2/W2q2DmgE15wcenE4b3xIr5Q2MZOdYs1k
         jH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733297958; x=1733902758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQmJp8eYuVY8almfiPGTVZrsH2+5aDXK+iVzgTe4XsY=;
        b=BB6acrndVS5Th0DZKvra49JqXaQluoUzGzGCX072AxDQ3dZGKInNfmyjuA8cudAzVW
         ubAs/2VmxGUhJZAxuf/SOIiSyu7KzWaC1pBmoHYbFWN4BOYLHW5wrB24rExjNTYdYH0O
         2Ufg+/4oR4EA8EP1m/3Qp35qoP8ZOpWkMoq82rDJGAvl928Vb7DiV1rkIelpKEntn/Xh
         NWkDA5AXarFvja4kdsW9g6lExjYAtQpFt0RQrzOH0K8nUZZk2TPVim35T+M1YpYJBykv
         LL0Y86LmPnqIEfM43+a9jvJ8ZDLP1xM8Iz4HtthbbfnRd0FqhoJAca6jNaqkeQxFN2uQ
         yAmA==
X-Forwarded-Encrypted: i=1; AJvYcCWi8PXgjO4rdydZ1oMH3KQanFOz30RoOojt4ineHfEc/ArxzH+BnooxB3gj6c16h4pyTcBPc5uRX+G2xmqL7BUV/JST@vger.kernel.org
X-Gm-Message-State: AOJu0YxmNetjKCt0tF2YEQuAMiUsIvTiwagA9EeKPOF1Ujy3zLKDO42G
	sCwiZnmvdjAy7QbtOBBFStL/YXWTR212SYjl2ODfixtY+kX/ihKfDdTC6/OcfA==
X-Gm-Gg: ASbGncvMOcl7y749XrugXrw83DEDIIoL25y1qnCZsAthxZCmuot8+onoE04ijx8aLG+
	hW6xVRNipqcAqkhN3o/Gv9nAaPhkrZMmtnz+9yAOOlXolGYbWmXXyky771R8K6LBibwfo9FcAJr
	3F3Hm1z23KFqmORwzlhm/DwcRdx6+SjhBT8VMRyhMyz/PNI6QXSbeXNNxVDPuJ/dt57+kxvAi+y
	knNgpOCux4j9BdtrHX+k5JXVGyBk/37W0HhFqtWv1cT8I6obyHGuYd6Jw==
X-Google-Smtp-Source: AGHT+IHNbnS8J9Hc+DCTOeLRhXT/a9Dahlukhz8IDIAWPAr0T+5ctIRHH8bkHBV92JT5HSaLKGP+4g==
X-Received: by 2002:a17:902:ccc6:b0:215:6e28:824d with SMTP id d9443c01a7336-215bd265c86mr70257925ad.49.1733297958326;
        Tue, 03 Dec 2024 23:39:18 -0800 (PST)
Received: from [172.16.117.191] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2158c5bbe91sm50610045ad.221.2024.12.03.23.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 23:39:17 -0800 (PST)
Message-ID: <125c0168-e6ba-4dc6-8ad7-fa9f283bfbf4@beagleboard.org>
Date: Wed, 4 Dec 2024 13:09:13 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] libfdt: Add fdt_setprop_namelen()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
References: <20241203-setprop-namelen-v1-0-d1ea333fbd6c@beagleboard.org>
 <20241203-setprop-namelen-v1-3-d1ea333fbd6c@beagleboard.org>
 <Z0-iguejSh5ck10h@zatzit>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <Z0-iguejSh5ck10h@zatzit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/12/24 05:59, David Gibson wrote:
> On Wed, Dec 04, 2024 at 12:00:01AM +0530, Ayush Singh wrote:
>> Allow specifying name length in setprop similar to
>> `fdt_get_property_namelen` functions.
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> 
> Two really minor revisions suggested below, otherwise this looks good.
> 
>> ---
>>   libfdt/fdt_rw.c    | 41 +++++++++++++++------------
>>   libfdt/libfdt.h    | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++---
>>   libfdt/version.lds |  2 ++
>>   3 files changed, 103 insertions(+), 21 deletions(-)
>>
>> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
>> index 3621d3651d3f4bd82b7af66c60d023e3139add03..33c60063cd721a147a3c6c0e70450c98d8dbd772 100644
>> --- a/libfdt/fdt_rw.c
>> +++ b/libfdt/fdt_rw.c
>> @@ -124,31 +124,33 @@ static int fdt_splice_string_(void *fdt, int newlen)
>>    *	allocated. Ignored if can_assume(NO_ROLLBACK)
>>    * @return offset of string in the string table (whether found or added)
>>    */
>> -static int fdt_find_add_string_(void *fdt, const char *s, int *allocated)
>> +static int fdt_find_add_string_(void *fdt, const char *s, int slen,
>> +				int *allocated)
>>   {
>>   	char *strtab = (char *)fdt + fdt_off_dt_strings(fdt);
>>   	const char *p;
>>   	char *new;
>> -	int len = strlen(s) + 1;
>>   	int err;
>>   
>>   	if (!can_assume(NO_ROLLBACK))
>>   		*allocated = 0;
>>   
>> -	p = fdt_find_string_(strtab, fdt_size_dt_strings(fdt), s);
>> +	p = fdt_find_string_len_(strtab, fdt_size_dt_strings(fdt), s, slen);
>>   	if (p)
>>   		/* found it */
>>   		return (p - strtab);
>>   
>>   	new = strtab + fdt_size_dt_strings(fdt);
>> -	err = fdt_splice_string_(fdt, len);
>> +	err = fdt_splice_string_(fdt, slen + 1);
>>   	if (err)
>>   		return err;
>>   
>>   	if (!can_assume(NO_ROLLBACK))
>>   		*allocated = 1;
>>   
>> -	memcpy(new, s, len);
>> +	memcpy(new, s, slen);
>> +	new[slen] = '\0';
>> +
>>   	return (new - strtab);
>>   }
>>   
>> @@ -182,12 +184,14 @@ int fdt_del_mem_rsv(void *fdt, int n)
>>   }
>>   
>>   static int fdt_resize_property_(void *fdt, int nodeoffset, const char *name,
>> -				int len, struct fdt_property **prop)
>> +				int namelen, int len,
>> +				struct fdt_property **prop)
> 
> Nit: I'd prefer to see name and namelen grouped together on a line,
> then len and prop can go on the next.

That exceeds 80 column limit. I am fine with 100 column limit to be 
honest, but well, I would like that limit to apply everywhere (in any 
new changes), instead of just here.

> 
>>   {
>>   	int oldlen;
>>   	int err;
>>   
>> -	*prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
>> +	*prop = fdt_get_property_namelen_w(fdt, nodeoffset, name, namelen,
>> +					   &oldlen);
>>   	if (!*prop)
>>   		return oldlen;
>>   
>> @@ -200,7 +204,7 @@ static int fdt_resize_property_(void *fdt, int nodeoffset, const char *name,
>>   }
>>   
>>   static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
>> -			     int len, struct fdt_property **prop)
>> +			     int namelen, int len, struct fdt_property **prop)
>>   {
>>   	int proplen;
>>   	int nextoffset;
>> @@ -211,7 +215,7 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
>>   	if ((nextoffset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
>>   		return nextoffset;
>>   
>> -	namestroff = fdt_find_add_string_(fdt, name, &allocated);
>> +	namestroff = fdt_find_add_string_(fdt, name, namelen, &allocated);
>>   	if (namestroff < 0)
>>   		return namestroff;
>>   
>> @@ -255,17 +259,18 @@ int fdt_set_name(void *fdt, int nodeoffset, const char *name)
>>   	return 0;
>>   }
>>   
>> -int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
>> -			    int len, void **prop_data)
>> +int fdt_setprop_namelen_placeholder(void *fdt, int nodeoffset, const char *name,
>> +				    int namelen, int len, void **prop_data)
> 
> Sorry, I gave you bad advice in my earlier message.  I'd prefer this
> to be "fdt_setprop_placeholder_namelen()" (compare
> "fdt_add_subnode_namelen()").
> 
>>   {
>>   	struct fdt_property *prop;
>>   	int err;
>>   
>>   	FDT_RW_PROBE(fdt);
>>   
>> -	err = fdt_resize_property_(fdt, nodeoffset, name, len, &prop);
>> +	err = fdt_resize_property_(fdt, nodeoffset, name, namelen, len, &prop);
>>   	if (err == -FDT_ERR_NOTFOUND)
>> -		err = fdt_add_property_(fdt, nodeoffset, name, len, &prop);
>> +		err = fdt_add_property_(fdt, nodeoffset, name, namelen, len,
>> +					&prop);
>>   	if (err)
>>   		return err;
>>   
>> @@ -273,13 +278,14 @@ int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
>>   	return 0;
>>   }
>>   
>> -int fdt_setprop(void *fdt, int nodeoffset, const char *name,
>> -		const void *val, int len)
>> +int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
>> +			int namelen, const void *val, int len)
>>   {
>>   	void *prop_data;
>>   	int err;
>>   
>> -	err = fdt_setprop_placeholder(fdt, nodeoffset, name, len, &prop_data);
>> +	err = fdt_setprop_namelen_placeholder(fdt, nodeoffset, name, namelen,
>> +					      len, &prop_data);
>>   	if (err)
>>   		return err;
>>   
>> @@ -307,7 +313,8 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
>>   		prop->len = cpu_to_fdt32(newlen);
>>   		memcpy(prop->data + oldlen, val, len);
>>   	} else {
>> -		err = fdt_add_property_(fdt, nodeoffset, name, len, &prop);
>> +		err = fdt_add_property_(fdt, nodeoffset, name, strlen(name),
>> +					len, &prop);
>>   		if (err)
>>   			return err;
>>   		memcpy(prop->data, val, len);
>> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
>> index 7d0c252a34970f4ca841935f8088410a3970127a..c9c81f039365b6d244932786a84a05f065e67c33 100644
>> --- a/libfdt/libfdt.h
>> +++ b/libfdt/libfdt.h
>> @@ -1666,6 +1666,38 @@ int fdt_del_mem_rsv(void *fdt, int n);
>>    */
>>   int fdt_set_name(void *fdt, int nodeoffset, const char *name);
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
>> +			int namelen, const void *val, int len);
>> +
>>   /**
>>    * fdt_setprop - create or change a property
>>    * @fdt: pointer to the device tree blob
>> @@ -1694,8 +1726,44 @@ int fdt_set_name(void *fdt, int nodeoffset, const char *name);
>>    *	-FDT_ERR_BADLAYOUT,
>>    *	-FDT_ERR_TRUNCATED, standard meanings
>>    */
>> -int fdt_setprop(void *fdt, int nodeoffset, const char *name,
>> -		const void *val, int len);
>> +static inline int fdt_setprop(void *fdt, int nodeoffset, const char *name,
>> +			      const void *val, int len)
>> +{
>> +	return fdt_setprop_namelen(fdt, nodeoffset, name, strlen(name), val,
>> +				   len);
>> +}
>> +
>> +/**
>> + * fdt_setprop_namelen_placeholder - allocate space for a property
>> + * @fdt: pointer to the device tree blob
>> + * @nodeoffset: offset of the node whose property to change
>> + * @name: name of the property to change
>> + * @namelen: length of the name
>> + * @len: length of the property value
>> + * @prop_data: return pointer to property data
>> + *
>> + * fdt_setprop_namelen_placeholder() allocates the named property in the given node.
>> + * If the property exists it is resized. In either case a pointer to the
>> + * property data is returned.
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
>> +int fdt_setprop_namelen_placeholder(void *fdt, int nodeoffset, const char *name,
>> +				    int namelen, int len, void **prop_data);
>>   
>>   /**
>>    * fdt_setprop_placeholder - allocate space for a property
>> @@ -1725,8 +1793,13 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
>>    *	-FDT_ERR_BADLAYOUT,
>>    *	-FDT_ERR_TRUNCATED, standard meanings
>>    */
>> -int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
>> -			    int len, void **prop_data);
>> +static inline int fdt_setprop_placeholder(void *fdt, int nodeoffset,
>> +					  const char *name, int len,
>> +					  void **prop_data)
>> +{
>> +	return fdt_setprop_namelen_placeholder(fdt, nodeoffset, name,
>> +					       strlen(name), len, prop_data);
>> +}
>>   
>>   /**
>>    * fdt_setprop_u32 - set a property to a 32-bit integer
>> diff --git a/libfdt/version.lds b/libfdt/version.lds
>> index 989cd89f1051ce59255a3b3e60493be4e5e985cc..76ba8f6758cef16efbad2813464e824de594b646 100644
>> --- a/libfdt/version.lds
>> +++ b/libfdt/version.lds
>> @@ -43,6 +43,7 @@ LIBFDT_1.2 {
>>   		fdt_add_mem_rsv;
>>   		fdt_del_mem_rsv;
>>   		fdt_set_name;
>> +		fdt_setprop_namelen;
>>   		fdt_setprop;
>>   		fdt_delprop;
>>   		fdt_add_subnode_namelen;
>> @@ -71,6 +72,7 @@ LIBFDT_1.2 {
>>   		fdt_find_max_phandle;
>>   		fdt_generate_phandle;
>>   		fdt_check_full;
>> +		fdt_setprop_namelen_placeholder;
>>   		fdt_setprop_placeholder;
>>   		fdt_property_placeholder;
>>   		fdt_header_size_;
>>
> 

Ayush Singh

