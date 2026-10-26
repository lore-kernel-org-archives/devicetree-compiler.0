Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003825;
	b=M3Y67or3EVrpMDMbQyruvUr9+YlqGzx+KGxQUv+oxcBio8L40eOYEXOcs0o2+cpH3aRL
	 d8WnQXhkbEMRb/nu1JdRHLQFVSnc4dVbRHWUq+pGwKUCqoyfUJhQQWpbi06JuNKH/yXdw
	 0KVnbnv3yyf3xzI0BExDakIv7fGfbBN6G8HkBukHJQwS4RCmP5BMMz7anxmBQ7M2nnALF
	 zNXkCqFZ4+87t6FoSmGcmGxdCiFWWE1AG6ZYyu/+9FHSSXqPz03fXWW4fLV06bG95cLJp
	 o5HiWHmJuzW9U0lLYlVQjBgxgQY1Hhcm17YD/YE6eb1D1x93XE5xmsVRGtJ6YoJzE3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003825;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=/tD+AdggQ8rn3t013FfJIhJkQ3UCqIWgHWwfFpeCerk=;
	b=X3hqEfpQV/LqUFyEKU6os4+x1eR00ROewbtd409+luTwxjs0xQ+FKjnEyc7eW8E60PF0
	 z4HoYFmZJ0w0aTiCSw9QIOb+KbBpjG1tDxyXdhasXK1kTHP09rkDJLdhNmgU1PHQUG17Q
	 yPnARh09dE7h49cIicljsjztS81U5n55ZUex9puI7qaS5YAyUlKmogpQAzWEhPinoiGss
	 EYeTEpE6YtRK34jgixX0m/Xco7gbwvvedV/ZQ9SZl0jj5NvLxk8cdnYI0z44opJoJhwDR
	 Jlk0MvEG2O+fY0yRNz9iXjnQoINY5t9YBnfIUdsjbWMaCUwdnCPKIdQtf92GwyTfxyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kVwwLWcH;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6521A606A321;
	Mon, 26 Oct 2026 08:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6521A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kVwwLWcH
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7C065C5147F;
	Mon, 26 Oct 2026 08:37:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7ACCD60740;
	Mon, 26 Oct 2026 08:36:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EA8E10328E76;
	Mon, 26 Oct 2026 09:36:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793003812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/tD+AdggQ8rn3t013FfJIhJkQ3UCqIWgHWwfFpeCerk=;
	b=kVwwLWcHIhHeD43jHUzfytK0VC6XBUa76/BASP5MYWKmgkJg1swUYm6Nbcz0qa+xG5p/oL
	pSeE11DF5ppRMuS7rksMeF66KVn11wWdOUivyfokhrKZ7xErbqn8fIEl1tJks0CHAZtthZ
	cWhbZ6XN8mPWp5LHNKJV0xwp7XxAWQMkVja2480JdWKiGwSDfEDwbR0oEDdwIOvyhm0MUo
	hNNJQLIFP5zJ8wQynpxgiIjyl1Y8iIjjX7Jb57RIAvdh7MSzFiMJg38wkp959gysNKqBVN
	Cbu+QePb/Kdb07waujHNn0n5ZGQWS72h3IZcn3LWXr8X7jTHGp84GbdAD7WMdQ==
Date: Mon, 26 Oct 2026 09:36:43 +0100
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 12/15] libfdt: Introduce fdt_getprop_offset_namelen()
Message-ID: <20261026093643.15faf244@bootlin.com>
In-Reply-To: <at1qO7oEdCyhX6k8@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-13-herve.codina@bootlin.com>
	<arDJmHPwgvwwmITG@gractus.seuss>
	<20260922182547.6cc7475c@bootlin.com>
	<20261023092559.7608ff25@bootlin.com>
	<at1qO7oEdCyhX6k8@gractus.seuss>
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

