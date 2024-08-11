Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF5BB64E
	for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723388728; cv=none; b=THJwF70nXAYbnYaN1KR9bu0uhvvBNFchB7pyYyhApwgvq1i2oiRQcqZzUwy638Qh25QqLpl73gJG6IV/sQpuVyrBZZgisDP27wHhj9cR4X0W4VmOxaf1UjeCx1Id1MSkQV0WK5EdYvM19C3hyZ8T3Sz76c/9aAyM0Ru1x/23U5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723388728; c=relaxed/simple;
	bh=p1gX2H2vYLzk+jJgzQCB6Wy49ZglljMmGX6gMLm3hl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuXaWKZTKSVZYHJGjxzxquOvhTT6qubiVC9AHQmwwIa86E6fxvHhr3qDjkGw/coMKbGuVRRN3TgfVGEt9tHv97WmVwgD4BmOyDedjRG77yUvnr5JNY1kIiLgjgWSNhCKzj8WFFn44eP6ylMzP26use2GEYNinQXDL3zKOxMi+4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nt35PhvJ; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nt35PhvJ"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7091558067eso1885475a34.3
        for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 08:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723388726; x=1723993526; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gh6klQJyZld49tNMdelFBhN0caeGSTF7Mjcn6h7sM0Q=;
        b=nt35PhvJ+lFQhUu9M4JxGKQyJsguy1oZ7l5i7VsYlHgUmssyS9WcOaUH6UC01VR6oD
         8E1P1WCXsREgxt0YOoLgwUKG7km6VGOF/qRYF6fJVwt3vE0kxLH6g9GWMfBChPJLTK/5
         G08ZYLIZjDjAJL1sADmQieFyex/qXQw0gV0k0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723388726; x=1723993526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh6klQJyZld49tNMdelFBhN0caeGSTF7Mjcn6h7sM0Q=;
        b=w0F7xSXQFn4iYNBrsx0toV/Qi+mH+dg9AvQcFwqoWucQzMq4emvvneexLr5DUSn6tZ
         kh0g04Kxcbh5ZZaJ8EEUdY0a04z4cGK2hHXqvLadV6Sdqhvb7BIyF0QSpavyhFl6Ffm0
         C2Mp7Iz6Y10dB+Q7kFVRpq261OQOuaEpJH6aD0FXtr4VzsrmQeQWUjmFIdRUR+3rtBa2
         4SDZO6h55krTOzBnJtKZC7NjoAGprhT6RLB3bAfbqaoGVx2TEwU3cUcsC+SB0s8KCeOR
         0WHtzrXc+Z7BFaIoV/0omoWhwjxp90I2dlb83VR8gcB5i4hZgGojHyH5JXS+9HwBvMpA
         Un8Q==
X-Gm-Message-State: AOJu0Yw4ymO7dMtGKGZN6tO8OteC6omi525Bq4a7L8WmCXSgN/3m7w7I
	h8WVPOn1ULr2RnOCRHgVxZLgYjFWHkFZCQPe/9Zq6PyeJmrML3uIPLdwtP1Re/TsQzQwOzlq9CA
	kq9z8S3HJqkIImaUs8QtEah4og7rzUORfSi8GLFLER/pAAns=
X-Google-Smtp-Source: AGHT+IGoBuoTsYp7gX3p+zgpDldoZfCLt5B4gSrYuZiNPZghMQXqwVDdNYge5zzoDJoa3yfL8Kh/FCo3C4QNoLS90Ko=
X-Received: by 2002:a05:6830:d13:b0:709:4094:2a68 with SMTP id
 46e09a7af769-70b7b070957mr9285746a34.30.1723388725742; Sun, 11 Aug 2024
 08:05:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811150248.7537-1-sjg@chromium.org>
In-Reply-To: <20240811150248.7537-1-sjg@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 11 Aug 2024 09:05:15 -0600
Message-ID: <CAFLszThP3jzZ8NLFv66pGHMF9L_d4C+BXZRHcDYo6_tcYUQoKg@mail.gmail.com>
Subject: Re: [PATCH 1/6] Require Python 3
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Rob Herring <robh@kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Gua Guo <gua.guo@intel.com>
Content-Type: text/plain; charset="UTF-8"

+Rob Herring too in case you are not on this list

On Sun, 11 Aug 2024 at 09:02, Simon Glass <sjg@chromium.org> wrote:
>
> We don't need to support Python 2 anymore, so drop the comment and add
> the minimum required version. Use version 3.8 since I am not sure that
> it works on older versions and 3.7 has reached end-of-life.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
>  setup.py | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/setup.py b/setup.py
> index 293bb6b..749bf1b 100755
> --- a/setup.py
> +++ b/setup.py
> @@ -1,9 +1,6 @@
>  #!/usr/bin/env python3
>  # SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
>
> -# While Python 3 is the default, it's also possible to invoke
> -# this setup.py script with Python 2.
> -
>  """
>  setup.py file for SWIG libfdt
>  Copyright (C) 2017 Google, Inc.
> @@ -60,6 +57,7 @@ setup(
>      ext_modules=[libfdt_module],
>      package_dir={'': os.path.join(srcdir, 'pylibfdt')},
>      py_modules=['libfdt'],
> +    python_requires=">=3.8",
>
>      long_description=long_description,
>      long_description_content_type="text/plain",
> --
> 2.34.1
>
