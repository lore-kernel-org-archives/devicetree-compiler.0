Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028664;
	b=b1TfFnta2QNdQE1LkWkSsUS6lK5z1wmkjSJPbBA6ZeBWqYiMkHsicOZlUNJMqNLW+fmB
	 pWMdfAZznzjs2B3M7VDFwjYFC+bFsimVoSA7z70yZQ+tiyKSkLaCHQQYBi+XoUoJqiF9s
	 YTlYpCNukryjS85jLNSW48J4dE9lr0dOZihaPgCjwqvmw2Qnevv0fmarOc110pMkEuzxV
	 d5sp/5IFgNl2E0zJWNGgCpVscIh+v4cFvwgYmUJm1KLH2EHsGn3G+Gt4JvZF9IfjiO1BY
	 vLeRiKezVzG6yxCfH4bn4HCTasfrhOAMWlyBS8dZLUOWHPahBrw9Hals91/ygq/+8DA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=e0KtBigF7UvCI2ryoJ1gV+l9mkYBR8ADXnTrlQIGx8w=;
	b=HVX8agD5ZWgpT2bAF1NeeHmkFOOXtVlfHvM0+LnqR6zlkIUM5nHG24gwussUHeab/GvZ
	 M+ll/SdE1Iwai4vfhkcjlMoX6fj6GWWaZ6VQJ0UUcOF9gP+cLoM5Qswc6saAiuxglkMjW
	 zS81mdL1u2kNrK8robpMP8i81OSfq6X4BFcJ4wp1ZtYUVH4Hh6mMI6AoXDND1dzh/jP0S
	 63qVJm4Lhf5C0bs6bW3P9zmEtnWKBsrOIiRpGYMqAwJvtmOgFH6nrfCBpcxHzNITx8NCg
	 O6hab2iq5CroXv/X3t2/Sj7KmvlW6ar29iomxOeVNNNx5G4mjD48mQtH7KqXb4miflA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mDd8v4IT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B537606A320
	for <Devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 15:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B537606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mDd8v4IT
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso4831209a12.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 08:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028661; cv=none;
        d=google.com; s=arc-20260327;
        b=UCY3WWC8+1pCHFJEserbtwBSKv9yNd/hzJ/YTvKBgkDh/eGlh/glIyA5Qh05hY59J5
         aThgMvfbeK9i8nx0gVsTEIcbNXIAUqZBzZIPdXJaBqjz/Di0Au0yct+UyNXqXV0tkZTI
         tQYKzOtOTjCE8grWOSgfZoZVqyFtKkdxCqhcXLKJXxP7SkaQgLOap1zdsiI+4YmvHrvW
         zZ5H+O1RsNWstFIt5w02bg1Rdx96yPVZ7MazNCWUVpvu2V6uOv1XijJJT60LD7J0x7OT
         b1Xs/LW2ouvtCGeyKUGyWOu5/tLuSWJkq7EFzP/gRN+8/+e1jr8u6rp/GbagmPDSGbD6
         /Otg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=e0KtBigF7UvCI2ryoJ1gV+l9mkYBR8ADXnTrlQIGx8w=;
        fh=Nq2BAfzd3ZF5/5+yPYbxtIEuy5nctXJRFjgZ0JuXri0=;
        b=PGPESqN5uVET5a07WjQlYuhtuL87y4PDvvQvYB+VqMYNk4N+3TGE85TyQK2eDlHpLh
         NuueGNsuMH3rp8G7zGckYz/EtzZtHYKwoEcZ8fKpd+pRIu2biggj8/sKY0iNfNhacCIz
         Iv52MR3SPzdDQFSkOicuoiYRQASxEEPh5vw+PFsBXVltRDtzZkiqV6+7LfCRGTyaXmVR
         e3d8VaweWhuqn5nBiYMOOXf3+vBn8QuC7MZuLZYn+iuJSMVkBiYZqCTO4zfB1WUfEZIo
         7jRJR2KMRwAyP6MNZq4v+oxs7TGiL9Bwk4iU8wtmuPDwaW43Ls9KcRFelpTUf6PU8q7/
         Xgnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793028661; x=1793633461; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e0KtBigF7UvCI2ryoJ1gV+l9mkYBR8ADXnTrlQIGx8w=;
        b=mDd8v4IT6VFBAIB7TtOKg2pYotKeCNNkjmBYZR185vQbjGNR1IxvPRkjDaqYUMCfNh
         UTdZA8GuWilc5PfjzMO7rAb4T5MHm5Qws7m1B7Km4/Zg5kenF93kqnANUK7N3Cci5nwV
         P4fV6Wd4U6YQUkUU3DhmMDlOODa8K68ubRgeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028661; x=1793633461;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e0KtBigF7UvCI2ryoJ1gV+l9mkYBR8ADXnTrlQIGx8w=;
        b=OC76dNnvJASHpKkqRp6HX/Y7uBag2HnXDf/AWWWCkKCPdR7nzpGrJjCBEu0IT/3/40
         sZ2ZNzse2OjIUQIq0Pzs4EKlv4O9Mg6dxS6xIRTYymjkrSWMlKhgpM1+ZXQK9xTTdtFj
         0D02nMVFFu70Giz24yf0gjE/6ptrujiX33ixddtgZqNYPVJHPJDAPTjvR2JWHgABxKve
         i84BkTkSL5GQP4ACwqamFwjAjuxF9H/abUhd7Wgl9NTN3ZZ9pcJocjX1DG6Yn3yWgiql
         aMWHRfOMzr7+MZqR0+AOCHU9FAb05Q9ys3iUjEwbXAHj3BNi979wT2rMNYE2kADtkuQd
         cGrg==
