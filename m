Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1567282F1A
	for <devicetree-compiler@vger.kernel.org>; Fri,  5 Jun 2026 22:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698059; cv=none; b=Gkdrt3nD45z/rS/yX3uxw7O3e+V6qtnUkeFyVCwp+XnkVEOY/rzt4r8MGPbTQ4sl0LpIkbRCwKnuAlBiyl7ym2lQi4+BJBkH7d0x0WDCk13AK3q5GIozvSC8te7J+eFF+Yi0Na63IR7eR0ehmuq9GYDJmaNpk7CuhYSHKSPa97c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698059; c=relaxed/simple;
	bh=3zhOh/9kS+n8jjQLIZCD74Jrd2qyVLk4uwNSSzRtkKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rT8dpaea84sn5EX66NshBxmnEa4CCjj6NFH+iLxxFPNwUJHGuhdkNgZOuHQvBS9J7k/dhJCFKE8EKBZdv8lNllbdLJdViZd55yH4KQ9N9fSkf7l5gxLBW2hqKFrhGwnc0fed46FIfClil9brxF+SjuFOM/g4XCNBAzWmuqqI8MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=F1Q1xMSx; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="F1Q1xMSx"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6dcad6018so1967683a34.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 05 Jun 2026 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780698057; x=1781302857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMwTuYqwg0cODsuZ0HT80k5REiRmn0/TeSa5KjKXTKA=;
        b=F1Q1xMSxy0GzIjvOI9V5PlgJD9UIKWhi0EMYZVpWn7qAebRGs15UTxadSsneiCpe+U
         5Li1jODQg89wYNzKPJm3cPAQ1tNkSQBtCxo70hmH85sfkSWFfX/j82xkXRUh1nVl1QVO
         JBd6ZWWN8APSlnOHVoiS0lf9uPealHtEaIuzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698057; x=1781302857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMwTuYqwg0cODsuZ0HT80k5REiRmn0/TeSa5KjKXTKA=;
        b=aml+wAhcwz5Hg22S6P/StjLgObLOlqPDwwrim4V4Kw73Msh/pzscT0ydZfQJhcFRNa
         AFUNCGZBjUbMjqv4rG+PvwJuLSAOH4QblSVqLD7ei+uY3rqdfF2Tr6svvyXQs1Yfuk4M
         faOK6y3OH74C6y17srbRtOPXkP5vAM0u04vGxcQaAzmF4kXoWMKrx4S5eSxj7idhMMVe
         ENQFhxXeM3k9keN64bAQdQAhL7DjiUKfRWLZKInBHsQO1KRDFWJ6ApUsSCbTiznWcSo6
         vfb0zjt/SPG8gU5d0WzPjU+6fT6C7XsMvWIY9NJyURfhuUXzdhT+fkYh2haOn283YXO9
         x8CA==
X-Gm-Message-State: AOJu0YwXmzTKUfbYPIrunIXQmH3YF5DRKghGapJGEzvclx5FixTW/uCG
	p+TT/OJNXxi7uzyt6EZBOevSN3dWCsJs2r3fx79fB1a2nG49xQCgigv8wI4gWEyO7xcsnCT+u2y
	7j8zgF1g=
X-Gm-Gg: Acq92OHPMNlYMkgRTau4XSGlBWSIA4tkPwUsOkgEe3+JIw43l2otZ6CFK//OPlCK7IP
	AW2Oa8dHe2MnhL+s0dB+K7OmQsdnBMrnH77qBzwO5aUZsG1jmUOHj0pLpiHvH+MAR2d9L3AHKFh
	J6wUC5t8+ml7aRA5sfqUJ8LIFe4jSlOEsNTbgmcOjI4esWPe2JTlSjHdd1lf1Krwjy6tHzoCts1
	lBH+wyzs6kVs2TJDujZY/h3lIltr4KP/m8Mnf79BixjIv6i7NWSkkUuzpg6erpURefBmIbvxfZ3
	n9vIO55ns0KFCmAqdfpI3EC0ZIl1r9V7stEDIVVJmBJmt9TM2DEy6gQcndhaWcWADi3O+7FB5Ix
	rW3cPEwIHNTvIIHNKaaUg+EAnZb7xWvgNd3RShG9Tiz4FU+NVysuU1zqQZzJswVoIOcO2b8Hdje
	OCKXlhCmNW57kqh2uaMrNK97ziJPRKM+IQocSiMpcltKUJDZ+QllEZDXbyEi5sIO5fdIqdw2USe
	/Xof0PkfTz+k3jWBOtuEdzjrbXpxs9go4nfAr3aP21O9my1h7UKQuzyEr2d2w==
