Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0A1AE85B
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940318; cv=none; b=m031lJSAFRhZoRtrexAZnqR029q78q2Dbhsu04+NnOwUdPb1T3sJUv8pS/aBg3vmHS9txsNjHm4doJaCn6qUGZoRw/o+l9RWLYbO57AvPESqUorqht/LCcKGWYTU7pbEzk+Q0jx70ZONVpplaPXfOQiF9KPXSUlaRR2tUynZcnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940318; c=relaxed/simple;
	bh=Om3d4QZ9vBJXvICLmJWzFR1PWqgWc6zO1YnD5W74RAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWcHyHDYhkPt3RTe4zW3M60K123LEC0LJdox+2frKYs1y8JgJlqebZ/zJbKNHrs1eaE2GCDL/6zcE7qHn6akCwvjKIUsBoeDJhqlK2wWjuPioaPg/6ILk8RJhqD7McqEDnx4fmLvxk94JVj/wnevrp/zuSYF+Yc2athZ7makNLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NYJD98eo; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NYJD98eo"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d679b094ffso500813a91.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724940317; x=1725545117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rfSErDc3Wz27cDSjz0Id4GZ7l1eO8dxOTd9lFoqZETw=;
        b=NYJD98eogBWeggXU37C9rf72UogQYzaJvK1Qj/Kx5Mz7YrmiDJfYvrUCbIDxV6Es4y
         7wCUAd4pliQtAq2uPu+HrJYujD6+bNk8dX6kMb42rRIl2dJ9ewopxHFeVVm1MraGwXLW
         4HeNwYj0mS8wFohfNKGCZJe30f9I9IWkvny3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724940317; x=1725545117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfSErDc3Wz27cDSjz0Id4GZ7l1eO8dxOTd9lFoqZETw=;
        b=d1++uWBbR3F4eko36ox+DaFM0YhJNEbaLvoBZRJiOS3jz7W6shd2t6MHb6YYgPqQhQ
         uLKfOHbW+g5RLJ8vaY/6uS07WlD60aLEClhS4NBllQUO8HGK+NCJmRE8ynhHbhoPHk/g
         Z591QYA3yuGMQrTjXOjn+5N60gUxxEcjd+0iNZMtIsAwjmXZxgZBcl3l/78KiKOV+aTa
         pPV/Tct4UXKIRZea3VGVHykuAvRUO/osp+4+A1f5CEZz/gTz64CeExbHujnYia3J3Pau
         J6ZoTkYGsTTDBLYXHCu/wwl3Yy9zrIiwgUg/LH4umcDG6V7PuZLLh/urPG0tDVXBXlRa
         Prtw==
X-Forwarded-Encrypted: i=1; AJvYcCWrVYE2o4kfS29i01Y/suMzOvY6AazWDDHdxIBqkV93Rdkk7K05NZWAZIg/6LKPaS7WecPEFSZbWIVft0mymlA+QNUh@vger.kernel.org
X-Gm-Message-State: AOJu0YxEAsMEHELpoQFi3l4YBau5C1ZHoZNAlJvK0byqAfl67Jvja2P6
	kAmGV9jFwZHmFBvKa7ySVX4JfQR8Du+/JC4pWlYfo3xuSDD0xO8nICRazBh7w/SB9oTmU45/Xqm
	YasD2j/kWlLMZ5Twbf32UTfk41uDklwRGjVCl
X-Google-Smtp-Source: AGHT+IHV/dQ2WoTkLZow+iFk3bd9gh+xZO6AaIK+/QhqYEjLppXTu9dPHZ2vhF4Fk+ojjjQXBCIuTRhySUhdrOhedSA=
X-Received: by 2002:a17:90a:5a84:b0:2cb:5112:740 with SMTP id
 98e67ed59e1d1-2d85639e15cmr2964292a91.26.1724940316465; Thu, 29 Aug 2024
 07:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827-append-v1-0-d7a126ef1be3@beagleboard.org> <20240827-append-v1-2-d7a126ef1be3@beagleboard.org>
In-Reply-To: <20240827-append-v1-2-d7a126ef1be3@beagleboard.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Aug 2024 08:04:57 -0600
Message-ID: <CAFLszTi6vjLqVe5ZhMOz+=a4SuYHabrRBKDH5yJk2+-Y7ui0mA@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests: Add test for append-property
To: Ayush Singh <ayush@beagleboard.org>
Cc: lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
	Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ayush,

On Tue, 27 Aug 2024 at 11:55, Ayush Singh <ayush@beagleboard.org> wrote:
>
> Simple test to build a device tree with /append-property/.
>
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  tests/run_tests.sh          |  3 +++
>  tests/test_tree1_append.dts | 21 +++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 937b128..ac0dc05 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -708,6 +708,9 @@ dtc_tests () {
>      run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb "$SRCDIR/test_tree1_delete.dts"
>      tree1_tests dtc_tree1_delete.test.dtb
>
> +    # Check prop append functionality
> +    run_dtc_test -I dts -O dtb -o dtc_tree1_append.test.dtb "$SRCDIR/test_tree1_append.dts"
> +

How does this check that something actually happened? From your cover
letter, it seems that you might send a v2, but I'm just checking?

>      # Check omit-if-no-ref functionality
>      run_dtc_test -I dts -O dtb -o omit-no-ref.test.dtb "$SRCDIR/omit-no-ref.dts"
>      run_test check_path omit-no-ref.test.dtb not-exists "/node1"
> diff --git a/tests/test_tree1_append.dts b/tests/test_tree1_append.dts
> new file mode 100644
> index 0000000..953095d
> --- /dev/null
> +++ b/tests/test_tree1_append.dts
> @@ -0,0 +1,21 @@
> +/dts-v1/;
> +
> +/include/ "test_tree1.dts"
> +
> +/ {
> +       nonexistant-property = <0x00000000>;
> +
> +       subnode@1 {
> +               sub-prop = <0>;
> +               str-prop = "0";
> +       };
> +};
> +
> +/ {
> +       /append-property/ nonexistant-property = <0x00000001 0x00000002>;
> +
> +       subnode@1 {
> +               /append-property/ sub-prop = <1 2>;
> +               /append-property/ str-prop = "1", "2";
> +  };
> +};
>
> --
> 2.46.0
>
>

Regards,
Simon
