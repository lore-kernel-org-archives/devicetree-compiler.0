Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570724;
	b=KAnL/48MrLOgcc2u5glqdCJDx49/yUFdRZBbWGijRFpSy9eEtxW3mUDpq2P5lqgYEHrX
	 GDEp8il3zq3W0hXYK0yUGMyobjAxLkgCneT6xJuLlb2hF/AAOdMIktqa3qbQ3SHYUJ6d5
	 W2K6ksP+uf5yqciFqc5nclsjDkAD10weZP499DWE1vyEfGqSEOoDi0lvkVLQGgKIxtWOW
	 dEVuHnnkBDEyXTeFOMQC3Aj54/OIluZwIIWKslZ1hu95+6AhCczlaJ1jwS4IJjK4bakHx
	 JXxonXAmBtR+wiYvUeVH9JFzEXixYx8Xbswt6pVky9EFMXRAVxiYegumilM/BvhW0aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=rbH5cSzYrt16xL/gEwLrXyJYEkUdlaHa3ePjk9YuywE=;
	b=GxL1WhRPFzBiHkdHQv3VnfvD1+359xuu7tUr9l11kWJVZBDofPK1M1eTBvmAfbHO82rm
	 TNLr2ekh1e2cHvaeCQJJHLe6BBlUeMsrJJ/63dYkVaBAp1yEevNOqB/PJvWoxmAY+jqu+
	 7PlqdLH/fexckMKqlnFxKbdXKENX8+pPkLsjqfIvyseONEGbK9NX2q5MCcSXSIFiaIGxf
	 mKwbA3bP/AYdrIRvpbpuXwqGinixM3l39SER55cq/0p2EPvgIlTReDJVU4yOQq10WRd2c
	 /yDeqdqjbjwmtqB94iNOz1haaYYcbFkhRP5lH6N1aXpPM3tIRK8e9a3vs0bgs26FmCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="cdvkj/kI";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9350D606A32D
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9350D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cdvkj/kI
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso414446166b.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570722; x=1794175522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rbH5cSzYrt16xL/gEwLrXyJYEkUdlaHa3ePjk9YuywE=;
        b=cdvkj/kIlzzRCXTVMtiJ6HwaZ3z68SGnR0WaYUVnQ/hC456g2Mpxo6SNi0PwQUe/AE
         jCBGSIz/adI497Gj29osCLTtqbaXl4mya+97ERyQ4EHPswKJf8SPxNzOYnmcq11uz0Dl
         OszIqsmA2oil0IqbBnhikMIzuIdH+nvouldlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570722; x=1794175522;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbH5cSzYrt16xL/gEwLrXyJYEkUdlaHa3ePjk9YuywE=;
        b=vt+UeU+NWeaAVpe1RI7WqIyKZEDqv322Pvv/Gr85crR3oDCwN5zsAfOAqHZUr5l0qp
         WlwnCyZEC2dLay4HclR9j3Eyl3ZrmTWLG2wq19HzOy+xf3lh8tTXjkMTE4iJVRG3nhD4
         Ve6uXTRmuAkx3mmt43uohne8mfpy8qSEz6SdiO88Pvrhrszk2DVqYzc0tBkMEpSCAQgO
         IAIP3uwP0wuyO4ditCVyu59Eio0/1tog0pwzUUMQr6ibmq9QYSoUKOzTThUAiiPeWAeg
         uaSRGNGJaxmwHm12O67ygWZELW9TxImDS8S85eE7p5QFBwZx0uYScTE+0vqNz9gE2R1J
         chfA==
X-Gm-Message-State: AFq9FYKCim/JFdjQW+1ABzm4WjklzoA+rSdncYYT3BvqTNFT9KWBz0hM
	HGUPq5kM9ixNHTkbiGf0wzsLmBEbB8sfpgAkhL7huziUhzB3Skk1aUjmkcTJzbKtYlzJRtva2SX
	ogAGUR9A2
