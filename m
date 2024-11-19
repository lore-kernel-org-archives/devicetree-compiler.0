Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E943198A35
	for <devicetree-compiler@vger.kernel.org>; Tue, 19 Nov 2024 22:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732055484; cv=none; b=fNo3u0JrpI8qe6GEmDD0uQzWLGtmpNc1nrbos8YWAOwfQ9n8LSJgSi5RuVF/qZwanqA1BoRPiCbI8feF9ckEY+DSuvic3G/894C+r9dzLLYroQUbpqaBCCMpRt50DeulE8aNM7YDmE5cZP7mUSAo2kDSG3GVqAXZ7sDkEOxQapc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732055484; c=relaxed/simple;
	bh=vhVsJ/Gj0gPbu3AL8WNVRDi531a0NbM0zGxgYZyQ/2U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HK1hJ896y7snbyif2s5+K+Efz7t2yzJ2j2/iYBRsgizUEJWfVEBU5i4Xo2ijQ4F08AdJyzu6o4DkHitDWHjSsS2Ge/p3cm0KweLZMVSM13M/QYfBjR188IoPyKbnEgx0Gx60hGsBa4oTIsKURAVAy3zdjhvvg9kp5bcU4u/ooo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKf/i5er; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKf/i5er"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3822ec43fb0so3542029f8f.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 19 Nov 2024 14:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732055481; x=1732660281; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vhVsJ/Gj0gPbu3AL8WNVRDi531a0NbM0zGxgYZyQ/2U=;
        b=OKf/i5erMTf1CvVq02CND+CMhWcMtqHEaImYlqU6Y3k1dShW3OdBOu+D5914WT8EY/
         FLDvBMNY7ivuLXkosvJpgd6hEw/NyeiH7SC7w0WPtcKy4lD31rp8CNqv9gkUh2Ipe5L5
         cpnRw6hyvkuLA06vTujB/0SS7GEc9zDVgnnwQIAVpe6C1YuAAJw7JsZeI97o4XK1H7nR
         Rcs6l3jk9V3nOkJpyiYSkKLYZi49ta0ZBU0OsXDbvx+YSXD88ks9LdrqAeF+gtqDpHeE
         xyHG270eUFPLIZqjBUBglYYC4aIh4YCP9HZy8QQtQm4xQDD0x/OGln++o5qtsHHKhIFh
         q9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732055481; x=1732660281;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhVsJ/Gj0gPbu3AL8WNVRDi531a0NbM0zGxgYZyQ/2U=;
        b=Po91Ej931ME7QBLY0A29/1EnQV1SLDhKC693HdKQD/nUDJNeHNCs6mSrULpC5Gf42O
         sVv3cPMWXcxUWk4imYFF+3SzXncYZ9HiBfD206EJjMwhjwskj1I9CUjtbl3rX59dp0Wn
         +HxAH7/gUgjHHqOVsmSOY+7b5AuqBSp7/trwhxuJh3duqriLy1FSvXWmo7T8ZXPhY0ta
         ePX/w7gbC64Tr+r7wk8eVBE16UIIC3s9B42s28IOchFTT6t1lwVuYAtXnn5M5zM0LBje
         XgGd7Z7gNOY6mSFLxIyDDiox5Ur8GyVsO0mDGto/j6acY1SnulBw5/z2fr2vK9lw7TeJ
         FX4w==
X-Gm-Message-State: AOJu0YwZNK5onXOAVDj+t/RX+dPWaE3qXPm/huOSa/Se26y+UcrWck6a
	nU1DKHpOWa9O19j1BPyYwkX/8PE2/yViE13/aSZNkYdePvJSDrhwFGFQa0KRoYlXXJlVKbgUvSo
	hPzbPahQREEdLVhjwdFpya7l7wQ2Rc7yh
X-Google-Smtp-Source: AGHT+IHazlfC+aBmF1/ir0AMiBB150ZyMgk4Dsp4eVlix1a5i3BsnPLdKW9HCdd2sYeROrzFgLPUz2cjVBKUabrm85s=
X-Received: by 2002:a05:6000:2b09:b0:382:383e:84e2 with SMTP id
 ffacd0b85a97d-38254b1646cmr235750f8f.46.1732055480677; Tue, 19 Nov 2024
 14:31:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: AbdelRahman Yossef <abdelrahmanyossef12@gmail.com>
Date: Wed, 20 Nov 2024 00:31:09 +0200
Message-ID: <CABwgSGZfb_t0W5DgUJoFNQkbVbupdHmkL4ad-NiY2Y4JtkB08w@mail.gmail.com>
Subject: ModuleNotFoundError: No module named 'libfdt' after Installing
To: devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

After installing the dependencies (swig and python3-dev), I still get
ModuleNotFoundError: No module named 'libfdt'.

I install using pip (pip install
git+git://git.kernel.org/pub/scm/utils/dtc/dtc.git@main) and I got
that It's "Successfully installed".

Thanks,
Abdelrahman
