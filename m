Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805364;
	b=G0ejC7aOJ4+SCply0D2aT4VR5sWTGRAiLWl4LqgvLkJM0hpG/MHb6oFdcW6ADmWd4C1v
	 vgR+OUGqUSx1/LeqKmh2WrKMmGUsCXOkv1BaLs1M12GPltEEE0RVH1QTCPdupOI8Utegb
	 nptfScuPxXc62QmNL/ui5GUrKzpaqI6V0321g+8SEU/xHo+hhFtwhCe9BYhf6dSai6M8W
	 U4wZB7Yn8DHuvG7JV/CAaZn5gnG8oHzcgFO3L6bXLxxTd5DrAShTkO7R4jWk/5UGBhrJZ
	 /25OcRn+05u5/+P5zANMCZvCD/fdKzPlNB2ARSQPLwGF6ZUYuiy+Fmdo+ECIHopTGcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=UL1wTeFHRh2WKOmuPRogJoNGO9GGnFhfYBJhk6JM4NQ=;
	b=agK6+CUJhAD6by3UjETl0M4ZtuXNcJHSb2qsDW7M3QdUgbHGJXvw3tSZD0+WeRHulrnq
	 n5515zir0kgOBdxlMFTq7ead+HTtbqdCmf/FZcw+Ph3uuGgl7BEPMfgdMDs/J0EGM4tPx
	 lDb0nA+s32lYDeNjXOYhrlloi14s/EY+yYWszcKmgUN2aVcG6jyvIYzKsH3lo1CmmBUDd
	 mU1p1Y1nAWORUABz84/zZTHsZHZsLJ/ECVjlPIfg/3RGGeK8wk5Pep5IC13tNnGrf4kyX
	 D5Q43bJVXgoIIY91XCEdxELOwAb2zKzxCEID1l+G/SeympjK+heyP3ulaTqm8wA8t8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XD8H5+uH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C547606EEA3
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C547606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XD8H5+uH
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c45551fa84eso134551466b.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805363; cv=none;
        d=google.com; s=arc-20260327;
        b=eL2+uzSkJ0fupk+15VAdKJ1H3JuFp3corl09hSb+/X9QAcnITkD2NjmDZbPa9tMfl+
         YM/lDsaT3uIVN2+dQ8Qu2AzjYu3No/EiMsTKDzgubM9NZH4nO1HRLQOiDjTIz9xAyk+E
         SVZrzFDv/gyX/JkeYunzEnuvl/JtaSFWH+FbGA17dcbVs2TAr1eswBDy7kXj6+eZQW0G
         IpRo3wqiIntFP5MUi1J+x10z/uaTnM8MjpyZ5zy5kF9tkP7mZiuUh4iPZp73W1bIeR4j
         LYaNrycTwBT2dn0x7MlKGAWfPCBTJp6I3AJ8/+EzaC8o7HQFlryTbLTDVsRQDLeYqAYZ
         4yWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UL1wTeFHRh2WKOmuPRogJoNGO9GGnFhfYBJhk6JM4NQ=;
        fh=srd9RlF+16/dPyjlTyWSZRXUPbkLZ5CDxVawIXOQn9Q=;
        b=c/uM7QdxSHERSg0fsvwX/h1vIZyoUwISgVH+0IJnyo8oGC2oz/r4sHMkfBXsB11yme
         42ps10BIA7OjonPGMl9aNyHSo6ahKiE6xs11uj+fDd02WSnGyhDw90S8fs7ckYzXkBiM
         sbCEzI2WT+KC9wkgw2Fw4w4KoNx9oRrTjBQHkB7LkRjlQ1Jrsn7myL0uyEDDwFgiGRt1
         VLhxax8QL8gLtBaI/FO6DEPUhcqZhzNwmlWzKIUFp9AkJ8PU1fqLPvspCJmxMx0usVcR
         LBEk7Wmp8iu+xaBokgzLN8+FWwEkoKcNGhXOMxiDLmXwx7Z0EzZULKVYP0AQxzpcVbB2
         +hLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805363; x=1794410163; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UL1wTeFHRh2WKOmuPRogJoNGO9GGnFhfYBJhk6JM4NQ=;
        b=XD8H5+uHd8I9UGRHNKjsU8/JVv8pLcJZl02hB5aEyt4PZ5XquQsejpWxn9tsIqVpud
         78Zr+f4D8T8Kin78pBBRI/V3TT5KzeP2JHGCQSkzVjYmxY0qhIZVYqNaGqvMOiPdhHan
         NLCkAn6T5oxlNeM/jTNaJkEyYNe+OiurPdewY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805363; x=1794410163;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UL1wTeFHRh2WKOmuPRogJoNGO9GGnFhfYBJhk6JM4NQ=;
        b=TfuTx3N1sMYbuTzhjXZbbxXyXInGMelOZ5qIt6Zl6TwEK1aeQgV9ElVWEeNjReR/Qk
         hVNjc24aL0F84Sx35nJxdzwuJJbNh5iBagyIAHu6n6DGSqYJ88iTZUVhfloMd8y8CBB3
         9bdW/8FvSyhkDXdHgXXumqNa/EXxWHVTCHnpfQ8tJh/2KZOtaCJtHHYXp2BXbTjBaWLu
         8hk+MQY5DWaOEGiYazzhNdVZoHQSFRSplkAsrVRbFjrPuN1SwtB3B92x8EGr51s/0Ifa
         rWIb1rxEw5bS8Z39Ske6FVwIwT9UFPzZjO799mCq0UII4urgznowUQ/HyilWme5IQ+tn
         k14A==
