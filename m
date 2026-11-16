Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794873009;
	b=vzwvXLv5poRPAiptsbIT+4Q0ewn1bj7YbnQD0ql04mw83DBZlRg3EUDnthlnb24fcHPV
	 9QOpODbBMMVaj3Fpmmq+isw0TFnrMlcNhr+ab+6D7Hq/BJqlZP2D4SR6xek2AtUXCpvou
	 D52hSchSmviWIZCvUDJv8xN0Cq5NrkTGOImECLTlJew93ZT48LL6aLPbqr/GbDwodQm5/
	 HGs39CJU1w1591J89Hknj6V2BdS5gErre7dL12N16I+kHFSPWz2C/h9pcfR572XvWnqRH
	 +k8/9VGCtD1874+MSTXsSqnlLX+MQoOi+UhO+wGV0tJhN6imS+5vFxp71ePCH5aiW6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Ikb8OKh4Ca0x51aF8pZ6d8pT9VKawuChhyCvEuaeUyc=;
	b=0p7TF+4WtXJHm80u/gGdqyNRkze4FK+s/zzRuFFjvjz0VYuBrJWUQhnWryHRqi9JMDUi
	 6Efl1QtAVMYh1De3rq55lOWZLTPcFIUvk6RV3+n6dyUPDrSCDugBV3y50AAin6nWu0S/Y
	 yU5drKqo1PW2HtvH/TZNOnzknAPF+8SYaPvmcYGqwOWmoGVUrizKZSY3HnKD+kx6PRZFn
	 mflh7RovqGdASxyIZs8wgLukXCuT7De5bZ4A6J8ZG08sVy857Nfk0PqzsaaUVbr8+N65s
	 /HG3wRHHBsNaEiJvGzmHwOxYvk3LpVZ4DcpN01evbrXVZdME4uXbDmkRiDukkaPYTyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY3G+gOi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5635D606A338
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5635D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY3G+gOi
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so6278385a12.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794873008; cv=none;
        d=google.com; s=arc-20260327;
        b=nxpiFCDbvuTq+hcgh4ggYFv9gjGYSPbXhL1vzDjF8XM3mNZ3qHGx0UFG4hPwu/UVOS
         a2iBSSWkUImOqrWrnK6GSSONloGDQLrA2NEVo55xfV6F+RqAfaFgLiwix0miFYVs0TNc
         wjOxUGsLcW8AKatfkJSizTMrv5q5aOtq+MLP5jjQr7Q5NQchviMV8Nk7h/9+PIRmbmoM
         95mmh+FBHIqQJJzupnFzRgdsSA15nlVmJSWPA9goyqk6i7oCcJG5SaDGpH7iW3Mtw1jK
         DhQtDcH4mKR8EsKAIhPpOircKs/NQ0rNjDOoInsKSVapLXgTQDH+OJfYmv5cSmV7Nt3Q
         pUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ikb8OKh4Ca0x51aF8pZ6d8pT9VKawuChhyCvEuaeUyc=;
        fh=mqQIQk6NAYxyS97NAWCo63T4PX2HDnM54/E1mUMNKCM=;
        b=gKiPC1M+jG+E0qvLWAOeK67jWGXHWTRS3xM7g0tw/ignzJZ92IH09FMW6nvtjJ6ais
         iLoitqF1kWh7kHqUJif2gFcWOjKXrF/0RU9wSD+gGI0k2lYZa9clBpllA7xKf+ZrY6tO
         zQjLZAkHssnuj4p4zIwdX2nskM1uL/kC3iYEL84ElctEWQnXTORGPRvHJvVuUqQ5qfls
         Bpc9v/I6/Eamc17G7jT/gMJa36G8BO2uKwXWPoWFaNbbzrnIZzqfwNPnq0aUD2iE9IVl
         K1+wv5BwEKaH58U3JgoJYQ1ik9ss85jXAQdsoHDoXhpX7l1HYzr65/E2KuHkkaG3JVAV
         c9Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873008; x=1795477808; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ikb8OKh4Ca0x51aF8pZ6d8pT9VKawuChhyCvEuaeUyc=;
        b=HY3G+gOiCVuBnlg1M+S1+5gbQNjVVhguH1yRLrf2e+33go8pR5lblL4NiYlL8TwZww
         R7fEXRHGZzRDWTQf6aS4YFBNH/29vYq3jzgJOyqQ3pfl81sJyGAuolw+mzCQS+iETe2X
         jqjlGWv1fVKTsmNcA034KhcrvoufoQ1e8u4oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873008; x=1795477808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ikb8OKh4Ca0x51aF8pZ6d8pT9VKawuChhyCvEuaeUyc=;
        b=l5tw5BvpEAtos3n0ZaXBEWPt/PDBJ9MKQqiZeN9lzZfzHAwDkt5cJdJ2B3olTP6qff
         Rzg66mqpeDwaHaYT5qIVhajOti13u97od3RxFfFkJ5Qoa4X2Fo73WkcrMV6XZRUdiFf4
         3l+FXnylWF64Q1tZc9UEB4HAvs85+6hjOO+x2dU0LQPX9KetQtwkGSRBqOu5lYhW6Ww9
         6T3ycc+XPQj5Ve6reiyxh6uV8Wgt/hDpvCoG+9uPAgMHlpDOYjmR4vbBeaaxuSAYoYpu
         bV5tXjn1DHoMoodflVF+YzfHZRT3pyQWBlMQSSIq/DKVY+mlArNMgo/4ZVjRKZJYExBq
         PjiQ==
