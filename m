Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220D5410D3C
	for <devicetree-compiler@vger.kernel.org>; Tue, 20 Jan 2026 11:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907426; cv=pass; b=ZUIud6EvjGLRZyCUmExtqSbPeqdYz8+gOqaXd+ViW2TtWlROYG7my8ozeBKTNRSXh41dRr5GbUxPj1nIRK6fdtK0141LYanltehWCVApStf3QN5740z8DPczuwfA+DBFX2xMuu1YO/4OMA+4Wsj97VVlyECEbSqnZcH6XZ1XgGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907426; c=relaxed/simple;
	bh=lIbio0UCXdUExOD8BCdZ+Lr9UWWwQTeETZMsGR+n3rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ix1SW0JESXFY4hEsEO4lxcFYl9kpuHHIBj/DgOjb60p3q+qHUEQnWtiwOBYcKyC7eIRdLzKMpQylRvzELo9CIsDHBenjL8jsAU8yJlgdTdnpCQjnVThe0F3USMQAyXgnJHzcd+eMLRjmTEVsfdxJwq9p3TT0qvxk5/HNZag6c1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MI35mmjS; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MI35mmjS"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59b7073f61dso6443778e87.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 20 Jan 2026 03:10:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907422; cv=none;
        d=google.com; s=arc-20240605;
        b=QhNWMBpM9mfj0GdLGY41VMsN86+cCJ+dkT9/KCaVQ7H2q2yrxTN69eZukMXm/i1wv9
         zDuduBsiJXgqogRqjVW5M+Vf/F5ihrr/wVDCeOTqktCr5no2BvXUUiFX5tPWhUjoa/wa
         jXO+/g5I4aq9AbFiHB0L4pzPWiJP1GIU5dMyxGbfu+RYLIlzYD1ND6Et39nxE/bhMPqB
         bea4v4eoozVh8RHHzeOVK9yoyA57k7z79gdnZdntxDQoMFG0l34nogq6U0XMtE1CjRFc
         z+S9cSiakCUOE0TFN4BCRnRLMjPIbUU+Ndc7MXTcQKgPc1AUi1OGFwfkCYrlNNuRB2IG
         sfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UmIm6tcFRaRM9TTETeUwdzgaJlGFFFHtY5pnIw84jos=;
        fh=laevQumhlEHYf4G4JG4UTENVmc0lq7yRxLf3x5pMKXo=;
        b=Yo06s4LPzBdpGUu+G/eMOigHiN17ZpeccX+O/EKV4lWgUxGaU/uZQlF1olPR7dEJ+O
         scfJd27p4gF0yBhNxtuT/U1jBeCXf3uUVtOL2XJXHXx9tfEOEmbjCwrVXNkgsKXrIiP+
         jqdD+yAsBk3zOB6KxsK+wH7YbWadJXCPysi2DjO+zvmM4n4rbX/KiVdgWZqoYFkbjx6y
         EEV+wzHAINqqcRQpWexYV+wNQ4/pSd84gTCBqk/ZZ313HcQ4RakxFjoRp0NPRWlfA8DW
         eQKsl65F87Up3vZ2BaVGXQcGm8DqACAP7X9/wAYsXhQRAZdlj1tRIX+ytI9q1dwZ4Iu3
         7QYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768907422; x=1769512222; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UmIm6tcFRaRM9TTETeUwdzgaJlGFFFHtY5pnIw84jos=;
        b=MI35mmjSemJBhTcCD1vDPXiyW6FQXRhJN4jJZpgt0txTqw7VCAnWyWHBDcAPeFbXh4
         erQ4j4aGxvgqNQUSp/9dcs2u/OOEh7mfKdBZN2IQ7vz3kfekwEiQFLL8e5xe2jWBvHg3
         gOHTY66QNCdJamHaR1dQJ86gnUf1SVDXKfjBN+1dd0ESE1om3klho+yNnj2WT3orAQwL
         Obi4qUL8wPRofVs6aPErPPX3OuzsKTTMZ4K4lC6dY4PS7PIxFhc+sAz0P1m++66r1oD0
         /yJ1Wun7r9CNjM9DBMrjCPYGErG0/JvX7QsQ1f4CHJp4vN+MBf2kJBM72+LBCz67rngY
         jKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907422; x=1769512222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmIm6tcFRaRM9TTETeUwdzgaJlGFFFHtY5pnIw84jos=;
        b=IyUP8jTWHURxJDg/PG920bxtzfsV1WbMvBgnFRXCExdlMPAdMXnN0wlpS9seV1Nkdk
         irunro4P631Gey9WZ44kKh334W9BsnPurA1SEMtF++Kws8XGx+MLqX+gqIoXsBgxGXeD
         MomlQapiW1hoceneFP01qUjiWIyP5EOC2VS7nIkm3qe35aTKXwwjXlDkLL1fGg9LIVUa
         F81QWZ+5D+eQFAntJs936+hy+jgFbLJtWUQW8n7LTe7MlhFqMnG1Nhe6cc+AFMB2ZdPb
         p6nm/pIYOi8tynN/MNLFgBvkOj/pkHlMa0KHAA0KkzuyCA9xlZS0zTlZnCahaoqbQSrj
         HyqA==
