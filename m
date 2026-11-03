Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793724496;
	b=LMEqElIju8RVtk2Cls6SJlhtJt2N7nxUiB0Ywp8R7Ug6OHm82aagcmhwn6Jjl16m5b1H
	 F95bJhxobHkgU5iDUCTQ05mzXVrmfONcUgjCDY/YoU+efvQA12I9aF5bl1LXflTBe9eMG
	 P3H0rURuLxyXEY/4jyMcdM+J1DGl8abxKAogeA5ZFCQntdr+cj7McpDvVkTjH8RiZI+2n
	 da3soU93cQ3J5si/JY1IkGb0jdfJOahUl7zPxU6jXXnI5IA40neLfH9HAi7jnNjMoIr0w
	 /I2sutjB5KmGEh0Q6Vg5Vse60Ie+R9TovdAdK+JobE91C+Ta+XZ5EGZ5/6dwl7g9WQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=DNdq77J8mc/jZdBDhlraCCYlUl2yuMpMo6+spoBerf4=;
	b=EKGVmei60oY2jvXEWwdozUr8zPIZdmx5cUlITLLA68keUf3tITv4uU/V/3RzbJ2NBd6C
	 L1+2ROPS4HWiHYE0vSI1px6ee6IQMU5mYtjM4tGTeElcCpYoy8OAo4m62hOpvNxlX5G6s
	 x6Bd/ONMTLMygFYRvzR9u92zug5GHFdwS08gGcxoFf9jWkrCg+xlHzmpWbW1tqERnNRy1
	 3E7UkFsASFSn3v5YOzQB4puMEW5YgyezCzBSwFtdKSAw+OvcdY0aKbjb9uC7n0WRmD8za
	 gpF9kqbsQAiUm/vHdDiOWATgrXhgyAbV5HDaFyXGq+Vtt9I+dIM6ZZUxhBg3GBZ66dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405B6606A324
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 16:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 405B6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso4521059a12.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 03 Nov 2026 08:48:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793724495; cv=none;
        d=google.com; s=arc-20260327;
        b=SLdn1O1wwkXa1ZnTyS3RJIIhIlP1XD7HhNNTjvEY49ZPGg0vyHBGl9bqaqdmJvrwXJ
         8hEEMs4jj8U5WU4sJ+We3C5lph8Q5W9G2DSH0LOWleTGQCbub7WixGsST30pytKCNnnK
         UaaoZMQyXvqObo79QIdThDlugXUSUQN20YK6c4LWZWvDhz3OJhCQPUq5hriw0SKQh5Op
         KYFPZfOHaqy2Nxp48Hk2cfosQH5Hovl4KAM/nsuMMw2//33bTyN+DV7lZvCOJOd8OYOw
         yitam9bejMD59x5gfcv6tDrF8FR8zSCzvhHe4nUvrJGcRdZK7xtJFOd/NnhDdio7+svJ
         f/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DNdq77J8mc/jZdBDhlraCCYlUl2yuMpMo6+spoBerf4=;
        fh=jWypUYRIlbXfwo/25Ny+F9lustoK/AtY7ciODrxfceQ=;
        b=Yitc9t6M3boPOY0m83SbncWPhFOx84yt6BkbjciAUCCjzoZNjqwQnwZgHJVWyYlQdD
         DeFDXMZi+0eIam0mbXxKO+9l+Qp4Ar/Oqo29wwERHgLNL0oEmyyKgnbOVTaMKbN/x05i
         +h765yz7q9FBnGAUMPOYq0e25RbVltGV1yKogWjTgy8n/q0hfrxEhckFgzrMqABuVjF4
         ndhGy4aZmVIMkpjbDiDHXRMDZaG+G8q4gonMmHcEH8bpbTTmPFe+NqzCusAxE1KwuK4d
         0H3R3il4bnjJ+axzVmnD+O/lXrF3NCmp4peZEHmN9TIynmcVQVIEolLFmSxGeGJ6y+Av
         qXkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793724495; x=1794329295; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNdq77J8mc/jZdBDhlraCCYlUl2yuMpMo6+spoBerf4=;
        b=bCSPyUii3ZN/5nwPpeuVCZgb9+JA9gZxBdF64RD8fvEZzc3Tt8lRiwu0FuHfN1wOG0
         aztiP6Fcb0lW3gZ9gi+soPsvL6nKnZl3FiTnBThd4bNc+7aHYLynA7QLf4zZJK3wWetc
         jV0KSc+57WyjLriplPHirpscP75QKJ7jtR1BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724495; x=1794329295;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DNdq77J8mc/jZdBDhlraCCYlUl2yuMpMo6+spoBerf4=;
        b=b7aPvW3ISkuihREBa3w+HlC5OhsSK0qdqEJ+0FSTiDA4MdwNqD/2yZwxlup3kOLAtd
         tYuCKu6YyOukNIT1ApGer9JwlmsBe1mf/OCxCZssw/oDWBQ3KibMgx9BZjg3DsbTJJ61
         TnaexHn/zisebMkwukdU05NGFYxvHdBqCTPxEBwOFDU/n8hPxmJSTG9skFTfofA3WUFq
         RcjIn7/Kb74WGjH1p7WiidSEgvrQwi/xU0Li0GC3YpZt8HaDuyKjCvvs06yX7bWowftC
         0dB7wTIC0+3gsALLmKKCpUN+R8dJLSLWtv3wR+PYK3iI7TlSFM9+Uwj1B9kVYpxEFFO7
         vNWQ==
