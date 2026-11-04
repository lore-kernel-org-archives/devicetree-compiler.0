Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805527;
	b=1khXugpEftrulqPhx/KaCl+/2qVBhQ37ObrwDfoYxjT58VF49ajSkzv6C5eR3LLsqcEA
	 FvP18ZeREWbTeyN5tO5U3SocDPzmNSElbVsVlNCxNvBaFYcE6TVoMUMzRs3Ils5PnwCIh
	 2ZfgaAWyf7LmFkmsapAnIIwzVe3eCh0GtY1S9zFzxLVXhIt4BYPBR19GljLnC9TyfnMsl
	 ltGttFqEPYy6CfQIYhCRbAZ+1UcWOohA3ozqIzEQSJHqkytZgrXA+1kTUdjao9pLpB+tT
	 11yiS2V18/jqsdzsjd1sCk/Hl2Nw6bmLb6AnvCzL2NqgetPxkgofMymjep8K0gWREdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=K5iW3xB6BkeycsnjUYRfRiSLGcKSz/629drr0pPg4rU=;
	b=B77KXaZabYoV+9X12p9UTiNzbbqlUtXC3IW+H1DSA111e6sx1Y2fEia7fbOB3Lda18Cr
	 5cMkh9H01MTBdu4Ilbsa7XLMuPzIn1YdGr3/RX4irlXSXbAGEEmoBnuoZM3JYm8/13QyN
	 PHlzYH2m8yG7UNDeP9RR/ykUA3SIiyrqj2JUf7+7jwpR5gUYG9m1lnt7/BQ3Hl+YayEDw
	 ESvdi3uH2UXYK9xNQ99pCECc1xPn4J/+JWLfGJkIfIL618Pkck5C9IhBsoEDLNFNG9Urr
	 SwvO2747iUWmzg+aXj77oCnnl9ZAl5e5mvnl22RAZf6E52ZIFLoBorLNsqHQ7S/ufHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c6SxwbzQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0C2606A7CD
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E0C2606A7CD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c6SxwbzQ
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so243887a12.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:18:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805526; cv=none;
        d=google.com; s=arc-20260327;
        b=M6/5h45cnX4JYRghnxYtL+lEo6qDXcE6oWB5utHI3Z7q//CoFbwC+qePDS4qnGy6WB
         UjvtyJrVUVy8+qWwtsjR6aKoryQTyjoew2HAtrMbrZ19scJ0QZp1BvQqS8gZGxnydCPS
         /LWH1+jCcZQP4Oa+Mh42nToCzrt/kQdGVoZhsC/4AxLM0ECaQV/fjpCR7CsKIS+eqlew
         N+5PBwni7t5EEHeurTeF8BhnJGzRqgpTagTh2Vt9L+uPSy8rBx9PeUx+XxP9gNpjdypx
         4eJd5Adf0DgkgcIBzavv9UWpQ9uLnU9SnY1epX7iBhESEqrWt1y5wy4di1vfbUkaTjyk
         UK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K5iW3xB6BkeycsnjUYRfRiSLGcKSz/629drr0pPg4rU=;
        fh=KjAeARqj5IMreDLRQFkSA92RTYUwd4GucHTlU5HW+sM=;
        b=PZ0QAwY8apkNNWW8EEv8am7cxlOH8FDc2NfMzOiedtv6i7zEMRfps5rLaGJi45q0au
         wjNLItCL3myIpVgE5io0IRicvGldt81kE+ayJQ7UcoF6wl1CXZWzJOosLaZ3K9okAeN1
         RMIOTwda0DIaS+IM+i0cFB1JxbS0ddtE1mmO56alZ7ILsyR2DGp+Yz/Qxhq/xuojAQsj
         ORL1aEfLBCnU2AAXekelgyCBZc/cTCW/LAcI/JNRbTv9aXlFUrpaSBDJ36107IUY3FHU
         +Hl1GVQTiYQhzrdGPKEyZIll8KLaNjMcCX8N/90P5DGq/vQULHueDncx909xijYwpwP5
         xHNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805526; x=1794410326; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5iW3xB6BkeycsnjUYRfRiSLGcKSz/629drr0pPg4rU=;
        b=c6SxwbzQGLB4GhyGN2W8vPq29vs+V0wo8Ox517C1eBOODV8fXJ70ahaHLBUlPA4Y7o
         92HwQRlh1ly34uazF44buuKYascsvqIDQ9ovF+Yn4yvLboG+eHpNALEd9+0ry5Dj/mtl
         bwPM9fiooZeHp+ia5xQo+yRGBK2D971ihWFWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805526; x=1794410326;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K5iW3xB6BkeycsnjUYRfRiSLGcKSz/629drr0pPg4rU=;
        b=SLPS8V9EYdnAzC1AZ6fQChzqOdxKGlo+CGenhLy7BHztZPYBFlV/A7Yu6zZPwy2TDy
         csCf8RvCO+MhRrjjUaAnE3b1ucnU05FIKXP+YRVJ3XoxwGEQGxixMJkbuzcO1+civ491
         Qpm3EQMQhZtycY9V3IvPkffnyDwwx3bwHNk+hZO7YOBxBC/CtTdLh1eoUCQE0HJtsIfj
         /fht8Whi//icfot5UmAjuk1nQBY+HRm43aFZ4iiWvkCOH5hyeZbe+LpUOR1mvaaD8GX7
         YohaoR3p4d6doHcLm/AWjy9rPtkifxJWDSFudO96x9bkxKjGQVi5pi3+LRn5D9UwuoKt
         dNZg==
