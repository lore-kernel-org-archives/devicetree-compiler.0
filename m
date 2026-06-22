Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6DB366048
	for <devicetree-compiler@vger.kernel.org>; Mon, 22 Jun 2026 21:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782162894; cv=none; b=ue1bi5wxr7WBwq1STpCOZTbbw5GUOIL3Nzxy4yR/6ZVbxELXa+IScCacEVN69sbEhlVzSF1s4XKjN3fvPvhq3XmwD260WsK18m3CJt6sRv6DyXi6nx6Z4nif7aQuzUnsiN7Rab72SdNmNt5H+CI1MwmdWverSPG4BmUIbRgkdcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782162894; c=relaxed/simple;
	bh=ezRX1dX3hLIf4CfxuAdnLbq+Y77jIGJ3giaFmGdi5U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbmidrtZJNZFEu2bZ0KUlPKwaarW8xmleO7TZapxLi7XDjfUZJJ2VcsGWTqc68KFfq7sN/Dn8L65zJOhtV5OEFYv43mqnLrkTC8zogNfQS2XDRlGJ4nmyMA05AhKhuP0NuFDBpJE8fL8RleSOnqFemAb3UF1iTN08glFRtqfhN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F/YP0rMW; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F/YP0rMW"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304f590dd91so5614040eec.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 22 Jun 2026 14:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782162892; x=1782767692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lm3d6HmDPRNPlq9AMDDwSrWXby1FWdHeTNlLEc+80s=;
        b=F/YP0rMWwTqqImb1EJIji4RBMcQz4Pss+UOAGFBEc2DsfKGx8lGLfv/y3mwMFDjFFL
         DYF4mXI7uDlmFaK7BViyxjj5OZzHUsoqj85UO9fxQqExSqsymoJL15U7T8e2K0CyrpO/
         OIOINL9jJpoa4QQ05cHEUS+QICh5GE2nKVNJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782162892; x=1782767692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lm3d6HmDPRNPlq9AMDDwSrWXby1FWdHeTNlLEc+80s=;
        b=BUNClzSdu6x4dWjJbhBrVjJN4Gss98VAOH+GgggpNYbupqFDpRTBujCzyOC3VoeaFy
         lD7MxqrKYeHMnNNevnrZYEAh0APm3Rsu/VhNLUczeNYY45LD4aaKBaunEslAziAHv+SC
         OB+/OH9LLIvpe2Y2drPp1WeqGS/A1VmqPsVd7CF+uxNESAPF+E+39DdJI4AaFG1nnfZi
         qndX2TDcIEiHdYQIQdHL/q2xK3X+e9hRNSxZO/63gVBkRI/V+/bNgQ8dTsqw0E5Wt1yI
         S2wj9fD30tELQDc55xR6t/L29ThGXJf6+gu0QNNegtZvgNX2xqT7BgS7I3MTd7mDw0R5
         6GlA==
X-Gm-Message-State: AOJu0YyJUp4AQVazHTC+xD9UiVPvbxwVKF+Slz0cIRXFlzSBlZKboeJZ
	ewYMRat2oRzYAym/DdFfOuBRergt6br7gM86uWiSMgSyZwNyJ8HoqK46VNhjXO++kgQApmcDXbK
	gZFVOTg==
X-Gm-Gg: AfdE7cmrSFEz9Rmbignn5BQeW9AU9gqLHgmaj3mPBdcxbbT9th9ueSeha2c+Z/ne5EJ
	QkZ4XKF3hnYZBgMGexacMA2ch7WZcj51jrVAcs7Ay4sLDBITt21qdi8mBn1KmFmTzrqCwk0YpnR
	faCyrdiczqGb31nkECDBtssf9i2Sz/zPZTLXPhO3fit89QhjyAL7RBeLHuBAU1GVtFhPlnb2HRi
	8B+qi1iGnifjA7sZHcW9XusdSgdjQpUFjuKRaZHAupcJC0FqXk8b/ejz7cNhkjrgthS8Yiihnt/
	LXzNRmmew/gnx0INgn33OpXaTDvG6eqM/+KHA6wg/NHpb2KF6A2/lvP0yNqhmqY22h+LVQRhrvR
	vZ6Gqji3pPg/8IYCgw2h+d0uLKkSTyeZmU0cGvcBY5zzU9jLMTAl1SldPixdJNoR39TsdaGf2ai
	J94sUhoAHdRcvrt0fju0hYiwMx01dlsXTe691mQYJNV8JbCY1F92E=
X-Received: by 2002:a05:7301:2f8b:b0:307:91f5:8eee with SMTP id 5a478bee46e88-30c06e33661mr11630564eec.12.1782162891627;
        Mon, 22 Jun 2026 14:14:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:ec1c:b856:82f0:f8e8])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-30c5178a68dsm1849387eec.22.2026.06.22.14.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 14:14:50 -0700 (PDT)
Date: Mon, 22 Jun 2026 14:14:48 -0700
From: Brian Norris <briannorris@chromium.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Avoid warnings for reg override in __overlay__
Message-ID: <ajmlyJ-JWc9MFyMO@google.com>
References: <20260617204401.2275738-1-briannorris@chromium.org>
 <ajOrX76nVn7mN5am@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajOrX76nVn7mN5am@zatzit>

Hi David,

