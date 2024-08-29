Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F7336B0D
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943648; cv=none; b=M9hTQpIFL4itP/uPWAbA62qi4t5qHv7x6aMq2Hu6RJMBr9Ip3F76bZ+Rn5swD7PdIgSdQDaMr/7A6xRg7gg4Ao/90GPxp0NbepoThEKzQIc6mSBzziAJAX2pc6R2VOrQyi9OWSZKV63kyFeSppImcBL/fkjIq3ncUv7wvywuPH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943648; c=relaxed/simple;
	bh=zSXzoF6af6V1P0RKERjrVSPEHt3RsuyUeif3Dq87800=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oB4rxy8iHaa80v3SEmeI0pc3iyPRBMCCNaIaP6yGKZVvObLsArqhLwOGGfwJkHqGndx83P9pYu+b/L7FRVgllNyqzZlnBJ4idPdoJdElg/It3NpwZLStk42vT9f9Yrj9aTSvy4sRKLR3/G/JAScFzFsVJpdpnvQ1NXp9c+RsWuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QJMkfuoK; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QJMkfuoK"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5dca990cf58so470124eaf.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724943646; x=1725548446; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e64W3ZSZsynJGeKfCbPzacg5+7ZfHVtsJSvZb1N3Xz4=;
        b=QJMkfuoKIiJVHRO4H35yoyGgatsWJ35gup+BrQzKJIR89jvshDytC0hG7R7OdS2d2v
         J/XaXkcLAa3VKV1NtEkzBffj1+5Vo0ltFYxJVwTjBbvqw8ap5PRtJCqce2x1kRk31ekK
         doX/Bv3RhiCqcEbUi7Ka6fbFduv+V9XDKJbpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724943646; x=1725548446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e64W3ZSZsynJGeKfCbPzacg5+7ZfHVtsJSvZb1N3Xz4=;
        b=EjGebWXkFCZlterkasXkSciwcwn9vMFrT/rUsIFrL6+OYgdKXYgVw825QSRM+LRqwx
         d/BuDDnt/MCDYLz6iQ4eOK+UcRlbrWbWdfWIi77M0X18Os2nkFW2js3X/U1VrZ986TMJ
         I0wMlHPx1RqCfEsNU9n9HjaBkY1BpkwYYU6HUwyHdeK5pBck3zYi7Fk3n9WOB4HvCK0C
         XTrs1PwvTTCrLTpRmzBtr1E/nnNuxlf4lE+ocPT1FIs+MFk7SBiRQUVDKnk/6MLx0nI0
         H5RYsTmVNT2CRBxHRJRHsUpVezIjhEq+8h1pd6N9ksG/ZlWydXs7fa4Tl9bCqisprOv1
         NFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpb6U7K9AzIbpFEOgi+TUxqRofFrRCbEDqPZmwHZHBsX7j+wdWWI2N+gV3OQTvmblCe7Oy66aWbIMi8N0tHsS8c2cO@vger.kernel.org
X-Gm-Message-State: AOJu0YxJdPcjyEDJiLyYHdyVme7zE2DhJgoCQCCX3ksvWr785ofIYJKw
	vWCfxois9pzAQFtdXT8fFgRiOYiS+xU14SdZSZmzkiHGqzP4KU1HwVMlC/lBXFqRPoxsRAuxu2G
	V5pqnKx6ZCjzbw2hFIGhivQf2n4s+kYhHRbe7
X-Google-Smtp-Source: AGHT+IGKagt1DbFptE+FdmPenespqYtV7+S6Kz7sO8PMAiXpMaaFDKZe8Jmr1LlKaiVtJbEUjB8IgFZmNFXUiGn50/w=
X-Received: by 2002:a05:6820:1610:b0:5c4:2497:c92d with SMTP id
 006d021491bc7-5df97ebc0aemr3564637eaf.2.1724943644581; Thu, 29 Aug 2024
 08:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827-append-v1-0-d7a126ef1be3@beagleboard.org>
 <20240827-append-v1-2-d7a126ef1be3@beagleboard.org> <CAFLszTi6vjLqVe5ZhMOz+=a4SuYHabrRBKDH5yJk2+-Y7ui0mA@mail.gmail.com>
 <b179c8a3-62fd-48de-b54c-abd6730dc05d@beagleboard.org>
In-Reply-To: <b179c8a3-62fd-48de-b54c-abd6730dc05d@beagleboard.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Aug 2024 09:00:34 -0600
Message-ID: <CAFLszTh0XZwhmdG35nrGVRXt_40fxTPx4CneKjxkT_5qMKiNxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests: Add test for append-property
To: Ayush Singh <ayush@beagleboard.org>
Cc: lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
	Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ayush,

On Thu, 29 Aug 2024 at 08:17, Ayush Singh <ayush@beagleboard.org> wrote:
>
> On 8/29/24 19:34, Simon Glass wrote:
>
> > Hi Ayush,
> >
> > On Tue, 27 Aug 2024 at 11:55, Ayush Singh <ayush@beagleboard.org> wrote:
> >> Simple test to build a device tree with /append-property/.
> >>
> >> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> >> ---
> >>   tests/run_tests.sh          |  3 +++
> >>   tests/test_tree1_append.dts | 21 +++++++++++++++++++++
> >>   2 files changed, 24 insertions(+)
> >>
> >> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> >> index 937b128..ac0dc05 100755
> >> --- a/tests/run_tests.sh
> >> +++ b/tests/run_tests.sh
> >> @@ -708,6 +708,9 @@ dtc_tests () {
> >>       run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb "$SRCDIR/test_tree1_delete.dts"
> >>       tree1_tests dtc_tree1_delete.test.dtb
> >>
> >> +    # Check prop append functionality
> >> +    run_dtc_test -I dts -O dtb -o dtc_tree1_append.test.dtb "$SRCDIR/test_tree1_append.dts"
> >> +
> > How does this check that something actually happened? From your cover
> > letter, it seems that you might send a v2, but I'm just checking?
>
> Yeah, it tries to build it and that's all. I am not sure if
> `run_dtc_test` fails if the command fails.
>
>
> I can see there are helpers like `check_path` but is there any helper to
> check the value of a property? If not, I can try to write one.

The fdtget tests do some of that.

Regards,
Simon
