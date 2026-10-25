Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918516;
	b=IREN1eVoSKOBYjPI0lzXN61EI9+GDHU0SToZRlsdqtJErWEfzjAiPIfhErx1WmoGABCA
	 9AYegdwJGpW9Ofz4aJ8dUhJOaG7M7KnCLJWQD1oKr+35KconeJeJwJRQTwkf/Q0TUUCYV
	 s+1yW7K40SOwQQPm3SQRU5vx4nE2TYgR0ePmIPDeNY/SMHfClG9S6fdtIZ0xvBw03zFXc
	 vXkwEdTD5HhzSe17ncdRmIskZDgSKh70kmt4ggJ6R0xOP8KJLoggF1LMV76hP3DCkyrtt
	 2aMGSv3Np9Eah5XkOSGXFb7Rw464DC6YOGJAZZL+x1MaCangivmDLbEOHzW5ifbk3HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CibWXtdBBdhgRgzwAihCVsOaCBqpBbe2TPhyC5M14mE=;
	b=j16LwaDsmnbNgKTOiCcnh6V/+IvX13EEbeV/VQgNP75Ir5BdzQkMxTnU3AmDK3fitHTg
	 WEDvo3VwyZU4Oz/o88J5DVrzNuHXpyaElZBv/clyhazBdV2qIuUbYLEqzX9XlBXNKVrwq
	 kIPJuhk6DqrVgIkFIxsv7rSksRSktPveNEpQQlUNHEhvbBF0IneVP2gWnMftQSQGDEatJ
	 auw82cWjAGwvHJs5t7aHz4UnKNCK7ZM5aQZG0v0QAskkVYOW33KU7268QFuuz0zew5znj
	 QbXApY4+XjHOB6Yz+s5r5QfGHRdzp+mWf4cwjXanXswTJSz3psa/QoT48LAKFdQvm0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AgCR3yPk;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2082B606A31A
	for <devicetree-compiler@vger.kernel.org>; Sun, 25 Oct 2026 08:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2082B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AgCR3yPk
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso671795eaf.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 25 Oct 2026 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792918515; x=1793523315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CibWXtdBBdhgRgzwAihCVsOaCBqpBbe2TPhyC5M14mE=;
        b=AgCR3yPkrtBIdRxNPQIZf4nqcDzDhZK+Sqx0M+OXi+XmMR3Ti5t7puOK95HA4b+cGd
         J7TsjfRebtzsz4JlOf6D0ls4wcU60TxH5Rbec6t7D5whmHWuSsuKfzdmzOc6n4I0c4aF
         CehZdhiUwfLvdSLMe5dYGEiKxgFLujfBeWlbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918515; x=1793523315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CibWXtdBBdhgRgzwAihCVsOaCBqpBbe2TPhyC5M14mE=;
        b=LfJ+WBX1GwndPS3rzF4o1+a+iCzfR2pdk/d2VccAu5ACKSgBVO0u7VFt9tBKImoYA4
         s+IPBf8mOcSzzeCkRCqQSkpdtLBUr11Z4NEpcZa3718pjxGELEg5KEn85H7HD1U6zw/E
         wSKErZL0gNcM60+qAc5EzegC4yAj4VercJf2SdmDy0xB3K+47x3LFL73L/Cs09XB7aLc
         dYY4az11ZbOPyJ4pOAqjagcL/wEQNgJdmfcjjYp3pUuTCQLb0vseA6mITH6ferXaSMgI
         SXuMhPD6v7AGWnyAI0Uvvz4JIShEV7u31vjjTIEYiJMx/z/GCdnINn8jgClo0RosGkWm
         zDwQ==
X-Gm-Message-State: AFq9FYI0ix13v7XD46Cns6+nrGNWkfH8SZfXPiw2I7tprbpPKGpl2R0h
	57yHndAGVHi6RWSzsda+qRSVDBR5sani/Y796ZAwPEbk4Z++OrHph3+Y9wApcLyDjw/+1vBeb2k
	eEK4=
X-Gm-Gg: AYBFou235QAKezaBxzI8WnGyAbZV9/daC4/8t3CkL1+QbFju/3+q/FgwE05xc6/M8u+
	VxJiKsmyUyAg1biYV8TYFH+gk5/CuYSgkUbG2iGLUtlHv4+RPWjiQbqcYt/L2bKS/hjK6CW2lWi
	WwS2CAQr8G5zFp5iRWPah40T9ackZY9WPwKEX13RudFzUwP12IFU8/GI3xpR5w94leJOgPhNf1j
	yXLbogdgj04XUI5zGbHa+JkvkwxghqTMyiEtdOVoCvdhsEQUTbAc25hUBimACaGQRvwoQPIaiew
	LjtSZTchEq4k8+1FEPr+As+tcrbt1CVTH6+KeWGhtLdLuFieaJwqFaVRnnqNh/a5xxXB/bwt39o
	4Nt/rAmxS5hSUe9qhyJ5oRizysJ/RxVrq28PbR4x0XmD+WKVr0UkdNQeN/DhfpUbLpdApm2lIhe
	V5g3gy17dwgOCItb+TR8fYod7MdVuzXVSZHOW3mwlCB5rGNckOvQyMCzWADgmxaPa6o7PfBog6X
	UQ6TWlbEIJ8JAZK2BtMKf32sWczaTZ1LVIyzDIokVAYYc8XLK/so+ZwGOJkFE09xnMLwq2RaJ2B
	2yCmGrxPQZpHZx3bpg2GZgiV+GZDHzZPlw==
X-Received: by 2002:a05:6820:16a9:b0:6f7:fc58:b7a5 with SMTP id 006d021491bc7-70ba0fd264emr1955413eaf.85.1792918514992;
        Sun, 25 Oct 2026 01:55:14 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e163a5dsm3904045eaf.8.2026.10.25.01.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:55:13 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 0/2] libfdt: Find a node's parent in a single pass
Date: Sun, 25 Oct 2026 02:55:03 -0600
Message-ID: <20261025085508.1622340-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make fdt_parent_offset() walk the tree once rather than twice, and add
a CI build which runs the tests with the single-pass code left out, so
that the fallback is covered too.

This matters in U-Boot, which looks up a node's parent before
relocation, for example to find the cell sizes for a device's address,
and may be reading the devicetree with the caches off at that point. On
a Firefly-RK3399, with a 564-node devicetree, the 17 lookups made before
relocation take about 7.1ms each, 121ms in all. With this change each
takes about 4.3ms, for a total of 73ms.

Changes in v2:
- Explain in the cover letter where the cost of finding a parent matters
- Only fall back when the node itself is deeper than the limit
- Drop the comparison with FDT_ASSUME_MASK, which has a build option
- Give the deep test tree several nodes at each level
- Take the expected parent from the node's path in the deep test
- Add new patch

Simon Glass (2):
  libfdt: Find a node's parent in a single pass
  ci: Test with the single-pass parent lookup left out

 .github/workflows/build.yml |  7 +++
 libfdt/fdt_ro.c             | 38 ++++++++++++++-
 libfdt/libfdt_internal.h    | 14 ++++++
 tests/parent_offset.c       | 94 +++++++++++++++++++++++++++++++++++++
 4 files changed, 152 insertions(+), 1 deletion(-)

---
base-commit: f99e3af0ecb67a9085478a9b8ddbcc25aa64931d
branch: parent-onepass2

-- 
2.43.0

