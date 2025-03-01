Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077741C5D67
	for <devicetree-compiler@vger.kernel.org>; Sat,  1 Mar 2025 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740835557; cv=none; b=gxEYoJLSvP6NK6MtgctiC659f5tk6TlEzZ2Ay7RweFXHnP2p34i2qrSkkmOoT+E984oI6Hvn2TWIxqUNe8gxrhr/OcIzIJyPdA09g0tC0fvkoHXCfA0OIwKlAMew8XLSNyLrsoRSLWFYgKUusYZ9VzolSOM5TUM5QgeNpcloOlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740835557; c=relaxed/simple;
	bh=NqHuIxzkmwAXxXd+qQZpW6F1KFW+rPp4BOAyybaRoz4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K2+97KIhekkPV20pjlNjqkYJMPWcAtq5mV3CVFhJLsJQ/xAbaYDAABi8vGS0SdVGGRnSVQfVf8i+EDTlWnlZI30j2/k0b3QbLuHXr1LlE07B5+PNZ/cVCD+970C2XcMZwT5bTGG3tp0U4818CDSBxzlV3XHhqxjFwNflEBhUv24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=SYYETLYN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="SYYETLYN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22185cddbffso71234075ad.1
        for <devicetree-compiler@vger.kernel.org>; Sat, 01 Mar 2025 05:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1740835555; x=1741440355; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=snQuFpVpZ9JMSKzgmdYLq/Z7PHLjptBGll8CpOwCBQk=;
        b=SYYETLYNliJQmCmzQd8PEOpv5SVdlLx8j0Ov9sEjU6Kd6g8ntn6f3qEV7aDQFhLF5J
         87/+dXudVbZChMExGTLF4aPGjriOCT2GQwCkNrf9Z7UbgY9ts37oAvfbvqfybPZoortH
         6Vw/YxJ+FHydtkRTudsqifhjyY27xKlySMwfLqikuE4wptmYNwxHPgjRA+hSjpIldM34
         gFbp0fh7+6OvoR1gcDEIKic/RE8uJdAs+SM2o+FQ+cxMbVgHvSETv3YK9LLyiLQWNsWD
         M9X7bUQZdO+EeYsGmh6x8FWQg7Koy+qyr1TLQt9ZZgm8WTipqnGnAYUZUTGnzetFFlqW
         Pn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740835555; x=1741440355;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snQuFpVpZ9JMSKzgmdYLq/Z7PHLjptBGll8CpOwCBQk=;
        b=RAGxBGZM7ByRudW1ZSHveRwFzhTcFyNQZqfmlprP02DvLDoiKt4mm8e2YFvobf+z+W
         pNOSUR3SqqBndKg62S8+hEwLCxErsbyoQXLScNVKy0W7eRPB+r802EmPx1H0jdWK4KAc
         EJylIXPK+Lwz4wLzrPoy9TeEXVzRNoJ6RxPxu1ff4/7ZSfGJDTICCe5E2LtKmCkeFRaF
         l+mGtzASPxjr1pi+f7Wiw0h3A1xzDZFPd8Yf0wTpF57s3eIG5YuODoJqowxH2fITkumF
         mPiAyG4HWkmpD6KcaMfTZUeMsYrJAI94JAtxM1HUH1Wn50OcFupA3201LKqyyKc0xy7w
         E5+g==
X-Gm-Message-State: AOJu0Ywa/G7c/h1idfS5Ayjlyx5aBAbw3fGtlYYelB0he+/xjqEFAKpA
	VAzLORbOnVpH5YXU+Cj74/MDuFE0MX1SXmy42r1Rlsc10c7i/xgHaeKwlrWY1A==
X-Gm-Gg: ASbGncuNtX92I4ZxZzIl52GT4jpJHeQAoCERNtHp0VNTV5EXranEz2gWYVvYdGZfxq0
	kl41oYuw1weMKjpF5GVdjAJgRUwgxtiQBOW1agldDE+oVeKkq52j1avcZhaVocSakw+50Ip9PN9
	gsc9PPb/xyIel63PLcEMYqCXdkZ/NA1KfArp/fkDbtgiO+MAJTWPEl4XM6S14YyKdrEpKV4dD2f
	ot9u8IXxpstEGkNX9rc5hJ3MYOIHJ9Mgf2PEKZNHJa1Ni2xhzyV3UkGUAK7VB3wzTmxLSbyFv58
	kKO8hxtWxnevcJ6L+FZP325BZu7G31m5bzsvG1Uexnpl/fvS1TeD
X-Google-Smtp-Source: AGHT+IHA/95ULPiDGKB2btuePhyJvHPb4/vRlN49E+8ucUtXJAqIVjGPsDuUytQcpCbAw2u6fWFHdg==
X-Received: by 2002:a05:6a00:3c6b:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-7349d3183d0mr15873432b3a.12.1740835555183;
        Sat, 01 Mar 2025 05:25:55 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363cd5c39bsm764618b3a.174.2025.03.01.05.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 05:25:54 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH 0/3] Add capability to create property from old property
