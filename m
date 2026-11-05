Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793915400;
	b=v3xUM2bk93pp8PhVwtYgfBNZBIFkr6Nk3swMlDIQIJ4pVfkYjOIpFktzOTzYmxJPc09X
	 sVA5GL3dAYEG5vqSPAoRa1UicIPuH60+8r9hnrBCV2srx3KOHHGDEBZjuK8ODZMYEJtyi
	 Z2VkIOhOoFBRh2WrsHIHkMhkiN7LbbdF/uGDyjfQ2gcbSHt4qdPO7xtTaiPNzs31nTsVM
	 bccm7P0TGGRuTJXgETo4IKG0DTMaP4+JKjp8Vo6Cjqw+YHMrxaNZihoOEyoMWlWOnhaEX
	 IkohsDh8CtgN5Fns3qgn/OKZELyE7+vbSqotRzgNBkwqlOGFaZ05WJ8M9tUYR5h+P5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=KsjyJAVw9IbGxY9A/NBQkiBK23etOhQ9WIt3oJhD0+w=;
	b=4jITseUpN6x5jHu8k+0Cs0cClCZvqA6SE1PCQfA0tXc2qhfDn4NDhwdvLJPboAY3GzLE
	 D32cslmcjm8W2bif7b8j5fZxzJ3GEaxP7hwG9VClyqkVXyGdcgMSq7DFT9/bWhGgvunL7
	 Sxyi6WK6IfhaJH8f2esS2EPpQKodtPbUcMXp6k03deOrOPSY4REVANf9kPnFdjkjhAjKr
	 nvSDG9/ev98QI5fbj6otWjW5N19CNqVSQNSPZTMdIwPqooKDhFxrEpMwbZAXCTmPrg7kN
	 es+l12qre2d+ZzkND9ECPtBsslBrP3TZ/GwV30Y6tbxBMFuR6alt5mkIukr3K2/pV/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OJDEVgDE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6950606A31B
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Nov 2026 21:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6950606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OJDEVgDE
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b56c3677f8so2385396a12.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 05 Nov 2026 13:49:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793915398; cv=none;
        d=google.com; s=arc-20260327;
        b=Ah95U/ZRt/t4NbXEoHqXVkq7z8Yo4kwOG/cF/dVen0JEFVjpLU+LJ+l9YXsNWujOjg
         Z4pW7ajIL1vaaqnySbxL7o7YKaFSMp2eCF+3dBpuS3n4SQMHS94Fr2we/sHhtnMkbON6
         BF3NfgkFOUHbQnJeqkra8Qghyy6f4B+spUtC24hLty0EY7yTxBzGUwb6ReFoDwWajg6R
         IJziA2Ei928VoyNnnq6EaD8zNvvcDv4s08o9pqx92CxdfBKTB/etNk2iTn+nx6qj46xs
         jZzSFvLyEvLzOYOsXrhaIEYzDbPzT6qOccbM/8JWpNtKh/eDYIxsA6/alqlMB30uso9W
         pqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KsjyJAVw9IbGxY9A/NBQkiBK23etOhQ9WIt3oJhD0+w=;
        fh=6uVpMO1Rx509ITfjJ1m8/U1FB11n9fR9E3zQL6G+9pQ=;
        b=gINP2FMNVN7Q0l0Ma0ymjP1caXnjlTINk9vbV5LcNVVva9iU1whmoFx1OaHo1N/Eqc
         rbIgTkIGo361Q15QDHWRR/Rjpn41e4thrNr8Eb5nmLzvBt2J3qGs/l3CNCDvXbFDgTdT
         ZDliyaPFgiPG2YE0aEE01DHdJs/4hXgygxJgov6kRF0nEnXXH/SgLw4apkpRBDgWA/RS
         jjIFw7Z4CmQl00bzZg7WSCF4mY1W+Q8D+LEk5RCKa+7n+7lf73SZX6PG4zU38kQJ5Znt
         3AMKBS0mt9U9aExEFoc1kRLzgjM2vF/443EwbRp3aC6Ja5tuUiVbirnC+uhkmLmT3p9F
         gJqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793915398; x=1794520198; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsjyJAVw9IbGxY9A/NBQkiBK23etOhQ9WIt3oJhD0+w=;
        b=OJDEVgDEupA3hxhR4ZGhU0c4cdOc5ZDY4bHvaSKT6ES5QH06A+Z8xu4/7j7xiiEoEm
         Hvwz6lGQpbB7YZMGuJpX05fI14q1UD/ducKkkTxW/Qaz/pAqDgfmPXPDZr4leRdA2OqM
         JlP9oW/7LCsf1xoFbcOHDqyjp7LyIfQ9My3Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915398; x=1794520198;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KsjyJAVw9IbGxY9A/NBQkiBK23etOhQ9WIt3oJhD0+w=;
        b=EW7d6NjgQ98RATczVMrxoZSxDoz1UMAw/4VBi02Wr6psAa6/uewyPRjdv7E8Sp9EPI
         V3G+aGYOUDiA5VVnLXOFI7z9hYs4Dlu4K7CrS144jHXhEsx1zJwxsBjYT4AGHbithWXf
         fRAkqg96HVeSs+okUA0ztZL3a1Bhu+3ZSIb1/tTvkX4C/DfZpXX22cjFQjhUV9SSU8Ny
         7GkV+8TgDXLE4qrW3vkfSBr+UqaGo6R+v8C0mEIy03AWRhcVDP8UMYiDT4RKCwShw7rr
         oxfUsg7IcM+NsWeGpNxdFBPzxViSHsnmSM5rOZbLfLpvO0tLt8IVwfpCLYHIri8ebPd0
         QIuQ==
