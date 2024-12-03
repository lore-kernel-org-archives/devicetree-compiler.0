Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16B13F8F7
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 08:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215495; cv=none; b=AmAHMILqdxnwGWt1gXURMRW6gIRV8fwAiBmLDVRJj5NJSX5Nb4bxqsJmF1Krl+bbKonccrwcKVlEUrVLzb37qo0BamSYFA/xARcu8IsM1MDU0TI/LIXNtDed+G6liAyN8GKghiMULMp7bCzS8M++0IMSy69s7elRMRA3ZcXep14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215495; c=relaxed/simple;
	bh=nhLk886HRTvnGHYGtTYABzONbSCIP5NEhyf91oQjL2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R//RXz4EUPhNhKuDrlN8Xbs6hbsmxG5t6JsZk2IwgsmVGLECJg1saV/aye1BOd4qN5VXTLBBC4j2/2omfEgUT+Xx0rA+Js1sn8FemPloDTDThMKO0n44JGkJ0WZzwenvuYLVFAcpYAKK7qBn8EJWvPWVpiLm3IPGOvrBe3sp5Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=At0Eg8O1; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="At0Eg8O1"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso3529360a12.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 03 Dec 2024 00:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733215493; x=1733820293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndvEnjQAudJQV0fVg6Vc7JAj/6Nd9OKRCIIP97sI9y8=;
        b=At0Eg8O1Pv2MVPs+fCfh+J2NVZbf+AXuClIaeu3iq0UC6/AoIZpocb8mx6EOZN+p0B
         aqrWayq7sUlcAq+/YBbQGlDPD8RFhzUULTj8ekwMeAMRgk0frks5FwDpwdVR7RbJa2Wc
         kmt0MGzluWoMtLYsgXWn3SDLI0IkV5rjIzLJXfw3ZJixWyFp2zqLDD9WevZWwRYDLPL/
         ylEjNII06ZTmxmMWvXcozwYdjwhGEzcAvdJIuxgrIa7OLPSB0DabpWEBBIP5qJvQOVWi
         3/eIResumiWxvcfKIqEqdsmi2jnQIg8jGcE9iLhxkqC5ijO+lE0amPWZoLzJxh7XcQoU
         mYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733215493; x=1733820293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndvEnjQAudJQV0fVg6Vc7JAj/6Nd9OKRCIIP97sI9y8=;
        b=sQrkakvQZzeRC9e+FXKcBMH/hTaTKirMovXaijKFnBeR0j49oktR1fNkIH4FNxaxhB
         NdNkG8ilMA6fNN+PN0rK7aYpfEWM4gxhZwx5Z/sfR292Uc9Gl9DdIfMYcMPuwmNmhdiG
         xk/P1rN9WioZJ4VA/8QKPS1GQCjYir7CI8k4k+bRijnTiq9MzfwcGXVYysIOStdctzT3
         D7h3QF2FbC3kXv0zPQND6y1vJ2ReuFe8D5Jk6iJcVCWSDdxC7j9iVRYb5/vlAqTDX0oW
         dN1W3jtdc2+pzy1KtnHr+GHZRUykT6t5/88fKKAuZHk0x4V/7cbwCAqzyGno4glcRD6R
         Bx3g==
X-Forwarded-Encrypted: i=1; AJvYcCVy9hugu8KFHTRGM/vKqCjr1mQH2sMNFVUvwc06cVw2xZ5q2aH0m2cg7JHUEtxm2rHgY0QycU79eCqM5nWxC+uQZw8S@vger.kernel.org
X-Gm-Message-State: AOJu0YyGYbLsYeoEZD0LmKew3g6aJKgjdj7vttRIigHbvdEBtz0IIKaF
	UBlMEmYpDlcOzqpZzsQLl/FMrf+hZvjYQnv6X/Vabgvfe0ph5Ogoni2Yc14UXA==
X-Gm-Gg: ASbGncu3Kgz89LHaPhOiRTSpOlVqSnhMMO+oDAzKs/LY6LhubROvwIH7LztJu4moUoA
	2N0YrtY8YTVcvKJSNjHPiXqOmbViQpBJhXr5spfHdaT8SizgN/j/ZDEwiqHCR203t0aI0cUadOJ
	7P+ri/YaaI2KMQ2+f+Fsi8m5WBCdDSBywnyz3U1ZhCPDcOJ19bInidnGkCc7VxHsjqs6aKsDpVn
	tERkReqPiJT+667t/VfcXxVeRs26om7ldMt1r7GUrT/vKKHq7V5eGNFNQ==
X-Google-Smtp-Source: AGHT+IEcStt3Eb034e4po1wG3ywbpIox6YC9Qt4HToUYGbl7DzrY3yCiDku+Y4fJIBo5of0oTYrFuQ==
X-Received: by 2002:a17:90b:3647:b0:2ee:7c22:6e7c with SMTP id 98e67ed59e1d1-2ee7c227f45mr20570722a91.13.1733215493236;
        Tue, 03 Dec 2024 00:44:53 -0800 (PST)
Received: from [172.16.117.191] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee0fb12ea7sm12623254a91.49.2024.12.03.00.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 00:44:52 -0800 (PST)
Message-ID: <913f7185-78f5-4ce8-b518-8272888321c9@beagleboard.org>
Date: Tue, 3 Dec 2024 14:14:46 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dtc: Allow path fixups in overlays
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, d-gole@ti.com,
 lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Robert Nelson <robertcnelson@gmail.com>,
 devicetree-compiler@vger.kernel.org
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-1-ac3e121359e9@beagleboard.org>
 <Z06GPpmkDEPU1XUP@zatzit>
 <b34fa351-ba29-4e40-8ffa-69d40cdbb3c4@beagleboard.org>
 <CAMuHMdXDC+VPD1i=hONCJbzCXtLLoJiy7E09TdvKse18F6wnhQ@mail.gmail.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <CAMuHMdXDC+VPD1i=hONCJbzCXtLLoJiy7E09TdvKse18F6wnhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/12/24 13:44, Geert Uytterhoeven wrote:
> Hi Ayush,
> 
> On Tue, Dec 3, 2024 at 8:29 AM Ayush Singh <ayush@beagleboard.org> wrote:
>> On 03/12/24 09:47, David Gibson wrote:
>>> On Sat, Nov 16, 2024 at 08:30:19PM +0530, Ayush Singh wrote:
>>>> --- a/livetree.c
>>>> +++ b/livetree.c
>>>> @@ -908,6 +908,13 @@ static bool any_fixup_tree(struct dt_info *dti, struct node *node)
>>>>                       if (!get_node_by_ref(dti->dt, m->ref))
>>>>                               return true;
>>>>               }
>>>> +            m = prop->val.markers;
>>>> +            for_each_marker_of_type(m, REF_PATH)
>>>> +            {
>>>
>>> Opening brace goes on the same line as the for_each()
>>>
>>>> +                    if (m->ref) {
>>>
>>>
>>> As for phandle references, you don't need to emit a fixup if the
>>> reference can be resolved within the current tree, so you want a
>>> get_node_by_ref() before returning true.
>>>
>>>> +                            return true;
>>>> +                    }
>>>
>>> No braces around single statements in dtc style.
>>
>> Is there any clang-format config or something for dtc? I am currently
>> using the format config from Linux kernel.
> 
> The above are the same rules as the Linux kernel style rules?
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

My bad, I should have put the response on some other line. I was just 
asking if it would be fine to use configs from linux kernel from my next 
patch series since dtc does not seem to have one in it's tree.

I was not using any format and checkpatch config right now.

Ayush Singh

