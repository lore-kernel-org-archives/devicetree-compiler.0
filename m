Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364635;
	b=5oAHL3MSnysjBRjYtnBstr5Mba8ECeqNNnQFYkUSUQA4VBW2ngwB14yvOuk5Ak4fqStp
	 VtqGjNHnEmjvv4JZX9YeZnp8CTBfImnxAxMVBAVoJg4QVwWQS8jpf1HP86Qx0Y+KOzzmt
	 /13Uzaaz6VoNGS8p133KfFI9Txv4rOMjQcNieuAGBWX/hJXX3MJMc8BveX5cAyuZH/U7S
	 OnjivphLM/ee7QKZWNfPu86cXcHF/uXnXySg9S/43moxoS+xjykh14FpGXb9a+SMlIOF3
	 NpTCKF7DDyByFWjnaKWAaOl8CxAOjq+J8PdT2TJWVtfCHfn1EgMhXPufw8JqRHbw1UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=Vmtd7JJoFGhykDhF0G/LsCU5RDkiJvwQnc8PEHADvFQ=;
	b=0ij1rivFjPVVnplbAsHs14HrY3qvQ8B76jHelCbt+YmRgWZIr6EzyD8j21wAOXdLF3Yz
	 73kPxKZMYWZ84GVA9VGBfwNVhEJ9lxVGwJV6UoHsc65WnJeKXRRFHnIh9QiuygW7OXsOQ
	 hDRkyX7hwa2Qj6bCKFA62hvQkNAFhWfMPSJkYttrtsTKkQQWoh3JpcN3mCLv9Xrd7BGH3
	 gIT6rAe0GT5RobeSsNuiWeADu6pd1RNwduatcFecUaq4AZU8K2uunOH3Ye1HuPb4GjSn/
	 umniBD2JUEy9PbK/CB43zDqTbZ73MT7G4PW3Hjed4Oclh7JcqvC9vEyhXA5HwsVAoIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SXJZT+d+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C209D606A31D
	for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 12:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C209D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SXJZT+d+
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so983853a12.3
        for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 05:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364633; cv=none;
        d=google.com; s=arc-20260327;
        b=AoZN+0C8wnX3bPU0ls++bp/x+0Sl89fasjpwIxPvTW/cCvOY/NrVv75lzOojDcY30L
         P9leymDXuX2JmF/m9sFZH8P3E9SvBq9k+8X8hFwBu7RrbSxG8/1WOYQ79gTun7qBr1Qy
         wRFeOAqlPlMzAe/GzoP3hZXwNAptPfB3etO5UnhJvdNdiZbD6stjMCUOFboYUlX0bZOH
         nsJz1tqr6RGkbdCDOQ8k4YYJsFqlnLeWETPMgQ13qoMU4+LJFN0z/yKCTEQi93+MinLf
         mhgOCY3+zOkuQ9FSAKYoRpf0migAY74DM6UQfY6v3Jtbctt8iVXvDEoIaByI/sDrbx13
         xD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=Vmtd7JJoFGhykDhF0G/LsCU5RDkiJvwQnc8PEHADvFQ=;
        fh=v0GCJqyoWGhL0bL1BD0oUO+DkJ2nkPH0tE1OsgHyX7k=;
        b=cBj35gGvVlgLz+GDomj2R3h4G9SIA3rE2MDPN3RVCyjXcOZysfIZ77qfUy1hgZ9TPY
         s4i1PnmMnAU2OEbc2P5dmFS0WclIMrormV1oJH/b19gnwz2/E1rkWpQA65mMFG4Uahls
         chbcPU/GEhVw+JuYGqauuJtC/F7CVzL3AkJZSQO6t7wiMnhsFu21/hKbdjxEX3sk+c7X
         LYmr1Wd286jQxtfQa15upm3nduCG525lfCy4L3XJkBD4JHQfUuFET7CYrH+NZ2ZiWJKh
         VMvop01dYORbA14JyTbQwezRKHE/tRLRq4emQ0Xsj17NNEEKcAl5+hkFAfm3r3MtFkjC
         RRDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364633; x=1793969433; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vmtd7JJoFGhykDhF0G/LsCU5RDkiJvwQnc8PEHADvFQ=;
        b=SXJZT+d+uaZZlF2rPrHT207P6kfJJZJDSd9/kfAJXowTchpwxDZ0iBAXspx9nhSLaN
         apKyQNznXrHhOYlHZ7DXhJ9tZ0plN9oQvAm+L7t9xu7p4NjfWcf7Zk+KXrakZhLyh0ar
         MAWkgS75WsxOLYHjTALeuDP8TEDTDnUiBGQyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364633; x=1793969433;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vmtd7JJoFGhykDhF0G/LsCU5RDkiJvwQnc8PEHADvFQ=;
        b=lZEK6nzOWTAOUblApKmUPWs/gJ922P4UcYk6oMCGHSgAmS8N6zqTT7KcE4ZLCmbfVx
         5dX9sOCWKtVQKIb4fFfPS84EYkhjUx7scssFkotuNXqvbSYtEWQezxUdQEHsRm+vBpmn
         kfH5G8YC3dXY7MjGTFhCtN1tjcMUSbbw8v/mu1v8r/DCALxq4sScrWzmqv9qQn9tij6A
         +uuKyR0u01KsEoEDPe4joMlCh8xkzHBLGK+g9MgNmsfV2UYix4CqmiL7hi+Y6mpkLIeF
         +0kAFk8Ib6WSquzWQzxJ+Wc0ts7chkQDuMttOObSdJFGb1zGW2KAa2P7SMaANMSqOII/
         LZNQ==
