Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918535;
	b=VOaihr7EIHBf8CSLBfAhMGJfcyg83nTqIMe2wkI/lGwogt151Hu9JDEE8ax+awL9UhyY
	 7TWvtiZR+Lv14pBa3BK1Bm/hCHlm2+JN4tkMnrJnJRtYppXT/65rFSCgS/rDWqti/ggog
	 61SuKqhJuUxppDUkiQtAHN6yBd8LMYyBBHPfbn8jiXvIhNryYsN0pjxzmFROH/ZY2e2xF
	 O7UoKt8YAfowmKoB0tqWZVEw7f7sJmKuFM/Skt/UjYeCIs2PDJhowJBF0Jsc63hBxNIVt
	 AzQHkW3XzCd/ffMLdZZ7V4JvvbtbjpK1sCcUAPqypHk6juYo+jtYnycTNEPeSGo963w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DdM60+rPq8KqUhWGcU2coVkDTB7HHh4+CeXbs9vlBOQ=;
	b=hJkb4wAhOT52t6zyUK6I+Jecw3rF6XG1AAMZe7nLJR9RFJq66L/VhG5yN/vQvpRrGVeu
	 RIpjCb1UFApjP2QL1fvi/vmX4RjtYy4fEByvXBl2pNLxa4XtkPCPEfYdd6bhVCQpOQSz3
	 FC+RkPrGRhetoq1hYZniDUbWRjOM2A1TC3qwBaff2uDgMDjjMQa/fzej6v/Ozo2aJVQT0
	 ajtg1stlsBmGMYp5tocu/KAgME5kXfCg76B83iqhZYQtKcxK1jf5pEXC9Ks0lLt5w/QQ1
	 DHka4jyB+fWZB5/p0PKkZhqcC6Ki2bT2EjnRwFug5EsMFs3LK0aHYqNn92ZpQI+5PNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j7n+Jggl;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8BF606A31A
	for <devicetree-compiler@vger.kernel.org>; Sun, 25 Oct 2026 08:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E8BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j7n+Jggl
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6df5e315bd1so1493782eaf.2
        for <devicetree-compiler@vger.kernel.org>; Sun, 25 Oct 2026 01:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792918533; x=1793523333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdM60+rPq8KqUhWGcU2coVkDTB7HHh4+CeXbs9vlBOQ=;
        b=j7n+Jgglib1otOy+qDvufP7st66WgYT8iLL7pMDcsGWMV6B83pZlWo301VnLZD8DqP
         OhHFN3IEh+w78czTL2IdoSK9nO2rkdI62gIRS6pjak/nj0bJMwWiUpSU1pQrweYfXxUS
         gmWCTw7qQq1jerKOppjQLAgANAizhMy/lidOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918533; x=1793523333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DdM60+rPq8KqUhWGcU2coVkDTB7HHh4+CeXbs9vlBOQ=;
        b=yiMZwJiDuO2tLBfNzuwDPGz6o7Bn2r/Z9OxrV5kTCQ4ujIqlJ7B4ZOlNkUNTdxqNF0
         +eYYkude968WO6zQoAiUbbHQGlKAmK5MS6KJcHKONvnuZExkxdBFUeKfcxiahgxyS6CW
         +gvJQexKIdB1Tm/t4gP9jwJlROGia+n7BMrt8BGhdO1TOyFmrElrNVCQER0V6WPpW2Jg
         z6hZqfrjCXFubQE0uN/cfBNVBCEXr6a6oo2A+SFDsHUm3/R74GIR2l1AgmQDnLG9bI79
         14O3CKt9bzaHJHyLGf8pHmVs5C4WrwF2YdsBZszeJtKiSvXSKwaRVEBHBRIjz3WxRhsS
         rTig==
X-Gm-Message-State: AFq9FYIjw7zbrvgZ24Sgftjg6Bkj9OsIK1BRVVGcSyXMi3MgjmzxY4J+
	984BvtLhUg8wrxaaHv2BhFca1nb+qG63GZ1pk/EHQmYwVIPErRbcPD/wbh8DWfspNDHA975ktkE
	I1qI=
X-Gm-Gg: AYBFou3WvHdd8ixJ2zBGXRg/S0KBH1v1b3GblUr2mOq/eio0GJ05lwSNom0CzmvHKq5
	asKVQzPHFul8Pt6SELth4gv13Axcx2k060bzgCBihMzvzVDgwC+wzJLYMebI+Wt+fFl79l8ne+K
	dJL0lcb7w4XTzCD6GJNZBmUFBlwBqfCQS/y+JhTtF2FGQ1yDEi/gFzXkMSbbrr2VwL3Szkp1g8P
	d5Vs7GXhjt+rZDLdBDHHqEYYsXbVkPEniy6LraTSfOudqGqjScmC4gBPtumTX6/vmofyHVxMmcs
	CYAzwNscbMTh7+w0ZGiUOcdzlUQo76ihhg25o6vtycDCj50SVYsCKFeIs08GH/7Mgu7lA7tNWZf
	8rmO8iT/d/XRWroSaeafGtDRzJpbZv243KJqFMMEVckEQm4boHydAsFyS4ms0QY4F6GRrfo89e5
	WWfOysIOdxY322t9m2pyF9mDBnWFSKES/vsqQbcvbpGSi0ZOtAwWYlIwkf2Yc03BuL7CDN6bVVe
	laD3HOvepm6MWDZOqKisnaTJVeMelBkpIfW6NNnJTLZc/J23sVw+KEpH2n1fq/ArnRTmWz9RzqT
	0jOufZj4qDxH
X-Received: by 2002:a05:6820:f035:b0:70b:960c:53d2 with SMTP id 006d021491bc7-70ba0b7f1eamr1919531eaf.1.1792918533553;
        Sun, 25 Oct 2026 01:55:33 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e163a5dsm3904045eaf.8.2026.10.25.01.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:55:32 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 2/2] ci: Test with the single-pass parent lookup left out
Date: Sun, 25 Oct 2026 02:55:05 -0600
Message-ID: <20261025085508.1622340-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025085508.1622340-1-sjg@chromium.org>
References: <20261025085508.1622340-1-sjg@chromium.org>
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

Nothing builds libfdt with FDT_PARENT_MAX_DEPTH set to 0, so the code
which finds a node's parent by walking the tree twice only runs for the
deep tree in the parent_offset test.

Add a step to the Ubuntu Meson job which builds with the single-pass
lookup left out and runs the tests, so that every parent lookup takes
the slower path. This covers the callers in fdt_overlay.c and pylibfdt
as well as parent_offset.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add new patch

 .github/workflows/build.yml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.github/workflows/build.yml b/.github/workflows/build.yml
index d5704d7..afd45e9 100644
--- a/.github/workflows/build.yml
+++ b/.github/workflows/build.yml
@@ -57,6 +57,13 @@ jobs:
         if: matrix.build == 'meson'
         run: if ! meson test -C build; then cat build/meson-logs/testlog.txt; false; fi
 
+      - name: Check without the single-pass parent lookup (Meson)
+        if: matrix.build == 'meson' && matrix.os == 'ubuntu'
+        run: |
+          meson setup -D c_args=-DFDT_PARENT_MAX_DEPTH=0 -D python=enabled build-depth0
+          meson compile -C build-depth0
+          if ! meson test -C build-depth0; then cat build-depth0/meson-logs/testlog.txt; false; fi
+
   build-macos:
     runs-on: macos-latest
 
-- 
2.43.0

