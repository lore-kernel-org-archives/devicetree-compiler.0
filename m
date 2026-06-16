Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7369B169AD2
	for <devicetree-compiler@vger.kernel.org>; Tue, 16 Jun 2026 18:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635187; cv=none; b=qsPxN//tF/TYMNvZnU7oCKyRGr8QsO11ih8QLUaSaRD8tKLpi3K+y1d/p/lQIEP2kIMgwabM/xf73nyCcNJbnHIl0neLkmOwc/RIJHhOtk1XF3X50CKozsjAHxs1O9Ihx8FpRfCTyfFvsr3qcEojaLHV6BB0bTeL4a3J/9HSe6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635187; c=relaxed/simple;
	bh=SwaZB9CULT2otfmiQsnJzypyQrkNTN45+55z6Y9SGu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuHgJPQtfRBBBUzzVHbuVg4qWm0Hzp43hl72naAxZNYho2+e4tif0FiCvvW+fMHr9gNbV33Co7ehXXRI/cnolkk3MehrMt0RVyRvvAl1F4HN3Yjz/zZbA9e04nF2wK/MrOyrG6YFEeKHjFBznktrAnXhPoKnJ+yU0PtyTTtdPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=oSRD6qfm; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="oSRD6qfm"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6fa36a1b6so4226230a34.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 16 Jun 2026 11:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781635185; x=1782239985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oxxs0FKv9WSEpem6oGpkJUnaeZDNygTkOZT7vy1CPAM=;
        b=oSRD6qfmL+iLcH/TYskye1Zaar9z8s+y/Qhh+3NNvKAI1+e9l9GDwqB8dyFl/Le1/f
         TbT3O6AAE94LbzEkvu7JY9U4dTxBPYJsQ7wMDVU2lIZuOEnckACqLFEauL03KayFyOpI
         Ghtww35NzGQUSjWbtVjgedJ87KzqlzEa96PR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781635185; x=1782239985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxxs0FKv9WSEpem6oGpkJUnaeZDNygTkOZT7vy1CPAM=;
        b=TlrqjLhvMzXf5WZkjdNXRTmHl44l9TlV+aUQTsVepQwiusQeyu4gU0fKyCvijR8ENP
         2x3UCEZ5rQoRt6Z2KqEjM4QudkQbzAiiDBJwUm8XKYU8cVNKUXOCmLKzIkZmxjZ4F8n4
         66i+BcxmfFoWbFD3fR5nn7LSUADB8WTkCl7oyZI2Ul4JqNkk3bee8ySc+LaDZo+IQAiQ
         HjUtx+4T7oosUrTvLcld6XQuQRyAHdqWY2q7Dmqj4VwYuYEV00lhtjD9wRPsbmm6zQIu
         JAKYfuVlc2r+A1xJ5MMEiMVc7U/va/oxp0bgJOFjh86u0Q9gCK+cx/kQZQECL/cvRV6S
         zfDg==
X-Gm-Message-State: AOJu0YxZQhfl6CjnMAUvmgeLYVi1owK7hLuJimym3aL/RP80lhCrtH31
	p2yTdcW1zKLC0iHgqX9DyS1m/a25rQCkDX8wXCIFPCuT8tVC46ouZJMmR5Apq99k7Lxf2maS4Id
	yRvWlIEU=
X-Gm-Gg: Acq92OHhpVU86nsI/N/32dtxrk2DO7JjGuRlVYRfPXRyiqdSlTXP7aktRvJd5qNgDyj
	1YkYSw/py0E+vSPddKvldMOcg5kt5XOei8oU82+Fq9IAFuehrVsPqvufNFOzjNks1iJyRVH6yKG
	dnPBEXcPNBQ7wo7zLJswSC4Tmq8GkYnGA35QD3JXi/seJifs8mjuGg+XI5FPiSvYF+vVKj8ay0f
	shJ8CCkfz1+LIdXtJp1zIv4tYMmR5U5SCS+iHQg1CIw3Uy1yIx6Ow4BnT5J2kE2ySfDcX3G6u9M
	DgYoZLZVwLbYD04P7dyGAzwraZZXqBkWJ1N3Azjm4HGTyyEZjT8/sLZlJnWp+RO0m5xQcwJxHKI
	fSXMr0oOGeqgGA1GAJzUhhWgneYu9zC7si4rj4UModyfW5uYlNvn25NlmVt7cHVk4zOWi1KgxD0
	/TBQ5cw3hNtxSrnVRSpl93FwYKvQWvedGZXG3UFUbsH/EpxOnNQQe1vvk+2yJL5RAW/eDqFhZJU
	rdJwHqxyeUAZ9r/d1Lg4yOWOgKxHOEGP+u1vihyjv7bQdYdfuE=
