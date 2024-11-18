Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33334198840;
	Mon, 18 Nov 2024 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924964; cv=none; b=FbQIIUPKkhcruCGObyhpk1DJEq7MDp/nG/PoCfqVLWJwcAgogIkaPwobSFwdmGf+dzWIJWv3hv78bH1HE9Gh+YvYxEOKkW//LzbDoNRvjwdMOMpv23lujPZ0zXTRMTGgFnRfT5JKm3D+Q7t5VhXkbh2MW5UZbAhHCoUW5TXs0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924964; c=relaxed/simple;
	bh=+GddRjaBZ0io5AKb0NzQ4Mb4WWjWgdobUpCk/Eu6rEQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID:
	 References:In-Reply-To; b=hJmEuRglZvz2/k4f7tP/RPWEC/qrjtaDf2D9uEdoU6YwdzQujmmsSQGIXSTl+QAZ9zZ50qY3WVV9Le0uEmXX6Z5fxXLFS1FfeyZ2O6jP0Dr2bmGxxKlhE/FpJnryj0853ZlWndcANodkGYNd9iDLDBuH8dU3kIwNlyBaq0UtAOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=oM0WXYs4; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="oM0WXYs4"
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 4164438A3D07;
	Mon, 18 Nov 2024 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1731924956; bh=Igg6+14njFGaQFSTxuuaf0SiUdDDoPx2IqJp71Pp2c4=;
	h=Subject:From:To:Cc:Date:References:In-Reply-To:From;
	b=oM0WXYs4fOBA6SdxrOHhXK7caGLP2WWNSK5AFwqPhHyzkw6ku9JdEXmROyTkQDZ6V
	 zczvID0usZ1mscLsQeZE51S0I2QibOtE/IrJkbH6xljZ4CL6liK0oH4otpSybE/1cV
	 kioA7prVMJqyrJky2l6dDCaXqDDfHwu5tON2R7vvfGTYQu/SLxyIkbOKKrylXLNdW/
	 IJJfZhhcAEQ7wgiidFYKcIYAom+jSa8jEUDqnfti3Pn4JQrvCn21bIxnRfXmOHaA1r
	 yLAvk0sr7fE5GgNe0OCIduFMyO0LAm7UC9gsqlZRBFWfc1N/12sbp+EW/Dji5Dde+f
	 BruW3LAO2eAClneCkfyZGU2DGD3kNx/QiPViNJzVvuhhAD7FuDSBn7D6MqXWCC0bbz
	 b5rOQvsrGp6ZFVLFDx97r5zTyn2Qe7yHFd34Emrnaf7CYL/SX6vthDO8d1H/GR3W/k
	 FfS++KAN6mP6vDhaIzlTJudhArAJ1lu6ej2bIBDWPUEP6DNn+c19yiXHsUsXCtJaxO
	 D5oEdWafyu0p1ohIZ6k8j9sg+MyipiEyAZwU+8APi9soaav8Jq6zxn6DrwzPmeF6D/
	 3ss/01viKz49SNPcOs7zl+QG3H5kixTTyHQvC2zZHgDvVugPfqXBjLfv+4IkFd9J4P
	 lgx18aclg5h026F+hyUK+Q5k=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VFBAXnwT-qXj; Mon, 18 Nov 2024 10:15:51 +0000 (UTC)
Received: from mail.envs.net (mail.envs.net [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Mon, 18 Nov 2024 10:15:51 +0000 (UTC)
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
Date: Mon, 18 Nov 2024 10:15:51 -0000
Message-ID: <173192495134.875.12089483595435414461@mail.envs.net>
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
