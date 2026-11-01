Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570708;
	b=mtIfS3dRikJryPzRb7oEkdgyCAs88ezEsLGPsyoMSe28u0w89cHcD8fdY2xp5ukvN52g
	 7j/AuVbhho5bN/VRGluBDQchBCvZTWzDYUCsktXjxyZHuXjUER2YI4iBziynbUSi5Wuxy
	 zhcZzZuGxdu88kK2AvwliJyrNandQXwEGNqoNm6jG6ZV9F1bDLxal+AH+3OD+joYlo6oY
	 xAFJLCD/JAT/SfQsd4ps80LRReXwq5hsDjf97BtVEsSrBXMXJiLGxBLnBBVlY6NpHbteZ
	 BH/NxWv768yvr+HvgeVft7bR+LyBPGaIgNOMj6LHAiNCUdg5MzyBnBh1h7Oqs99P9Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PFyk01eVFOp6/1QOM1CgFjRZU1l8aTMWLgQJiWpehTo=;
	b=rhWOr1ud6g+YmCag9r68vVJO0hJxfWiJHQV6Xa0RvGH+EYOkwyCWaXy0/yJSs14CTFLU
	 P5gmVZx79ZXLCHDGIRnjib6gGj0GK2SJdVhvbjTtG09gQZ0mAY36hEJoD7EXHWnDmr6xP
	 nAWUAHx93PBAcs3uJE8doSJETeoXtQdgZM6rOqUPoUe23h6KkRTuLd+imDE/M+EKvtVzj
	 YbSkyZA/MrUFsxdX6g1cRU7HBQuGCbW/QzyU85Tb8inXBgP3iGFMb58opbwMZF2piCXxJ
	 jjxLy8JI1xi8OVUjm+lMnByiMjbTm7IMYAAW2l97d9g4WiNHlgbk6WQv5wnZYTkvwEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XmPSDpKi;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8F1606A324
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8F1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XmPSDpKi
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so380279466b.3
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570706; x=1794175506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFyk01eVFOp6/1QOM1CgFjRZU1l8aTMWLgQJiWpehTo=;
        b=XmPSDpKi+wWMlgVPb/kHs0G5LQ+no6B48od1/Vn6KmDNiBDDAlcOnDokdJbqaZVYwt
         y2X+oiveyxYUc2rqFYrCMBPyIwRVbCpdLCtaqRxA8l73A8i8L39QkZBvLllOmgw18vFx
         sHKRF84sAIjZa1+ZUaRc/CZUNkD2AwVdLk9dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570706; x=1794175506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFyk01eVFOp6/1QOM1CgFjRZU1l8aTMWLgQJiWpehTo=;
        b=sjqSKhbL7RWl6nOhGnVih9eex2AG3EsQvHBSpfqim5f50YjkqWg+dQUfsTVIRMXLnk
         pXooqQqTzaJb5RJAVvzRkefcyj8NaZsqEwNjQdYc+2XiUfz35tae+DuFPNtKdTxPrNto
         ZWOjKT3GUP8atKCrZkETxbuLpBM4+fyVDO60Yh+IKD8bg15rid3mmxcelqK4bmRVs6x4
         JrbbCGpHRq9ob57oANLzRaZc392ED1QdHeq+Hr5OuFK7fU4cZ0w2kKg+L3o9cI/KdJ5W
         YH8z7mQINwapJhTNNsxTGQDq7SSSQtL3i249FqceEN4CmZD4VTQoe9xgC4wEnyfSXFt0
         rI2A==
X-Gm-Message-State: AFq9FYKk9FrUeg4MxqsqqXU7WloGPMWSjaKCcpWOmedbSKeop/YFTzsJ
	I4pzDiMF8x7spLSec9nXJBNS6VAEv0AIeqvsxUtxvEVkc8XirJryjEtHm8uNMbJXDfwwxNXzf7F
	W7g/V0AEg
