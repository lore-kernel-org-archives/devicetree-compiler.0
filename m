Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102534;
	b=GcpTDYirfILZCMGBVwb0lBmvBLli/bfRvMgQtHs8LdnIN5SWmzF/B+xhzvYPA2512MRb
	 gbNt/68JMny4k1m/5rgfqYQAeQhPGy/8GKeuIlQJYd9asg8awsmvyaI4v+lZ1PmTWYQqz
	 hTPrzFhP3FZyYEJPlYgvQ9yqme0XM9z7/EI2Ab11R0UlMne3381jTFaygOS6RxBORgNeE
	 N04xuLW8bChyAOaQ6zJfTtGMSkDr+TVltbIZ7VF1/3awhR4H3Hi0OasM8MRtkhTeHwzmt
	 Ox+uPKVO3LZm3xEJvwXZKa93QDTlWBU3G0+swKWvz6AXzt/w74T5r8jfBMRtEw4PXbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zOEqjGr1/damPbYRkHq6YCPYtc9LTXsvzD+xpnarzH0=;
	b=46hUm7e9kJwnYKhbRNYwHYa3+GQeBK6FKzecA8QAjRqrUXaYgGXlrtC8Xr9jw50piJZ9
	 Hmepi8XK6eQhQ8OO3PH98eU4xklsBTaB+ezyUfspYB7mNoG0xdFDUzd/J15DXzV9fI3wl
	 fHibYZVeBXY+dvI3nAUtqdbeB03uAmrNWUrcnvmeEBFNnIqT5WC6PkDn4swzJHQxEQzhI
	 mI58uB8rPFthi7keLdR5Hi8ERDSAncQ53YnIyXG1g1lsJ52pikFzIyAjqn08YyhfnJhqC
	 3AdRd5Pnwo1955q3N+pvDkkzIsuVLgIJYWqy7W776ZNTFSZuHRNUBBX/O7sblwoE6Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QJaFFJfb;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B2C606A327
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 12:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B2C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QJaFFJfb
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a75a5fa32dso896930fac.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 05:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793102533; x=1793707333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOEqjGr1/damPbYRkHq6YCPYtc9LTXsvzD+xpnarzH0=;
        b=QJaFFJfbOJzX0wQtcKeSwC4h6g/oVTfSc6A8Bmfkb/84LNktJPQFobukh4BFvtL8Xb
         EGypcLMnGXcgSAcQlyOqXARap4+dqPUU+oU0zZyD8Ot9GzcHk7GO34jfIwn/soKVGm7O
         iF+a+V9MBEgX9xSWqdRFaCWGTFVzZ+q2UcW80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102533; x=1793707333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zOEqjGr1/damPbYRkHq6YCPYtc9LTXsvzD+xpnarzH0=;
        b=ECpL4w7pPmmkPkny2czSiH1N+tWKKo/ZndzM1hF2E4/k5nMyJquY63Ob8ltNCeywaM
         S4aTPjFpLWhZyGSa+bAC6NL09m31Pi5stThlQMO47JYvXYJqTum/LRByG2+ICABnm3pN
         ciYzj5HZDL5FqXjj5ZjWTrxodFHJ1dX1k1t+zz3HLvj5Ce8OwWvGuocfagVpfqPpXPlv
         +iWmAy1SRx3/fo7B2/P6t9Y2XaMCRQZPEghq3mXU6uKDLKWRBEhyg87k1N5sgFXiNvcu
         m14aSZ0iAc69zGLl48pZkPtG6YeRegSHHyhcxgQjFUEKVzFd0pkB+FoZ5W/uWcURBU5w
         I3YA==
X-Gm-Message-State: AFq9FYJV13CHkcHZpR8sn3Kgt/SCje0cpB8YmjiZNsD3is6kT55YfEHf
	CmLr/OUfm2OhRMei6HX3RqvpwhitkNY6KRalrg+407UwqyVLdnYaTTa/QR2gDF+8rBaTifBeSYY
	UzEAcZw==
X-Gm-Gg: AYBFou1NKvu/Apa9S1s3ThSlZ+iJRmUKu0wiMb4M9wB93s/KLayiElDVF4aIDfSxeDm
	2DeE/pwprPs7u/vSfh2M2eks4uWe1YW9w8gIJrD/61YZ8DrXwYsdpeNkJwjzkjLE8AlMnBTGQxF
	6xGQxlEZLfrR7BSXiwm22YJCi2d/hNWD+kssSfinS4+b2HU9s1SDNpszVLHgItOhDtM8nAaeUyZ
	pi1J5W9+4cCW7aS5J0G1skzlEyD+nk2gnUX3YLQGKBcvfkIZFlsICyNwkOnXSHXDWhA9z4HRnAS
	obpZcUgh3CNxOjVVfal3j5YrQoVBlc8CdMudtEdsupMDIyLDq3Z/q1I2hmXWBByW4HZokUgyJtt
	GbZ4HtrTdNDRj2k6hlGWF0YtDwLVrVrDPvtdzI8vGD5niPnFcY5YJ2SPJpnwBi9XrR2ijA/9IIF
	xkqZHkpY9p7b6KpVCDxwvdSEedb7Sf6///EG79KGxdv+OfeJ6ER5UtK8D7aNS2iCZ0m6086uiyJ
	aycUVNKELIMZGzYTCoMYUiPGeLibW6mBrAYa1R15Ibnfzc69+N8bh4niIN4c50n0HOcKNYT6A66
	jFwHVVRLcjOB
X-Received: by 2002:a05:6870:326f:b0:4a8:1547:4da0 with SMTP id 586e51a60fabf-4a83f4b97d9mr5508218fac.32.1793102532920;
        Tue, 27 Oct 2026 05:02:12 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8431c012esm7133755fac.11.2026.10.27.05.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:02:09 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 4/5] fdtput: Name the property when it cannot be deleted
Date: Tue, 27 Oct 2026 06:01:18 -0600
Message-ID: <20261027120126.2613353-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027120126.2613353-1-sjg@chromium.org>
References: <20261027120126.2613353-1-sjg@chromium.org>
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

When 'fdtput -d' fails to delete a property, for example because it does
not exist, the error names the node rather than the property:

   $ fdtput -d test.dtb /chosen missing
   Error at '/chosen': FDT_ERR_NOTFOUND

This suggests that the node is missing, when it is the property that
is.

Report the property name instead.

Fixes: aa719618a8b7 ("fdtput: add delete node and property function")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 fdtput.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fdtput.c b/fdtput.c
index c9973d5..8636d5a 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -334,7 +334,7 @@ static int delete_prop(char *blob, const char *node_name, const char *prop_name)
 
 	node = fdt_delprop(blob, node, prop_name);
 	if (node < 0) {
-		report_error(node_name, -1, node);
+		report_error(prop_name, -1, node);
 		return -1;
 	}
 
-- 
2.43.0

