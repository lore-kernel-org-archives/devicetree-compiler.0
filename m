Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE93A79C3
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Oct 2023 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a043tdBU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E934C433C8
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Oct 2023 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696601198;
	bh=Jd9BD77qDFKSypBWy4f8vk1ep2HTooIj2GeMcevabLQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a043tdBUUrlyrDEpU+4nFJe60PEH+tEil3/E1sVriYowmdCan71MMgxfJ17ipHWXg
	 qOiRiSTbZdbYrsQGxG5iwpGlxbtZR7TNSDHjde2B+jiNsRxdtN2gHJ8dFEImi+bqaO
	 J1+Jdcl4NrOsQAAksfScKOtj5uS6murwZXBTGZ//AHyW+S9VlqD2kpb3pO2ZaELu9N
	 K456LX9vQ3BG86jCmjK1qhO+6ci8pKGg8FAKUJUlCTyQ1Ow+fcmemBz1eJCSfHFClL
	 CgUkxYSLqyrrCZ28BfZgma0AAUcGotLZND2a1L1BUq9CL21ZKQWmX7psb0JklwrA9h
	 DH7uiZVjtfQsg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-504427aae4fso4024287e87.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Oct 2023 07:06:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YxVOEzv8pPktIru8sop2f2BAC4juSb/63SO3M9kalSy3PH/Eh+7
	3I+cB93vbGQNUQhkJkvf9wAW9fDEJNl0odZOFQ==
X-Google-Smtp-Source: AGHT+IFbpuuf+w0E03oGKR07v+D4uBxXvYWUrtIzbQyVEi4JlhMniLmKFW4/31TDxC/ZLruWcoyu59tdCFcWhjD/g+U=
X-Received: by 2002:a05:6512:238d:b0:501:ba04:f352 with SMTP id
 c13-20020a056512238d00b00501ba04f352mr3455818lfv.1.1696601196544; Fri, 06 Oct
 2023 07:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231006124839.z7auhc3mk37gxios@google.com>
In-Reply-To: <20231006124839.z7auhc3mk37gxios@google.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 6 Oct 2023 09:06:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLVpAU6rd4W=aM81ndTQrkngtpaQByX_3=FOYr0UdGr+w@mail.gmail.com>
Message-ID: <CAL_JsqLVpAU6rd4W=aM81ndTQrkngtpaQByX_3=FOYr0UdGr+w@mail.gmail.com>
Subject: Re: [PATCH] libfdt: fdt_path_offset_namelen: Reject empty path
To: =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 6, 2023 at 7:48=E2=80=AFAM Pierre-Cl=C3=A9ment Tosi <ptosi@goog=
le.com> wrote:
>
> Make empty paths result in FDT_ERR_BADPATH.
>
> Per the specification (v0.4-rc4):
>
> > The convention for specifying a device path is:
> >     /node-name-1/node-name-2/node-name-N
> >
> > The path to the root node is /.
> >
> > A unit address may be omitted if the full path to the
> > node is unambiguous.

How is this part relevant to this patch? In any case, I don't think we
actually allow that. Maybe libfdt does, but at least it's a dtc
warning.

Rob
