Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087143;
	b=gIv+UE5wYsjksgwM0El6iH8osOJXuuei8++NTufRWAOS7tlP4BOg8wQ+phxj9pTe6Kly
	 PlUrJbYvmcpKPJrzy25suGOSLRLhLrgHkMprtOvmRMbB9UOczpoGxjK8pkjtVKMnqaOib
	 JAi9v3jYlHjhbOD7Z7xL3rJYj8eY8aQGttIsscfmOVJQ7CKFJ0PrltLcTQEg/droRqZbF
	 HncO1lfsvSeSvHqvmDXvUkHDMFLabfwNSCLTZqSz7Adswk3TItO+5jyX3wMQvs0rdmx4E
	 rRApd5B07gA05V2GkTHFQlIUEr1FzZeJxBd90R5URTFIq7IJY9MhdQy4nWU18GxML4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087143;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=AdWJMc0HBXvun8HDZph4xoNGITKi5ST0D0I2rURIuv0=;
	b=g4mC8s0Zfs8z2DaH7brTf6vkOEDFWLWjxsVfbkp9wt6SXpGcQaIrqEMbbPZvCK7WLumu
	 i6qCW02iEGLfwZkb1PApjIPBtlZFLEVXVxSmAnOTiQUebZ/UtHJZRjSwMEWNc9o9o0X+n
	 ARsyM/8+z8xn1HXN0ewtkx6lWny1UmRvfpjhjpj0QH9GEXdylaxb100DHjgoIWJxOzet1
	 90I1MIP2PuKU4qwGqAAk6BMHJ1f3/AsLgx3veWXgp5Si3zzh7PbH+YNJizQXamto4DVWJ
	 hpN+2Iqxs1WvCUQExMNRJ67fmYtxttIpu06dZAaJ3JLmO9OdGdZhf7UmaxeiaMoSyRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Sb9/HSh2";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D634F606A31B
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 07:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D634F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Sb9/HSh2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1FE661A135D
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 07:45:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB7B1603BD;
	Tue, 27 Oct 2026 07:45:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE89B10329027;
	Tue, 27 Oct 2026 08:45:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793087139; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AdWJMc0HBXvun8HDZph4xoNGITKi5ST0D0I2rURIuv0=;
	b=Sb9/HSh2RCcezZAJvmBkR3SC2onDqkzLBzHXpHqibCwbEb1kewrP5dPiC/ZH7/IaFXPYl5
	gxzRr3MazNRX61dM49tjqKtnyjO7hdjj4dGVovU/UNB56AuhqYWhmiVXwuKoM+ABso3y9P
	J23PbFhRaMSCQqyRiAc1lEPP4a6WaFJOcSuB5cuRAPey5WdcP1PAhWtzK7jbDHDH0NQDt9
	2RrgjvGXcqLHzeLA03siLVaLvvk2ddGvBasXU49Nq9FSsw7K0plY1OYLV5jLcJZDhX4eau
	V//6e/UTFvNrcsaZN9KO94RjTveup5p05BYnDx5jsMjA6CrxOETahyoPHxSUjg==
Date: Tue, 27 Oct 2026 08:45:37 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/2] dtc: Remove a deleted node or property from the
 tree
Message-ID: <20261027084537.49cb1dcb@bootlin.com>
In-Reply-To: <20261026173529.3080952-3-sjg@chromium.org>
References: <20261026173529.3080952-1-sjg@chromium.org>
	<20261026173529.3080952-3-sjg@chromium.org>
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

On Mon, 26 Oct 2026 11:35:20 -0600
Simon Glass <sjg@chromium.org> wrote:

> Deleting a node or property only flags it as deleted, leaving it in
> place. If a later section adds it again, merge_nodes() finds the flagged
> entry and revives it where it was, along with its subnodes, which come
> back in their old order before any new ones. So deleting a node in
> order to redefine it does not give the order which the source shows.
> 
> Unlink a node or property from its parent when deleting it, so that
> adding it again creates a new entry after the existing ones. Nothing
> deleted then stays in the tree while parsing, so merge_nodes() has
> nothing to revive and can skip deleted entries like everything else.
> 
> Leave the node's next_sibling alone, since fixup_omit_unused_nodes()
> deletes nodes while walking over their siblings.
> 
> Note that this changes the output of existing dts files. When a dts
> deletes a node or property and then defines it again, the new definition
> now comes after its siblings instead of taking the old one's place, and
> its subnodes come in the order of the new definition alone.

Yes, makes sense.

> 
> This is the better behaviour because:
> 
> - Deleting is how a dts says to start again. A dts which wants to keep a
>   node's place can override the node without deleting it, since merging
>   already updates a node in place
> - Node order can matter. In issue 174, U-Boot's binman builds an image
>   from a node which is deleted and defined again, yet the image comes
>   out in the old order. The only workaround is to define the nodes in
>   the wanted order before including the file which defines them
> - It matches the previous patch, in which a node deleted and defined
>   again within a section, or deleted in the first section and defined
>   by a later one, already comes out where the new definition is
> 
> Closes: https://github.com/dgibson/dtc/issues/174
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---

LGTM.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
