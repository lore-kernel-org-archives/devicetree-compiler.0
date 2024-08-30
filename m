Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6196216C689
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Aug 2024 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005249; cv=none; b=X9tbXlsoCZA6shrclGLW0dZPjA0/gTr2GvA9Sw011o/p84ex+3XcAQw7VW1wVmE/psMay10FCoYaNu+51oEKA2/qpI8ViL299SqQ2WUfZ5qjE1dtBcstDq4gaoL63LCbjmBVdYMXD48iwXHdUYdZgU72FruunwwxqbfRJcZ3bTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005249; c=relaxed/simple;
	bh=j9Pg/YVksp1CjGJlucTkGHzc/lfQsn+OAFJat2OHqe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMS8pG8IEtzUp/lWeG45qkLpYGd6rDRFeF2X5cLVX6tFbGgTseai0wraDlWn9zuyl5qS6UWBQztd1iSJIvunns/E86cY9cifaRXjRTUNT8ca8Vx9fYNSYbc/pe71z+P9M+sT/pQCg0a+N4u5H4spC5nxkbLDzXTXj1fUboFhPqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=Pm37G1nY; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="Pm37G1nY"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71423273c62so1252238b3a.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 30 Aug 2024 01:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1725005247; x=1725610047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4r9d/xGFDuOcvRVNkWIWI6j7DS93ZZP7fx6bJJRzNCw=;
        b=Pm37G1nYJimPGwqL78vOm0k8gIXCCJZeGu4oSGD1c9puHHEItoIdw3oCEgrxPCYNxv
         TeyEad1+XDmm5Vkt5NMiZYy/a6V2NSgSGj9SyeHk7zjhboSN5oVQYfBh0FTu1Jbx/aWU
         Acff8Zf+Fk67ldsib6ojmHQrqe4JuWwm4En29LdcYvv2wV8ChdVx+W92Sir8v0jHKEUV
         KSfeJqzFFcdb2C190AnztaNjsIM3U1xH3mIjRvBqtA+SfyO646Fz/fHFJ/dooQs3RVpS
         5EyDl5dZeOaIqcyGm0Lyj3D1x+YWWeSxqMBxZE6BQF6O0ObxT+HqvnbIItwXm+9xSdRD
         HOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005247; x=1725610047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4r9d/xGFDuOcvRVNkWIWI6j7DS93ZZP7fx6bJJRzNCw=;
        b=D8Xx42vbEbsTwBYmk63h1gNv535kw0k8fwIfkQfa1Zyoc104x+0DjeMOtpmLoJDDKu
         lNJhAKEdUJP+xW/hLep379aFVAc6zP+ZGLxH0jkHjLyTkVRUendvUQ4BuxU/KhcCjmsK
         vFuk0UEHkb9iMIiGvVquE/o0LkqogVHbrVwjOVTqaGid5PRCa4g6XH76PphWXS+ZdudD
         zUsT0rlU2KhUH2K+8Qc1q2zVOwx1+H4Dot6Tk+jeyaweN2zfpK9a37EtNjGr+Nfgw0y1
         v0BkQ/NF7t8Qj/F3N1sYzjqaG4eJiOmSsQkUHw9nicD9NjbC7Zw+vwEkOmJE4jaTnFvE
         iY2A==
X-Forwarded-Encrypted: i=1; AJvYcCVJo7Ko1kJMFpvI9S4ohag4zfifHKJjRpRjed0iBiZmmr5eC/+hNJYtQzAx0YcyD/hDKUgqC4mPlh3vv/LqMxT6Bi3F@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzoyr3uVGYHaLssNWd7RyF94acGcu5oYPwTkIqw4G6xuQST8ZC
	GOgSG09x52Z2R1+vjFfJvxkX64jAN7TXq1BT9CxPdKv6PP/Wix0NtWrSeoFlgA==
