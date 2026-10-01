Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3F1318EC5
	for <devicetree-compiler@vger.kernel.org>; Thu,  1 Oct 2026 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871200; cv=none; b=RoqlizdTnTP6Aa6DTmjKbXJrnCKybP+QfdJRyFRaeRA3+pGX5b89KE2qLu04KonaShoWiQBxKobknbIzBGovHypbq80l7HsKGe3wj8eNoulmYTAQ4olzIF43DZzvnfsQiAKnxZevgVoFGbjaLfD1M1r4V5al124opYUZGo9USjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871200; c=relaxed/simple;
	bh=aw30aDAqPGYRqGAoKt7d8W5SovJ1WcD2gThkCVHWXeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9kt5WrqRutwJ6q3CEzq38a4DAwO5fjAiu0Tq3PaNVqhe35JKdUiMNL1MixPkyT0eKmoqmpgBkoULc63a2749074kmzLzmAiv+nsX4VbkaltelRKjIf6TlBYCapQ+D2MgA5WB3YF94prFjvXYyS/e5R9I+R4ZlW9qhDMeFWFJEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffbseNOo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffbseNOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26521F000FF
	for <devicetree-compiler@vger.kernel.org>; Thu,  1 Oct 2026 16:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871198;
	bh=aw30aDAqPGYRqGAoKt7d8W5SovJ1WcD2gThkCVHWXeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ffbseNOovJ6No4Gi3Xo0VSfMAZXy+5Ygumw129h5k6IOPw58b+Rh997rrv+NZWHaN
	 jJ4H+YjvDeqf1E9jCBjHrn00/X7NewlvoKNHLBVUWyFu+IaR8l3rPKrNYIVq7uQYe7
	 Hvdqf159IWmOVcJ9A8Pk2xKJbojs6YUSTki053v+h3xKvif5zuTtPzmuZY7hhTBD05
	 Q6p+jFyDZ+KWzHgTghr3AiNrXPRKdY96c7LZ7wtgglRMUoaBtbFbnDMVvyaDZmr/yD
	 3Ja9ed3LcWu2EbMqs27Uy6auoiHJhv66d9bHyJWvo8sJF/iNZETahCjvKAtUvHFpgn
	 pT+9oImUjGHJg==
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e1195040aso389172666b.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 01 Oct 2026 09:13:18 -0700 (PDT)
X-Gm-Message-State: AFuF++lEGFfY6xBx0TGZH7p/S5GwbbgXjHTWERdgmBTTddMbOhmvbNoF
	E7URD6DPvr4lwhS/wq3sOmPz3sGMBVyXqpK7u4AHM3eg/Tlf0ll/LZRvuGvi/yzVmhSkvYpIlJf
	zErO3bqRQX0u2JuoA+KHKsOSauISI0Q==
X-Received: by 2002:a17:906:6a2a:b0:c1c:3b06:ed03 with SMTP id
 a640c23a62f3a-c2e4adda453mr5862466b.23.1790871197416; Thu, 01 Oct 2026
 09:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-check-reserved-overlap-v1-1-eef819889dae@oss.qualcomm.com>
In-Reply-To: <20260923-check-reserved-overlap-v1-1-eef819889dae@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 1 Oct 2026 11:13:05 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+niOW2c2ueTmTOwJ6EinFRHbJfKKDAjwxMwMP6drjP9g@mail.gmail.com>
X-Gm-Features: AclHuK8JDefrAsAucdFjKynk_mkVts5968onQbHONYTyNWKpw7uwdZv7Y4SBjns
Message-ID: <CAL_Jsq+niOW2c2ueTmTOwJ6EinFRHbJfKKDAjwxMwMP6drjP9g@mail.gmail.com>
Subject: Re: [PATCH] checks: Warn about overlapping reserved-memory ranges
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:51=E2=80=AFPM Bjorn Andersson
<bjorn.andersson@oss.qualcomm.com> wrote:
>
> Static /reserved-memory entries associate physical address ranges with
> particular purposes and properties. While not explicitly prohibited,
> overlapping ranges commonly indicate an incorrect address or size and
> may assign the same memory conflicting attributes. Dtc currently
> provides no diagnostic for this type of mistake.
>
> Check every non-empty reg range under available reserved-memory children
> and report overlaps. Add tests covering overlapping and adjacent ranges,
> as well as unavailable, zero-sized, and dynamically allocated regions.

This issue is not just reserved memory, but any address really. 2 h/w
nodes pointing to the same range points to a binding design problem.
That gets a bit more complex to find since it might not be at the same
level within the same subtree. A check for that has been on my todo
for a long time. I did have AI write something for me a while back
that seemed to work. It also functioned as a DT to memory map tool
given you check the entire address space. I'll try to find it...

Rob
