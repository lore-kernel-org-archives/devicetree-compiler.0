Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364628;
	b=R2XtOQHGVgU5wI+dtWouLOu/ATSODd+yGhd16Tfaofvw0YBSxt9yGisVAs6IrJoaibmR
	 7+8YatV1fat8PTlfd7HzuBnKOSmy9LW54EoEdQWcukeNa7kbmuynKH0Z6wT1sn/O6exV6
	 kx4DBfzG+xtgU7Y/pVz69cDY/ulyWozoJOUSK7DIYdYPMdVnVOBRbvl3IUyr4KO4/KK7E
	 2DL0GQxIb6KwG6E+/ZN7Y85EdA1nr6T2PZj/EI95q8lT31qDKu0v+gEgYN0jepDQjJenN
	 4yoBqI5k/TGZMjZCs1KuVL82iVqlyLrMHZ+ZiseqpvgLF4wYC9oLe+nMDmd98fDROTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=MWgaFQdz84PZ77In42V5nEZI1f8wkYnG4LxFEebl6QI=;
	b=g41ZjAxjjBrWu+oeDuXnN3yxyxBvW/UeT5aBGDlzGsXc2CNtDqexrUIOfjX0owOaTEG5
	 eEWy9KyYi3bm60COyLBMztmsVMk3CnOaRVej2idPDWXMxDdxTLuqpxs3tjKJWOAdzbiYF
	 dFUvz7Gm/rYsdW3lRdWZ3VgdHn3B0im+27t7ibMbHfyfLXzFq9uNpt9yn+N2wPX0DJ4KW
	 TgYIjfpivmKiPdGXYpnv78yzhvkB5oGYekZrECfBh5XB/so4AuEp8Ev2wCCBK3H0f44CS
	 wOpwmSlP68/R4RREqSlQH8VkLcd1pu6kmEv6SghtMV8lpg3Z3uGN4AEK6bF+StyKysg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y6yM4Ygh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C760A2607
	for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 12:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E97C760A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y6yM4Ygh
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b45f9ec1ceso709469a12.2
        for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 05:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364626; cv=none;
        d=google.com; s=arc-20260327;
        b=LG/gLBoimLdCIrlHuzmGIOmXzRXAN56xD6dRlE/bPdHgwSojwlQgxIoYFO5yqWMaAc
         u5DUUGCDUY+At7uHW7u2iN9TJXGugZRX71N8ifheMAw/3vuW/YsX3qeM6yoH9DCGg4od
         izqE1ATPtROlpdWoo6EIOAxtEsjypppCSYJgNPK9zU45XVmGdX8AK5sFIsFHr9XuPT9s
         uBlwzzVFqk29TvWRMw2jH/I36fKfiQbn+jXabiR730sgfrEsLNhxDJoDfT7S2+Ixw5cD
         kQSTJUM/fyiIOFSnq0Qvo/ScLNEv7fnqkUd2dKvgYaJPJMRNd4q1ZjomqWUQ2LHwOwdK
         Xqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=MWgaFQdz84PZ77In42V5nEZI1f8wkYnG4LxFEebl6QI=;
        fh=v0GCJqyoWGhL0bL1BD0oUO+DkJ2nkPH0tE1OsgHyX7k=;
        b=G3Gr2i4p6uldnsWctjMRNQHsdlbjpE2EJ0gCaYExjI0VLSel2GC/QVRFm7+eJsYBq5
         MrteczCUtY1ys8YgbnUife6gWgT4lhg9qJMAhnucvRxynuq0TDOJ6K95tNWwBaqTFZ6K
         43qO8PXRWwqrygAq5Hmu30HEfeo+/6shrgbRw2T0m8La0OgKtzPfTO31mF5PGllSLx1g
         FQJXtInDddFu5UOdyFe+MVmK9RltuYjY2aVhW9nlwW4m85nz5mMSRhkLsTvtxldBxQUS
         mKvl07qzBsS3FarAbyN3CDCjp38jKo2bDOVJHanbWemccYMeWovOctTJ4mStT5qZfDl6
         5ZZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364626; x=1793969426; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MWgaFQdz84PZ77In42V5nEZI1f8wkYnG4LxFEebl6QI=;
        b=Y6yM4Ygh95EQyk7nS0DTpUwb4geT2z/o4OpZRImZB1ihU07qct1QP7RIZt/KzB2+lc
         PfU0ZeJULUrrU6qgoOqVglqXZYmvOtWZqUPWiwYXjPyeaJRZLs+ZCKdnun/XZ/D3Ey+q
         qET3qyABbYLuIr0PkeCYAzixw2sJPZ68ETzL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364626; x=1793969426;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MWgaFQdz84PZ77In42V5nEZI1f8wkYnG4LxFEebl6QI=;
        b=JRW7DJ65HNVAkPZluwWVTKKCeS1HT3zXvOTVDYBnhpnCYq1mf8pJTDzy8A7njC6RrS
         0Sl5RNIpl8EbAeftGi6aQLuKH4CJGeqEKHM1tLwi/QHEkme86JAmYMdyxQUobQIHIwjG
         c9Eho3kwkFdmzgFL0XIhxRNc86bxqjj8u6iK3TCXT+hGeXEBD+2wV6ywGi1E1ths+Olm
         iWxBgXN+00UvUldNKHUkZQMHlvPKqdZenx1i5bTlcJGtjx+MU37LJ7QhQOZZK2IEDA6f
         xZwImIqggPjTrwFWhrN3exKtzZcujdT5ZgX8DYkukojz1YknRNKmXeePKgTRO1xhxObg
         7yog==
