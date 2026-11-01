Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571165;
	b=fHQLQBLgQCsfeCPPBqDHoCCWHZGCofHzW0fRl1+JhZd5/erBnVetj6XAP+fyDeyU8csq
	 t7yQMX2lT3Xjpa67IUvfNUqFKCXyVE/hwSk22Bm97im1IM1M9e04swc6s45ZjNVOaAsBP
	 xqOha8YFQsr9fCd5ZoafCk43zYt59KD0Snfig0Fe90xIByJUPtldeODD89auvL5DLX7J0
	 bBooCSu92KrWnaiAbIvASahdlCPk21bM1LBCzEZWhI0I5Adn8oh/BZVhYEsCrsro+M1RK
	 MXuBCUh/JrDE282gbFtYThL9+EZi9uYA21qrsIugpAhV8NqBD6MSEfa3d+b/SbW/Gag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Buc1QDeYtaFDuNaaLime3LTMfQGnM03bKEX58bfBjs4=;
	b=DdiOMWvrYGbESWeA9J8e0Kxj4acCDSFaKaSrzLb3r4H5NT1frfoYB8SUTOal4VnPZsYp
	 HzbkG+CGEw5Q4MuxEunBvWyZci0rFSX5MR5L8img9k5IO6RXOj/PscH68xC2uKwtnYGL1
	 Rh7y6X+PVAR3gI38VwFaS1lezZEQzlf42UvjwCJfZhDRMSFeCwz+xIJ/nuYXgbIT9Xnkb
	 O783X26OL3i88Q4XfH1YKfaLemX57LaZeF6GxC6g+HVDJtRlkEi2TfkZ45XcHrRWx8THH
	 e2ygVjtYLaJqIG7HBjEv3uW41N80//nGOHqBQuOFDdwLswjsSDz4cccbLzD4krGRKFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dQiIgXe0;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313B3606A327
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 313B3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dQiIgXe0
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c34bff61551so415996866b.2
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793571163; x=1794175963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Buc1QDeYtaFDuNaaLime3LTMfQGnM03bKEX58bfBjs4=;
        b=dQiIgXe0/ZiB/KdPI0eczCksPSckBHLDsiHyBL4olqQdrRq5a13c1hOOxY1+l58KSf
         TdUiGIMsemvfQALGW4Tuvpjdfb2lq/Stqmbe1cNEDhXcDElFJfvDWJqdciXp/CKdguPE
         zM5c6GTcFB8UsdtWZWypdUcTc/DhE6Fes/xrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571163; x=1794175963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Buc1QDeYtaFDuNaaLime3LTMfQGnM03bKEX58bfBjs4=;
        b=P6X28Gr5gb6YCQD+djK0vE5SfDbvRo2Q65j8tavHONeUM7ULDIdQW568TL9spFb15h
         qaY2v3VwH5E5olfmH9F5bQ16sQmhTw32BhuNhbVoEZHPwdXzVe8HcVm0LNORng9rYdWM
         bQYbhk1qmkFVVRapPQxRkTA5nLlK0Q3T6blHnPbuCEDPX3JVKj+b7dy78vBTi1bBlcud
         92fK0vRmBWoC+k/K1K0Zb9U42r+86iSILpUaSfi5Kr1G5BBZe0aJtvQ3wvi0riJWAMU/
         j4HqNaucBTxXEoEssyOhmm3XqxuEclNoUU9LzfFIkVhHLamhlplUWSrfraASeUVlOrMm
         Me+A==
X-Gm-Message-State: AFq9FYJwuB7vLG2ta5bPntEgz8epnkIKLX7DqmbEvVBieBcliGQhtsB8
	4EO49abtOd2g2wpC/7pH7sQp0iPx5YZKobsOF3wfa78PO7kUVE+w8P0mN4Xc8bBHGbyedgDxo2e
	l9XK1Q+pT