X-Gm-Message-State: AFq9FYJh3iJ4nO/O+vH01ytTZVqovCp84nFmuSoCqnVBxW2XXZTUmBvX
	26dO6AXvXKn4pRxnrCvFGBPUks3339Kr6zX+/+zx0Fc0x5Kpoebd97zGzo+VXlwclQJ1S1eNbKa
	f07za49aOc0yne6k7Ych+hWsOBT0yoOlnhjljaOAO
X-Gm-Gg: AYBFou360uVgY8Sf2Cw9kHTKzdlggzL2unc+jmgMEMsJdGMiHpm7+Jq7G9ALbqHzMfB
	12prhLPrvK+yoHWqCPYSvlDd4ltic0kjx5HGXOOJIfhZd7JuOkXKqf4JbW5JTOdc4HYIlwAiUxl
	5H4FyPtJ8tusXK+qPn6gOP/dUUCc0ax043VrPHumf+CXkErBcADq/tfwIKfHK9To5cT99O6AtAC
	WemI4/gqFaJsnqO8QRXqmiFjwLEoTuzzUsuuyYgdPt56h7IEW9tYsFEwipZMo7SE5aQfJO9HhoY
	1dOAV3GbxjR5DE84/Ov+v4/J1/y0luy3guhPxxKG2G2/o90TlBnxVpaJSkOC0UNyBLhbCQ0E70+
	xpQSpH0BmRrZ952Hr1uwH4mcvWQt9MKP6hpMSlk1ryt+x/fMGUo/M2YtfpqSwmdaukTL978E=
X-Received: by 2002:a05:6402:c2d6:b0:6b1:ef5a:6720 with SMTP id
 4fb4d7f45d1cf-6b4d497c52dmr1137228a12.16.1793364633266; Fri, 30 Oct 2026
 05:50:33 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:31 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:41 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-9-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-9-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:31 -0700
X-Gm-Features: AclHuK_Ix-y3tb_fdHHUHOXuGJaiv5uFLJy8cMpdGuMAdrZfprBlED_NL9u2V2s
Message-ID: <CAFLszThZs9Qx6c_qff4LUXPNpncUAO7LGygkyv6FRtGcxU88xg@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] fdtfactor: Add -S/--strip-local-fixups option
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add -S/--strip-local-fixups option
>
> By default, `fdtfactor` preserves `/__local_fixups__` on `base.dtb` so
> that when `fdt_overlay_apply()` merges a `.dtbo` overlay, the
> reconstructed device tree retains full `/__local_fixups__` information
> (for instance, if an OS kernel wants to know which property cells
> contain phandles at runtime).
>
> When `-L` was passed to `dtc` solely to help `fdtfactor` locate phandle
> cells at build time and `/__local_fixups__` is not needed at runtime,
> retaining `/__local_fixups__` in `base.dtb` wastes space.
>
> Add `-S` / `--strip-local-fixups` to omit `/__local_fixups__` from
> `base.dtb` (and therefore from the merged device trees produced by
> `fdt_overlay_apply()`). On a set of 47 Qualcomm SC7180 Trogdor
> Chromebook board DTBs, `fdtfactor -S` reduces total uncompressed size
> from 7.69 MB to 634 KB (91.8% savings).

This compares against the unfactored DTBs, so it doesn't show what -S
itself saves. Please can you also give the size without -S, so it is
clear what the /__local_fixups__ in base.dtb costs?

>
> Add a test case in `tests/run_tests.sh` verifying that `fdtfactor -S`
> followed by `fdtoverlay` reproduces DTBs compiled with `-@` (without
> [...]
>
>  README.md          |  9 +++++++++
>  fdtfactor          | 34 ++++++++++++++++++++++++++--------
>  tests/run_tests.sh | 22 ++++++++++++++++++++++
>  3 files changed, 57 insertions(+), 8 deletions(-)

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> @@ -1234,6 +1234,28 @@ fdtfactor_tests () {
> +    # Strip local fixups (-S): verify that merged DTBs match DTBs compiled
> +    # with -@ (without -L), and that inputs lacking /__local_fixups__ are
> +    # rejected.
> +    for i in 1 2 3; do
> +	run_dtc_test -b 2 -@ -I dts -O dtb -o fdtfactor_board${i}.nolf.test.dtb \
> +	    "$SRCDIR/fdtfactor_board${i}.dts"
> +    done
> +    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_strip.test.dir \
> +	fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb

This rejection test has no -S, so it checks the -L requirement from
the previous patch rather than anything added here. Since -S could
easily be read as 'my inputs don't need -L', I think it is more useful
to pass -S here, to show that it does not relax that requirement. The
plain no-S case could then go into the previous patch with the other
rejection tests.

Regards,
Simon
