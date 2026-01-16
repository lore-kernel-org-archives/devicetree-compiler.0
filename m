Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083E43358C0
	for <devicetree-compiler@vger.kernel.org>; Fri, 16 Jan 2026 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768574389; cv=none; b=cszgr6d6giRBYb4L8AmpFC04iw3YEwRfOS9/4DnOqTdeg9gm31Odym5541MrBtL7wm6P5ejlMSYDTwpDTnTqQpuG4sk5tNTcgBDVqv1yAwtIjt2FVgjjESRBi5jM8Ic7vmzJ9SqPTJjLeyLCxFPuMO+wDE/jp0NTdXw+2RI55r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768574389; c=relaxed/simple;
	bh=xqijX2F9/Sio7M7z3kdH8sE0LBY6+W/gtFrzv89p9RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJIBvewEL9rGAaftN3yE6kziH3qdWknhMEtMwna1ffEC5esOCi8xDBrlu4JY+ppg6RmWyNPq9/cT+c4lUBht6/JLt4Cerk5vyJkTxr+uWxEmJn0Fxjml5GzSnJo22a2o6vgopdWSulicLZheuRjAAdEc/V2k1zg/RO3OrjBapIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RM61aDsk; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RM61aDsk"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b6c89d302so1832078e87.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 16 Jan 2026 06:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768574382; x=1769179182; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wnwmL2cd/FEruvQ+Ml+GAKEU0s6y4XS25MpR3q8TgjY=;
        b=RM61aDsk8QV2jOyKnhRZOSbz4G+jM4cnTVShgpIF/Joe40lVNbs0YrGN9Y85d/wpPS
         qGGBtJbNJirq/LP4ddQgqJcXTjhwD/Mxeva2xZQqTNbOAoEr/FC9UVRdPNzH0ZWetRLF
         llNP8ho9Ob4zs+ZRAFF3A/+sk1btsNVAvYfRK2foeLOnDlhAwDgrkuPX+NiJkMbpJGty
         mHe81ZgMvREMmGMCtSmxIc6Y0jtH/srjIbk9KCjJPqCOE2MTeGFfO3tW/KuS9gBpn1XF
         7q6cdjlp6tSR2MQC1n3zgbScLch7c0J4VMjOuNWXoA9pqjHmRjlUL707sF28V1CnvLoJ
         H5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768574382; x=1769179182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnwmL2cd/FEruvQ+Ml+GAKEU0s6y4XS25MpR3q8TgjY=;
        b=YDqYvdoz1jRcaNqPvDxIkclQxE9ExFXP85J8zNP9XBXq1a7K5mCRwv8CzKMo1uDvZ9
         e1S3bsf3jc90U+j5vIgG/aPO/q8lOOqTpG0/lpdX8DDwsS6dAtYgBqPz7kT3xktek0ZB
         /STVLkjBZCqqqaE8aWdsn7SHMbw9A0t3KUjqpI0oN2Fbv2u37Aaa2fDBzzcTiB1LeZs7
         QUJH7Mlx1WCzkvNfGzJE36QMd5Ug4dSJXDjE8g131vUF+g1fUKVgrJit3kwvW5TLKqKR
         oMHPqLVfj6hPe97aAWHkCp3m2+ep/sXkDRFYzLWdu0QmfiPo83Cz0LwVDdPux9jJFVr0
         9S+A==
X-Gm-Message-State: AOJu0YyojeNViD2WFvqc09vhs/ZBpfUnl8SW8V4sflrWzttMBERP/TNC
	j/g4DNH6O/p2oMhKqDZxron2IZuJmSAf5VMufedo43gsPuRzrTbJlaQJNhdPx3L8K+89n36x02f
	uLCWuly6RfUc6pTXOeDpSvhNM0MYk0ms77w==
X-Gm-Gg: AY/fxX58wCoSDO6tOLs34do/cGwz3nusQRzPToA0Lh73VIV6ybrz7cvLjtuNcvScA5p
	dsQGw6QPbOBEAmn3fIED/7ntJtoQPNMz6UYTh3gyO0U9paeoOdjoDsgOrQUK4oL9/kD5g43nttf
	pwnel/DSVDGp5o38CPHy1BCAnK+RmOC1wAa0QzTawV0PAn+PfWyjfTsp23UK1FSzjN5ROWUVEig
	Wu5sqgGAU8dxno9iNlStAj+B0dK/hPRlGVCpgdy9luTZfdtyoRDGK99C5qIv27FymqYn6w=
