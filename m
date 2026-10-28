Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211925;
	b=y8fCBc8d7BQFGYRJ/sAuM6x39A84wOxD+Bklmzwexx5EndNR8n9zWvPHmFo3PbPxFS1z
	 UxQChDkF/mpjF0Fn4giQjjF8khNoJ/YPxjit+51fEQfoag/pvCxPYu16bWOvmZOaN4IWb
	 adw8YXeQxILQ/X0/vGHzKE+hwJpY7dIOlhOOzwvjZvWLH/1q2SBihi/dk4968fRh2IHrR
	 Z6A3z2r2B1Aux2QxJqh5lyzzddXC0oplHdH6G3+UbcKE6wFmMuUW0CzsKlMLFASEKdifB
	 jm2GxUVUfQz3wViStckm5X8AdGdKGX9kGY03vZtleG/gmFOEKDH2byouf/F47dZQysA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211925;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=SX1iodye6Q1WjC4UsuidVjNGcR8xh3X2yq7lsisj0sg=;
	b=CWOLIe4AndFLJa6yWKKJgwj5qjGQVKXsd+gQv6BccRqAwLZ5K5+ANoNMVwuajDU0Gij/
	 zgGvlXtlQY5x2k99/MYFT/UKfnJd6UxEHaZPPWAj5b5oZjwkIj/oQX6J5+bYN0xudxsKN
	 GHmqEFx9uRzItEmDLjzXKQm8/5UQHYCxIP004JyZiictGef0jyOY04THX3IekgwY5GxkS
	 bz5bgFRKbOpQ+58a5PrGEGDGsEmnxCRWo9igW0dLnizQVMpq8MpFOtH1D7myYEI2jua01
	 BZ0Z+YWjt3kxevBIJHr4d+3fynZbwmEkmrnsNMitgEd0kW5xU+IQplmn2c6G8rZo0Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cXwj+aWQ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9635606A31C
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 18:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9635606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cXwj+aWQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4D77B1A137B
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 18:25:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A06960769;
	Wed, 28 Oct 2026 18:25:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19CF11032909B;
	Wed, 28 Oct 2026 19:25:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793211920; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SX1iodye6Q1WjC4UsuidVjNGcR8xh3X2yq7lsisj0sg=;
	b=cXwj+aWQzps/zkTTXmYM4EiPJallnFMamX2kGYjRy23uw5a3wyw6oSOO67tZqfZCMkHqkk
	G8Xaww+ea3apqy95CQeq11+EshxTTes/iqHy/Jh+9TF3mPAFGZEg3zpZCDv4fw76Icwx56
	sw9CnHZclxyr6IBlBt1VkN02gom0lo5D+uHlgIoUXnP3y070h0V1SoxNff9XBQaP85Aq1x
	TE0vztKoiiX87ZaM/ANFSTPShM0w1num2zkkK9KATrhueE9qN9Eh6o7hDuZGWbMQ5HFsjt
	ckOnmR87NpDdt8qDovmPkptZUDicSQE46jLd9+xYbcMIYGfEPJbhTdxO7xIO+A==
Date: Wed, 28 Oct 2026 19:25:18 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 6/6] doc: dts-format: Describe later definitions and
 deletes
Message-ID: <20261028192518.534ab384@bootlin.com>
In-Reply-To: <20261028093620.3705074-7-sjg@chromium.org>
References: <20261028093620.3705074-1-sjg@chromium.org>
	<20261028093620.3705074-7-sjg@chromium.org>
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

On Wed, 28 Oct 2026 03:36:13 -0600
Simon Glass <sjg@chromium.org> wrote:

> dts-format.txt does not say that a node can be defined more than once,
> nor describe /delete-property/ and /delete-node/, so the rules for
> deletes in the earlier patches are not written down anywhere.
> 
> Add a section on how later definitions are merged and how deletes
> behave: within a definition, before a node or property is defined
> again, and in an overlay.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Add new patch to document deletes
> 
>  Documentation/dts-format.txt | 44 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
> index 41741df..d594822 100644
> --- a/Documentation/dts-format.txt
> +++ b/Documentation/dts-format.txt
> @@ -116,6 +116,50 @@ Version 1 DTS files have the overall layout:
>  * C style (/* ... */) and C++ style (// ...) comments are supported.
>  
>  
> +Later definitions and deletes
> +-----------------------------
> +
> +A node may be defined more than once, for example in an included file
> +and again in the file which includes it. A later definition refers to
> +the node by '&' followed by its label or full path in braces, or
> +repeats the path from the root. The definitions are merged in source
> +order: a property which is defined again takes the new value, and new
> +properties and child nodes are added.
> +
> +	e.g. / {
> +		serial: serial@1000 {
> +			status = "disabled";
> +			clock-frequency = <100000000>;
> +		};
> +	     };
> +
> +	     &serial {
> +		status = "okay";
> +		/delete-property/ clock-frequency;
> +	     };
> +
> +Within a node definition, a property or child node can be removed with:
> +	/delete-property/ property-name;
> +	/delete-node/ node-name;
> +and outside any node, a node can be removed with:
> +	/delete-node/ &label;
> +
> +* A delete removes the property or node as defined so far, including
> +  earlier in the same node definition, but not one defined after it.
> +  Outside an overlay, a delete within a node definition with nothing to
> +  remove is ignored.
> +
> +* A property or node which is deleted and then defined again comes
> +  after the existing ones, like any new property or node. A node defined
> +  again has only the properties and child nodes of its new definition.
> +
> +* In an overlay (a file with /plugin/), a delete can only remove
> +  something defined earlier in the same fragment, i.e. the same
> +  &label { ... } or &{/path} { ... }. An overlay cannot delete anything
> +  from the tree it is applied to, so dtc reports an error for a delete
> +  with nothing to remove in its fragment.
> +
> +

Not so sure:
--- 8< ---
/plugin/

&target1 {
	node: node1 {
		...
	};
};

/delete-node/ &node;  <--- It is not defined in the *same* fragment
--- 8< ---

Agree that an overlay cannot delete something in the tree it is applied to.
But /delete-node/ can be outside any fragments and delete something in a
fragment.

Best regards,
Hervé
