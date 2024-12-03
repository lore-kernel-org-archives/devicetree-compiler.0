Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3046018870F
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 07:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733210977; cv=none; b=lL3YMEkag2ozcFdfgw282XRvjK61b4L4cHuywxQFSab3noiVbcDQdLVcJR0HXnWwQnehms6IBejmIrqOMzedLFGzV4C6NiIQstIFtGk1uvmCSAN3mhJPO0U7ikE91icQSQ56LwIecAaZ3Nu2gGDLMlgRLmV8JnD1Y9kbnkaWQ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733210977; c=relaxed/simple;
	bh=gJRUzl/36DzHXJbdpJ+xcJ7r2IDIgRwV6pOxEMgzCZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNjjj+njuSWZxtoxkMq5cnm1Vqno0YnKAiO1xxaT7mDP/lAJjhDNacQ3Ek2a/JR/nlufE3JKV5KSP3UoizPbjsOTPsDTrt6VSdQjNupTPXmYOlzvweWlhc1R2PM9cc8o//ZGbYMVJfxKEpR4cOimfWOE/PvxzeL1Tx+XtZkuMeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=z8goutoE; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="z8goutoE"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7f71f2b1370so3278868a12.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 02 Dec 2024 23:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733210975; x=1733815775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgU6dt1p0Se7ys30E9N7LqlUqHCiTbK5oy4jeJ3JBpg=;
        b=z8goutoEoyhZhlyLkniwMBSXMT/SfOkR8Xkkj/2rLqzwAgqghI9D1VwwjGbV3ncos7
         83xTN3JRmwbwGZS4h2T0hZOTBCRGSx2OvmOQKBf7rEkOAKqu1ag/i6Sx0h6q9iWkchpw
         1C4NYeSYPUpAx6jJcYyXA6kP8VGDBYi6HcwIChqv+e0VRFDn7F0P3/AP8p6fBxVawtY0
         gupYSTwG362RiRp4ysXA/nuHlQBNqv0xlF6hukvb/28O64dnaEfNIR9AO4mGARuuByYw
         Y6wWEU+xdTVjolK8cgKYzQE45TFnhlRSqwDVaU/RMDEQK1cWuDalaEwkBtynkIWVskm8
         yQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733210975; x=1733815775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgU6dt1p0Se7ys30E9N7LqlUqHCiTbK5oy4jeJ3JBpg=;
        b=XcvsompnnPIo4hX72yfdkJpEl+Rp07SvV/YA9mcv64FPeXtXUZcdqkcwq3hyh5r+8M
         FGv9ceKbIdiqHFDrIB7pPPBGH3qi7WRbqVc8+frT2nKWfjmImSVsGw2iLWmduZDV7nNU
         ALbn+ReEhwr3PMfEpEIiia2Bn1PnoGfP2sKeesdNjIFXbegkF4J+hr0am1IgvpapWO0E
         Xd7gc1IZxMw8jJo/ZrK0CLC6not6ip5NXOdD8lhqL4ZmbAnndI63bKo6I6h1l7zKlzGw
         fysQgLTaIRmyuNUFbSh3M+o6reH8nL6ZgjvNXrl1Z5clm7XcTiEWpcdiXc4b10JCXmhX
         h8Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXKJKhuZCLt7yVlqIqnMVpyGTwPOPoT8TJFVKn+4kmZpDccwm36RaNFlPvMx+sgM+W+F0REQOPTOtfmuIklzbZRBRYg@vger.kernel.org
X-Gm-Message-State: AOJu0YyIktJtKBWpBnquXG8QvY4rgdPCIGEWItBwKJ37dx5pV2yw5TYp
	kS0tK1tBGtl15c7dhvSp5LhaJIFJ3avXmwgp4hoDMqNj6loDphEP46f9A5Y9TA==
X-Gm-Gg: ASbGnctnMGthj1QE2AwsSoHKPEzg6WKZsortU6etzWlXnpljlVOFcTceFOcNaOZOQSv
	GAYp9lQxpllW2pspOTjeg/vvwJquPNmYBKXyIVoKjNKi3j7x/suPkaahOjJxpDkzrSIDmARmDOs
	q/PTLNVbBtCpje62ldZkn4TjMyEub2qiTPt5lijuiuVDqOb670ZNjSzqICQmj5lRvtIiW572+PT
	dVUuV/FnwgX5eTLic97t67n/A5pK31PK+JvaK6A4Eq/qYGETcFBACTnbA==
