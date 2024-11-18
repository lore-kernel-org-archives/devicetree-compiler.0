Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4710199EAD;
	Mon, 18 Nov 2024 10:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924964; cv=none; b=oejt9S2EgcrHd2EFwU2aNHa2t5OzHr8F113mzLbdDeRO770VyFniF3xW9RxqhE0nGJUadrpt88p5F6evK5+m27sjHihyvurAkyNVx1QqZAGYi1zXoiwwdScGU7cToJuD2ycrvH8CO/0lzqhgvospdMeaAJh9YjvTqNcCWxfxqj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924964; c=relaxed/simple;
	bh=+GddRjaBZ0io5AKb0NzQ4Mb4WWjWgdobUpCk/Eu6rEQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID:
	 References:In-Reply-To; b=iaBn2l6MhIUzi/yAsuExE2XK9uHp6X67O0dGZsT3uaL9XtXVrsmNpHi5vj6dr+XmbrZ5MoNsk+HV9UiFWvVT1r1b+mt8zfMjYBo2TzhVXKqph7ESB44lD9vi+8MBZn+JcU2ckaLlkvaDVoXm9gPC2DYOQUi7RsUfbGTvQcEXk8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=WEbYUqUI; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="WEbYUqUI"
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 61C8D38A3CB5;
	Mon, 18 Nov 2024 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1731924952; bh=Igg6+14njFGaQFSTxuuaf0SiUdDDoPx2IqJp71Pp2c4=;
	h=Subject:From:To:Cc:Date:References:In-Reply-To:From;
	b=WEbYUqUIOWaXVUbVMK54qwZyXNSun0DPwci9pEefQNA8VyE+kOICWa8NkAHbU8ZBU
	 y4XY9Yz9xw2JVbniAwAZqJhvyuvcFHdkSz38C9czziF+KMZyya08MTMF1YWg6fQ5rN
	 Meq4U1IEAI0BvrqLIIy/G6Kf1BTQcxfCKnAceUtTiSTK9CyeiADCYnhnZKDZJFdNrZ
	 XnITqKkHw9llPt8w9qfKSZhWW8YDn0+HGDoFdVRLS5ltv6HSbAqVsEJ434dMOkCGBy
	 IHBhuMYnEQzw/LHdnh7Y2cd2QoJBsZJt+Lth9QEiOP6FU/x0GH/Knuv6yPAnXvmvfI
	 +x/6evrRNYclI9Gdcdn0YhpJSmuqcQslYu5yPH3okqezhSn9ul8jAxrzIBmPOIeOp2
	 bS73k6k5ZiORnHCjWHcMCmhsROGnQUnW9SGqD3ViyX/OZSSpAYYKoA/oFsYu9BQza+
	 hrR6q5q6+XMYwx345AkFjq7wWh0BHfvJ07IAkGgPefcMD+biREIv1ar/6Abm4/IBtq
	 vTvyZQmo5WlCvS9BDomp+h4leAL8mdWCWp2OEXqVLdFBn8iEKeg5MtTGsOo9Jp0GEA
	 7EnbROYeSduUsjlQ0EAQ3n0EByuaB8DXH8LXjRB/2RynnU2T3H1DyjgnnZCxYIVYWE
	 XQ0Onkfb8Z853l3b0i18mWto=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9cGn5ZVciKZL; Mon, 18 Nov 2024 10:15:47 +0000 (UTC)
Received: from mail.envs.net (mail.envs.net [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Mon, 18 Nov 2024 10:15:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] libfdt: Suppress a unused parameter warning in
 overlay_fixup_one_phandle
From: "xtex" <xtex@envs.net>
To: david@gibson.dropbear.id.au
Cc: devicetree-compiler@vger.kernel.org, xtexchooser@duck.com,
 devicetree@vger.kernel.org, ~xtex/staging@lists.sr.ht
Date: Mon, 18 Nov 2024 10:15:47 -0000
Message-ID: <173192494741.876.12251057947822811583@mail.envs.net>
User-Agent: Modoboa 2.2.4
References: <ZzqzwCBrSPVhYIwe@zatzit>
In-Reply-To: <ZzqzwCBrSPVhYIwe@zatzit>

>AFAICT this parameter is *really* unused, it's not just the compiled
>being confused.  So I'd prefer to actually remove the parameter,
>rather than suppress the warning.
Acknowledged, I will make a v2 patch this weekend, as soon as I
am back at home.

--
xtex @ Nov 18, 2024 18:15 UTC
