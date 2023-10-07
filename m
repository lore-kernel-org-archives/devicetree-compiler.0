Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC8418630
	for <devicetree-compiler@vger.kernel.org>; Sat,  7 Oct 2023 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cExDf/fy"
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771B5D6
	for <devicetree-compiler@vger.kernel.org>; Sat,  7 Oct 2023 04:21:52 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-533e7d127d4so5171284a12.3
        for <devicetree-compiler@vger.kernel.org>; Sat, 07 Oct 2023 04:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696677711; x=1697282511; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gagkBXxbwhAsOXUZJF8/4+X7IXysKajjReYDQnsyCuw=;
        b=cExDf/fyBVKAaBpAmBM+8ang2wHMqn1Afx6vfU7LXa+ul0WZx+IYG6QdqEs+wuoRm+
         mokPNYGQ2U1i2cwguyqRpb1ESb0a7ZUOy6p52VSUboTQcevb3g0w6qXi1VKb6l5Lwc8b
         aUKUyckxZx+6wpu6gHePmghlK0EzP1jpUU03jC4RKHpebWlk9yTyQq5fGKsgtv6HMKe5
         4SPfZ80/dQ036ISc7qux9OP3xrPwbMWeKqG5DQWDYg40JpiWIja026X2U1U8xda3soEa
         SBzqi0oLx6Dl6NWAMOtOHjvaSPkgj92O+V33QblNz27NbnHIF0Yomo3YVYjjAXrDI2G1
         MMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696677711; x=1697282511;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gagkBXxbwhAsOXUZJF8/4+X7IXysKajjReYDQnsyCuw=;
        b=HGtxHiCiAtK3mDMFNejgLz5q8jRyx15wYEUwmF2N4wagLH17DOAiHOXBLr60T1K9Wd
         3kaeLpv9UT9gPHBWpL1wMa1L+OtOLy5YKAGAUxdNUpnpb+W2YtmhdphEixTXSzId+u95
         Aj5V3KCji5iv3rfDr220uNkm6MrV9bHlkB5XW5/fxnz1MYg0hnmGUWIGKIFJBAkm48yZ
         u16+a6xIiNQ/DKtEDc+xMY/n+tRxoeAy3kyMhwpDKGwgBt1B+LmENvRmfzu4a/UZAOL4
         4YKPbOGR72Gufs1pP6oFYYY3aa8F2PMf4085Y6bufkajcQBpYa2Obf4DEs6/YP+6tfGb
         5CfQ==
X-Gm-Message-State: AOJu0YwqUPF3N1BcnT5FMTS1dc8ULkuvhdwUEQ9C/GVElun4Hs4PSU/C
	HC4zc+bK1xg96dcL/MMugkMIBCbPUDwfkyCWi+s+GA==
X-Google-Smtp-Source: AGHT+IGWRnQeHgKi6Tr/P3a6jBELo8ZoiCe3WSRDFR55FhbXMlPwyIykzlM7EO4uTcc7ygSNGDe6Kg==
X-Received: by 2002:aa7:da55:0:b0:533:277c:acc3 with SMTP id w21-20020aa7da55000000b00533277cacc3mr9484827eds.13.1696677710745;
        Sat, 07 Oct 2023 04:21:50 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id h14-20020aa7de0e000000b00532eba07773sm3790099edv.25.2023.10.07.04.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 04:21:50 -0700 (PDT)
Date: Sat, 7 Oct 2023 12:21:46 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: Simon Glass <sjg@chromium.org>
Cc: Rob Herring <robh@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: fdt_path_offset_namelen: Reject empty path
Message-ID: <20231007112146.4jqlou3zp74afkkq@google.com>
References: <20231006124839.z7auhc3mk37gxios@google.com>
 <CAL_JsqLVpAU6rd4W=aM81ndTQrkngtpaQByX_3=FOYr0UdGr+w@mail.gmail.com>
 <CAPnjgZ1FruuqL36O+VPPfXkdW6b4kBbtPEQ-4r4+tBrphfWSLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPnjgZ1FruuqL36O+VPPfXkdW6b4kBbtPEQ-4r4+tBrphfWSLA@mail.gmail.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 06, 2023 at 04:42:36PM -0600, Simon Glass wrote:
> Hi Rob,
> 
> On Fri, 6 Oct 2023 at 08:06, Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Oct 6, 2023 at 7:48 AM Pierre-Clément Tosi <ptosi@google.com> wrote:
> > >
> > > Make empty paths result in FDT_ERR_BADPATH.
> > >
> > > Per the specification (v0.4-rc4):
> > >
> > > > The convention for specifying a device path is:
> > > >     /node-name-1/node-name-2/node-name-N
> > > >
> > > > The path to the root node is /.
> > > >
> > > > A unit address may be omitted if the full path to the
> > > > node is unambiguous.
> >
> > How is this part relevant to this patch? In any case, I don't think we
> > actually allow that. Maybe libfdt does, but at least it's a dtc
> > warning.
> 
> I agree it isn't relevant...re your point, see fdt_nodename_eq_()
> which matches without the '@' so long as the length provided is the
> length of the node name without the '@'. It doesn't check for
> ambiguous nodes.
> 

Agreed, I was trying to be exhaustive: the irrelevant part won't be in v2.

> Regards,
> Simon

Thanks,
-- 
Pierre
