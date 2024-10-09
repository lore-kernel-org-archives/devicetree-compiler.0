Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2491E32CB
	for <devicetree-compiler@vger.kernel.org>; Wed,  9 Oct 2024 20:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728506635; cv=none; b=p3h5CihIcDlN8T9vt3UDUk77AfGoPlGyMk+wdWg7YAlSgdk5SNE2lWQmPEFEawrn6j5mBBUDtfX3ZvnqkZdGOhPMEio0MVrS6X7fBrTZxxES9bwC2WoPbR2+CTA3Z4ELBex4M2ibCjpLnIpa1jw3hUXgaeORCDf33qfZfck4OAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728506635; c=relaxed/simple;
	bh=6Fz0xqbubqeV+KaKsJ81KaJWPw5qZPPdnU7OaO0S3WY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+rc1yTz38AO8pRl2T3Jgrpx5KogM0yIWiFt7aMlfB801qg9mI4v0AMBn/iAWJoz9OscZDqQQJR5TLi4iNLjXt4tU3uAX+CfXmbYonVJkcr4SyFLxFwOwS8VGHBPAab/lsH3zyn2MPO4Ir1XTr11DzMU09qA8ennyFv9yhZrHAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cZGtbcxU; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cZGtbcxU"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e09f67bc39so241530a91.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 09 Oct 2024 13:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728506633; x=1729111433; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ilQmvCv0Enyi7TjkQYj+4GBramrhDKWkwN17xi/76L0=;
        b=cZGtbcxUTVqXKwnCLmu8UQkxOre6MOa9W/kHmbrSk0ydCPcEHurcC2kI4/vrzgrzUc
         zOqrioQwrg9lGn6SPkWKASeHzVFfi4r9z7kdH48yfZkh5PTj8jxJKRB5zuEToPx6tsQJ
         k9G+lQqUY8r3J1syc+XvF2LnEweTCMSRYG4v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728506633; x=1729111433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilQmvCv0Enyi7TjkQYj+4GBramrhDKWkwN17xi/76L0=;
        b=oBphs5EjEqwm1OOGkpIFFALvZgjU+f6VgS62FKEeIiK0s2uko6BPKmVTxMsAf5OK/3
         abEPZlBjCimzJ0f7VKyvS2Qrif+2ZVOi+AjnrbHmoM0sq3HKI4ygbUo0iGgTpD76WI2g
         j2KMonBEEEZp13eVc4VNFuevOWrmTtI3ixCjbip0n3Yccmj5vVnS1JEINxgGv5a1aXey
         QPX6PyjMM5nwfL0UvTQTLLQumLvNvUMjni3zo784u1WVRWz/8d+jVcBJVwkVk+YvSef8
         a6wrNxlbN/nSMpoSWKJiB1iw9njCfgvwLEgSjpccQ/gZj24dFJqV//MEGQqbPmZXrg7K
         SAKQ==
X-Gm-Message-State: AOJu0Yz1sZWv9xXGuC8iaW0XOaUsH0S64c532wdRztb7kvx4u4G+XLo3
	gWAWhezEhHLOZK0uO/1tck6hBOo+R5Ji0LFcr0vlqAvr8FccNnyrYWqUsnfGJjCZWMp4cZQlBiO
	aWdjFPSCsA2QtXf30syYeGrkQ4Cu2T2wTurAVe9tbAKP5hbFZtQ==
X-Google-Smtp-Source: AGHT+IGQy2XtT4mk1+xqZs9La+bagx0nty4TLxC1uY61WusfhXrwcoDioKUB0cZuHdZBPKpNtbi97V7TO66yOHW04ko=
X-Received: by 2002:a17:90b:1295:b0:2e0:8bf2:1d05 with SMTP id
 98e67ed59e1d1-2e2a2563235mr4537863a91.39.1728506633243; Wed, 09 Oct 2024
 13:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008214134.171436-1-mmayer@broadcom.com> <20241008214134.171436-2-mmayer@broadcom.com>
 <CAFLszTg6dapEB3vwu9CicFs==NUCHgpGGbH91kJ-zKCWUcMo6g@mail.gmail.com>
In-Reply-To: <CAFLszTg6dapEB3vwu9CicFs==NUCHgpGGbH91kJ-zKCWUcMo6g@mail.gmail.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 9 Oct 2024 13:43:41 -0700
Message-ID: <CAGt4E5upXi4URn+JZworFJFPch=7iBot4E1b6WBCUZ3p8JBx7A@mail.gmail.com>
Subject: Re: [PATCH 1/1] Makefile: only use compiler flags when supported
To: Simon Glass <sjg@chromium.org>
Cc: DTC Mailing List <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Tue, 8 Oct 2024 at 18:57, Simon Glass <sjg@chromium.org> wrote:
>
> > diff --git a/Makefile b/Makefile
> > index f1f0ab368cd3..febdca5742c5 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -3,6 +3,26 @@
> >  # Device Tree Compiler
> >  #
> >
> > +# try-run and cc-option were stolen from the Linux kernel
> > +TMPOUT = .tmp_$$$$
> > +# try-run
> > +# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
> > +# Exit code chooses option. "$$TMP" serves as a temporary file and is
> > +# automatically cleaned up.
> > +try-run = $(shell set -e;              \
> > +       TMP=$(TMPOUT)/tmp;              \
> > +       mkdir -p $(TMPOUT);             \
> > +       trap "rm -rf $(TMPOUT)" EXIT;   \
> > +       if ($(1)) >/dev/null 2>&1;      \
> > +       then echo "$(2)";               \
> > +       else echo "$(3)";               \
> > +       fi)
> > +
> > +# cc-option
> > +# Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
> > +cc-option = $(call try-run, \
> > +       $(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> > +
> >  #
> >  # Version information will be constructed in this order:
> >  # DTC_VERSION release version as MAJOR.MINOR.PATCH
> > @@ -18,9 +38,12 @@ CONFIG_LOCALVERSION =
> >  ASSUME_MASK ?= 0
> >
> >  CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
> > +# Warnings where we need to check they are supported
> > +OPT_WARNINGS = $(call cc-option,-Wsuggest-attribute=format)
>
> This is fine, but you should be able to use the existing cc-option in U-Boot

I seem to be missing something... how does U-Boot factor in here?

My use case is to build a standalone version of dtc with clang for
x86. This dtc is meant to run on the build host. U-Boot sources are
not involved.

Thanks,
-Markus
