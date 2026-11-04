Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782539;
	b=rCCIdK1L//fukVN/3xaxQ1vYepiG/wNZ01Mlyd+SQqxnn/H+vAZtNg51wY+0kw8oi6he
	 3LjespCZT2jG9ly+M2TmxzW39SXny3XnLg3g9REGmuG5iagfAkerOjN1RY8vJle1oTuJ6
	 CUP+gk498Rbc+3QkLUCLGX/+vyahGlC+hZ9Yz+3KpOEPYWZGEWNNP3v61fszJ79fI30oa
	 6WYW/Ze6DP6b6C+XfWWQc6NvjNZvrkntMhSuReu9hvlfHMco36odbOoSWxrUlE5TNEZow
	 TvXXay/T32wXgUZknmpTJHEYFCpX04Sg7f3zdYjMbBtNfHuizpW//X0u2JI+fPIe7mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782539;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=TRfynONJg7FSOhjTcOjQM4FCGZW9vCi1Jv3ZWM2G+JI=;
	b=V5VFrTHfnpKXU8CqTdESpJuPuEsvMsHUfsy/PetBgiWoXWKT+nH5QfK75ySvxKfaBS64
	 avSeFd/5Pq5Bjlz7aFxvHh86dWUhokJFosZvNV0evLE6Z0oSRGqBgbyE+6HJEmNqBE0lJ
	 LgCGSK9ky7tQ0/3CoU3nMwk3qW45K33mp2++WuBdr7OVrV9e09u5ZtEBcY/hfLwLdLYF2
	 LCF+Oz6wbxylBHfTLmKYcEC73PkOC+JSel2q9CLBNgeToDntdOoaBLTW9NJTomWcGdquz
	 /mmElu0TtoPJdCOBJo6BOpkKpwpGuGk1AGnDEvLkoRaTJ7fMlNtI0IonMP+8DD0MIWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oka72Z1i;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B27606A31B
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 08:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B27606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oka72Z1i
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A13FBC8F46C
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 08:56:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B16C260770;
	Wed,  4 Nov 2026 08:55:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C6E0103290E8;
	Wed,  4 Nov 2026 09:55:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793782535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TRfynONJg7FSOhjTcOjQM4FCGZW9vCi1Jv3ZWM2G+JI=;
	b=oka72Z1iDxQ6PWGkHoJQwtMXsAVN9AB/74GTIRWJdgExikLceAXUQit8658sizc3sEdBoZ
	oAYxttO0FDrZjWKpf6PYWto6PSB10ZlP7YQf3clZG1Jiy/f/ZgD14pIlN7NBgSebvN0c9a
	o+jWTtFewOwJ1dhlHr3b1Tb2O9AJRaPDTwPPaeGvi8CxGNGn44CqMjNCUtqiMaHXuKEYar
	6OF7iejliy0WrsxvEXm5e03Ik1bA8B7MmNYV04P50bD3nH8AsDjNlTdEmeegeMK0tnJBTo
	Hngvk4NHhRJ3/XIhrDjKggSrMQ+hPMCPQP4EHovOaPseSom7+vljgagk2XI3ZA==
Date: Wed, 4 Nov 2026 09:55:33 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree Compiler
 <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 11/13] dtc: Add helpers for the errors when merging a
 fragment
Message-ID: <20261104095533.3dfcfb4b@bootlin.com>
In-Reply-To: <aurVWI8-FFnIwdGh@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
	<20261101163721.2458982-12-sjg@chromium.org>
	<20261103182344.4c9c488e@bootlin.com>
	<aurVWI8-FFnIwdGh@gractus.seuss>
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

On Wed, 4 Nov 2026 17:49:09 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Nov 03, 2026 at 06:23:44PM +0100, Herve Codina wrote:
> > On Sun,  1 Nov 2026 09:37:05 -0700
> > Simon Glass <sjg@chromium.org> wrote:
> >   
> > > Four of the merge functions look up the node which a fragment refers to
> > > and report 'Label or path not found' if it is missing, and three check
> > > for a label-relative reference in a plugin. Each of these has its own
> > > copy of the error, so a change to a message or its position must be made
> > > in several places.
> > > 
> > > Add lookup_ref() to look up the node, reporting an error if it is not
> > > found, and check_relative_ref() to report a label-relative reference.
> > > Use these in the merge functions.
> > > 
> > > The output does not change.
> > > 
> > > Assisted-by: Claude:claude-opus-5-5
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > ---
> > > 
> > >  livetree.c | 90 +++++++++++++++++++++++++++++-------------------------
> > >  1 file changed, 49 insertions(+), 41 deletions(-)
> > > 
> > > diff --git a/livetree.c b/livetree.c
> > > index 6a290fb..1e012d4 100644
> > > --- a/livetree.c
> > > +++ b/livetree.c
> > > @@ -548,6 +548,40 @@ static bool is_ref_relative(const char *ref)
> > >  	return ref[0] != '/' && strchr(&ref[1], '/');
> > >  }
> > >  
> > > +/*
> > > + * Report an error at pos if a fragment uses a label-relative reference, which
> > > + * a plugin does not support
> > > + *
> > > + * Returns true if there is an error
> > > + */
> > > +static bool check_relative_ref(struct fragment *f, struct srcpos *pos)
> > > +{
> > > +	if (!is_ref_relative(f->ref))
> > > +		return false;
> > > +	srcpos_error(pos, "Error",
> > > +		     "Label-relative reference %s not supported in plugin",
> > > +		     f->ref);  
> > 
> > You suppose that srcpos is valid and so this function and remaining ones are
> > be called only from dt_from_source() with the parsing done by dtc-parser.y.
> > 
> > Not sure that this is a good assumption for the future.
> > 
> > IHMO, it will be better to decouple those functions from the type of parsing
> > or just add a simple 'if (pos)' before calling srcpos_error().  
> 
> It's a good point that eventually we'll want to get fragments from
> dtbos as well as from source, in which case we won't have srcpos
> information.  But when we are coming from source, the position
> information is valuable.
> 
> This case of maybe-present srcpos information is common enough, that
> the way to address it might be to alter srcpos_string() to accept
> NULL, returning "<unknown>" or some other suitable placeholder when
> srcpos information isn't available.

"<unknown>" or just an empty string "" to avoid any user confusion.
That's a detail.

Yes, checking pos at the low level srcpos_string() is a good things to do.

Best regards
Hervé
