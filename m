Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3467B3A2544
	for <devicetree-compiler@vger.kernel.org>; Tue,  8 Sep 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854918; cv=none; b=nIJ1IAEL0KAFO0XMJRxqcfhbwAbFN8Ais1dLop+7iRyrSe3AgvmpG3tv6STCvYaWwsKa5zctXfq72pW3461b3KjGYjspxAa1i9ORaGr684eLehJZ9EUlK5/umkfWQeozTq22Fuk5/TlYLhESludDI2vAHR9Ij1gbEsbGlN/V/6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854918; c=relaxed/simple;
	bh=2wZ2doXUzi2aIm4V/ENGB8bCQcoIBkHuFL+g4v5WD2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QGmVds5H1pq+t9D2ksoeUMG374L7GlZqxoPHuz9PmDvEUkb4DZHYAsJUszBVmMzaSufNmHzHrhplmu0BlFF1xFrGE+v8fjjPTs3zO7KgEWeOyD/lSUMsFX5SwJfHzSm7IAKv8fVqW0ELbcjeoIvISgys6q1lB7skDPbXvWz7ZbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XlTUbEI0; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XlTUbEI0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3BDDD4E41586;
	Tue,  8 Sep 2026 08:08:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3CD1603C4;
	Tue,  8 Sep 2026 08:08:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0338C11C79CA0;
	Tue,  8 Sep 2026 10:08:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788854911; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t9CpF3Le5x9tMB87TR8LLv1UIQckiSWM3QvppfwLAuE=;
	b=XlTUbEI0fCK/KYY2AvvBs+2I7A/rds/KJrtROXCiFag0p88KmA3A53DIoZGx9aaB3y94iZ
	8N3T/2qlGCieZyw/39vPOpBijPt4KSaAg3xQF2HBvDzQLmjwezYNPBnOclOWlIKwbtEYTE
	V/Jn4Go0wMIkYuxw5RwcYuzcDmHvBCiNMEEb6moFFB0u2CQ1ArLlqsMBHoBoGOnWOnX6Kb
	7I0w4OluzgaB2kXFy3e+HNF0G0jCx9uRGDsWVPo32bs2Dq2SFyKGJqBdxadX0uMFvupvr8
	Q/Qc5HH4jMwb0ZMPblkQSNcNkCPVSFUZLZWyf0FQxTwzM2Y+XUPWzELJZLyT8g==
Date: Tue, 8 Sep 2026 10:08:23 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 02/15] libfdt: Don't assume the root node is
 available at offset 0
Message-ID: <20260908100823.1f474894@bootlin.com>
In-Reply-To: <ap-t8qMg5VMwh-T9@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-3-herve.codina@bootlin.com>
	<apOhk-NQusFgV5Sx@gractus.seuss>
	<20260831140119.1f14b420@bootlin.com>
	<apaBuQ8kn2bOzYcI@gractus.seuss>
	<20260901141826.49b1a1b7@bootlin.com>
	<apfKx_u3v3GBfzOz@gractus.seuss>
	<20260907184641.537cfa49@bootlin.com>
	<ap-t8qMg5VMwh-T9@gractus.seuss>
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

