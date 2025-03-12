Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5DB1DE894
	for <devicetree-compiler@vger.kernel.org>; Wed, 12 Mar 2025 19:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741808554; cv=none; b=D3FDKyP7CFI/9v+0L5GmycuoXwTztdW/fZy5l1PapO9NJjKDIKx3DSVvKlaRUfeIGRxJyZDk2WUr3HddR2nYpff3QWlse+9CgHKzeV/zPclf9TATOsv1BRZ8aLE+xhaaZjdHChQTzQpw3WflIvcVqyvI6TGOB+VDYQ1o/oUA46E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741808554; c=relaxed/simple;
	bh=8negvdxBSOII0YNpMabPrt+rWXCgkB9awpb52Z7+Rxs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RyjqFaUXPLqoGdzweM/mgLGAJXLDJbSkmA4K4m/8Vvf9MAFLVhdWozD0X/ksctXQys9UbvW4/yKpIY3C2WfvWBzFmfa4ltD+5kA9SyhVilFhxhTncz3N6P5OP2FfcMKQ4AYgCd3nBgN9+z9IujFmE3lZtosZfn7rDLmXiZSWLWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=HNU62eBo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="HNU62eBo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22185cddbffso25281675ad.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 12 Mar 2025 12:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1741808552; x=1742413352; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9gfj0gQiKuJYvvjoEIwhMwN8W/gQQ5Aoh1HZHTj9u1Q=;
        b=HNU62eBoyvFkwIS8bKmSecp34rRUIlC8pENN5G2SdyLS94sAyuPOUFyLFvG0P0FLQI
         UvcShFpq+IXQxLun70nivEaurKSfLLeDOl7+b5eu5R/E6IEHHg1e8d/HlCXCPfBfXARh
         dGlcl0j+euuxmyzzHzTk5HeZv1bLBnHNc7TwVHsMt+I18VJm2OHRQZ/q3mF02hv9VXnn
         PyqirMS4IqjekKlpDlX9MijxUEZl1Am9PuMav88p/oS5klztV5Nlr05caVNUe32fnv2Q
         RrF6N7n/i3R9R/6Blm1SkeCucK2SYmYg/Ufip73NAB+UKkP0TGfskDJgROizisGCPEp7
         7hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741808552; x=1742413352;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gfj0gQiKuJYvvjoEIwhMwN8W/gQQ5Aoh1HZHTj9u1Q=;
        b=Y2AY6ymJsiZoidEnkMl7fVTJqMtBUU2zZYB0nl9XzpWiCUyGyS0RgcxDYV0FVnnHIZ
         Rs12GJ9PiktsU3bBFtKyAkPbr6JBtgIFEGKlDxQ7764bMZWO1rdgJjKiWwo50fYPtZUo
         tGxz5wgwVNqyE9QDVSvyyIxQ0goELDIuDtOAFacPBDVAFJs0VnG56yMwOKsNKR3yyJV9
         gGGZc5HNmktHFq+KguN/xK7iHBAdiQS3W03VDy1PBkYh7GNNRvYCDJ2T/6ueGylRHk+6
         T+HfxFcDvgyxKSqmfMBd8HYn44hLkDuijHmisDVfI2JjC0jMklEgvk6j5CafUo++7Emo
         fa3g==
X-Gm-Message-State: AOJu0Yy54JpehQJ3bm4Pcm1EspDFcLz64d52KJQ/66RX1zemDlz6t2Uh
	1+iFTJARLINPMrtEaMda+5fK5bJBFNhpVs7wFfEU5WNlpkjZbprGAOT+qV7l4w==
X-Gm-Gg: ASbGncsStlNXKo+jxEVI//76KmBU5f84CC2LrLj0nFumkttOpVb97kcPkEXCUrGdFXm
	EfUITJ1EJ2sgMdKRzn1wFDfTc2pvs0zttTmWocAmR/UcFaqwxnAx9Qxy4lETuv7m1fYo/dXUN+G
	6D0gkB/2NKQE85r88s6/G6G7m0XuZVHJYKEJVNMsrU1R40wWW8ReMI638s8u6VMb3ngTXyo/WHo
	QqxLA9sOdK7dnrn/zsoxieZElDG/VXg4iMU7bNMKItxSv+P//bdTVmva78BXRExjraWooko1UN/
	tyytrVqTlkwMdQZ0+gE00/r58/TVEbqQluEEvH6Z8rxwNspyKLs=
X-Google-Smtp-Source: AGHT+IFE4SMUwjtIVF7tv7R1ZoCNYgQ/U2hJxWJGkc+rPp7Fmt3W9epLJp0yVPjDkU8iisTodIFglg==
X-Received: by 2002:a05:6a00:828d:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-7370d3b5414mr988559b3a.9.1741808551925;
        Wed, 12 Mar 2025 12:42:31 -0700 (PDT)
Received: from [172.16.118.31] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736cd220c5fsm7781782b3a.55.2025.03.12.12.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:42:31 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH 0/3] Allow specifying target node in fdtoverlay
Date: Thu, 13 Mar 2025 01:11:59 +0530
Message-Id: <20250313-fdtoverlay-target-v1-0-dd5924e12bd3@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIfj0WcC/x3MTQqAIBBA4avErBMy+5GuEi3ExhoIjVGikO6et
 PwW72WIyIQRpioD40WRgi+QdQV2N35DQWsxtE3bN0pK4dYULuTDPCIZ3jAJZwelsbN67DSU7mR
 0dP/PeXnfD3f4KpdjAAAA
