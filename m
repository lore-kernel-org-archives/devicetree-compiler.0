Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102520;
	b=BeX/ehiy4DN++56w8FthGEjCyTAP/VFe91y+PCj0qfSuP6SGbcAVdQAYN3Cts3mfwYeE
	 wzC0YjD4++/r6vS/9p1+g6uWd/mhG1mpsPbiMEVep74VIYMOKrACD3PLJmj7J1ipGh+FM
	 8XKZRrmJ9Q3yiS8X0Xa+qtrdXXpHPdvYoiLsTgOAUqskZVW11lPyLzTgSTse0rAT4X+fu
	 n7uxuLlkcFWKIJdTfbFo+rf3W9FXvQF83DonwREP80zezc44NhOxHWHRoMYMCbrorqVff
	 e3r4R/lZ0MkoBD/NRonjdwauC6q7hTZ+xx3zm2Z0f79MedeXycKQicGOae4Udf8rbsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102520;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=e5CzoLR1XvEiIB608JVNqRrrnEqnIe4RUaBXLGr1KZw=;
	b=3uZgUA9m+R6Tq1Cgo05VEHWYHV4FdJwPy0wABbMMy4te50svI3CV73X746TdqdUJO9+x
	 l/mpE0n8V5QJLyLICf4XPeE2EyWm/7AERYIeX/GtpCuR28RPdOM+AYDop7LnGXN8zfCLL
	 bEa460QIXRr1fvYulArDQ4ljD7GPys7U8E3rPEceocGbjHU3Cg+Ft/9xHxbqpeD4f4DOu
	 m7J9pxsP4NBDFkOWTPg8CRqxXOJfK4dPFYX623u8yWJTmpNok37qYJXbnSeVjc7XjqIaq
	 d2iFYMuAEYPgwoCguIN4gTT3Hz+fo9TidLATd17FPv/C+wiCuQ0e9Y9M8vM5pzc1e9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XbRJM0Vk;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11475606A339
	for <devicetree-compiler@vger.kernel.org>; Thu, 19 Nov 2026 15:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11475606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XbRJM0Vk
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 73CD24E4166D;
	Thu, 19 Nov 2026 15:35:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 392FC60237;
	Thu, 19 Nov 2026 15:35:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53C8511BC0CF6;
	Thu, 19 Nov 2026 16:35:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795102512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e5CzoLR1XvEiIB608JVNqRrrnEqnIe4RUaBXLGr1KZw=;
	b=XbRJM0VkOc1tAnlSWHEr0MWaluZ0sawPdaJags/tg3K/hYIIgAfJ/EIMjTUehfs+QoyHe5
	4AD4kllbO/0D/vAZzu7OLmU9RniLbkmz3WkWjpmplv0P1QnRrm1NiCctv5S4PD9dxS2aF/
	6/bnnhjq0JlT6k1/3RRjQRyrF2av8ARn0USJNXLEVVdgIe9WlIIA3R4P41eLjQudYkL4iJ
	JviGW/+KsZ53a/GA6wOym3riIu3UYeVKEZxXziohI1LvsOVeKtcyRdqqtB9oa1dmZSK0nv
	+NHhQOUoqHc0gOpiQ7Ujr4yXSjuFIKVrpphrAU6+b0C1XLZKN732GhsrQaHRPg==
Date: Thu, 19 Nov 2026 16:35:08 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree Compiler
 <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v3 16/18] dtc: Add the overlay fragments from
 merge_fragments()
Message-ID: <20261119163508.48721934@bootlin.com>
In-Reply-To: <avqCubv6DB--kLeB@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
	<20261106195159.2623314-17-sjg@chromium.org>
	<avqCubv6DB--kLeB@gractus.seuss>
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

On Mon, 16 Nov 2026 15:12:42 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Nov 06, 2026 at 12:51:43PM -0700, Simon Glass wrote:
> > In a plugin, merge_first_ref() and merge_ref() call add_orphan_node() to
> > turn a fragment which refers to the base tree into an overlay fragment
> > (a fragment@N node). The grammar actions have always done this, but it
> > mixes converting the plugin to the overlay format into the functions
> > which merge each fragment.
> > 
> > Have merge_fragment() tell its caller when a fragment is for the base
> > tree, and call add_orphan_node() from merge_fragments() instead, so that
> > none of the merge_*() functions does the conversion. Add a comment for
> > add_orphan_node() too.
> > 
> > This does not change the output.
> > 
> > Suggested-by: Herve Codina <herve.codina@bootlin.com>
> > Link: https://lore.kernel.org/devicetree-compiler/20261105100714.47bf0434@bootlin.com/
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> > dtc gives the same output and messages as before for every .dts and
> > .dtso file in Linux v7.3-12284-g3799eeb906c9
> > 
> > Changes in v3:
> > - Add new patch to add the overlay fragments from merge_fragments()
> > 
> >  livetree.c | 47 +++++++++++++++++++++++++++++++----------------
> >  1 file changed, 31 insertions(+), 16 deletions(-)
> > 
> > diff --git a/livetree.c b/livetree.c
> > index f2c7703..c5fec49 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -225,6 +225,15 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
> >  	return old_node;
> >  }
> >  
> > +/*
> > + * Add an overlay fragment (a fragment@N node) to the root of a plugin, for a
> > + * node which refers to the base tree. The node becomes the fragment's
> > + * __overlay__ subnode and ref gives its target, either a path (target-path)
> > + * or a label (target, as a phandle reference). Fragments are numbered in the
> > + * order they are added.
> > + *
> > + * Returns the root node, dt
> > + */
> >  struct node * add_orphan_node(struct node *dt, struct node *new_node, char *ref)
> >  {
> >  	static unsigned int next_orphan_fragment = 0;
> > @@ -611,9 +620,9 @@ static struct node *lookup_ref(struct node *dt, struct fragment *f)
> >  }
> >  
> >  /*
> > - * Make the tree at *dtp from a first fragment which refers to a label or path,
> > - * rather than being the root node. This is only valid in a plugin, where the
> > - * fragment becomes an overlay fragment.
> > + * Make an empty tree at *dtp for a first fragment which refers to a label or
> > + * path, rather than being the root node. This is only valid in a plugin, where
> > + * the fragment becomes an overlay fragment.
> >   *
> >   * Returns true on success, false on an error, which has been reported.
> >   */
> > @@ -628,9 +637,7 @@ static bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
> >  			     "Label or path %s not found", f->ref);
> >  		ok = false;
> >  	}
> > -	/* Make a new, empty tree with a fragment@N node for the reference */
> > -	*dtp = add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
> > -			       f->node, f->ref);
> > +	*dtp = name_node(build_node(NULL, NULL, NULL), "");  
> 
> This seems a bit awkward, since this operation no longer resembles any
> kind of merge.  Seems like it would be nicer to unconditionally create
> an empty tree in merge_fragments(), then "merge" everything into it,
> including root fragments.

In the future with addons, we could have a only orphan nodes.
Creating and empty in merge_fragments() will lead potentially an this empty
available even if no empty root nodes were present in DT.

This empty tree is needed for overlays. I don't think that having and empty
tree artifact created by merge_fragments is the right solution.

Best regards,
Hervé
