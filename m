Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728592;
	b=PVUlJtkAcLPqS8cYYE1AZD9HVwZw78aomUjzpOM3qYFVYJ7ro7Uq2eCon/FDLTE4Dzom
	 5BdNRdfw/TFJg2tozQxxABcBruWJ9OpASHm7yqiezSwbwg/WSylKBOBV16XXnSboSusCG
	 JVYOT8xZUwKuVZHT/GNkgoO7Bw0vRoZ1oeKW3ZctA/F29rA6yssHG3dmWjlHDizNJnrzw
	 3d8alpSBnmJvMLKM0vNHhXs0w90MEObVnxGKblOWsoeOcHg0rBd/YrI6HCRUlfn+EPpSj
	 7DTYxTx0m+QJ3Ir4o1vF1Gj6bTCExs4AyA2RVAUURgEdxDCgr9S1WBkf+gIrnSR87uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728592;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=raCJAZClswueew2P88NRR+tV7q4CeXLZ/J4Nb/kPidQ=;
	b=ReG8JV5HCGKlE6KS4jzIdDfMObtdx08y1oA/AZGbw/nLIvC4+lKEqfbKVdDrDh1XFr4O
	 4bxyCaNwuehcB5CWjQ2bqhMm9d/bwrk1CoYbtT6loTHM/LkAqQ5vUdgPI3nIDdhe2SDbI
	 hcPUTicwEXBTh9z3HlAIMLzY6SUl5WUVaNi9YdGXzjmQNlH2XuHoOa+IE4HH23hVQDqE6
	 P9zAwHtsdvx2r0EAEVADb1dcBgrQyt9kXsODaWOMhVNTOY0GgkvuYvOa0uALq9H1SQUep
	 KILe5/UGZrJIDTsyE+le0wn5CrTNmwwmouAQmX+5t4xsDJeUsJbCDx3h+rgw9rIzaaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ppWloGlB;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECEF606D80B
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 17:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ECEF606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ppWloGlB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 73AD51A142D;
	Tue,  3 Nov 2026 17:56:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4026A6046C;
	Tue,  3 Nov 2026 17:56:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A899B1032914F;
	Tue,  3 Nov 2026 18:56:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793728583; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=raCJAZClswueew2P88NRR+tV7q4CeXLZ/J4Nb/kPidQ=;
	b=ppWloGlBpx80DDEGpnErH9+gGQHH/Sd3ajYb4NHLIc5UbnFdO0I4mmTDQha02bUMGJTuVb
	mS+myfemXOTtWsWMxfq8jWV8daJ9ihzJ73aP9ir6YIahwuXxg+kRZt2aavlMfQNDg70LXR
	DxbA4HzJoCwIRjc/vW0PAbalAalEQUEkoCLQymkcgF7/U0u5VPP4TpgNbZVkoRcH+jrjf5
	2sWWDsLSyMon/joVqW3LjFoNlQOwsaaTyPTw32mDbHq9o4dj0zbajy52O7nlH/MQzGbODX
	dByrmSDfjMSmdbDuEAI8sohsbqanFa5nWCfsxzMksJPcE/evnT2TMFT//HcDuw==
Date: Tue, 3 Nov 2026 18:56:20 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree Compiler
 <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 02/13] dtc: Add a list for the top-level fragments of a
 dts file
Message-ID: <20261103185620.3bba770a@bootlin.com>
In-Reply-To: <auhctwoLtdWs9p-7@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
	<20261101163721.2458982-3-sjg@chromium.org>
	<auhctwoLtdWs9p-7@gractus.seuss>
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

On Mon, 2 Nov 2026 20:49:48 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Sun, Nov 01, 2026 at 09:36:56AM -0700, Simon Glass wrote:
> > A dts file is made up of top-level fragments: the root node, later
> > definitions of a node by label or path, and /delete-node/ or
> > /omit-if-no-ref/ with a reference. We would like to deal with each
> > fragment on its own before it is merged, for example to apply deletes
> > consistently or to run some checks on each one, but that requires
> > keeping the fragments apart. At present the parser merges each one into
> > the tree as soon as it is parsed.  
> 
> Btw, I'm extremely open to a better name than "fragment" if one occurs
> to you.  I believe I originally thought of these as "overlays" but
> that's confusing since runtime overlays were invented.

"A dts file is made up of top-level fragments: the root node, later
definitions of a node by label or path"

A node reference by a label or a path is not a definition of node, it is
a reference to a node.

Once those references are merged (if possible), we only have a root node
and orphan nodes (nodes without a parent node). Indeed, those orphan nodes
reference a node out of the current devicetree (dts or dtb).

Orphan nodes are just references that cannot be merged in the current
devicetree.

Instead of "fragment", "unresolved" ?

&label {
   prop;
};

Is an unresolved node while &label is not resolved to an existing node.

We try to merge those unresolved nodes (label resolution + merge) and any
unresolved nodes that are not merged (label not resolved) are orphan nodes.

The exact same occurs when we use paths instead of label. The only difference
is that a path can always be resolved. Having an unresolved path is an error.

With that in mind, having a look at orphan nodes in the addon series [0] (patch 44
and following ones) could give some ideas.

Does it make sense ?

[0]: https://lore.kernel.org/devicetree-compiler/20260826094950.1088288-1-herve.codina@bootlin.com/

Best regards,
Hervé