X-Gm-Gg: AYBFou1r5NHvTZjyOiRAyrFVzxW6Mxot51ZRR5cAQ1V/yQUUSHj2z3VfLnTLYPu5VRT
	gzT8/lAiJFcuqNJySPCFXXhxpWJiQXEJ32/Eyfk4vZJADlIWt4mCyjAqo9F5WOBEOSx3apGkk7T
	vXV5PZJt6E2p57daqFFZ1rgk6h+FvGEDp/flnaz03RB3B1WcIodoDymORmYRRzHMhlnmhO0NllY
	tyjcLsagwx7z9893iL5v5BRzIh+gjCjIsh+bLFkV5uqQgOpuAEj7lILN5aD4GhDXrtvoXHVM6W+
	0dlCd5FYPD0MiGJM2V2WjUcFM5suzAMGsU5U7zlj4loK5WWkIy7LR+i8UfqUOuL1w5DFCL7LYd4
	pZRktWGl21clUtFVB7/jESn5DkFpzIwzzp7bWk5dNwQjmaptK3j73DyU7VgBiOkEKpu6r7KDopO
	PXOYvQ0F8JDd3Q/urO9daEapEzxeZGEbXwSzSVQiO0SRdOrCS2Niwa7uVkaH6eg7e5vPLQ7zsoq
	fDVJpboXcJFHruYlCGtR/ygcrJov1yj2zDtf+Y2rG1gBM+nELGBt6yJMftwzRIatuOVRefpehaz
	7AScEfzuao4Kw9vYCp+KFumeMS9iEpHtemPIHN9P4WTJtZjn/PFnz1u0qs3NWb4BZkA=
X-Received: by 2002:a17:907:3d91:b0:c43:6d40:4f84 with SMTP id a640c23a62f3a-c4ca793b9c1mr752407366b.4.1793570706625;
        Sun, 01 Nov 2026 14:05:06 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc7bsm312486866b.21.2026.11.01.14.05.02
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:05:02 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so14363235e9.2
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:05:02 -0800 (PST)
X-Received: by 2002:a05:600c:1987:b0:4a1:6517:ccf1 with SMTP id
 5b1f17b1804b1-4ac16fa2edbmr193511235e9.9.1793570701196; Sun, 01 Nov 2026
 14:05:01 -0800 (PST)
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
 <20261028215600.1713475-5-dianders@chromium.org> <auQXQU974oMkWe01@gractus.seuss>
In-Reply-To: <auQXQU974oMkWe01@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UmpZPc=CzrQdE0FNxNcqK2VyRbyWy81_0E6HWfZ=es9w@mail.gmail.com>
X-Gm-Features: AclHuK80IahgGAWhxdJr2Lp66ILPi_cbUp_334UE_M06wTdmny6SXo3fYvtRZmw
Message-ID: <CAD=FV=UmpZPc=CzrQdE0FNxNcqK2VyRbyWy81_0E6HWfZ=es9w@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] libfdt: overlay: Factor out fixup and fragment
 path parsing helpers
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
> On Wed, Oct 28, 2026 at 02:55:54PM -0700, Douglas Anderson wrote:
> > Extract `overlay_parse_fixup_entry()` from `overlay_fixup_phandle()` an=
d
> > `overlay_split_fragment_path()` from `overlay_symbol_update()`.
> >
> > A subsequent patch updating the base tree's `/__local_fixups__` node
> > during `fdt_overlay_apply()` needs to parse the same `"path:name:offset=
"`
> > entries in `/__fixups__` and split `/<fragment>/__overlay__/<subpath>`
> > paths in the same way.
> >
> > No functional change intended.
>
> Conceptually good, but has a couple of warts.
>
> > +/**
> > + * overlay_parse_fixup_entry - Parse one "path:name:offset" entry from=
 /__fixups__
> > + * @valuep: In/out pointer to the current NUL-terminated fixup string
> > + * @lenp: In/out remaining length of the /__fixups__ property value
>
> It would be good to describe how the in/out values are updated.

Done. Updated the doc comment to specify that `@valuep` is advanced past
the terminating NUL byte to the next entry and `@lenp` is decremented by
the consumed entry length (including its NUL terminator).


> > +static int overlay_split_fragment_path(const char *path, int path_len,
> > +                                    const char **frag_namep,
> > +                                    int *frag_name_lenp,
> > +                                    const char **rel_pathp,
> > +                                    int *rel_path_lenp,
> > +                                    bool *is_overlayp)
>
> Returning the bool this way is clunky.  Better to use the return value.

Done. Dropped `bool *is_overlayp` and updated `overlay_split_fragment_path(=
)`
to return `1` if `@path` is under an `__overlay__` subnode, `0` if it is a
valid path not under `__overlay__`, or `-FDT_ERR_BADVALUE` on error.


-Doug
