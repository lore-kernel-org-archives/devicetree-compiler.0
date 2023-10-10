Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00BA24C82
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NkX+DzTM"
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D5D9E
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 07:18:18 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-41b19dda4c6so713661cf.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696947497; x=1697552297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRhAWDM0EtgeVHwXCYrqpdG6fE9N+2oEDR+EmUamebY=;
        b=NkX+DzTMS0MHbalCsODbKe7vimOdvJ/zunC2Z7xFQruArshRvwXltklV3GZ8kpi+Dy
         LxyrsR2CL+qPYgos62nGVP7YhC++oCrFIzYEMf+Daz0dJ03t0OtQVVm+2acIggTiaCOa
         tWq/+mLOnIksOgqD2ENdGK2VNDEPHpH69ZWOHHM6UafHRlU8YbA14RizQnJ2Dc8KJN5B
         ZBuRwx1X8lB10MmIcG5LcydsNqNeF2H2y1hNz9VSCFYUuIUvr2VFHN2ek3NqpBvKN7gR
         7phYwL1u7y7jv8pSBSJzmanft6GyYDY8gZMZ/6ibpPbeZ0UvUiaGWtzZd5J3LYu5pA0g
         o/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696947497; x=1697552297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRhAWDM0EtgeVHwXCYrqpdG6fE9N+2oEDR+EmUamebY=;
        b=JoJscJWi+rzjpBJtaFQMX7LJkgxoMOBW4GYWrQhZRXnKpX/h3EtGcGL09HfhlxeNMq
         5T1yOvBd8+agEw+D4iIXAS99AAxLJLYmxf4zbNmPPlE4qstmleupnHzOCWrDJjjBUR+Y
         F0SYPAbHTh1SqYnffhc/igOTJuy7XoGpSJjHV6/ANMev7Ss+VPpuPQqp1Bm1CLp9QFxi
         PTEgp/QzPWg64/eM5CwVAnVrDN1Ec48I2r2gYiMCjldWJucUB95zjT39eTBCDTnJpsb6
         RGeF1uZp1GqLlPIO+XZ4iGn395XbyCnfFvdnOWdt4D7K37oQp8UYVeUHM5rgKSSpOVuK
         fYGg==
X-Gm-Message-State: AOJu0YwATM42tf0cQWR1NSJ2cLX+CkQ6DUDnzaB73PlSvoEY7WYVXiOp
	7BM5X6in9zSsNSLi8NYwpFx6uCWU/iFrp7HBJtJvEw==
X-Google-Smtp-Source: AGHT+IGwZkqhxwi7nZvQLrlOTDuQhOFiqip3rdFw4VZbDNmoBoAGJZK4UX50Ar31FI1bZdWi74am/DGFyW459oB13x0=
X-Received: by 2002:ac8:7d52:0:b0:403:e1d1:8b63 with SMTP id
 h18-20020ac87d52000000b00403e1d18b63mr1385061qtb.24.1696947497283; Tue, 10
 Oct 2023 07:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231007110710.i2oj24oirdtyt5m4@google.com>
In-Reply-To: <20231007110710.i2oj24oirdtyt5m4@google.com>
From: Mike McTernan <mikemcternan@google.com>
Date: Tue, 10 Oct 2023 15:18:04 +0100
Message-ID: <CA+QomtZPEAOC0AFgoDx93AoKe-mUgBW4GM3CyxVaEpp1p1pjfQ@mail.gmail.com>
Subject: Re: [PATCH] libfdt: fdt_get_alias_namelen: Validate aliases
To: =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, devicetree-compiler@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, 7 Oct 2023 at 12:07, Pierre-Cl=C3=A9ment Tosi <ptosi@google.com> wr=
ote:
>
> Ensure that the alias found is valid i.e.
>
>     An alias value is a device path and is encoded as a string.
>     The value represents the full path to a node, ...
>
> This protects against a stack overflow (fdt_path_offset_namelen() calls
> fdt_get_alias_namelen() then fdt_path_offset(alias), ...) when /aliases
> has an empty property with an empty name.
>
> Co-developed-by: Mike McTernan <mikemcternan@google.com>
> Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>

Acked-by: Mike McTernan <mikemcternan@google.com>

> ---
>  libfdt/fdt_ro.c   | 11 ++++++++++-
>  tests/aliases.dts |  3 +++
>  tests/get_alias.c | 12 +++++++++++-
>  3 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index c4c520c..bda5c0d 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -537,7 +537,16 @@ static const void *fdt_path_getprop_namelen(const vo=
id *fdt, const char *path,
>  const char *fdt_get_alias_namelen(const void *fdt,
>                                   const char *name, int namelen)
>  {
> -       return fdt_path_getprop_namelen(fdt, "/aliases", name, namelen, N=
ULL);
> +       int len;
> +       const char *alias;
> +
> +       alias =3D fdt_path_getprop_namelen(fdt, "/aliases", name, namelen=
, &len);
> +
> +       if (!can_assume(VALID_DTB) &&
> +           !(len > 0 && alias && memchr(alias, '\0', len) && *alias =3D=
=3D '/'))
> +               return NULL;
> +
> +       return alias;
>  }
>
>  const char *fdt_get_alias(const void *fdt, const char *name)
> diff --git a/tests/aliases.dts b/tests/aliases.dts
> index 853479a..8820974 100644
> --- a/tests/aliases.dts
> +++ b/tests/aliases.dts
> @@ -8,6 +8,9 @@
>                 s1 =3D &sub1;
>                 ss1 =3D &subsub1;
>                 sss1 =3D &subsubsub1;
> +               badpath =3D "wrong";
> +               badpathlong =3D "wrong/with/parts";
> +               empty =3D "";
>         };
>
>         sub1: subnode@1 {
> diff --git a/tests/get_alias.c b/tests/get_alias.c
> index fb2c38c..4f3f6fd 100644
> --- a/tests/get_alias.c
> +++ b/tests/get_alias.c
> @@ -21,9 +21,16 @@ static void check_alias(void *fdt, const char *path, c=
onst char *alias)
>
>         aliaspath =3D fdt_get_alias(fdt, alias);
>
> -       if (path && !aliaspath)
> +       if (!path && !aliaspath)
> +               return;
> +
> +       if (!aliaspath)
>                 FAIL("fdt_get_alias(%s) failed\n", alias);
>
> +       if (!path)
> +               FAIL("fdt_get_alias(%s) returned %s instead of NULL",
> +                    alias, aliaspath);
> +
>         if (strcmp(aliaspath, path) !=3D 0)
>                 FAIL("fdt_get_alias(%s) returned %s instead of %s\n",
>                      alias, aliaspath, path);
> @@ -36,6 +43,9 @@ int main(int argc, char *argv[])
>         test_init(argc, argv);
>         fdt =3D load_blob_arg(argc, argv);
>
> +       check_alias(fdt, NULL, "badpath");
> +       check_alias(fdt, NULL, "badpathlong");
> +       check_alias(fdt, NULL, "empty");
>         check_alias(fdt, "/subnode@1", "s1");
>         check_alias(fdt, "/subnode@1/subsubnode", "ss1");
>         check_alias(fdt, "/subnode@1/subsubnode/subsubsubnode", "sss1");
> --
> 2.42.0.609.gbb76f46606-goog
>
>
> --
> Pierre
