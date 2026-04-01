Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED7E2F39B5
	for <devicetree-compiler@vger.kernel.org>; Wed,  1 Apr 2026 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056309; cv=none; b=nZ+P9lXHE6oqNa6rF8rkqMnk85H37Tv4w0J0gv/vVrRCfGG+kobNOyGisWxIgEvsuwODNZXdfSiVfd2WRCzyTNmoEL/+12OKxKefA6YhJi6B6DPN0IkeXbM39lS8HCJr/12iSGTKgyJpaTJrHaHAtyl4dHmwOaUY2JXnvyT48t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056309; c=relaxed/simple;
	bh=uk8uoZyrv+DeE6cHVEFM9AsSJekFURJCy882RCf7PJ4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=V1Y7f/Y+VtQOUTG9FOvqiULGD1ctvlOMy8Y5D3VFXP+wyQUU26qLSyBb/g0zB4apFe26tc/NUOhRi1JeV8PG0DqUGRuc03KRdWWZPUgwV/Ky8iXfpXPuygE+jXaDWnjU4fDDLh0XWTBkkOSq/50bWss2sn6KEkyxmZ3yRT7sm/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y+Pu5ibq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y+Pu5ibq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 928D81A30CE;
	Wed,  1 Apr 2026 15:11:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68A5F602BF;
	Wed,  1 Apr 2026 15:11:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B2E51045030B;
	Wed,  1 Apr 2026 17:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775056305; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WW2WO4qcuYhdHnXTooRUS22SuZzcBPST+mzffL2JTuk=;
	b=Y+Pu5ibqKW45QzfIV+p9ZxQrRRR5iXjLPznA3iXiYRuJUChhsmoSxsEUk74UJuUNUOwCYo
	ej/Y4OrVwVOcqSHmsQ6n9SF3FWPin35VUWaLnhF9Kw1qNrRf33KXm/jXyP460O0CX1tYJP
	gzRgpUYGZ4VmoppCq6VBj4Jayjc6nYT3pQLJYXeRHTqKLJc2+bX79SLNL5uqV/+8KxP0l/
	gRjESLzDgeGaNl679LI88bt51DK8j6DoWP9Y4yCNbnu7otPYFqYC9g3ROpSCSqjyjyDiYu
	f9xUrVr3L72D0sd/g76gv5fGnpy0bIsPhzwEZTqtllLNc27RMn7RwLQxWhxSIA==
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 17:11:42 +0200
Message-Id: <DHHWY06CRC21.XENO1ENNAV55@bootlin.com>
Subject: Re: [RFC PATCH 06/15] libfdt: Don't assume that a FDT_BEGIN_NODE
 tag is available at offset 0
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
 <20260210173349.636766-7-herve.codina@bootlin.com>
In-Reply-To: <20260210173349.636766-7-herve.codina@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> In several places, libfdt assumes that a FDT_BEGIN_NODE tag is present
> at the offset 0 of the structure block.
>
> This assumption is not correct. Indeed, a FDT_NOP can be present at the
> offset 0 and this is a legit case.
>
> fdt_first_node() has been introduce recently to get the offset of the
                            ^
			    introduced

> first node (first FDT_BEGIN_NODE) in a fdt blob.
>
> Use this function to get the first node offset instead of looking for
> this node at offset 0.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  libfdt/fdt.c    | 10 ++++++++--
>  libfdt/fdt_ro.c | 16 +++++++++++++---
>  libfdt/fdt_rw.c |  6 ++++++
>  3 files changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 676c7d7..ff2fa6c 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -279,11 +279,17 @@ int fdt_first_node(const void *fdt)
>
>  int fdt_next_node(const void *fdt, int offset, int *depth)
>  {
> -	int nextoffset =3D 0;
> +	int nextoffset =3D offset;
>  	uint32_t tag;
>
> +	if (offset <=3D 0) {

What is the difference between 0 and a engative value?

This is where the parameter value is not obvious to the newcomer and I'd
love seeing it concisely documented.

Otherwise this patch looks good to me.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
