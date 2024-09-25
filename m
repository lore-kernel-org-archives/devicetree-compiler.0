Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E920157472
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Sep 2024 07:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251101; cv=none; b=c8lZ/HSoAgKl5VrDciLpqitS04Avy3t+6Rc1I+3+nL7quaw9ozuAW7AZ31+8k5jqEqb5hfYvPLWs4xRli/rj/5Hu0/Z6GMTnnm7CTDk2p9FqFoZyTQhVNoVQVG6tZ/dAtEtCRO22zV9a6ZHx0nDSex/sQJ9WE5PBi1RR4lylyBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251101; c=relaxed/simple;
	bh=EVlPc7/VxyBCQtplnf3EHEw4Y2snITGTjq8KtpImApo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FgNIt8CDXgtFfwCqA2wyBg5c/ow086P/glblB5BQRqCW4m7R25V82vMJ0wFRIaVrpMe9t4AsbTNKOnQbPnL+ZPa7Vhi2i+g6+dJk4NKP9r9R4j7dL4SrEoexIQirAc36GyCnfc4mPHnspctR0TLQ01+CvM54opKvLpcN9rhaxNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e21a557d65bso5167073276.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 25 Sep 2024 00:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251098; x=1727855898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gn+tk815EORqjqxqZCY+2lFGlfTOBhEC6z7x50/4Do=;
        b=pRLm9EUHq17feVFhOog5fGH6IPmOcDnX1AN/kxFCrfb4rNqh89W03ya/XJ3fYIrXEz
         n6cFqLXlRlRxsoIHVESzjT9dEXcG42aS5vMfEOPKvoj0QjeQFLU7KPgHgYSb5HQqlPz2
         si+JlgO+2oflacdPSnTIFTi/91s3NhsexS6yzKprQ/fse3z8maMjse267Sw/7QVE609p
         ivHO8OxfF2crVSm40Be0wii4kx4nLuiqieYnJhshNXZEjbgTJzn++r+6E55HgLrZtjJ0
         4/6ltLY5/42q4JiW+/xEkz2HwP8WnIFePD8aCLd6tcJWLhS7VIdFwDL5S8WzCCMQh2q3
         eA0g==
X-Forwarded-Encrypted: i=1; AJvYcCXG1AnE5q2CNIpdsTx6lZxDUN9I7H25YVyGFcOESxG9Gzd1butHA7J0AwwVLf4tKPDrradtBB84HZsFCs6F2PPSvblr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3NFxn12+3bmCENjjKyMVmY2svj7dg3uu+vEobV6+wZznto1Fh
	+OHEj1RXN5MsoUPNDiCQGC4r2lj+yEflxPX3NqZtz5Ws1KxMzixi7gca2LLZ
X-Google-Smtp-Source: AGHT+IE0kBjom5pIZjYwvzNuwDrGzl73HHPhcu3fOHNsBN1Q0FESfArdIm7BM4O1E3GjvNjsQ+Owfw==
X-Received: by 2002:a05:6902:2b09:b0:e20:2245:6f9c with SMTP id 3f1490d57ef6-e24d84b52d5mr1428334276.26.1727251098479;
        Wed, 25 Sep 2024 00:58:18 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e24f530c2e6sm181762276.45.2024.09.25.00.58.18
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 00:58:18 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-68518bc1407so59803467b3.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 25 Sep 2024 00:58:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxkVMLvNMXTfmu0sP0vTvlUYd9OW6iDWQDwPGj8HPQ9PYj68T23IiiIAvmdg/E8XvG4AlVFOqR2+NSDfsyrDk+XEXz@vger.kernel.org
X-Received: by 2002:a05:690c:23c6:b0:6e2:145e:7733 with SMTP id
 00721157ae682-6e21d830bcemr14171487b3.18.1727251097920; Wed, 25 Sep 2024
 00:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
 <Zt6Bog4Fqcb89ivO@zatzit.fritz.box> <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
 <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box> <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
 <Zuo8yWrRPGcqnEwN@zatzit.fritz.box> <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>
 <ZvDjW7W1096FW8XL@zatzit.fritz.box> <99c2b16b-a9bc-4808-966c-96b60889876f@beagleboard.org>
 <ZvO7iUv06vxIvdpX@zatzit.fritz.box>
In-Reply-To: <ZvO7iUv06vxIvdpX@zatzit.fritz.box>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Sep 2024 09:58:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMFP_pNPEvi1n_CnUTXZ9SBk3G0o7cn6i3iQtca0G8kA@mail.gmail.com>
Message-ID: <CAMuHMdVMFP_pNPEvi1n_CnUTXZ9SBk3G0o7cn6i3iQtca0G8kA@mail.gmail.com>
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Ayush Singh <ayush@beagleboard.org>, d-gole@ti.com, lorforlinux@beagleboard.org, 
	jkridner@beagleboard.org, robertcnelson@beagleboard.org, 
	nenad.marinkovic@mikroe.com, Andrew Davis <afd@ti.com>, 
	Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 9:28=E2=80=AFAM David Gibson
<david@gibson.dropbear.id.au> wrote:
> On Tue, Sep 24, 2024 at 12:11:36PM +0530, Ayush Singh wrote:
> > On 9/23/24 09:11, David Gibson wrote:
> > > The old "connector binding" proposals I was describing aimed to
> > > decouple the type of the connector from the instance of the connector
> > > for exactly this sort of case.
> >
> > Do you have a link to the "connector binding" proposal you are mentioni=
ng
> > here? I really believe having a better way to support such connectors i=
s
> > really important for embedded systems. And I am okay with adding any mi=
ssing
> > bits to make it a reality.
> >
> > With `PREEMPT_RT` patches being merged, it is probably a good time to
> > improve embedded linux.
>
> I don't think there was ever a proposal written up as such.  It was
> just an idea floating around the mailing lists.  I did manage to dig
> up what were meant to be some illustrative examples of the idea.
> Alas, without any explanatory notes.  It was last modified in 2016,
> but let's see what I can remember in terms of context.  Note that all
> of the below was a quick draft - it would certainly need polish and
> all syntax is negotiable.  In particular the use of the /plugin/
> keyword might not be compatible with its current use for overlays, so
> that would probably need changing.
>
>
> The idea is that a base board could define specific "connectors",
> which could describe what buses / pins / interrupts / whatever were
> exposed on that connector.  Each connector instance had some local
> aliases referencing the nodes in the base board the connector could
> alter.

Several people are working on things related to this.
Please have a look at https://lpc.events/event/18/contributions/1696/.
I don't know the video is online yet.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