X-Forwarded-Encrypted: i=1; AKwUvBzCpcc6un2zUhfoPn/ADH7bgnguYpBKHXNkGMf9jNVKxf2j4wsoudltLvKQUqdf9VkYR405pikdOLDpzVbAD/GWKilU@vger.kernel.org
X-Gm-Message-State: APuU4Z/8mDAiIffRduOim0er9YTR9APjTqk3OlGnamIUdnZwY7AFYEIh
	iAFT1SildYmnte1iL+c+iSsY+PgE/uAVgnWZSos3o99APY1ZoAauiTLJd7onQIhZVEpzBYDyMb1
	bLn3UpqYPgKTHlTA++AaMIXlpnW2sCDE98SHANj61
X-Gm-Gg: AYBFou3Mcm/JE0aeHRwwcaOeuS/dQeOxA/1qfw0B/oL0KDlSGXuEFLmZNWViGIwwTWF
	0MiwjHBa5p7Wn1QAa1Bk8+J5Yo1lOzvRfHlzFYm3OOIKicMqE5qDqhMOIeMce6KjdsCx9aQB38/
	IstyiGozPU1phppyLHgOJFf9hf/GXqszrGqvutvsPBDZz72jW4uowRjv/kIsCruWA3EFaVBojXI
	DCwS98wgFiN2bMVZIOkzcJcDGYZe3v3LaL0/P0UxOXZWHaFowBPFBoIHYXfERJWnOuDJ8IB28Bl
	uRqFWy6g+QZef+Uq+5Z4H63BzNAAeX6USl5/TMRg3s1FE/5y62xfXRydxORKlRvcVt34RltaN9l
	bh7LP0xeao8bZYm62UrGUZH4BVYHZdxQOvzcrfqlyrOt8+cgNQlxmpKxkjLoH6BmLJGYqMPI=
X-Received: by 2002:a05:6402:a6d1:10b0:6b4:91bb:88ec with SMTP id
 4fb4d7f45d1cf-6b4d4d6f5e9mr8643611a12.35.1793805525709; Wed, 04 Nov 2026
 07:18:45 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101163721.2458982-1-sjg@chromium.org> <20261101163721.2458982-13-sjg@chromium.org>
 <20261103180753.37c83a4c@bootlin.com> <aurVnLe9QRE2IYCt@gractus.seuss>
