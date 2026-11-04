Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780960;
	b=rbQUY2tb48AwEyxQS1f3q2yA3m7RjvQpBG6L0HnhkLPT+wlgP8qOAZLP/v9TqSElcAup
	 tH8YzJdA/vUntwoMRWh2xuLx2bdz72oWdB7kX0VdZ8+gNJjioGY5EhuPS0FhOwgidWPki
	 eseJ47ET8yIGf7cO1xtI5nOQ22PnP3DL6u5uLsVxulCYGrI/yABzZHdT8PnYcMkPSSuW5
	 XDU0cwOGW7avpxAKjffaTfJoK/AV6d72oiKG2K+oaxJVNlWIlovCep0Rz25DakjjaX6hw
	 jWnNkIsnBmNEFej/bpNJ0DtHMFc/g56j2DK52twSVICsiwxsfWGEwQ4JmtbUgGxm/2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780960;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=SqzH8pL3bQOAQiGF7dgZUUW/zgPG9z39s0i3jayYVFA=;
	b=dE3wtodhf5A1oJP6NNiBkNairb1R2PD+scxZCw8dHrAboj6NXya8FNL6HKtozkwj2GCM
	 hcUPez5NHWKl0hUlwUeAaiARgM6R2LdevDQdmHN4ZAF2fvV5DSw38J//Ed8+wh+snruwv
	 K4kza4XERprFWlb3NhvZ90CrFlxpNXw2gEP3aFQATFMy3syNEVhozEf75+TjwbFzdWqge
	 yG8G9+wzF03m8eOngrp2Bjx4u3umWSXja4ZGyawmzB52ne7L6RM/VsC7A4LppYoipewXd
	 1WPpGZawTuDlwExZWyZn0JtoyZrHdVYdZTkU+LX4HqWVAXlJHOvaefOyPRgjHm2ulDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Qb7X8Llq;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB3E606A31B
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 08:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECB3E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Qb7X8Llq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B7B44E413F6
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 08:29:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1721660770;
	Wed,  4 Nov 2026 08:29:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21DF8103291D1;
	Wed,  4 Nov 2026 09:29:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793780956; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SqzH8pL3bQOAQiGF7dgZUUW/zgPG9z39s0i3jayYVFA=;
	b=Qb7X8LlqoJCgofzYksiLlZiq7479HUBsfQN79++LjRWzDc5nfYhNnVOpBYNamzUo8s9B8x
	Jq4N1hJDNep/jMYdk0lI8HeB9DcSt89JW5pXKejw/jj6z+EKnMINHa3lIMWT89+bROzseI
	xpjT5NkBaEwOH5ZGTcB+2PGqm0RyoqOnwkNtBwhwN+RLIozhoMpa+4NZLXNGHEj0d2ukp/
	/loR7hpTTlDQ7WZwjm1PwAIayd4fNNh7UD+aJyGVcNZTu2y/WqkDVmk6tLLn4YSdYeDhit
	yVT9HtunG5bdJQaNkK+NPLRIyhGQV+gzHS++RbQ8Ai1LS4MbMVvt4SWFMsch7Q==
Date: Wed, 4 Nov 2026 09:29:11 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree Compiler
 <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 02/13] dtc: Add a list for the top-level fragments of a
 dts file
Message-ID: <20261104092911.2f24be5d@bootlin.com>
In-Reply-To: <aurRguellIz-7spN@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
	<20261101163721.2458982-3-sjg@chromium.org>
	<auhctwoLtdWs9p-7@gractus.seuss>
	<20261103185620.3bba770a@bootlin.com>
	<aurRguellIz-7spN@gractus.seuss>
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

On Wed, 4 Nov 2026 17:32:35 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Nov 03, 2026 at 06:56:20PM +0100, Herve Codina wrote:
> > On Mon, 2 Nov 2026 20:49:48 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Sun, Nov 01, 2026 at 09:36:56AM -0700, Simon Glass wrote:  
> > > > A dts file is made up of top-level fragments: the root node, later
> > > > definitions of a node by label or path, and /delete-node/ or
> > > > /omit-if-no-ref/ with a reference. We would like to deal with each
> > > > fragment on its own before it is merged, for example to apply deletes
> > > > consistently or to run some checks on each one, but that requires
> > > > keeping the fragments apart. At present the parser merges each one into
> > > > the tree as soon as it is parsed.    
> > > 
> > > Btw, I'm extremely open to a better name than "fragment" if one occurs
> > > to you.  I believe I originally thought of these as "overlays" but
> > > that's confusing since runtime overlays were invented.  
> > 
> > "A dts file is made up of top-level fragments: the root node, later
> > definitions of a node by label or path"
> > 
> > A node reference by a label or a path is not a definition of node, it is
> > a reference to a node.
> > 
> > Once those references are merged (if possible), we only have a root node
> > and orphan nodes (nodes without a parent node). Indeed, those orphan nodes
> > reference a node out of the current devicetree (dts or dtb).  
> 
> Yes..
> 
> > Orphan nodes are just references that cannot be merged in the current
> > devicetree.
> > 
> > Instead of "fragment", "unresolved" ?
> > 
> > &label {
> >    prop;
> > };
> > 
> > Is an unresolved node while &label is not resolved to an existing node.
> > 
> > We try to merge those unresolved nodes (label resolution + merge) and any
> > unresolved nodes that are not merged (label not resolved) are orphan nodes.
> > 
> > The exact same occurs when we use paths instead of label. The only difference
> > is that a path can always be resolved. Having an unresolved path is an error.
> > 
> > With that in mind, having a look at orphan nodes in the addon series [0] (patch 44
> > and following ones) could give some ideas.
> > 
> > Does it make sense ?  
> 
> That's all true, but I don't see what you're suggesting.  Here I'm
> looking for a name for the syntactic top-level construct, whether or
> not it's resolvable within this file or not.
> 

struct node {
	...
	const char *ref;  /* Only orphan nodes doesn't have a name but a ref */
}

struct dt_info {
	struct node *root;
	struct node *orphanlist;
	...
}

When you parse, you create the orphanlist with orphan nodes (same order in the
list as the order in the dts) without trying to merge.

Once done, build_dt_info(..., root, orphanlist);

Then, in build_dt_info() or later:

reduce_orphans(struct dt_info *dt_info)
  - Handle deletes
    You have the root node and the orphan list with item in the same order as
    they are found in the dts. Deleting node available before the "/delete-node/"
    keyword should be doable.
  - Merge as much nodes as possible from the orphan list. This merge orphan
    nodes in either the root node or a possible previous orphan.

After this call:
 - All possible deletes have been handled
 - Orphans are reduced to real orphan without duplicates (merge done when
   possible).

For dts, this orphan list must be empty.
For overlay or addons, this orphan list can have items.

Perform the checks with this structure.

Generate output:
  For overlays: Convert to /fragment@N/... then generate the output
  For addons: no conversion needed, generate the output

Do we want to handle deletes at runtime ?
The only relevant is having an overlay or addon the capabilities to
delete an orphan node. In that case, at runtime, instead of merging
a delete is perform. This use case is not handle yet but to handle
them:

  - reduce_orphans(struct dt_info *dt_info)
    Delete what you can delete
    Keep orphans with delete flag in the orphan list (after reduction)
  - Generate output
     for orphan with delete flag, encode the delete information (new node
     metadata tag). Those orphan with delete flag should be empty. No
     property to merge, no node to merge. Indeed they are in the output
     just to tell that the related node in the base tree must be deleted.


Now checks(). The orphan list has been reduce to the strict minimum. Is that
ok for checks() you have in mind?


Best regards,
Hervé
