Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793173171;
	b=BbNrOblGQlpTasfSSeukc/7rv6liyQoE6ksSHqlWYltcFL8rptP9FlCBRpjy5CRPWoKV
	 qlLsqivxEFC6zeaknGubCutCo39m3QC+U2m17m19OY/2mkRrLeLKl8iY5YOXiX0t0UVaP
	 8OYQpnINoxmC98F3PvSllKHuWwnLTiG4MN0gb//nF3618OE3PKNMdmCeoYp9UlvToCtUL
	 RoMNMJ4vNj4ypypxEij5a4nOyncmRuEsaVhKY/u6afFaseef0jzdQI6NYwh75nOZtm50x
	 EPeIXGSXTAxcchj2mpNdreEkPK0qPp69z7a9o1sHqhK+ZOcV+J29NCYafrlpzd+dqag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=x1pPinX2/ITNqUprOT3iftqG1z5B979KvKQdN+XDSMA=;
	b=or9BgMzbD2pZlwWMDq3qR8C9F399/QOyWNf++gXZPcwo67q/PKhr81W25sh8UIQ2C+Ws
	 4k05UaYvvXvRuxQf5LlLF4xBkqI5W6uu1P8ZWjvjMNmLOsWQac0Kb06ixvyuA8UIKE18k
	 QzDUclWP86CxxNkk5n+F0SQeiubYcO5/Z20cABug4Pfw2FOmG1iW9UUFZ8CkIqU01ROIe
	 h+ZwmCVFtNhPWJIsrWiA43QkEFI8lugGX8iu/m/qbySVgpCQz/rpZjhuEWMXYWlLtinvC
	 9AQGNMLn9XToQbkdfCEuce0xZRCB9CI1tggoNYfhGA3p7ePMU4xRu6Ptldo9aYS977Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Z/bml/l4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54CC606A31A
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 07:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D54CC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z/bml/l4
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so904039a12.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 00:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793173169; cv=none;
        d=google.com; s=arc-20260327;
        b=ebCY5RdBPNzkPDbG8dkshuDRDaVkhsmRikPTxZJgEJqZlmZSCiQIcw90I1sfeq157I
         cFlP+SjQgD5WmxwDJOw24L+83VvNTPYQLwYz/02HhBnS7cmdOqQAb/RI6Ty5Eo7Nyx4z
         fbUzJqvGmH2KsRDZ1m0L7sf7/vbXDztAV2Vz9OpD99PVbWRF0nCoApH4ROYDR2YHK+55
         rHlKqJ5kTtx1K2DJjZe+pNZjpHu2XC4+Uw6f5J+mNfpli/HZ6DF+hML3Jlv1nSmejJ1t
         rt+s7eo4OIDywqiHkkiMUphwgrKT7GzgMq0Vblo4Vw2CDsY7zxeAKF9Pq1ApWHie3p5f
         HfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x1pPinX2/ITNqUprOT3iftqG1z5B979KvKQdN+XDSMA=;
        fh=srd9RlF+16/dPyjlTyWSZRXUPbkLZ5CDxVawIXOQn9Q=;
        b=diLRgInC1MGeuo1px2YPpch+K13AJPEJMEIRf4muZwk20z5p6Wo5LoC6q13KxNRJTr
         2bK8nO8GN6P3LL+WQUkcmqzpaCjKftiQvjt0BWSTTZur4piS0L/Jkecnmak6uqPQiEg8
         dfBDAdUDmZ1hpdX4eTgP3oEM/TTAupEqW2o28xejeuZH5Bk9nW0B6gU77ZoCkuWnllyU
         UoSYkPl9bvGqbz2Wh7gO1jj2azXZnRB7sl8nUU30BhMA6y9IJB0GPGGr9UT1d3gkpXja
         scRz9NG4fnXRB9tcNOSHDaUS3d0KnhVloAFkyPmJ0fMdd6FSGJaPpaxQi97R/BOhw8cL
         q6Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793173169; x=1793777969; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1pPinX2/ITNqUprOT3iftqG1z5B979KvKQdN+XDSMA=;
        b=Z/bml/l4beog0nNHJFb4UM0wCkTTqtSzB4DwqHQwxThs5eRWnRqLzjQBqsT0RNRhuD
         WTEBpsA+PK0YJq2d0lhI1Ex9J3CQXcduIbA9uft6GCzMK279+2bVeqbBX4Fl9YNfy9bC
         WHdMmd6ENpHYSyTMPTx7M/ZPUlv6nIWm5GF/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173169; x=1793777969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x1pPinX2/ITNqUprOT3iftqG1z5B979KvKQdN+XDSMA=;
        b=N0aQ/Qti7BRn1RV5tDlLwRTu4PFsKoFp5duYvvKKIds1OYGnoWlzQs+fmcHY1JRfFC
         Zu8Oq8bS34Z7XOIvmKHyIJ7qrFDItlyPGW2oCz7XbZxGPp/EdRDkhOr9QS3E5AXhvlga
         IorWR4HDorTSHhdhUdqPMe/LO5WupHF01Fyu/Y9Qpvr7sCbezJU5+9oxkeHLkQO4POlD
         71FVUFeXC6dgwbacVWvnwTGjNZLJyndAaT6gNc5FXCZSv379UpfMOUw57jBqpBMsDGPZ
         DFAQDvqH9HPzN7WtqPJJ75+eXu1T+1cTui2DWgqCfzLa3/V8Wlkt1whLZi76WiugQB1W
         AZoQ==