Date: Sat, 01 Mar 2025 18:55:01 +0530
Message-Id: <20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK0Kw2cC/x2MUQqAIBAFryL7nZCLIHSV6EN0q4XQUJRAvHvW5
 /DmTYNMiSnDIhokqpw5hgFqEuBOGw6S7AcDzqgVopH3Z8WSZbVXIekQvSaylgzCOI155+cPrlv
 vL9oXO8hgAAAA
X-Change-ID: 20241227-previous-value-c22d4eeaae72
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=NqHuIxzkmwAXxXd+qQZpW6F1KFW+rPp4BOAyybaRoz4=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnwwred2y8UhSO9AXro5MxcCgas2dz7s8rfUc1+
 H9QGTfyzZKJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ8MK3gAKCRAFzvXHieVa
 dKsuEADA55ktC+Ij8OGpj2NJI5EmAJFp/0j0b32HQAqbUrcERFUlyIkHXSvy8DceGTt0KruGgAa
 y4w1DSWxg3eB5LWVyEbEZdzyUBNXT5imd0Z70KxDit8fSRKLqGY6gJiAaqngnuJrNudApHrwglA
 XM5so6/9zLHt79KZQ5pORv0eOGesnpX76F+LkcPOzykgkM41dYs8PMfbDtTf8urHmm9tHcIbMZF
 OmLs094GhG8Pr+5N3zlKrWf6yRYW34qUxc0jTDXbhZ4XwQs4asXqdShJgSQqGoG9OhX8qJ6kuRj
 mFcU8TbWBlVhlwwyYqPC3FGrWrrj8uU1CuHPP4f1hze2sys6vVYaYTdnpIiSQgvdJPabq9AjjQz
 iHl1O/pZp5fQ4/KNe7/nCHp9LyPlNbHdwI9imkZEDBlRGPz/hVHmwZjJtsLpP/j3W/PMC7sBwrp
 N+aHMPkFsS1ftFHzaZSB9Tek4yghC5Mo8Wju1vmwYnV+a+y0fbXaU44ehtuZ7481otbWOP9Zi63
 g6yAJd3P1yD0O9pTCy7XpGsD81S0aLYTPrRSF2bF4+JjUD735thi2iPmyUC5OQqBuxYMdgakoH3
 aI9/hxhZn/S8IPAkRMPCwnVaKJho4W8blUSGlAAnfOK/qEtYoRKhRml2TwO3BdYnspYGf0nzZCt
 2BnMW/eeeQh25ug==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Allow construction of new values for a property using old property
value.

This was originally suggested in /append-property/ Patch series [0] and
can be used to achieve the same results (and much more).

In practice, it looks as follows:

dts-v1/;

/ {
	str-prop = "0";
	int-prop = <0>;
};

/ {
	str-prop = /./, "1", /./;
	int-prop = /./, <1>, /./;
};

Open Items:

- Integer array:

  Currently, the use with integer arrays looks as follows:

  /dts-v1/;
  
  / {
          int-prop = <0 1>;
  };
  
  / {
          int-prop = /./, <2 3>, /./;
  };

  This will produce the correct code, and I personally prefer the
  current syntax to ``</./ 1 /./>``.

- dts to source output can look somewhat weird

  The above dts produces the following with annoation:

  /dts-v1/;
  
  / { /* base.dts:3:3-5:3, base.dts:7:3-9:3 */
          int-prop = <0x00 0x01>, <0x02 0x03>, <0x00 0x01>; /* base.dts:4:9-4:26, base.dts:8:9-8:36 */
  }; /* base.dts:3:3-5:3, base.dts:7:3-9:3 */

  It isn't a real problem since it allows easily tracing that some parts
  were constructed at other places, but is differnt from how a normal
  array would appear.

[0]: https://lore.kernel.org/devicetree-compiler/Z24nldCpXpoT7RaK@zatzit/T/#t

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Ayush Singh (3):
      Add alloc_marker
      dtc: Add /./
      tests: Add test for /./

 data.c              | 20 +++++++++++++++-----
 dtc-lexer.l         |  5 +++++
 dtc-parser.y        |  5 +++++
 dtc.h               |  3 +++
 livetree.c          | 44 ++++++++++++++++++++++++++++++++++++++++++--
 tests/prev_prop.dts | 21 +++++++++++++++++++++
 tests/run_tests.sh  |  7 +++++++
 7 files changed, 98 insertions(+), 7 deletions(-)
---
base-commit: ce1d8588880aecd7af264e422a16a8b33617cef7
change-id: 20241227-previous-value-c22d4eeaae72

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

