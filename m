Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805419;
	b=dncJodbGyDymSteUzUlS/Ue14dvsIkhUNx4WB15DUiihIqDReQwo9OA7wwaRHYTwn0WY
	 S1G/fobXoRBd+s6Da/q6qp8Ta1GAjqLEqzYSSUR1gKGdvW8xoUJqWPP5Z40uYSm0oTYHl
	 DXbK4gscbuR/vraRKZBxKLItpfstJkFjt1G40xRIxEtc3FJFtjxLwhTUM7SyuvZLoD7H/
	 faSKM9zH5D1eJ/Txyh7TxzXl7f6jwzSXrYsSBTwxTljn0+AMdSTh3rzBTVuUaYV/sO2Op
	 RojsdQSPai/tnA6ZB607BFIUStv41TWa9MPMzi4qRhhujU+X70hWoShJoAX28WCSsSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=wV4sq6jkPQmHiRBmDWwnyjQaY70V9hpYOaCT85Y9tBk=;
	b=e+Ds6n0wo7lY2WGVuDDfVH+FeQEok/DHuh15xxIEO6/hKoqx14dDRzvADSC9QlfvEdYR
	 AQUiygApxjp2aYgrK4ddzCgfmxCN2xQRoscJtptDvxFGX+FhyOgR+LbtE792dWszj8LfM
	 0k9nch1bV5cBzkIpmoa/GuY+UES8h0wwv5yS4zfEHKO0N2NyO8dW4kW2IW+Q5zM84N01b
	 25Dd/yC7HTQmULy1ouIFtUVuCFgFdjn8eYEwUPyjFDi2Z+GFMJXNhyTREiBs5epyni2bk
	 E6U6BAwG6rCrU/nkc/8b4KAQ2szInv2rYw5HzfbnOH9Dqq0wj+tu79aZ5cW8n1s/qlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B2HpYQmp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81626082BE1
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B81626082BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B2HpYQmp
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so1076894a12.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805417; cv=none;
        d=google.com; s=arc-20260327;
        b=W2wCdhSAV2YhhkfJjdrgz7NRx2rxaFTfHZioyuU/KJAuMm0S5Gs3t3KPAhZOQ+E80L
         c/MjTiS+vSU0zIb18ffLxny7PRHZ3uKx6yrXWa8Lwk525/hTdQdAbFJssQLrGhNxByWA
         dFHRjWoA/SMrYU7qqtlYoVM8UUOoB+V5rJDXwYbbXRWhsc68yoPF6chi5r6usJVSH6w0
         g9fQnOSGEyumBtitIktzslAk+rp1wHWzpjRIaiQE/SaP2kUb70DmZo6So7cY+hh7YSMU
         psDWrRsdy0fKM7RQZouEhoQF8Nslu3OcLTKkd7waPV7qThyFaAflm0fxEqdKB/voyF2P
         Nrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wV4sq6jkPQmHiRBmDWwnyjQaY70V9hpYOaCT85Y9tBk=;
        fh=srd9RlF+16/dPyjlTyWSZRXUPbkLZ5CDxVawIXOQn9Q=;
        b=Ym601uLe/eeEfu6bRT6BKv41DbqJRekTC7V8rX8eHqQIqWwt9lyQe7ubdjbADo/12h
         FZ56/0r8kyxRNvQQBYH8r+MdLIAsNTC8uhX7KQ+bOTnuA5aQINnq2vrfdnU+qg8h+J5c
         CfF+u9EbcdL8HZ8U+9nL9pIUv7a2OJyokyvpQIjVwh4ztkWjR/6JC2jz5/rb4MNzyskJ
         jUC2YcrxU//+Pz5mEnHC+RpcmL/nERXOrhvWK0usHkjXGHOC/x24dxXhvItbEkYhoTWm
         yq1fRCEekODZbNDEV5JvQv1+mR1g1+BhUEQrXVFacEqC5D0KiGrAeXKN2Z3guXWCXFzw
         5X2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805417; x=1794410217; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wV4sq6jkPQmHiRBmDWwnyjQaY70V9hpYOaCT85Y9tBk=;
        b=B2HpYQmp3U8qv4YBF3TdM444k1XrVEnCKL3jWOnayZ9NTIhe2GqRdRQ7ewvQmG4Jx2
         3Nhyf6wPiVqM+Rb2vcQ8hP+cziQlRcYFo4uRmmJYfklRmnWs/sycXWZIC6Kghp315QSI
         kkQDXMNJLwVcwJH5oTN58WNN6cdvgwp4cPGIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805417; x=1794410217;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wV4sq6jkPQmHiRBmDWwnyjQaY70V9hpYOaCT85Y9tBk=;
        b=v4ck5Cj8p3w0Z8tkXNNiKyMIUgDY+S1ZncgZwyo2/OtYfTycT7Gn0cfKEJmyf3dIAi
         1R8wz8t4+OYCiEop1k2fl5i7HBD5HEaGTsZCsOBf+T3+9Xf+Z/v34XRZho0GJPEIg8pJ
         ZyXf/TDiMBXKAhZWJ0rTEb7hjxTduM83hHNQaezbxYoopdoSIey74Qhdd/EGzOTdpS3p
         AKH4tfBTHWzdYZhEGclXHYwSljXO3vZLWgnyw7xn5AzyymykgfbQVk254UI/r2qD1uFA
         vNfEcVRE6m+NnLBEicQ/Roovwqun0eDAHjHOaOgDzfDl7VKWiNDs7Qcr0638qVvmROGe
         rn5g==