X-Gm-Message-State: APuU4Z8vv+dm6oXXgi0Qmdc6YKI7WDAuTVokz691CKRHw2Zjp0T3ywU4
	5ZluqMr5NKyTPeXB5JU4VI9T0n+ZD7GTTWqjNrDEzyhi71Krw3VJWiPfbzJYtX6CzqxMNmJPRHz
	iNBLlDh5SVTlONarLG9z3Q8NiatKzXfHQlnq+Kw0y
X-Gm-Gg: AYBFou1u2SK1ghE5YvgrD03+XoA/MvrU0Z0++5SnVsyjGxoAld/+2eHR0szrQyLMXl1
	OjU7kle7n4TNBX0i3PSRcB/hv4N1dlbvQRiBJucxVilmk7h1T+H0bhXnG4mp4QsrjfUJca5P5I2
	c9Rykcf6Z5Aue75JupMkKTG40lTrBaZN8AxIbCRWcsqaz3j3gPfqOI4AL8jMyygb0Pitc1QIUvx
	4JX7+JNCn4wD0iYdLg5fSppN5cAixYMSqyZcGUjVcQZ/JhZ18SzyOW1RXiZC/vRenpvUMojJF4f
	JUDl6uvsu5N/e9jeHRFlbyWX8B+FTGrAaSoWOyxnGhiaoF8zOg7Yi6yMDhLdEAKCO1GFdL/pv8W
	V8TdzZLGEKV3CGKoOc8629s6mHk7joCwgzQSFf3viFZDJQPhPYXiupeP7bpOFySEeaYaZbaZN2v
	YDW2uaGB1Xs5pEoLiQ
X-Received: by 2002:a05:6402:378a:b0:6b7:b94a:fb57 with SMTP id
 4fb4d7f45d1cf-6b7c0c78051mr9016183a12.32.1794873007772; Mon, 16 Nov 2026
 15:50:07 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106195159.2623314-1-sjg@chromium.org> <20261106195159.2623314-11-sjg@chromium.org>
 <avaOT8P1B7WMeEG4@gractus.seuss>
