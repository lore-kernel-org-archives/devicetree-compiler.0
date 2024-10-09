Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7121714A5
	for <devicetree-compiler@vger.kernel.org>; Wed,  9 Oct 2024 21:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728508545; cv=none; b=FqdZ6TMr50l4CV87uHoACucGXBqtentFAyKFkcN1ewEMF5HY14kz5CmgSuNiZo57uJ+XzPwySJnnwi/Z2PZR4zKgwLvOn5DetIg/H4Ci1s+pyj3pencw/0T05jXAnY/HR1vPVjej7NvsD7kSYrZV65/PHCBMuY+ahOZpO1UU9Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728508545; c=relaxed/simple;
	bh=lyA4/miIsnXp8QaEHRupWTTxyfBZl6WITqUFpb4ORcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+h1duRJMVAySXX03o1S59+aivOexfmALhPDp/Zlai9/ZBXEKzlVljDCaqNqqp0BU0yIDFqjMdZT2Kpn8AK0FV9ejhadmIkwXwTLVupLhMFj3oRznZ4cYBkTRTcNNBhPhg37H1p3R2GBn5cmtVK6AntX/7q/nTnj/uvKJ6crFv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QHsDqMg3; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QHsDqMg3"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6cbbe944b05so1645106d6.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 09 Oct 2024 14:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728508543; x=1729113343; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ENgfTxoWWSXn+Bzp8S2pZ/0YlojwarLjixu0ViXhqiQ=;
        b=QHsDqMg3sgwr9pISCdJfyUaLZg3+kOpws/WsedO4GaZlXuZk7oV1SdJuUMGudZN81d
         NJO+eJRm6h5excrbamBS+x13njBKthBzfzLPmbBcKoyiNNKbQhYcpgF122Jm7BkWg+VG
         bAebbPMuy2dbx6stAzBgwxWVhueGr8YhWqHM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728508543; x=1729113343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENgfTxoWWSXn+Bzp8S2pZ/0YlojwarLjixu0ViXhqiQ=;
        b=TIR/uRTBYq1NQjMeu9GfqRwLphNAD32UVqyJnWqvZYgQoiIVXaKI3Zdlra5DX9roXH
         /bU00b24hIvmsJm0QlWtTeodDxr/hT4q8Vb2pQCO7M6vmlVEvpRolA4Q4z0VCaHcJjBZ
         WfoXhYrDbM3pmqTKXgW8cI/Excv97e/rvhQ/o339o838BWYotZRDxttHwOaWLfxePW3w
         0mxvYb/WEXYffU+6Chh8n4WY02eKvdDHXQ2a549pmpuPbwyJk+S/DhNedTEdSy9shb+9
         Q+EJutn3zXiVhNAeNT4zJ7RBniMSI+Cj0ycgdcs5bKGzyYzFdZBrxM+7uXTRHj42juh6
         0KfQ==
X-Gm-Message-State: AOJu0YwCEBpHEWi7JPe1vc5P2KPTHWKvHAXkwFWo4snNyo6xFg6ZXgvJ
	tTg3upcREBXwKzfNpuVJYxxhYcqgs7DxB/Jv17Q8L9jZfO0ovgKhe3DM0tqpxRh2JyQfhI7uvTD
	1s5AtTIjBV1aB1riZOOhFh/nsE6SDH+nO5MN7
X-Google-Smtp-Source: AGHT+IHVZ7BRR88FzwlmPqyGbYgVgk0Ggc3HV9vWJhuMY9mcW5h1/pWmITzvASGfsvsgqfgfsMQGeE79sNGnlyNR8FA=
X-Received: by 2002:a05:6214:5681:b0:6c5:688a:63b4 with SMTP id
 6a1803df08f44-6cbc956189fmr57001486d6.50.1728508542994; Wed, 09 Oct 2024
 14:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008214134.171436-1-mmayer@broadcom.com> <20241008214134.171436-2-mmayer@broadcom.com>
 <CAFLszTg6dapEB3vwu9CicFs==NUCHgpGGbH91kJ-zKCWUcMo6g@mail.gmail.com> <CAGt4E5upXi4URn+JZworFJFPch=7iBot4E1b6WBCUZ3p8JBx7A@mail.gmail.com>
In-Reply-To: <CAGt4E5upXi4URn+JZworFJFPch=7iBot4E1b6WBCUZ3p8JBx7A@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 9 Oct 2024 15:15:32 -0600
Message-ID: <CAFLszTifpySKvBD6rSx9S++2d7qPiZeBWWyqEw3jq-Aeg=xkXQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] Makefile: only use compiler flags when supported
To: Markus Mayer <mmayer@broadcom.com>
Cc: DTC Mailing List <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

On Wed, 9 Oct 2024 at 14:43, Markus Mayer <mmayer@broadcom.com> wrote:
>
> Hi Simon,
>
> On Tue, 8 Oct 2024 at 18:57, Simon Glass <sjg@chromium.org> wrote:
> >
> > > diff --git a/Makefile b/Makefile
> > > index f1f0ab368cd3..febdca5742c5 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -3,6 +3,26 @@
> > >  # Device Tree Compiler
> > >  #
> > >
> > > +# try-run and cc-option were stolen from the Linux kernel
> > > +TMPOUT = .tmp_$$$$
> > > +# try-run
> > > +# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
> > > +# Exit code chooses option. "$$TMP" serves as a temporary file and is
> > > +# automatically cleaned up.
> > > +try-run = $(shell set -e;              \
> > > +       TMP=$(TMPOUT)/tmp;              \
> > > +       mkdir -p $(TMPOUT);             \
> > > +       trap "rm -rf $(TMPOUT)" EXIT;   \
> > > +       if ($(1)) >/dev/null 2>&1;      \
> > > +       then echo "$(2)";               \
> > > +       else echo "$(3)";               \
> > > +       fi)
> > > +
> > > +# cc-option
> > > +# Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
> > > +cc-option = $(call try-run, \
> > > +       $(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> > > +
> > >  #
> > >  # Version information will be constructed in this order:
> > >  # DTC_VERSION release version as MAJOR.MINOR.PATCH
> > > @@ -18,9 +38,12 @@ CONFIG_LOCALVERSION =
> > >  ASSUME_MASK ?= 0
> > >
> > >  CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
> > > +# Warnings where we need to check they are supported
> > > +OPT_WARNINGS = $(call cc-option,-Wsuggest-attribute=format)
> >
> > This is fine, but you should be able to use the existing cc-option in U-Boot
>
> I seem to be missing something... how does U-Boot factor in here?
>
> My use case is to build a standalone version of dtc with clang for
> x86. This dtc is meant to run on the build host. U-Boot sources are
> not involved.

Sorry, I saw this in the middle of a bunch of U-Boot reviews and
didn't notice :-)

Regards,
Simon
