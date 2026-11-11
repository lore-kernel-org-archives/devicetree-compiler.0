Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794441225;
	b=VAIngW5TersW6OAu5EgnLJPfdc+Hl1U8cxW194I1GThvQ3nl6NnleB4FeE2UFe44QzA+
	 PaxdQVtPW+9jlkUvKUiPkIW15LzUSw0U2LAKeTPiNiqyOQIDioe3Ne6acZkAKA6GrGEt+
	 uOgVN3sMxuFBscLHl7OCyvKYGbLt4eLOUcCoBwuzRHONt8hyAr55AkNFYZr04o5eX4RbM
	 Igg/okOrB5ilJb1NIhJmWUAgNTp9AbgKBGY9KonQOGYD03qyXcCk7q5aGz+GYKNNg+zzK
	 88v2KVPiakNXpf3844y+UkVV8GxCw7gcVRuH+m+a726HKk9XmheDXhYxTK3gBfukWwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=UdrOhVb4lB7LsjRb1iKzobz96tHGVYI+8xS1+YD+D34=;
	b=Py8B741C8FIGT/orAV6ZcCdJqFJ/7iYwHOZhr0K4OmIVLKDAwKOoq1gDs54nfnKHfwT7
	 P1EBeZpqGgE1fJcu/W0MkxEIK1N5CsxdgfPBaFPMLEew3qIsz/Hx1PG6dEbnXtvLeLIbv
	 wL5FEWlkzMUPi1li4BS0ueLUPVTSmvI72MhESxoo+ZeIU9vQ++XUnUm1j4MHvyIP1onXe
	 yQ+5KuBBpuZIdsX33kxzaI/cPkOyXnwZorzdze4uMLK4/2YGQrYaJhidd0PuBhqGamAq1
	 fnSXdg2DDlIQ7UF6k5TUHb3CW9hQq3WL10cc+nvuIK9N6ZIOJXAyAtJ7Xei5+wNS7fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C86q7jMa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5519D606A31C
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Nov 2026 23:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5519D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C86q7jMa
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c247f6687dcso604206666b.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 11 Nov 2026 15:53:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794441224; cv=none;
        d=google.com; s=arc-20260327;
        b=TUOrw3yQOu7xRYklL9fKhmSgu0X4Ocgi3FjrdetCtLscS6nmzmFlkgOiHE4su54OPP
         30fkjpuJDxQJboiLDW5kvzD62z62u635W4gDy/8Gb/tMk00VfVjP1zmpkYqFnkHzC8Ev
         QJ0mzkb7c7JJfyopd5zEMSsK1Z9ngCejYDW153ShAF/envr/u/rRpNOOfgQJVMdYV5L5
         EHriWPghRPs5cX1oV79CczOuyMWn1zzfY3TEintNgEdPpbKsMex2T9taThA8a/GcS5V2
         7elYvZRH9NgHgJPC1VwYqhNGgG4UUavmdQXbrJkA6jmMmR7rjPa8gaOqDslf+bWMEKVu
         rmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UdrOhVb4lB7LsjRb1iKzobz96tHGVYI+8xS1+YD+D34=;
        fh=srd9RlF+16/dPyjlTyWSZRXUPbkLZ5CDxVawIXOQn9Q=;
        b=cctWuYSritgxE8t7OkzRNDNNL+7HXyjRG39Lm+fYUdf/MP3IXC/nuQ7bQpuaqCz3Ys
         yZMLctTqcht0tkFEXZtYIC5flyliNLNAECGDPR6jGE8YefvoS8cSeik+Qlqku2LYpZjj
         iMNNRq0TsmvBpEzzzzROcGiCuWDLQB+1roMVXR0ox5tjIcE3ePkV8DrNIrCwBRsrI7CY
         vN0UZmgFQE9iv3y4+wGHid4kXkPzRzlwl4zl4LZsoITnhVHNrOiee0avYoJcyAxhG613
         jAEuVpkfaJOZCywr6WOfNbkx3rpQGkSX2KjMtSW1gUL27QGpJyCXL0+wkVUaqT6+Kgv8
         gn0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794441224; x=1795046024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UdrOhVb4lB7LsjRb1iKzobz96tHGVYI+8xS1+YD+D34=;
        b=C86q7jMa12w8k8e4JauuHA5dHPSgQGz1FjkfyZLVxI/hgm4IkWqltwSTEJ3cCjRgt9
         jTnm/VggLvkwQe7g2cTesSF6VMiLICafTxnF7Xm1IoQyo7BNzfd5p4T8RHSxuzBtGSvx
         GiaLPLkiYGGeGMJFJ4TMLc0dHBxTv6KVj5SUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794441224; x=1795046024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdrOhVb4lB7LsjRb1iKzobz96tHGVYI+8xS1+YD+D34=;
        b=LenaG8Esk+C/MFIV0bKF0ISfCq1k/Amrx1AGuZraU5rNkjbFXWGC3NR/+dDPnqXGSI
         G89negyF1vfdSXWfLJUwl8nn8m/yc7vM+aVklG6BlanTw+vvDR5eAJANmOhoWf2jbnJt
         yryEXhwigAxkn8Wz5p8XWoDpH+ypeXiivjLmv2yXb7aAifFQYACbChEzZdvE7RYWQ0KE
         CdK4me0F1bi4opagIhSqi9eHx01fFzfA93WSJkF6pbEGjrgGc9qWbFUoWawWNL4hQzeR
         k530BxRJAVeSP7jMZ5SMgqqa2nnvuwOCOpSF9ormlmYVGEy7i00V8dBR0Cysus2HaDID
         ph9Q==
