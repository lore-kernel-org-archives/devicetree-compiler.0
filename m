Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570717;
	b=MjPWZf0n23FMc9onQDMlgFsforY01AsiHxk/tPgfD1oo+N1vBQYwVMynn7EcKkA8HqAP
	 khQJSRpdW4lZ+AYjaSqvjupDI3481XVWqCt4cKrDIhofIvavb3CqrMlay/Y6u9uql1VVS
	 WzeTjggNOw0l7ux7xxJu1FL/DSZaOF959Fhsal00jyuYhrf3T1ZBFgswwcp7C6EC/tDii
	 fV4mU/CqJAOnKk7Bp/O18exHAQp4FwtuS4Bhlnez0ijgZPApTdTGaZGBHMsV2NjgpOexw
	 w76GT/D77lfgcVI2nJQdEXLRXSZiA0MAJVxJdxph2E4hA8IBeZ1sXZzCYLqIOzjaFBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=O04uc+lDpCUwdTYjExULkpDGvmNI9e9oEputG6Eg5zM=;
	b=LECuwxGed41YYAeBtE4c4VB5UAev2ZPZs8RL5bMGSzSrCERsO/89MY96TMS7C3G1ATRo
	 k5OXlF7V4eBqpXCYvClKLx2AyjZ7eRWJeUrB/Yy3es9icTTBMw/iPz1brvWn+h2SMfEOp
	 WJJPa3PB1kAmfuaXftFDGZFM1Pg7lxBOhntBwQHycZYdK1L0r7M3V/Ze7p5DLUd8MV1Xi
	 ViNR13+uCs6q0BDIHX/jAyc8xOGWDi+5q8OUVp4nw/EDbT9NH91HVsT9GzQYwCSKA2cy2
	 MjjAVSAbRDCAu+Mezmgz3M9mZDiVPxUocLp1V3a6b0f8d2ATuo+YZ9oZ5ASkMk5eczQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WLPinSHF;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89543606A332
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89543606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WLPinSHF
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so2515229a12.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570715; x=1794175515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O04uc+lDpCUwdTYjExULkpDGvmNI9e9oEputG6Eg5zM=;
        b=WLPinSHFqC3TcsWmWyVrdbrdcYItyFZWUfz5t2xsaFtOYdfvzREvqeS7UEWUi1QrmW
         2JlUZelw2L7VFp//y8x7N9Zl9VpllnHyMATGHNQ25ggfh/H+xbJUW3p/2qTUOQNxwhvh
         0on2XkCLDUYYjDmiL9w8i1ui2sQuAwUNfMvOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570715; x=1794175515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O04uc+lDpCUwdTYjExULkpDGvmNI9e9oEputG6Eg5zM=;
        b=qGsm0MRBo8fr5BT9hLvXtoGdC8vjep/aDoeSWeHPkwyoz5Hyqjpyb76ZBtJcAfqzL4
         AMNL7sdGM0PzB5Nee/EhXLJMCGWq2/D7TU5yjI6X7MJwd3AnLGS/ONIq2/b9NjGbbMgb
         uBm/mnkkwJ3NXwj4xhaX81g4MR3Rt7CmyP/vy5jZTbY5WgtX5Y9+2mHi/ILlwKukOSYQ
         mQqcgvJU3mxVhkIG4w70Q7Xg7M/TZP1NMVvb6B10yr/PPSyZ3hZZvc+DEVyvTUqaxhZT
         6dpCzgfXLjXKgLamW20sIgvVnL15B8fCAqBOEu3U+jvaGTbqbRaToNM6MwTfz9pi1f03
         XeHQ==
X-Gm-Message-State: APuU4Z/ffm3FEBtoYuk/OVpqyrRYMtd4BK9ckGDbyuMYIzb3n7I5/In6
	s7PcSiTGzklu7agk/YHo0LkMAD/fffeKCpInLnd+0F6J4fj9ffpETo2P/dzf7dVVVcVml+V66gf
	+Dy+qGDzq
