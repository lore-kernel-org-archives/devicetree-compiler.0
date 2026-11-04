Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805432;
	b=nLVeRf/7ofFHML4VBU+9qMRkyT67RwqwOOnMeElS4A4kqpQFhrUIxK2L6qHFGXriZ9Ad
	 tVU81drZAg2NTvOioMzb1ZA7v1MqyoEHnd1VTzfRGRwq9U7KS7qH7ash2DcHjgwREYjbI
	 mLiyk0uvaWu2ylhqLb9t7FOCiI465kQmvb/CxnylzRYjGBCCv0u3GNbhQq6e7JEeYeYFe
	 l03aozy6TV2qTcoUTSF+HQHVmsHPQr1u/MCUrHQQB2NQpRVI6NWjlTDaroth5S8m5zkK/
	 O/UMBWgyfdwA/FuzRHM0QA31YO+NGZbnMzZAPrbnlreWIP5J/4ukRVJQ+0A5w0ciRcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=NKi73WKXLqv6qKd8HFto4p1PiCLq96CoIsYocmvcY+M=;
	b=KfSDhTSjoARjymHL/CPcFqAELrjGesufXsLnoGp3noaFRVrEzJFYsEIQxGB4pFZDLimB
	 O8gN3whcwncxI7ZYNwf8Ti3kTQEGY8qP7iS7oHn7rPjIxIm3Ubb8dP5DvbsD9JkxHMzwM
	 rPNiHf6IrypcGduiXUtu9wvT1APTmT9PjJKGpOOlU6m4laYj0BIGUgaZWTC5J91W7DjTz
	 nBNFnLKSRRCgQdXX/yFGqlp0LIOpLth4NvPsxAU/SVamCjIqM0OYPtDxMjgtzri4VfVAy
	 I9Vf0mqUM649b1yCASApo/fYMNU6fN8reJY6+tY2v76m/5Q7+E6aDWZcJbKTdkQ2Wkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cGHAjXF1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2225606A326
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2225606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cGHAjXF1
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso246667a12.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805430; cv=none;
        d=google.com; s=arc-20260327;
        b=sJDSEc6GaPe341rIt8oHdDb6AomWT5ZhdftMTDvTwKSiyC/LDfCpzPlGEz684COEwO
         NHDwDyVM25TajmzQVEHIL8NC2SHjoWzUEGxyOfEPp2bX7ZRhfX+BUdVqu25bk0PO3IOv
         TYAyWFlhywiensaM2zhxRDcoLecboPIizchxDKDvJm3iMlO3+jN/x0kwZFqNfGTbk20o
         AP9NXOReWzPJC4ml8UtmnG+8OT/cSyy7byPrlXTx5vKSi7Cfh4xMI71ml31diJyEuCnR
         /ivWAoF2an4oJ/6nJMIo9NgTyWYrVXV8vLdK8Pash7MkEvoXzImx+2HXiUfqoE4Gq/dH
         8s7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NKi73WKXLqv6qKd8HFto4p1PiCLq96CoIsYocmvcY+M=;
        fh=srd9RlF+16/dPyjlTyWSZRXUPbkLZ5CDxVawIXOQn9Q=;
        b=Ccu7sQQm2geSgf0ctI3YfNCAwpTimCJVw9D8ovZSS61S2zAA130yQdJMJSuDMs5Hgt
         dTm+haGMfgIFUqApXQzpXgYtWfncapXKFfpTP3EQQIH7Shd8WvqyIvR6GM4vY/CWvE9B
         7XdjDr+Zz4lzdIitHs5GDIU4PLWUMoMfNdfbyjrpUZzYutyMfAOIbo4ZWGgCNxojNJOQ
         /PfDt78MHTxLTwItZuW7QOghcgQSzkJpLNsncMwELd/midm1dQQ1u9QnCSLKETCnXPmN
         Hb18v4lLRRUihDi12CkPF7fK5mTbbXXk7qOqSN3s1KgmzJyHrUjyporqr3V8NGtAA8/v
         NAVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805430; x=1794410230; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NKi73WKXLqv6qKd8HFto4p1PiCLq96CoIsYocmvcY+M=;
        b=cGHAjXF1z3fnVsej558cbr3LgfZ2NtwOlklNKDfmF/X1YcWuUhQHBAMUgJIqEv2Nja
         SJeW4gyHh24sr0vaNImlHXaVc6rv8pCpaXMM03cwm+ChUbFvP2QbO3h7awl+VaBo2P46
         m8fQzUWndWnSKavtk3AArvnEydsVwW5BmUxoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805430; x=1794410230;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NKi73WKXLqv6qKd8HFto4p1PiCLq96CoIsYocmvcY+M=;
        b=sDaVzKn5uFmTJqDuONKnhIH6JCFajM6boSZ6LkFhnNzSkoJbByu4ptMPOrO/0xG1vF
         xGy2xZnmLtJ15Rg1zBbuoCgpdINyOX+SatJ9aZemCwQwORIo/hXj5RI6ZIHkWRfrsNQ0
         FNpLlL8HsMk9zceMvsbRGC1bjRmFkDx0WLefshSJOS7ZhNciHgEF8E3PKqY/cTUCpcX3
         GATlIc4563lli/S48xY5+V92L3ed4d70k1KWWtbPhwOCf3mqmNvXgRAZJ3QQ4/opfiuL
         xM4bwm5cAMiLZEQVpHr5UZ5tR1gXWK9RMyskxFWy3cWFCaJ3dXOnSqtgUBtM3NvFjGrN
         ZI0w==