X-Gm-Message-State: APuU4Z8WDCI5DYq7oplrxV0PcnIRs+hfKE5bv/D2WcgYF0674NyTxViM
	J9Auh2GwyGtihzLqVjdJndcGCg7Jr0+QHTtU4jVtdm0o8A3qXKOkLKgOkETRhEPQKDWZVqIaxZK
	Lfw5cqzuaFqU5/+YnxTFIQOnJBz452wN3wjJjwYi7dR1TbeHS889a+pKh
X-Gm-Gg: AYBFou2bgkK53emrrCOUP42ol/k3JfguMmuOfFjqhY1ujqVjd+a1iBifkpi8KsolNgr
	ykb+ztqaU4oJHq9FGZFwcCaJ2wNOTAqJgjrCiicl+r0koIalqhftogzFDHLV+yAXUW2D867dbR/
	w27OL0BYRWfNpFXWHUs41CeFa5Nw9hZEly3ALfGQiGoKtsA8B0SdmgQuu58uQyh61OtnDlxJuKg
	tfVr7C+EaFo+PVfnaK4RrAHMbZqJtPq51K+ypQM1Mnz2e5WnxXTsyHzWF0DqLSIn91L6Y5WLKSc
	HWQ7zk5ZDRp+OWP5CPfmfLxE2gJEPJ18LI6vP+0f0rrHKZeCq4ebcLkJZacRTD5TNRu633j84Kn
	hkqM54630HaWiYWJO5ibbXNq+5mz9TqUdoNCDFofJJOeavOMGUSbTIFkYYUzyNW459hNne3uAjQ
	==
X-Received: by 2002:a17:907:944a:b0:c31:c767:ae0b with SMTP id
 a640c23a62f3a-c50662a4727mr320939166b.0.1794441223612; Wed, 11 Nov 2026
 15:53:43 -0800 (PST)
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
 <auhctwoLtdWs9p-7@gractus.seuss> <CAFLszThoSafw5Zjt=3ucu8Ewr6tOjVwxm35kVUGfGTWLr8gtUw@mail.gmail.com>
 <avPa1zoPCi5EcAyI@gractus.seuss>
In-Reply-To: <avPa1zoPCi5EcAyI@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 11 Nov 2026 23:53:30 +0000
X-Gm-Features: AclHuK-d0rCE8EEwSCYsAUkOJDm38wQiOlw10l7M4Cea4vLGqJpBtfIs7dlB60M
Message-ID: <CAFLszTg7FcOd4S3toXSD-hvO1N8zDVPNJ5UL0g3_6ybEi_t5vQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] dtc: Add a list for the top-level fragments of a
 dts file
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 10 Nov 2026 at 21:16, David Gibson <david@gibson.dropbear.id.au> wr=
ote:
>
> On Wed, Nov 04, 2026 at 08:18:22AM -0700, Simon Glass wrote:
> > Hi David,
> >
> > On Mon, 2 Nov 2026 at 02:55, David Gibson <david@gibson.dropbear.id.au>=
 wrote:
