Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9450413C672
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Aug 2024 03:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724988556; cv=none; b=qh6MyN/UBfpLwvYXGtssIAOHD5niQaO3Nja0eV7Ayc0AT1wnXNScyL2i7+F2HJnyrkvQx6e52/4zQDGtZtLt9aR46vS1loCKCzqwUpw8ZYGGmJVrta0PjgQ2QXgZpn0NevrnKxoCihSwNmE3SSCdlWauJESuXHhu/30cea9KHFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724988556; c=relaxed/simple;
	bh=376MESMwoFkac1OuSn1d5tCR11G55Z8yoWY3ywSrTDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPiSj+Yj/YmlNXIRz4JKa944eBCvU8UOvCmgbDvq/Ac4DfSeJ3v4n5zGEvRegHeUBu4MQiKkJy6RbDNY/ya7RZhA6k6CCOVSFILdQMEdkt/vilIf/rTuizqhGT7rydfmNCBqOsyjhrX/niy0qek4hx0HMHrX0oPPyw95Xm4oiz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdKpgEIo; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdKpgEIo"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e116ec43a4aso1549061276.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 20:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724988553; x=1725593353; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=376MESMwoFkac1OuSn1d5tCR11G55Z8yoWY3ywSrTDY=;
        b=XdKpgEIonypqnllKcmJ9BXyWmzy27odp8rmDbuE8o8xSs5IH55GQnPvQH+TddOL9u3
         fVXlOaqvvexdzeqo+iHB+d2S05OmsqN81gYh/TB4MDtGhxcnseJCCEEhBBzh3tpvdZd+
         SPrasKt8ZwoOJ88k8A4wFl779k/Eck9+DOov8W1e1D0xYG7vnHMlmqRWdPjs0mUeLWlw
         RD7lOA1C6HFSU2y77cbcL9YotnxMajeDtPHHuguJzJ6Aq1zyIkK0D95bh0kZpfYWA5Jp
         3p2Gzg0eDAKqfi59rtXGX9bBi4AhesbiQAqMhCIup3VUzCBsplM2BoinxclZSMk7AAha
         QYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724988553; x=1725593353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=376MESMwoFkac1OuSn1d5tCR11G55Z8yoWY3ywSrTDY=;
        b=RM4qAw0ILXBv5ZYJLVPuN8ed7Qa0/0Oumbg6sgehxQG7Ej6MFH2Ncbbe2aZQFP7/Uk
         BWQWsPCzHL9NKzbNgh2ofrvDoxjqFk4+6T03IE62j3fjEWgiErFK1dxEehA8K2Xa/uN8
         R6efMD0ku9ulhPbLlqtEWxpZ3Ym1tAl64kt9pNCj4+rzjQYBTsW6Kq6FKhEwyWxDndW2
         NnvZaFh1bxG5jvEEgtu1bGjMmm3JWnwozBKmscsxO/oZxE1zjJqVTbE4QzxOtWfwz0kE
         0A8wDelXr/gIXlc0ugqNbIlZHcQd/9za/4XqDFq+CtkOole+guhvLLJYsfR+LDh8mQvF
         6KBA==
X-Forwarded-Encrypted: i=1; AJvYcCWrPLL1axBuogGt/RfgHDOg3R9XfS+eSTw9G90w8fikiMnfuF1qRJPRQwun4jnM1eWyutLAakjNo7YkRgxAdtYrpizq@vger.kernel.org
X-Gm-Message-State: AOJu0YxwZsY+c+hmexqdkSurg0Cf1b4BtAiL0wOlbMdht+VA4ooS8Jm8
	VuA1jbeplkkEM9UQnanI0G62iQeWPxR0FNKIyyCesBK5PcD+5MIsb4Hk4ixSll/cWxhmSXxz7tn
	eY/4GlYXkjHS3qEXIVJxr2XQ5RBs=
X-Google-Smtp-Source: AGHT+IGpbWqsG4zy0G7umkqlxEE13xKO1qYeV0r0i/+pddfVcXD/rNrY1VW7e7JYthL8vPTZTpNTWb+yw35uCKHoVSg=
X-Received: by 2002:a05:6902:983:b0:e11:7b16:9484 with SMTP id
 3f1490d57ef6-e1a79fe52bbmr1102419276.2.1724988553405; Thu, 29 Aug 2024
 20:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
 <20240830-append-v2-2-ec1e03f110ad@beagleboard.org> <CAFLszTiTR4-WLoVP7NDAWtVHYsFeVNaT84k3MLUDMYYpF7CvSQ@mail.gmail.com>
In-Reply-To: <CAFLszTiTR4-WLoVP7NDAWtVHYsFeVNaT84k3MLUDMYYpF7CvSQ@mail.gmail.com>
From: CVS <cvs268@gmail.com>
Date: Fri, 30 Aug 2024 08:58:39 +0530
Message-ID: <CAK-9PRCWNN8x6zOw6sk+sXZSZ2Z93UOisQhg+gK17C_GqnV=vA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tests: Add test for append-property
To: Ayush Singh <ayush@beagleboard.org>
Cc: Simon Glass <sjg@chromium.org>, d-gole@ti.com, lorforlinux@beagleboard.org, 
	jkridner@beagleboard.org, robertcnelson@beagleboard.org, 
	nenad.marinkovic@mikroe.com, Andrew Davis <afd@ti.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Robert Nelson <robertcnelson@gmail.com>, 
	devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Also, how does the existing -T / --annotate option behave with this
proposed feature ?
i.e. when a line in the device-tree is modified using /append-property
what (all) would the annotation comment contain ?

regards
CVS