X-Gm-Message-State: APuU4Z/Dq/HymNxORJUXvFmn721y0nJICrUHECxP9yA0Fs/BGT0hzE4Y
	P1rSv7AuvCYKxVysxVOcPzUItbsVd5PNaF4FEbH8TMic52E0WBTLiVdgX8mAGFRZhrpc3AWS6g1
	1BfDOJ8esUlhahRKG97FfYzCMn5Kj71V74dR5wiHL
X-Gm-Gg: AYBFou1R7RJ/UuWuxBV50u2dsJqVWEWGLILSJuiEcf/Gc4vXWC1/O1WaEI38MV4C0oN
	tVXRGDdSK/q5cDwPQELle7ANRcEZGTPAvGOi7kIl6yyYnVzLgv8Q17FsVaPDjAjB3nt1OSodKIw
	eLYuc+3tmuh50exnYZIDFqBNUIc50J+S9MoAvc0JdkcdjAexVA3uSRMZ5A03Kfvox0g298U8mvV
	h3zWhXskcHCUNA82kAVq7oTb9H3sHtbWX8izNzqdwNHWrhlR6LmXcRyEMkKhpGPZxMIk0V19amf
	Zb8s7maGt7fv52KrliGQPWC9elp40JB6c390xvnyedSIYzIPLuEHT3VxaH/8V0Cw1bQ08KOqM2A
	HFfT6vwvlJUaoZbZrk87Vc7iHbum+s5hAtiusF317cQEbJDRvRI9xEhJf8GfHFzdYI0xH6sA=
X-Received: by 2002:aa7:d386:0:b0:6b3:c422:9257 with SMTP id
 4fb4d7f45d1cf-6b4d4d7c182mr8613979a12.25.1793805417164; Wed, 04 Nov 2026
 07:16:57 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101163721.2458982-1-sjg@chromium.org> <20261101163721.2458982-8-sjg@chromium.org>
 <aumM-E78VxAcglyO@gractus.seuss>
