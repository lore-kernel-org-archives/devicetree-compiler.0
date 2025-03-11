Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE8725D904
	for <devicetree-compiler@vger.kernel.org>; Tue, 11 Mar 2025 15:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707350; cv=none; b=Bu9/HTPLHNI+flY8Gh+a8E25IJDOsP5gmiNDg5wPCCb5DOLar/i0tTha4wq1B40uUzsJdZHYighpILK8S66T2vCbMkNTo6EJx4tUj0vt9+N1lZ/Q/47Q5Nk24gLy35bayW4lVG/gViBJGeoZTfMdj4xzav2tmk8mpJRKCNXsLL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707350; c=relaxed/simple;
	bh=QBAxymbkKE33D392kYimVORvxKqZn8VE53rHZUw9u7U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EUsPxb06Dp7ZBDAFe6+tZurViCMwXX/Ncs+/DTp/3cANVthbps9KpHJpt5d/2mmADxLE7D/zkmj4FqI1fZOaPHJNjdnoVFEX15NdWRp8Wz8afryH9G/4DgB3UxiBcIWoMRN87m+wHnKhHrud8hHMKilL9YEjjvKY7iRC5s5spUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=RBu9oupy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="RBu9oupy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22359001f1aso134135305ad.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 11 Mar 2025 08:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1741707348; x=1742312148; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+DdWLAO7TgBZq0QIzECJcxYld1T0ePx9VsWGi4x4rM=;
        b=RBu9oupyp7LgDzHURvSLXUPLOfQkJ2H5KBJkAogAE/L7pp8JqXXpcQOivjYAigNIpq
         FOEaLf0EQGDkfoAma1Q++k7MDxOOCPVmh6CTCqhMv/MZzVhGFKsWnQh6Fvy7ZxXR6J4P
         SH61WP+MA5ZXcZhkeBPvhudmXlaKuGyjcZ14vPZA68FrrM0RlYfAbYLuTA1Fp2BR4XrC
         EC/SH2OcQ8YpL5OTZAkQhWSAGIF4+2iO15tA7udp4UANc8G5300P504TNqHvxJc/F/wF
         bnLJfTK+T7f1h5kCH3YI5QKMfAP+TuFrbPeqTHgcvfsYj6M2uesBRj6vq424mfqMvlZW
         cvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707348; x=1742312148;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+DdWLAO7TgBZq0QIzECJcxYld1T0ePx9VsWGi4x4rM=;
        b=gz3cVJ0EOqMuawN6tSEXbIbdQbGNhGy9KZ6Xa18navHAiX8er/MhWcVE/B/i5FXW54
         irYTqHomxqIN4XndmGkJMEuedRpWN++lVZFsJgj416KEJfyHAP9tD/+V035zN6sbPwGc
         HfRZV486/gTumXvNoz9zq3zvJZJK1XAkZ9B3A3oUZK54mj7+k01s5jtGzCd9rKFjQo0k
         M/m6nni6k7s1tE4ZYjUUBbTvezGBxqi4yDgmvq2xJJr4WQFyyDqkX1P1JDUA98lKW61+
         ZQMdKi5x8c2U5zyI+cyK7/gWoDDfTFGdCxrN5g7ejA7jgEaV9HNVH352PR0fmWPRTxPy
         n7fw==
X-Gm-Message-State: AOJu0YwaM5zwqbuKfQAXXVEyHMVmUg8n3KN16PiGPcIKvSiofmiE1jon
	2evlyH63FMCoWqoGVMOysMisr+7qd6SZQd2CJvHjlR4s9MdNNgKUJW8UwJZG6jh+FTqBED/j1gi
	9YA==
X-Gm-Gg: ASbGnctf7zfVuPUJ65QlzQua5671KOERwfCDyl6FcvBgvPcFM6EHP/oq3fQNCqURRsW
	PLG7l3r0e1/JIwLjs4sKBQ9wTWPZlZMfiJi91+4DGwnKCciDim1FxPM5armYO40EsEG9Jyf80HB
	pBc88nLM8Nhj0pTsmS5OYtrKqa+1h5dt9AuvgCJyIaMrl3sMBPmnlv6Fro9H7jkW5dgOIQcGdCV
	oznAmwKEZ/udMBNA6c9xYrHPkSTWo5GgS88wVJymErQPnbbDvzuv8Yw3xt1emJvD+lL6TslHe0s
	B1soci0ub4EaYxVIrVHFYtD76ZfZF7bSLJgWueqDHXaMoHKtAvQ=
