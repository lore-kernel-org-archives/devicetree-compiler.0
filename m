Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1980ADF5C
	for <devicetree-compiler@vger.kernel.org>; Mon, 14 Apr 2025 03:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744601277; cv=none; b=CZwxb+PAL4fZIemEAmE7d7RrQjluegjl6988XGU/UGIs3cUhpc2cQy/PJMRTd8wqOWihQVOrSsMjekZcO7F3RyNBrbrc/LuA/5doIKMzKAFsaXZ1MOhP28I7Hr7zCLyjofVnHKb0LZncok+qD8q8wAus72iGcn3HzQT/FFsniFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744601277; c=relaxed/simple;
	bh=2aYGVSSoH0ogexeOQ5LLmJZyfjKIwM1fgrWk9WXSoXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oenehJxay+gDQQjgD17NcXcjdSOP+jwQAtbyxofmc1khH8++si6ZkE5zJ7VlOdnhd8Yzg7OUXsdUC4gCcwX8ZySdldrw8jAi1nse1HEC1Y3Cq1bJCVn0+gJG+7sOfuE9J28bdv0DVCAt/Ds1mhmAnTQczcis3xdj2ENj4HZEipU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=blWhblTI; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="blWhblTI"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EE06B259E3;
	Mon, 14 Apr 2025 05:27:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3RhTSvuTaxB; Mon, 14 Apr 2025 05:27:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744601270; bh=2aYGVSSoH0ogexeOQ5LLmJZyfjKIwM1fgrWk9WXSoXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=blWhblTIfauFhIyhwSzHRu4VTKlC7m3vWC+EWcTxl9vnYX54xu7DeDl0pD0GYmtP4
	 77MurhSNA0zZYr1lqw4ofSEevOyvFOFnxhHkIDqSlvO5QSRF5UhALCnSOAk9fSyJHh
	 DJwMm0goVBGmeFDOlmx7MtInpFictKGjuYx+pKqElCCW7S3TEX4dzqPQEsOETKHois
	 knXPl7mA7yJkAG7KaE6qFW7uezLElAr8I3Mp20S/JiV3YHpAJ6pu+x+fjZ04rpfaCw
	 s8qz8NWTPB5FN+PT9LmYhXXreTF7y/RMBSdUfndkWHIKsjv6K6De98GihOowsEF8CJ
	 Nkbz4U8LyqC0Q==
Date: Mon, 14 Apr 2025 03:27:35 +0000
From: Yao Zi <ziyao@disroot.org>
To: Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [RESEND PATCH] flattree: Optimize stringtable_insert()
Message-ID: <Z_s0VifEhOvtMz_8@pie>
References: <20250412100351.9009-2-ziyao@disroot.org>
 <CAFLszThbo8BEVbPDLsNqUN4aacxgeH4crbMhi8MoZvVtHztb6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLszThbo8BEVbPDLsNqUN4aacxgeH4crbMhi8MoZvVtHztb6Q@mail.gmail.com>

On Sat, Apr 12, 2025 at 06:45:07AM -0600, Simon Glass wrote:
> Hi Yao,
> 
> On Sat, 12 Apr 2025 at 04:05, Yao Zi <ziyao@disroot.org> wrote:

...

> > diff --git a/flattree.c b/flattree.c
> > index 30e6de2..afca1f2 100644
> > --- a/flattree.c
> > +++ b/flattree.c
> > @@ -218,23 +218,134 @@ static struct emitter asm_emitter = {
> >         .property = asm_emit_property,
> >  };
> >
> > -static int stringtable_insert(struct data *d, const char *str)
> > +struct stringtable {
> > +       unsigned int len, cap;
> > +       struct data data;
> > +       int *slots;
> > +};
> 
> Could you comment these items, including that a slot of -1 means it is free?

Sure, I'll do it in v2.

> > +
> > +/*
> > + * Must be 2^n to ensure stringtable.cap - 1 correctly masks hash into the
> > + * index of slots
> > + */
> > +#define stringtable_initcap            256
> 
> When building the kernel, does stringtable_grow() get called
> regularly? If so, and if it affects execution table, perhaps this
> value could be larger?

