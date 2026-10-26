Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004166;
	b=kwMdnpVY3WA5tA8X8u8NqKsDsxo/0mutu2DbmQoAcHojx7FzZkkFH+rOBa+ZZFXdS/FR
	 6k9HzNLbFkZAqfDtnFKrPh3OE1MNvkLFgsIGbNAS/X1TUMicVajMyi3lg26naTjq+SEWq
	 Uc1Xm7ek6xLZMN495a1tl5Z9Xtcz+iLq4QZts8dac4x5c7hPJ1I0dhUA2Uf4hY8rNRTx5
	 p/XKxLq7dNrGnorsHWH0Wb+QcoLwqmMSaql5tNfrrJtRdtSTWDOKq8OeRLzPaZfEelW7B
	 gfKgkkRSqzuYjylJy5JRWWjrxlCB7+Evn8uXgmwR4cwOJg4xdA2hKq3GDpKNqTAWNKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004166;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=w9zDGsmD29DpZOULSKNvoWH8ekprdNM6cjnLINh6SXQ=;
	b=RoaNbcXEPG12+iPhf3x6dqBaYIqgrlBQYuAWFTy2Z47DoWNZa/IUxzl4CYX0gS8DvejP
	 obrRlN0GYv0XskC1EB5PB6UV7aRe1sE3ZSEWKMJxStkwOojmf0cFT/tZo8ESc83SUY0vX
	 vKPhie5lSSS3YCqh2AWQcZTRVFt74gMIQTWiV6vC1Azof+GZ9uCZfpaMF6Plp62p4UlLo
	 QEbhAwoL9zlUl1BTGiAcsDToOy32mj6H+17fJhpGcTwDIayHEWX4ZnZHQzRqg5XQDDaZS
	 +Sraxgh3Ilirk3yKqAum/1WsdyOBqJZijmugEraU4Uq3+a+SMlvqWOG2CB0mJ1qmprA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="R4k8f0v/";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CF5606A31B;
	Mon, 26 Oct 2026 08:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2CF5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=R4k8f0v/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1F09EC5147F;
	Mon, 26 Oct 2026 08:43:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1151A60740;
	Mon, 26 Oct 2026 08:42:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEFE610329035;
	Mon, 26 Oct 2026 09:42:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793004160; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w9zDGsmD29DpZOULSKNvoWH8ekprdNM6cjnLINh6SXQ=;
	b=R4k8f0v//nZLII4g+DasetLKKr6AMX9kxGJlap154f//cutqnRd2MirRqu96zkcfTrSKBB
	5pXBkMpkb0ZEjXpW0tt5UL/tHNGZlNpP90vDih6Cf9gT7ByjPRKUoN51zvoUFW9pLa23P6
	912JvNf9PwMuU81ybuZJWjQsEBU++ZrSPCPQ1l/RuQyo+z/qJRNgj9CJ9rbWNHZ5+YqNVj
	S5dsUTyquAxqwwkWK1uJUpEWtLvBDcR2ojg4fDTdHnTu7vv8UkzUXbTIgUgbJ//TKTBqxo
	Qfhb+GzHEv5o7QthTO6mAS2eUDhSLIdNY/CXxEa1c2RIByEGD8ScTiDy4OijzQ==
Date: Mon, 26 Oct 2026 09:42:33 +0100
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
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
Message-ID: <20261026094233.0f5f8270@bootlin.com>
In-Reply-To: <at1lLjOGvo34dXZI@gractus.seuss>
References: <as3ZWBr3wRonkxXF@gractus.seuss>
	<20261013190347.4f1d9b9d@bootlin.com>
	<atGzdxETQZ9ovJFh@gractus.seuss>
	<20261019151121.26d99f30@bootlin.com>
	<atgi4rMsw5W6kKkS@gractus.seuss>
	<20261021172043.4bbd2bc5@bootlin.com>
	<atmASGg1OZt9jfXI@gractus.seuss>
	<20261022151454.67125e41@bootlin.com>
	<atrNI_hqwxvfsRj7@gractus.seuss>
	<20261023105511.3ad2bc4d@bootlin.com>
	<at1lLjOGvo34dXZI@gractus.seuss>
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

Hi David,

