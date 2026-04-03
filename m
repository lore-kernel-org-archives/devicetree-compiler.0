Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990FC32E6BD;
	Fri,  3 Apr 2026 07:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200041; cv=none; b=qHK0uRBaJa4A5QScDj3J6foQU0Nbiskp7BfgnVT9gm4tNtbmeGf5GXvM3rjGO2pDuNTvvMDDLY8rOu4/T4jzgQVT3zJV3+TlB7dFJkwyHtlIE3UHMNL8w2xRP3nXr4IZxPyUDG8m7lFDvdtpYfn1j+aGv672ckoZIXfMqeREdRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200041; c=relaxed/simple;
	bh=HQ0WzPvVM65rQtVgEMV7CsRIRBV77pyZQcMintELxxM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dgK1iX8HXmS6QW+ENL+Q2edn9szQTGq0HFl6QB2OkDZuJocGB1Yve2eIVseRZ1VdJQv9ZlLTRDySdccLJMzXU6UEMzQ5qyC2iCOPh32Yc0axDmjCDex2ETVW2u+yGwuxoXC/gMONZy54Rma7Q/1uin65z+ncmPQ0m5+W5PGZmqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZUDJum8C; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZUDJum8C"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F09D64E428C5;
	Fri,  3 Apr 2026 07:07:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5C47603C1;
	Fri,  3 Apr 2026 07:07:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 245BA10450279;
	Fri,  3 Apr 2026 09:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775200035; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HylyLsnRzx35/dYQl7AED0QkFwj94BhsyPXiRhJsHG8=;
	b=ZUDJum8CnkqVS6ILtmbvfweIflY/nHwxsyu3prVQk3WqMw76Tbb5uTKKwn5F4cTD899pcN
	C5CPmNDjr4V00dpKDgI33M6cLqyIuflLGpkQkZa27O4lG/G3+Zwys+n4r6w8IpWqXzQJ7E
	s6p+yvnpVopjMquzxHTNDAqQY6VZ5lj7OXAAV2WI2M58RxHnmIAKDZiDLheBejdWVpyFHx
	nAkxbgeTq/zIr1vBxwjoyENPKJJru1CCFViGN+1fX42CTyDXS/Q0j4wRnFVZ5TaZ+B3dJE
	BC5xO+R/wVI+f8dv7xRG92CyPqETP8IT8XpBxsLGLU2BmxFkRD2e+BEwQJY5FQ==
Date: Fri, 3 Apr 2026 09:07:08 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "David Gibson" <david@gibson.dropbear.id.au>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Ayush Singh" <ayush@beagleboard.org>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>,
 <devicetree-compiler@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree-spec@vger.kernel.org>, "Hui Pu"
 <hui.pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 05/15] libfdt: Introduce fdt_first_node()
Message-ID: <20260403090708.5d7e8ea9@bootlin.com>
In-Reply-To: <DHHWXNCDAWG9.2LYVXAWG8RBTY@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-6-herve.codina@bootlin.com>
 <DHHWXNCDAWG9.2LYVXAWG8RBTY@bootlin.com>
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

Hi Luca, David,

On Wed, 01 Apr 2026 17:11:15 +0200
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> Hi Hervé, David,
> 
> I'm trying to review the patches that have no feedback so far.
> 
> Being new to the dtc codebase I'm mostly pointing out things that are not
> clear from a newcomer point of view. I hope this helps anyway.
> 
> On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> > In several places, libfdt assumes that a FDT_BEGIN_NODE tag is present
> > at the offset 0 of the structure block.
> >
> > This assumption is not correct. Indeed, a FDT_NOP can be present at the
> > offset 0 and this is a legit case.  
> 
> I wonder whether this can be proven by showing an example, or the specs, or
> whatever use case that makes sense.

I can point the device-tree specification and add the following:
--- 8< ---
Indeed, the FDT_NOP definition according to the device-tree specification [0]
is the following:
   The FDT_NOP token will be ignored by any program parsing the device
   tree. This token has no extra data; so it is followed immediately by
   the next token, which can be any valid token. A property or node
   definition in the tree can be overwritten with FDT_NOP tokens to
   remove it from the tree without needing to move other sections of
   the tree’s representation in the devicetree blob.

Nothing refers to any location for this tag and it has to be simply ignored.
Having this tag at offset 0 doesn't make an exception, the tag has to be
ignored.

[0] https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter5-flattened-format.rst?plain=1#L317
--- 8< ---

> 
> > Introduce fdt_first_node() in order to get the offset of the first node
> > (first FDT_BEGIN_NODE tag) available in a fdt blob.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  libfdt/fdt.c             | 25 +++++++++++++++++++++++++
> >  libfdt/libfdt_internal.h |  1 +
> >  2 files changed, 26 insertions(+)
> >
> > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > index 56d4dcb..676c7d7 100644
> > --- a/libfdt/fdt.c
> > +++ b/libfdt/fdt.c
> > @@ -252,6 +252,31 @@ int fdt_check_prop_offset_(const void *fdt, int offset)
> >  	return offset;
> >  }
> >  
> 
> Even though this seems to be quite uncommon in this repository, I think
> documenting new functions would be helpful, especially preconditions,
> postconditions and parameter values when not obvious.
> 
> What about:
> 
>   Find the initial node with content (FDT_BEGIN_NODE) in a fdt, skipping
>   FDT_NOP [and <other tags> is applicable].
> 
>   *return: pointer to the first node into the fdt or e negative error value

As you already said, documentation is quite uncommon here.

I would prefer to keep the code consistent and avoid adding documentation for
some functions and not others.

On the other side, adding some documentation could be beneficial.

David, what do you prefer?

Should I document new functions I introduce?

Best regards,
Hervé
