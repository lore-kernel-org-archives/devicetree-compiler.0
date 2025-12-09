Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA77253F39
	for <devicetree-compiler@vger.kernel.org>; Wed, 10 Dec 2025 02:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765333215; cv=none; b=VYR+VIyEKnllAl4T3UhEDwphqBi7NlEe1gadwupiQWI+aoiv7LA/LnWY3kzVXt3MFVs2XymUyahUFWb7FxpXcqCTvDLSjGDsOvaUdhy4bEC5K/+/TgTMw3n657IRHNS0Qtts8uEmUTnZJYElWB6eFscd8FaQs8A9+sWy0/P+pIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765333215; c=relaxed/simple;
	bh=sBmI1X/OP77pOecVARfUoCh+7LKqLuSrsj5RjK+6yGs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkBXfodgXocvsdYsQgZwzzJeEzk+mIP2j1gVJIN3u+VUqiWvxTq934w99T0A4/0OjmF9tBZhuFn1vYBnv6Gqpysl3dcUJfHwBudKC0cVrPDptkD5W11ZJKEv198XccOtC21nJFPW1w5q5OkJGrNeVLUQaESAbcbqzkq82eH4+lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=FXHRDJf6; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="FXHRDJf6"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45391956bfcso3587373b6e.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 09 Dec 2025 18:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1765333212; x=1765938012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTss3D2SntW3uui4TtCw3fLByfNqkazeU/OiubQQ7u4=;
        b=FXHRDJf6ZeisFTEcDngapjtgORbExfTLRZGAhZfvQ2CF3u5K1Yz9qOLigbu0gXuX6Z
         Wr7OzP0Ac7K0TKwNA7WUUdIG9tlmaDCjlFY8TU6cmJEBEkm3Ro8GyZ59DI62TFDMXVtO
         MuB/x9XLlm7k4g9T+K1oBmhvz6wRofMsuOEcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765333212; x=1765938012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pTss3D2SntW3uui4TtCw3fLByfNqkazeU/OiubQQ7u4=;
        b=AsZusuJJwv8o/J9yUpDEd8kaQwENIcPvCLf4PkWQMN90tYRDxBhkUcSR5iQvt10Rnk
         8J1ynpDF8SWBtPwe52kguqJKgHZQIpP+Y/o4m/qKlFb/asFIFUqQf3mwHfkaqeus/Ig/
         tr1QeL+6wwMPjZpLdaa+2mdqXvZYmBphSeycHe59zudpj88I8ZCv1fxiYEVyem56OHYW
         f8uVcfLsyqRgW2jQggohHj48QbU0DBfAxLp19VJX8C+FMpMllpbOY1kZalP6K3RZ68rk
         D8i+Hbx6hw3ftvvg4GhDJHcI+QHG69j2TVi7mx5G37YFY/om5grZF59ixvUSLswCwstK
         S1Rw==
X-Gm-Message-State: AOJu0Yzqr4MTQTXEjsBLPL9YbaJg7n2VqrGbJX0LcgoCHWDCvEKbGiTq
	a7qNNSpFHhZLfqUQZIQksPO6t8zQ31cK+jso0xVkJzsdH12eH+6+rcjD26k8KykVf/fKuL57oZ6
	Sw/s9eNw=
X-Gm-Gg: ASbGncuRZy9Oy/5sFwoDbaweIDVtg73wDB5uGJSza6ei2ahbg8tOo0niTeyra6MNRHp
	T78jpln4zREhocNIjlMuvRFOgRkgg5j80nxVgkKuiDhVjhf4CsrhMXa7Y1Vovn7DfwXbpWc09Hn
	Uvn1l1GzPAKUCIv6hMa/1EBBCuqaM3OS/TxNw9gnqY7IVfFvnsKtHQWObekOOahqY5OGWXjwf3O
	2orRtlGcbtYRLTiJpo/S6ZX710zxsTPhpVGGZ1zevjYuTl451OfYLqMjp3Y1Hxg6H3DYrlSzXIN
	rzjcw7tjiH2ao0avpc5LRTToT+riSMdA33XOYgYO5Hyx1rp9feFx3h63rdu6ToN9VwmqZUP8fu6
	yxOYhkfbojMYOXYYwtDSXvsJ5+4rjSG+e6e1ixIK0e0X6oiBrLevUdbXnGSX/w+TyJj/W9ZzwFK
	VoFcLIPrn9CQeEanxD3eZnNy5rxxY2NJmkXf4cw1Xee2yym18kC4Q4AQFkNNH3jSE=
X-Google-Smtp-Source: AGHT+IGE8XSGEIvz3iz5eP5E4bgV3iuNkXDUQz7paFXXDul97ZnKpHtGUT/rhyYgslAQ6iDR3pp4Bw==
X-Received: by 2002:a05:6808:c167:b0:43f:7287:a5e3 with SMTP id 5614622812f47-455863dcec7mr676545b6e.28.1765333211884;
        Tue, 09 Dec 2025 18:20:11 -0800 (PST)
Received: from bill-the-cat.. (fixed-189-203-103-235.totalplay.net. [189.203.103.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45587ae2dbcsm386346b6e.13.2025.12.09.18.20.10
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 18:20:11 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH 3/3] libfdt: fdt_get_name: Add can_assume(VALID_DTB) check
Date: Tue,  9 Dec 2025 15:50:53 -0600
Message-ID: <20251210022002.3004223-4-trini@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210022002.3004223-1-trini@konsulko.com>
References: <20251210022002.3004223-1-trini@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this function from fdt_ro.c we have (reasonably) some checks of the
DTB before we begin work. However, we do this in a way that we cannot
make use of the normal FDT_RO_PROBE macro and instead have a direct call
to fdt_ro_probe_(). Add a test for !can_assume(VALID_DTB) here first so
that in cases where we are assuming a valid DTB we can omit the checks.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
This is another case which we see in U-Boot SPL, and for the last 6
years now have had the equivalent check. This change ends up being a
noticeable size win for us.
---
 libfdt/fdt_ro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index b78c4e48f1cb..63494fb7ad90 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -306,8 +306,8 @@ const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 	const char *nameptr;
 	int err;
 
-	if (((err = fdt_ro_probe_(fdt)) < 0)
-	    || ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0))
+	if (!can_assume(VALID_DTB) && (((err = fdt_ro_probe_(fdt)) < 0)
+	    || ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0)))
 			goto fail;
 
 	nameptr = nh->name;
-- 
2.43.0