X-Gm-Message-State: AOJu0YzhMxqjjRIdPbRhb2TBlcWTqkCDX6km43gio58RQNcnNJYF+Tzm
	f+nsMy4ymNEuAxRUAWls/ojmM9tcTU12prtzw5x0YT/wk+0DsSu0SUbMqSLnNMgi6nQItwVh+/O
	QPRYqR5Ak/9t70DIkLh23sA/8RVXs7CGdPA==
X-Gm-Gg: AZuq6aIlEqcLh2sCdhyzUsK2MStmsA+rhyyTUeAUT6vCStnm1Uq4kKpF0kF90r3VcmM
	+fezr08mUWmLAUdxbL6Pe7dZi7JGnpArJSHDbLWjnIoYSC+I0BD869bSWKDNKuj66H8T8BkrGiD
	yGHuOJ8Gb3ZgGdJa2MoSc6IsF1rDTpIY4t+xWXm2m4xKDXQ62OZ1wIGY/AFilgDybxi27QeEoau
	oDl3a84CqFi/W7wNpGNf3SAsHqC+WN6H8N1O7pxcQ7Bc24IOO9wzAK1DG+aZXACQSkPhpA=
X-Received: by 2002:ac2:51cb:0:b0:597:de28:5fe8 with SMTP id
 2adb3069b0e04-59baee93e6emr4747148e87.8.1768907421547; Tue, 20 Jan 2026
 03:10:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALx+s3Qaw15b2KbLfS4SO9tmUw7PkDTNAP1dqk7273DQMCwVwQ@mail.gmail.com>
 <aWmARb6Rj0GL-Kky@zatzit> <CALx+s3SsAikSU_Butewas-MRmP+Dt+WhnwGuYgY=x=OSw8SfQg@mail.gmail.com>
 <aW3Q7sXrrFR-Ki3i@zatzit>
