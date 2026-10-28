Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186416;
	b=DlF6NSFMxdBAVr3ArQmuBzX8OomxUreYq5Om3SFqXoskb8HaSwv3KVtSQ89WvKdaT5rb
	 ddfXAq5V/P3Kie0WQQnDlw9GrmSJrQGhSdw19jq+7peiwtLuQumHL1QULQzP2+LJgTwe6
	 v8+fnkbxe5ybHnaM5jkyd/N1U9Yk3XWR58niSwzIThdpHcmr2EDj9aYJ65u/MxEHZ1IXl
	 dK+5kRNfpsmxjSqY4NgZS/ICY9ZUGIG4Riz+CCIRqjYKuK6V7TNzHYGVwSD9kQ6lW2saM
	 YJxjGe5Oy2Vpf5WSVLdH7cxW6dx8fk80dc7EQwTrL+jB5KH1Nlp1/ImYzCHdMRC7j7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KJfydoM715XBhVdwpkUL6wr7fXkZIy/1IOB59zgC0/0=;
	b=zqtHhE7FxIMxnAsrA9yG6DpU/i15TgVV7YJW56Xs+1jqXo5r5FTCRLkilINAR/WVe25Q
	 u1h3Yue5Gns4iJm6qn7lkIJWce+0pjVqvkau4g6nTa5OI4VZOOz/2RD37Xx61eZBZAKhQ
	 PZYl9262vnFevVl/BjFsWfp5qriMN6PKXcdjsOtRR0NMFNg9Eg9cs56plENXbHf3/uDWc
	 l+vYCtQKVyVUhpknigyjhc+yPnJgMkrN+uWtUYCEFEGlyQ9GI5smRxeR+/Ltl+2ANJeUB
	 cb/Wy034qZRRm2jexrIgQA+3Q++8xnvtWKvLJViiiinvIQaeAllCQsg1z+tWrw1+Ckg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="fc/pHdaT";
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7EB606A31D
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 11:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E7EB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fc/pHdaT
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6ddef424972so692658eaf.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793186414; x=1793791214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KJfydoM715XBhVdwpkUL6wr7fXkZIy/1IOB59zgC0/0=;
        b=fc/pHdaTjMjCELOpJRNDZi1rJ0iUVPy28R/YiJzhSDckgHYnjIT9V4sjN9mP8IFFZ7
         cCuotkTyXG0gsY7HcfB+nBV5mYM2P/C+E4WUbjSN1rKAP/mcdad+DiuI+opjJvHhs4Bj
         w9LUjAEVU5NQZOeHumx55YqckuZYaYHOkGMQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186414; x=1793791214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJfydoM715XBhVdwpkUL6wr7fXkZIy/1IOB59zgC0/0=;
        b=Q3OmvS4HFPmSVUBzj6xTRVcb7qjPeR0puiJ44ZQgWiuWJAqBLlJDJr3uyVIEGjLIRH
         Qxd3LA99kotaxFP/2mXE1QkrV6m7xKE/9Qupi6IsyLAoi1UEysHMRC9ERQOuEvzwPCG8
         C4Zjd1frMN4Z6Z98IYIkCTyuO+Xi/GLfyd0bEqaL2NgHyCtdb7BjaP/i79eUfwPQNlYS
         vCY2lqd6RPnyLqGw6Ge/3EnCgQusi0YN+eOJeQIM9u5vcL5cngZ5xXTl6Hbw/VfJps8R
         /g3KyicC0ZxO2DZ1rbZG3b+01CHYd3KwPg4Guc3DhoxzHzTSIs61JS2Z9xC9+BZZQLsT
         YtWA==
X-Gm-Message-State: AFq9FYJAX8z4m5a/i3TFtlnnhXOjN3J4wPE+OwOoIZPrgLrEs2fDWxNs
	2N4BhvhRCIqiWHU55hZtxC6ZWu1Aky/2/D5EJpuX+pOwpg57qCdRYJFU4IsdCCrslVljHYIEnNO
	4n059nA==
