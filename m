Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793264400;
	b=HlmmTnpqCDcxT9YqBvRxexvCCKufKbc8UJpW67HQumkkLgo26rcWRcWfDiZ1499PZwwd
	 et6H2sOdnQcnuytQQI8qiSM41DqOujAYPk2WVleba3pCW8nlyj2Qt7cUnAn8eFn+ZxOGM
	 YRMCOWMn3hZcUqLskngXOrIr0QD9VGNo/Aadg4SqqBAF1o3f5V/o7GqK5XvK7bP+YQvYu
	 NpKQU0xYQsbfBCqa44kHUr7xkPUBj6CLtuQ+/KqAxpZvPnY1Ttbc+1gaRyB6QhJJM1YCe
	 RzBy/+zEBVApmgGFY+rzUxStg53H/QflrfS/HljYLqm1isVN6PxRHS5YkFRODAYc1eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Q6wN0r9NrIuA5lbgIN2xIaSDjCU8OpyysBrGV7LgzLE=;
	b=qWgxKatCo481msE78jLBuyTfeP0DivFyk80FpiNc/mxdM9uL6yX4bp8TXB9+7/mARVrD
	 eeFP62bmUbGRccAyicQuDiNvXF6ewaEGUQ/gYfDYKKqWJupoxLpMLXeFEQR2oUuMux54O
	 wGUQMLLK0qeHKRtJxotx/Dxw11OaN5xtX5F9ezlCCSIfI5KM21SORyuSVdCryJsUQbsju
	 tAGFPSA3fZsSDyY6ZrAoq3ABYoOZ4UC0PNF5DB2X7WRx4d51bxh3qrf6jXSjPCro8If80
	 7y9XnfhxTHTMPsto+tUqKGFYs++8ylj6o9b5RRiGmt2TbUPFtoGpx7uFLXYNrz7dmBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="nIsw/IzR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4316C606A336
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 09:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4316C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nIsw/IzR
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so2721402a12.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793264398; cv=none;
        d=google.com; s=arc-20260327;
        b=aLoV87nO2OPcIvGRFOfeBRwK2/VOzRCM+t4EsGDaxOh5380IeKkSb5WFmrdJQlEJGH
         SWkh5JITlHxo7zejURUKgCRvCnqUocuLw+UcsBzzWfUXmKIFPp5Rp/E5+IWPcpA8wAbX
         y7g3tzU0NKVpbYq726nYSDnG0myb5HcOOufalxjq3rzASimnyzgJStZkA5uyA6n1HEd7
         qgmsDeU4UiGHlVECHYnOvWPEV1UjNYqPyxPX1h/jRTec4tZ4jncwBkiN29C3HRDqZkoP
         h0saHvXOWDc33ecM1SEYzKrCJLqLvgz40xTjpqiTQJvaUawe0o7ArIOp8AyVEyNYYtV3
         +EpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q6wN0r9NrIuA5lbgIN2xIaSDjCU8OpyysBrGV7LgzLE=;
        fh=6uVpMO1Rx509ITfjJ1m8/U1FB11n9fR9E3zQL6G+9pQ=;
        b=BgpUNScmc/lBeY5TUUYCjwFuPXrZXUQScYFtzhQMHrdo1a/vlOyJz52TP8VvgSeFcn
         XafTcPitnzGIrN9xmw7Pyn0MyRP4NChCtNPyyNkH1JPy0ZD9lPawhQG4rk1BvUjkMyot
         V+0rWC76MGJdaOck/yk2EcdU6Ge7SYVgQLtMuFiX+dTBnP3/U4/iR3EOYg0EACNGwlWZ
         YzPT2ucO7lXq4FcR0b9jUWoD+jhLRi7oKOzrBTq10shc2bPh+k3Up5y1XDVllXg6KXgY
         xPaW6I9db3n0hRdS8hn8vKc5Oq3RTkylq70l//fyGPecAcWGfGqA9KF1KhW5a87OQl7H
         YfRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793264398; x=1793869198; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6wN0r9NrIuA5lbgIN2xIaSDjCU8OpyysBrGV7LgzLE=;
        b=nIsw/IzROlvFiI/aqjG8dHM4XKGy6yxQFEliDmfiNyvg2mBMT2DnSgF2dmjK+G2Qzy
         vfqcEF3uEauZ5Jhroqx0SPUEz2LaGbbiCWCQEsyDno7jXObcl8XJysxFnziSMFsb8Da+
         4Jd9jF/BquuGubhx3gljf0HfpyK3jq/4k6JQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264398; x=1793869198;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q6wN0r9NrIuA5lbgIN2xIaSDjCU8OpyysBrGV7LgzLE=;
        b=AEHRSP15XsCcgh94mn3cyFTCzoIU0mg+ZWZE9QPLG6qAR55jRxuASd4395XJNeXDnZ
         zfA9/g7fSOc+3VXSEHlIvqvKFgIgPNN44n/FQqLxdirhGCVoqpPZTaa9FjPTMKo0S5lJ
         +j78/sSjjBAxVMxerT+hgdjrHCmJV+DyqDqBTxVtNTkYLAZyQtrw91RCa3uLTvAsOPbc
         eMF48D8YPhSU1IRxwRZlsMeIQ5KxTn/roy/vQBDbLinEK3L32qdCgFMI4NjhkFmL4mYL
         zYpsAHRAVOYsMGvW5YYPn+ppKuWnMoZ90WRqFuQoVhLGdh15F0L9Q+j8A7sW96ij6rWw
         YCMQ==