In-Reply-To: <avaOT8P1B7WMeEG4@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 16 Nov 2026 16:49:55 -0700
X-Gm-Features: AclHuK9BpADoG_L6H0CJt45ZWzYpVAG9Z4EKtz3tK7AIHhhNgsAx-DhZCbAxtMI
Message-ID: <CAFLszTigXO2Aoxo=-qBmuROTw5mQFgaeKqhLSpW9G2yorpFh2Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/18] dtc: Move labelled-reference handling out of the grammar
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Thu, 12 Nov 2026 at 21:19, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Fri, Nov 06, 2026 at 12:51:37PM -0700, Simon Glass wrote:
> > The grammar action for a top-level label: &ref { ... } holds its merge
> > logic, which adds the label to the node referred to.
> >
> > Move it into merge_ref(), passing it a struct fragment with the label.
> >
> > The output does not change.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > (no changes since v2)
> >
> > Changes in v2:
> > - Combine merge_labelled_ref() into merge_ref()
> > - Use dt_ref instead of fragment_ref
> >
> >  dtc-parser.y | 13 ++++---------
> >  livetree.c   | 14 ++++++++++----
> >  2 files changed, 14 insertions(+), 13 deletions(-)
> >
> > diff --git a/dtc-parser.y b/dtc-parser.y
> > index 3ec9254..8d505a1 100644
> > --- a/dtc-parser.y
> > +++ b/dtc-parser.y
> > @@ -179,16 +179,11 @@ devicetree:
> >               }
> >       | devicetree DT_LABEL dt_ref nodedef
> >               {
> > -                     struct node *target = get_node_by_ref($1, $3);
> > -
> > -                     if (($<flags>-1 & DTSF_PLUGIN) && is_ref_relative($3))
> > -                             ERROR(&@2, "Label-relative reference %s not supported in plugin", $3);
> > +                     struct fragment *f;
> >
> > -                     if (target) {
> > -                             add_label(&target->labels, $2);
> > -                             merge_nodes(target, $4);
> > -                     } else
> > -                             ERROR(&@3, "Label or path %s not found", $3);
> > +                     f = build_fragment_ref($2, &@2, $3, &@3, $4);
> > +                     if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> > +                             treesource_error = true;
> >                       $$ = $1;
> >               }
> >       | devicetree dt_ref nodedef
> > diff --git a/livetree.c b/livetree.c
> > index 2e9a3b2..7ab9437 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -574,10 +574,12 @@ bool is_ref_relative(const char *ref)
> >  }
> >
> >  /*
> > - * Merge a fragment which refers to a label or path into the node it refers to.
> > + * Merge a fragment which refers to a label or path into the node it refers to,
> > + * adding any label in the fragment to that node.
> >   *
> >   * In a plugin, a path always refers to the base tree and a label may do so, if
> > - * it is not found. In both cases, the fragment becomes an overlay fragment.
> > + * it is not found. In both cases, the fragment becomes an overlay fragment,
> > + * unless it adds a label, which needs a node in the plugin itself.
> >   *
> >   * Returns true on success, false on an error, which has been reported.
> >   */
> > @@ -589,12 +591,14 @@ bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
> >       assert(f->type == FRAGMENT_NODE);
> >       if (plugin) {
> >               if (is_ref_relative(f->ref)) {
> > -                     srcpos_error(f->ref_srcpos, "Error",
> > +                     srcpos_error(f->label ? f->label_srcpos : f->ref_srcpos,
> > +                                  "Error",
>
> This change doesn't make sense to me - the problem is with the ref,
> not the label, whether or not the label exists.
>
> >                                    "Label-relative reference %s not supported in plugin",
> >                                    f->ref);
> >                       ok = false;
> >               }
> > -             if (f->ref[0] == '/' || !get_node_by_ref(dt, f->ref)) {
> > +             if (!f->label &&
>
> Why does having a label preclude an orphan merge? IIRC, we can encode
> this by putting label = "/fragment@XX/__overlay__" into the dtbo's
> __symbols__.
>

I'd like to leave this one to a later feature (I am chopping this
series back) - at the moment it reports 'Label or path not found'.

> > +                 (f->ref[0] == '/' || !get_node_by_ref(dt, f->ref))) {
> >                       /* Add a fragment@N node for the reference */
> >                       add_orphan_node(dt, f->node, f->ref);
> >                       return ok;
> > @@ -607,6 +611,8 @@ bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
> >                            "Label or path %s not found", f->ref);
> >               return false;
> >       }
> > +     if (f->label)
> > +             add_label(&target->labels, f->label);
> >       merge_nodes(target, f->node);
> >
> >       return ok;
> > --
> > 2.43.0
> >
> >

Regards,
Simon
