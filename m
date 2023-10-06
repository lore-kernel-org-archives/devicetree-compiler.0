Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C220D1F959
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Oct 2023 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FvO11yxm"
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F2583
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Oct 2023 06:22:36 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d865c441a54so2370383276.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Oct 2023 06:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696598556; x=1697203356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcvH1dxfI3E586sCX5gzV4um+ZmYH44bI2TVzSjRYao=;
        b=FvO11yxmppRDvtw4RMREZZWI1EMo9MLKMUaZLn6MVI0nZep5gNiPfZ2T46/twMjWu6
         dtGS+S1ZP/Eqr6cHETWa5oFh5zHa+YI2hdiIpku0kWA+YkuYIpT9wbE2V8FU8DanH6x3
         8L0Hpz6iUwhrNqsa9bC4yHQg7lPlCpXKsSBsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696598556; x=1697203356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcvH1dxfI3E586sCX5gzV4um+ZmYH44bI2TVzSjRYao=;
        b=fG2xB0Ewzy7O09E9SGS0B6gJPBnPLsHLhSl+Ow0p+u6BJNpbrvCTuOO0JThZBhGsk6
         uNM9tVQ/ogKcRa3qW5X1L9Fjh/XESrxrYHHpCI+nFNbMOdAj8AJAGBAqR87TT4n8B93D
         RS/zW1V9rwpM6H2psK8pNb+JoodHeV1flHOPYDcdWxtAaCuoNgl3CDp363wcUJtyvOuP
         BoRg5ElCf6iQSI0/aM3gg9izlDAgKnV4YwZrBe/WfpEdH/fTt2fsIKMfIkhaVY+YZRkw
         rozkBUqwqEkZl0DtXjKwcm0n8kIGXLAhiHt0tOhMHFwrYCU3JPoqHTq0VB95vlGvrLrr
         auIA==
X-Gm-Message-State: AOJu0Yzi8CU9mWHuRJU8mwY/9cKP7w5DRQ3mmFw/Z5Vw7Lvq68rlfWjB
	JZgwxeZKDHaPuvLatNjm5wj50KRAXPXsD9W3gLtz/w==
X-Google-Smtp-Source: AGHT+IHoOGvTnwKe6rXRzFNwquGPYE1VC9MTgiPJIIfqAvwvbU1baAWOQHGEeUNghiosy7uzG08E0p8VisWBQ4W221U=
X-Received: by 2002:a5b:47:0:b0:d90:a7b9:fed with SMTP id e7-20020a5b0047000000b00d90a7b90fedmr7631451ybp.3.1696598555436;
 Fri, 06 Oct 2023 06:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231006124839.z7auhc3mk37gxios@google.com>
In-Reply-To: <20231006124839.z7auhc3mk37gxios@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Oct 2023 07:22:14 -0600
Message-ID: <CAPnjgZ0UfANCRmy2X5iptz0jZHu8Wfda4geJX4Ntzma2VVcWPg@mail.gmail.com>
Subject: Re: [PATCH] libfdt: fdt_path_offset_namelen: Reject empty path
To: =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Pierre-Cl=C3=A9ment,

On Fri, 6 Oct 2023 at 06:48, Pierre-Cl=C3=A9ment Tosi <ptosi@google.com> wr=
ote:
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
>
> Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
> ---
>  libfdt/fdt_ro.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index c4c520c..46b4ef5 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -255,6 +255,9 @@ int fdt_path_offset_namelen(const void *fdt, const ch=
ar *path, int namelen)
>
>         FDT_RO_PROBE(fdt);
>
> +       if (namelen < 1)
> +               return -FDT_ERR_BADPATH;
> +

This would be end =3D=3D path, right? Would it be better to check that?
Are you worried about negative numbers?

>         /* see if we have an alias */
>         if (*path !=3D '/') {
>                 const char *q =3D memchr(path, '/', end - p);
> --
> 2.42.0.609.gbb76f46606-goog
>
>
> --
> Pierre
>

Regards,
Simon
