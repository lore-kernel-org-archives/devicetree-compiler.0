Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE8149C4C
	for <devicetree-compiler@vger.kernel.org>; Wed, 14 Aug 2024 02:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723601732; cv=none; b=rjq8gsS8Wjh/8yzKM9WYccxKu+UrJDwtTrWZYZgVV1P/t17prBqnpAJZLa/UcLFVD9b7IOqp3AO3rbotMM2FdhQVWZHeehmuDyhvLhJkoWE9p/imLdwhUfOlToh7DxKUUvtS/JDWV3fZylj2FGbZ+8vnhaqhTta9eBj4uftCJrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723601732; c=relaxed/simple;
	bh=3aPZeAhP0WVLMcFjS22yPEv6UXLI5ppVTuCDzfWlWbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lx0FgHpyC7UJa3J6E9XRGC2bxZB0rFLZDf0HneKR9x39yxQ6awCaH0s7xTFCCTnpH3iq5z/4jN4h8rqRs48uGgd+Ack4zmz1f2E4hjzOCyexHDatNrIneDS0W6u9k6hRLsvSWV5hGspv+tSotthiI5l+2XJycNHGAr91LCovWKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iUNaZwYE; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iUNaZwYE"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7a1d024f775so408305685a.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 13 Aug 2024 19:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723601729; x=1724206529; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OYWZII0sr+ZVDU7oqiA6R/KzvagZ/8p/govQgIRFSG0=;
        b=iUNaZwYEYmcAnkLM5eRcJscWj0QoQFGZF6rEKqady4oeYdks2OUFgGkIsDdVvd6Okw
         xgqLww1PO/n1ErxsZeXi/6a3pzwp41EmYouPLwToUWdmipEaXgLTf9is4fBFDfiK+iNe
         5J/QwK0TkIUSPHmxvcV1drel/bqe68HaTrk4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723601729; x=1724206529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYWZII0sr+ZVDU7oqiA6R/KzvagZ/8p/govQgIRFSG0=;
        b=k29wH6qQpFkE/pCodWxKb1cYIZQbXEHve7dGTFpEz1OkU1cYEtBn18+RKeikNy7pja
         I9Z+wwaAf+JX9jl5UmsqwkZmT/xgsAz/9/Q7Z2+BDUy+8ZP493kUmKC+AT/9ksqC0xST
         NKWSi5zOt+vTaClNLMe2RzL7tBSz0boxjpfBgkRua69UmwiksLfoJPbtw5663i/8vsjF
         +WcrXdysxDN6ttLMMm6K4vmW7qwLQI3GTGOEzCEQBuvMXt7B00kIqxIeANOQtwzhTNpt
         /EBGVy6ySkd++5zMXRZOkQmm7FIjQTRcLQlM2kAcrTbgjbLv31ZVuQt33rDRBMfC1hV4
         i8ig==
X-Gm-Message-State: AOJu0YwF8amj5PIxCMzxtuBVSOhky6dhhpQErsi/nMwPTgUWph5YgRdi
	oUCoEKdpDxfw1lVRjMq+gKfJ1IPtMIQYAlI3OBJdYBrFrCuAjAA98Aj4e0u6eJ5UijMjr6ocRp8
	y3QbUQXbC3bxT4frZ33ghFLZMFHd9lDS6VJcf
X-Google-Smtp-Source: AGHT+IEpO77BERVP4OMNkFZ1jkCQsqvoYUv9qtf3FumTJp8WJyk9AiZis8phr8kWjpp71SqwQwXVXgh3RM6LTQSj5G4=
X-Received: by 2002:a05:6214:3d11:b0:6bb:b1b7:a690 with SMTP id
 6a1803df08f44-6bf5d1a9685mr16450166d6.22.1723601729397; Tue, 13 Aug 2024
 19:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811150248.7537-1-sjg@chromium.org> <20240811150248.7537-6-sjg@chromium.org>
 <ZrlqiYL4p6K14S6e@zatzit.fritz.box> <Zrls36hgOi9jIIf1@zatzit.fritz.box>
In-Reply-To: <Zrls36hgOi9jIIf1@zatzit.fritz.box>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 13 Aug 2024 20:15:18 -0600
Message-ID: <CAFLszThLkKJMxScMmEYVpSPUYTt7dQuXLcF7Fdf7EnaDTEV-zA@mail.gmail.com>
Subject: Re: [PATCH 6/6] setup: Add dependencies for Windows
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Gua Guo <gua.guo@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Sun, 11 Aug 2024 at 20:01, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Mon, Aug 12, 2024 at 11:51:05AM +1000, David Gibson wrote:
> > On Sun, Aug 11, 2024 at 09:02:48AM -0600, Simon Glass wrote:
> > > From: Gua Guo <gua.guo@intel.com>
> > >
> > > Windows apparently builds pylibfdt if swig is declared as a dependency
> > > in the setup file. Otherwise it must be installed manually and Windows
> > > does not sport a package manager, so this is hard for users.
> > >
> > > This change seems to have no ill effects on Linux, at least.
> > >
> > > So add a new setup_requires line.
> > >
> > > Signed-off-by: Gua Guo <gua.guo@intel.com>
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> >
> > Applied.
>
> Oops, spoke too soon.  While this works locally for me, it breaks on
> the github CI.  See:
>
>     https://github.com/dgibson/dtc/actions/runs/10344711112
>
> > We do have windows build in our github actions.  It would be great if
> > a test for building pylibfdt properly there were added.
>
> This remains true, once the Linux breakage is fixed.

Thanks for that. We'll try to figure out that MSYS2 error.

Regards,
Simon

>
> --
> David Gibson (he or they)       | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you, not the other way
>                                 | around.
> http://www.ozlabs.org/~dgibson