X-Gm-Message-State: APuU4Z/iKnfXY4XMSo7I2nWqpr7/LPEmwv/1tCaWgjVpD1zi2qtqrYK7
	VhIbc0OZ8frC/tWwVznPe6aW8+9JqfuP1Jk44n8bykaww9DX53wFa6oTG8YNJgGmbHztnsx/Gz5
	PkMUBP2ykAYRyv9PIM3b+my3CTtYU414FKQJMVhLE4jdtxBSyNkg=
X-Gm-Gg: AYBFou0mHlb7rcRKP60EBF7yGMSnTmVzzJ/1PNPZEo2H8+DTPULi+/NFMyNQ35sKwvA
	tczuq9HBJKYcJbl9dVvJqc0hQegP0jcTP9uNg4p38WnnlI2570g1PME2j86obQ//NPGEu1ZZXVx
	BYedwcz2YzyTRjalWe6wxnkfkMJrWCFIlP7T3M++tqHbBFdK2fF/+O33GT6PXJZlmE8RDjiRi53
	Iv9XoFRxXwPb1I3Kfv7/BJbNwTwwI1wufhwJk3xagUd5F/NRPzmCgcIFeu1J3PxwfU6mEziMPos
	x9cWW/f8X6AWYImwsqzwB1McgnHFevStKVYX5KZ5nGefb3if+XiDZTRwtHXp/uPxSaYy66dQdCz
	Sgdk9qJcsvcBN0IYe0q6D3cawal6F/zxbTM9W1L1+yDJE4SkClYCxOQ/xH2cRQvfhewFu1UQQj7
	4Y2WE7rwnzMRQoDV28
X-Received: by 2002:aa7:c04c:0:b0:6af:a270:b2b2 with SMTP id
 4fb4d7f45d1cf-6b4d32909demr9810633a12.0.1793805430178; Wed, 04 Nov 2026
 07:17:10 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101163721.2458982-1-sjg@chromium.org> <20261101163721.2458982-9-sjg@chromium.org>
 <aumNU6YhSTKzkmGi@gractus.seuss>