X-Gm-Message-State: AFq9FYLw6TtQsWPMIkQBheBf3J9I0WUtFMLdcD4NVpiWEJNOtf0Nu57W
	9l+GVH1oVOzgIiZgSTkcKpViARRD0PB64bYFA1Oa7n92W8SGOVDWXuU1FPLi9F9U2O2kR5vMHMz
	1bkm8X2w8sibWqW1mxZBUxKe9Wlly5YAGoPtLPUFA
X-Gm-Gg: AYBFou1Cr4h6bL1vv5110qnWCUzr+WoA0oW5qgDIbltK1OGnm93nieR5BTxYESwVt/I
	sAokOCaS+M8hwp/+/5UPTIgAAW5jiXtSwZg9u/SOSGrZAhTLuSKWUCB+Edtt+Cegxmkbg1lPxRR
	+8UtQ/0f2ISGyqyhg4A+3kbOzSdsH52hMYLTCl6fbXzazmHyndoc/l8Rkd03ufTod5Hj5dlGJgD
	ErTeryibU7GgYIZAZ9vTeKf3BhN7pgl6r3cYueN6hlI91FkKlbP0U4EYaItzHQ2DGz8NEnWj6fQ
	N8OXoNaJpY8x8vJANDfkRj/5v2EIxdkSOgir2n/TRVI0s3cHaM5daRPNqCZeau7RyZSDOvySZaY
	cKybgDMvDBirCGi0/IgfvmLEDYuZ6/sYaiZN0LbZQQ5hO4rkO/idNsDbaUWhpKUwjbRzWNSc=
X-Received: by 2002:aa7:c6d5:0:b0:6b4:16be:4fa with SMTP id
 4fb4d7f45d1cf-6b49cbd6cd0mr2734690a12.15.1793264398567; Thu, 29 Oct 2026
 01:59:58 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028093620.3705074-1-sjg@chromium.org> <20261028093620.3705074-4-sjg@chromium.org>
 <20261028185617.12859066@bootlin.com>
In-Reply-To: <20261028185617.12859066@bootlin.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Oct 2026 08:59:46 +0000
X-Gm-Features: AclHuK9Gpoa0lFSTESXC1nzKPXqYamqquwmHx1MbF1VcEK7_DBDFpIygNf8jhkM
Message-ID: <CAFLszTinX3yWBw4HMRR7zqy3xcSgkoV=FeG3AK_KTK2bBh=qbA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dtc: Clarify when delete placeholders are dropped
To: Herve Codina <herve.codina@bootlin.com>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Herve,

On Wed, 28 Oct 2026 at 17:56, Herve Codina <herve.codina@bootlin.com> wrote:
>
> Hi Simon,
>
> On Wed, 28 Oct 2026 03:36:10 -0600
> Simon Glass <sjg@chromium.org> wrote:
>
> > The comment on drop_delete_placeholders() does not make clear which
> > subtrees it is for. The call in merge_nodes() also relies on sections
> > being merged in source order, since it drops the child's placeholders on
> > the basis that nothing earlier remains to be merged, but nothing there
> > says so.
> >
> > Say that drop_delete_placeholders() is for the first definition of a
> > node, i.e. the first in the list of definitions which are merged
> > together. Explain at the call in merge_nodes() why the child is the
> > first definition, and that merging is not associative.
> >
> > Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Add new patch to clarify the comments
> >
> >  livetree.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/livetree.c b/livetree.c
> > index 6609e4e..b7a5161 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -122,8 +122,10 @@ static void apply_deletes(struct node *node)
> >
> >  /*
> >   * Drop the /delete-property/ and /delete-node/ placeholders from a subtree
> > - * which joins the tree without being merged, since there is nothing earlier
> > - * for them to delete
> > + * which is the first definition of its node, i.e. the first in the list of
> > + * definitions which are merged together. apply_deletes() has already dropped
> > + * what they delete within the subtree, and there is nothing earlier for them
> > + * to delete
> >   */
> >  void drop_delete_placeholders(struct node *node)
> >  {
> > @@ -273,6 +275,14 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
> >
> >               /* if no collision occurred, add child to the old node. */
> >               if (new_child) {
> > +                     /*
> > +                      * This is the first definition of the child, since
> > +                      * sections are merged in source order, so its
> > +                      * placeholders have nothing to delete. This is
> > +                      * important since dropping them makes merging not
> > +                      * associative: merging later sections together first
> > +                      * would lose their deletes
> > +                      */
> >                       drop_delete_placeholders(new_child);
> >                       add_child(old_node, new_child);
> >               }
>
> drop_delete_placeholders() has been added in patch 1.
>
> Why those both modification related to comment here in patch 3
> Worth noting that patch 2 is only related to tests.
>
> IHMO, this patch should be squashed in patch 1.

Yes, that would have been better.

But with David's reply we're going to try keeping fragments separate
until a merge stage. So for v3 I will drop patches 1-3 and 5 for now.

Regards,
Simon
