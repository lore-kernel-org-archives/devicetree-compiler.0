Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805516;
	b=CnoMdVDvEFBq33nVLElTM5OaCsBtN2o3Ro1I8vNADcP7bHRTL4OGZDI40ky4yTtodBS3
	 nsDNZ+3GmTcyCnlbINMVzDM3s5IgYNe7YaINOX0IkgztAjuzB0kzwQSmu6pWaLPRZGsVG
	 cnhapmcXDPiAGCFARkd/4I7KI+/Yqvy+DDR7FUg0QIqAUlJy2we5Evl9+d0eWI9Y0PAU/
	 6rEHWTketBahtRMfGXlcamqtmNbRclNItBAbgmruAJreJ4UpkzZ5RVL7AKkrM+YDUEoxz
	 IEzjuCsvMWZXJ38FlfJxxzF08pvJPOzMz5+1J3C2Kri40ma8U38UB3XMl8bIuYseAEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=8RxneimhHJwBoCKJRqq41wqZB9mUZjA5JdXb46HBXms=;
	b=Pzzw2el35mnrrQ2wOT3bxub0NazYRD/sIysYcn7Uzj6R2zvAAn4VT0F6wmZoZP207qU3
	 HP/2JD6cu54byyeCuRAiUp+H8P/5BSaly0cK4GnAGtp4MADYdR1488QggpUSk1pEQXWp/
	 Ra0NlPyA5bj7GS39Rnkf/l0m68U4QtCcXl5NPRsasuy+mfARZb6u9qXc1yiKSnDjOmZc7
	 Oy3tlB9sb/nGgPNmsdS1SANRXLQYBeK5R8K7pKGUV9eWSQHT/eC20TuYFRNMp7/0aXfAK
	 o77lDm+pyfLhQBdXynMBg28qb9Mx7RF07jZBlR0SAOQ/irCgJDEwpPtU33C7Qu82h1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CRUx7R0+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF05C606A7DF
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF05C606A7DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CRUx7R0+
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so963989a12.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:18:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805514; cv=none;
        d=google.com; s=arc-20260327;
        b=BNJBkO88eoL+TT90NV3/vKqC5V8a6xbW68I20vs3gaqLRnn1FbWyt7wSCzRpVI3U7w
         fysue8td6iI0T5w+79Ez91UZY9f34uJ7wMXLFTOupgubayWo3yuXfWnIio//eoXFKuWF
         948rVAToYwPrXbotMHNipNGsIUmPNPkKfCRxq3Urnj4jSXE37vcJnmwJtYAYwFlrwHtn
         8wWJ2oevmz0yLuTzEKxhCwCZgHxeEpsIiU3TBcpfnSXglf5ERFEdMlK7C+Hk9dffButx
         +vUYPTvFFG2ihEWvG29DgZHpCA7JCAqbS8Arygi6CSupN4hfsl28ovHl87spxBNf4/ru
         covA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8RxneimhHJwBoCKJRqq41wqZB9mUZjA5JdXb46HBXms=;
        fh=srd9RlF+16/dPyjlTyWSZRXUPbkLZ5CDxVawIXOQn9Q=;
        b=o7SrZ20BRM05SkMMCkthOJWBJPBvmYoV2ynSOS8OmArhlAIpFsn5dRvEj6XGOMJKqD
         ZZ2Pi0C+KjTSC3gQCyAIE5BEaASY9vMgJEj1eDORkkEgbEn06vjN4zT5w9vVSC6rTGxP
         4Ke0gIOzGpMPJlufSFzIWHQQKlZ/5OrM9JPINzPbmZFpigDgzf9FEiFspflbVKZOenZH
         CKX6fbS8Yi/f944azQOSvt3tXAow8vLHWdQI94TEcvq6tJTsnB0HP+W5fr11YTEVh0Lq
         FSvt/jK6P4rhM48dNsmmr7YPUSbD3U7uT5WueVz7UcEmMMD9qM74iUVcEO4N7D8DIY2m
         7+GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805514; x=1794410314; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RxneimhHJwBoCKJRqq41wqZB9mUZjA5JdXb46HBXms=;
        b=CRUx7R0+yZsdrc0hMr0RT+jKgWTRiT337P4/Vm72Ejk3gOMq4WfN2X/ih9D+igRhPq
         5mPb/nQja2tZrEmDkdo3przJ8h1KA9hOdXvnFDzCDeamzdiE7Cj5SGAb43h2peoid1kM
         odCdRggRRMyaGLqfkNi/iEx7a6dy/ICc7exWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805514; x=1794410314;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8RxneimhHJwBoCKJRqq41wqZB9mUZjA5JdXb46HBXms=;
        b=SCeIxeC5XVQdtM8Cjk20P7VhQP3C8B/xz5xhFeLX9mnAaeTGUdXdW5OI49vuPcX895
         LEb6/+pSbO41PBTLaydPNb3A41+3+paT/3pz7B1JihuZ6GNWh6zn2LRLgRp/uDSpDHDG
         P+LuO+YdVgpBQUe61S3QZ+JapqEuaG+2DAYcW6/zTjSD2b84ci+u+kZr3UgUH3njILXE
         nf2+a2h+KTKmHFPr6I9b2paSJFtmCWAOJxPn7EMTtGt3daIylZI9Y9uQavclgLiKcOLz
         cPbgtm/YEOHINJbpYsvTkxKlUnaUKDaVKePz/PiuPqq4Y5ueWGTuDTPjOIDzF82hp4qG
         CkAw==
