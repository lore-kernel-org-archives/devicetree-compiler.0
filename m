Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102537;
	b=UoXvpgFGHQwtt01g+QqnkjERVW7FT6bjTnG2KGSHZgt4erWJlADaw62Vo1yRGoWSIuDr
	 aSMyEMi4wPDUt3c81thVs3cI/yxL1Q/TlJIAQ0a90Rp1EzOQ9u9bSqlMCEcl5+BNBaRwb
	 vfKediPtDCyUvl0ltm7pPCNfqAiF8u/BmKBkao0XH4iDxkwPhNqyVw7U9XNqd6AKq0yVe
	 41g/bBeK2Tnb/gBhpFJ74XE2cIsbnqawQEQr2sOr/thZc4KZTQOtHChUX0h8kGflhm+wj
	 9a5S1KvtXbHhkuRUhaPnYCjd6g12XWdDR7D8ig9b8jSZBzPF2kImBFFWDzAVs61YB/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nSwXYpnxS5MxSU6l32ci8CoczP5GoB+2KVqxhoikTqg=;
	b=Wqa0aBAZcTPqhowC3CFBSv8WktLZGwP53vBhd8lCmtYyWgrvvRZkxmQBVS3Rc8Pg5Xcq
	 2QBYyE0iXPkidyk0IxyiboWGEELg2MBtX5dXHrwyKAJ1b6EMk7VjpHmflFhn00qRCrF/O
	 iVSK6fJ6bD5ONsP5b7ImkiGc7tIWsqJHyYUKzvEAnd6B2Iaa7kEHx1EfM3w5sPHQTN66I
	 QVw1uZpJ+ToGTuBmTFOKNsD23PGUgRDRo7nAYDKQu/ijGnufdoErYUUuoMraYglMEFuL6
	 o5tPhhIaFeFs5BE0/5C2Ck4V6lPZfUkO0cactiwi+LFjIt7sU6LSu2SsE/c5sVCfmYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TXGycIGw;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CA606A332
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 12:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E25CA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TXGycIGw
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-49429181ce9so2268764fac.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 05:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793102536; x=1793707336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nSwXYpnxS5MxSU6l32ci8CoczP5GoB+2KVqxhoikTqg=;
        b=TXGycIGwzGD6gBAEq0mM2LcCdMz4fPvMyR4clyFiLYv4jTYT0o9S1mCgrtcvGvQK8f
         arTEaychl+36nLAMAp+xkx4eY4fZ0hOynAMn4lkG1E3ETuNqUk+Il458b421C/O1muXQ
         oYhfhFY8XCRB2PUu7rfjNFPknSaPYuxEz7aGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102536; x=1793707336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nSwXYpnxS5MxSU6l32ci8CoczP5GoB+2KVqxhoikTqg=;
        b=G6Qofsox7WN7COblgJ1objiQct1tPLx9CFGPuVoQATVT46Qb44WZ5qZSFcBTSHVYBb
         iW2yGnFniY2+zDBC10OfkH+xVzEZucbs2VZrnfyE24NN/Va6PAasifrVaq0yL9MWGOt+
         /hA9dZp6qVrhjEsLVBAIj1IY1XjXZwS4AHTNZt1Ml3LH4Py7+dOsVMWmlL6/08AKbZ32
         w080kbdvhTuqXLttTRaWkhnBGPjqDrAyt0nDz75ouOIkJOpfkczXd7JcvR1o6a9XPLDW
         ChIawMZmS9kpbB+SMU5KeibJrYvbHAL8fFRHURn7UQbbmvICYKnuK4dz6Y0bjLShy447
         Aoig==
X-Gm-Message-State: AFq9FYJuFC6VwSdv4iBfqNrFQP0XwTfixtty066jg7cjX1vz/i10iPd6
	4sEel+R60y3J4k+4KG3XUMmwkOrZ1MQsquDcijPaQvXUjUtVzyLNoomEDzuavgIvvyhyaSI3H3G
	AmjLuVg==
X-Gm-Gg: AYBFou3nkiplT5A1sDhgzOzDNR1VOxwRghFxWa+7bYmRJCxNaYq7AufyvKgW/FJkkHO
	4N4ppCEtnoU45X5YutDFkauaNfFuF40Af/5ModHcSVK7j8RVnxVBwHz029HRG/AOxLWBohyy1h4
	6kg6CJvuN8dc6Hyq8gYSFUn6z/z9cSItX58EJxceLiNNTMGxdZ+SibRe7712w7UQSbdbdVb+77M
	CPaTeQ3w7HFBNUqiMwtGl2rewKjeGJB6v57UMaGtR3IijFCS7PiJbsh8yEMoqjzTgL4EH0aum8y
	Tv45PtUUlZ0JsalWKHZqOwriI9FjmXgrgxezYUoDZd4ZWSwVKFopPBIEdrL6Xl3XSUoVri+9UxF
	ZcFh3BXTw7M2vuxc3vArSCDwiRv04wzK/fOOzlmR8dBoFZi4s9MKeeB40Mor5wbrM+w39qHFr3J
	pTKU8CxZlZOkYnA+JAKE8g6IPU7PgoTLGJRDee3Lxm5zcwqvh1+79VqMWTnaS7RDmxp+8YzdO8t
	4fE0MBFedcqS/kkyGHM+5NOmVwKS+7lfKiFxKzGl2TXOwueGyO3zO+/R6Tx9u2sX533AujGg4sa
	QYgIsARIB53oCm8j0qnyUsnWF6q9LJ+DBSfqmEuaOzR5srZfqg6RYpOlI2WvzA==
X-Received: by 2002:a05:6870:e311:b0:485:d1ab:7938 with SMTP id 586e51a60fabf-4a83f588c9amr5951306fac.25.1793102535619;
        Tue, 27 Oct 2026 05:02:15 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8431c012esm7133755fac.11.2026.10.27.05.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:02:14 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 5/5] fdtput: Correct the description of -t in the manual
Date: Tue, 27 Oct 2026 06:01:19 -0600
Message-ID: <20261027120126.2613353-6-sjg@chromium.org>
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

The manual says that the -t option is required so that fdtput knows how
to decode its arguments. This has never been true: without -t, each
argument is taken as a decimal integer.

Correct the text.

Fixes: 4d09a83420df ("fdtput: Add documentation")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/manual.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 00e361b..d466645 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -769,8 +769,8 @@ is performed. The first usage adds or updates properties; the rest are used to
 create/delete nodes and delete properties.
 
 For the first usage, the command line arguments are joined together into a
-single value which is written to the property. The -t option is required so
-that fdtput knows how to decode its arguments.
+single value which is written to the property. The -t option tells fdtput how
+to decode its arguments. Without it, each argument is a decimal integer.
 
 When writing a property, the node must already exist unless -p is given, in
 which case fdtput creates any missing nodes along the node path.
-- 
2.43.0