Among the 1161 devicetrees in Linux 6.11 (counted by
find arch/arm64/boot/dts/ -name '*.dtb' | wc -l), 821 of them trigger
stringtable_grow() for at least one time. But increasing the initial
capability doesn't help much for the overall performance since it's not
a hot function actually. Thus I'd like to keep the macro as is.

> > +
> > +static unsigned int stringtable_hash(const char *str, size_t len)
> > +{
> > +       unsigned int hash = (unsigned int)len;
> > +
> > +       for (; len > 0; len--)
> > +               hash ^= (hash << 5) + (hash >> 2) + str[len - 1];
> > +
> > +       return hash;
> > +}

...

> > +static void stringtable_grow(struct stringtable *strtab)
> > +{
> > +       unsigned int newcap = strtab->cap * 2;
> > +       int *newslots = xmalloc(newcap * sizeof(int));
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < newcap; i++)
> > +               newslots[i] = -1;
> > +
> > +       for (i = 0; i < strtab->cap; i++) {
> > +               int off = strtab->slots[i];
> > +               const char *str = strtab->data.val + off;
> > +               unsigned int hash = stringtable_hash(str, strlen(str));
> > +               int newslot = stringtable_findslot(newslots, newcap, hash);
> > +
> > +               newslots[newslot] = off;
> > +       }
> > +
> > +       strtab->cap     = newcap;
> > +       strtab->slots   = newslots;
> 
> Does strtab->slots get freed here?

Thanks for catching this! It's lost here, causing some leaking, I'll fix
it in v2.

> > +}
> > +
> > +static int stringtable_insert(struct stringtable *strtab, const char *str)
> > +{
> > +       unsigned int hash, i, mask;
> > +       int *slots, *slot;
> > +       const char *dup;
> > +       size_t len;
> > +
> > +       if (strtab->cap < strtab->len * 2)
> > +               stringtable_grow(strtab);
> > +
> > +       len     = strlen(str);
> > +       mask    = strtab->cap - 1;
> > +       hash    = stringtable_hash(str, len);
> > +       slots   = strtab->slots;
> > +
> > +       for (i = hash & mask; *(slot = &slots[i]) != -1; i = (i + 1) & mask) {
> > +               const char *oldstr = strtab->data.val + *slot;
> > +
> > +               if (streq(str, oldstr))
> > +                       return *slot;
> > +       }
> > +
> > +       /* Try to match a subsequence */
> > +       dup = memmem(strtab->data.val, strtab->data.len, str, len + 1);
> 
> Is there a case early on where strtab->data.len < len + 1 ?

Yes, but I don't think it's worth a special branch, as it's very rare.
AFAIK the memmem implementation of musl libc is even able to handle such
cases,

        /* Return immediately when needle is longer than haystack */
        if (k<l) return 0;


> > +       if (dup) {
> > +               *slot = dup - strtab->data.val;
> > +       } else {
> > +               *slot = strtab->data.len;
> > +               strtab->data = data_append_data(strtab->data, str, len + 1);
> > +       }
> 
> What case is this subsequence-code handling?

String block contains C-style strings (terminated by zero). If A is
a suffix of B, we could reuse the data of B by pointing to the middle of
B when emitting A. For example, we could reuse "enable-method" when
emitting "method", which is common in a DTS of ARM SoC.

> If you add "frederick"
> and then "fred", won't this end up using "frederick" for both, in the
> flattened tree? I suppose not since the tests pass, but I think a
> better comment would help.

This won't happen since we take the terminating '\0' into account when
searching for a subsequence, the two strings are actually "frederick\0"
and "fred\0", where the latter is obviously not a subsequence of the
former one.

At first I didn't add such sebsequence deduplication and then noted
small increasing of size of compiled devicetree blobs. Then I realized
the original code may reuse sebsequences as well -- sure I'll add a
comment to explain to avoid confusion in the future.

> > +
> > +       strtab->len++;
> > +
> > +       return *slot;
> > +}
> > +

...

> Regards,
> Simon

Regards,
Yao Zi
