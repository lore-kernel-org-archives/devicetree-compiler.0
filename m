Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB2714600D
	for <devicetree-compiler@vger.kernel.org>; Mon, 11 Nov 2024 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318890; cv=none; b=PnZCI83s1vhjLgNmVBQqttOqdLPRRr8HbTRaweKExfFxazi7ghn6JsfrxVm07O3h2qFAkrVzIIgLDmPbIWCxr/wy+67CZjtn4eudIgEgx+oBR6CegjGR6ILt1j5iGn+YbQvuSI85cPSIucKxGqlV/q0DbF02bQBIonT4dUqO7HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318890; c=relaxed/simple;
	bh=jG36ybIu1ea/s2xmpEYFdzFCXvVQiJUEGCuh6S54ruw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KrfF8qC8xmEUMpDV9f3Xxwl2q6aSEYSzLv9+HAC4zvaAVpg9h4MK//1oVCSZ5IpOEx9q3x7GEXQ1fFin5MUTd3qe4kTm2Ug/kd0bJFTwlzUQvImzkubykDPd+QodYzxu2au7jljitnz/A+U/DIg6eRp+6R+bgUEb3frxYwLAxrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=r8AwuA6x; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="r8AwuA6x"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20c77459558so39429365ad.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 11 Nov 2024 01:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1731318888; x=1731923688; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxaG90SDrk40I/hgNMnpin8rekJx6e88nDIGekRDK/Y=;
        b=r8AwuA6x4a2z70BtF87lGy1w5veOQEV4mHBlXazt41xL/1B3WK4xbvbKZIlGoNUSQI
         gdZ1K17qe/uatBwEId9H39T/glzHXl5fXzg7/8ortkcPCOIHTktQYXBMWkAelH7ua9i2
         NUI6QXqqCjAxChXmwkWzAHVkiFX/WNohYrp40/nua9YcfJbADQbI3p+m7JXTpQPxcAXc
         twPI3KNpHx2OIxITDbbTDQT95qdKPk97C/eQU6oNehbXyFUM0OZAE48nlH69TQO/mjlx
         5tJansWUQI+XhEKWhtUg7cfciaQBsaYDYLqJBxpRJni71tesAblOGjVE0ewYPJ69+5Q2
         YQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318888; x=1731923688;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxaG90SDrk40I/hgNMnpin8rekJx6e88nDIGekRDK/Y=;
        b=AjQnWOnvymky39zSlWWjBm9CJARpelzRzrsiI139BnWM5vplfKHgtpGIm98YnTdv8G
         j2sRlWAtuIo6S+rwHpcWPbOjgSgIK/9Kxw1KOjyLCbDOPDs6XA5Bn5rNzIDFzBtiHciB
         YIFuMVc028nCueCluRCwwmnOSxGQvY/nydebSWImX7uYid0/j/eaLymiU+8+e3KR/nBy
         8A3kpXbZgzRkd3BucK9FSVCtgyraPlIjVxPSgEZsfsuEFIO4uSx2dTyRXOeeK36ocWjy
         ZAUTsHw3ueBdEYf6Cqc97wUOGqjZ8g2hSViynIkvyR6x1pQzAySJAOpqpTFBPgab73Mt
         2UGg==
X-Gm-Message-State: AOJu0Ywznqwx5Nb4CxAoHJ0g5+Dq9W+DpujzGwqWYChCQPTy6f0H7P2+
	j3LQJY35xwUULGoKmZgG4SIcF9gRqsloJTDBkIuqK2N8QQu+msVyJsWj6ajPUQ==
X-Google-Smtp-Source: AGHT+IEQFvyO9jO3z5E1V6KIT7AgjC4K51sNZ4eQY5l9F1LLEdo156BBqke1AbLRlfnexShsXnnMKw==
X-Received: by 2002:a17:902:ecc3:b0:20c:5d78:4d8f with SMTP id d9443c01a7336-211835fef66mr146031675ad.52.1731318888000;
        Mon, 11 Nov 2024 01:54:48 -0800 (PST)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc9073sm72351685ad.1.2024.11.11.01.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:54:47 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v3 0/2] Add capability to append to property