X-Gm-Message-State: APuU4Z+rKjYK8xHFyUIqtw9kipy2BEFkeMBAjL+Vo9QkF97tQEkXn/YN
	3JdZMeLK8BH4nBVFg265bSGyy7NbZfBAkKOLiutEgBqMMN7neNp50SCWppu7Xi79fRr/JoDpB2J
	IyxdP7+JujGMeZSWN6sYdWyd3N4q00OzsoCV1KXND7poKyoJuR9M=
X-Gm-Gg: AYBFou1GXRheFzDW8CSiSYA//NjpvORa7xzu8gJ/RgS1wk5qeWpYHkxaMl95dvsp7ZA
	cNLqIyBUDdn9YSoYvj0fgJvgFAAo8QeIMPXtdLaiuKjxBl91O0G43vSoZnk8cGHTy/QBlMWiB+J
	YRk7UzGDmwONKTmepfrJbWW36NEFqEPecCXYBVyw/XaY3WTXJrJk+JNVqt3HlGpY6VlXV957hjF
	aSqA7dWNmNwMesQRWTKFacLR0jCONA6+8x3cuZkkpTyP/d10L7h0QBLybL0nnmbeN5m9gKqN5P+
	IYkxbfzQE7gOfTxgt89HEZ+jiceKH0VRzqmFT4hDBTvqXdy/Bg7WVr8T5/2X7zGwdjM8p1hy+D4
	ZIpaw6HCddaMvIbqZom3DLnNY4saO8rDdugmaS9qZBlu4oN+3B0QQZOC9VTfOHkJO869xLkg=
X-Received: by 2002:a05:6402:a510:20b0:6b4:201f:17b6 with SMTP id
 4fb4d7f45d1cf-6b4d3374079mr7357617a12.6.1793724494588; Tue, 03 Nov 2026
 08:48:14 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101170842.2802301-1-sjg@chromium.org> <aufi88ZmC2cW8f3J@gractus.seuss>
In-Reply-To: <aufi88ZmC2cW8f3J@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 3 Nov 2026 09:48:00 -0700
X-Gm-Features: AclHuK8Q0l0U_YV45b6wIsBLqc39LLNG5ryXkQZ9FxaEt91HtATYTm6Rp6YoVDc
Message-ID: <CAFLszTjpnJ=9zA==YW9furbqdNL75Q6bG3OfDMHpYVVhsK8KbA@mail.gmail.com>
Subject: Re: [PATCH] tests: Allow dtc-fatal.sh to check the error message
To: sjg@chromium.org
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

On 2026-11-01T17:08:33, Simon Glass <sjg@chromium.org> wrote:
> tests: Allow dtc-fatal.sh to check the error message
>
> dtc-fatal.sh only checks that dtc exits with status 1, so a test which
> expects a particular error passes just as well if dtc fails for some
> other reason, such as a mistake in the test's dts file.
>
> Add a -m option which also checks that dtc's output contains a given
> message, and use it in each test which runs dtc-fatal.sh. Unlike
> run_wrap_error_msg_test, this runs dtc under valgrind when that is
> enabled.
>
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Link: https://lore.kernel.org/devicetree-compiler/20261029093115.3647778-2-sjg@chromium.org/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
>
>  tests/dtc-fatal.sh | 18 +++++++++++++++++-
>  tests/run_tests.sh | 16 +++++++++++-----
>  2 files changed, 28 insertions(+), 6 deletions(-)

Applied to main.

tests: Allow dtc-fatal.sh to check the error message
      697f3c7c5078

Regards,
Simon
