Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263B736C595
	for <devicetree-compiler@vger.kernel.org>; Sun,  8 Mar 2026 13:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772977187; cv=pass; b=sC3WFfauB6aMPVlOTSDmlK747ZdRXHzVhqc3Vm4zla3nwktfVEeYnd/41pY7Y63+WGUEbLprSVZeRG6ltd7Jcf6twzneHhZY0cH4/TuiwgsVvTLOrSjylTZ1ZFc92I3P8x++lYhjW3kEFafJkpSZ53RpMHWg4diAG679J/lYBak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772977187; c=relaxed/simple;
	bh=A8/TuqJuB/3eg6zL+kg+vfL4HUhTWpTDhV54+pBJJGE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kz0yBNIB6q6WbGcSwDDwfGFxP5HhGOxb8yc4//GASPQoTh8i2W6bNK93vi9ikg+hDBUnL8TTfrDaQfCY2hj89VjrLxmA8BU9j0QqdEfn7svYqlPuZzknLNuhZw0wZiOxB4ne6RtOpiyPl6PTrX8Hv97VPozskskOsjjJLKIghLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cY1/NtfX; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cY1/NtfX"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so9136425eec.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 08 Mar 2026 06:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772977185; cv=none;
        d=google.com; s=arc-20240605;
        b=EirXC2ltrvzLjNG8FEECbzQkAGUeLYMi+IqeNGeyKuM1/tIKJvTrf5dxr6dWnIWZlF
         YBxmzCADbMQRGTsn9AjOSteEBh3+LjKBqBj4jl2tDbg4JYonVeeiWNdU9p1scx1XeT/r
         DMhzT/yUCFjl3leHhNC7kQblNyS083tPOKdkiTdjH5Hn5KlUFGxVkBOY85xStmUmFG4d
         38G3xztfIQPl3fLYEhepHMyhuGqK/HtOMCh6RThG39JvUxWQChb2j4WDb6NtNeKisha+
         2IMziXHnSUneCleDOmTmphlth6SE9hct1s8kItX0355E04PXIG73ikbFZVcRd1GSRh7Z
         LKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=A8/TuqJuB/3eg6zL+kg+vfL4HUhTWpTDhV54+pBJJGE=;
        fh=roIgXwCPIwILRzTCeOhfsLPDAq2C04HXGduTt+LKdno=;
        b=Y1NPZ06Kh08QkKFr0n3pSSmg3S/vZcCyuLzM2PmSf+sG8NJ5LTyMi5ry02jPJlzSNc
         msl49Nmrtp9vp/z11/VEwmMBS29OMEdbnL5qrR9kzQsOtL5Kakb/28dNFVE07epSohqo
         j9IEAOABe7YvI/lXAwntbkS6R5PQo0r6WrQaDKHAr4hRI54ElJFBltVOd/0OtO8Pw40b
         ucmBSpbxqKM5rLQxd4rw1uKunUMusQ8eKgKBGz0s7OpFEYU0kjsZvA6Rr6ToaDTQTDFX
         EZQOsUV4r2wGnTfFlz74SGjD6xuPWw8ERpKKP6Pa1YE5qBSjbuwT7yDhdAGPjU2NMVNE
         VhSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772977185; x=1773581985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A8/TuqJuB/3eg6zL+kg+vfL4HUhTWpTDhV54+pBJJGE=;
        b=cY1/NtfXEA2kTPP2RZs3bORBxVfpeBh8VvEqQ3gnUEJJFvsv86/sMoWQlxEXc/Z7OP
         68kMQo3IfN3+AT3R9jdT0gmfjo5TdjwBy7yeQcrArenOHBoXCyLME0CWzua+0gqUPAs5
         pCdL3gIfwKeqCWu7K7oiHoaG4KU/cGTGU1jmJeb8tXZqI6qnHoh6/CGha9sFuLIQiCEm
         WzXmSHLKK8dv557JjFbKazezpP2PxjZl6QUhY+FeVhzIkTi3qHyHzHzwqiMaHHSYP7I/
         PiFuNd1+aaNzEFg5ZI20hY+T9/WenHFKlQrey6b/DAkIf3Vk97SurIJtaSUdwc03kXNt
         mmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772977185; x=1773581985;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8/TuqJuB/3eg6zL+kg+vfL4HUhTWpTDhV54+pBJJGE=;
        b=cLRMwWj+pVLYPlphPKaDo0DTTz8ICkkSPitISLWxJqephdWs+54tlVLRv5XE/l+sCg
         1dYjETaFsrXK3kyj3hkvx/Ah+cnwVS9P8pQImzzMsE/xUVg0Yd62X14e12BZ4QJK5TdZ
         vPBK3CxT/zDzmax1BnDeZX/Mz7QT8cQDfS2KYJ8oIT4IHhi2rcwTWDuf2BORUMegU97M
         uip9B5cBck8GCkH7mDKfJvtskdzFULjFfzx/HMiZWBJgkiQhl43uCyiAkXvF7BzT3QOi
         sd0u8u9+GbwcuHMDn1Nzfg+0yspYWz5mzSf12gc/8XLYxl6skFaROULakEdApSx7i0va
         jhFw==
X-Gm-Message-State: AOJu0YzcTWdMRt+RYJJZmyhYIchk+o/XQskBELAN8uhN68aRpClSR35l
	jCyGnSZm1rYiyfEYKRHo6KJW4CyfRqcJBFApsk47BhZPnrjYMS415cCM0JwhoU4wHlC5o0K7D8+
	Nd8gWN2lVZygd3dQ9XoSexL3y9iV75tH9XX7NXLM=
X-Gm-Gg: ATEYQzyfn0SRvCHtXXXUN68tV6xDnlD2jUflmgiLQuXwnMcTwYLzMoH5q+3HRM/CBWR
	ApBH5Lit+wWF8uQ34RJHj9p5DljYh0rHBWQ96ppMy2selR7oduwBjxgfW7btqPSUjRSZOEkUuQb
	/8z9k9OGV6LLigAfZeEBmendUZyOcsaG2kJHstjN1CU44EC9WjhZwOOu7eg7DU2Yir3QGppYKqs
	cGUWC+9dkA+w9yARzGfxPU8hzJxlo9O3YUKWDFioIA4JzVM0MmPKRa84rycvuJsk3lq+UsY5FHf
	qL1kqiI=
X-Received: by 2002:a05:7301:1286:b0:2ba:6a79:f04c with SMTP id
 5a478bee46e88-2be4e055dc5mr2978810eec.18.1772977184976; Sun, 08 Mar 2026
 06:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Sun, 8 Mar 2026 15:39:34 +0200
X-Gm-Features: AaiRm51HYT3LCmlN559zEfcVWrXrj_HibvWvoKaJbO59GQI79CcPSR20p_YQyaI
Message-ID: <CAHuF_ZqwfZ9U5FBG+BQdmcVzESfKWvghCL5nc8sqzzzO0VBDYg@mail.gmail.com>
Subject: Tag a new dtc version?
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello,
I had some issues with the python bindings from fedora, and it seems they
are behind the ones published on pip, since there wasn't a release of dtc
for a while. Is there a plan for a new tag to be released?

Thanks, Yedaya