X-Gm-Message-State: APuU4Z/OzRulDHixeOfs0LiPRzdJ32TaSb9JrGmGdIBLEATMVnzpS0yB
	T97JPO1TC6dllfYiRaRLU2okgOiAYOS/FIUtJkxUg1xALlXhjPvN1+N3B283suyJV8Egt0DiKlw
	7v7XC8j5H1BsF68DPES8MczGlpm52XsFVZ8OGQEKxeBq9XNIsx0Y=
X-Gm-Gg: AYBFou3sacl7W8GE/DfqGNKHF1Xaw3pLxTmKyOq/SJPizDSK1SCklmgblJ/6HmQki5M
	SJ0hlgrh1vQhrvHJccAHCoG1htJ8o2YbUXlCgyd1AFXqu+rhc3z7LLb7Zo13R71HqayVNl3bRfU
	nO2IIMmLwfxUg/gpR62uhnZu1SlXxmMBsznui/H0FQRgcJzv8Ck/rA+va8YvZ6PGpLeYRbBtyzy
	4dd9ut0Hf+3ynECopk/UVzttUVShN7IjMwruEJ7b7CFPNo7eq0blTqIGkarOzUo7chW6ygATJlr
	VgGxm6BG0++D5M7D8MhFmc95CqMMWEI/Vk1makwSjPxHXrXD1DpHWhY1tjFN4fZGIUO81Zz7mOk
	vQkx28y8gmPX20q+DcYbR0JZLxurxve6F9ph0HX/DfInK1lNEF5ef+0H00Y/I2u7tk52fcUVMG+
	PDp03rrgoAVbIKAFHW
X-Received: by 2002:a05:6402:2052:b0:6b4:597f:9bc4 with SMTP id
 4fb4d7f45d1cf-6b4d4389973mr8723667a12.9.1793805514298; Wed, 04 Nov 2026
 07:18:34 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101163721.2458982-1-sjg@chromium.org> <20261101163721.2458982-3-sjg@chromium.org>
 <auhctwoLtdWs9p-7@gractus.seuss>
In-Reply-To: <auhctwoLtdWs9p-7@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 08:18:22 -0700
X-Gm-Features: AclHuK8tg8tRrxgEp_j4OsxM4QKOfctQ3MtdQs6DbKN6GiNGjBrkizAduGevpgI
Message-ID: <CAFLszThoSafw5Zjt=3ucu8Ewr6tOjVwxm35kVUGfGTWLr8gtUw@mail.gmail.com>
Subject: Re: [PATCH 02/13] dtc: Add a list for the top-level fragments of a
 dts file
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, 2 Nov 2026 at 02:55, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 09:36:56AM -0700, Simon Glass wrote:
> > A dts file is made up of top-level fragments: the root node, later
> > definitions of a node by label or path, and /delete-node/ or
> > /omit-if-no-ref/ with a reference. We would like to deal with each
> > fragment on its own before it is merged, for example to apply deletes
> > consistently or to run some checks on each one, but that requires
> > keeping the fragments apart. At present the parser merges each one into
> > the tree as soon as it is parsed.
>
> Btw, I'm extremely open to a better name than "fragment" if one occurs
> to you.  I believe I originally thought of these as "overlays" but
> that's confusing since runtime overlays were invented.

I did look at this as I had the same thought, but ended up going with
fragment as I didn't come up with any great idesa in the two minutes I
thought about it. Here is my new attempt:

section - doesn't really match Elf's use of the term, since it isn't
referring to a part of the output.
statement - matches the syntax in a sense (statements end in ';') but
it is too generic and I would find it confusing
block - so, so generic
stanza - a bit out there, but at least it would not be confusing
layer - too confusing with overlay (since the things you overlay are
layers), even though it does fit the process that the fragments go
through (including the idea that order matters)

If any of those seem appealing let me know :-)

