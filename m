Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793550975;
	b=eGKgZrr3O+nofwvc/2iMR1yFLJCRNhOePO6elHaFxNkr1aIbUBlrOjccQo9SQGNdXJQu
	 3SKTQ+XIS/V5ogkZNyYftVBDUkvqxVyiabRqbRxy1pp7YyVht+UPBWGXRne00nXHfCi86
	 x4vpW3MsO4h+zK6SZjwbTZjL+miS5NUmhPeeFPScvEnptCBDGfCeHRvyQdFXvBlE8Vww3
	 gvCDPvW4QGY0s+zKRlzJ5tE4KiDUue7IvwqxEaSc90yhHZd7wBuJtUBmTZqM9TXluQHBy
	 OHLN+O1Q1pw7hTuqz0fH0VDb4uKmWh0HXUb+AjZsKPeB8TEFmRbn+hqrRzQcKwkkmjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793550975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=LDtmS7BC0Q8Dj/iPHQeGlUxl+xsjo2VhJxK6LS04QA8=;
	b=H3ZDS6V8giAb4X6BffTCrbd8O2VTF6IMpDSjec2iiF+CWdJdE+HPcSXIj7Cb+w5y6+Tl
	 vD3QYWz+fIHUXdK8k0px6IWp4BcYzvcEaY4s+4X2PLXSl0Q6jMJm+n1Z94GdH7cpuv8M+
	 k9P9X75nRHFKWjEYnvCfFOWtU9PZYlKGI8AfdYzaY0V0cn1YUvy1cdIIifQ8YvC9y+0/v
	 yCu6OeA48wUEuKR/OE58RX3OM/BlKnmP7HGeuz7yFEuPxv+7asknsdBDZE0PBLYu5yJG6
	 QSb53tu4v4J9FrovKcB/tAlgPzNWPP5+qhSiGH8EU34jRHObqdn0832OUDlxJjwgKCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OvtpD8OX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B22606A325
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B22606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OvtpD8OX
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso2301615a12.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:36:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793550973; cv=none;
        d=google.com; s=arc-20260327;
        b=YHScxbAIIMee/vQxONm70QuNT3e90HI2/iBC/T+GQgPttOQunWjebJ/yivuzyFdRSn
         uaoRtiK/h7Wn+xJZ0vF5FHw2TuRYfRL9wk68HgZN0zytxz1vVenDw75C6/j8MvSse8px
         8HXAx6HeIK7OEd8l9gXyi9YGLhMJWRERCQ3EvDdfDIni/gcooABpxIFrXxBo7gd27iBo
         BqhA1y6ugyHNsWfjH8hSDlop7vgRI6fsdTY2K7JVK0lSE08Sa+IA9z2E44dVtZZmmJ+8
         rgelI+avo/u72jY/yA61ct6YZ0NmDAM5Ca8wVQr5JiNOhm1RUseAZ4Ln2+ZCkGbvVwQk
         Fryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LDtmS7BC0Q8Dj/iPHQeGlUxl+xsjo2VhJxK6LS04QA8=;
        fh=srd9RlF+16/dPyjlTyWSZRXUPbkLZ5CDxVawIXOQn9Q=;
        b=oAWweQlLvMavJj4e/xDdXoOJELJv3a/q8BG2Ftopuv3BuqFEiTqBzs8hvFBEo464CT
         8GHgO4f/dgRJaDqmIeKvgERDel4jvg/gOwcEu0y2A7jTGvNtd01bNCHATB1q7LlzZNZW
         BeGM2waI+lfDPzHHeSA03TydtXdLFs2cQNi/jQpJE13wWlReMk5/EoZph/vs7/fQSDWb
         KYpQIjA9HTuzvrL9YwoK46DhzYl+I5go2BgOmiUdav3gME+CwVVCP3yjZ5OZQi5PQZOp
         dYJ8YuUxUePx9WN/tBZj7twV0h1CWXJnn0M4c9N3DM6MJKGbPWzH9dRzRSvHitcC0aC+
         KEXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793550973; x=1794155773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LDtmS7BC0Q8Dj/iPHQeGlUxl+xsjo2VhJxK6LS04QA8=;
        b=OvtpD8OXmWayV4/v51nmX15NfIfhJA/fwo0j1v+l+XGNjsVDJi3Zkdgp6KO5Jsf7TZ
         Vi+rcDaAJgdPsbPuu4olI3v0qXbOPEzSW6/aKd4Qbdb6ZRFyQ4AWWqkF99RGp4Utb5yd
         X6gpVm7ucAYPYcpi8sZJWy+Q6o97MGQgNs7J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793550973; x=1794155773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDtmS7BC0Q8Dj/iPHQeGlUxl+xsjo2VhJxK6LS04QA8=;
        b=DYqv7/NdH0+IndtmZWxVNrXqL/mziiBwjQUlZ52xSZD1jL9B+loCW9HSwINuzqmaYs
         Ivfum1TP4LK20QRCdauiAu8Ebd6d3bJysgneqfapeTj8LTdwAm92YnIM9y150QlJupD6
         q4PAF7LkIICZLwVkJNmUJXgN8mmUy+mfZWIieEvmc6zjUX41JkUZJYWQsbomkcIMH9VO
         1E+mBrkq8DOZ+G3RUsAC998uydW/TPULTZxJ3RAQaXcuJ+My2ljFj1rD8ASvAC/MLYj0
         Hp0LLgk3BM6+lA6LU13v9da2LMQ2p8h1ioB3J/InxHAyKA9HwC4zsvj3CTdVqaJ25FHs
         TOzQ==