X-Gm-Gg: AYBFou2Ohyv+NADQvQbL9SUx2tnn3COki0GejxP8yN6V4o85vpa0eb1vJG6EXjCoeQ+
	ixxc/JkQ4IJSOSYXOuV3ULnE204gPu+qKQ+2rvmnvADcptL8pOVsEp6n7p6Gx+g7hnHKe5E92l9
	T9b9DbEfxnk4DljiFUOAQExv45RlVNIaq3S7BGEpexSikyUF78Yv6UjdBe/oS7cRBVQruV7Xmw8
	OQuS4xA8k4ef+wjntrh21c2ZktDRAsxmdxP7mtUCWmq4qvyAcgvr4GnxRuUytC02fJr4HMmQkiQ
	4iyeoaKKZriJHIvAdoqojtCQnXIiw9i6WqW2jJ6GALUJ098u1ZhUx6VJ76UoQxEdl43m0q4uIej
	TDdgMwMXQpRGcIYJLR9MihabPV1aFmYvW87y5arJRWj0FtZD0PiLMPM0nexMdi2yhesUnrEXOkr
	ro7vOREMp+t8oJfTwhUweZ4j1zQbO5O4gZt2MoiLO/+/+3U8JZG8hR9x0w+EyNfcmiLCo6tR9c6
	V1aZN8oB2Qw/BeGKaw3Eb+JMFVcFvldWQ5hkaYVCIaf2jFcVgRH1W8lm0MKHCN/ly1puPAcTsbg
	aefWYU0Dl9VK5IK5nEcnYBRakMMaoK5dDmbBIide3/jt8MjpL6M0o2pPjWq5z3MvMuk=
X-Received: by 2002:a17:906:c142:b0:c42:2f4e:522a with SMTP id a640c23a62f3a-c4ca7a5077emr633665266b.25.1793570722063;
        Sun, 01 Nov 2026 14:05:22 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe1004asm318985366b.38.2026.11.01.14.05.16
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:05:21 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso18082975e9.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:05:16 -0800 (PST)
X-Received: by 2002:a05:600c:8b0a:b0:4a2:191f:7cbd with SMTP id
 5b1f17b1804b1-4ac17191009mr194305115e9.11.1793570715202; Sun, 01 Nov 2026
 14:05:15 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-6-dianders@chromium.org> <CAFLszTjbOnchP71O98H9zTMiPar33Fpxj47uhdTLY_dCegEpmw@mail.gmail.com>
