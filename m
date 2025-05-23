Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC7129615E
	for <devicetree-compiler@vger.kernel.org>; Fri, 23 May 2025 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007880; cv=none; b=c75gpvVwBlSQPChK+gL6ueVOP4uLnUNYtbqSkcR4QMGCXUR4EIyKvNBXI4NCYoTSO49jvKztNcYMU0ymMkbZl5BdAImZmDE8eVrVVwbn72eNQILKZInpuK6Hq1+DiyODD8rfirK/1raUKti+YGnAjENdCtjFqf4tO4D7dMkv9JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007880; c=relaxed/simple;
	bh=WX5oeZMd2Mg3tuL/SLnqaZ12VMKBUo6sdpk7b3g517U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewbzBwYDid6xvC3pEGdCmu+gB63coRoA4DnlW8sJ5h3V+5YuOwWrHtzbkha+n6ujxzLS2BNYTyvwGt5JJtgcMQ7UuBBnw5D8oNADCxe3UxRlxk2BnzO6Yfn+HHBFI/JsL8FKOntjwCuwXn4t7tTtugTIoaq/kBTWcaARoJSDJao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CKxmtjg8; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CKxmtjg8"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso1558479766b.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 23 May 2025 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748007877; x=1748612677; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NAyWNo7S59H5mqa15DdyUkPIexCzhUrJ09VuVJ8iVqU=;
        b=CKxmtjg8cqLC0eztwK9XMZOa7GapzyLzNrfxHxT+WzubQ+2/flf4/LyUXcieRINayK
         8bRvAwQPConHmKLxFmlBO/ncV7SNqv06VXxnE8gaiAbctxRlCu/kzO6HfrNjRwO/dsD8
         sFa0WAgG9bGPkiOBbFG6YKQvGh7y0P0wj8pvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007877; x=1748612677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAyWNo7S59H5mqa15DdyUkPIexCzhUrJ09VuVJ8iVqU=;
        b=H2mCZzxmhxtsFuhO9C3mfHdmBIwm0Sa+AtYsUhOJskZKQdGi3o3w7JGtI40NLBnO8w
         MGyOaCWZJP0Hlai+icrAhXyPE18z/5A9jlyTOCrDEwbYba5qR/35dlyuuCVFGiRc0ru7
         Qg8IkjQePlViqFmddWGo9TXH/Pl348UJIaiwsxTP17tDXQeAGzC5vbUDLzCu3UNdAPJg
         5XOvnFCwtbsGfT5mA/W9dX0mg55W8GX15FmwQRCdZ/kr6oo8kYG+fvUf4kzId9GoNH7g
         3jFSplHk8L/dsN4trI2LIv2C68RPNfhZLQU89IcsrXCORlNrEs494gydgPuoudQ9USq6
         sWng==
X-Gm-Message-State: AOJu0Yx24kIQCpA46Gd0XLY5imPJSrOsR4a6Y+Sxn4z39uRfmulzOLlk
	0F4LO7fTPjWgG6wKyWrchvruafi8133gHvPIhLEyfLkCq6YfOIPIcLCwnA4RegzF3Rm6oCw11UQ
	4OimdIZzX+RkQ9Eb98OSpkjRDYjfVVOWDxRJ511Tw
X-Gm-Gg: ASbGnctz1wjwMNkq44Mc/Eb4BvkzOjkgdgpjo3qZkp3g7a+ymxGIG6UgSWaMq3g7tuN
	53fhI8WAHGY30PeM0XJ/HQBQxPZ6tX7duaBn1i9BttHrV978ttl1acQI7qy0x4e0o90xRGKUDjS
	0bg4XI7Yq7hMkYsWLA8DQlkcCTLNc+5PznXA==
X-Google-Smtp-Source: AGHT+IEdkO6gbe4ExSqXGfhvKSFwaIcZT3GSo5MsoF6WP2jRIcweaIeBwn56Hc+h6zfufER7xotYxTwUJTjiKdBR4MY=
X-Received: by 2002:a17:907:72c3:b0:ad5:1ef3:20f5 with SMTP id
 a640c23a62f3a-ad52d5374b2mr2525495866b.33.1748007876791; Fri, 23 May 2025
 06:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519091043.621316-1-quic_wasimn@quicinc.com> <20250519091043.621316-5-quic_wasimn@quicinc.com>
In-Reply-To: <20250519091043.621316-5-quic_wasimn@quicinc.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 23 May 2025 14:44:15 +0100
X-Gm-Features: AX0GCFvJip9p5GngUgyFejm0qGqCfNLnXAhfZXNitH7D_9KsrT6gy1oRhbZ231s
Message-ID: <CAFLszTgH_z4yfYVx=zUUK0tV36srmj9zeG-SGGzS7nY3mxJEFw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] fdtoverlaymerge: A tool that merges overlays
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: devicetree-compiler@vger.kernel.org, kernel@quicinc.com, 
	kernel@oss.qualcomm.com, Srivatsa Vaddagiri <vatsa@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wasim,

On Mon, 19 May 2025 at 11:16, Wasim Nazir <quic_wasimn@quicinc.com> wrote:
>
> From: Srivatsa Vaddagiri <vatsa@codeaurora.org>
>
> Add a new command-line tool, fdtoverlaymerge, that merges two or more
> overlay blobs using the fdt_overlay_merge() API. This tool is necessary
> to simplify the process of combining multiple overlays into a single blob.

Normally this would be done in the bootloader, with the overlays in a
FIT. What environment does this tool run in?

>
> Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  .gitignore         |   1 +
>  Makefile           |   4 +
>  Makefile.utils     |   6 ++
>  fdtoverlaymerge.c  | 223 +++++++++++++++++++++++++++++++++++++++++++++
>  libfdt/version.lds |   1 +
>  meson.build        |   2 +-
>  6 files changed, 236 insertions(+), 1 deletion(-)
>  create mode 100644 fdtoverlaymerge.c

How is this tested?

Regards,
Simon