X-Gm-Message-State: APuU4Z9RrQ3xyul0cnKQttTlRrGho/glqgHAgHqyPC4OImdJLCpYxIyM
	obgGwIxcVKIp+T87PyV9tXiuwM/huMCaYke3IFFLK53Bb5nbyBJsXzXDoa8DrgT61QO3T9pGcEu
	PV8HD/RhWhr8gZ3IT8yfHtvy0YVXJN9iL+eokdPwq/TPMS8MycyfXZ6wJ6l4=
X-Gm-Gg: AYBFou3926EW6m5OBLrDyxrKQBREslydcGLfC4vIPMEVMVY4K5O8KMUVnKrtSB6Oovu
	E8WtoxWb4UvSpTH2wNrMbbgbzUahRTbZ07798mjBZCHF9e9f+v895vww9msYn9SHPyaGSxUz0xg
	y7OpbMhdralNOdma0dw6UCVMVHYhfQl4Z3h73EhXxa28NjG9cWrs37KlGES6o1IcLzxO6kCfZYa
	W+tkdNUiDCpID8cruVxJV/40OqQ0O8qtNeUy36E/594yi3L/yGutEjYmH52fVxOCqL6jHhR9ZU5
	i4ka0/t8DiJWZ70JMhHIdnhZt+UzxHDkh8wIZlxB+SB9YM8iCqtOQxCyI+KKWpDoeQOxPS/9BHX
	Ts5UBbwM5BBX+kMaOr2/ngcL3OfMj4OhbxnjkDInanTFaOn6XKUOeY5kad52QzeaOaAY8dUjyGw
	==
X-Received: by 2002:a05:6402:280d:b0:6b1:c5c3:9624 with SMTP id
 4fb4d7f45d1cf-6b4d4d739fbmr5365620a12.22.1793550973061; Sun, 01 Nov 2026
 08:36:13 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028093620.3705074-1-sjg@chromium.org> <auK0ERvxGCJGSc3p@gractus.seuss>