In-Reply-To: <CAFLszTjbOnchP71O98H9zTMiPar33Fpxj47uhdTLY_dCegEpmw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WRaq1P5E0Ahpxnm-4RBt1Jm-WdmsArATGnDSx-ZY=gtQ@mail.gmail.com>
X-Gm-Features: AclHuK8vPO0SVdKrca88D1rHTJSemg0l_zF5g5bNVXQTK_MW_PMrAwjFBN9toEk
Message-ID: <CAD=FV=WRaq1P5E0Ahpxnm-4RBt1Jm-WdmsArATGnDSx-ZY=gtQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment path
 helpers for reuse
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:22=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> On Wed, 28 Oct 2026 at 15:56, Douglas Anderson <dianders@chromium.org> wr=
ote:
> >
> > Tighten `overlay_parse_fixup_entry()` and `overlay_split_fragment_path(=
)`
> > before reusing them to update the base tree's `/__local_fixups__`:
> >
> > - In `overlay_parse_fixup_entry()`, store the `strtoul()` result in an
> >   `unsigned long` before range-checking against `INT32_MAX -
> >   sizeof(uint32_t)`, and require the offset field to begin with an ASCI=
I
> >   digit (`'0'`..`'9'`) since `strtoul()` accepts leading whitespace and
> >   `+`/`-` signs (wrapping negative values to `unsigned long`).
> > - In `overlay_split_fragment_path()`, reject paths with a trailing slas=
h
> >   after `/__overlay__/` (`rel_path_len =3D=3D 0`) with `-FDT_ERR_BADVAL=
UE`.
> >
> > Assisted-by: Gemini:gemini-3-pro [edid_decode] [gerrit_and_build_artifa=
cts] [gsheets_gdocs_cli]
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  libfdt/fdt_overlay.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > index b7dd8fd922eb..a19eb1bc4bd8 100644
> > --- a/libfdt/fdt_overlay.c
> > +++ b/libfdt/fdt_overlay.c
> > @@ -376,7 +376,8 @@ static int overlay_parse_fixup_entry(const char **v=
aluep, int *lenp,
> >         uint32_t fixup_len;
> >         const char *sep;
> >         char *endptr;
> > -       uint32_t poffset;
> > +       unsigned long poffset;
> >
> >         fixup_end =3D memchr(*valuep, '\0', *lenp);
> >         if (!fixup_end)
> > @@ -404,9 +405,10 @@ static int overlay_parse_fixup_entry(const char **=
valuep, int *lenp,
> >         if (!name_len)
> >                 return -FDT_ERR_BADOVERLAY;
> >
> > +       if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
> > +               return -FDT_ERR_BADOVERLAY;
> >         poffset =3D strtoul(sep + 1, &endptr, 10);
> > -       if ((*endptr !=3D '\0') || (poffset < 0))
> > +       if ((*endptr !=3D '\0') || (poffset > (INT32_MAX - sizeof(uint3=
2_t))))
> >                 return -FDT_ERR_BADOVERLAY;
>
> This is more than a clean-up: it fixes an existing out-of-bounds write
> in fdt_overlay_apply(). With a /__fixups__ entry like
> '/fragment@0/__overlay__/node:prop:-4', strtoul() gives -4 as an int,
> which reaches fdt_setprop_inplace_namelen_partial() as idx =3D
> 0xfffffffc. Then 'len + idx' wraps to 0, the 'proplen < len + idx'
> check passes and memcpy() writes 4 bytes before the property value. On
> 64-bit, '4294967292' does the same. Overlays may well be untrusted, so
> please can you split this into its own patch at the start of the
> series, with a commit message that starts with the problem so it
> doesn't get lost under 'Prepare ... for reuse'?
>
> The real cause is the wrapping check in
> fdt_setprop_inplace_namelen_partial(). That function is public, so any
> caller passing a large idx hits the same overflow. I suggest fixing it
> there with something like:
>
>     if (idx > (unsigned)proplen || (unsigned)len > (unsigned)proplen - id=
x)
>         return -FDT_ERR_NOSPACE;
>
> and keeping the digit check here so that '+4' and ' 4' are still
> rejected. The INT32_MAX bound then becomes an early rejection rather
> than what keeps memory safe. What do you think? A test in tests/
> checking that fdt_overlay_apply() returns -FDT_ERR_BADOVERLAY for an
> overlay with a negative or oversized fixup offset would also be good.

Great catch on `fdt_setprop_inplace_namelen_partial()`! In v3 I've:
1. Split this into its own patch at the very start of the series ("libfdt:
   overlay: Fix out-of-bounds write on bad fixup offset").
2. Fixed the overflow check in `fdt_setprop_inplace_namelen_partial()` in
   `libfdt/fdt_wip.c` as you suggested.
3. Kept the digit check and a `poffset > UINT32_MAX` bound in
   `libfdt/fdt_overlay.c` (mapping `-FDT_ERR_NOSPACE` from
   `fdt_setprop_inplace_namelen_partial()` to `-FDT_ERR_BADOVERLAY` in
   `overlay_fixup_one_phandle()`).
4. Added tests in `tests/setprop_inplace.c` and `tests/run_tests.sh`
   (`overlay_bad_fixup_negative_index.dts` and
   `overlay_bad_fixup_overflow_index.dts`).


-Doug