X-Google-Smtp-Source: AGHT+IGVm3lIswS7tYGc6mAFIS5aB1we2ZWuvy5m6VYWwdaTynY8iQTquxLhvbsNiImKtXgdKCO8bQ==
X-Received: by 2002:a17:903:98b:b0:223:397f:46be with SMTP id d9443c01a7336-22428ad4a09mr276271765ad.47.1741707348134;
        Tue, 11 Mar 2025 08:35:48 -0700 (PDT)
Received: from [172.16.118.31] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e822bd2sm12030413a91.41.2025.03.11.08.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 08:35:47 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v2 0/4] Add capability to create property from old property
Date: Tue, 11 Mar 2025 21:05:36 +0530
Message-Id: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEhY0GcC/12MTQ7CIBBGr9LMWgyMVaIr72G6GMpISZpiwBJNw
 92FLl2+7+dtkDh6TnDrNoicffJhqYCHDsaJFsfC28qAEnuFqMWrrcKaRKZ5ZTEi2p6ZiDVCPdX
 66T+78DFUnnx6h/jd/Vm1tKnO8iTVvyorIYVW9qKQjWS63g2Tm9kEivYYooOhlPID8clsibIAA
 AA=
X-Change-ID: 20241227-previous-value-c22d4eeaae72
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2103; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=QBAxymbkKE33D392kYimVORvxKqZn8VE53rHZUw9u7U=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBn0FhL8lKp41NKJRbuOE+FXihQo4Y3a4TRMihu5
 JTIc0PwcCiJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ9BYSwAKCRAFzvXHieVa
 dMnaEACSYq4EVctYrHoLiYMtpcKCakbX/t/BaS6Q/ZNZ6/9cQeudJl/alahR6OoWbiZAoyTmz8R
 G9boTkQ3CGurND+zYUNsxWT/qg6hio5Tt4d8fhXsXzwA69u7+JcPoJSJVl/ANEBer3rnL3BPMzO
 Iak9o4kraS6W5Yi0zMm8NPK8nLgrnkgzKMl/dlbnJYiAOiI9QmppXv/16I0YJxoX5znOdfyYlcQ
 wbaXvU/Wm8pO45psqFBQ+29e4jNhYiQkRd91fmKagf0rd71cVXZM78nKLEPRzMb0dDoIsqGxVIp
 oIzXnzz3Gad1KK+m/H3HQDlE/0lmQzhl7F92eYPxSMa2Oo3+M93VtDZaz0jq8c2/krOX1fsG/9D
 9/PEbWjv89msFheksppIUquEMG5n4276ZI7t2DNXuCAg+LjlDKHy7hYx6JcDNgAGJNtzRC8FD3u
 fs0ds+xfM2UKUXvk7M8L6YBPgTIHkJaxSUJ6BbSBEVX4CDoKdu+4lUXNepeMVq6dDmHvLpQ2oJW
 lFLOiPZtidtWWU4Ci1csHiLZGHGC4zBcc+WFGCBL6/0KPSr4dO/5GA2JGHJkP8JWQLO7RpfwqZm
 6vRTINMUP4187Y774Wz/do4FW06zLT9Yh4HG18sar4lMpAryeIbom9z1s6UGzeWF/qi5yCg9G7N
 V6py/Xc7hF7goog==
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
      Add alloc_marker
      srcpos: Define srcpos_free
      dtc: Add /./
      tests: Add test for /./

 data.c                       | 20 +++++++++++++-----
 dtc-lexer.l                  |  5 +++++
 dtc-parser.y                 |  5 +++++
 dtc.h                        |  3 +++
 livetree.c                   | 50 ++++++++++++++++++++++++++++++++++++++++++--
 srcpos.c                     | 11 ++++++++++
 srcpos.h                     |  1 +
 tests/prev_prop.dts          | 25 ++++++++++++++++++++++
 tests/prev_prop_expected.dts | 13 ++++++++++++
 tests/run_tests.sh           |  5 +++++
 10 files changed, 131 insertions(+), 7 deletions(-)
---
base-commit: ce1d8588880aecd7af264e422a16a8b33617cef7
change-id: 20241227-previous-value-c22d4eeaae72

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

