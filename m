Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793599823;
	b=Olf//veV1VJPTlgRT7KgHQDlvu62JWi53K8qbHycZ4RnWqQaAJKI7hu4uLI7DFc37Aeg
	 6C9RBE/BSOwOBlOB8WIuBk2j1AlX1rB853M6MreaBh/NZGMt9kJswIouzqXw4Kz0SeQ4z
	 yGLbiBT6PgCDuSKKwSOtnslaOTJjvffJTSblZxJuyzuNXsNkw/2jR4LfHeiu+vPWALPV/
	 08tq7WwKTkjrq7o9p5Egrh9Pbri2Vtu6Q6jWfDy5JROBEe3MKM+NqQrExHhxn0MT3t5Xn
	 3zjrT0ce4vgCO9DKkPm+AtLTtSeRyyQz3F/kubuoMPwaRsz+06+qkxxHyI4cYVotyEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=uszexcZmWZVYUkIjysUdjOo7T0bB9jKUoSwJ27ZKfMU=;
	b=uQw2VaLgCNTppxfCDV+eEt5u1hyPgq8rYSBuP3ij/90pSLhzN7Mkos9s67kSeEg9I+AN
	 a4Adxn5q0BVP5wXiL3kjRe/ONQCamXFdwnCnWayvEda1N2Z2vLMu0U4LAGczh/6FIfvfb
	 VZisa2ZYXgoGk9/aeRjh8gUZxo/sBp+qpBYi9S5mXBORVYxwlZcjg3tCaQsDWXygm4fMg
	 xkbgBpid7k7QMcL/FaJoeAbYP177JE2kwvdGGemZylEth4Kaor6KDA7D98vPoWvJ6eHy+
	 lP80Kri9myZ8Ed3cSnh5iMvjT7nHem8hv3QS7BWLLGhoc0T7rN1bLcrEFU+GHpdQjgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T1LqH9MV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D14606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 06:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D14606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T1LqH9MV
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so4516747c88.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 22:10:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793599822; cv=none;
        d=google.com; s=arc-20260327;
        b=ouB1nkXSJX29ZP2ryUlQ2+lh3v4vgxJdWNiDE39oqRYs7lsZ2rQkPXYwGiDY0SazBf
         NSDiD7IFv1sEvOTiX3pmmFPc9uX19iYMjDdBNLJsaf3UqoAw9fHIe2h3SM2VyNChp+WO
         trHPLaCFWpKs/R7xsSoy8kuMv3Btp8j1Rlr6kLxHN6IUFBD+zZD4SyR41j4Ik6eTHOu1
         tBIOwYupkT8gitoAPIriRptVYgJ8C6R9Fv9ysZxZ5E3XDdjNrO+TjVutLlG4p9yDSfP4
         8Ou4vtl3mnNzNwiMcU0S81NgqzLGOZ0iK903XC0r7axGd+Ulg3WA5r2KPx5whxbj6gSq
         Xynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:references:in-reply-to
         :dkim-signature;
        bh=uszexcZmWZVYUkIjysUdjOo7T0bB9jKUoSwJ27ZKfMU=;
        fh=Rwtaqi37WQUK8QVV3G/mFEGZFDLCYdAvOI8UpGSz3Os=;
        b=AHUzdcYh2l0SzDFurOH8gBONGTWEJIuFiuG115UfevvsjI+AUydsuUK05zkpERVOsd
         hQ7dKg6LsHQchTXJZJKAc6hilgchVj8ScZONXe98HRT57tRzBw40VITt+ghZGKCArtS2
         zaofqJ/C6lQZQfNCPJmjIJeZpgCjHtbHtEOzPxVYSZcu8lVmsfxhbDBmtCM1ueZBFV5j
         hHoyyv0i8BIkKWyOK4ATuVsG1K78G8ZKP9cf+o9s7hES+kXIhByQJkGzFAnLTUUN/WmD
         wn/+Rp3M3RM8v9fHpQ1u/ezpzBB2SaMrpqIqsl7C9I3Kxprnvwns9ypm4zMcood0yTP9
         HlKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793599822; x=1794204622; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uszexcZmWZVYUkIjysUdjOo7T0bB9jKUoSwJ27ZKfMU=;
        b=T1LqH9MVO6R2lG+tXS+l+NEl9kLeLORCNCY3wo+LbJ19DzZUTArr/+WAkY39zykxq5
         lwRz8miK1rfCjHkh4PjtZ1vB0UY6nYbZtaEIyIbMZvLgktp9UdNIow4aej2YsX2XVUOA
         J6GfdragG3aJcQG3D1nB/A4ioFabY1wXVozDem634g8F8Yn/M+YKtoWMxD4Y+zOkwUFf
         NGd9JhvIPOgZ1GJkKCcJSPdeF832qQCKh0aUGP3WBKkzSPOZUq2bw0dVqZGDNUD3u9H3
         he5fk8VkHLKfNpY5ZomFtfzhnb+bQ26B7yXFNQlvXgGoJFr0JHMBEC6PRWIeQlKAnflf
         OksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793599822; x=1794204622;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uszexcZmWZVYUkIjysUdjOo7T0bB9jKUoSwJ27ZKfMU=;
        b=J3NrYDDEe2e3sjvZctfFFaPd2W9V+BdxTS7xzBi0KccwxcZRDuuTZoLMGaLylSFVtP
         FncyP/JZp7A4AxnpIVe4c29lg4uyKwATvxmNrSkS27fyGPR94JBCfIzKZioZFuevaNSk
         +UWzdCgZUST1uggIEADJZ43OqA19YXwbE8ykjfMmjuhfidCD7k+DFWZzlE9Q1OVuxva9
         QuT0lutGdzgfG5lqLIrggXIw7I8S9CjklBbInqN5U5kLWu2LCihSmtbirSJlHBrqiMOn
         B3tX/nH7TMb8bDyMZmPr5zNNC5zZj6HGxvYtsMS6BuejteOnNbp3q0m4plvUvqpXRyKO
         PG3g==