X-Gm-Gg: AYBFou3WKF5Z9/I304SwuyVHqEy0QhNgGAw3ACtO7W2HZ+E7CQdsqBSIxyHSJMhLIYK
	5KeyJinalBGXX7TjAWAtnC2nSW47/rqDjssSncQ2WwMOKe/JKJjzhRStDmYvi1LVrMk7Qgb6NpL
	6DX0rC7mZ8JfVp6x+C4Sbzez9Fbi6b5R6ryPg0A3+Hx/FvQxVA6Npo091nbGWEdzQzLlmgtKVX/
	nPgoCk611Oo7B1tNwzEUo2cP0V6dxHvbJZsGGB43F8GUHaBUkv/UAoU54pDOH5YvX+hS0utGnPV
	1QvecLbeymBsVLapQEyBfPgUN4/+oIfoS2m0HrUW4jSyDEyJa+oVD6LapVVCCRl7G29UGft/ChR
	k86ZH+rNXGKbYvFk+rtjdCTnZZ+sLG9H8eAwkNeaZSa3devkx9knzYgZaonMnmFENmi/aFDXv4P
	AyLKpjs7yaJ/iHhBAL2Ujcg4c8Ijqd6zGlb+REWC2nP8OAjyn6DVaVuhSsowM/IHcW+LN2iBhwk
	BJjgNOUZhgHCInjOtnkMdN3oqd4P45okh7u1qC3NZcyZkqgnhD4wrPSdE/LGsBB0bWkDgcsGYx+
	VDhnVGy/budFyZr5bumHvmUF27RYEkxP8Ln4y7Rw390yzpRm8dOLKRnssSK21gvfgjI=
X-Received: by 2002:a17:906:eec2:b0:c3f:98d4:dfe2 with SMTP id a640c23a62f3a-c4ca7a6fbb9mr617733266b.18.1793571163596;
        Sun, 01 Nov 2026 14:12:43 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1920csm314359566b.5.2026.11.01.14.12.43
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:12:43 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so3316848a12.3
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:12:43 -0800 (PST)
X-Received: by 2002:a05:600c:4708:b0:4a2:167a:c93b with SMTP id
 5b1f17b1804b1-4ac19234ad8mr193309575e9.30.1793570740977; Sun, 01 Nov 2026
 14:05:40 -0800 (PST)
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
 <20261028215600.1713475-9-dianders@chromium.org> <CAFLszThZs9Qx6c_qff4LUXPNpncUAO7LGygkyv6FRtGcxU88xg@mail.gmail.com>
In-Reply-To: <CAFLszThZs9Qx6c_qff4LUXPNpncUAO7LGygkyv6FRtGcxU88xg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WeMHHTZ5v0tWLhqRivAMogbqVQ-cuF9HRb6sfO+9TVkw@mail.gmail.com>
X-Gm-Features: AclHuK87KLmJoI8xKOrvWWlX0UnZ0z4ES-P-CBsehd7HFous4pSW5-SGmdATFXc
Message-ID: <CAD=FV=WeMHHTZ5v0tWLhqRivAMogbqVQ-cuF9HRb6sfO+9TVkw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] fdtfactor: Add -S/--strip-local-fixups option
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

On Fri, Oct 30, 2026 at 5:23=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > On a set of 47 Qualcomm SC7180 Trogdor Chromebook board DTBs,
> > `fdtfactor -S` reduces total uncompressed size from 7.69 MB to 634 KB
> > (91.8% savings).
>
> This compares against the unfactored DTBs, so it doesn't show what -S
> itself saves. Please can you also give the size without -S, so it is
> clear what the /__local_fixups__ in base.dtb costs?

Done. Updated the commit message to show both numbers: without `-S` the
47 Trogdor DTBs factor down from 7.69 MB to 932 KB (88.2% savings), and
with `-S` they factor down to 634 KB (91.8% savings, saving an additional
298 KB by omitting `/__local_fixups__` from `base.dtb`).


> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > @@ -1238,6 +1238,28 @@ fdtfactor_tests () {
> > +    # Strip local fixups (-S): verify that merged DTBs match DTBs comp=
iled
> > +    # with -@ (without -L), and that inputs lacking /__local_fixups__ =
are
> > +    # rejected.
> > +    for i in 1 2 3; do
> > +     run_dtc_test -b 2 -@ -I dts -O dtb -o fdtfactor_board${i}.nolf.te=
st.dtb \
> > +         "$SRCDIR/fdtfactor_board${i}.dts"
> > +    done
> > +    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_strip.test.dir=
 \
> > +     fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb
>
> This rejection test has no -S, so it checks the -L requirement from
> the previous patch rather than anything added here. Since -S could
> easily be read as 'my inputs don't need -L', I think it is more useful
> to pass -S here, to show that it does not relax that requirement. The
> plain no-S case could then go into the previous patch with the other
> rejection tests.

Done. Moved the no-`-S` `.nolf.test.dtb` rejection test into the main
`fdtfactor` patch and updated this test to pass `-S`.


-Doug