X-Gm-Gg: AYBFou1Hc/j7pUbv2gIMluLTrkBJFXddKSlrhh6UDqJu3cY7YvyMyA1ztXL3VDHVJGT
	GBucETQ0FulnfhaNSLmuYzJxDLwPbaGZfWz5qB/lkNdN7Ebo4zCFirNFklLJB57eFYhDWCVSJUc
	7KeVnYkU+20MyUSShpz8fF38IsyxMVBpT3F0Duu//aKUHyC4Y/LWXfIkmRedtx5DoFiQtdP8fjI
	SrY54f3qvNa+9d4syyNQ19xWWdUfEMC0F7VsvWGK9vHegOqeXibtTvHWjBOfJ857/rbdplcBxWp
	Z+8OSX0/PJCPFLM6pA88m2fdlhrdBELELzTE2Yf7r5Pkhpjjt8Xy6qZP5dYsEVeSVRlWEPzce+k
	VpXzJM0WrZRAPNIsSeSazpslWXTaQVB3z0vKQhDDI0B15Jxk6OeSNWPKsr+nrJR3piy0ZAY2opD
	kuKtWpbCfYrcSji0fAOTWPK97ReS2F0ynpd2rrNvNbQJ28RMkqBuQxCpLlvXPFGPF0X2shJchz1
	ph+ntmgDzjBw4O1KliNi92uYeCGRkg7ksph5Hj+S0NlL/5yeMLngvQ96PukwaDeWT3fY0bVjpnZ
	Acs8M0MnDcXIdyblVJwga4p68bnLIJTvJ0e/gSstNjbTWOXg+30NI/mVy7YFbDR8CUM=
X-Received: by 2002:a05:6402:708:b0:6b3:b08a:1a08 with SMTP id 4fb4d7f45d1cf-6b4d4689ac1mr4098746a12.19.1793570714984;
        Sun, 01 Nov 2026 14:05:14 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca211ddsm2415474a12.34.2026.11.01.14.05.11
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:05:14 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso19933385e9.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:05:11 -0800 (PST)
X-Received: by 2002:a05:600c:19d2:b0:4a4:4d57:8487 with SMTP id
 5b1f17b1804b1-4ac1737c51dmr189043855e9.5.1793570710564; Sun, 01 Nov 2026
 14:05:10 -0800 (PST)
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
 <20261028215600.1713475-6-dianders@chromium.org> <auQcDmZJGQZW7oB7@gractus.seuss>
In-Reply-To: <auQcDmZJGQZW7oB7@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VEeAWJziS-ifyWdJn035VhnOS1wCPGma3MZ5nBGuOGEQ@mail.gmail.com>
X-Gm-Features: AclHuK_QHzFjJVuNwhBeiWv5hUKdOqK33qi3pjq7aERX5ObdBWq4FdUnV4RCeTY
Message-ID: <CAD=FV=VEeAWJziS-ifyWdJn035VhnOS1wCPGma3MZ5nBGuOGEQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment path
 helpers for reuse
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Oct 29, 2026 at 8:55=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Oct 28, 2026 at 02:55:55PM -0700, Douglas Anderson wrote:
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
>
> Huh, I'd assumed that strtoul() wouldn't accept negative strings, but
> according to BUGS in strtoul(1) that might not be the case (at least
> for Linux+glibc).  Good catch.
>
> This may need some minor rebasing for the suggestions on the previous
> patch, plus some additional minor refinements suggested below.
>
> > @@ -404,9 +405,10 @@ static int overlay_parse_fixup_entry(const char **=
valuep, int *lenp,
> >       if (!name_len)
> >               return -FDT_ERR_BADOVERLAY;
> >
> > +     if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
> > +             return -FDT_ERR_BADOVERLAY;
>
> Putting the rationale for this in a comment here would be more useful
> than just in the commit message.

Done. Added a comment right above this check explaining why we require an
ASCII digit before calling `strtoul()`. Also, as Simon suggested, I split
this out-of-bounds write fix (along with fixing the unsigned overflow check
in `fdt_setprop_inplace_namelen_partial()`) into a standalone bugfix patch
at the start of the series.


-Doug