X-Change-ID: 20250311-fdtoverlay-target-fc638e4c8748
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3266; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=8negvdxBSOII0YNpMabPrt+rWXCgkB9awpb52Z7+Rxs=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBn0eOcUXU2dUPghHkTQM11WWhlP1Fw3/ZzWipO+
 ZLh1nO8Lr+JAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ9HjnAAKCRAFzvXHieVa
 dG0TD/9lwl2GdzHkEnP9DIAGI5ddGFyrO2mfGSh3UPO1rF6FcElWQYkzBzKbaqNxVNXQw+bpnlI
 wDMb9jRooMFJIh+VC0bmGUJpd51T3MbguqX/WgoorkIWpOD1QRp8iZ2chWbvtnwj0knsIS3YNKf
 zl3JtnNz8qXyJE0FglywvOevFzjthDlkertM873oIXQZXOgMk8zBoUyzTCBiemWX0NnGzC/bZbp
 9ZgQDnrFiL8Ptt1/GoByQm2OVjbN8p9f2uClaoRFKEEFJuBfeJWkdMETQ4B80CQOMp2+x6WpLAi
 NuMM/5BdeqbXEmHw8cNiP0Sm6isrygoY3x7BuSkmEOANb2nbhieu+DB2iqm22UhDsCeZqFyqTl1
 hfQqCEwmpQv0TQnjztYJr8d5qFuyeJWsQeItT+PDOSPxR/zqfD6h8vW3jbjHsLMxPfPLwK+jtZa
 3DGJbQY5BBr/YtclQXYDRI5NYxMgRqBj07l5Qi0VyUimmPaXZfbTvQSQwWPRHmybhx2MEscGrON
 jAlOTBdY+KgV8OP8tsE2UGjlGWIp0qiWWw87WTofzT2ezraAfdyo3nwXEQqRDsaNbUt8MU7VRgM
 KGmLzQjsVFzWhsW4JYfQtrcyUWYpF/OQtL0edty08Usj7QP8c/cIR1W4NZun6mBWi7sYdLht9Uk
 Hivdlss5RxTLxOA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Linux kernel supports applying overlays to a specific node. This is to
allow kernel drivers to use devicetree for device hotplugging usecases
such as connector + addon-board setups.

The overlays designed in such cases will not work with fdtoverlay
without modification since there is currently no way to specify target
nodes in fdtoverlay.

This functionality is required to allow using the same overlays that can
be used by drivers by providing the target node using program argument.

It is important to note that this only works with `target-path`
fragments. It does not have any effect on phandle target.

In practice, it looks as follows:

base.dts:

```
/dts-v1/;

/ {
        my_node: my-node {
                prop = "hello";
        };
};
```

overlay.dtso:

```
/dts-v1/;
/plugin/;
/ {
	fragment@1 {
		target-path = "";
		__overlay__ {
			baz: baznode {
				baz-property = "baz";
			};
		};
	};
};
```

Apply overlay:

fdtoverlay -t "/my-node" -i base.dtb overlay.dtbo -o final.dtb

Result:

```
/ {
    my-node {
        prop = "hello";
        phandle = <0x00000001>;
        baznode {
            phandle = <0x00000002>;
            baz-property = "baz";
        };
    };
    __symbols__ {
        baz = "/baznode";
        my_node = "/my-node";
    };
};
```

Why not do path fixing in devicetree overlay instead of passing around
target?

I want to provide an implementation that will work in libfdt which seems
to require no allocation. But yes, fixing the target paths in the
overlay blob directly will allow removing most of the other plumbing in
this patch series.

Open Items:

1. Backwards compatibility

   I am not sure what the guidelines for API compatibility are. So, I
   have introduced new functions instead of changing the old function
   signatures. 
   
   Additionally, I have named the new functions differently from the old
   ones (except for fdt_overlay_target_offset_v2) to kinda make them
   completely seperate functions.
   
   Depending on if and when we are allowed to break the API, one of the
   below approaches can be taken:

   a. Break API in future:

      All new functions can be labeled as v2, to signal that they will
      replace the old ones in some future version

   b. Break API now:
      
      Self explanatory. I guess a version bump would be needed, but I am
      not sure how versioning is handled in dtc.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Ayush Singh (3):
      libfdt: Add fdt_relative_path_offset
      fdtoverlay: Add target option
      tests: Add test for fdtoverlay target argument

 fdtoverlay.c             |  33 ++++++++-------
 libfdt/fdt_overlay.c     |  62 +++++++++++++++++++++-------
 libfdt/fdt_ro.c          |  17 ++++++--
 libfdt/libfdt.h          | 105 +++++++++++++++++++++++++++++++++++++++++++++++
 libfdt/version.lds       |   2 +
 tests/overlay_target.dts |  18 ++++++++
 tests/run_tests.sh       |  14 +++++++
 7 files changed, 218 insertions(+), 33 deletions(-)
---
base-commit: 18f4f305fdd7e14c8941658a29c7b85c27d41de4
change-id: 20250311-fdtoverlay-target-fc638e4c8748

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

