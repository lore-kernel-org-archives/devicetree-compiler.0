Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028666;
	b=nwI3B3RjNMIAEtQLgdnsymf62aNeVZxJX6eYO5uTfHEp2VJIaM0MfkTJkRnLKI/JUDcM
	 oMilYXHPzOfJbnlkEqpCjyn0SoOI9rk/3mnNMp7EHwM0cD+vJ7xDlQF3cl7Llgk+ddg9h
	 xgF7BnRsB2nBFqTOnW0J8E2f0W+iH0yQRPFJkZqOS1SuCLksZyMQBYGRtxF36RGmfnHQh
	 ZOS0vvYUW5hblruZKGyLuw++e0leoYCr8xS/FwLsblPICSa1pWQIQd4Snvy9xZ3Am+TXP
	 bH+vvhKMbFHYV3ZQA7/7n2Ddu/sY6jaIFRi9yC9otoP8xk8AcKlVvYab9H+TBImz2tA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=IpCrhhdrQggWiZdXpuqOx7Kbrnng8aqJZmk22MF4PNA=;
	b=wGlwP0gfS+3ZI7vbWKlurr1bS+At9CiZQ1BiSCRZX/9QFTqHpbZ36KX06wRrCty6Hp2w
	 jt2Y+uIFpT6TP71m+n3zMrE/GfPmgaG5mvgRx6kAohbd1tf0uF6zbVj9sH2Dafvz9MGN2
	 dIHLJVFrw4P2R1CYDpnxOqP7gmQnC2Sc8bnQdrO1xCEsLBmF9f6vdAY/R/KNQq7PvTasj
	 rjcCh3rzlxHHvhksvat+5ECIeaeQ43kSLl4YtzjrM6ZBMEXT0V4Z3Jb9YX74wPpGVylu1
	 RGfp/I9ugQOSEBcqIsu35g3cdSoObH6of3RjoqQizJPtfg8sB142z0S4Hpyp1xei2SQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Za13/Bq8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E042F606A32D
	for <Devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 15:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E042F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Za13/Bq8
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so6188164a12.1
        for <Devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 08:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028664; cv=none;
        d=google.com; s=arc-20260327;
        b=Rw7zTcD8Ir+TIwIKsz6m4U/lHc+RMte8Fsefw4TVvgNekcsu4JqcX2txucua7j8lTf
         ejOhJgtpEgMXM14Tsn0P3bzMOrUj0fFVVjlG6MkFt33GjAbSoilwGPPDgnusrxA5uN95
         EAA5j9UQIuUTGfJI732DeJxeG3MqoEm5WbfyL20O//tQKkWdS63SMozSLpbODGBhrZkZ
         80eANEusFzXFHqcW8SclKH9FcF4wJNPFT9NRgdONDasDhMVQUIZqhAWPMf1MQ8ScMnQt
         pcNKP1UZfLX+aflKC12+/Ky5QqK8EHF1SUXvrt2KhTAWgrILIb7ekuUsU8V9Rxfgj06c
         ITiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=IpCrhhdrQggWiZdXpuqOx7Kbrnng8aqJZmk22MF4PNA=;
        fh=Nq2BAfzd3ZF5/5+yPYbxtIEuy5nctXJRFjgZ0JuXri0=;
        b=VnWmLzG8qquLY0D0JCl0u34bAoS8TBIVL2uEfwdDi1/eqU6QiFsLVrDIP1jMlzLJ1e
         fhEP1DErX5dtC87L7CvtDNspbVFFQPTPlOeBn2+BKBPPQs1qcY0t3kMTwq49k0ITjULK
         VmY3Lgs7X6cgoOEruwjbPyMI74cvEBQ/jpSZeHsVk/Bmq1Q8d7YtTzIImJkNd04JWCoQ
         pAN5QfStVleNJZLrkOagvP37cL6h7rVhtl5yfD8E0CR33+PwLe4Nqdimy4QkalwMw64A
         GBF4Fz58GEsuBHw8CqEBluI51Pt8857JdOf968Jkymdi3aFlZHqzeXH2creg7EtOCbwf
         CeUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793028664; x=1793633464; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IpCrhhdrQggWiZdXpuqOx7Kbrnng8aqJZmk22MF4PNA=;
        b=Za13/Bq8Yi/UnFcjNR5tbGFu6kj19LhC3A9gx1tmwCDExrLmn1zErs+eDYhHxp9+j5
         3j5JlknAT+0EZg6ehVMZjvqzpyyq+PC3nAmWP4Ze3hXIDLwFkM6PwYR5T2jAAFq+tlNd
         br/Buw7D5rWdgMJaHj1hlo4Y0RHJs1g224bkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028664; x=1793633464;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IpCrhhdrQggWiZdXpuqOx7Kbrnng8aqJZmk22MF4PNA=;
        b=MEgodgY4tepwHU13z9jDApnC5P7T0WtSPF3BmFhEvOsHSejo9KKea0JGNr2W2CeQjT
         XYNzIUDBzty0yxyYG32ujfzOoKxe1FA13t8/JD/w16D++12vLA1CpmQeqfwwbBERhIm0
         j6xZLn01AFIwehlNd/+XhwmVF4SvIao4XinBYz5Rtn2/tyei74zE+qgtYdg0V18H5HdH
         LqilCehix4Vk9B777hYPoRXQ5m71b1q8T5j8XuaO2GL1vxDpcVuX6dvzK9rXK+wdAzoY
         b1C2MHWpAGTNYUXl+0bQ1Cv/1YJG4Zy3EIH3z99xZCvRb9HFkVSLiQiH6G8XP36rpbEf
         uCvQ==
