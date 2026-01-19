Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6247C27FB1C
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 Jan 2026 16:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838569; cv=none; b=MIzoBGtMbTS6RIz/qpkUSwAA22e7Yt/s44nrXGdOegKyMYsmDze9APofg8q4dxhi5ONfRIbMx6cGzdXAaUSlOwn6LagDBIhDFxyl5pOIvz/bvx0gmkjyXo5BhllPc4xV7zuDbneGLg+FRxLb4eeVxxDTjfGtMFISY/+Cj2fEMxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838569; c=relaxed/simple;
	bh=sWkV5xZGJqrXxE6RyxgvOECZjFGwP/xoTQbmgBgUzW8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qIc7wU0TXeP90S0GHU8Cpx6U1A9zggOl6O9FJNIegz3yemN4pPspbhKutAtAP7fVCQVnHstYpskXUR5sPtPPrhTGhswRnuKgWuASXGJoCe+O1RGr4a/z2sPoE+WMD7No5CSKPdIoYrcWbIrRMmWex7cTjMKJtqWI4nOc15HS22A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fWBC2075; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fWBC2075"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9C1A9C214D1;
	Mon, 19 Jan 2026 16:02:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9795B60731;
	Mon, 19 Jan 2026 16:02:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59BDD10B6B17B;
	Mon, 19 Jan 2026 17:02:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768838564; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TfHSI8Ht8sD5ldnD5a9aLoe7CK8woaB73WEQ4WwqSso=;
	b=fWBC2075tkI4bS13vYKtxmXFQUXvxvDyWX16ziCOIdUoPnVSBBiP1khdpatFQ8DeaqFVUc
	/524vEutOWWeu9zZkOxa02DWyPiAw5YsLo/X4/1S6KwcDxvoxHoxV3yAytB9LztBW1gQA5
	Ang9nPo8OzD5vaaevj/z22ChDQtMTEZCgF4vXVC7M2k3CAzUL0MBG+bzlCUDuJxS0Zet0C
	5dM2URuTo65eAhLGhrfnjIp6NegSC7usrc89ufarWJaAV2TGJLSGaxK0h9LpGVD3gN9fPg
	3eVA0YkbB1YPodgH0mySpt8ohFiN7973zawx59wIgeDJ2BFDiHrysc3wdFBIbw==
Date: Mon, 19 Jan 2026 17:02:40 +0100
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
Subject: Re: [RFC PATCH 46/77] dtc: Introduce dti_get_marker_label()
Message-ID: <20260119170240.47437a8f@bootlin.com>
In-Reply-To: <aWiOcrj-1EB4cfO-@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-47-herve.codina@bootlin.com>
	<aWiOcrj-1EB4cfO-@zatzit>
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

On Thu, 15 Jan 2026 17:51:30 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:19:36PM +0100, Herve Codina wrote:
> > The future introduction of orphan nodes for addons device-tree will lead
> > to more than one tree in the addons data. Those trees will be:
> >   - the classical root tree starting at the root node
> >   - trees related to orphan nodes
> > 
> > Also, an addon device-tree can have only trees based on orphan nodes. In
> > other words an addon device-tree is valid without having the classical
> > 'root' tree.
> > 
> > To prepare this change, introduce and use dti_get_marker_label().
> > 
> > dti_get_marker_label() retrieves a marker and its related node and
> > property based on the label value. It behaves in the same way as
> > get_marker_label() but it works at the struct dt_info level.
> > 
> > It handles the case where a 'root' device-tree is not present and will
> > handle orphan nodes trees as soon as they will be introduced.
> > 
> > This introduction doesn't lead to any functional changes.  
> 
> For all of these functions, if the new one is basically replacing the
> old one, don't change the name, just change the signature.

The old function is kept an used internally (move to static).
It is not a simple replacement.

When I introduce orphan node later on, those dti_xxxx() functions call
the old function multiple times. One call for the root tree and other calls
for orphan trees.

But anyway, If you prefer keeping the old name with a new signature,
I can do the following:
 - move function_name() to __function_name()
 - Update the function_name() signature and call __function_name().

Best regards
Hervé