On Sun, 25 Oct 2026 13:32:41 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Oct 23, 2026 at 09:25:59AM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Tue, 22 Sep 2026 18:25:47 +0200
> > Herve Codina <herve.codina@bootlin.com> wrote:
> >   
> > > On Mon, 21 Sep 2026 16:07:21 +1000
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >   
> > > > On Wed, Aug 26, 2026 at 10:31:43AM +0200, Herve Codina wrote:    
> > > > > Future operations, such as handling unknown tags on dtb modifications,
> > > > > need to get an offset to a property based on the node offset and the
> > > > > property name.
> > > > > 
> > > > > Several function exists to get a property based on the node offset
> > > > > and the property name but none of them allows to get the property
> > > > > offset.
> > > > > 
> > > > > Fill the lack and introduce fdt_getprop_offset_namelen() and its
> > > > > simple variant fdt_getprop_offset().
> > > > > 
> > > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>      
> > > > 
> > > > This seems redundant with fdt_ptr_offset_(), which can trivially get
> > > > this information when combined with fdt_get_property().    
> > > 
> > > Indeed, It should be ok using both functions you pointed out.
> > > 
> > > I will remove fdt_getprop_offset_namelen() introduced here and use directly 
> > > functions mentionned in the next iteration without wrapping those calls in
> > > a new function.   
> > 
> > I've started to replace fdt_getprop_offset_namelen() by the combination
> > of fdt_ptr_offset_() and fdt_get_property_namelen().
> > 
> > As a reminder fdt_getprop_offset_namelen() I proposed was the following:
> > --- 8< ---  
> > > +int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
> > > +			       const char *name, int namelen)
> > > +{
> > > +	const struct fdt_property *prop;
> > > +	int lenp, offset;
> > > +
> > > +	prop = fdt_get_property_namelen_(fdt, nodeoffset, name, namelen,
> > > +					 &lenp, &offset);
> > > +	if (!prop)
> > > +		return lenp;
> > > +	return offset;
> > > +}  
> > --- 8< ---
> > 
> > fdt_get_property_namelen_() was called.
> > 
> > Switching to fdt_get_property_namelen() introduces a regression.
> > 
> > fdt_get_property_namelen() calls fdt_get_property_namelen() and this function
> > (without the '_' suffix) performs a check on fdt_version() returning an error
> > on version < 16.
> > 
> > Using it to replace my fdt_getprop_offset_namelen() function will break
> > write-in-place setprop() for dtb version < 16. Indeed, it is used in [1]
> > 
> > [1]: https://lore.kernel.org/devicetree-compiler/20260826083146.304291-15-herve.codina@bootlin.com/#Z31libfdt:fdt_wip.c
> > 
> > Now, several options:
> > 
> > a) No problem if we break dtb version < 16
> >    Ok, I will use directly fdt_get_property_namelen() + fdt_ptr_offset_() to
> >    get an offset and remove my fdt_getprop_offset_namelen() wrapper.  
> 
> So, practically speaking this is probably true.  Version before 16 are
> truly ancient, and versions 1..3 were all before dtbs really caught
> on.
> 
> > b) Keep my fdt_getprop_offset_namelen() function without any modification
> >    We support version < 16, problem solved.  
> 
> Still don't like it.
> 
> > c) Keep my fdt_getprop_offset_namelen() but static inline in libfdt_internal.h
> >    Export fdt_get_property_namelen_() in libfdt_internal.h and use it in the
> >    static inline fdt_getprop_offset_namelen().
> >    This implies that fdt_get_property_namelen_() will be no more static and
> >    usable internally out of fdt_ro.c but only the fdt_getprop_offset_namelen()
> >    wrapper should be used.  
> 
> Eh.
> 
> > d) Use directly fdt_get_property_namelen_()
> >    Export fdt_get_property_namelen_() in libfdt_internal.h and use it
> >    directly to get the offset.
> >    I don't really like this solution. I would prefer to have a wrapper to
> >    explicitly return the offset instead of exposing and using directly
> >    fdt_get_property_namelen_().  
> 
> Hm, I think this is my preferred option.  libfdt_internal.h exists
> precisely to "expose" things across modules internally, but without
> exposing them to external users.  Maybe I'm missing something, I don't
> really see why that's objectionable.

Well, my first feeling was to avoid exposing this function and use a wrapper.
I've looked again and indeed the wrapper isn't really worth it.

I will expose (internally) and use directly fdt_get_property_namelen_().

Best regards,
Hervé