X-Gm-Message-State: AFq9FYJNZ6AFLvgDGa0KQ9Ct0p4zpU8j9A9UeotL3D8fkOoX2rUsrWRK
	OCDyBWor0LdIg7mgLDA+dmNaFyTrvQkmS0Mq3A+HsJM0Pwbmxc0BgykkWXGADI4EDml0JnSAIPD
	sT/3ffjse5OrDdmnZKAChgww4vU10GPaS4vlrirmSSQ8lR5hXmgz+dg==
X-Gm-Gg: AYBFou3Q+SdzuyMBK+tp/IygHhQu2Y9aaWsK7cqKBsJdmy9Vp8GDpYMuJP5YKgXE6CD
	sCAJCCPf/F3Gw202mPHHs9CwbkTFKLqsv9UbGsMrMeWN1bf2+sTuFO7qtB1m4qaxl8b5MEWfOGh
	3Q+GbHCJQiR8a0omVr2Ltsk/UD8yeScBcKcJJHcxMDkXBdQAR4bVmZWvYUinWJWCFUXcgy9ANkQ
	zajckez6W4lpD6o/l93bJbbXKO+Y0FfD+5TS1Rl9G4eOlOplCreqO2wJKmHhOfEdMI5qNQbkdiK
	bYnxOidBLT8srJJBCbEnXENeqejbZKC4/6C3hgUUWkDakLs0d9D1j1kIs7Gl4M1paJX+RhRWNKG
	iQUS4wt82QpN+b+ANJXj6IUzL6hbg2yWA7ls=
X-Received: by 2002:a05:6402:2813:b0:6aa:ff76:3076 with SMTP id
 4fb4d7f45d1cf-6b49cc08c09mr880021a12.32.1793173169282; Wed, 28 Oct 2026
 00:39:29 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027120126.2613353-1-sjg@chromium.org> <20261027120126.2613353-4-sjg@chromium.org>
 <auFST7UJccNIHAIU@gractus.seuss>
In-Reply-To: <auFST7UJccNIHAIU@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 28 Oct 2026 07:39:16 +0000
X-Gm-Features: AclHuK-mrdaoqYKLlzFE_aqTHx8Iv2_9uOlsiTOf_VCWu0mIuo7SzA4OvWKEM_Y
Message-ID: <CAFLszTimRS7feowpJxVe3ox4crdxGm7XFwi5zFjMeWNoU+PK-g@mail.gmail.com>
Subject: Re: [PATCH 3/5] fdtput: Suggest -p when a node is missing
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, 28 Oct 2026 at 01:47, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Tue, Oct 27, 2026 at 06:01:17AM -0600, Simon Glass wrote:
> > When the node being written to does not exist, fdtput just prints
> > FDT_ERR_NOTFOUND - nothing points to -p, which creates missing nodes, so
> > it is easy to conclude that fdtput cannot add nodes at all.
> >
> > When creating a node with -c, the error also names the full path, even
> > though it is the parent which is missing.
> >
> > Add a hint to use -p when a node is missing, both when writing a
> > property and when creating a node. Report the parent path when it is
> > the parent which is missing.
> >
> > Add tests that writing a property or creating a node fails when a parent
> > node is missing and -p is not given.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

I ended up changing this a bit so dropped your review tag on v2.
[..]

Regards,
Simon
