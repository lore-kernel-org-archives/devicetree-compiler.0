Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCB71553A2
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 20:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724961881; cv=none; b=TW8E5c09rsjF4zSrh/F1NnTg9xTEJ1+OIiNnHd3osj7qX1xD1gEfm2gmo4yAG7QkWHxST+kE4VIvSD+CH399B190dwOWoXKIk2uHijqmHucF4uSnKzwovbHOEWuiLK757eyG1h937ue3GpnFwmYXC8hcNe0jN6kN5CznVSNPRdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724961881; c=relaxed/simple;
	bh=rjJXFskKnqsImHA8l86tmR3uNGTCQn0LfqqCYEwzC6A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rEUJDasH1DZHVPdquF5idehTRaOsRUUp5rjP2E7axiNYh/PboK7l1nKMr4wIlHDtxG5T+tKfXiC8rk/V4nrqdd/uzN9Gh6CTJoQcDNY5A950y9EbLmOcMbURXFlhOrOTFziIhEBLeWtkVT92TcOqxINeM+GdZl6mmJYKvVXNoAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=a0yf4ptE; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="a0yf4ptE"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-715abede256so807586b3a.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 13:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1724961879; x=1725566679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xcZZUC/LXxy7UzrxrvbrQjh1P9nHXgE3tdvdi+G3zLc=;
        b=a0yf4ptEMpUa85+7jbjHcgH8qMP1JV47NQDnCukBJE/beL3OMBsiqgpRxUKwFiZJqa
         ewO14o7ERAVeCbpDx74yVch76Uvn8e0yJSh79kLIMiFeAMJKBu0HQCHMmP7fYt7yAtus
         NMpe2uHP1QXj1GV51QyadYiOoWmYr6hRo+HQ7Yve3G8Pz3OolufG8UodHKpYTNLk1CrE
         Ds9GNpkcEmzNLXVyC+VjBCfXyfMIQVCAuo38z03vFnkcoutIUFeaDZ/3puY670bOlNDN
         Ed83E2nxd8jQ3yazuhxwDuYGlv8RiyMfXODo0DjD3FM+ejckZcF+NtaHvOKxBHzs/+1H
         ojTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724961879; x=1725566679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcZZUC/LXxy7UzrxrvbrQjh1P9nHXgE3tdvdi+G3zLc=;
        b=g0//Gnj+91/BuJN413aeCv9DoGpauBr+rQLNpE/UYmcwEVT04GbeqGFOHpJRNk8Kfn
         ATtLuPE0heiUK0qyca522MZPhgKC2qXR0hlOHlbRAzTlK/qHlTshxsV4pezD0z5wznNk
         6BC4Ds9HwuK95RlaLzYPbHvahyj3X7RBvXdQismsI8eonnc+pYbLQ2ApuANa+7MmoAFI
         7GucCQjTAbJ80F4GczknTl6a0Dex5bZTVdWo9dWAIYaE/cw9vXUWQlL8fG/kIwlsWmAq
         U+gN70eL62QyIHAvtnzgbZcnglGBUoSjdx/vxYxKz59VFiOa9lMV1hJTWhbBSoC7Wj+6
         MjjA==
X-Gm-Message-State: AOJu0YxjnMNi1JPDtyHXZfqbhLdL4MKtjDNzHbaAeDVaGe6iMn92nFVS
	c7BwlIfcbIdusgAm0cYiZ1ix391410Iw38DGH1ba4Ryfbm1LzNUlppAsPmTCJ26I+p7eUrYHYM9
	QrQyQYdE=
X-Google-Smtp-Source: AGHT+IFnEIvW3U4lDzfcaANP/MUNRue6D4zduXIcqqKUEfWlDBbkUeJ5O4+y6VWLiDvVBp00aIgjjw==
X-Received: by 2002:a05:6a20:d046:b0:1cc:9ff8:eaee with SMTP id adf61e73a8af0-1cce0fedb7dmr4086780637.1.1724961879112;
        Thu, 29 Aug 2024 13:04:39 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051555140csm15105575ad.244.2024.08.29.13.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 13:04:38 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v2 0/2] Add capability to append to property
Date: Fri, 30 Aug 2024 01:33:38 +0530
Message-Id: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABrU0GYC/2XMQQ7CIBCF4as0sxbD0Iaqq97DdAEyUBIDBAzRN
 Nxd7Nbl//Ly7VAoeypwG3bIVH3xMfQQpwEemwqOmDe9QXAx8YuYmUqJgmFW4mRpFBLtFfo5ZbL
 +fUD3tffmyyvmz+FW/K1/REXGmZkVCkkWNY2LJuWepKPK5hyzg7W19gWKb+W4ogAAAA==
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>, Simon Glass <sjg@chromium.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2104; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=rjJXFskKnqsImHA8l86tmR3uNGTCQn0LfqqCYEwzC6A=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBm0NRSuxjUMpTEw0LWtw2fDCEvnzgLjO+F4VC36
 3Db8Sbq92aJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZtDUUgAKCRAFzvXHieVa
 dADGEADaWc4H13hROKpC/8WQtqCtCEg4FQTMRDeM9X3pESFs5jZPwc4spyNk6CS1p2OxUVifd0G
 6yqGY6dfmfeOUyThKsCbkKIuFsj9hxPKPWqf6Om4NfwHcQrn3wl/3AaCOL2h67qozrcstMQL+tO
 rmU1GOem46OEu6P54tkJ8StlWNijGBnXyJ0F6hIdCACj0lXauZWdYepR+pBBOVeaP8L1pxWGeX1
 SfsqRkRoQcBrio7hU7mWTfnc+umoQ3lY/pdb41IfZ/bKvc/3WJyBsFVJgE++vjOo3fgX8mPcyLK
 5Th7sFuIM4tEsERjke1kahOypmOqPZ00zOBi9UuddOPR+0PyuVLGlIsrVHBwxhWchmR+O18cr5L
 Fho57RQYdTvL8+6+eGDPEKkuFTyPHOMghd1DDWOg5jreMDbDmv5VIbZME2ulEDP7M6C9wmabfSL
 pQr2ASSQeh1VnxNHBzmyP1qHtk/Wk1UUcRMoGDQFo/5ga+h8XITUiFbHXYghUWdigVRG4mGq3zo
 ByIfKtqNMN1mfxO6YuQKxDYr8le70kAUj/UMAa2CtlrlyYs2nr/LG6rtLnfedT1gTXL1LNSTY/P
 ViNiyQgF9HaK7dIXRPx2j/UrLbKEPa+EgaX4TntmqdlAFXntcOh8ihRnBpiNvurNbm0PKqzzcbw
 rGiId42UPfDdrug==
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
- Better tests: I only started the work today, so well, I still don't
  have a good picture of how to properly write tests.

- Appending to non-existent property: Currently am just adding a new
  property if not found. Not sure if this is the desired behaviour.

- Incompatible values: Not sure how to handle when trying to append
  incompatible values.

[3] https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/
[2] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts#L39
[1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L3334

Signed-off-by: Ayush Singh <ayush@beagleboard.org>

---
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
 livetree.c            | 29 ++++++++++++++++++++++++-----
 tests/append_prop.dts | 21 +++++++++++++++++++++
 tests/run_tests.sh    |  7 +++++++
 6 files changed, 70 insertions(+), 5 deletions(-)
---
base-commit: 99031e3a4a6e479466ae795790b44727434ca27d
change-id: 20240827-append-f614fe3261f9

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

