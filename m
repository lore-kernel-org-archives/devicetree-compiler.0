Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D823C17
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Jun 2025 10:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120559; cv=none; b=eMhsO3A7bPh5tyAmJ+f+YCf/4TsfYy0MjGR5Qph5XZbivH2f6LZEmak7xQlQTm4aJIIQQ8MfhdDDeqrKIfCgXte2NS/hr4Txn7ZRMTW3NfsTvUPVt9axa9o78fvSSqF6F/SnKv0IPoFgasDwurOm95i9513i1ENGEweMs9LiZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120559; c=relaxed/simple;
	bh=+BB6Rdwz0A06n0a73aFZMhvpuAVyOZLP48AzGfr0EyI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tBn0mj7tQKHmEE5GYm/WjZOuA5hVBgHFZcsaaCToxokVIJ+e5Vg96H2MZq9Ujajh8aBh6slwUSIRakrnvcYQg+71uW0zhRxU94AtLDvqMRxBjeIugwCkKWmcF9MpTyRc74NrOsQX2Jk/3Ebuwp5z3IXZ4rYLYDwhNS7uKtU/Jrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=LYtNrzLD; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="LYtNrzLD"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-40669fd81b5so613586b6e.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 05 Jun 2025 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1749120556; x=1749725356; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJqO58NSuJqpozYLGHgeTvhDX+p4X7w3NSQI8eR2VH8=;
        b=LYtNrzLDsc7Ntqktdba67HTYIQk9r3XhsmgQfBZp427VPJsBKkUsp7jyJzRwevRV2J
         /DIA+1E6C1PfrKAEDhQ/rs4Qc9kFH8hD71SvA8RIEOIDBM0kbwusmp4UMZKgnXf6Fcit
         txqUUJc1wa/bFnVmeXzugG0IDjS+v6d1FKwLMNde+yVFX1di25TghJjZ3XDET2ImPZBB
         b8tXDu/IW21WmS+hHIrO7YMXv72DB7hu7HuQM7lksKx0eF7SRp5/e1PHlIl3ZESDC+L9
         K6SAg+twAfC2EubtB/mH/AxPQpLROYBGZSreFCcOj9U4+weZcwoYl0IcC0nmT/nhwN7p
         7rZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120556; x=1749725356;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJqO58NSuJqpozYLGHgeTvhDX+p4X7w3NSQI8eR2VH8=;
        b=IeY/nExCuMEcBIo1oRzFZF5Bo9Fyrfgm9NlphuW7zJJCwEqP+cSRi8CnCPHLuSGZo0
         q//CgwbpI6QT+kAiW4Hm+ZC2cH9kpM3DkdV+5IAvRGRA+yRM7CIMWWdRf2QNj9ooXFf0
         oThS3SQIfn5I1/Sx2n/KuZ/Fw8EKjwUkh3vKw+94v9XylvVRVmMBKHcvYEETNvb1ntjt
         hGCOVsTl1CRzTcFMVbqsYYAJRTfcQEcL8dLV0Laoklil1PWoz7nVRVE3JzrkWvfjDJf4
         5ZdLOX5b24QWva9KLlMOM3cNq9v4XT5+jaF9w4tHRhOLFOGFWDCPlKDJ2XnVOTw++Psr
         4N/w==
X-Gm-Message-State: AOJu0Yzh4iNL63rE36dqLmS1oCvjcFqTFVtjzBKj0Bge3Zas4TqyXprW
	IsH31bo0WEw7ykCQr2ENOiQkoVaHSok2cQNg4SeKMVa5Wm2u0d/nF/PGYV45GsmLM89NO/t6Axc
	kqkY=
X-Gm-Gg: ASbGnctMsS8qjDfI0E0nMktFSTnnBNMdfk4/rm4LD/qoy6VofG4TXMm3cXfgJfwa8Tx
	9gnh5zTQDSChMbc/omidwVS6UhsgMO6GbL9jDKizvgFRAgYjpJZdX6FoKMDk5j2rSdNB1zmx8h1
	MWafhWBAEN36OxUEfX0yLgqKixnk+04PgIHRJtwMK+oTTW6z6nsyQUh+H4kyrP0VKb1QHAcKHb0
	bDPdc73vstN5+OtwB2NeJqkONmT2OG0tp9DbJR+uCrH94kT/4inxBCdWP+wfgk+z5wASMefLNc8
	OwrrBaMydXnr9IG+ve+/UNY9EJVJNM1NOxvWbqUQ/2uVi2OOwyVCWgs6LlfcYw==
X-Google-Smtp-Source: AGHT+IFzfwIFyZPWj8tRdtN4KfM9T3k0PJi9dV2CPJCwFW+Xc/gmzk/ySLBN2aaxSH7lJuIGRYRs5Q==
X-Received: by 2002:a05:6a20:6a0b:b0:203:bb3b:5f1d with SMTP id adf61e73a8af0-21d22add17amr9054591637.6.1749120545608;
        Thu, 05 Jun 2025 03:49:05 -0700 (PDT)