>
> > Add a struct fragment to hold one of these, functions to build one, to
> > append it to a list and to free it, and a list of them in struct dt_info
> >
> > These are not used yet.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> >  dtc.h      | 47 ++++++++++++++++++++++++++++++++++++++++++
> >  livetree.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 107 insertions(+)
> >
> > diff --git a/dtc.h b/dtc.h
> > index 473552e..c0d8e8f 100644
> > --- a/dtc.h
> > +++ b/dtc.h
> > @@ -322,12 +322,59 @@ struct reserve_info *chain_reserve_entry(struct reserve_info *first,
> >  struct reserve_info *add_reserve_entry(struct reserve_info *list,
> >                                      struct reserve_info *new);
> >
> > +/*
> > + * A fragment is one top-level part of a dts file, after the header and any
> > + * memory reservations: the root node, a later definition of a node which
> > + * refers to it by label or path, or a /delete-node/ or /omit-if-no-ref/ with
> > + * a reference. Fragments are kept apart until they are merged into a single
> > + * tree.
> > + *
> > + * This is not the same as an overlay fragment (a fragment@N node), although
> > + * in a plugin a fragment may become one when it is merged.
> > + */
> > +
> > +enum fragment_type {
> > +     FRAGMENT_ROOT,          /* / { ... }; */
>
> Why do we need a special type for ROOT, rather than setting ref == "/"?

I'll change this,. I was just separating the case but the code doesn't
really gain much.

Note that we need to handle &{/} in a plugin, so I think this we need
ref == NULL rather than "/".

>
> > +     FRAGMENT_REF,           /* [label:] &ref { ... }; */
> > +     FRAGMENT_DELETE_NODE,   /* /delete-node/ &ref; */
> > +     FRAGMENT_OMIT_IF_NO_REF, /* /omit-if-no-ref/ &ref; */
> > +};
> > +
> > +/*
> > + * Which fields are used depends on the type:
> > + *
> > + *   FRAGMENT_ROOT            node
> > + *   FRAGMENT_REF             ref, path_ref, ref_srcpos and node, plus label
> > + *                            and label_srcpos if there is a label
> > + *   FRAGMENT_DELETE_NODE     ref, path_ref and ref_srcpos
> > + *   FRAGMENT_OMIT_IF_NO_REF  ref, path_ref and ref_srcpos
> > + *
> > + * Unused fields are NULL or false.
> > + */
> > +struct fragment {
> > +     enum fragment_type type;
> > +     char *ref;                      /* label or path referred to */
> > +     bool path_ref;                  /* ref is a path, i.e. &{...} */
>
> This can be derived from ref, so I don't think we need to store it.

Right, we can use ref[0] == '/' to get the bits we need.

>
> > +     struct srcpos *ref_srcpos;      /* position of ref */
> > +     char *label;                    /* label to add to the target */
> > +     struct srcpos *label_srcpos;    /* position of label */
> > +     struct node *node;              /* the node definition */
> > +
> > +     struct fragment *next;          /* NULL at the end of the list */
> > +};
> > +
> > +struct fragment *build_fragment(enum fragment_type type, struct node *node);
> > +struct fragment *build_fragment_ref(char *ref, bool path_ref,
> > +                                 struct srcpos *srcpos);
> > +struct fragment *append_fragment(struct fragment *list, struct fragment *new);
> > +void free_fragment(struct fragment *f);
> >
> >  struct dt_info {
> >       unsigned int dtsflags;
> >       struct reserve_info *reservelist;
> >       uint32_t boot_cpuid_phys;
> >       struct node *dt;                /* the device tree */
> > +     struct fragment *fragments;     /* not yet merged into dt */
> >       const char *outname;            /* filename being written to, "-" for stdout */
> >  };
> >
> > diff --git a/livetree.c b/livetree.c
> > index abe73de..982f0a6 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -448,6 +448,65 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
> >       return list;
> >  }
> >
> > +/* Create a fragment of the given type, holding an optional node */
> > +struct fragment *build_fragment(enum fragment_type type, struct node *node)
>
> Since there's no ref provided, presumably this must of be
> FRAGMENT_ROOT, so why a type parameter?\


>
> > +{
> > +     struct fragment *new = xmalloc(sizeof(*new));
> > +
> > +     memset(new, '\0', sizeof(*new));
> > +
> > +     new->type = type;
> > +     new->node = node;
> > +
> > +     return new;
> > +}
> > +
> > +/*
> > + * Create a fragment which refers to a label, or to a path if path_ref. Its
> > + * node is NULL, so the caller must either set the node or change the type to
> > + * FRAGMENT_DELETE_NODE or FRAGMENT_OMIT_IF_NO_REF
>
> That seems a clumsy interface.  Maybe different constructor functions
> for the different types, that take all the necessary pieces?

Yes, that's better, thanks.

>
> > + */
> > +struct fragment *build_fragment_ref(char *ref, bool path_ref,
> > +                                 struct srcpos *srcpos)
>
> Here too, path_ref should be derivable from ref.

Right.

[..]

Regards,
Simon