X-Received: by 2002:a05:6830:2714:b0:7d7:570b:6800 with SMTP id 46e09a7af769-7e70cab96a1mr3289872a34.23.1780698056796;
        Fri, 05 Jun 2026 15:20:56 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-106-235.totalplay.net. [189.203.106.235])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e7468f8fsm7032496a34.6.2026.06.05.15.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:20:56 -0700 (PDT)
Date: Fri, 5 Jun 2026 16:20:54 -0600
From: Tom Rini <trini@konsulko.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: fdt_check_full: Add can_assume(PERFECT) check
Message-ID: <20260605222054.GC382693@bill-the-cat>
References: <20260526203022.4006434-1-trini@konsulko.com>
 <ahZxuCONf2JfMXU8@zatzit>
 <20260527043859.GC1858239@bill-the-cat>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527043859.GC1858239@bill-the-cat>
X-Clacks-Overhead: GNU Terry Pratchett

On Tue, May 26, 2026 at 10:38:59PM -0600, Tom Rini wrote:
> On Wed, May 27, 2026 at 02:23:20PM +1000, David Gibson wrote:
> > On Tue, May 26, 2026 at 02:30:22PM -0600, Tom Rini wrote:
> > > In this function from fdt_check.c we have (reasonably and as the name
> > > implies) a number of checks on the DTB. However, there are cases where
> > > we may wish to assume that we have been given a perfect DTB already and
> > > do nothing here. Add a test for can_assume(PERFECT) as the first check
> > > in this function and if true, perform no checks.
> > > 
> > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > ---
> > > Along the lines of the patches I posted back in December, in U-Boot SPL
> > > we just don't have the space for this check much of the time and so have
> > > always omitted it (going back to at least when Simon posted the initial
> > > patch to make libfdt/fdt_check.c here). This is another case where it's
> > > a noticeable size win for us. I had missed this change in particular
> > > because we had in turn missed catching up on fdt_check_full being moved
> > > out of fdt_ro.c and in to fdt_check.c.
> > 
> > I'm not necessarily against this, but I have some misgivings.
> > 
> > fdt_check_full() is (deliberately) not called from anywhere else in
> > libfdt - it's intended to allow the user to explicitly do a full
> > validity check on the tree.  Given that meaning, I'm not sure it's
> > wise to turn it into a no-op based on the assume flags.
> > 
> > Your comment seems to imply that the issue here is size - simply
> > having this function compiled - rather than being too expensive when
> > (explicitly) called.  That's a little surprising to me - it's in its
> > own compilation unit, specifically so that the linker can omit it if
> > it's not used.  Is there something unusual about your build
> > environment that's not letting that happen?
> 
> So, we have code like this:
>         /* Get the total space reserved for FDT in blob */
>         live_fdt = bloblist_get_blob(BLOBLISTT_CONTROL_FDT, &blob_size);
>         if (live_fdt != gd->fdt_blob)
>                 return -ENOENT;
> 
>         ret = fdt_check_full(live_fdt, blob_size);
>         if (ret)
>                 return fdtdec_ret_to_errno(ret);
> 
> And this is compiled on TPL, SPL and full U-Boot builds. On the first
> two, we're just too space constrained to do this check. So it's not the
> linker doing the right thing or not, it's avoiding having to #if the
> code directly (or rather, CONFIG_VAL(...)). My line of thinking was that
> since ASSUME_PERFECT is that everything is really perfect, this is the
> way to go. Yes, it's a little odd to have both "call the validation
> function" and "the validation function does not validate" but that's
> just because in the second case, we explicitly configured ourself to not
> validate anything.
> 
> And FWIW, that's really how we use the assume mask in U-Boot, either
> 0xff or 0x0. It's a case where we're either passing along the tree we
> bundled with ourself (and so we can assume it's fine) or it's passed
> along (and we verify).

Hey, just checking if there's any further discussion here? I want to try
and get the delta between U-Boot and upstream down to zero if we can.
Thanks!

-- 
Tom