X-Forwarded-Encrypted: i=1; AKwUvBx7RMeRrOJtVeM3B1Jgov9N4dF5WwY7qZT98iYAIcsvVsstwTfwIxB8jIvjpBwLPSo4UFXiWlQX4DE+aK6jK35exp8I@vger.kernel.org
X-Gm-Message-State: AFq9FYIi2KBpaMW3rXtUTIYiLJk6Lrgc+qzcFktvK6Ggp2YE6SA2K1Hv
	MI3jCUsw1JJOJx9X2ag83N4oRYQpVrDaUN1//yX73Lvrt21B1rwI1pHD5CNNAsMi89+tf/R7EBB
	Nez6chfWi0Ty8raLBdIXQqkZ34efmTwfRzDgqiNbw
X-Gm-Gg: AYBFou01emFzDAKsQcLAAU3kFPpuFqUJPmOsdEIVP6zY5Q6zr1WqvcLilS3PU5/ANXp
	qnjTF3EYWxz4l8yEzHlRzTlad0fla/s/E+FbAeDbrySWcOs+W8/N+4CaIcQqXap5kaFz7BGoZfR
	NIb9AfzeaKKjvEwDQM2vcIVjCWNVyaBT1MUuOBd1eVapb2mpC6geKtn4B+n1jUVlrx9efYLqIe8
	iCTv5PvdbWZSTSisKSHkOq1BdjMkr110EAAS3p+cu5dYYvenETIVS7xmG7y2X8AhFQevvj9PcRD
	fjEZJjkSVyZX7Z4xM4yYLgLrVFUz52InzXTs/ik3soGUig1JwFdZu/9yKwGjyWKJWypGWg0vhGg
	Keqn5XOP7DE+DHZX+Yzdmp6rWr0SKjpnKDEll5t9Xt7FSRUK4JQnbUTmrGWTPgLu6x54=
X-Received: by 2002:a05:7022:b048:10b0:19e:f233:4f87 with SMTP id
 a92af1059eb24-1ac5a2a1483mr14656246c88.15.1793599820688; Sun, 01 Nov 2026
 22:10:20 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 22:10:19 -0800
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 22:10:19 -0800
In-Reply-To: <augabGPqjBv7VfRp@gractus.seuss>
References: <CAOSmRzgk2r7tzMFuiPt+grOXO_WwAOL7Ymb=dsn4XsthF+Ctmg@mail.gmail.com>
 <augabGPqjBv7VfRp@gractus.seuss>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Kelvin Zhang <zhangkelvin@google.com>
Date: Sun, 1 Nov 2026 22:10:19 -0800
X-Gm-Features: AclHuK8k2QaAwajLabCLnUh7-hG_wf3zO1vREQPbuVT5YtaCYYxAQVH0wgCnCW4
Message-ID: <CAOSmRzi+i4qyT-8S9D1YN=2imLQCG4fdpikkkS-76qs3=BmoXw@mail.gmail.com>
Subject: Re: [PATCH v2] libfdt: Check node names in one pass in fdt_next_tag()
To: David Gibson <david@gibson.dropbear.id.au>, Kelvin Zhang <zhangkelvin@google.com>, 
	devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

> > +		if (base > totalsize)
> > +			return -1;
>
> Returning -1 here seems risky - if the caller doesn't explicitly check
> for a <0 result, it might case to unisgned and think it can read
> plenty.  0 seems safer - in the case of an invalid header, reading 0
> bytes is the safest we can be.

Good point. Changed back to returning 0 in v3 so limit is always >= 0.

Best regards,
Kelvin