X-Received: by 2002:a05:6830:61c1:b0:7d7:e142:2ead with SMTP id 46e09a7af769-7e90b543f50mr681008a34.20.1781635185283;
        Tue, 16 Jun 2026 11:39:45 -0700 (PDT)
Received: from bill-the-cat (fixed-187-190-197-245.totalplay.net. [187.190.197.245])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f6b8d15sm7771963a34.14.2026.06.16.11.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:39:44 -0700 (PDT)
Date: Tue, 16 Jun 2026 12:39:42 -0600
From: Tom Rini <trini@konsulko.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: fdt_check_full: Add can_assume(PERFECT) check
Message-ID: <20260616183942.GN382693@bill-the-cat>
References: <20260526203022.4006434-1-trini@konsulko.com>
 <ahZxuCONf2JfMXU8@zatzit>
 <20260527043859.GC1858239@bill-the-cat>
 <20260605222054.GC382693@bill-the-cat>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605222054.GC382693@bill-the-cat>
X-Clacks-Overhead: GNU Terry Pratchett

On Fri, Jun 05, 2026 at 04:20:54PM -0600, Tom Rini wrote:
> On Tue, May 26, 2026 at 10:38:59PM -0600, Tom Rini wrote:
> > On Wed, May 27, 2026 at 02:23:20PM +1000, David Gibson wrote:
> > > On Tue, May 26, 2026 at 02:30:22PM -0600, Tom Rini wrote:
> > > > In this function from fdt_check.c we have (reasonably and as the name
> > > > implies) a number of checks on the DTB. However, there are cases where
> > > > we may wish to assume that we have been given a perfect DTB already and
> > > > do nothing here. Add a test for can_assume(PERFECT) as the first check
> > > > in this function and if true, perform no checks.
> > > > 
> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > ---
> > > > Along the lines of the patches I posted back in December, in U-Boot SPL
> > > > we just don't have the space for this check much of the time and so have
> > > > always omitted it (going back to at least when Simon posted the initial
> > > > patch to make libfdt/fdt_check.c here). This is another case where it's
> > > > a noticeable size win for us. I had missed this change in particular
> > > > because we had in turn missed catching up on fdt_check_full being moved
> > > > out of fdt_ro.c and in to fdt_check.c.
> > > 
> > > I'm not necessarily against this, but I have some misgivings.
> > > 
> > > fdt_check_full() is (deliberately) not called from anywhere else in
> > > libfdt - it's intended to allow the user to explicitly do a full
> > > validity check on the tree.  Given that meaning, I'm not sure it's
> > > wise to turn it into a no-op based on the assume flags.
> > > 
> > > Your comment seems to imply that the issue here is size - simply
> > > having this function compiled - rather than being too expensive when
> > > (explicitly) called.  That's a little surprising to me - it's in its
> > > own compilation unit, specifically so that the linker can omit it if
> > > it's not used.  Is there something unusual about your build
> > > environment that's not letting that happen?
> > 
> > So, we have code like this:
> >         /* Get the total space reserved for FDT in blob */
> >         live_fdt = bloblist_get_blob(BLOBLISTT_CONTROL_FDT, &blob_size);
> >         if (live_fdt != gd->fdt_blob)
> >                 return -ENOENT;
> > 
> >         ret = fdt_check_full(live_fdt, blob_size);
> >         if (ret)
> >                 return fdtdec_ret_to_errno(ret);
> > 
> > And this is compiled on TPL, SPL and full U-Boot builds. On the first
> > two, we're just too space constrained to do this check. So it's not the
> > linker doing the right thing or not, it's avoiding having to #if the
> > code directly (or rather, CONFIG_VAL(...)). My line of thinking was that
> > since ASSUME_PERFECT is that everything is really perfect, this is the
> > way to go. Yes, it's a little odd to have both "call the validation
> > function" and "the validation function does not validate" but that's
> > just because in the second case, we explicitly configured ourself to not
> > validate anything.
> > 
> > And FWIW, that's really how we use the assume mask in U-Boot, either
> > 0xff or 0x0. It's a case where we're either passing along the tree we
> > bundled with ourself (and so we can assume it's fine) or it's passed
> > along (and we verify).
> 
> Hey, just checking if there's any further discussion here? I want to try
> and get the delta between U-Boot and upstream down to zero if we can.
> Thanks!

Checking in again for more feedback here as I'm going to take this for
U-Boot shortly otherwise, and then I guess revisit when there's a later
conflict most likely.

-- 
Tom
