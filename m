Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ABB2EFDA4
	for <devicetree-compiler@vger.kernel.org>; Thu, 18 Jun 2026 20:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781814288; cv=none; b=KWbkH9GItNyNK0RNvKBRORAzR3Qu52PUeSvXOJA56n0vz9Z+3ENJxd3RDdD52cFMVnMdFWitr30AK+34+W5audEPl8Dj3yVi7Cs8/1Ti5nIlXofHuQ4yt3guwTh3yq013fBxGgL84IHon9ELHMzC4ALI5RKS5OPG2C2F97jWWXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781814288; c=relaxed/simple;
	bh=g2Sc5eB52iGfLV3k7mWj2Ot19jkbeeuyKz1MtgW92BU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YsTOAfV84woNvfGsfSHS7/FxMElX7VtZUcg1ZNbizn9MB2c9dDHMtAzuUNT+4sqe0p+ozx8e77PqVl7gPf+VNaGnZfqEsVnI16lrpf8qdKu6+xYFdbRrnXXesZW8fnr0PH141Ogxg1cEQ1aDTfliNXsm0bXeVjMBxwsoodPQwSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j6nT/2E9; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j6nT/2E9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 078701A39FE;
	Thu, 18 Jun 2026 20:24:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1310601AC;
	Thu, 18 Jun 2026 20:24:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE7B9106C8827;
	Thu, 18 Jun 2026 22:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781814283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4H3X4ukQ5dz5WHGLsNnWmuP9ioTdUO4d86DYGKjAOjI=;
	b=j6nT/2E9/XHlhh0V5CwoOWdwtdpaxolpYELPPsqNEemXmPcpbJ1nHx24WjqTOM0eLNg7F8
	zm21sEBot7Z/KRFmHNLTeTAlHs4KA/WDoiBn/Gm0UP8B0aItBYxfxm4Z+dBcPmgygB9972
	HsDPet334D+KNXoi5eCHUxu5gHvLqnVTPCWgi0d96XsmRSw91TwnZgj80fphgmKHKqNSFc
	xswSGfE64FYYkM/qIIIAUAXWj51B6Gl5MUnX0CT27BxGUcHD5skls3o318kWu4gNoog+WD
	C4ii0WGfjwpkgoUIqHhkiDpi/Vg3O3Ar5gDcNpmSOR9n4sy8aLRP6sVWRTnbsA==
Date: Thu, 18 Jun 2026 22:24:38 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Brian Norris <briannorris@chromium.org>,
 devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Avoid warnings for reg override in __overlay__
Message-ID: <20260618222438.1423c6c0@bootlin.com>
In-Reply-To: <ajOpRVdPadsDi-KT@zatzit>
References: <20260617204401.2275738-1-briannorris@chromium.org>
	<CAL_Jsq++ERWJ19BcVXHKTzq1PN7tpJm=rm6e08UCH_gcp6ncHg@mail.gmail.com>
	<ajMvU-U-cdnlXykM@google.com>
	<CAL_JsqKqPhwrTjzXiVwnskqCm_SrxM=FVwChfwT-W1rjL+N7jw@mail.gmail.com>
	<ajOpRVdPadsDi-KT@zatzit>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 18 Jun 2026 18:16:05 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Jun 17, 2026 at 09:58:03PM -0500, Rob Herring wrote:
> > On Wed, Jun 17, 2026 at 6:35 PM Brian Norris <briannorris@chromium.org> wrote:  
> > >
> > > Hi Rob,
> > >
> > > On Wed, Jun 17, 2026 at 05:54:42PM -0500, Rob Herring wrote:  
> > > > I would argue (and did the last time this came up IIRC) the overlay  
> > >
> > > I gave a quick look for prior art, but didn't go far enough. I see this
> > > was a similar conversation:
> > >
> > > [PATCH v2] checks: Suppress warnings on overlay fragments
> > > https://lore.kernel.org/all/20230308091539.11178-1-qun-wei.lin@mediatek.com/
> > >
> > > I don't think it had a satisfying conclusion though.
> > >  
> > > > should target the parent node instead and then you can put in
> > > > #address-cells and #size-cells in the overlay to make it pass checks
> > > > (and make 'reg' parsable without applying the overlay).  
> > >
> > > This implies we can't actually target the appropriate node via phandle
> > > any more, and so we lose the ergonomics that phandles provide. Where
> > > previouly an overlay could be resilient to node renaming and other sorts
> > > of incompatibilities between a dtb and a dtbo (the overlay wouldn't
> > > apply if &foo isn't found), now we'd have to open-code the node name and
> > > maybe even its parent node name in the overlay. If either of those were
> > > wrong ... we wouldn't notice at all, unless there's an obvious
> > > functional breakage as a result.  
> > 
> > Why can't we use the parent node phandle?  
> 
> That assumes it has one, and that the name of the target node within
> its parent is fixed, not variable between boards that can take the
> same overlay.
> 
> This approach also normalises overwriting (presumably with the same
> values, but nothing verifies that) properties outside the device we're
> actually trying to update, exacerbating the write-anywhere problem
> that overlays already suffer from.
> 
> Targeting the parent node is not a good solution.
> 
> > > I acknowledge that it's difficult to parse and validate dtbos when they
> > > are low on context. But I don't see why we should emit false warnings
> > > for the possibly-correct, and more ergnomic approach.  
> > 
> > It just feels to me like we're disabling checks one by one on
> > overlays. And it's not just dtc checks we have to skip, but schema
> > checks too. We somewhat mitigate that by requiring (requesting really,
> > because it gets skipped) overlays to be applied to *something* at
> > build time, but that's the kernel tree which isn't everything.  
> 
> Yeah, the suggested patch is also not a good solution, comments on
> that email.
> 

For #address-cells/#size-cells, you can also have the properties set in the dtso
file either in the __overlay__ node or if, some other DT properties are needed,
in the fragment node.
  https://elixir.bootlin.com/linux/v7.1/source/drivers/misc/lan966x_pci.dtso#L25

Worth noting that, in linux code, when an overlay is applied if #address-cells
and/or #size-cells are identical to already existing ones, its fine. Otherwise,
an error is returned.
  https://elixir.bootlin.com/linux/v7.1/source/drivers/of/overlay.c#L322

We can have dtc checking reg values against #address-cells/#size-cells
and when the overlay is applied, there is guarantees the
#address-cells/#size-cells matches base DT existing ones.

It is not yet perfect but it is better than nothing.

Best regards,
Hervé
