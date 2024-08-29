Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A6A19005B
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724941043; cv=none; b=KObt/uW/d+jHp2h4KxNNEI/+AxSqeDWFhslALiqendzYTz5l6ffRJs85AGW7pMDM1iOjd/od1yPdqtNFBvgMYOAdVvW5BEH9+4xYZSNoX1MSP3ljhiuU01IuVn7pFa8hifakKhW4QfdgVl+B8WkGxCgqt/jMt2T5esIARE36Bx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724941043; c=relaxed/simple;
	bh=pcH/qr8C+dKZVRfeU8D7JWbnCOAgogwe9W/ogaTQwpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTZ2r8qrX2/Bsp/nTMvR419Hk8IzQ4ZKytspo8P012TVZv/lGPmrFWrPx03JkI7dlPtZBl/nLvj5PO4Xw/oCb7o0q8xM4CmqEv8myzwiBnmXU6i54bHEezqjEZkVd3dR9sSM6f/4mLIKUq3ovmFQRHQZNUUzfqjEZpHf/mnmYvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=vxIg+z4i; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="vxIg+z4i"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2050b059357so5380735ad.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1724941041; x=1725545841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PdqwARAbpeEa5bAnol0kNYa7OGRmAQ6/sOUT9llaH40=;
        b=vxIg+z4iPbk1D+UEmvP/Cbm8xxTisjhPhkddpoBJKruXxg57/2zZmp40Jqshg11YM7
         mw1RrFvUDUnv/579JG79t7LfD1f2n4tr3vWCZ4VGiagpgsz6Zvjl3xkGKncwbxzuehvT
         U7Cpu1N6GLcwagv+hc/XOgtI2sBoAGohFWtgVfX3AJpcCsOvdeSbSjoR7PQtR32LMHgP
         piYGhNiQisdyjIC5J88rSmakgHM2afo3kxD47f4vZKwVuZj9xNhr9vvrPeV1XtY0JVRE
         h034WzuUFFsr9vth3WH56VfT3hcMPAUoZlezWMT1MZshWDvcUpRs/CSdGcSSxllwZhZQ
         +6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724941041; x=1725545841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdqwARAbpeEa5bAnol0kNYa7OGRmAQ6/sOUT9llaH40=;
        b=ig7djsk+iSyReQ4XZDOvPKlTlX7FgZ1KTHZW9ocoEzmsqR4S55YfyLVMkXXIdxfB2K
         4Rg3zHQAnaAJA1xN68vnJFZL5Pnt1dUqVG+cteTRMmB2PXKQOkf2CBVmHBTFixybpFh9
         SzrE6XBEWFcs++5OGxmRaXsGdbSvJV7ktQQSORMbcC1+429rHQ/RQpN+wTM0/sAWeIIk
         MEyUoIIILkW5sZG9oLi2uivIRY27D+1ODty5YiznfLWFTMirmO0vL5PFPZBtPWxrYl1Z
         /2QeGlw5f8iDQ4LV/Fi/7eOW2kW1uYS+Mkd6C+UEBzzm74Vh1g5B73tng7MveluigZuU
         YAbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWyDi/2iPdRJ8rLXZ/qJGyVlH5mNjWSZJuHKfyl42CwgSgUo9zMtSAWZtRMeN+3zS+BBK3kiNTbl+glnwDzuhqEx7m@vger.kernel.org
X-Gm-Message-State: AOJu0YwmhK66WQFaDLYtMb5rbk+xe3zWpvVD9zr7OhH26LSXjoy92xNk
	X1UthG40EoCbXLZToi+2fXgw6ieAp78gHbNXzpm4eO25bHiRj5kIzC0Hb4KasQ==
X-Google-Smtp-Source: AGHT+IFZq7OMYiQ1a4XU7np58Jhv/OZqyw8SMijkBB7OI1jrMPYote1M8jnsFOR279LL1vZwypF39Q==
X-Received: by 2002:a17:902:dacf:b0:202:859:f85 with SMTP id d9443c01a7336-2050c3d6af6mr33722115ad.24.1724941041296;
        Thu, 29 Aug 2024 07:17:21 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152d03eesm11847935ad.109.2024.08.29.07.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 07:17:21 -0700 (PDT)
Message-ID: <b179c8a3-62fd-48de-b54c-abd6730dc05d@beagleboard.org>
Date: Thu, 29 Aug 2024 19:47:15 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests: Add test for append-property
To: Simon Glass <sjg@chromium.org>
Cc: lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
References: <20240827-append-v1-0-d7a126ef1be3@beagleboard.org>
 <20240827-append-v1-2-d7a126ef1be3@beagleboard.org>
 <CAFLszTi6vjLqVe5ZhMOz+=a4SuYHabrRBKDH5yJk2+-Y7ui0mA@mail.gmail.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <CAFLszTi6vjLqVe5ZhMOz+=a4SuYHabrRBKDH5yJk2+-Y7ui0mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 19:34, Simon Glass wrote:

> Hi Ayush,
>
> On Tue, 27 Aug 2024 at 11:55, Ayush Singh <ayush@beagleboard.org> wrote:
>> Simple test to build a device tree with /append-property/.
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>>   tests/run_tests.sh          |  3 +++
>>   tests/test_tree1_append.dts | 21 +++++++++++++++++++++
>>   2 files changed, 24 insertions(+)
>>
>> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
>> index 937b128..ac0dc05 100755
>> --- a/tests/run_tests.sh
>> +++ b/tests/run_tests.sh
>> @@ -708,6 +708,9 @@ dtc_tests () {
>>       run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb "$SRCDIR/test_tree1_delete.dts"
>>       tree1_tests dtc_tree1_delete.test.dtb
>>
>> +    # Check prop append functionality
>> +    run_dtc_test -I dts -O dtb -o dtc_tree1_append.test.dtb "$SRCDIR/test_tree1_append.dts"
>> +
> How does this check that something actually happened? From your cover
> letter, it seems that you might send a v2, but I'm just checking?

Yeah, it tries to build it and that's all. I am not sure if 
`run_dtc_test` fails if the command fails.


I can see there are helpers like `check_path` but is there any helper to 
check the value of a property? If not, I can try to write one.


Ayush Singh