X-Gm-Message-State: APuU4Z8vNAebAbKe063IcE1RGdRf45/CsvdernxljcNpyBH+Q3c0ulSV
	xYwSUiTbxfUkGkR28xfYrgZutQXR+MJloClTVojfOXFVQqaBvzD6GZkOHqKJIzyEfJZlwCFgzno
	jFgH9avToD3UAoTU5v6UwGjAUYiXJAngI1RGDYmRbEPbLrjjiIMLQwse8
X-Gm-Gg: AYBFou3as/tUGHZ8CBFNjM+nSpraaJ0X6N3zLwmX+vak0dTyfMseTbAeMsq+PeamNCN
	DdnYvKp6w7/l2JAkUXTPallE+D+Nh38bAO1q8DJTkF+Gpwl7+F2knq22bFyd4gQHRghqfVNMhz2
	xnKMYkALF+m6Ctfj1FzHF8UiZyw8oEWjw9YgxFl6afdVTTq+EQBOc7LRCKoA5hzeIr6qs12ubZS
	EvGViPjtW6uRzk6IZohdae6l8/FsCGD0TwkKXMMHn6uNfBQR6PzA1YbrLo4s90ksqa6xlLhHSNX
	ZgYp2ciJCT5O/hC58HP3hmW0/bULmzvohVpWb6HcupofYVckgOQ7yfSBUcRzLjuMF03Lr5iLFLF
	iKD+jRHwLB10J53VfWlhj8+Z558m8lRIvITux8rVZhRJR6ykJ0qd6DnTRB/tlM72v56aUus8=
X-Received: by 2002:aa7:d30b:0:b0:6b5:4f86:3be2 with SMTP id
 4fb4d7f45d1cf-6b5977f756fmr268715a12.35.1793915397808; Thu, 05 Nov 2026
 13:49:57 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104211807.972610-1-sjg@chromium.org> <20261104211807.972610-8-sjg@chromium.org>
 <20261105100714.47bf0434@bootlin.com>
In-Reply-To: <20261105100714.47bf0434@bootlin.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 5 Nov 2026 14:49:45 -0700
X-Gm-Features: AclHuK8PRGK5EzRoUk91FuBx1-WBp5kQkmAKLahrZy9QfmKmNNlTdz4CM1IMld8
Message-ID: <CAFLszTg4tSr7+zJb35efy12TfMWiXc8xujcceL_H+_eGzqW-5g@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] dtc: Move label-reference handling out of the grammar
To: Herve Codina <herve.codina@bootlin.com>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Herve,