Date: Mon, 11 Nov 2024 15:24:32 +0530
Message-Id: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFjUMWcC/2WMQQqDMBBFryKzbkpmItp25T1KF4mZaKAYSUpoE
 e/e6KIUXL7Pf2+BxNFzglu1QOTskw9TAXWqoB/1NLDwtjCQpFpeqBV6nnmywjVYO1bUoLtCOc+
 RnX/vofuj8OjTK8TP3s24rYdERiGFbTVSww4Nq86wHp5sgo72HOIAWyjTn6zkT6Yic48slUOU2
 h7ldV2/oMVrqt8AAAA=
X-Change-ID: 20240827-append-f614fe3261f9
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>, Simon Glass <sjg@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2361; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=jG36ybIu1ea/s2xmpEYFdzFCXvVQiJUEGCuh6S54ruw=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnMdRhMeCa9PAcQ0P/QJdXRTwaw+awhOZNcULjJ
 UP3oojgt1GJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZzHUYQAKCRAFzvXHieVa
 dDoKEAC7+U1upmVfCqv+atY1FtDgOk7fqet8WWZF03UE7x1VyQtlYBG/Bhv4Mx8PABuZOptHi0A
 /U5+7rXW6zy/agpGEAkDvr8EWrJ0k4gaqWh1nVt6WR33bLOhBK72CUZ3SpH3imybQ9ktiw8Q1sS
 5LlEIzkKSQfINCJpdswrc0fm/aq5Gcq2ijLIQIYLQFjm5EKGTEFyo1bD33LPiGPE9kxhfMJ/x93
 38XEhvlgi1xVpapghwil3jN+UgldArDGGLUVQ07OBySH7zWynIGPCHlEga05KMnqXFyeOA7CfAC
 d2cD7tYU6iZur2qFtVTcyp9lU6kc25WCETiY5orGP46TqJ5f4ToOLCGfaRAx9UfK2omIr3DcY6g
 +eiujGETmfaaV+bRdJCAjLmNYyP0X6160C/V7oiyY1hMmtpVPGkqPKcQ7X+mVpSyxvIxZvNR8i0
 BTKLeZWdwjqlH7jN2hQXcxHG+0vS3uORLpBLRw49Btv7iUAwjfnt3HIWqV0ly1PUU4KnzxIe5JW
 Nydmqc8/edgvbdFbBtsPy2/mhTH+1pGPR91uxEuKD+njpQJR2ka1Ce3KB7SItTAdA9hRETLBTtD
 aJ5yi3MR0CQ1D258j9dbF0MSCrlFw04r5gWS+uEz+WK+/aRXv60pCPGQa8d7NUMuZOD1S0YANFn
 iHhaOSIWOBeh//w==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Allow appending values to a property instead of overriding the previous
values of property.

Currently, we have /delete-node/ and /delete-property/, but lack
/append-property/. Hence we end up having to repeat all existing values
when appending to a property (e.g. see [1] appending to clocks from
[2]).

This functionality is also important for creating a device tree based
implementation to support different types of addon-boards such as
mikroBUS, Grove [3], etc.

In practice, it looks as follows:

```
dts-v1/;

/ {
	str-prop = "0";
};

/ {
	/append-property/ str-prop = "1";
};
```

Open items
- Appending to non-existent property:

  I think it is better to create a new property if the property does not
  exist instead of giving an error.
  If the default is an error, then the condition, "create a property if
  it does not exist, else append" cannot be expressed. I think this
  behaviour is desirable with more complex overlays required for
  supporting addon boards using devicetree.

[3] https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/
[2] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts#L39
[1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L3334

Signed-off-by: Ayush Singh <ayush@beagleboard.org>

---
Changes in v3:
- Add support for annotations. Works similar to nodes (since they
  already append by default).
- Link to v2: https://lore.kernel.org/r/20240830-append-v2-0-ec1e03f110ad@beagleboard.org

Changes in v2:
- Add comment for append struct member.
- Small code improvements
- Improve test
- Link to v1: https://lore.kernel.org/r/20240827-append-v1-0-d7a126ef1be3@beagleboard.org

---
Ayush Singh (2):
      dtc: Add /append-property/
      tests: Add test for append-property

 dtc-lexer.l           |  7 +++++++
 dtc-parser.y          |  6 ++++++
 dtc.h                 |  5 +++++
 livetree.c            | 36 +++++++++++++++++++++++++++++-------
 tests/append_prop.dts | 21 +++++++++++++++++++++
 tests/run_tests.sh    |  7 +++++++
 6 files changed, 75 insertions(+), 7 deletions(-)
---
base-commit: 99031e3a4a6e479466ae795790b44727434ca27d
change-id: 20240827-append-f614fe3261f9

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

