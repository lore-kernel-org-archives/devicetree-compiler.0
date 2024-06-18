Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBB016D4F2
	for <devicetree-compiler@vger.kernel.org>; Tue, 18 Jun 2024 20:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718741088; cv=none; b=TLkDw4JbutdTGUBxNpbXsKqMBkwJtfIlwwyo1ROHjNmnUK7y4pF2hadYXObBA6nxHmmAei84qqLJ3/4YHuUX+u1c5MTjFT31i2RZO16Vb7o0k/PaAy9xjkGEo2Pp1XkzYT6aDDtdi9bDq//rO/yddhjKzHWDhIlbpRmrJmh+Srs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718741088; c=relaxed/simple;
	bh=DajjKSG/Seg8YMpFCmFx/fEsPo767qs1A/iVL8ycjx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I5GvGDXsBvdYZCbnpk7IWkYvfL7Rg6g350i+AcCBEnTkM1bhw1FbLWGtDI0JPlwXn/kCIRnzYRnBaCicDnSq/v/oMT4PEiPejhTgTW/folTBfBMgnEW5Er2jSVqrWOobfp1tuNXgBB2SP9jxVgOtYvFDk29O8n4Aqp38YZze6zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e8616c2.versanet.de ([94.134.22.194] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sJf4B-0003dG-HD; Tue, 18 Jun 2024 22:04:31 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: devicetree-compiler@vger.kernel.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] checks: relax graph checks for overlays
Date: Tue, 18 Jun 2024 22:04:30 +0200
Message-ID: <2910718.NACDBdzCOe@diego>
In-Reply-To: <59a8ed6b-1410-40d1-8a32-69cc8741311a@wolfvision.net>
References:
 <20240522-bugfix-relax-checks-for-overlays-v1-1-130c8b85c06b@wolfvision.net>
 <59a8ed6b-1410-40d1-8a32-69cc8741311a@wolfvision.net>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hey dt and dtc people :-) ,

Am Dienstag, 4. Juni 2024, 16:48:46 CEST schrieb Michael Riesch:
> This is a gentle ping with David and the DT maintainers in Cc: (I am not
> sure what the protocol is here, so I'll simply give this a try).

it would be really great if someone could look at the patch and tell us
if that is the right direction to go, or something else needs to be done
instead.

Thanks a lot
Heiko

> On 5/22/24 16:32, Michael Riesch wrote:
> > In device tree overlays, the following patterns occur frequently:
> > 
> > board.dts:
> > /dts-v1/;
> > 
> > / {
> > 	display-controller {
> > 		ports {
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			vp0: port@0 {
> > 				reg = <0>;
> > 
> > 				vp0_out: endpoint {
> > 				};
> > 			};
> > 
> > 			vp1: port@1 {
> > 				reg = <1>;
> > 			};
> > 		};
> > 	};
> > };
> > 
> > overlay-endpoint.dtso:
> > /dts-v1/;
> > /plugin/;
> > 
> > &{/} {
> > 	hdmi-tx-connector {
> > 		port {
> > 			hdmi_tx_in: endpoint {
> > 				remote-endpoint = <&vp0_out>;
> > 			};
> > 		};
> > 	};
> > };
> > 
> > &vp0_out {
> > 	remote-endpoint = <&hdmi_tx_in>;
> > };
> > 
> > In this case, dtc expects that the node referenced by &vp0_out is
> > named "endpoint", but the name cannot be inferred. Also, dtc
> > complains about the connections between the endpoints not being
> > bidirectional.
> > 
> > Similarly, for a different overlay overlay-port.dtso:
> > /dts-v1/;
> > /plugin/;
> > 
> > &{/} {
> > 	panel {
> > 		port {
> > 			panel_in: endpoint {
> > 				remote-endpoint = <&vp1_out>;
> > 			};
> > 		};
> > 	};
> > };
> > 
> > &vp1 {
> > 	vp1_out: endpoint {
> > 		remote-endpoint = <&panel_in>;
> > 	};
> > };
> > 
> > dtc expects that the node referenced by &vp1 is named "port", but the
> > name cannot be inferred.
> > 
> > Relax the corresponding checks and skip the parts that are not reasonable
> > for device tree overlays.
> > 
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> > ---
> > Habidere,
> > 
> > This patch fixes several warnings 
> >  - Warning (graph_port): /fragment@3: graph port node name should be
> >    'port'
> >  - Warning (graph_endpoint): /fragment@3/__overlay__: graph endpoint
> >    node name should be 'endpoint'
> >  - Warning (graph_endpoint): /fragment@3/__overlay__: graph connection
> >    to node '/fragment@2/__overlay__/.../port/endpoint' is not
> >    bidirectional
> > that appear when compiling device tree overlays.
> > 
> > This first warning popped up e.g., in the scope of [1], [2]. The latter
> > two warnings appear regularly when compiling our downstream overlays. As
> > we plan to submit them to mainline soon, we'll hit that blocker sooner or
> > later.
> > 
> > Looking forward to your comments!
> > 
> > Link: https://lore.kernel.org/lkml/20240412-feature-wolfvision-pf5-display-v1-1-f032f32dba1a@wolfvision.net/ [1]
> > Link: https://lore.kernel.org/lkml/20240423082941.2626102-1-heiko@sntech.de/T/ [2]
> 
> Feedback on this issue would be most welcome!
> 
> Thanks a lot and best regards,
> Michael
> 
> > ---
> >  checks.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> > 
> > diff --git a/checks.c b/checks.c
> > index 2fb7ee5..2ea5913 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -1822,10 +1822,14 @@ static void check_graph_port(struct check *c, struct dt_info *dti,
> >  	if (node->bus != &graph_port_bus)
> >  		return;
> >  
> > +	check_graph_reg(c, dti, node);
> > +
> > +	/* skip checks below for overlays */
> > +	if (dti->dtsflags & DTSF_PLUGIN)
> > +		return;
> > +
> >  	if (!strprefixeq(node->name, node->basenamelen, "port"))
> >  		FAIL(c, dti, node, "graph port node name should be 'port'");
> > -
> > -	check_graph_reg(c, dti, node);
> >  }
> >  WARNING(graph_port, check_graph_port, NULL, &graph_nodes);
> >  
> > @@ -1860,11 +1864,15 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
> >  	if (!node->parent || node->parent->bus != &graph_port_bus)
> >  		return;
> >  
> > +	check_graph_reg(c, dti, node);
> > +
> > +	/* skip checks below for overlays */
> > +	if (dti->dtsflags & DTSF_PLUGIN)
> > +		return;
> > +
> >  	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
> >  		FAIL(c, dti, node, "graph endpoint node name should be 'endpoint'");
> >  
> > -	check_graph_reg(c, dti, node);
> > -
> >  	remote_node = get_remote_endpoint(c, dti, node);
> >  	if (!remote_node)
> >  		return;
> > 
> > ---
> > base-commit: ae26223a056e040b2d812202283d47c6e034d063
> > change-id: 20240522-bugfix-relax-checks-for-overlays-e72b11df44a1
> > 
> > Best regards,
> 