On Thu, Jun 18, 2026 at 06:25:03PM +1000, David Gibson wrote:
> On Wed, Jun 17, 2026 at 01:44:01PM -0700, Brian Norris wrote:
> > A simple overlay case can hit a number of false warnings just because it
> > provides a 'reg' property [1]:
> > 
> >  * avoid_default_addr_size: the generated fragment@0 node is an
> >    artificial node, where #address-cells/#size-cells can't exist.
> > 
> >  * reg_format: we're assuming the wrong/default #address-cells here, so
> >    the analysis is wrong. (We don't know how many cells should be in
> >    this 'reg', in isolation.)
> > 
> >  * unit_address_vs_reg: we don't know the real node name here. (It's not
> >    actually going to be "__overlay__".)
> > 
> > All these cannot be checked by the overlay compiler in isolation.
> > Suppress them when we identify we're running in plugin mode, and we're
> > likely looking at a generated __overlay__ hierarchy that can't be
> > analyzed in this way.
> 
> Yeah, the check system was designed before runtime overlays and
> doesn't work well with them.  Specifically there's not distinction
> between checks that can be applied locally (just looking at one node),
> checks that can be applied to a subtree (without looking outside the
> subtree) and checks which require a full tree including a root node.
> 
> Just suppressing checks ad-hoc like this is not a great solution.
> 
> I had a loose plan for tackling this, amongst some other problems, by
> making the assembly of a complete tree an explicitly separate step in
> dtc from parsing each fragment (here referring to compile time dts
> fragments).
> 
> The idea was that each of the (compile time) overlays would be
> separately parsed into a temporary tree, rather than assembling them
> together into a single tree as we go.  Then we'd have a pass applying
> those checks that make sense for subtrees separately to each
> subtree/overlay.
> 
> Then there would be a separate assembly stage.  For full trees that
> would essentially apply each overlay.  For overlay output it would add
> the fragment@XX/__overlay__ encoding.  Afterwards there would be
> another checks pass for the assembled tree - that would have a
> different set of checks from the individual fragment tests, and
> different ones for complete trees versus overlay output.
> 
> Unfortunately, I will not realistically ever get to this.

I'll admit, I don't think I understood some of that "loose plan", but it
sounds like to get any benefit, it would require running the compiler
with a fuller context of both base and overlay. So does that imply it
only works when invoked with a pairing of dtb + potentially multiple
dtbo? That sounds like a totally new execution mode, and much outside
the scope of what most DTC users are likely to take on, when they simply
ran into false compiler warnings.

> > 
> > [1]
> > $ dtc -I dts -O dts tests/overlay-reg-override.dtso
> > tests/overlay-reg-override.dtso:5.2-14: Warning (reg_format): /fragment@0/__overlay__:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> > tests/overlay-reg-override.dtso:4.6-6.3: Warning (unit_address_vs_reg): /fragment@0/__overlay__: node has a reg or ranges property, but no unit name
> > <stdout>: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> > <stdout>: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> > <stdout>: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> > <stdout>: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> > <stdout>: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> > tests/overlay-reg-override.dtso:4.6-6.3: Warning (avoid_default_addr_size): /fragment@0/__overlay__: Relying on default #address-cells value
> > tests/overlay-reg-override.dtso:4.6-6.3: Warning (avoid_default_addr_size): /fragment@0/__overlay__: Relying on default #size-cells value
> > <stdout>: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
> > <stdout>: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
> > /dts-v1/;
> > 
> > / {
> > 
> > 	fragment@0 {
> > 		target = <&foo>;
> > 
> > 		__overlay__ {
> > 			reg = <0x00>;
> > 		};
> > 	};
> > 
> > 	__fixups__ {
> > 		foo = "/fragment@0:target:0";
> > 	};
> > };
> > 
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> >  checks.c                        | 17 ++++++++++++++---
> >  tests/overlay-reg-override.dtso |  6 ++++++
> >  tests/run_tests.sh              |  1 +
> >  3 files changed, 21 insertions(+), 3 deletions(-)
> >  create mode 100644 tests/overlay-reg-override.dtso
> > 
> > diff --git a/checks.c b/checks.c
> > index a6037ed08000..dd6824dce6ea 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -368,9 +368,12 @@ static void check_unit_address_vs_reg(struct check *c, struct dt_info *dti,
> >  	const char *unitname = get_unitname(node);
> >  	struct property *prop = get_property(node, "reg");
> >  
> > -	if (get_subnode(node, "__overlay__")) {
> > -		/* HACK: Overlay fragments are a special case */
> > -		return;
> > +	/* HACK: Overlay fragments are a special case */
> 
> Yeah... it's definitely a hack.

I'm just maintaining the comment you wrote. While it might be considered
a hack in some sense, it solves real problems that you admit and several
users have reported. What's the downside?

Or, what do you propose? That users rewrite the entire warning/checks
system [0]? That they use dubiously-compliant workarounds to suppress
the warnings [1]? That they use non-ergonomic syntax [2]? Or that people
just learn to ignore warnings (the status quo) [3]?

Brian

[0] I seriously doubt you'll get takers for a rewrite.

[1] (Herve's suggestion:)
https://lore.kernel.org/all/20260618222438.1423c6c0@bootlin.com/

[2] That you agreed is "not a good solution"?
https://lore.kernel.org/all/ajOpRVdPadsDi-KT@zatzit/

[3] Or if you're lucky, selective filtering:

  dtc \
      -Wno-reg_format \
      -Wno-unit_address_vs_reg \
      -Wno-avoid_default_addr_size [...]

But this might have even more collateral damage, if people start
applying that to *all* compilation steps, and not just
overlay-compilation.