In-Reply-To: <aW3Q7sXrrFR-Ki3i@zatzit>
From: Phil Dawson <phil.d.dawson@gmail.com>
Date: Tue, 20 Jan 2026 11:10:11 +0000
X-Gm-Features: AZwV_QjSpeYreQdVpqLDXauaig_9hkZ8LSbimbNOZtz9VmTMZA_K9dusj26r8PU
Message-ID: <CALx+s3QPFHB6acP8CLBTEn5kzTRHaQXaKHpRe5jfCi5GdJ4Hew@mail.gmail.com>
Subject: Re: delete-node without label or address from overlay dts
To: David Gibson <david@gibson.dropbear.id.au>
Cc: "devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Jan 2026 at 04:53, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Fri, Jan 16, 2026 at 02:39:30PM +0000, Phil Dawson wrote:
> > On Fri, 16 Jan 2026 at 13:03, David Gibson <david@gibson.dropbear.id.au> wrote:
> > >
> > > On Thu, Jan 15, 2026 at 12:00:13PM +0000, Phil Dawson wrote:
> > > > Hi,
> > > >
> > > > Apologies if this is covered in documentation that I've missed.
> > > > Is there a way to use /delete-node/ to remove a node with no label or
> > > > address from a plugin/overlay dts file?
> > >
> > > No.  /delete-node/ has no representation within overlay files.  One of
> > > several examples of how plugin/overlays are misleading in that they
> > > sort of resemble dtc's older build-time overlays, but not really.
> > >
> > Just to be clear as my understanding is a bit muddy:
> >
> > I know you cannot use an overlay to remove a node from the base tree
> > at runtime.
>
> Oh, sorry, I misunderstood your question.
>
> > But is it correct that when constructing an overlay with dtc you can
> > only use /delete-node/ if the node you wish to remove has a label
> > or address?
>
> I think that's correct, though kind of by accident.
>
> > > > I have a device tree overlay file pl.dtsi that is auto generated by
> > > > vendor tools. Unfortunately many nodes in this file are generated
> > > > wrong and the overlay fails to apply.
> > > > I've been removing the broken nodes with /delete-node/ &label; syntax
> > > > in a second dtsi file and then compiling the two together with a
> > > > wrapper dts file and the commands:
> > > > gcc -E -nostdinc -undef -D__DTS__ -x assembler-with-cpp -o pl.dts.pp
> > > > <path redacted>/pl.dts
> > > > dtc -R 8 -b 0 -p 0 -@ -H epapr -o pl.dtbo -I dts -O dtb pl.dts.pp
> > > > (These are run as part of a larger yocto build so there may be some
> > > > other work around this I'm missing!)
> > > >
> > > > The auto generated pl.dtsi also has a few broken nodes without labels
> > > > or addresses like this:
> > > >
> > > > /dts-v1/;
> > > > /plugin/;
> > > > &amba {
> > > >     vcap_hdmi_input_1_v_proc_ss_1 {
> > > > <contents removed for brevity>
> > > >     };
> > > > };
> > > >
> > > > I am unable to figure out the syntax to remove these nodes with
> > > > /delete-node/, should this be possible?
> > > >
> > > > I've tried using the below syntax:
> > > > &amba {
> > > >     /delete-node/ vcap_hdmi_input_1_v_proc_ss_1;
> > > > };
> > > >
> > > > But while dtc doesn't complain, the nodes are not removed from the
> > > > resulting dtbo.
>
> Right.  So this happens because when compiling a plugin each top-level
> chunk is compiled into a separate "fragment" in the plugin.  The
> /delete-node/ here would remove anything already defined in the same
> fragment, but not things in earlier fragments.
>
> In non-/plugin/ mode we merge all the chunks together, so
> /delete-node/ (and /delete-property/ for that matter) will apply
> properly regardless of which chunks everything appears in.
>
> This is another ugly consequence of the rather haphazard ways
> plugins/overlays are designed / implemented.  I think we could fix it
> by not merging everything during the parse: instead generating a list
> of chunks, then merging them in a later, explicit step.  We'd always
> do that for full trees, and merge only those pieces that we can
> resolve for plugins.
>
> I think that would be a good fix, but I'm certainly not going to have
> time to implement it in the forseeable future.

I agree this sounds like a good fix but obviously time constraints are
always hard!

I've worked around my issue by scripting a process to add labels to
the nodes without them and then removing them at compile time
with /delete-node/.

Thank you for your help.
>
> > > Hm, we probably should make this generate an error.  I'm unlikely to
> > > get to that any time soon, though.
> > >
> > > > I also can't remove using the full path as there is no root node/full
> > > > path in the generated dtsi file.
> > > >
> > > > According to this discussion on an unrelated project
> > > > (https://github.com/zephyrproject-rtos/zephyr/discussions/67228)
> > > > trying to delete a node with a name and address without using the
> > > > address won't work. But in my case the node has no address.
> > > >
> > > > I can work around my issue by hacking the auto generated files (while
> > > > I try to persuade the vendor to fix them!) to add a label for these
> > > > nodes and then removing them using the label. But is there a correct
> > > > way of doing this just using my separate dtsi file and dtc?
> > > >
> > > > Best Regards,
> > > > Phil Dawson
> > > >
> > >
> > > --
> > > David Gibson (he or they)       | I'll have my music baroque, and my code
> > > david AT gibson.dropbear.id.au  | minimalist, thank you, not the other way
> > >                                 | around.
> > > http://www.ozlabs.org/~dgibson
> >
> > Thanks,
> > Phil
> >
>
> --
> David Gibson (he or they)       | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you, not the other way
>                                 | around.
> http://www.ozlabs.org/~dgibson