In-Reply-To: <aumM-E78VxAcglyO@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 08:16:44 -0700
X-Gm-Features: AclHuK93kxu5CxKxlr60Hpdj86K-ah5BUrK2XGNYXCIUiVauHY5yLZVkVyXWPp4
Message-ID: <CAFLszTjCgS6b9APVf5AZUpFHeO4ao5+PCogwtqLz4nxujC0_9A@mail.gmail.com>
Subject: Re: [PATCH 07/13] dtc: Move path-reference handling out of the grammar
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, 3 Nov 2026 at 00:34, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 09:37:01AM -0700, Simon Glass wrote:
> > The grammar action for a top-level &{/path} { ... } holds its merge
> > logic, including making an overlay fragment in a plugin.
> >
> > Move it into a new merge_path_ref(), passing it a struct fragment for
> > the reference and node, built in the same way as for a label reference.
> >
> > The output does not change.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> >  dtc-parser.y | 17 +++++------------
> >  dtc.h        |  1 +
> >  livetree.c   | 36 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 42 insertions(+), 12 deletions(-)
> >
> > diff --git a/dtc-parser.y b/dtc-parser.y
> > index 1a5ad12..cca3ce1 100644
> > --- a/dtc-parser.y
> > +++ b/dtc-parser.y
> > @@ -206,23 +206,16 @@ devicetree:
> >               }
> >       | devicetree DT_PATH_REF nodedef
> >               {
> > +                     struct fragment *f = build_fragment_ref($2, true, &@2);
> > +
> > +                     f->node = $3;
> >                       /*
> >                        * We rely on the rule being always:
> >                        *   versioninfo plugindecl memreserves devicetree
> >                        * so $-1 is what we want (plugindecl)
> >                        */
> > -                     if ($<flags>-1 & DTSF_PLUGIN) {
> > -                             if (is_ref_relative($2))
> > -                                     ERROR(&@2, "Label-relative reference %s not supported in plugin", $2);
> > -                             add_orphan_node($1, $3, $2);
> > -                     } else {
> > -                             struct node *target = get_node_by_ref($1, $2);
> > -
> > -                             if (target)
> > -                                     merge_nodes(target, $3);
> > -                             else
> > -                                     ERROR(&@2, "Label or path %s not found", $2);
> > -                     }
> > +                     if (merge_path_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> > +                             treesource_error = true;
> >                       $$ = $1;
> >               }
> >       | devicetree DT_LABEL_REF nodedef
> > diff --git a/dtc.h b/dtc.h
> > index 256017f..5af1d1f 100644
> > --- a/dtc.h
> > +++ b/dtc.h
> > @@ -369,6 +369,7 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
> >  struct fragment *append_fragment(struct fragment *list, struct fragment *new);
> >  void free_fragment(struct fragment *f);
> >  bool is_ref_relative(const char *ref);
> > +bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin);
> >  bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin);
> >  bool merge_delete_node(struct node *dt, struct fragment *f);
> >  bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> > diff --git a/livetree.c b/livetree.c
> > index 2a01d49..b0362e4 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -548,6 +548,42 @@ bool is_ref_relative(const char *ref)
> >       return ref[0] != '/' && strchr(&ref[1], '/');
> >  }
> >
> > +/*
> > + * Merge a fragment which refers to a path into the node at that path. In a
> > + * plugin, the fragment becomes an overlay fragment instead.
> > + *
> > + * Returns true if there is an error, which has been reported.
> > + */
> > +bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin)
>
> It would make more sense to me for merge_path_ref() and
> merge_label_ref() to be combined, working out which they need to do
> from the contents of the ref itself.
>
> I suspect that will also allow the grammar rules to be combined for
> the two cases.

Yes, I see, a bit more refactoring so I will split this up into a few
patches. That also highlights another missing test and case...

>
> > +{
> > +     struct node *target;
> > +
> > +     if (plugin) {
> > +             bool error = false;
> > +
> > +             if (is_ref_relative(f->ref)) {
> > +                     srcpos_error(f->ref_srcpos, "Error",
> > +                                  "Label-relative reference %s not supported in plugin",
> > +                                  f->ref);
> > +                     error = true;
> > +             }
> > +             /* Add a fragment@N node which applies the node at the path */
> > +             add_orphan_node(dt, f->node, f->ref);
> > +
> > +             return error;
> > +     }
> > +
> > +     target = get_node_by_ref(dt, f->ref);
> > +     if (!target) {
> > +             srcpos_error(f->ref_srcpos, "Error",
> > +                          "Label or path %s not found", f->ref);
> > +             return true;
> > +     }
> > +     merge_nodes(target, f->node);
> > +
> > +     return false;
> > +}
> > +
> >  /*
> >   * Merge a fragment which refers to a label into the node with that label. In
> >   * a plugin, a label which is not found becomes an overlay fragment.
> > --
> > 2.43.0
> >
> >

Regards,
SImon