X-Google-Smtp-Source: AGHT+IE4AIkY+N2IqKa+dtR/qxpgNJsKsoCe4Q4hKtIuXzo7awYhOY8krG4qTUZjVRHQHY5UC+o5mQ==
X-Received: by 2002:a17:90b:314b:b0:2ee:f653:9f8e with SMTP id 98e67ed59e1d1-2ef01279693mr2666950a91.35.1733210975380;
        Mon, 02 Dec 2024 23:29:35 -0800 (PST)
Received: from [172.16.117.191] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee46f19e4csm8212191a91.16.2024.12.02.23.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 23:29:34 -0800 (PST)
Message-ID: <b34fa351-ba29-4e40-8ffa-69d40cdbb3c4@beagleboard.org>
Date: Tue, 3 Dec 2024 12:59:28 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dtc: Allow path fixups in overlays
To: David Gibson <david@gibson.dropbear.id.au>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-1-ac3e121359e9@beagleboard.org>
 <Z06GPpmkDEPU1XUP@zatzit>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <Z06GPpmkDEPU1XUP@zatzit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/24 09:47, David Gibson wrote:
> On Sat, Nov 16, 2024 at 08:30:19PM +0530, Ayush Singh wrote:
>> Enable generating fixups entries for path references. These are the same
>> as the entries for phandles.
>>
>> Path properties have empty value in generated overlay. This allows easy
>> differentiation between path references (size > 0) and path references
>> (size == 0).
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>>   checks.c   |  6 ++++--
>>   livetree.c | 19 +++++++++++++++++--
>>   2 files changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/checks.c b/checks.c
>> index 6e06aeab5503f78c8a969f8d1d0e96be7b91749e..1ec59c6a1be375e1695b68203a0782cf23ee33fa 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -651,8 +651,10 @@ static void fixup_path_references(struct check *c, struct dt_info *dti,
>>   
>>   			refnode = get_node_by_ref(dt, m->ref);
>>   			if (!refnode) {
>> -				FAIL(c, dti, node, "Reference to non-existent node or label \"%s\"\n",
>> -				     m->ref);
>> +				if (!(dti->dtsflags & DTSF_PLUGIN))
>> +					FAIL(c, dti, node,
>> +					     "Reference to non-existent node or label \"%s\"\n",
>> +					     m->ref);
>>   				continue;
>>   			}
>>   
>> diff --git a/livetree.c b/livetree.c
>> index 49f723002f855764452b30b5a979b6096730a33b..4e26d378e09407d6a395c2f1bbd73c1874de4ae0 100644
>> --- a/livetree.c
>> +++ b/livetree.c
>> @@ -908,6 +908,13 @@ static bool any_fixup_tree(struct dt_info *dti, struct node *node)
>>   			if (!get_node_by_ref(dti->dt, m->ref))
>>   				return true;
>>   		}
>> +		m = prop->val.markers;
>> +		for_each_marker_of_type(m, REF_PATH)
>> +		{
> 
> Opening brace goes on the same line as the for_each()
> 
>> +			if (m->ref) {
> 
> 
> As for phandle references, you don't need to emit a fixup if the
> reference can be resolved within the current tree, so you want a
> get_node_by_ref() before returning true.
> 
>> +				return true;
>> +			}
> 
> No braces around single statements in dtc style.

Is there any clang-format config or something for dtc? I am currently 
using the format config from Linux kernel.

> 
>> +		}
>>   	}
>>   
>>   	for_each_child(node, c) {
>> @@ -924,8 +931,8 @@ static void add_fixup_entry(struct dt_info *dti, struct node *fn,
>>   {
>>   	char *entry;
>>   
>> -	/* m->ref can only be a REF_PHANDLE, but check anyway */
>> -	assert(m->type == REF_PHANDLE);
>> +	/* m->ref can only be a REF_PHANDLE or REF_PATH, but check anyway */
>> +	assert(m->type == REF_PHANDLE || m->type == REF_PATH);
>>   
>>   	/* The format only permits fixups for references to label, not
>>   	 * references to path */
>> @@ -961,6 +968,14 @@ static void generate_fixups_tree_internal(struct dt_info *dti,
>>   			if (!refnode)
>>   				add_fixup_entry(dti, fn, node, prop, m);
>>   		}
>> +
>> +		m = prop->val.markers;
>> +		for_each_marker_of_type(m, REF_PATH)
>> +		{
>> +			refnode = get_node_by_ref(dt, m->ref);
>> +			if (!refnode)
>> +				add_fixup_entry(dti, fn, node, prop, m);
>> +		}
> 
> I don't see how phandle fixups are distinguished from path fixups.
> 
>>   	}
>>   
>>   	for_each_child(node, c)
>>
> 

Ayush Singh

