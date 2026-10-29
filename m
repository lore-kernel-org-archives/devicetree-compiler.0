Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266294;
	b=qDyBF4JKAGFNp4tNRnJZt5HVNsmefDHvvzbXwPfVZePPol0odcXMEZnQgspeGChwAsjO
	 IbOZPvpniG77rVWGmFPVjalGCtJdO2DQhoMoGI1OnPiRIurkE2no3kks/ojKCeU0O5VEu
	 tXb/I1ADmedLyJx2Quthxs5XURrAMvD7zhkh7izS0iow6WRrH86qQdhI+S14RhbBk8ldM
	 m+TlB23E940+fTY9qx2goQZnszDJRynqaQLxDV2MEPk+51LJM3iNW2YOk5ENhwVIUvRws
	 Id7BhnYmlPAwIZM0zw+Dx6IKHqb0QYKxIwKxnNSEfHDH5HlBnJYixEXQBNnUdoiMq0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FhV3qkW+5tFtVS8nbTD+PAmqTbtbhYYcfO+TfvDIDps=;
	b=OCJtMy5aV1m0nHLgT1Z9pSy35UuQ3ygK1l0RsKB3CRhFowzZ4I6fYdeaL3s1PLYGR9tr
	 TEGOnkRnyVZiPb9g/bT3TaRn/MFVXbDymRCk2F2b5rfwUrTBc+7FMA1iXZyyukGe9A0bs
	 TxQvvl38wTATG63ikrvpGosbktcfPWPavdG04T0R6T0aVkeVhODioJaGQkY9seT055n+0
	 BhVp7YKiExR7aVXZF2uD7W4CKaEJk8/APp5pjqKeMbAN6TUGpyFyli3N7U9w5uTwKbXiO
	 WAptyYWhuT2Q2iVnM0PZx8OXzZT2ojAF9AhuFVRRftwEjURHriUSwriX2g65HnEnGZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lDtrg9mP;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B275606A31A
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 09:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B275606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lDtrg9mP
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6de1fd5f572so924004eaf.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793266292; x=1793871092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FhV3qkW+5tFtVS8nbTD+PAmqTbtbhYYcfO+TfvDIDps=;
        b=lDtrg9mPpErW0MV67483RTqB8J99qxEUwxCzzO9cjVEbN6FuB1a6TagQQO9EqEW/eG
         hwTERvrf36kQ7u3VwSFS25qschhWKNGP6YW4qGN2ig9HLc2QS3CdYhMhWZUw/9jx7y1g
         VEkkQjyFpqcUslMCYoh68nSH+Mhvi0eazBsfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266292; x=1793871092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FhV3qkW+5tFtVS8nbTD+PAmqTbtbhYYcfO+TfvDIDps=;
        b=YDUIORgCiI+fsiFlZ6E3nFnqm5pg/0NicfncNC0cx76DPbpnZ+qsC1YakvkQmCd3ue
         mUYPCToBR8ICplzUMZI4orEA2n9hnIfBo2uF+n0/sJH5QQva985uAJi5loTs+zVONyPD
         a2HkVHzaahPSPt7ggmAHcAoErIDnokI6OAQWBeliCMQ4jWmz55vXhq+XkqHG0/WHb3ie
         pP6ebwBZz1BS70IXLXu4gX5QKCmQxEUfIRnjvhoIl9TiGNf8/+iI9UNmqPoEH5X+TVSZ
         z9N7D8w66eexTKDn1z+kzLjr6dfuGh3vsTJf4xbnN7btfl9h1llqwwWRozWYExVlvcPU
         6P7Q==
X-Gm-Message-State: AFq9FYIzpjbnKftmQjB63ixX70E9D2V6hzKxUvJCLeiqInoUlbU3VWES
	jD3s3QYdLK9coqO4ayNUPVhNUA3pIyi75EHvwZLQiCPGInXYTdIVvpE7brDU3+upN6AjNDbxs52
	fko9DKg==
X-Gm-Gg: AYBFou1tadfAsmhKlXXF39/6ipp7gN15Gp86XlBfL2VuXIj2PCt9I4wyrts408fw5h7
	MozTS8BA2pw4W7ihi/Fty3IY0Izoe0deBtujtjbkuzTuNDK/cyx8TcPP/V6VRkzMyKJJ+j9DOQw
	fUkjQHciOIeD0GWR5I88CY8VitYOl8FVWmDfKOhuIlZlGCzO1xb2+ISavVZH9kb4aoF2ho3v9jf
	quYHW60OO9t5xhzDjZbrbXUBcl92th4eKqYucLv71OrvbpX0F7YIs5Jbg2OshWHsRs6zmwZdicU
	jWLVbdpmFjxxmnRO9x2WmBXoA950aoYN4ixdVinwKFmJ5USEihQ3QnDjIE2E1YCCyF9pcsFOgWS
	UX1XBAFJIQFiX377gd4Wqa+CLTXawhV/VUXZWJdU4JUBRGaHpZGsdUZIyo8XHe+PP/WEJIai9RU
	vm9E/UJ3jHmkP4wcI6JNhGJtuBxsmCeQti8DaLVrdADw6rQ1GSOYgTBNe8TKUXBqOp0cprxBmPS
	1DaKxo+3pX9t89R72UIK8IEfB31ctWMp0r5uE4gbyZSEXiH5F8WGjo3qwEMh0UaF0XVube+I9S3
	dg32/p28Ip08hUiAhZbk71CdEVn8E4Q1oL/IHbEJfWlkbHyR9xxQ9PpycM4oFkcOvYMifPpGokO
	FFMnS8ngpbwDfhdKGg3iHuQ==
X-Received: by 2002:a05:6808:c12d:b0:55c:928:6a0f with SMTP id 5614622812f47-56383a92e05mr3483633b6e.52.1793266292456;
        Thu, 29 Oct 2026 02:31:32 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5a50281sm3715213b6e.7.2026.10.29.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:31:30 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 0/4] dtc: Check fatal error messages and document deletes
Date: Thu, 29 Oct 2026 03:30:53 -0600
Message-ID: <20261029093115.3647778-1-sjg@chromium.org>
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

Tests which expect dtc to fail check only its exit status, so they pass
just as well if dtc fails for some other reason. Also, dts-format.txt
does not describe how a node defined more than once is merged, nor
/delete-property/ and /delete-node/, and it wrongly says that dtc
accepts a file without /dts-v1/ as version 0.

I've dropped the 'delete' patches from this version - it's going to be
a bigger job!

Changes in v3:
- Use run_wrap_error_msg_test() instead of adding -m to dtc-fatal.sh
- Check the message in all five tests
- Add new patch to drop dtc-fatal.sh
- Describe only the general rules, leaving out the edge cases
- Drop the four patches which change how deletes are applied
- Add new patch to correct the description of /dts-v1/

Changes in v2:
- Add new patch to check the error message in dtc-fatal.sh
- Add new patch to document deletes

Simon Glass (4):
  tests: Check the message when dtc fails
  tests: Drop dtc-fatal.sh
  doc: dts-format: Describe later definitions and deletes
  doc: dts-format: Correct what happens without /dts-v1/

 Documentation/dts-format.txt | 40 +++++++++++++++++++++++++++++++++---
 tests/dtc-fatal.sh           | 15 --------------
 tests/run_tests.sh           | 18 +++++++++++-----
 3 files changed, 50 insertions(+), 23 deletions(-)
 delete mode 100755 tests/dtc-fatal.sh

---
base-commit: 6b0371afc5329d7f07cc4f1ff4c5e10b598fadf1
branch: delete-markers3

-- 
2.43.0

