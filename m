Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9868129B78F;
	Wed,  1 Apr 2026 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056724; cv=none; b=eK7nik2LlWBdvqlNUYqIgqlTA3I10bjq8N/xjKN1rmm76ZQ2GNOYoEk0OA5mjsiCRGFrStyrjVhXVYcTBb3hBWbzhoN4LSJ5Ho/aK/I6Sq4jIQA6vfDByYIUu6VZKFkeuVDwgc3DWfvsZ2QU9oDfTRwG0JkQXaBSXli8m85oGBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056724; c=relaxed/simple;
	bh=D79QeV+P1IC6CZVi6L3w5ml2fBqA6QN1hGJBuW3fgQY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=nCTBASALOB4X/aIyv1+oLaRjpmZWj0myEWTIvHfDx4bBNp4ipcSDh1Bmpt+M7tGsaqMUlF4gSyhNU4CP1taTw1npkD2y0VEEgmUME7V2p6yDtPLTu9a+uQ8yohhRy2f2TIgaQoF8Uu/1hKsJrXLM4FvWAv8q+JOeIdDjrIouvgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H+CZ3lDe; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H+CZ3lDe"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 58D2D1A309F;
	Wed,  1 Apr 2026 15:18:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F1B7602BF;
	Wed,  1 Apr 2026 15:18:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B801610450290;
	Wed,  1 Apr 2026 17:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775056721; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0Sd1TJerguP3PV7KbCxrgIxPOI1utwr2NknnAOVyldk=;
	b=H+CZ3lDenPJydpTatgA8YPMkzJKRcSzXPX39jdxjDIrcoOlux2PXXdGz13D4P8JFAEjOHI
	UkzBSIx4b76G9oVrQZ7uU9RdC85wMVh0HxBP5sfIboLvvEKwwnvZX3hOZpqXosdOlRWdxm
	ATjgepiQezZDv7amOVyugi5nhoFXZrAIlFmwP3umjZQjx4nmony50uJIG6CTzf4qJTTC7R
	Vju8yg1H2M4DQyvvYevI4OTISDJ8gekSlxSEhUszvjwXz/auZmL3RBxh3ZQHryyfuDsTvO
	9eQkl7UbYv201hHrG1DEibu+zwS5FbW0zHtKOtnr9xrsjkXENwta9h5zZvXpug==
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 17:18:39 +0200
Message-Id: <DHHX3BGQU652.TSZQNV4GX4SH@bootlin.com>
Subject: Re: [RFC PATCH 13/15] libfdt: Introduce fdt_ptr_offset_
Cc: "Ayush Singh" <ayush@beagleboard.org>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, <devicetree-compiler@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree-spec@vger.kernel.org>, "Hui Pu" <hui.pu@gehealthcare.com>, "Ian
 Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "Herve Codina" <herve.codina@bootlin.com>, "David Gibson"
 <david@gibson.dropbear.id.au>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-14-herve.codina@bootlin.com>
In-Reply-To: <20260210173349.636766-14-herve.codina@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> libfdt provides internal used helpers to convert an offset to a pointer
                  ^^^^^^^^^^^^^^^^^^^^^

Just "internal helpers"


> but nothing to do the reverse operation.
>
> Fill this lack and introduce the fdt_ptr_offset_() internal helper to

"Fill this gap"? Or just "Introduce the..." would be enough.

With those fixed:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
