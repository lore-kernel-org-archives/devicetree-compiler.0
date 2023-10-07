Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A3B1944F
	for <devicetree-compiler@vger.kernel.org>; Sat,  7 Oct 2023 11:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p8tTz0mP"
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DCABC
	for <devicetree-compiler@vger.kernel.org>; Sat,  7 Oct 2023 04:17:24 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-774105e8c37so193061785a.3
        for <devicetree-compiler@vger.kernel.org>; Sat, 07 Oct 2023 04:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696677444; x=1697282244; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jg1w35RPX2H2L5Ae+2JxTjKnXPg19c1yk0HQuj2Qp20=;
        b=p8tTz0mPJWPlUWSJwN3FC2gMMwuZI6mPMEMCwIIrl9mLikV/qrxjK8aqvq66wGCLRm
         H5rFhpdl2FN+a3RcJD6NfdyrEKEjsDF8ofBAbIZ/yJH3EBf2ZnRsNDhfPJfQgpd9nXqs
         hzhXhUgct4UXwXuX0uCzgTyNzrusGVch2oyk5mfa/2VMRWJYtbOX0t0JyHCBC+ODfppL
         4Zznz5iR9j3s5ZE9wMqeS1eiMzmIAfr4WNB2CgS6Fht456vIvZiBqFSpM5Uuq9BxPfzt
         Kzih1kW61BgcJWenssgjUccWOgVqqaTrzABeNpLjO1R9LmWrsj/p2CVs5StZIKIM9Cnq
         fMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696677444; x=1697282244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jg1w35RPX2H2L5Ae+2JxTjKnXPg19c1yk0HQuj2Qp20=;
        b=HUb4HrxzL1muuMQAgIn+agIOoyMryDlBpa5d3aaQMp0gdBtLQouxLWN0LGAAUly003
         Z4FIWgFBQOH+7QbWEAtyjvkkocYQBzInuufzug4/UeBSbtZA0mS0lIcmZHBFx25GqQv0
         prxrV27GsoUAbjh71YQrcSDFPpD2e1BOzZ9EqPXfOXmqDJcDlilq4TefaJlAOONJoZk+
         lH0T4l6RNZ4tSmpnx5vatQvEEDygYj0aaUYeggxmOoJg44b8yjrkGRO+/Vj4uA43FNFg
         Pn/v4ANIuKxkKusXagpo5QD/c57BSXU4XP1c/zw2rBGLzGWTZXe0fwe8JaYEcsbdWTbN
         0Q8A==
X-Gm-Message-State: AOJu0YxdGBrmtc1hAr0HZgQpVYpiC+//UWSTdMhLp09oAUhkuG2ZBsyr
	SbHIxpfOWqqTsRHH+rJ6y4uWXAuMWn2RNrr8daoZLQ==
X-Google-Smtp-Source: AGHT+IE/sJJgv17AizVSIwQwXLyi5EQgLOmZD39CqdP8DwaQZgd0mMh2AjkVQ4UODseyG3b2mZTlPg==
X-Received: by 2002:a05:620a:470a:b0:775:9e64:f5be with SMTP id bs10-20020a05620a470a00b007759e64f5bemr12894413qkb.55.1696677444053;
        Sat, 07 Oct 2023 04:17:24 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id o16-20020ae9f510000000b00765aa3ffa07sm2006597qkg.98.2023.10.07.04.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 04:17:23 -0700 (PDT)
Date: Sat, 7 Oct 2023 12:17:19 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: Simon Glass <sjg@chromium.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: fdt_path_offset_namelen: Reject empty path
Message-ID: <20231007111719.6tgo32hh7i7dely5@google.com>
References: <20231006124839.z7auhc3mk37gxios@google.com>
 <CAPnjgZ0UfANCRmy2X5iptz0jZHu8Wfda4geJX4Ntzma2VVcWPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPnjgZ0UfANCRmy2X5iptz0jZHu8Wfda4geJX4Ntzma2VVcWPg@mail.gmail.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Simon,

On Fri, Oct 06, 2023 at 07:22:14AM -0600, Simon Glass wrote:
> Hi Pierre-Clément,
> 
> On Fri, 6 Oct 2023 at 06:48, Pierre-Clément Tosi <ptosi@google.com> wrote:
> >
> > +       if (namelen < 1)
> > +               return -FDT_ERR_BADPATH;
> > +
> 
> This would be end == path, right? Would it be better to check that?
> Are you worried about negative numbers?
> 

The main focus of this patch was namelen==0 (e.g. fdt_path_offset(fdt, ""))
which violates the spec and makes the function return the offset of the root
node, a counter-intuitive result which, if used internally (other libfdt
functions call fdt_path_offset()), could lead to unintended behavior.

Furthermore, under the right conditions, fdt_path_offset(fdt, "") may lead to a
stack overflow attack, which this patch addresses but which is also separately
addressed by [1] (although one doesn't make the other redundant).

As I was adding a check on namelen, I took the opportunity to also reject all
negative values. Do you recommend I only reject end == path and accept/ignore
negative lengths?

If this validation makes sense, v2 will add coverage for it in 'make check'.

[1]: https://lore.kernel.org/devicetree-compiler/20231007110710.i2oj24oirdtyt5m4@google.com

> >         /* see if we have an alias */
> >         if (*path != '/') {
> >                 const char *q = memchr(path, '/', end - p);
> > --
> 
> Regards,
> Simon

Thanks,
-- 
Pierre