X-Gm-Message-State: AFq9FYI+oTQJKOPbZbfpnhiIm77t3jK4LuSmwfj77a3m1zXEAKc9h7bJ
	RyCz0kfRNf/HXYy9QfxTMqdxNIv7DKKHrsem/C3Ek9+Uaki7c9+QKhC+1D/ONtfJSlpcndjRfXY
	LCTl3qWXkxq8hqVLzhmew6U+q/3ZXbnkV9JJga7kF
X-Gm-Gg: AYBFou3K9srFaH0zxb+FT195u1wEloZwz4/WF1bGg8OiaYe9m1pExIif4i2uSdIKi5s
	KNGGPKtDS4Ke/lnLuwgC/mCT+1VBBa/raSo3zNk26rC6C9q3KYvr7DKS6HCJe7kQTMllgbksv6B
	ZvnJFcghDjEZg0VRPpPzi7nzBa2bXEl49lrDzk9R1zjkIB/yKwCfgK8krLBhXYZGkdfaDnlrdN3
	7291Mj64lqKyPkK+nS2bVSJUz1MDDcCtta7FNcMVwv3iAxbJebY8rchde0N+eXFS1mv0NW3Zm7N
	hJZmsWprdF2cmqi5Tsp+wplzy30P21419GjSwmNtLiT38cjlE+5Uo1j3lBHZasNH3V8h3HocMgK
	G1G7mnm6DWX8x62m3exVPtRMyPl7VufN+BYwbKnFDG3QNmnIj5otp/AchjqLnZCdAUDbEASo=
X-Received: by 2002:a17:906:9fd0:b0:c46:74f6:e149 with SMTP id
 a640c23a62f3a-c4ca7a54f72mr199779866b.16.1793364626163; Fri, 30 Oct 2026
 05:50:26 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:23 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:42:20 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-6-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-6-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:23 -0700
X-Gm-Features: AclHuK-zd-T9RiVPbSUhy4wWMPK5g5MD6u57BPXZqy6Kk8GLjau3Um9JLEY-wic
Message-ID: <CAFLszTjbOnchP71O98H9zTMiPar33Fpxj47uhdTLY_dCegEpmw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment path
 helpers for reuse
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
> libfdt: overlay: Prepare fixup and fragment path helpers for reuse
>
> Clean up `overlay_parse_fixup_entry()` and generalize
> `overlay_split_fragment_path()` in `libfdt/fdt_overlay.c` so both can be
> reused when updating `/__local_fixups__`:
>
> - Change `poffset` from `int` to `uint32_t` in
>   `overlay_fixup_one_phandle()`, `overlay_parse_fixup_entry()`, and
>   `overlay_fixup_phandle()`, and parse into `unsigned long` before
>   validating the range.
> - Require `*(sep + 1)` to be an ASCII digit (`'0'..'9'`) and bound
>   `poffset` to `INT32_MAX - sizeof(uint32_t)` so negative strings (such
>   as `"-4"`), leading whitespace, or large values cannot silently
>   truncate or wrap around in `fdt_setprop_inplace_namelen_partial()`.

This is more than a clean-up: it fixes an existing out-of-bounds write
in fdt_overlay_apply(). With a /__fixups__ entry like
'/fragment@0/__overlay__/node:prop:-4', strtoul() gives -4 as an int,
which reaches fdt_setprop_inplace_namelen_partial() as idx =
0xfffffffc. Then 'len + idx' wraps to 0, the 'proplen < len + idx'
check passes and memcpy() writes 4 bytes before the property value. On
64-bit, '4294967292' does the same. Overlays may well be untrusted, so
please can you split this into its own patch at the start of the
series, with a commit message that starts with the problem so it
doesn't get lost under 'Prepare ... for reuse'?

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -398,15 +398,17 @@ static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
> +	if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
> +		return -FDT_ERR_BADOVERLAY;
>  	poffset = strtoul(sep + 1, &endptr, 10);
> -	if ((*endptr != '\0') || (endptr <= (sep + 1)))
> +	if ((*endptr != '\0') || (poffset > (INT32_MAX - sizeof(uint32_t))))
>  		return -FDT_ERR_BADOVERLAY;

The real cause is the wrapping check in
fdt_setprop_inplace_namelen_partial(). That function is public, so any
caller passing a large idx hits the same overflow. I suggest fixing it
there with something like:

    if (idx > (unsigned)proplen || (unsigned)len > (unsigned)proplen - idx)
        return -FDT_ERR_NOSPACE;

and keeping the digit check here so that '+4' and ' 4' are still
rejected. The INT32_MAX bound then becomes an early rejection rather
than what keeps memory safe. What do you think?

A test in tests/ checking that fdt_overlay_apply() returns
-FDT_ERR_BADOVERLAY for an overlay with a negative or oversized fixup
offset would also be good.

> - Drop the redundant `*sep != ':'` checks after `memchr(..., ':', ...)`.
> - Generalize `overlay_split_fragment_path()` to accept a length-bounded
>   `path` slice that is not necessarily NUL-terminated (using `memchr()`
>   instead of `strchr()`, and keeping the NUL-terminated property check
>   in `overlay_symbol_update()`) so it can also split `:`-delimited paths
>   from `/__fixups__`.
> [...]
>
>  libfdt/fdt_overlay.c | 46 ++++++++++++++++++++++----------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)

Regards,
Simon
