Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8D0165EEB
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Aug 2024 08:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725004896; cv=none; b=NMR1uY8dJJ5Wa4kTQOAHLz4b1ZRlw6m5JNSPOBXlfmUV8yzQVZ7zxrfIMd9MwCTzKMJKx9MXdVXmchyHlLQbo6/+7DYb77s4HXgFBueEqAo1CH/9DfXcR10wWbLGEDfYnXJmHGM/TJ7gOr2qaNTXjzar4QlsHep4aGoLQlaanh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725004896; c=relaxed/simple;
	bh=gyX1EJWtgIEGdx9d3qS8VqBltME3Tenc3hV/u7Ismi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2pFFAm7Yvp2Cuh+6z1DVDVqQ2uculKyAWTmxyqmtjuFoxqIGU5ZDIy6EnssSO906jDuDN/bkHNSN5tPI9xDwjNRbPF4I4Lgws1T0XfLaNYDYeNDrpgxvKIw5TWM5DBR6gfmZq00u4RajNYKC84pR9QENIiOmhtJPtm0X4QPCEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=EM8EHFrN; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="EM8EHFrN"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2050b059357so12624825ad.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 30 Aug 2024 01:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1725004894; x=1725609694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnrJzMTRsFhKGgwhPa8DsNNss6eVkWQqCb2FY7LW6H4=;
        b=EM8EHFrNYGZh6RGohYLE+uxmCnpMCnVL82DSe+DDB6AvbMuwJz8yccrNcycbVGLW4P
         urgl3ImhPe11HFI44bz0FYu1NFNpK4dvxUDX6tr2DyfXKSZ2rKSkDjUJMnIpAPRdMrsy
         JooHLcFWZtWJoFYlyCobSGRRtM4EzLSzKuL6nuD57L+qoCOX56nPSxcvcsWQmyKo+jNL
         aHRuH9oEsYOTq6OXfCYVhBXZqwV142Y85EMRMze2aRzbYRwL8lN8pZz0TY6ws9kAH0N1
         xCtgE08y+XT6S9vsJgTtpAWfxQuzTonQhQzq+IkiXFKHJFWTPTGv61CttdDcqcVe6WHG
         Evhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725004894; x=1725609694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnrJzMTRsFhKGgwhPa8DsNNss6eVkWQqCb2FY7LW6H4=;
        b=HxuuMvRXiaDK0KTUNyTLziaw/O7/4lxBWOvJ+zqC3oIKj1TBBhc+Ak/u5fJWONyucp
         Xsopz3pOL2mNj3T4u4xyYu4zr5RDKxJJSxy3+iauKuc9Ei+C9HmPCPHA1JW6BN6561PQ
         iE3pzqktprcfDVr3deOS08orqGtZ4Jo/LJc77K1WkNruP9HYc872/w0DA1p23v2y0vXd
         ixVd0IJKYh88wSKu8TyOLSCbK9zb7/sOyLs28Knq81OOs7w7jJN30IpgYrc3z/z4dZ1L
         JPk31ZIdf/0mUwaKBVYn+QfJAfuCUBFuqsBiGvjDYwRObN8Dj+sSQetJSbyMkKU2dfN0
         Sziw==
X-Forwarded-Encrypted: i=1; AJvYcCWGuZpeXKj9ZfPOPBQatIej9C8G2C/6TdH6/TGON5OxCy5ZGjMZG1c/lydOETOYuQUnRFFiaJbjOqXy2nh7fXMHX53H@vger.kernel.org
X-Gm-Message-State: AOJu0YyJodohqmDKlibdU+EVxugWQu1q7IxMqofaY6qe0VPGpxwDqJdy
	NSJYesVr2bF5skyfiUCBO/KlKQ8uOQ/QhEbL8zNIj0f/RNg+a5d9/RNE1IHjNg==
