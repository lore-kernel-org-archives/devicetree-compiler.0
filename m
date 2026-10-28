Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217918;
	b=BHx8lN4Do9ryq7iLNWa7FTV7lUiPErQMywZj+IMuig++UyMjRjouj/ecGHl84Mh0EIWO
	 n6Se0ARfWW1PWKnhnMvY9+QssTVt+H/a89exWNTnr/AkmrSrhWPZbEK8jxnFAJVjwRrXA
	 5E9rkQ/GjpYr3gzmBVC4LkMw8ngo3kVkxVmLJ1Ir72/a1vM3DFfdmVJzY7Cdoz7gwT5dW
	 awwwctzAP4itLdlMy4wY8DUYRoaiK5GWNbaNYC+hD+ifF5hl+z0XjwPI9Wp+GCJLCLRH6
	 R7Ozjg7/GM0p+qLzFReJuU76S5D8XxDqDftjaurGXDdrS37MvrWn9wflwFXHrGLhO8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217918;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=uHRyAXM9mebF2jmYj1jDIWGvnciRD427V3iwgCQga/Y=;
	b=eslLS2vPQuJGO1OKhAYBmFDYEx4AQqJ3G42T8x2gnQK5O9+OO/F7ZkmoBxWTxJ8MCfpt
	 wotdpTSXnOYbt5OlwkDXV2RMkbHE1cD9tqv1bLabqCwyM/MLvBenUv9YafxJ/ByZwbxnL
	 FQmo9HvGgy/b07UckT5zNv8IRl6dh+oYXTcQuW80TDJ9m6HzFnBW6hhiKMXJ3N0XB3RIz
	 KqbR7W8d1L1GC8gbz6efU7/N+Jh7F6HcEYcM8BAMYQcC54whzhhmy6vPDzrPGH1bCk3kg
	 qXkpMRoQEidCXznz3qw3IpJernwZEilptR3rOpXNG01rOUkjHC7hslWh9VS6ynsLjZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=12mDrQWE;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E142D606A339
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 20:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E142D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=12mDrQWE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 27DA14E4136C;
	Wed, 28 Oct 2026 20:05:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC12B60769;
	Wed, 28 Oct 2026 20:05:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D0E3103290D4;
	Wed, 28 Oct 2026 21:05:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793217914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uHRyAXM9mebF2jmYj1jDIWGvnciRD427V3iwgCQga/Y=;
	b=12mDrQWE3mwcLrVrgyOwGcL4sdTEYHhi8OopbVOPSZB31WRsc4NZjoMzTAc9E9YxmqGn4w
	OxAz8iCgVvhaHTiyMCKznHXZcUcF8bv0J3LygiqXYcF0beg9JPes10Ynm/3IMobqXfCQ7K
	y36LTlaBPNualUXciS6ieLlcWVL1bK8DTLl93JNkwqhVMSFfqOi6KYKxygXgfqev0zyCwU
	/Y3efK+/07yYRA8QH84cy5N36B3VEcgpaU5EW1LZQTU0OHbnRJ6ABPBX8g9Sryn4fFVtTS
	X/HwKzkOE++4L4bUGNOM2rIf1ZcwS6iXbkGKAMMq0En56oCxs43NCOOX5P9H0g==
Date: Wed, 28 Oct 2026 21:05:12 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/2] README: Use meson in the Python section
Message-ID: <20261028210512.6c104b67@bootlin.com>
In-Reply-To: <20261028112007.3980089-2-sjg@chromium.org>
References: <20261028112007.3980089-1-sjg@chromium.org>
	<20261028112007.3980089-2-sjg@chromium.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Simon,

On Wed, 28 Oct 2026 05:20:02 -0600
Simon Glass <sjg@chromium.org> wrote:

> The Python section of README.md assumes a make build. It installs with
> 'make install', disables the library with NO_PYTHON, and runs its
> examples from the source tree, where make puts the built module. With
> meson the module is in the build directory instead, so the help example
> quietly imports whatever libfdt is installed, and the coverage example
> fails.
> 
> Use meson to install and to disable the Python library, and run the
> examples from the build directory.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  README.md | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 

LGMT.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