X-Gm-Message-State: APuU4Z9AmiiHRy589G2kcVOkFBx+snUqLvLp5MUsoXdK4usoRjlaFF2C
	MTgESczcqo5sbE5rcTBB66KHBTbkjj9zQkDgTRgpVak1qmgsNF4jxD66hU++bfG4vKqtMgDpTN6
	qUaZMwDyXuHJvOXD08v+FM3n2TRG/YHpXQVCM+FGRIzgkOROcOQ4=
X-Gm-Gg: AYBFou1qKWVLn+J6HqYKnXAVdSIQbYw6eG68ZhFdNNo6CWFs5DRPhALsFYKeM6fWy5j
	GrT69WvhvpOcdAJG2k+8Ttgskf+/j8t3hGAAvpnroQoOyGCuEM5HFRTbr0OO77D2WoX5CP8JHaK
	sCzSyQT3j1x+zGvvyQ0kqL4EYzW2RQkuJKNzwMZbC8qB7riLsrd3KexXJ6hqZGjf8a+Rgz09kvs
	kHVobAsKaRz129aRLqS6MccFWE4WepPodRtR/2J3IYs+zWR9Z05W6KPEGxawBavuS+fMQlfdvKT
	uwt5NecVRhGutpEeOWxSUf0eDQ4uwW99mZQmj6exgxZJuKR8ngptTJh9XRj2j4H4ouhM/+enBjz
	FJvOqI27tPKY8ozJXuZzaLnPZdNxHxTP9XAR2g9CnRLoCHcuBNp9IQegzKvo9nDtnkalryA8=
X-Received: by 2002:a17:906:c143:b0:c46:c3ad:e1ca with SMTP id
 a640c23a62f3a-c4ca7a0996cmr1470873866b.9.1793805362568; Wed, 04 Nov 2026
 07:16:02 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101163721.2458982-1-sjg@chromium.org> <20261101163721.2458982-4-sjg@chromium.org>
 <auhd5cz1fRNAtyak@gractus.seuss>