X-Google-Smtp-Source: AGHT+IHeBeJxl4/JOFPzhLe687q0JRmntu1Lm6Eb4GkAyHQ4tNhZiklFJCRKWYG7wfFUSVeeF4JEWg==
X-Received: by 2002:a17:902:cec5:b0:202:47d3:c48b with SMTP id d9443c01a7336-2050c3b7b46mr61661205ad.15.1725004894269;
        Fri, 30 Aug 2024 01:01:34 -0700 (PDT)
Received: from [172.22.57.151] ([117.250.76.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20532ff07e3sm4138035ad.128.2024.08.30.01.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:01:33 -0700 (PDT)
Message-ID: <07859c9d-36f7-446f-8ee1-f494b863f5b7@beagleboard.org>
Date: Fri, 30 Aug 2024 13:31:27 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tests: Add test for append-property
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
References: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
 <20240830-append-v2-2-ec1e03f110ad@beagleboard.org>
 <CAFLszTiTR4-WLoVP7NDAWtVHYsFeVNaT84k3MLUDMYYpF7CvSQ@mail.gmail.com>
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <CAFLszTiTR4-WLoVP7NDAWtVHYsFeVNaT84k3MLUDMYYpF7CvSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/24 06:36, Simon Glass wrote:

> Hi Ayush,
>
> On Thu, 29 Aug 2024 at 14:04, Ayush Singh <ayush@beagleboard.org> wrote:
>> - Test /append-property/ on a string and int array.
>> - Also test on subnode property.
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>>   tests/append_prop.dts | 21 +++++++++++++++++++++
>>   tests/run_tests.sh    |  7 +++++++
>>   2 files changed, 28 insertions(+)
>>
>> diff --git a/tests/append_prop.dts b/tests/append_prop.dts
>> new file mode 100644
>> index 0000000..248d4ed
>> --- /dev/null
>> +++ b/tests/append_prop.dts
>> @@ -0,0 +1,21 @@
>> +/dts-v1/;
>> +
>> +/ {
>> +       str-prop = "0";
>> +       num-prop = <2>;
>> +
>> +       subnode{
>> +               str-prop = "0";
>> +               num-prop = <2>;
>> +       };
>> +};
>> +
>> +/ {
>> +       /append-property/ str-prop = "1";
>> +       /append-property/ num-prop = <1>;
>> +
>> +       subnode{
>> +               /append-property/ str-prop = "1";
>> +               /append-property/ num-prop = <1>;
>> +       };
>> +};
>> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
>> index 937b128..571980a 100755
>> --- a/tests/run_tests.sh
>> +++ b/tests/run_tests.sh
>> @@ -708,6 +708,13 @@ dtc_tests () {
>>       run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb "$SRCDIR/test_tree1_delete.dts"
>>       tree1_tests dtc_tree1_delete.test.dtb
>>
>> +    # Check prop append functionality
>> +    run_dtc_test -I dts -O dtb -o append_prop.test.dtb "$SRCDIR/append_prop.dts"
>> +    run_fdtget_test "0 1" append_prop.test.dtb "/" "str-prop"
>> +    run_fdtget_test "2 1" append_prop.test.dtb "/" "num-prop"
>> +    run_fdtget_test "0 1" append_prop.test.dtb "/subnode" "str-prop"
>> +    run_fdtget_test "2 1" append_prop.test.dtb "/subnode" "num-prop"
>> +
>>       # Check omit-if-no-ref functionality
>>       run_dtc_test -I dts -O dtb -o omit-no-ref.test.dtb "$SRCDIR/omit-no-ref.dts"
>>       run_test check_path omit-no-ref.test.dtb not-exists "/node1"
> I wonder what happens when you try to append but there is no existing
> property? Or when you append something empty?
>
> Regards,
> Simon


Currently, it will just create a new property. I have mentioned this as 
an Open Item in the cover letter. We can make it fail if that makes more 
sense.


Ayush Singh