> > >
> > > On Sun, Nov 01, 2026 at 09:36:56AM -0700, Simon Glass wrote:
> > > > A dts file is made up of top-level fragments: the root node, later
> > > > definitions of a node by label or path, and /delete-node/ or
> > > > /omit-if-no-ref/ with a reference. We would like to deal with each
> > > > fragment on its own before it is merged, for example to apply delet=
es
> > > > consistently or to run some checks on each one, but that requires
> > > > keeping the fragments apart. At present the parser merges each one =
into
> > > > the tree as soon as it is parsed.
> > >
> > > Btw, I'm extremely open to a better name than "fragment" if one occur=
s
> > > to you.  I believe I originally thought of these as "overlays" but
> > > that's confusing since runtime overlays were invented.
> >
> > I did look at this as I had the same thought, but ended up going with
> > fragment as I didn't come up with any great idesa in the two minutes I
> > thought about it. Here is my new attempt:
> >
> > section - doesn't really match Elf's use of the term, since it isn't
> > referring to a part of the output.
> > statement - matches the syntax in a sense (statements end in ';') but
> > it is too generic and I would find it confusing
> > block - so, so generic
>
> Agreed.
>
> > stanza - a bit out there, but at least it would not be confusing
>
> Eh, don't really like it.
>
> > layer - too confusing with overlay (since the things you overlay are
> > layers), even though it does fit the process that the fragments go
> > through (including the idea that order matters)
>
> This one has some appeal, but as you say it is likely to be a bit
> confusing overlay.  Plus, I think it has some danger of implying that
> all the "layers" exist at once and are independently editable (like
> Photoshop or Inkscape layers), rather than the upper/later layers
> irreversibly overwriting the lower/earlier layers.
>
> > If any of those seem appealing let me know :-)
> >
> > >
> > > > Add a struct fragment to hold one of these, functions to build one,=
 to
> > > > append it to a list and to free it, and a list of them in struct dt=
_info
> > > >
> > > > These are not used yet.
> > > >
> > > > Assisted-by: Claude:claude-opus-5-5
> > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > ---
> > > >
> > > >  dtc.h      | 47 ++++++++++++++++++++++++++++++++++++++++++
> > > >  livetree.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++=
++++
> > > >  2 files changed, 107 insertions(+)
> > > >
> > > > diff --git a/dtc.h b/dtc.h
> > > > index 473552e..c0d8e8f 100644
> > > > --- a/dtc.h
> > > > +++ b/dtc.h
> > > > @@ -322,12 +322,59 @@ struct reserve_info *chain_reserve_entry(stru=
ct reserve_info *first,
> > > >  struct reserve_info *add_reserve_entry(struct reserve_info *list,
> > > >                                      struct reserve_info *new);
> > > >
> > > > +/*
> > > > + * A fragment is one top-level part of a dts file, after the heade=
r and any
> > > > + * memory reservations: the root node, a later definition of a nod=
e which
> > > > + * refers to it by label or path, or a /delete-node/ or /omit-if-n=
o-ref/ with
> > > > + * a reference. Fragments are kept apart until they are merged int=
o a single
> > > > + * tree.
> > > > + *
> > > > + * This is not the same as an overlay fragment (a fragment@N node)=
, although
> > > > + * in a plugin a fragment may become one when it is merged.
> > > > + */
> > > > +
> > > > +enum fragment_type {
> > > > +     FRAGMENT_ROOT,          /* / { ... }; */
> > >
> > > Why do we need a special type for ROOT, rather than setting ref =3D=
=3D "/"?
> >
> > I'll change this,. I was just separating the case but the code doesn't
> > really gain much.
> >
> > Note that we need to handle &{/} in a plugin, so I think this we need
> > ref =3D=3D NULL rather than "/".
>
> Only if we actually need to distinguish between a &{/} overlay and the
> "base" tree - I can't immediately see any reason we would.

Can you explain that a bit more? In a plugin, / means the root of the
plugin itself, but &{/} creates a fragment targeted at the root node
of the base tree. So if we used ref =3D=3D "/" for both, the contents of /
{ ... } in a plugin would presumably end up as a fragment too, i.e.
wrapped in fragment@N with target-path =3D "/" and applied to the base
tree.

E.g. in Linux there is drivers/misc/lan966x_pci.dtso (actually, Herve
wrote it) which has:

/ {
        fragment@0 {
                target-path =3D "";

We presumably need that to be used as is, not wrapped in another
fragment. The empty target-path means the overlay is applied to the
PCI device=E2=80=99s node, and I don=E2=80=99t see how to write that with &=
{...}.

Anyway, there is something I'm missing here. Perhaps this sort of
thing should just not be allowed?

Regards,
Simon