In-Reply-To: <aumNU6YhSTKzkmGi@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 08:16:57 -0700
X-Gm-Features: AclHuK9s7K9C_dAhdr5YDIXVMl1xMd2vHqPa2pXKJm0C3nXKNoATt8J5C34XZow
Message-ID: <CAFLszTjs++U15iinNJBnU-pjQ_gh+av90fiMumjRSdRAg00eSA@mail.gmail.com>
Subject: Re: [PATCH 08/13] dtc: Move labelled-reference handling out of the grammar
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, 3 Nov 2026 at 00:34, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 09:37:02AM -0700, Simon Glass wrote:
> > The grammar action for a top-level label: &ref { ... } holds its merge
> > logic, which adds the label to the node referred to.
> >
> > Move it into a new merge_labelled_ref(), passing it a struct fragment
> > from fragment_ref, with the label and node added.
> >
> > The output does not change.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> >  dtc-parser.y | 18 +++++++-----------
> >  dtc.h        |  2 ++
> >  livetree.c   | 28 ++++++++++++++++++++++++++++
> >  3 files changed, 37 insertions(+), 11 deletions(-)
> >
> > diff --git a/dtc-parser.y b/dtc-parser.y
> > index cca3ce1..0e6c4c2 100644
> > --- a/dtc-parser.y
> > +++ b/dtc-parser.y
> > @@ -190,18 +190,14 @@ devicetree:
> >                                                 ""),
> >                                       $2, $1);
> >               }
> > -     | devicetree DT_LABEL dt_ref nodedef
> > +     | devicetree DT_LABEL fragment_ref nodedef
>
> Usual comments on fragment_ref.

Yes

>
> >               {
> > -                     struct node *target = get_node_by_ref($1, $3);
> > -
> > -                     if (($<flags>-1 & DTSF_PLUGIN) && is_ref_relative($3))
> > -                             ERROR(&@2, "Label-relative reference %s not supported in plugin", $3);
> > -
> > -                     if (target) {
> > -                             add_label(&target->labels, $2);
> > -                             merge_nodes(target, $4);
> > -                     } else
> > -                             ERROR(&@3, "Label or path %s not found", $3);
> > +                     $3->label = $2;
> > +                     $3->label_srcpos = srcpos_copy(&@2);
> > +                     $3->node = $4;
> > +                     if (merge_labelled_ref($1, $3,
> > +                                            $<flags>-1 & DTSF_PLUGIN))
> > +                             treesource_error = true;
> >                       $$ = $1;
> >               }
> >       | devicetree DT_PATH_REF nodedef
> > diff --git a/dtc.h b/dtc.h
> > index 5af1d1f..75b1c0f 100644
> > --- a/dtc.h
> > +++ b/dtc.h
> > @@ -369,6 +369,8 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
> >  struct fragment *append_fragment(struct fragment *list, struct fragment *new);
> >  void free_fragment(struct fragment *f);
> >  bool is_ref_relative(const char *ref);
> > +bool merge_labelled_ref(struct node *dt, struct fragment *f,
> > +                     bool plugin);
> >  bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin);
> >  bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin);
> >  bool merge_delete_node(struct node *dt, struct fragment *f);
> > diff --git a/livetree.c b/livetree.c
> > index b0362e4..76474cd 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -548,6 +548,34 @@ bool is_ref_relative(const char *ref)
> >       return ref[0] != '/' && strchr(&ref[1], '/');
> >  }
> >
> > +/*
> > + * Merge a fragment of the form 'label: &ref { ... }' into the node which ref
> > + * refers to, adding the label to that node
> > + *
> > + * Returns true if there is an error, which has been reported.
> > + */
> > +bool merge_labelled_ref(struct node *dt, struct fragment *f, bool plugin)
>
> This again seems like the fragment itself contains the information to
> do the right thing for path/label or labelled fragments, rather than
> having separate functions for each case.

Yes I'm following that pattern now.

>
> > +{
> > +     struct node *target = get_node_by_ref(dt, f->ref);
> > +     bool error = false;
> > +
> > +     if (plugin && is_ref_relative(f->ref)) {
> > +             srcpos_error(f->label_srcpos, "Error",
> > +                          "Label-relative reference %s not supported in plugin",
> > +                          f->ref);
> > +             error = true;
> > +     }
> > +     if (!target) {
> > +             srcpos_error(f->ref_srcpos, "Error",
> > +                          "Label or path %s not found", f->ref);
> > +             return true;
> > +     }
> > +     add_label(&target->labels, f->label);
> > +     merge_nodes(target, f->node);
> > +
> > +     return error;
> > +}
> > +
> >  /*
> >   * Merge a fragment which refers to a path into the node at that path. In a
> >   * plugin, the fragment becomes an overlay fragment instead.
> > --
> > 2.43.0
> >
> >
>

Regards,
Simon
