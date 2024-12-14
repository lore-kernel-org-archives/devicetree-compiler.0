Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295F18622
	for <devicetree-compiler@vger.kernel.org>; Sat, 14 Dec 2024 04:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734151564; cv=none; b=Qh0Z9oa3+vAY4kwsu7OshDdArpO58H9SfUpwDYLAAKPjOmf0WaLqVN9OwIJJx88fnyNFvnB3gdMXViHgtrMfz3pfitnMfUrh+z+NtKWN8An/uVAbj5B/ghdfoVUnRUKBox6zLReYaOLtTQ6ikBjrPdU46RdClTg/gNRYL56xIVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734151564; c=relaxed/simple;
	bh=khXuaRNB2g4b7FhD5T5n64Qar8Ib/+4WbUDLqBL547A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOSOfJdJ5y2NQxCp642mSZevFdrSG9ZnjH2pZqpeV9z6djmYu7Hmy+9TtaR46P5CE2QitlbLWh/OnyhVG9DCqmGwhyKZm54YdlouopB+YQrZUNyjD5PXXd7uguXtjCUkUsr3FHLy7Jvt8tv0ob+em9Cw4RVpG19OCuTp2K4pZEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=cwXgT14Z; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="cwXgT14Z"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-728e729562fso2000491b3a.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 13 Dec 2024 20:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1734151562; x=1734756362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3krxWYJZaXvHr12VX3u3Szdoxpkfzhdsk+2CXGNyZg=;
        b=cwXgT14ZsEuqeSUgB/NpJsq/w2sm9SSGXUD7btAlyX2diPGOfxrYQIpGBDGSyXoiLd
         2hfehnGiALZ/wtsXrINi3uRoLZa0lrevIGDFqjRrsBlul13ZF+SRs1usLYkjFP6hi4Dw
         EtmNtpjbU7fZtZRW3YARdL5i4/iBEJbzT6ei4SfPDGwqfCCQUHjDIQmtrzuKtMYjOcTp
         Chaxh5lVg9sGUy66O67Uq53wiyR2QduYfyNv+/P28gYjQR7kiP+estR6AnuJNzL442J2
         DrYp34UYPSj4shD5WNOh9T0lksxF3D+UFh/B0x1asOubR09XFDOpVaCWvRV53jYV+Ur4
         yNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734151562; x=1734756362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3krxWYJZaXvHr12VX3u3Szdoxpkfzhdsk+2CXGNyZg=;
        b=v6pd5t6/7MiqoUeKj2K8Qpz/qtJqYwyiYnGi1tcLNPErEBlvfWz8A9X+/72sAm8C5y
         ve0uGql2NPFuEqejm1bA5sS595v4ssMLPScUGICxearfaKEmE/w4GO5CuEC8IgR/pWOo
         DAjjSmdmfs3FXnAVVQZRXkgrJYExiIuZUjQzXUMzDVEFAR0fLP1usT9Yn++ejAfiWiur
         2NQFkxp8tXlKEkEgmfFTwud8LNI+lndl+IWraz7muzPjCsfpVqtEdlDx/znNH4K1bR0q
         zM5cJieJdqp/05rveynpQLfLjbXoPQUmdAB2Hkl/nQMBirSEjz3Xr1SA8kon09hh3GOO
         mUyg==
X-Forwarded-Encrypted: i=1; AJvYcCXnDHKHlFZddXipkZs+Bt2E89Y+uWrSCFIhWB/ohMyJjvq7xOOA203aetmT0b/T7XH69vAPW1sp59u8ZlbBm95/Be18@vger.kernel.org
X-Gm-Message-State: AOJu0YzA4ANpJHEeO/+huf+r7DqjAdzoLh9b8hFmZXOZYLyrVaXX97vK
	7P52ulmuUNeGmTvTIWJQopPjHzSjwN3AU/eBn/Ae7T0EVCWi+kInZoOQDfSGwQ==
X-Gm-Gg: ASbGncsZLzoVxUZOAWayPF/eJV1AlgKuR3bqPf7Xu5Bl6F2znB6DTitGpW3s1/l+gqo
	mv0k5h1rIZNdp3vEDJexPI8rd5kdelTvFn4v5PvhQCnMAiygUFQvITzHZ+lxbUIBWZPgEgBkwYI
	59GzgV5UgjvoUhgApjiPlt0bKSKHq4D03zlBWcs2P9hvFfOgmGE6u94WYARQmBCwFlPaRqZiAdo
	CfclqwhVRKOUcmhjfh/otP7FOZRRceofcaml4kSnTD4weEnww3iINLa2bW0X5ohXOAb5QEttFtv
	fW1Whlu06yOyStgi1RbYw1Vf4qD4p8tAmg==
X-Google-Smtp-Source: AGHT+IE4NPm91205PXVRY4lxyiw/1znKFiwMT8nXnniKwo4VC5gfBN8mq5HJ30sRmVxLQ2LnFsDD6A==
X-Received: by 2002:a05:6a21:7898:b0:1e0:c954:ea7c with SMTP id adf61e73a8af0-1e1dfd9dd54mr7376958637.27.1734151561897;
        Fri, 13 Dec 2024 20:46:01 -0800 (PST)