In-Reply-To: <auK0ERvxGCJGSc3p@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 1 Nov 2026 16:35:50 +0000
X-Gm-Features: AclHuK8MTHrT8jDFsNJ_W2EVHHU_KFJx-VfyvZIov3tkUgVzg3zsbgt6xNAT8Os
Message-ID: <CAFLszTjtkEjBMhbKomVr6WhrZH7hN3AcAMBwN2mvdmf+T-DQdw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] dtc: Fix deletes within a section and before a redefinition
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, 28 Oct 2026 at 20:52, David Gibson <david@gibson.dropbear.id.au> wr=
ote:
>
> On Wed, Oct 28, 2026 at 03:36:07AM -0600, Simon Glass wrote:
> > A /delete-property/ or /delete-node/ in the first section of a dts, or
> > in a node which a later section adds, is ignored and leaves its
> > placeholder in the tree, where it can show up as a bogus duplicate. A
> > node which is deleted and then defined again also returns to its old
> > place, with its old subnodes in their old order.
> >
> > The first patch applies each delete within its own section and keeps
> > the placeholders out of the tree. The second removes deleted entries
> > from the tree, so that a node defined again comes after the existing
> > ones. The third clarifies some comments. The fourth lets dtc-fatal.sh
> > check the error message, which the fifth uses to test an error for a
> > delete in an overlay fragment which has nothing to delete there, since
> > an overlay cannot delete from the base tree. The sixth documents how
> > deletes behave.
> >
> > Note that the second and fifth patches change existing behaviour. The
> > second changes the output of existing dts files which delete and then
> > redefine a node or property. The fifth breaks the build of two overlays
> > in Linux, whose deletes have never taken effect. Each patch explains
> > why this seems the better behaviour.
>
> Sorry, I didn't catch this in v1: I think this does improve behaviour,
> but I don't think it's the right approach.
>
> At the moment we handle the fragment merges right within the parser,
> meaning we have a single unified tree as soon as we return from
> yyparse().  That's already a bit confusing, and means behaviour isn't
> quite the same between the first fragment listed and subsequent ones.
>
> This series improves that consistency, but it does so with kind of
> ad-hoc alterations which are pretty hard to keep track of.  It also
> moves towards the model where later things can overwrite earlier
> things, even within the same fragment, not just between fragments.
> Although it is a way of making the semantics more consistent, I think
> going that way makes it easier to have uncaught typos in the dt
> source.
>
> Here's the approach I think we should take instead.  I've had this in
> mind for a while, but never got around to it.  Seeing this series kind
> of crystalized the rationale for me.  It is more work, but I think it
> will be worth it:
>
> 1. Have the parser treat each fragment / overlay separately, returning
>    a forest of those pieces, rather than a single tree
>
>   1a. We'll also want dt_from_blob() to parse dtbo /fragment@ pieces
>       and convert those to a similar forest.  That can be implemented
>       later on, though.
>
> 2a. For base trees, call a function from ain() which merges the forest
>     into a single tree, with similar logic to what we have now.
>
> 2b. For /plugin/ trees, call a function from main() which wraps each
>     parsed fragment in /frament@NN/__overlay__ and combines those
>     into a single tree
>
> 3. Start splitting the checks into two sets.  One set runs *before*
>    the merge on each individual fragment.  The other runs on the
>    merged tree.
>
> Under this scheme /delete/ placeholders will only exist in the
> forest-of-fragments stage.  They'll either be resolved by actually
> deleting the node/property in (2a), or trip an error in (2b).
>
> This can be more gradual, but by moving things like the
> duplicate_node_names checks to the pre-merge phase we can catch more
> errors within fragments, without breaking either compile time or
> runtime overlay semantics.

Thanks for the info, agreed. I've dug into the code a bit and am
sending a series for the first step: the parser returns a list of
fragments, which main() then merges.

Re your plan, should deleting something defined earlier in the same
fragment be an error?

In an overlay, a top-level /delete-node/ &label can remove a node from
another fragment of the same overlay, as Herv=C3=A9 pointed out. I assume
that should keep working, with only deletes of something in the base
tree being an error. Is that right?

Regards,
Simon