On Thu, 5 Nov 2026 at 02:07, Herve Codina <herve.codina@bootlin.com> wrote:
>
> Hi David, Simon,
>
> On Wed,  4 Nov 2026 14:17:46 -0700
> Simon Glass <sjg@chromium.org> wrote:
>
> > The grammar action for a top-level &label { ... } holds its merge logic,
> > including making an overlay fragment in a plugin when the label is not
> > found.
> >
> > Move it into a new merge_ref(), passing it a struct fragment for the
> > reference and node.
> >
> > The output does not change.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Rename merge_label_ref() to merge_ref()
> > - Build the fragment in one step, with build_fragment_ref()
> > - Return true on success from merge_ref()
> > - Check the fragment type with assert()
> >
> >  dtc-parser.y | 23 +++++++++--------------
> >  dtc.h        |  1 +
> >  livetree.c   | 26 ++++++++++++++++++++++++++
> >  3 files changed, 36 insertions(+), 14 deletions(-)
> >
> > diff --git a/dtc-parser.y b/dtc-parser.y
> > index 9b9b6db..c58a66d 100644
> > --- a/dtc-parser.y
> > +++ b/dtc-parser.y
> > @@ -214,21 +214,16 @@ devicetree:
> >               }
> >       | devicetree DT_LABEL_REF nodedef
> >               {
> > -                     struct node *target = get_node_by_ref($1, $2);
> > +                     struct fragment *f;
> >
> > -                     if (target) {
> > -                             merge_nodes(target, $3);
> > -                     } else {
> > -                             /*
> > -                              * We rely on the rule being always:
> > -                              *   versioninfo plugindecl memreserves devicetree
> > -                              * so $-1 is what we want (plugindecl)
> > -                              */
> > -                             if ($<flags>-1 & DTSF_PLUGIN)
> > -                                     add_orphan_node($1, $3, $2);
> > -                             else
> > -                                     ERROR(&@2, "Label or path %s not found", $2);
> > -                     }
> > +                     f = build_fragment_ref(NULL, NULL, $2, &@2, $3);
> > +                     /*
> > +                      * We rely on the rule being always:
> > +                      *   versioninfo plugindecl memreserves devicetree
> > +                      * so $-1 is what we want (plugindecl)
> > +                      */
> > +                     if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> > +                             treesource_error = true;
> >                       $$ = $1;
> >               }
> >       | devicetree DT_DEL_NODE dt_ref ';'
> > diff --git a/dtc.h b/dtc.h
> > index 8c4d7bf..9b4389b 100644
> > --- a/dtc.h
> > +++ b/dtc.h
> > @@ -373,6 +373,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
> >  struct fragment *append_fragment(struct fragment *list, struct fragment *new);
> >  void free_fragment(struct fragment *f);
> >  bool is_ref_relative(const char *ref);
> > +bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
> >  bool merge_delete_node(struct node *dt, struct fragment *f);
> >  bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> >
> > diff --git a/livetree.c b/livetree.c
> > index 3ff4e14..179866d 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -573,6 +573,32 @@ bool is_ref_relative(const char *ref)
> >       return ref[0] != '/' && strchr(&ref[1], '/');
> >  }
> >
> > +/*
> > + * Merge a fragment which refers to a label into the node with that label. In
> > + * a plugin, a label which is not found becomes an overlay fragment.
> > + *
> > + * Returns true on success, false on an error, which has been reported.
> > + */
> > +bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
> > +{
> > +     struct node *target = get_node_by_ref(dt, f->ref);
> > +
> > +     assert(f->type == FRAGMENT_NODE);
> > +     if (target) {
> > +             merge_nodes(target, f->node);
> > +             return true;
> > +     }
> > +     if (!plugin) {
> > +             srcpos_error(f->ref_srcpos, "Error",
> > +                          "Label or path %s not found", f->ref);
> > +             return false;
> > +     }
> > +     /* The label may be in the base tree, so add a fragment@N node for it */
> > +     add_orphan_node(dt, f->node, f->ref);
> > +
> > +     return true;
> > +}
> > +
>
> Even if this function is slightly modified in later patches, I think it mixes
> two different operations:
>  - Merging fragments
>  - Converting fragments in overlay output format.
>
> IHMO, those two operations should be fully decoupled.
>
> merge_ref() or any other operation whose goal is to merge a fragment should
> only merge fragment either in the existing root node or in a previous fragment
> available in the fragment list.
>
> add_orphan_node() should not be called from a merge_*() function related to
> fragments.
>
> After merging all fragment we should have a root node and/or a list of fragment
> reduced to unmerged ones.
>
> Base on that, the overlay conversion can be performed using a dedicated
> function, out of merge_*() functions.
>
> Something like this:
> ---- 8< ----
> void convert_to_overlay_output_format(struct dt_info *dti)
> {
>         struct fragment *f;
>
>         if (!dti->dt) {
>                 /* The root node is not present. Create an empty one */
>                 dti->dt = ...;
>         }
>
>         /*
>          * The fragment list have been previously merged.
>          * Available fragment left in the list are fragments
>          * that cannot be merged and so those fragments are
>          * orphan nodes.
>          *
>          * Convert those orphan nodes to the /fragment@N format overlay
>          * format.
>          */
>         for (f = dti->fragments; f; f = next) {
>                 add_orphan_node(dti->dt, f->node, f->ref);
>
>         /* Add __fixups__ and __local_fixups__ nodes ? */
>         todo();
> }
>
> in main():
>
>         /* Parse input */
>         dti = dt_from_*();
>
>         checks_pre_fragment_merge(dti);
>
>         merge_fragments(dti); /* <--- Fragments are merged.
>                                *      Remaining items in the fragment list, if
>                                *      any are Orphan nodes (i.e. fragments that
>                                *      couldn't be merged).
>                                */
>
>         checks_post_fragment_merge(dti); <--- Orphan ok for overlays but ko for !overlay dts
>
>         /* Convert outputs */
>         if (dti->dtsflags & DTSF_PLUGIN) {
>                 convert_to_overlay_output_format(dti);
>                 checks_overlay_format(dti);  /* <--- Not sure it is needed */
>         }
>
>         /* Generate output */
>         dt_to_*();
> }
> --- 8< ---

I tend to agree - we are heading in this direction.

But this series is meant to keep the output the same (apart from the
&{label} case), so I would prefer to do the split as a follow-up. I
just filed an issue for the overall effort here:

https://github.com/dgibson/dtc/issues/201

What do you think?

Regards,
Simon