In-Reply-To: <aurVnLe9QRE2IYCt@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 08:18:33 -0700
X-Gm-Features: AclHuK-YMdKfWUcezBJqPQ-Gi6kVweMA9FAgcI2avI_13Dan4yjPlQ3P5wpepsw
Message-ID: <CAFLszTg0NE0mbQggMZ=JEEev7FUhPJfcJwOxRD7HJVUdLKyW9Q@mail.gmail.com>
Subject: Re: [PATCH 12/13] dtc: Merge the fragments of a dts file after parsing
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Herve Codina <herve.codina@bootlin.com>, 
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 3 Nov 2026 at 23:51, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Tue, Nov 03, 2026 at 06:07:53PM +0100, Herve Codina wrote:
> > On Sun,  1 Nov 2026 09:37:06 -0700
> > Simon Glass <sjg@chromium.org> wrote:
> >
> > > We would like to deal with each top-level fragment of a dts file before
> > > it is merged into the tree, but that requires the fragments to be kept
> > > apart until the whole file is parsed. At present the parser merges each
> > > one as soon as it is parsed. The grammar actions also need to know
> > > whether the file is a plugin, which they find using $<flags>-1
> > >
> > > Have the grammar build a list of the fragments instead, in source order,
> > > and merge them with a new merge_fragments() once the whole file is
> > > parsed. This calls merge_fragment() for each one, so the output does not
> > > change, and frees each fragment once it is merged.
> > >
> > > The $<flags>-1 term is no longer needed. Within a devicetree action it
> > > reaches back up the parser stack to the value of headers, i.e. the flags
> > > from /dts-v1/ and /plugin/. The sourcefile action passes the same value
> > > to build_dt_info(), which stores it in dti->dtsflags, so
> > > merge_fragments() can use that instead.
> > >
> > > There are two differences in the errors. A syntax error later in the
> > > file now stops dtc before any earlier reference errors are reported, and
> > > reference errors now come after any other errors which the parser
> > > reports, such as a division by zero, rather than in source order.
> > >
> > > dtc gives the same output and messages as before for all 4162 .dts and
> > > .dtso files in Linux v7.3-12284-g3799eeb906c9, and for the dts files in
> > > tests/
> > >
> > > Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> > > Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@gractus.seuss/
> > > Assisted-by: Claude:claude-opus-5-5
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > ---
> > >
> > >  dtc-parser.y | 43 +++++++++++++------------------------------
> > >  dtc.h        |  2 +-
> > >  livetree.c   | 36 ++++++++++++++++++++++++++++++++++--
> > >  3 files changed, 48 insertions(+), 33 deletions(-)
> > >
> > > diff --git a/dtc-parser.y b/dtc-parser.y
> > > index 1ed9731..c1aa4ad 100644
> > > --- a/dtc-parser.y
> > > +++ b/dtc-parser.y
> > > @@ -24,22 +24,6 @@ extern void yyerror(char const *s);
> > >  extern struct dt_info *parser_output;
> > >  extern bool treesource_error;
> > >
> > > -/*
> > > - * Merge a fragment into the tree as soon as it is parsed. The flags come
> > > - * from the actions using $<flags>-1, which relies on the rule being always:
> > > - *   headers memreserves devicetree
> > > - * so $-1 is the value of headers
> > > - */
> > > -static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
> > > -                                     unsigned int flags)
> > > -{
> > > -   if (merge_fragment(&dt, f, flags & DTSF_PLUGIN))
> > > -           treesource_error = true;
> > > -   free_fragment(f);
> > > -
> > > -   return dt;
> > > -}
> > > -
> > >  %}
> > >
> > >  %union {
> > > @@ -94,7 +78,7 @@ static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
> > >  %type <labelref> dt_ref
> > >  %type <fragment> fragment_ref
> > >
> > > -%type <node> devicetree
> > > +%type <fragment> devicetree
> > >  %type <node> nodedef
> > >  %type <node> subnode
> > >  %type <nodelist> subnodes
> > > @@ -119,8 +103,10 @@ static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
> > >  sourcefile:
> > >       headers memreserves devicetree
> > >             {
> > > -                   parser_output = build_dt_info($1, $2, $3,
> > > -                                                 guess_boot_cpuid($3));
> > > +                   parser_output = build_dt_info($1, $2, NULL, 0);
> > > +                   parser_output->fragments = $3;
> > > +                   if (merge_fragments(parser_output))
> > > +                           treesource_error = true;
> >
> > Why not just pass the fragment list to build_dt_info() instead of using the
> > parser_output->fragments and later in merge_fragments() setting this same field
> > to NULL once the merge is done?
>
> As I noted elswhere, the point of this series is to delay the merge,
> and it will need to be after build_dt_info() to do what we want.

I'm going to try to expand the cover letter as I didn't really cover this well.

Regards,
Simon
