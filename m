Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948211;
	b=mMwIcddg8IUhwO/SC/LWUTcdb6skhGhXuZf5xaD9/WDZpZtIoyI26GYBQO/werMaboBm
	 z3W4vYu8rXQ1YDHABHyLSRk5n5PhovK01/AMpP3DHP3AqIUU3Mpt91MNhsoGdF5sTbuU8
	 6NLlFTC4lcs8TLuRbJD578CGOA5PrnlkFEsntUQi98n0VQsaZ9un/DUdfPp68LsYO2WSS
	 4laAV34RzkF0rVdxWHtYX6a+JcQ1o/eStUgb4MDg6KlczxwTAkmaY6cECDXGlx93jvWt/
	 CKKoeUFLy0oYxFVgJ3SGJcaezc2T94kH/ikLxBGkCG0bIxTBsC1i67cYgPF6s3kVcxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948211;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=inOfLMIIVE9M9Mk33fErnS1w49GYt1a2mQ8y6E/Jpao=;
	b=4bdOHzHXKX4QxH+Zd6B8XAvToY1KlRUCOfixg4hJbgKUlUOaqAHBH/IqNk0VE0jrwhZw
	 RMHkjGxOnKkoNqt3GknLwDML8U6SI1ymtyuIuMUeGGqtO1bWOoHvfs5BZfwJixfldBBBA
	 hbtmN+hP/OVnfnjMPwmOcLxJuQne1nnO7ireGfPvi+Ffoiage4lh73X/oxtiCAe2FlUpj
	 LtiMMgupxIWIgoW3VEWSWomlX/Kbd0wEAQ1d686aBvS+NSlnHRMebOfp1em0fCXJV6oEL
	 z3Pqd48k9Wn3xEVtRS9x86TRwPrribLIo8h1wB6Y5vFMiZE9po5r6KuU2d7mcln/aFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QWslvbQG;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A284606A326
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 06:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A284606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QWslvbQG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F45B1A1350
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 06:56:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6720A5FF43;
	Fri,  6 Nov 2026 06:56:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B96F8103291F9;
	Fri,  6 Nov 2026 07:56:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793948205; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=inOfLMIIVE9M9Mk33fErnS1w49GYt1a2mQ8y6E/Jpao=;
	b=QWslvbQG5PyNSlS2uw+yVhBcpMQP3JbwQI+AM70t6o45ajz3wfF06XS0lWjktCkI2GJbUd
	IwyQDTWeClL0kQC9PM97bjKCLKmKf5j9Sk2XqWt6vD3UJdkhWaDsDF0CPs+/T7D+leEECj
	j/ruZy1vtx/ccgjPPsPoM82FgwMP6Lzw7pu1kphP1bXlnGCq7EJwSIFdWgTy2oDGzAx1LW
	do3F78gljzwewj+BykfdsEyS0b/Whu1EFC0I870LbkpjX0EIOAagXz2/HDYkM7Spu/N9VN
	iByQqr9R7bVa0ubsjxLNz0D2YodhgQUgZr8SwvwMtsNRcX/H90RS4FaYQ1G84A==
Date: Fri, 6 Nov 2026 07:56:41 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 07/15] dtc: Move label-reference handling out of the
 grammar
Message-ID: <20261106075641.0fd421ab@bootlin.com>
In-Reply-To: <CAFLszTg4tSr7+zJb35efy12TfMWiXc8xujcceL_H+_eGzqW-5g@mail.gmail.com>
References: <20261104211807.972610-1-sjg@chromium.org>
	<20261104211807.972610-8-sjg@chromium.org>
	<20261105100714.47bf0434@bootlin.com>
	<CAFLszTg4tSr7+zJb35efy12TfMWiXc8xujcceL_H+_eGzqW-5g@mail.gmail.com>
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

On Thu, 5 Nov 2026 14:49:45 -0700
Simon Glass <sjg@chromium.org> wrote:

