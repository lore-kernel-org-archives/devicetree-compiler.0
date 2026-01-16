Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC7118872A;
	Fri, 16 Jan 2026 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568964; cv=none; b=NrK5g9NzgvXPXIkpSGH4wLYo/gLizQ83t3GpH0BX1LYa5rABrW3G9XMhAAggYA3HK4Ly727slqiisId9/ZRkSgbAFrtwN/ADrkgsXH2lRWnwTGM45oQNVM8iCJRTcIO3nPfFPe8CJvljsqKhK5cSXDgLniSmVOE6YyQtX4Bpfm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568964; c=relaxed/simple;
	bh=DKzJvKdi4605YfDI7Rv2nlxPyHlCjuSoqUGFEKoYcyc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XPj0D4IMoB+kIU+DPEUaPete1X3T9WKtn8uv0bk/oBdB3adfS381chypmSdeefDnbxNqy85hlWqRDRwnC/FUpzlQvnX4uxecNr522aY/D1TzM+vUb+MAkzxc9W+s3MNVfrbC0PQabDXWbevIfI6kdFb5v8GSPsKFo/ZSTALF3So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=akQdTC6j; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="akQdTC6j"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1501BC1F1FC;
	Fri, 16 Jan 2026 13:08:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0B0B60732;
	Fri, 16 Jan 2026 13:09:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1E3810B68A9F;
	Fri, 16 Jan 2026 14:09:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768568958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qBTM9uhyyzX9McJtb+7BCxPjDNUdxoT8uFNN+UzDvC0=;
	b=akQdTC6jUawWeNX0udtBvkK3KB2rryZSFYOcKGTqA70PnlbcZB5j44h2nXkzUu0vVWoouG
	LYgz4c3uvs7MV9TiqF9FkGSKPBYY+FT25WSnC6GTnwq4/3vC3VIvB/OKzIYFwvVwfVVnUm
	23lXApECBRHg5s/Lz2KQDlPVX7oOMCYJWSc1po8CmQyhGq2Hi5dJojbX92+j5hI0PpbCPb
	RWLqXY+oOkAZ1TkxTC29fCYZy2ei+/QWrAIbiA3Ghq1xqhd3bjZtPccVfeT9ocDkeHTj9A
	6oOi9a6Fm1qY68FihZnftWLl6yXkTvhwRtEe+CkLsXz/uiA39pP2W7CxlFh2TA==
Date: Fri, 16 Jan 2026 14:09:12 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ayush Singh <ayush@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Hui Pu
 <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 09/77] dtc: Introduce mark_local_phandles()
Message-ID: <20260116140912.3d18ae39@bootlin.com>
In-Reply-To: <aWg5bD4zWYAQOYai@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-10-herve.codina@bootlin.com>
	<aWg5bD4zWYAQOYai@zatzit>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Thu, 15 Jan 2026 11:48:44 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:18:59PM +0100, Herve Codina wrote:
> > In order to have the new FDT_REF_LOCAL tag present in a dtb, the phandle
> > reference needs to be identify as a local reference.
> > 
> > This is the purpose of mark_local_phandles().
> > 
> > It identifies a phandle reference as a local reference when this
> > reference points to a local node.
> > 
> > With that node, the related FDT_REF_LOCAL tag is set in the dtb.  
> 
> I dislike caching redundant information (whether the ref is local) -
> it's an opportunity for them to get out of sync and cause bugs.  Is
> there a strong case that you can't just determine whether it's local
> only when you actually go to use it?

Well, I can't find any strong case.

I would like to avoid passing the full dti (struct dt_info) to flatten_tree()
in order to determine if the ref is local or not to set a FDT_REF_LOCAL or
a FDT_REF_PHANDLE tag.

Also, this flag, set when a FDT_REF_LOCAL tag is parsed from a dtb, is
useful later when the ref has to be found based on the phandle value.

Indeed, because the is_local flag is set, the phandle value available in the
property *must* reference an existing node in the dtb.

In other word, in update_phandles_ref_internal(), 
--- 8< ---
	if (m->is_local) {
		phandle = propval_cell_n(prop,
					 m->offset / sizeof(cell_t));
		refnode = dti_get_node_by_phandle(dti, phandle);
		if (!refnode)
			die("Node not found for phandle 0x%"PRIx32"\n", phandle);

		m->ref = refnode->fullpath;
		continue;
	} else {
		...
--- 8< ---

Best regards,
Hervé