In-Reply-To: <auhd5cz1fRNAtyak@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 08:15:49 -0700
X-Gm-Features: AclHuK8zMhiIXSTdfRc1_GNmnu_XX8uS1pYFSwEMo5wlyRYBh8PY_itFV2Pj-2Q
Message-ID: <CAFLszTgOcz8Z8ctiBz9xXkS28h4GK8etvPEok14Z1mv7YD83dw@mail.gmail.com>
Subject: Re: [PATCH 03/13] dtc: Move the /delete-node/ handling out of the grammar
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, 2 Nov 2026 at 02:55, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 09:36:57AM -0700, Simon Glass wrote:
> > The grammar actions merge each top-level fragment of a dts file into the
> > tree as it is parsed, so the merge logic is spread over the rules for
> > each kind of fragment. This makes it hard to follow and to change.
> >
> > As a first step towards moving this logic into livetree.c, move the
> > action for a top-level /delete-node/ into a new merge_delete_node(),
> > passing it a struct fragment for the reference. Add a fragment_ref rule
> > to build this.
> >
> > The output does not change.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> >  dtc-parser.y | 26 +++++++++++++++++---------
> >  dtc.h        |  1 +
> >  livetree.c   | 19 +++++++++++++++++++
> >  3 files changed, 37 insertions(+), 9 deletions(-)
> >
> > diff --git a/dtc-parser.y b/dtc-parser.y
> > index e47f80d..61301a6 100644
> > --- a/dtc-parser.y
> > +++ b/dtc-parser.y
> > @@ -47,6 +47,7 @@ static bool is_ref_relative(const char *ref)
> >       struct node *node;
> >       struct node *nodelist;
> >       struct reserve_info *re;
> > +     struct fragment *fragment;
> >       uint64_t integer;
> >       unsigned int flags;
> >  }
> > @@ -80,6 +81,7 @@ static bool is_ref_relative(const char *ref)
> >  %type <prop> propdef
> >  %type <proplist> proplist
> >  %type <labelref> dt_ref
> > +%type <fragment> fragment_ref
> >
> >  %type <node> devicetree
> >  %type <node> nodedef
> > @@ -157,6 +159,17 @@ memreserve:
> >
> >  dt_ref: DT_LABEL_REF | DT_PATH_REF;
> >
> > +fragment_ref:
> > +       DT_LABEL_REF
> > +             {
> > +                     $$ = build_fragment_ref($1, false, &@$);
> > +             }
> > +     | DT_PATH_REF
> > +             {
> > +                     $$ = build_fragment_ref($1, true, &@$);
> > +             }
> > +     ;
> > +
>
> This seems weird.  If the point is to allow either kind of ref, we
> already have the dt_ref nonterminal for that.  If the point is to
> build fragments, rather than just refs, then why do it here before you
> have the information you need to properly build the fragment?

Oh yes, will fix.

>
> >  devicetree:
> >         '/' nodedef
> >               {
> > @@ -236,16 +249,11 @@ devicetree:
> >                       }
> >                       $$ = $1;
> >               }
> > -     | devicetree DT_DEL_NODE dt_ref ';'
> > +     | devicetree DT_DEL_NODE fragment_ref ';'
> >               {
> > -                     struct node *target = get_node_by_ref($1, $3);
> > -
> > -                     if (target)
> > -                             delete_node(target);
> > -                     else
> > -                             ERROR(&@3, "Label or path %s not found", $3);
> > -
> > -
> > +                     $3->type = FRAGMENT_DELETE_NODE;
> > +                     if (merge_delete_node($1, $3))
> > +                             treesource_error = true;
> >                       $$ = $1;
> >               }
> >       | devicetree DT_OMIT_NO_REF dt_ref ';'
> > diff --git a/dtc.h b/dtc.h
> > index c0d8e8f..9f9076d 100644
> > --- a/dtc.h
> > +++ b/dtc.h
> > @@ -368,6 +368,7 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
> >                                   struct srcpos *srcpos);
> >  struct fragment *append_fragment(struct fragment *list, struct fragment *new);
> >  void free_fragment(struct fragment *f);
> > +bool merge_delete_node(struct node *dt, struct fragment *f);
> >
> >  struct dt_info {
> >       unsigned int dtsflags;
> > diff --git a/livetree.c b/livetree.c
> > index 982f0a6..5c9ec48 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -542,6 +542,25 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
> >       return dti;
> >  }
> >
> > +/*
> > + * Delete the node which a /delete-node/ fragment refers to
> > + *
> > + * Returns true if there is an error, which has been reported.
> > + */
> > +bool merge_delete_node(struct node *dt, struct fragment *f)
> > +{
> > +     struct node *target = get_node_by_ref(dt, f->ref);
>
> assert() that f->type == DELETE_NODE, maybe?

Yes, added

>
> > +     if (!target) {
> > +             srcpos_error(f->ref_srcpos, "Error",
> > +                          "Label or path %s not found", f->ref);
> > +             return true;
> > +     }
> > +     delete_node(target);
> > +
> > +     return false;
> > +}
> > +
> >  /*
> >   * Tree accessor functions
> >   */
> > --
> > 2.43.0
> >
> >
>

[..]

Regards,
Simon