Received: from [192.168.1.11] ([2401:4900:8899:bab8:9a99:8bde:e080:9339])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd41edsm12997594b3a.146.2025.06.05.03.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:49:04 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v3 0/4] Add capability to create property from old property
Date: Thu, 05 Jun 2025 16:18:05 +0530
Message-Id: <20250605-previous-value-v3-0-0983d0733a07@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOV1QWgC/2XMSw6CMBCA4auQrq3pDC9x5T2Mi4EO0IRQ00qjI
 dzdlpWR5T+PbxWenWEvrtkqHAfjjZ1j5KdMdCPNA0ujYwtUWABiLZ/pyi5eBpoWlh2iLpiJuEY
 Rn+K6N+8dvD9ij8a/rPvsfoA0TVSpcgX/VACpZA26AuRWMTW3lmmYuLXk9Nm6QSQw4A8CRwQjw
 gVdKgBuyqo/Itu2fQET2DXI9wAAAA==
X-Change-ID: 20241227-previous-value-c22d4eeaae72
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2507; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=+BB6Rdwz0A06n0a73aFZMhvpuAVyOZLP48AzGfr0EyI=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBoQXYcQDD5rhCd5nbeQg6KEQM5e4Itve8hnqkm7
 YpSJ/61C8uJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaEF2HAAKCRAFzvXHieVa
 dIkMD/sHguocFN6HzoW+GkLstPxhqWAvA5OnVL9L79QNBlvSKFFnXTgJasl+hfRQs7a516JQRht
 X1w47u2JWlNBn/wKcaQdVY+gh4/EvqPsHl/PzYoQCGnMi93aAGN43iHHr16Xe+gQ7amoJKbWzib
 Mq7S6INLAqb2IHg1AgbOa1xl/qdjkSoJtI/3O1MFoQzRC79VT6/R/O2NtYn+0PScd/0qh//5vSw
 itEQHwj6xyBZ1QG5rufTuh220bVpRtESeQWPEwWQLiCHm77pZA6/FM5X6uM03k5qMauE0vHF4m8
 TgIpj4WEePJnB94cU5hWUPYhiFKCXI4pRETZX4lxV0FBckrHvbnKK74yXNLcKCyZBz/SY+ra8iq
 rOU6/XOcsPN8hAQiqL+iFBJmKKbwOkABvP1CYm2+YO3rfRXZKHbRXUtjHFVPF5CB2ti4FWxUyUu
 tYomFLSwAa292qSCNVt9JR6DjFJVzPt9BCVAbFCjkyyLQex6YkX/I6gznCPN46Q8oAtIJWXzY4k
 3lC/JsaoS9xKtK5MMXf9rsM2qYeWpogsGs2Eq4yJNBXXZ4e1EEyHhqErr+b9IICPMAiPaHDuqkD
 TJl8qHnrz5FT1golhbVpfGZwoltDwsBn0/JNxnVMYtta8gxztPci8Aa2A6o3keXW1Hn6Rv1wzn2
 GsKMErww0gmPyEA==
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

dts to source output with -T -T also works as expected:

/dts-v1/;

/ { /* base.dts:3:3-5:3, base.dts:7:3-9:3 */
        int-prop = <0x00 0x01>, <0x02 0x03>, <0x00 0x01>; /* base.dts:4:9-4:26, base.dts:8:9-8:36 */
}; /* base.dts:3:3-5:3, base.dts:7:3-9:3 */

[0]: https://lore.kernel.org/devicetree-compiler/Z24nldCpXpoT7RaK@zatzit/T/#t

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Changes in v3:
- Rebase on main
- Fix Patch 2 commit message example.
- Rename `data_insert_old_value` to `data_insert_data`.
- Move `data_insert_data` to data.c and split into independent patch.
- Rename `DT_PREV_PROP` to `DT_PREV_VALUE`.
- Make `prev_value_used` local to while loop.
- Link to v2: https://lore.kernel.org/r/20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org

Changes in v2:
- Compare against expected dtb instead of checking each property
  individually in tests.
- Use xstrdup when copying refs so each marker has it's own copy.
- Pass struct data by value, not by pointer.
- Add srcpos_free helper to properly free srcpos which have been
  extended previously.
- Remove open items since my original choices seem correct.
- Link to v1: https://lore.kernel.org/r/20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org

---
Ayush Singh (4):
      srcpos: Define srcpos_free
      dtc: Add data_insert_data function
      dtc: Add /./
      tests: Add test for /./

 data.c                       | 27 +++++++++++++++++++++++++++
 dtc-lexer.l                  |  5 +++++
 dtc-parser.y                 |  5 +++++
 dtc.h                        |  2 ++
 livetree.c                   | 23 +++++++++++++++++++++--
 srcpos.c                     | 11 +++++++++++
 srcpos.h                     |  1 +
 tests/prev_prop.dts          | 25 +++++++++++++++++++++++++
 tests/prev_prop_expected.dts | 13 +++++++++++++
 tests/run_tests.sh           |  5 +++++
 10 files changed, 115 insertions(+), 2 deletions(-)
---
base-commit: e0b7749c26a9ea28a480bca4a87d238e284ac68f
change-id: 20241227-previous-value-c22d4eeaae72

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

