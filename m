Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0417815380B
	for <devicetree-compiler@vger.kernel.org>; Thu, 15 Aug 2024 21:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723758973; cv=none; b=VwUR0z5eDRVnlcX+l9hSkBOAX8I/Wr49COlozJnhyidck/XJRYs+uSV2uuc96qz8dpCJ/wQaSrPDv1E1nf/b27Bd/roJFfM52Rnv0LX9JjXnnbWOn/Z/MLPk7rtoyDK+eSpkN3UKzTmef8uVsUh6hWWhbe46urGwmMpMC89/BqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723758973; c=relaxed/simple;
	bh=FhmCyMubrocWSHgEucRt3M2ievPY4RRE2/QUXFBA4DY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=V97GtpRXLmOSoDm+hc9Mfv4ZkFaY/EYirfH5SpAbZnRG/TTOhRezTOJyPeJGZErP/2esgZOJZ/FgjlOWTndhrDxjo8L9TGd4Vui8TwIsSgx2Hdj4zDbAp+A/YJZ7UJQh7Mgma+iKtxwDgkfJlvhl7EVGZ0zUYXvs+w2UsefH/YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EP+ojQc5; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EP+ojQc5"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f024f468bso1642915e87.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 15 Aug 2024 14:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723758970; x=1724363770; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FhmCyMubrocWSHgEucRt3M2ievPY4RRE2/QUXFBA4DY=;
        b=EP+ojQc5hOvuBoLZFJMv9rQEdVPznq+7p9dcWdlkgnSHLaz5S6rssycyAhF3mEED46
         d7AnZJkXCoqcOnwsK0VWJwYzDkHRL0xUm9VCAd+12hKc8zJ2SPujWeZkgpCHgsfiQF90
         alU5OcHwhdU0vwIdtD0PSOOBejLIMuwtBTNvs4aah9p8GRz3O19Mv0uasLdDYcSeEQa4
         y/+wMkjw/wYXwbBgsCORDN+/j9+sPi+PNF853f2WhQN6lUNuygvFzFOAtA5Y+HGk1Zqb
         8SksWx/gf37sYe2fyImayrCLBv4muGvDH5bF0iY/dj8SjiMXxpLFF1MJpv80qgkTD4/3
         ws+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723758970; x=1724363770;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FhmCyMubrocWSHgEucRt3M2ievPY4RRE2/QUXFBA4DY=;
        b=b/ieGoky+VkRnr2BBY3td7QU6oh8Og51VwDFQbWBkRpMyu10vY3PiU12KYkoL6XIkC
         ThOcMCjHM20hA3vZnYF07EQhzjBOHGrW3ZOfGtbtgBJ6ruwCzZaZ2DIM2cuSOOq5WSuz
         g6GFdJvvDiIN3xtJgL0wPZvZRCv25MMqZ77gQaSZ8JZ+s15DO2fyHjsaUlpi2OotehJU
         rcJM8g6Y1Kyjp8rx8NEsepo0Xlc8UL9uoePk01rKd5nZfx5Ud5200QWdDZdZuqgi4FYB
         BXlFfkzLOUvIomq07BLtLRGF0rR3QyznOyibcrR2feW/iSNItObn5+S2NcXSFMTtFYtG
         UZ8Q==
X-Gm-Message-State: AOJu0Yxh2wbul+uoSxMDwPF+8J4ScTFszBIl5pz2amnzHxMZrn5keCW6
	5N4O3fUdu+d19ufGGyI/uWmIke694WgbwjHHI66wsk3GmXw7t+zUgn0V+LJ+mXRZKgJJz0DiOuL
	LvbormgqEnuRKIzx0XiMvB43MCuHD
X-Google-Smtp-Source: AGHT+IHk7r0E0+mNfngeiQiMNOVz27N3Q2saWgbx820srEIl60Q+XI4tZHwc7xUcnDzlhnBhpFQx5LenZXqoOKDSf4Q=
X-Received: by 2002:a05:6512:ad0:b0:52e:a648:a72f with SMTP id
 2adb3069b0e04-5331c6dca2fmr599006e87.45.1723758969640; Thu, 15 Aug 2024
 14:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robherring2@gmail.com>
Date: Thu, 15 Aug 2024 15:55:57 -0600
Message-ID: <CAL_Jsq+iBgjfZsJP6FNOMecVuER4suDSkSgvCHjc2Ys4=zqv8A@mail.gmail.com>
Subject: new dtc release
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

David,

It's been 1.5 years since the last dtc release. Can you roll a new
release please.

Rob