X-Received: by 2002:a05:6512:33cf:b0:59b:b3dd:996b with SMTP id
 2adb3069b0e04-59bb3dd99c2mr513653e87.18.1768574381654; Fri, 16 Jan 2026
 06:39:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALx+s3Qaw15b2KbLfS4SO9tmUw7PkDTNAP1dqk7273DQMCwVwQ@mail.gmail.com>
 <aWmARb6Rj0GL-Kky@zatzit>
In-Reply-To: <aWmARb6Rj0GL-Kky@zatzit>
From: Phil Dawson <phil.d.dawson@gmail.com>
Date: Fri, 16 Jan 2026 14:39:30 +0000
X-Gm-Features: AZwV_QjAfNfx1Ds5velEqR2lKFtIf8rS2lItGgdDO0cClFD4MlyT-6P57OTJEyA
Message-ID: <CALx+s3SsAikSU_Butewas-MRmP+Dt+WhnwGuYgY=x=OSw8SfQg@mail.gmail.com>
Subject: Re: delete-node without label or address from overlay dts
To: David Gibson <david@gibson.dropbear.id.au>
Cc: "devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Jan 2026 at 13:03, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Thu, Jan 15, 2026 at 12:00:13PM +0000, Phil Dawson wrote:
> > Hi,
> >
> > Apologies if this is covered in documentation that I've missed.
> > Is there a way to use /delete-node/ to remove a node with no label or
> > address from a plugin/overlay dts file?
>
> No.  /delete-node/ has no representation within overlay files.  One of
> several examples of how plugin/overlays are misleading in that they
> sort of resemble dtc's older build-time overlays, but not really.
>
Just to be clear as my understanding is a bit muddy:

I know you cannot use an overlay to remove a node from the base tree
at runtime.

But is it correct that when constructing an overlay with dtc you can
only use /delete-node/ if the node you wish to remove has a label
or address?

> > I have a device tree overlay file pl.dtsi that is auto generated by
> > vendor tools. Unfortunately many nodes in this file are generated
> > wrong and the overlay fails to apply.
> > I've been removing the broken nodes with /delete-node/ &label; syntax
> > in a second dtsi file and then compiling the two together with a
> > wrapper dts file and the commands:
> > gcc -E -nostdinc -undef -D__DTS__ -x assembler-with-cpp -o pl.dts.pp
> > <path redacted>/pl.dts
> > dtc -R 8 -b 0 -p 0 -@ -H epapr -o pl.dtbo -I dts -O dtb pl.dts.pp
> > (These are run as part of a larger yocto build so there may be some
> > other work around this I'm missing!)
> >
> > The auto generated pl.dtsi also has a few broken nodes without labels
> > or addresses like this:
> >
> > /dts-v1/;
> > /plugin/;
> > &amba {
> >     vcap_hdmi_input_1_v_proc_ss_1 {
> > <contents removed for brevity>
> >     };
> > };
> >
> > I am unable to figure out the syntax to remove these nodes with
> > /delete-node/, should this be possible?
> >
> > I've tried using the below syntax:
> > &amba {
> >     /delete-node/ vcap_hdmi_input_1_v_proc_ss_1;
> > };
> >
> > But while dtc doesn't complain, the nodes are not removed from the
> > resulting dtbo.
>
> Hm, we probably should make this generate an error.  I'm unlikely to
> get to that any time soon, though.
>
> > I also can't remove using the full path as there is no root node/full
> > path in the generated dtsi file.
> >
> > According to this discussion on an unrelated project
> > (https://github.com/zephyrproject-rtos/zephyr/discussions/67228)
> > trying to delete a node with a name and address without using the
> > address won't work. But in my case the node has no address.
> >
> > I can work around my issue by hacking the auto generated files (while
> > I try to persuade the vendor to fix them!) to add a label for these
> > nodes and then removing them using the label. But is there a correct
> > way of doing this just using my separate dtsi file and dtc?
> >
> > Best Regards,
> > Phil Dawson
> >
>
> --
> David Gibson (he or they)       | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you, not the other way
>                                 | around.
> http://www.ozlabs.org/~dgibson

Thanks,
Phil