> Hi Herve,
> 
> On Thu, 5 Nov 2026 at 02:07, Herve Codina <herve.codina@bootlin.com> wrote:
> >
> > Hi David, Simon,
> >
> > On Wed,  4 Nov 2026 14:17:46 -0700
> > Simon Glass <sjg@chromium.org> wrote:
> >  
> > > The grammar action for a top-level &label { ... } holds its merge logic,
> > > including making an overlay fragment in a plugin when the label is not
> > > found.
> > >
> > > Move it into a new merge_ref(), passing it a struct fragment for the
> > > reference and node.
> > >
> > > The output does not change.
> > >
> > > Assisted-by: Claude:claude-opus-5-5
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > ---
> > >
> > > Changes in v2:
> > > - Rename merge_label_ref() to merge_ref()
> > > - Build the fragment in one step, with build_fragment_ref()
> > > - Return true on success from merge_ref()
> > > - Check the fragment type with assert()
> > >
> > >  dtc-parser.y | 23 +++++++++--------------
> > >  dtc.h        |  1 +
> > >  livetree.c   | 26 ++++++++++++++++++++++++++
> > >  3 files changed, 36 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/dtc-parser.y b/dtc-parser.y
> > > index 9b9b6db..c58a66d 100644
> > > --- a/dtc-parser.y
> > > +++ b/dtc-parser.y
> > > @@ -214,21 +214,16 @@ devicetree:
> > >               }
> > >       | devicetree DT_LABEL_REF nodedef
> > >               {
> > > -                     struct node *target = get_node_by_ref($1, $2);
> > > +                     struct fragment *f;
> > >
> > > -                     if (target) {
> > > -                             merge_nodes(target, $3);
> > > -                     } else {
> > > -                             /*
> > > -                              * We rely on the rule being always:
> > > -                              *   versioninfo plugindecl memreserves devicetree
> > > -                              * so $-1 is what we want (plugindecl)
> > > -                              */
> > > -                             if ($<flags>-1 & DTSF_PLUGIN)
> > > -                                     add_orphan_node($1, $3, $2);
> > > -                             else
> > > -                                     ERROR(&@2, "Label or path %s not found", $2);
> > > -                     }
> > > +                     f = build_fragment_ref(NULL, NULL, $2, &@2, $3);
> > > +                     /*
> > > +                      * We rely on the rule being always:
> > > +                      *   versioninfo plugindecl memreserves devicetree
> > > +                      * so $-1 is what we want (plugindecl)
> > > +                      */
> > > +                     if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> > > +                             treesource_error = true;
> > >                       $$ = $1;
> > >               }
> > >       | devicetree DT_DEL_NODE dt_ref ';'
> > > diff --git a/dtc.h b/dtc.h
> > > index 8c4d7bf..9b4389b 100644
> > > --- a/dtc.h
> > > +++ b/dtc.h
> > > @@ -373,6 +373,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
> > >  struct fragment *append_fragment(struct fragment *list, struct fragment *new);
> > >  void free_fragment(struct fragment *f);
> > >  bool is_ref_relative(const char *ref);
> > > +bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
> > >  bool merge_delete_node(struct node *dt, struct fragment *f);
> > >  bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> > >
> > > diff --git a/livetree.c b/livetree.c
> > > index 3ff4e14..179866d 100644
> > > --- a/livetree.c
> > > +++ b/livetree.c
> > > @@ -573,6 +573,32 @@ bool is_ref_relative(const char *ref)
> > >       return ref[0] != '/' && strchr(&ref[1], '/');
> > >  }
> > >
> > > +/*
> > > + * Merge a fragment which refers to a label into the node with that label. In
> > > + * a plugin, a label which is not found becomes an overlay fragment.
> > > + *
> > > + * Returns true on success, false on an error, which has been reported.
> > > + */
> > > +bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
> > > +{
> > > +     struct node *target = get_node_by_ref(dt, f->ref);
> > > +
> > > +     assert(f->type == FRAGMENT_NODE);
> > > +     if (target) {
> > > +             merge_nodes(target, f->node);
> > > +             return true;
> > > +     }
> > > +     if (!plugin) {
> > > +             srcpos_error(f->ref_srcpos, "Error",
> > > +                          "Label or path %s not found", f->ref);
> > > +             return false;
> > > +     }
> > > +     /* The label may be in the base tree, so add a fragment@N node for it */
> > > +     add_orphan_node(dt, f->node, f->ref);
> > > +
> > > +     return true;
> > > +}
> > > +  
> >
> > Even if this function is slightly modified in later patches, I think it mixes
> > two different operations:
> >  - Merging fragments
> >  - Converting fragments in overlay output format.
> >
> > IHMO, those two operations should be fully decoupled.
> >
> > merge_ref() or any other operation whose goal is to merge a fragment should
> > only merge fragment either in the existing root node or in a previous fragment
> > available in the fragment list.
> >
> > add_orphan_node() should not be called from a merge_*() function related to
> > fragments.
> >
> > After merging all fragment we should have a root node and/or a list of fragment
> > reduced to unmerged ones.
> >
> > Base on that, the overlay conversion can be performed using a dedicated
> > function, out of merge_*() functions.
> >
> > Something like this:
> > ---- 8< ----
> > void convert_to_overlay_output_format(struct dt_info *dti)
> > {
> >         struct fragment *f;
> >
> >         if (!dti->dt) {
> >                 /* The root node is not present. Create an empty one */
> >                 dti->dt = ...;
> >         }
> >
> >         /*
> >          * The fragment list have been previously merged.
> >          * Available fragment left in the list are fragments
> >          * that cannot be merged and so those fragments are
> >          * orphan nodes.
> >          *
> >          * Convert those orphan nodes to the /fragment@N format overlay
> >          * format.
> >          */
> >         for (f = dti->fragments; f; f = next) {
> >                 add_orphan_node(dti->dt, f->node, f->ref);
> >
> >         /* Add __fixups__ and __local_fixups__ nodes ? */
> >         todo();
> > }
> >
> > in main():
> >
> >         /* Parse input */
> >         dti = dt_from_*();
> >
> >         checks_pre_fragment_merge(dti);
> >
> >         merge_fragments(dti); /* <--- Fragments are merged.
> >                                *      Remaining items in the fragment list, if
> >                                *      any are Orphan nodes (i.e. fragments that
> >                                *      couldn't be merged).
> >                                */
> >
> >         checks_post_fragment_merge(dti); <--- Orphan ok for overlays but ko for !overlay dts
> >
> >         /* Convert outputs */
> >         if (dti->dtsflags & DTSF_PLUGIN) {
> >                 convert_to_overlay_output_format(dti);
> >                 checks_overlay_format(dti);  /* <--- Not sure it is needed */
> >         }
> >
> >         /* Generate output */
> >         dt_to_*();
> > }
> > --- 8< ---  
> 
> I tend to agree - we are heading in this direction.
> 
> But this series is meant to keep the output the same (apart from the
> &{label} case), so I would prefer to do the split as a follow-up. I
> just filed an issue for the overall effort here:

I don't see why splitting merge and "overlay format conversion" changes the
output. 

This series could split these operations in two distinct functions.

> 
> https://github.com/dgibson/dtc/issues/201
> 
> What do you think?
> 
> Regards,
> Simon

Best regards,
Hervé
