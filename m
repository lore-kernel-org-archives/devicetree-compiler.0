Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED00B1E0E14
	for <devicetree-compiler@vger.kernel.org>; Thu, 18 Jun 2026 02:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781751496; cv=none; b=uVzTtp+gJHq5zwVms0QBradQ6+8x2dyOWRdWuhEFz5E90QMDLipBVyPx5dumCR8gC1dm7z424gzA0/GHKO0X27SaDX/T+DMMDQOSEo6TGeYPz9RnLPbAmYz8/GEEJuxBmj4zYfyRHswcgXFIwRVZCKhRQn44N1dDHW+W6zxsXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781751496; c=relaxed/simple;
	bh=IecPquGkRyDOxkj+n1ohuX7w+/bABZFZQt8EcpaDVTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDejFbaLaHxXUuTABJ3d8e7sQq/grqi+b3jXPztv2dqcMbu6Uu4Z64GRMCQBRLz82AEyUNZjLHXKlewopu3SSp/Y8JcQfjYfUDf8IhD+IwnXoqPbM7r0Ngw7e+BWMz2zKD0gYiDtaMs+tGOSQaMZ3rnHM1Fyhx5hbNYLsf3bA5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdoBuWUR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdoBuWUR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884E51F00A3A
	for <devicetree-compiler@vger.kernel.org>; Thu, 18 Jun 2026 02:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781751495;
	bh=IecPquGkRyDOxkj+n1ohuX7w+/bABZFZQt8EcpaDVTw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NdoBuWURZd7akWn8hGGWbMh77GampXc+lTpN/nA7uWLMlZ1bFSpBrul/Nkp+Jo1Fd
	 yLjZzMU+Bffn7hAB+ei54iND8wRG+Mx0UOe84GOms7WImydZQUrvWAEW2QrIjDBH5h
	 cYbNW69+Pc88In2j2pKqz8hnREfZsTaBQbzXyX2d9u6SMPhROEoISheb3PLxaRP6C9
	 v9u/hxw1j2y6xRHXRAU4bD46ZKxdAACMSWXnwZQvFzzSMPzRhiMoPEP9B1YmIkPysr
	 26tHLpaont6o45TCluJ4oPCC0tthDPlGtL69tcdIdA69TsbykDT+WT6xbyEHqYgoSU
	 MHpjqE7rN/30g==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bed19623d6eso52837266b.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 17 Jun 2026 19:58:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YydYKXMGaY+B41q1f0iyWZd/qbVfnd3GylgmimVGTj5MzFsgCTg
	KnwpBdegPuYf7KQo5GpRluf8zNaFlRx0wo85+gqr7yRKHu5ZPVCNMf6pLDDh1UZQgajzkELlsYf
	h9zxr6v2GeYyDBljfUnIGqw8fKg1FoA==
X-Received: by 2002:a17:906:208f:b0:c06:2624:46ae with SMTP id
 a640c23a62f3a-c06262451d5mr191366266b.50.1781751494205; Wed, 17 Jun 2026
 19:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617204401.2275738-1-briannorris@chromium.org>
 <CAL_Jsq++ERWJ19BcVXHKTzq1PN7tpJm=rm6e08UCH_gcp6ncHg@mail.gmail.com> <ajMvU-U-cdnlXykM@google.com>
In-Reply-To: <ajMvU-U-cdnlXykM@google.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 17 Jun 2026 21:58:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKqPhwrTjzXiVwnskqCm_SrxM=FVwChfwT-W1rjL+N7jw@mail.gmail.com>
X-Gm-Features: AVVi8CelKF6ZnL-Na-owJSPPx3XuowwR5w9lczMbVVp5Y8JLNuOJgcRCa-6lyKY
Message-ID: <CAL_JsqKqPhwrTjzXiVwnskqCm_SrxM=FVwChfwT-W1rjL+N7jw@mail.gmail.com>
Subject: Re: [PATCH] checks: Avoid warnings for reg override in __overlay__
To: Brian Norris <briannorris@chromium.org>
Cc: devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 6:35=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Hi Rob,
>
> On Wed, Jun 17, 2026 at 05:54:42PM -0500, Rob Herring wrote:
> > I would argue (and did the last time this came up IIRC) the overlay
>
> I gave a quick look for prior art, but didn't go far enough. I see this
> was a similar conversation:
>
> [PATCH v2] checks: Suppress warnings on overlay fragments
> https://lore.kernel.org/all/20230308091539.11178-1-qun-wei.lin@mediatek.c=
om/
>
> I don't think it had a satisfying conclusion though.
>
> > should target the parent node instead and then you can put in
> > #address-cells and #size-cells in the overlay to make it pass checks
> > (and make 'reg' parsable without applying the overlay).
>
> This implies we can't actually target the appropriate node via phandle
> any more, and so we lose the ergonomics that phandles provide. Where
> previouly an overlay could be resilient to node renaming and other sorts
> of incompatibilities between a dtb and a dtbo (the overlay wouldn't
> apply if &foo isn't found), now we'd have to open-code the node name and
> maybe even its parent node name in the overlay. If either of those were
> wrong ... we wouldn't notice at all, unless there's an obvious
> functional breakage as a result.

Why can't we use the parent node phandle?

> I acknowledge that it's difficult to parse and validate dtbos when they
> are low on context. But I don't see why we should emit false warnings
> for the possibly-correct, and more ergnomic approach.

It just feels to me like we're disabling checks one by one on
overlays. And it's not just dtc checks we have to skip, but schema
checks too. We somewhat mitigate that by requiring (requesting really,
because it gets skipped) overlays to be applied to *something* at
build time, but that's the kernel tree which isn't everything.

I don't care too much other than we validate everything in overlays somehow=
.

Rob