X-Gm-Gg: AYBFou22TjKfh7+u2s6c33FAAruU59feEvk6USF9Ws42EqvFaaPAqWTphoLtRdPjJPX
	Rtw6PcH+aTThqFLO82oHfE8aBtY8rAj3a9UsebdD4qSefIDbICuj37gi2KYblhs0u7DNc/uEZy7
	aKFRjIZ9SHOE9wZoUmTN/8OvPo+sgGzQ+T05xt3LThbnrPk+4sgiw6Ey/cO5V+xlLS8lBztJfOX
	sh9ZtiMaYHFFXivgEyEb3OhPSSVy8cnAqfEtXq21vtPm2uF/MYMTi2QMKlI4MR5VXHlgvk7CCfI
	/qWsxbM7hysRAIZvxPQXk3PdirJF/WhhvY/3kPYhdpbqpEZUvqEY721soQ4XNrnPMnqZRL0uF4k
	8okkBDeLhSBJBwDAJAQ3+gaWwjvgmlDAx/k5tuOONuqQJdn4EpKL7LTwUpQZXgD/oqgF45nC9Cn
	v7AVbKwDc0pZr2sx3YCYnD+EOLx76Gbg2BEUf/F7y4PR3v8zMm8jsFxvt2qV6RngsJgqwRUv/j+
	qOMvlNW3PsG7ucGYf2DTK4XdM5iipyt30oo0Ha226wwkJ21KnQh0aKrVrh74JVQqhK5XOlZkuoE
	LvNy+Y8FY7KeMmZci9f/5WjcZIkicGYEcLbtntIuAK+BOjlcdap1QT31/sStt1k7JkZVUttCPpr
	X7YVZk2g=
X-Received: by 2002:a05:6820:560b:b0:6ff:fcf5:40e5 with SMTP id 006d021491bc7-713eeb52967mr695060eaf.46.1793186414314;
        Wed, 28 Oct 2026 04:20:14 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142c736d4dsm1150140eaf.8.2026.10.28.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:20:12 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 1/2] README: Explain how to build with meson
Date: Wed, 28 Oct 2026 05:20:01 -0600
Message-ID: <20261028112007.3980089-1-sjg@chromium.org>
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

Building with make is deprecated in favour of meson, but README.md only
gives instructions for make, in its Python section, and CONTRIBUTING.md
says to use 'make check'. The meson commands only appear in the warning
which the Makefile prints.

Add a short Building section to README.md with the meson commands for
building, testing and installing, pointing to the Meson quick guide and
to scripts/install-deps.sh. Use meson for running the tests in
CONTRIBUTING.md too.

Closes: https://github.com/dgibson/dtc/issues/83
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 CONTRIBUTING.md |  4 ++--
 README.md       | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 9742dc3..caf0210 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -17,8 +17,8 @@ works with pylibfdt. If it cannot be supported, put the declaration in
 
 ## Tests
 
-Test files are kept in the `tests/` directory. Use `make check` to build and run
-all tests.
+Test files are kept in the `tests/` directory. Use `meson test -C build` to
+build and run all tests (see [README.md](README.md#building)).
 
 If you want to adjust a test file, be aware that `tree_tree1.dts` is compiled
 and checked against a binary tree from assembler macros in `trees.S`. So
diff --git a/README.md b/README.md
index 8f1a5d2..ed9039d 100644
--- a/README.md
+++ b/README.md
@@ -8,6 +8,25 @@ dtc and libfdt are maintained by:
 
 * [David Gibson `<david@gibson.dropbear.id.au>`](mailto:david@gibson.dropbear.id.au)
 
+## Building
+
+dtc and libfdt are built with [Meson](https://mesonbuild.com/):
+
+```
+$ meson setup build
+$ meson compile -C build
+$ meson test -C build
+$ meson install -C build
+```
+
+`meson configure build` lists the build options, e.g. `-Dpython=disabled`
+to skip the Python library. See the
+[Meson quick guide](https://mesonbuild.com/Quick-guide.html) for more,
+such as installing with `--destdir`. `scripts/install-deps.sh` installs
+the packages needed on common systems.
+
+Building with `make` still works but is deprecated.
+
 ## Python library
 
 A Python library wrapping libfdt is also available. To build this you
---
base-commit: 1d50f3f8fa8bf9429eebb0769dafa5df37381ae1
branch: readme-meson

-- 
2.43.0