X-Gm-Message-State: AFq9FYLgWOqLt4Egsg57WGG5FR77fvsNFvyBNgX23SLr4zyPNXtfB2fG
	sEelklKdggbynLIL25cIW5EG9kYYoiybZ8Azby+JsOGiFdFrL1MRF7x/IUOTv6Sq+58tyInAiIy
	F9wnOHh2u7Trl2es4qdAhX1TUmuBMgRj4kRzNE6NW9y4m0bGBxwZUew==
X-Gm-Gg: AYBFou0AKx32oRxJqBY4cYo9s8xauB7rCqXezchaxpybnJ9jHPvVOjzDkvVpntv8JCI
	uVVqwJNhnHhesIx6W/ieL4SUplrV+ezFrEYgzUA6HauQDdoMRCb3XCz4Yu71nDlienjjLXLN8RL
	Hx4Bw5ik9rXgq23lwbHsF4Na/6tp+SAMiX9kA2yy44cVjKrXOOfWYuID48zqgrPcirhWbE+DV6n
	B8wU4xYURFX8i7mOzMkBY7Eb9J+czXk3dgbsx2jUuZSqmLnrdX7ZUS58OKy0DV8wCn9xD8wZFlA
	+Bsmb4i6m2x8lNKqPiyOyFNuKgMDGhc/t0YnWE3KW+tTy/QybWYXBZxgXSDl6Ou0n2AgKKJ7GCX
	7tJemwhl4SRMwx6BDcTm1NzzXx3QbHXN8YHo=
X-Received: by 2002:a05:6402:1356:b0:6b1:8316:ba32 with SMTP id
 4fb4d7f45d1cf-6b442ff2d2bmr5868656a12.17.1793028664145; Mon, 26 Oct 2026
 08:31:04 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 08:31:01 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 07:12:00 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261015182221.2931742-4-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org> <20261015182221.2931742-4-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2026 08:31:01 -0700
X-Gm-Features: AclHuK_hy_WTcUcfTQINhQj2aXPqXOcXmBmhHpzgXfBxsWcmA5gscgp9ZGWx9GE
Message-ID: <CAFLszTi-j8HmVy8u3gtH-6YCigakX5CNeqZ9sVc5ksn7q3NxaQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] fdtfactor: Support compressed DTB inputs and outputs
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-15T18:21:33, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Support compressed DTB inputs and outputs
>
> Firmware and FIT image build pipelines frequently store device tree
> blobs compressed with LZ4, LZMA/XZ, or gzip (e.g., `.dtb.lz4`).
>
> Extend `fdtfactor` to detect compressed input blobs by magic bytes or
> file extension, transparently decompress them before factoring, and
> compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:
>
> - Support `.lz4` (via the `lz4` CLI), `.lzma`/`.xz` (via Python's
>   `lzma` module), and `.gz` (via Python's `gzip` module).
> - Preserve the input compression format on generated `.dtbo` files and
>   compress `base.dtb` when its output path carries a compression suffix
>   (e.g., `-b base.dtb.lz4`).
> - Report compressed size savings alongside uncompressed savings when
>   `-v`/`--verbose` is specified.
>
> On the 47 Qualcomm SC7180 Trogdor Chromebook `.dtb.lz4` files,
> `fdtfactor -S` reduces total LZ4-compressed size from 1.71 MB to 213 KB
> (87.5% savings).
> [...]
>
>  README.md            |  16 +--
>  fdtfactor            | 267 +++++++++++++++++++++++++++++++++++++++++++++------
>  tests/Makefile.tests |   5 +-
>  tests/run_tests.sh   |  34 ++++++-
>  4 files changed, 284 insertions(+), 38 deletions(-)

David is leaving this patch until patch 2 has been reworked, so these
are just two things to carry into the next version.

> diff --git a/fdtfactor b/fdtfactor
> @@ -11,31 +11,195 @@ original device tree.
> +LZ4_MAGIC = b'\x04\x22\x4d\x18'
> +LZ4_LEGACY_MAGIC = b'\x02\x21\x4c\x18'

Legacy lz4 input is detected here, but compress_blob() always runs
'lz4 -12 -z', which writes the frame format. So a legacy-format
board.dtb.lz4 comes out as a frame-format board.dtbo.lz4. I checked:
'lz4 -l -9' output starts with 02 21 4c 18, while the compress_blob()
command gives 04 22 4d 18. The kernel's cmd_lz4 uses 'lz4 -l', and
lib/decompress_unlz4.c only accepts the legacy format. So a consumer
that handles only one of the two formats cannot read the result. This
doesn't match 'Preserve the input compression format' in the commit
message. Please can you track legacy as its own compression type (and
pass -l when compressing), or else reject legacy input?

> +def decompress_blob(raw_bytes, filename='', comp=None):
...
> +    if comp == 'lz4':
> +        try:
> +            res = subprocess.run(
> +                ['lz4', '-d', '-q', '-c'],
> +                input=raw_bytes,
> +                capture_output=True,
> +                check=False,
> +            )
> +        except FileNotFoundError as exc:
> +            raise RuntimeError(
> +                'lz4 command not found; install lz4 to process .lz4 files'
> +            ) from exc

compress_blob() repeats this block almost exactly, so it should be in
a helper. If the helper takes the filename, compression errors can
also say which file failed.

Regards,
Simon