On Sun, 25 Oct 2026 13:11:14 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Oct 23, 2026 at 10:55:11AM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Fri, 23 Oct 2026 13:57:54 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Thu, Oct 22, 2026 at 03:14:54PM +0200, Herve Codina wrote:  
> > > > Hi David,
> > > > 
> > > > On Thu, 22 Oct 2026 14:17:38 +1100
> > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > >     
> > > > > On Wed, Oct 21, 2026 at 05:20:43PM +0200, Herve Codina wrote:    
> > > > > > Hi David,
> > > > > > 
> > > > > > On Wed, 21 Oct 2026 13:26:49 +1100
> > > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > > >       
> > > > > > > > 
> > > > > > > > Ok, my proposal seems to be a no-go and so I will follow your proposal given
> > > > > > > > above.        
> > > > > > > 
> > > > > > > To be clear, I'm rejecting the original proposal because I think it's
> > > > > > > internally inconsistent (if you follow the consequences of decisions
> > > > > > > far enough).  I'm not necessarily opposed to something other than the
> > > > > > > above, as long as the rules for when unknown tags must be invalidated
> > > > > > > (and what that does to the version) are made very clear in the
> > > > > > > structured tag spec.  e.g. see an alternative proposal below.      
> > > > > > 
> > > > > > No problem, I understand your point.
> > > > > > 
> > > > > > ...
> > > > > >       
> > > > > > > 
> > > > > > > Essentially the theory of the proposal above is to be maximally
> > > > > > > conservative: any write (adding, removing, changing, in-place,
> > > > > > > whatever) will invalidate all unknown tags and downgrade the version.
> > > > > > > 
> > > > > > > 
> > > > > > > But, here's an alternative proposal for invalidation/version semantics
> > > > > > > that I think is consistent, while being a bit closer to your original
> > > > > > > proposal.
> > > > > > > 
> > > > > > > 1. version and last_comp_version retain their meanings.  No new header
> > > > > > >    version.      
> > > > > > 
> > > > > > Ok
> > > > > >       
> > > > > > > 2. If version >= 18 the tree may include any structured tags, even if
> > > > > > >    they weren't defined as of v18.      
> > > > > > 
> > > > > > Ok
> > > > > >       
> > > > > > > 3. Some future version might _require_ certain structured tags to be
> > > > > > >    present.  But a client must only rely on those tags if the version
> > > > > > >    indicates it can.
> > > > > > >      - e.g. suppose FDT_FOO tag is introduced in v20.  A client
> > > > > > >        reading a v19 tree _might_ see some FDT_FOO tags (because of
> > > > > > >        (2)), but cannot rely on them being present in all the places
> > > > > > >        they should be.      
> > > > > > 
> > > > > > Ok, kind of degraded mode. Whether or not a v20 compatible client can continue
> > > > > > or not will depend of each tags known by this v20 client. For some tags, having
> > > > > > them removed will not be a problem whereas it will be a problem for some other.      
> > > > > 
> > > > > Exactly.
> > > > >     
> > > > > > Makes sense.
> > > > > >       
> > > > > > > 4. Any write to a property (including in place) invalidates all
> > > > > > >    unknown tags on that property (they must be stripped)      
> > > > > > 
> > > > > > Ok
> > > > > >       
> > > > > > > 5. Any write to a property invalidates all unknown tags on that
> > > > > > >    property's node      
> > > > > > 
> > > > > > Will see in the implementation. The offset of the written property will be
> > > > > > incorrect after the write. Indeed, some tags (tags related to the node)
> > > > > > available before the property can be removed. With splices instead of
> > > > > > FDT_NOP, offsets change.      
> > > > > 
> > > > > Oh, good point, this rule doesn't work.  I think we still have a
> > > > > consistent set of rules if property writes don't invalidate parent
> > > > > node tags (subnode add/delete still would).  Of coutse, that does
> > > > > further restrict what sorts of information you could safely put in
> > > > > node tags under this scheme.
> > > > >     
> > > > > > This also brings a question. Are API functions such as fdt_get_property_by_offset_w()
> > > > > > need to be deprecated?      
> > > > > 
> > > > > I think we can keep it - kind of like fdt_next_tag() this is a
> > > > > low-level function.  If you use it, you're opting in to having to deal
> > > > > with tag invalidation.
> > > > >     
> > > > > > Those kind of functions return a pointer to the data of a property for modification
> > > > > > by the caller. We don't know if the caller will modify or not the property.
> > > > > > 
> > > > > > Without deprecated it we can change the function to
> > > > > > ---- 8< ----
> > > > > > struct fdt_property *fdt_get_property_by_offset_w(void *fdt,
> > > > > > 						  int offset,
> > > > > > 						  int *lenp)
> > > > > > {
> > > > > > 	int new_offset;
> > > > > > 
> > > > > >         /*
> > > > > >          * The modification is goind to be done out of libfdt.
> > > > > >          * Unknown tags are removed (rules for modification when unknown tags
> > > > > >          * are involved) but also known tags. Indeed, we cannot know if the
> > > > > >          * modification will have impacts on known tags
> > > > > >          */
> > > > > > 	new_offset = fdt_remove_all_tags_due_to_property_modification(fdt, offset);
> > > > > > 
> > > > > > 	return (struct fdt_property *)(uintptr_t)
> > > > > > 		fdt_get_property_by_offset(fdt, new_offset, lenp);
> > > > > > }
> > > > > > ---- 8< ----
> > > > > > 
> > > > > > The idea is to be conservative here also and consider that property data retrieved
> > > > > > for writing will be modified by the caller.
> > > > > > 
> > > > > > Also, the offset used as parameter of fdt_get_property_by_offset_w() is no more
> > > > > > valid after the call.
> > > > > > 
> > > > > > Last point to have in mind, getting the node offset from the property offset will
> > > > > > need to walk the tree from the beginning. It can be costly.      
> > > > > 
> > > > > Right, that's what I was thinking of when I said this might not be
> > > > > practical to implement.  It's doable in the common case where we alter
> > > > > properties by node offset + property name, but not when we use a
> > > > > property offset.  But the fact that this would change the offset of
> > > > > the property in queestion is a much bigger showstopper.
> > > > >     
> > > > > > > 6. Adding or deleting a property on a node invalidates all unknown tags
> > > > > > >    on the node      
> > > > > > 
> > > > > > Ok.
> > > > > >       
> > > > > > > 7. Adding or deleting a subnode invalidates all unknown tags on the
> > > > > > >    node      
> > > > > > 
> > > > > > Ok.
> > > > > >       
> > > > > > > 8. Whenever a tag is invalidated and stripped, the overall version
> > > > > > >    must be downgraded (to let clients know they can't count on tags
> > > > > > >    being present)      
> > > > > > 
> > > > > > Ok.
> > > > > >       
> > > > > > > 
> > > > > > > Points (4)-(7) are all somewhat negotiable.  In particular, I'm not
> > > > > > > sure how feasible (6) is to implement.      
> > > > > > 
> > > > > > Well, this new proposal is more complex to implement than your first
> > > > > > proposal but it has a finer grain to handle unknown tags on modification.      
> > > > > 
> > > > > Certainly - that's why I proposed the other one first :).
> > > > >     
> > > > > > I can try to implement something based on this new proposal.      
> > > > > 
> > > > > To be clear, I kind of prefer my first proposal still.  The question
> > > > > is whether what the updated scheme buys (preserving more tags when a
> > > > > bootloader makes minor writes) worth the added complexity of
> > > > > implementation.  You're better placed to answer that question than I
> > > > > am.    
> > > > 
> > > > I would like to avoid bootloaders being blocking points and so:
> > > >  a) They should not failed if they encounter an unknown skippable tag.
> > > >     We are in sync on this point.
> > > > 
> > > >  b) They should preserve tags as much as possible.
> > > >     The goal is to allow following software components (probably the Kernel)
> > > >     to handle new tags.
> > > >     This is the point where the right balance has be found.    
> > > 
> > > Right.  I understand why these are both desirable.  However (b) is
> > > pretty tricky, because of the question of invalidation.  It
> > > necessarily involves a tradeoff between how much can be preserved
> > > versus what sorts of information future tags can carry.
> > >   
> > > > Your first proposal is maybe too much aggressive on b). That's why, even it
> > > > is more complex to implement I would prefer your last proposal (taking into
> > > > account the property offset issue) which can be summarize with the following
> > > > table:
> > > > 
> > > >                       | existing prop | existing node (1)   | Downgrade
> > > >                       | unknown tag   | unknown tag         | version (2)
> > > > ----------------------+---------------+---------------------+-----------
> > > > Modify a property (5) |    Remove     | Keep (3) 	    | Yes
> > > > Add a property        |    NA         | Remove              | Yes
> > > > Delete a property     |    Remove     | Remove              | Yes (4)
> > > > Add a sub-node        |    NA         | Remove              | Yes
> > > > Delete a sub-node     |    NA         | Remove              | Yes
> > > > ----------------------+---------------+---------------------+-----------    
> > > 
> > > Great summary, thanks.
> > >   
> > > > (1) The existing node is the node were the property or sub-node involved
> > > >     are present. Not all nodes, not the parent node but the node directly
> > > >     impacted by the modification.
> > > > 
> > > > (2) We downgrade the version only if tag are removed. If no unknown tags are
> > > >     involved (and so not removed), the version will not be be downgraded.    
> > > 
> > > Sadly, that doesn't work.  We have to downgrade on property
> > > modification for the same reason we must downgrade on adding a
> > > property: it might be adding data that requires certain tags in the
> > > later version.  
> > 
> > Oh yes, I missed that point.
> > 
> > (2) The version is always downgrade on any changes (modification, addition,
> >     deletion of a property or a sub-node) even if no tags are removed.
> >     Indeed the modification done (even a property or sub-node deletion) can
> >     requires certain tags in the later version.
> >     Downgrading the version on all changes is the way to state that the
> >     resulting dtb may be no more compliant with the later version.  
> 
> Probably wants some editing for clarity in the final version, but
> basically sounds good.
> 
> > > > (3) Removing unknown tags in the node when a property is modified will lead
> > > >     to the property offset change. Prefer avoid the property offset change
> > > >     and so keep node related unknown tags in that case.    
> > > 
> > > Right, if we did that it would basically mean totally (and
> > > incompatibly) redesigning the libfdt interface.
> > >   
> > > > (4) The version is downgrade only if we remove some tags related to the
> > > >     node. If we remove only tags related to the property we delete, there
> > > >     is no reason to downgrade the version.    
> > > 
> > > Unlike (2), I'm not certain if this one is unsafe.  But I suspect it
> > > might be, and having it behave differently from case (2) seems
> > > confusing to me.  
> > 
> > Hum ok, let be conservative and remove the note (4).
> > 
> > The updated note (2) handles all modification. On any changes with and without
> > tag removal, the version is downgraded.  
> 
> Ok.
> 
> > > > (5) All property modifications done outside libfdt using directly the
> > > >     property data pointer will not lead to any unknown tag removal.
> > > >     
> > > >     This point is for the usage of fdt_get_property_by_offset_w(),
> > > >     fdt_get_property_namelen_w(), fdt_get_property_w(),
> > > >     fdt_getprop_by_offset_w(), fdt_getprop_namelen_w(), fdt_getprop_w() and
> > > >     maybe other similar functions where the property is returned writable
> > > >     for possible modification. 'modify a property' mentioned in the table
> > > >     is related to modification done using fdt_setprop_*() and fdt_appendprop_*()
> > > >     function families.    
> > > 
> > > Right.  "I know what I'm doing" is part of the implicit contract when
> > > using those functions.  
> > 
> > Also this note (5) will be updated
> > 
> > (5) All property modifications done outside libfdt using directly the
> >     property data pointer will not lead to any unknown tag removal nor
> >     a version downgrade.  
> 
> The idea's right, though I don't think that expresses it particularly
> well.  Not a priority right now, we can revise that later.
> 
> > > > On your side, is all of that conservative enough to be used when modification
> > > > involved unknown tags?    
> > > 
> > > Not quite, as noted, but we might be able to get it there.  
> > 
> > Is it better?  
> 
> Yes, it is.
> 

Ok, I think we've reached an agreement :)

We have a new set of rules for handling "unknwon" tags on modification.
I will implement this set in the next iteration.

Best regards,
Hervé