On Tue, 8 Sep 2026 16:41:06 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Sep 07, 2026 at 06:46:41PM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Wed, 2 Sep 2026 17:06:03 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> > 
> > ...  
> > > > 
> > > > Ok, I will update fdt_check_node_offset_() to have it updating its offset
> > > > parameter to the real offset of the root node when its value is 0.
> > > > 
> > > > Based on this update, will see where it goes. I mean, impacts on callers, if
> > > > it simplifies things or not, if the offset update needs also to be propagate
> > > > to caller's parameter or any other similar point that we can see during the
> > > > implementation.
> > > > 
> > > > Having something implemented and available in a patch will be the best to
> > > > compare changes and impacts related to fdt_check_node_offset_() update.
> > > > 
> > > > Here we have a version of handling offset 0 vs real root node without any
> > > > offset update done in fdt_check_node_offset_(). In the next iteration we will
> > > > have the version with update done in fdt_check_node_offset_().
> > > > 
> > > > I think the golden rules to follow on this point is "keep it as simple as
> > > > possible".    
> > > 
> > > Agreed.  Feel free to repost just the NOP before root patches on their
> > > own.  At this time, frequent small series is easier for me to tackle
> > > than occasional large series.
> > >   
> > 
> > I've moved forward on the fdt_check_node_offset_() update.
> > 
> > The new fdt_check_node_offset_() looks like this:
> > --- 8< ---
> > int fdt_check_node_offset_(const void *fdt, int *offset)
> > {
> > 	int nextoffset;
> > 
> > 	if (!can_assume(VALID_INPUT)
> > 	    && ((*offset < 0) || (*offset % FDT_TAGSIZE)))
> > 		return -FDT_ERR_BADOFFSET;
> > 
> > 	if (*offset == 0) {
> > 		*offset = fdt_root_offset(fdt);
> > 		if (*offset < 0)
> > 			return *offset;
> > 	}
> > 
> > 	if (fdt_next_tag(fdt, *offset, &nextoffset) != FDT_BEGIN_NODE)
> > 		return -FDT_ERR_BADOFFSET;
> > 
> > 	return nextoffset;
> > }
> > --- 8< ---  
> 
> That looks fine.  If it was an exposed function I'd want to look for a
> better interface, but as an internal function it's fine.
> 
> > If the given offset is 0, fdt_check_node_offset_() considers we want to check
> > the root node and so update offset to the real root node offset.
> > 
> > Ok, I still need some fdt_root_offset() calls from some other parts but that's
> > not my main issue.
> > 
> > My main issue comes with orphan nodes in addons. fdt_check_node_offset_() is
> > called with offset pointing to an orphan node and this offset can be 0.
> > 
> > The offset 0 seen by fdt_check_node_offset_() can be the "fake" offset of a root
> > node and in that case fdt_check_node_offset_() should update offset to the real
> > root node offset but it can also be the offset of the orphan node we want to check
> > and in that case the offset should not be updated.
> > 
> > fdt_check_node_offset_() cannot determine whether or not the offset should be
> > updated.  
> 
> Hrm.  But if offset 0 has an orphan node, we can see that with the
> FDT_BEGIN_NODE or FDT_BEGIN_NODE_REF there, right?
> 
> > With orphan nodes in the loop, fdt_check_node_offset_() becomes:
> > --- 8< ---
> > int fdt_check_node_offset_(const void *fdt, int *offset)
> > {
> >         int nextoffset;
> >         uint32_t tag;
> > 
> >         if (!can_assume(VALID_INPUT)
> >             && ((*offset < 0) || (*offset % FDT_TAGSIZE)))
> >                 return -FDT_ERR_BADOFFSET;
> > 
> >         if (*offset == 0) {
> > #pragma message "We have a problem!"
> >                 /*
> >                  * An orphan node can be present at offset 0.
> >                  * In that case, looking for the root node may or may not be
> >                  * correct.
> >                  * Indeed is offset = 0 requested because we want the root
> >                  * node and sadly an orphan node is available at offset 0 or
> >                  * is it requested because we want to really check the orphan
> >                  * node available at offset 0. How to determine the correct
> >                  * case?
> >                  */
> >                 tag = fdt_next_tag(fdt, *offset, &nextoffset);
> >                 if (tag == FDT_BEGIN_NODE || tag == FDT_BEGIN_NODE_REF)
> >                         return nextoffset;
> > 
> >                 *offset = fdt_root_offset(fdt);
> >                 if (*offset < 0)
> >                         return *offset;
> >         }
> > 
> >         tag = fdt_next_tag(fdt, *offset, &nextoffset);
> >         if (tag != FDT_BEGIN_NODE && tag != FDT_BEGIN_NODE_REF)
> >                 return -FDT_ERR_BADOFFSET;
> > 
> >         return nextoffset;
> > }
> > --- 8< ---  
> 
> Right.. like that.  Except simpler would be to have fdt_root_offset()
> stop when it sees a FDT_BEGIN_NODE_REF as well as a FDT_BEGIN_NODE.
> Or maybe that should be, say, fdt_root_offset_(), and
> fdt_root_offset() will wrap it to return an error on an addon tree
> with no root.

No, fdt_root_offset() must get the root node offset. An orphan node identified
with FDT_BEGIN_NODE_REF cannot be a root node.

An addon can have, a root node only, orphan nodes only or both a root node and
orphan nodes.

fdt_root_offset() looks for the root node (i.e. the first FDT_BEGIN_NODE at
top level). If not found, -ERRNOTFOUND (addon) or -ERRBADSTRUCTURE (not addon).

Having a fdt_root_offset() stop at either FDT_BEGIN_NODE_REF or FDT_BEGIN_NODE
is "fdt_first_node_offset()".

Let me introduce the internal fdt_first_node_offset_()
- fdt_root_offset()
  It calls fdt_first_node_offset_() and check that this node is a
  FDT_BEGIN_NODE node.

- fdt_check_node_offset_()
  if the offset == 0, it updates the value with the offset returned by
  fdt_first_node_offset_()

And so, a node offset 0 doesn't means the root node but the first node
in the dtb (root or orphan). I am totally fine with this definition.

At some point, maybe users of the API (when addon are involved) will have to
take care of that and perform something like:
  root = fdt_root_offset();
  fdt_get_property(fdt, root, "prop", NULL);

Or
  fdt_for_each_orphan(orphan, fdt) {
     fdt_get_property(fdt, orphan, "prop", NULL);
     ...
  }

Here also, I am totally fine with that an I already use this kind of sequence
in libfdt/fdt_addon.c to apply an addon on a base dtb.

I will introduce fdt_first_node_offset_() but let me know if you prefer
having fdt_first_node_offset_() introduced right now in this "structure
tags" series or later in the addon series.

Best regards,
Hervé
