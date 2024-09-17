Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E17E17BA4
	for <devicetree-compiler@vger.kernel.org>; Tue, 17 Sep 2024 17:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726593807; cv=none; b=sIf/Asm+Wnnu/GspligsJ4YpnwjZMCaxQqCXN0GW6AujCepmiAoA49VvS5BkTY61kH6QtUfGlFPVNJqnim5XOfnnOPFe5HdCMwWbuPiF6+gF/WUCuNsr1Ndh7Oe8idE057nGTXKzwxFnza4YQNN5DOkioHZk860ihFElYCp295Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726593807; c=relaxed/simple;
	bh=Fdq+eSwEkxURwfIEqI1NKim0qClCUGDA50BYuBjFx1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AeNCU//b9kCk0tIBg6a8HxJ2FmGNyqcScTtpgMT50OBBfE1PeFw4a9Brw4QgfgxTOZZoN+op2Bb2z9ypRTXPj+zbGdCQpgbt7h5BDhao1D6e50zDIm1tainXshHmgb7jNIWYoJCrebw8U0QJ0xKkiazX3iY0AiCU4OyrPaJj/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=hlr0FAq6; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="hlr0FAq6"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-718f4fd89e5so5411130b3a.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 17 Sep 2024 10:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1726593805; x=1727198605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvIPt0Ozkln3qjyuTSCfFfmGzoE7r7G3/2N1ZVMFj7w=;
        b=hlr0FAq6nZ5XKIYb67VOz5PyT64LOi4Q2kqyb/cUOlXM8OrG7P93782aTtNvSp17RN
         9qQQ6z50feN3VBkkAhNu8+x92zIP6Sqph8qP4WpFf17/bedIkh/yFEzaH69GxIx/wZaH
         n98sQ9QgzrGEOazN8+w6FEPayrMwEKWr7NqzWa+jssytKyDfI+YV7b7S24YMBruWxy7H
         Gy0E19dHf2Sftsdf1X+SCs02X/FlPdVXklqE8y7K1MCUqRqy4giidiGlWOz17DFN+FaP
         w+BEzIPgcQaDx8JHSgvzotcP/HLMv3g15IEFtMwphOrFvgZHiF3gKb6qCf07Fuh7CW36
         zfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726593805; x=1727198605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MvIPt0Ozkln3qjyuTSCfFfmGzoE7r7G3/2N1ZVMFj7w=;
        b=prPEv5uLxtmwNWKf92zF0arnk4Sx7tgHynkNB/uQflS1BYtju1S5iZW87pt9CiKrJQ
         hNv3VhayAptHEDI4EsrUDB7Aj5BDoAkpOzFrXnv4Z4CShRbXViw36S8FQDtKMmNmF05Y
         xHAiEzoEXfgp5pY2K9yVfC7rnaRXu0Dby+1xYqa+OZv2cuAjBlNZvPXQTDJZ2U/fB6cO
         HI+UNrAocZncKOq6euVBgoFFyxhdnw9luqXkabv971hrfgXkvPenTOZmBdRfs/llXqUI
         e2UxPe7SQ832wI69JRX3LJR0jUW/p1D1J+nyn11MN31FAJX34ddedbJmSgzgsvCxqLSI
         TdbA==
X-Forwarded-Encrypted: i=1; AJvYcCUCTDIhC9rsaY701g+o2bWKvGbCOwQXG9gbNYXCGfqYLrauWyRV7yl5SLbma2aNciHFe2bc+LDLJft14oQZLE0G/pFW@vger.kernel.org
X-Gm-Message-State: AOJu0YzuojH8/2c6MJzXefvdBrqm7zqFwONeyR30+YobVAl050eCE5ou
	LxWaXxxW59x081TgcELwSONN+Mz0otxv2dTU1IAcciTaaNv/86FxZia7oS/b3w==
X-Google-Smtp-Source: AGHT+IHUNO2A88HhKlnwa/bWnw5J7hRA8UAuEKbqKLFoFxu9rpn7FKgV7+E6a/nmiPyLKJxLB3EbnQ==
X-Received: by 2002:a05:6a00:a1d:b0:70d:33b3:2d7f with SMTP id d2e1a72fcca58-719262070femr27991528b3a.26.1726593804736;
        Tue, 17 Sep 2024 10:23:24 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db4999f05bsm6144592a12.81.2024.09.17.10.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 10:23:23 -0700 (PDT)
Message-ID: <7dbeae7a-c4d6-4d63-b728-d40146ebdfd5@beagleboard.org>
Date: Tue, 17 Sep 2024 22:53:15 +0530
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
 <07859c9d-36f7-446f-8ee1-f494b863f5b7@beagleboard.org>
 <CAK-9PRC6O5-94FP3_8FoX7NXBXTEyNVLBUihwDjBRh3SzsGusA@mail.gmail.com>
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <CAK-9PRC6O5-94FP3_8FoX7NXBXTEyNVLBUihwDjBRh3SzsGusA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/12/24 16:36, CVS wrote:

> Hmmm... in the above examples, using --annotate on a single source file,
> it is not immediately evident whether the existing annotation logic within dtc
> handles "append-property" across multiple dts(i) files properly.
>
> As you can see, the -T (annotate) and -T -T (detailed annotate)
> options will add inline comments in the final unified device-tree with
> the actual source file:line.
> This is a critical feature in managing complex hierarchies of dtsi
> files being included in a dts.
>
> Until now (without the append-property keyword), IIUC, there can be
> ONLY one source file/line responsible for a line in the final unified
> device-tree. The latest line specifying a property overwrites all
> other specifications of a property before it.
>
> With the introduction of this append-property keyword, now more than
> one file:line can be a source of a line in the final unified
> device-tree. So, i wonder how the annotations will look like in the
> scenario in which more than one source file:line is responsible for
> the content of a single line in the final unified device-tree.
>
> If by any chance there is insufficient annotation containing of all
> the lines responsible for the final  "appended list", i worry it will
> be a nightmare to identify the source of the resulting "appended list"
> of values being assigned to a property.
>
> regards
> CVS


So I tried it with 3 files:

base.dtsi

```

/dts-v1/;

/ {
     prop = "0";

     propa = <0>;

};

```


app1.dtsi

```

/dts-v1/;

/include/ "base.dtsi"

/ {
     /append-property/ prop = "1";
};

```


app2.dts

```

/dts-v1/;

/include/ "app1.dtsi"

/ {
     /append-property/ prop = "2";
     /append-property/ propa = <2>;
};

```


Output:

❯ ../dtc -T -T -o temp.dts app2.dts
❯ cat temp.dts
/dts-v1/;

/ { /* base.dtsi:3:3-7:3, app1.dtsi:5:3-7:3, app2.dts:5:3-8:3 */
         prop = "0", "1", "2"; /* app2.dts:6:2-6:31 */
         propa = <0x00>, <0x02>; /* app2.dts:7:2-7:32 */
}; /* base.dtsi:3:3-7:3, app1.dtsi:5:3-7:3, app2.dts:5:3-8:3 */


So it seems to only contain info about the last append file. I will fix 
it in the next patch. It just needs to have info regarding all files 
that appended to it right? We already seem to be doing that for nodes so 
I can probably use similar strategy for properties.


Ayush Singh