X-Google-Smtp-Source: AGHT+IFDT66zyFGUGbMoA0l5M1IKnoPztMctYNJ1/qqZIzBGG4msUlSvoz12jlTqlaegyd7+GgQ2Gw==
X-Received: by 2002:a05:6a00:21c4:b0:70d:2583:7227 with SMTP id d2e1a72fcca58-715dfb6917bmr6189711b3a.6.1725005247461;
        Fri, 30 Aug 2024 01:07:27 -0700 (PDT)
Received: from [172.22.57.151] ([117.250.76.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576a37sm2240875b3a.29.2024.08.30.01.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:07:27 -0700 (PDT)
Message-ID: <a9422c17-75dd-46f3-b661-668771137f50@beagleboard.org>
Date: Fri, 30 Aug 2024 13:37:16 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tests: Add test for append-property
Content-Language: en-US
To: CVS <cvs268@gmail.com>
Cc: Simon Glass <sjg@chromium.org>, d-gole@ti.com,
 lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
References: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
 <20240830-append-v2-2-ec1e03f110ad@beagleboard.org>
 <CAFLszTiTR4-WLoVP7NDAWtVHYsFeVNaT84k3MLUDMYYpF7CvSQ@mail.gmail.com>
 <CAK-9PRCWNN8x6zOw6sk+sXZSZ2Z93UOisQhg+gK17C_GqnV=vA@mail.gmail.com>
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <CAK-9PRCWNN8x6zOw6sk+sXZSZ2Z93UOisQhg+gK17C_GqnV=vA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/30/24 08:58, CVS wrote:

> Also, how does the existing -T / --annotate option behave with this
> proposed feature ?
> i.e. when a line in the device-tree is modified using /append-property
> what (all) would the annotation comment contain ?
>
> regards
> CVS


I was not aware of this option, so just tried using it and here are the 
results:


Input file:

```

/dts-v1/;

/ {
     str-prop = "0";
     num-prop = <2>;

     subnode{
         str-prop = "0";
         num-prop = <2>;
     };
};

/ {
     /append-property/ str-prop = "1";
     /append-property/ num-prop = <1>;

     subnode{
         /append-property/ str-prop = "1";
         /append-property/ num-prop = <1>;
     };
};

```

Command:

./dtc -T -o temp.dts ../tests/append_prop.dts


Results:

```

/dts-v1/;

/ { /* append_prop.dts:3, append_prop.dts:13 */
     str-prop = "0", "1"; /* append_prop.dts:14 */
     num-prop = <0x02>, <0x01>; /* append_prop.dts:15 */

     subnode { /* append_prop.dts:7, append_prop.dts:17 */
         str-prop = "0", "1"; /* append_prop.dts:18 */
         num-prop = <0x02>, <0x01>; /* append_prop.dts:19 */
     }; /* append_prop.dts:10, append_prop.dts:20 */
}; /* append_prop.dts:11, append_prop.dts:21 */

```


For more detaild information using -T -T:

```

/dts-v1/;

/ { /* ../tests/append_prop.dts:3:3-11:3, 
../tests/append_prop.dts:13:3-21:3 */
     str-prop = "0", "1"; /* ../tests/append_prop.dts:14:2-14:35 */
     num-prop = <0x02>, <0x01>; /* ../tests/append_prop.dts:15:2-15:35 */

     subnode { /* ../tests/append_prop.dts:7:9-10:4, 
../tests/append_prop.dts:17:9-20:4 */
         str-prop = "0", "1"; /* ../tests/append_prop.dts:18:3-18:36 */
         num-prop = <0x02>, <0x01>; /* 
../tests/append_prop.dts:19:3-19:36 */
     }; /* ../tests/append_prop.dts:7:9-10:4, 
../tests/append_prop.dts:17:9-20:4 */
}; /* ../tests/append_prop.dts:3:3-11:3, 
../tests/append_prop.dts:13:3-21:3 */

```


Does this look acceptable?


Ayush Singh

