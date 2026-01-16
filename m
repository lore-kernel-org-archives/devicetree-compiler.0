Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AC0378D8D;
	Fri, 16 Jan 2026 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562805; cv=none; b=FRKYCJK5Y4ds/HMZ0N7HGxFUDHFnkAPxOezmgOpMxmQih/P25uirpqajgUqY4uVDg4fiWSqKr2zx8XVQ1myjbbNz1apjdmHuOlj+oBaeGFxPcN10uShY2FrxXinr+fRgdJ4X4dxN7KoFHoJtqQyxLYU92z/2gZzdcs+K7v+KkSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562805; c=relaxed/simple;
	bh=q1a0jWygf67uuKBhzxE4d/OzBJCQJDfp0DZUT9io/w0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWGTVU0omO4yo21L5jiG64jRX64r3BRilt0T1Fp9Wk6Mm5G4rujmgKpE/dE8tO/nnAeHY7v5XxK5pP885hNB2zsVrZO6PJjA/6DhHY4kEA2juzF20B6iZ8wGyUeKsWaeKJvus6U2jRpoaAWeGKCJt190z6U7V/0Z2ORQaw8mlog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B4DUDlxW; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B4DUDlxW"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7EB9B1A28AE;
	Fri, 16 Jan 2026 11:26:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 517B560732;
	Fri, 16 Jan 2026 11:26:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32F5010B68A33;
	Fri, 16 Jan 2026 12:26:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768562796; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gzj+iLxUVkSB/1vcKsefs/Rah5lOv7eiinp3NYF7gEw=;
	b=B4DUDlxWmz8ALH/x/vmdT2ZlLvnQ4K+RLqxc1KN7TslzXr5m4yMxzdfOO/dgWeAgKduaeU
	MKk/e1EMe3uRziW3iHYJnLmL8npEYkWzh7hToUjKxTHI+AXBoj/apks5cdUTJKtckfeU++
	NRF8WJfzzovLgMLEecKkRnAo4D1XmC6tV2lQQ7Mu2utIafzz9i8SmOpyfif18naxQHiF2m
	pEj0kAoGYeeRmg+8lj3m1zUL63Yu5Gsfia6swk0MBAoR4Td01dDxrsNvMEcnD+mEURUquG
	iz8f7hsfI80fIipInD86k+Z8fzubv43EPanVKTS9iGi1SA/nIucwXRpEFPK7FQ==
Date: Fri, 16 Jan 2026 12:26:30 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ayush Singh <ayush@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Hui Pu
 <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 08/77] dtc: Introduce update_phandles_ref()
Message-ID: <20260116122630.35d4fba3@bootlin.com>
In-Reply-To: <aWg4_KIBbUMOdP9C@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-9-herve.codina@bootlin.com>
	<aWg4_KIBbUMOdP9C@zatzit>
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

On Thu, 15 Jan 2026 11:46:52 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:18:58PM +0100, Herve Codina wrote:
> > With the introduction of FDT_REF_LOCAL dtb tag, a local phandle used
> > by a property is identify when a dtb is parsed.
> > 
> > In order to have consistent internal data, the reference related to this
> > phandle usage needs to be updated based on the phandle value.
> > 
> > This is done by update_phandles_ref().
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  dtc.c      |  2 ++
> >  dtc.h      |  2 ++
> >  livetree.c | 38 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 42 insertions(+)
> > 
> > diff --git a/dtc.c b/dtc.c
> > index b3445b7..88f03ff 100644
> > --- a/dtc.c
> > +++ b/dtc.c
> > @@ -333,6 +333,8 @@ int main(int argc, char *argv[])
> >  		generate_fixups = 1;
> >  	}
> >  
> > +	update_phandles_ref(dti);
> > +
> >  	process_checks(force, dti);
> >  
> >  	if (auto_label_aliases)
> > diff --git a/dtc.h b/dtc.h
> > index 965321c..351fe41 100644
> > --- a/dtc.h
> > +++ b/dtc.h
> > @@ -345,6 +345,8 @@ void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
> >  void generate_fixups_tree(struct dt_info *dti, const char *name);
> >  void generate_local_fixups_tree(struct dt_info *dti, const char *name);
> >  
> > +void update_phandles_ref(struct dt_info *dti);
> > +
> >  /* Checks */
> >  
> >  void parse_checks_option(bool warn, bool error, const char *arg);
> > diff --git a/livetree.c b/livetree.c
> > index 9b67934..9e30a63 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -1158,3 +1158,41 @@ void generate_local_fixups_tree(struct dt_info *dti, const char *name)
> >  			"Warning: Preexisting data in %s malformed, some content could not be added.\n",
> >  			name);
> >  }
> > +
> > +static void update_phandles_ref_internal(struct dt_info *dti, struct node *node)
> > +{
> > +	struct node *c;
> > +	struct property *prop;
> > +	struct marker *m;
> > +	struct node *refnode;
> > +	cell_t phandle;
> > +
> > +	for_each_property(node, prop) {
> > +		m = prop->val.markers;
> > +		for_each_marker_of_type(m, REF_PHANDLE) {
> > +			if (m->ref)
> > +				continue;  
> 
> IIUC this means that REF_PHANDLE markers can be missing their ref.

Yes, no ref are present in dtb for phandle pointing to local node, only
the phandle value is present. We need at some point to set the ref from
this phandle value.

> Allowing the markers to be in an incomplete state is a footgun.  If
> possible it would be better to fully generate the markers when we
> create them.  If not, we should use a different marker type when it's
> introduced, and convert it later.
> 
> I think what's going on here is one type is saying "you have a
> reference, fill in the phandle", the other is saying "you have a
> phandle, fill in the reference".  Those seem like they should be
> different types to me, even if they can be converted once all the
> fixups are applied.

Right, I can introduce
- REF_PHANDLE_FILL_PHANDLE: "you have a phandle, fill in the reference"

- REF_PHANDLE_FILL_REF: "you have a reference, fill the phandle"
  Well, fill the phandle or not... Indeed, this reference can be external and
  so this can be an unresolved symbol.

But anyway those new marker types will exist only between the parsing step and
the step where we convert them to REF_PHANDLE markers.

Will see what I can propose in the next series iteration.

Best regards,
Hervé


