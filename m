Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918E29CA5B
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Oct 2023 22:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ONW28G0O"
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E592693
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Oct 2023 15:42:54 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso476991766b.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Oct 2023 15:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696632173; x=1697236973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVK7MVGTZ70aUWL6A/VUHZPSR52HooRPaXQvs9G5C4M=;
        b=ONW28G0OTuKBP8BaN73Yle5Tv18gR0o8Lac5oKFWyEcXpgOfPeQ/ITDgp2974sAmL2
         3PqLA8lN2FfVqPmpEMeCRQQQ7Zc6KakUXF9r15skv7v3lCUL3JHZO2Z/qTgHYL/bD9M3
         3C9wHVpssuiiJIcXpMAB9twh4DN1lVGxgryK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696632173; x=1697236973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVK7MVGTZ70aUWL6A/VUHZPSR52HooRPaXQvs9G5C4M=;
        b=jJMkPvY0Ki6xI3cDDbfMuazog+cjs/HI6qChzboVOE4iGe4tIGQ0v2x/4eqg3eQNwz
         nw/vCF8zmIsQCj3CxSg2GQN8WwESv/BWKaAuu2BTeELbSmoJDi9HFfh8Ch+hL1USWHVB
         8x/KW5rmakUEB8lfeeWEAWb16dA8kt0ksF5zFjEIlxL258d16KKYEznfilyghW1vWhwQ
         jYPk1y2HHsujRF+XaaQeGpVM3GwWQn+hIxORbFA5Yty16BrI1AbDSmKxk1OUY6uWJlr3
         aSwCWkadqtXHHd4zJFEYbWa3vE9yETx+1Cf8aEerDBkGnObzw6k32cbyR13qyBPopSlx
         Oz3w==
X-Gm-Message-State: AOJu0YyiwGmNR2duaTtNVhmjLIYoWYO86Krlvn74tu9K5LjtK1zWPMks
	NhxC1uINpLQ0/LXTM1YANRfeRAdf3CsswgTIdh9Izg==
X-Google-Smtp-Source: AGHT+IFenD834tcbL4b2IFvb9II8GocpvLozWGY2Ubp5PGf5DGjpGwxRRwb6p8fN4iJ+eXlPIPsB4uIIvwpTxjLI+54=
X-Received: by 2002:a17:906:5188:b0:9b2:d554:da15 with SMTP id
 y8-20020a170906518800b009b2d554da15mr8309700ejk.38.1696632173118; Fri, 06 Oct
 2023 15:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231006124839.z7auhc3mk37gxios@google.com> <CAL_JsqLVpAU6rd4W=aM81ndTQrkngtpaQByX_3=FOYr0UdGr+w@mail.gmail.com>
In-Reply-To: <CAL_JsqLVpAU6rd4W=aM81ndTQrkngtpaQByX_3=FOYr0UdGr+w@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Oct 2023 16:42:36 -0600
Message-ID: <CAPnjgZ1FruuqL36O+VPPfXkdW6b4kBbtPEQ-4r4+tBrphfWSLA@mail.gmail.com>
Subject: Re: [PATCH] libfdt: fdt_path_offset_namelen: Reject empty path
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>, 
	David Gibson <david@gibson.dropbear.id.au>, devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Rob,

On Fri, 6 Oct 2023 at 08:06, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 6, 2023 at 7:48=E2=80=AFAM Pierre-Cl=C3=A9ment Tosi <ptosi@go=
ogle.com> wrote:
> >
> > Make empty paths result in FDT_ERR_BADPATH.
> >
> > Per the specification (v0.4-rc4):
> >
> > > The convention for specifying a device path is:
> > >     /node-name-1/node-name-2/node-name-N
> > >
> > > The path to the root node is /.
> > >
> > > A unit address may be omitted if the full path to the
> > > node is unambiguous.
>
> How is this part relevant to this patch? In any case, I don't think we
> actually allow that. Maybe libfdt does, but at least it's a dtc
> warning.

I agree it isn't relevant...re your point, see fdt_nodename_eq_()
which matches without the '@' so long as the length provided is the
length of the node name without the '@'. It doesn't check for
ambiguous nodes.

Regards,
Simon