Received: from ?IPV6:2401:4900:7ccf:c07b:f26e:1b64:32c7:e21d? ([2401:4900:7ccf:c07b:f26e:1b64:32c7:e21d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad7845sm650195b3a.68.2024.12.13.20.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 20:46:01 -0800 (PST)
Message-ID: <3cfec8db-9d41-4f34-9765-686320bfa8b9@beagleboard.org>
Date: Sat, 14 Dec 2024 10:15:49 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] tests: Add path tests for overlay
To: David Gibson <david@gibson.dropbear.id.au>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-5-ac3e121359e9@beagleboard.org>
 <Z06NHgkgh9-d310t@zatzit>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <Z06NHgkgh9-d310t@zatzit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/24 10:16, David Gibson wrote:
> On Sat, Nov 16, 2024 at 08:30:23PM +0530, Ayush Singh wrote:
>> Add tests to verify path reference support in overlays
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>>   tests/overlay_overlay.dts               | 11 +++++++++++
>>   tests/overlay_overlay_manual_fixups.dts | 26 +++++++++++++++++++++++++-
>>   tests/overlay_overlay_nosugar.dts       | 19 +++++++++++++++++++
>>   3 files changed, 55 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/overlay_overlay.dts b/tests/overlay_overlay.dts
>> index c4ef1d47f1f159c5284c8f7282a0232d944ecfd1..18382762eb3d7c26b0f2e507acc3803f38194fb1 100644
>> --- a/tests/overlay_overlay.dts
>> +++ b/tests/overlay_overlay.dts
>> @@ -50,3 +50,14 @@
>>   		new-sub-test-property;
>>   	};
>>   };
>> +
>> +&test {
>> +	test-patha = &test;
>> +	test-pathb = &test;
>> +};
>> +
>> +&test {
>> +	sub-path-test-node {
>> +		test-path = &test;
>> +	};
>> +};
> 
> You should test path references combined with other pieces too:
> 
> 	test-pathc = "a string", &test, "another string";
> 
> In fact it would even be a good idea to test path references combined
> with phandle references.
> 	test-pathd = "a string", <0x1 0x2 &test>, &test;

I have hit a bit of roadblock with the following case:

	test-pathe = "a string", &test1, &test2;

Resolving &test1 will make the poffset for &test2 invalid. So do I need 
to worry about multiple path references in the same property? I do have 
a few ways to deal with this, but maybe I am missing something:

1. Introduce something like `__fixups_path__` where we can use a 
different way to store information regarding path references. I am not 
too keen on going this way though. If we really need to introduce a new 
fixup node, might as well go all the way and have the node work for 
phandles as well.

2. Change the resolution algorithm to maybe create an intermediate tree 
first from `__fixups__` and resolve each property in reverse order in 
the tree. It seems great, until the fact that we cannot use heap comes 
into play. Playing with offsets all over the place has not been great in 
v2 (lots of bugs), and this will just make it harder.

Again, maybe there is a data structure more suited for our case, or 
maybe there is something I missed since I am new to this codebase, so 
thought it would be better to discuss it here.

> 
>> diff --git a/tests/overlay_overlay_manual_fixups.dts b/tests/overlay_overlay_manual_fixups.dts
>> index a5715b6048acaeebcdab56060040a339d08686a3..c40297aaefaaa6d168e42f864639a05bbbe69f57 100644
>> --- a/tests/overlay_overlay_manual_fixups.dts
>> +++ b/tests/overlay_overlay_manual_fixups.dts
>> @@ -86,6 +86,25 @@
>>   		};
>>   	};
>>   
>> +  fragment@8 {
>> +		target = <0xffffffff /*&test*/>;
>> +
>> +		__overlay__ {
>> +			test-patha;
>> +			test-pathb;
>> +		};
>> +	};
>> +
>> +	fragment@9 {
>> +		target = <0xffffffff /*&test*/>;
>> +
>> +		__overlay__ {
>> +			sub-path-test-node {
>> +				test-path;
>> +			};
>> +		};
>> +	};
>> +
>>   	__fixups__ {
>>   		test = "/fragment@0:target:0",
>>   		       "/fragment@1:target:0",
>> @@ -95,7 +114,12 @@
>>   		       "/fragment@5:target:0",
>>   		       "/fragment@5/__overlay__:test-phandle:0",
>>   		       "/fragment@6:target:0",
>> -		       "/fragment@7:target:0";
>> +		       "/fragment@7:target:0",
>> +		       "/fragment@8:target:0",
>> +		       "/fragment@8/__overlay__:test-patha:0",
>> +		       "/fragment@8/__overlay__:test-pathb:0",
>> +		       "/fragment@9:target:0",
>> +		       "/fragment@9/__overlay__/sub-path-test-node:test-path:0";
>>   	};
>>   	__local_fixups__ {
>>   		fragment@5 {
>> diff --git a/tests/overlay_overlay_nosugar.dts b/tests/overlay_overlay_nosugar.dts
>> index b5947e96fb00dcf2c321c9f43e708863053b14b3..7e54ae5f5e7641bdf08626200e9471067b0f7677 100644
>> --- a/tests/overlay_overlay_nosugar.dts
>> +++ b/tests/overlay_overlay_nosugar.dts
>> @@ -83,4 +83,23 @@
>>   			};
>>   		};
>>   	};
>> +
>> +	fragment@8 {
>> +		target = <&test>;
>> +
>> +		__overlay__ {
>> +			test-patha = &test;
>> +			test-pathb = &test;
>> +		};
>> +	};
>> +
>> +	fragment@9 {
>> +		target = <&test>;
>> +
>> +		__overlay__ {
>> +			sub-path-test-node {
>> +				test-path = &test;
>> +			};
>> +		};
>> +	};
>>   };
>>
> 

Ayush Singh