X-Gm-Message-State: AFq9FYJc8vj6WPEugnhMQZ1Em2/HCwrwSPF1NdPX2NZWqM2slxg7IFGB
	4w1wmjEdbLVX6SkbccUjIpdqxB726ks0rG77+kA2puWWPhBY/BV5TVRWssSMSHvISzVgDH35fBn
	HsqEill7OOJYodlI84OHYmBpGibjj3LwTBKwU7rpA
X-Gm-Gg: AYBFou0WiU9MKLEJ9JI7JR7470R4TsE8ydK9niZPMMpVy6Bd17Ug3EEgmyTDQXtu3RU
	A2g/tFgv97sWGnHo+1LWzME+piCwamQJOV+AmPbVaysBDkheypOhSk0k7jIaDOQ7S9fRxlAmsFV
	IVeZLGS7GK60Fv+cskD23sae9McXPc0KIPiq1omLBAkSEy2c1kpX+ZnRzw4n94khDPWAHUpFHsP
	HP8JIuA5McrCvVyJ/rLe5FTEyLEyLelzhemAjYLvbdmCnt7aac8gr00J4VZCxX1fQ9P971lGJaR
	m+yxd6Y/GmqQakewz20/bmIG/xf6w+ptGOHkDNIGc52Ei8IblXI/6m7iF7VDyygkBcKHuUe5hB7
	uaw6AYMlB3BEJkVzay6MKBnCUj8iQcywBUU8=
X-Received: by 2002:a05:6402:4013:b0:6b1:ca87:c588 with SMTP id
 4fb4d7f45d1cf-6b443110cddmr8166525a12.37.1793028661578; Mon, 26 Oct 2026
 08:31:01 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 08:30:59 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 07:11:51 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261015182221.2931742-3-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org> <20261015182221.2931742-3-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2026 08:30:58 -0700
X-Gm-Features: AclHuK_nmjXBTCXflkgiPN9ZyiZhrkAUaOG6cYGE-6f8Kez0RNoxM0wmLg5pNsY
Message-ID: <CAFLszTiCTnpbmcGcjE2oWsY1UpyXd=8QFm+uuVBQTLw3-u_pFQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
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
> fdtfactor: Add tool to split DTBs into a base DTB and overlays
>
> When shipping a single firmware or kernel image that supports many
> closely related board variants or SKUs, bundling a full compiled .dtb
> for every variant results in substantial duplication.
>
> Add `fdtfactor`, a Python tool built on `pylibfdt` that takes a set of
> compiled device tree blobs (.dtb) compiled with `-@ -L` (`/__symbols__`
> and `/__local_fixups__`) and splits them into a single common
> `base.dtb` and per-board `.dtbo` overlays:
>
> - Common nodes present across all input DTBs are placed in `base.dtb`,
>   with each common property assigned the value shared by at least two
>   boards that maximizes byte savings across overlays.
> - Using `/__local_fixups__`, phandle references inside property values
>   are normalized to target node paths so common properties referencing
>   common nodes match even when numeric phandles differ across input
>   DTBs.
> - Any common node that carries a phandle in any input DTB receives its
>   phandle in `base.dtb` so overlays only emit `phandle` properties on
> [...]
>
>  Makefile                   |    2 +-
>  README.md                  |   58 +++
>  fdtfactor                  | 1218 ++++++++++++++++++++++++++++++++++++++++++++
>  meson.build                |    1 +
>  tests/Makefile.tests       |    2 +-
>  tests/fdtfactor_board1.dts |   69 +++
>  tests/fdtfactor_board2.dts |   73 +++
>  tests/fdtfactor_board3.dts |   96 ++++
>  tests/run_tests.sh         |   61 ++-
>  tests/testutils.sh         |    1 +
>  10 files changed, 1578 insertions(+), 3 deletions(-)

> diff --git a/fdtfactor b/fdtfactor
> @@ -11,31 +11,195 @@ original device tree.
> +    if comp == 'xz':
> +        return lzma.compress(raw_bytes, format=lzma.FORMAT_XZ)

Python's default integrity check for FORMAT_XZ is CRC64, but embedded
xz decoders often support only CRC32. The kernel's lib/xz is one of
them, which is why scripts/xz_wrap.sh passes --check=crc32 to xz. So a
firmware-friendly .dtb.xz input could produce a .dtbo.xz that the same
firmware cannot read. Please can you pass check=lzma.CHECK_CRC32 here?

> diff --git a/fdtfactor b/fdtfactor
> @@ -1167,20 +1349,24 @@ def factor_dtb_files(args):
>                  d, base_dtb_blob, dtbo_blob, args.strip_local_fixups
>              )
>
> +    base_dtb_file_bytes = compress_blob(base_dtb_blob, base_dtb_comp)

If you keep --verify in the tool (David suggests it belongs in the
test suite), it would be worth running the compressed bytes back
through decompress_blob() and comparing them, since at present only
the uncompressed blobs are checked. That is cheap and would catch a
problem with the lz4 command or the compression options.

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> @@ -1147,6 +1147,36 @@ fdtoverlay_tests() {
> +	    run_wrap_test $PYTHON "$FDTFACTOR" -v --verify \
> +		-b "fdtfactor_base.test.dtb.$ext" \

In these tests the base output always uses the same compression as the
inputs, and the input extension always matches the file contents. Two
extra cases would be good, perhaps as a follow-up: a compressed blob
in a plain '.dtb' file (to exercise the magic-byte detection) and, if
-b stays, an uncompressed -b alongside compressed inputs.

Regards,
Simon
