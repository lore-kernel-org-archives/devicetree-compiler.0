Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D19035836C;
	Wed,  1 Apr 2026 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056755; cv=none; b=LbKMmxznsp+P1DrJPACXuU4qp2JaWqX2FhhOylhkT6AkP7ZmUN7xMoMDyUJJGUaSvUFfJa5nuj9KGpdqMqhGDyKV9rTP+vw9mR33eu99i1eUv2MWVHK+MAczpNtURCyICiqfVBi/LgF50PFYl71K6pHcUvMpyJsL/GlsgqYAtjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056755; c=relaxed/simple;
	bh=63tQ672NCKgroxQNMaDnhIpVbzGITbeIXBXiVVo6ado=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=hYYWy5+em6ByhZA/a3uXxOYti2o+zcEEOQoMHQ3KSk2ucdTRRzxJ/CGv/9GW4kIqWIYztVRvMxgA6lwbYIWJxj866kwbvBwf92MLSPdZLVTG9853AjVeiQ20vbfZRjufX5XHw6da44S0UdyqNfzLkC4iHh7F/oz9u2lnVhNrNLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=W/ZDxAgn; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="W/ZDxAgn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F41FE4E42898;
	Wed,  1 Apr 2026 15:19:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CADDC602BF;
	Wed,  1 Apr 2026 15:19:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D76810450290;
	Wed,  1 Apr 2026 17:19:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775056751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yMvkiFjQ1RZRAHVUoIP/xshxGUm3oYiFIoH+yO/verY=;
	b=W/ZDxAgnVhSfsMqmxhS07EMs8r+lc0H/Fd/vxfDoWv/kC3mkCUqecsRDXCYXruNPwlLfO5
	TLTc6S2MiMZ5/3kQObyomI0UPOICSqHTiIQzQbHJttg3P0PUPWtC07F3Il0Oq2tWWdYu8m
	pyCnjdEZfO33azhQmIwZup43r1Z8l8ceIy/GRffPrhxLqjq+BeGQRjWnb2+bYWbDoVR+Z+
	lnXLmrUG3O6Psq0bZfoOECUGiMzha10UVILQoszfY2CvcxGUMG3EeL4ibCUsJS9URMgvOu
	YnTbHb2mdd6uCWBpxNf/20F2nrpnvg/N8kuBq1+/05H+4HtKyZPzaT0pFAFyPA==
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 17:19:09 +0200
Message-Id: <DHHX3P5TS0D3.VWALCUNJ7LGL@bootlin.com>
To: "Herve Codina" <herve.codina@bootlin.com>, "David Gibson"
 <david@gibson.dropbear.id.au>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [RFC PATCH 15/15] Introduce v18 dtb version
Cc: "Ayush Singh" <ayush@beagleboard.org>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, <devicetree-compiler@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree-spec@vger.kernel.org>, "Hui Pu" <hui.pu@gehealthcare.com>, "Ian
 Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-16-herve.codina@bootlin.com>
In-Reply-To: <20260210173349.636766-16-herve.codina@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> This v18 version will add support for
>   - Structured tags.
>     Those tags value definition will allow old libfdt, dtc and other
>     tools to skip unknown tags if encountered in future dtb version.

"old" seems to imply that versions released before today will be able to
wkip unknown tags. I think this should be clarified along the lines of:

  libfdt, dtc and other tools implementing version v18 will be able to wkip
  unknown tags in dtbs generated with later versions of dtc

>   - dt_flags header field.
>     For now this flag field is set to 0. It is a placeholder for future
>     dtb version and could be used to store some dtb related information
>     such as the kind of dtb.

Is this intended for DT addons?

You may mention a realistiv use case here.

>
>   - last_comp_version_w header field.
>     This field is similar to last_comp_version but for writing.
>     It contains the lowest version of the devicetree data structure with
>     which the version used can safely perform modifications (taking into
>     account following rules related to unknown tags).
>     If this lowest version is greater than the last known supported
>     version, modification are simply forbidden and lead to a
>     FDT_ERR_BADVERSION error.
>
> For modification, when an unknown tag that can be skipped is involved
> and last_comp_version_w allows modifications, the following rules
> applies:
  ^
  apply

>   - When a property is modified, tags related to this property are
>     removed and the dtb version is downgraded.
>
>   - When a property is removed, tags related to this property are
>     obviously removed. The dtb version is kept unchanged.
>
>   - When a property or a node is added, obviously no unknown tags are
>     added and the dtb version is kept unchanged.
>
>   - When a node is removed, tags related to this node are obviously
>     removed. The dtb version is kept unchanged.
>
>   - Adding, removing or modifying a property is not considered as a node
>     modification and so, those operations have no impacts on unknown
>     tags related to the node. Those node related tags are kept
>     unchanged.
>
>   - The only modification considered as a node modification is setting
>     its name. We consider that this operation has no impact on tags
>     related to the node. Here also, those node related tags and the dtb
>     version are kept unchanged.
>
>   - Global (dtb related) unknown tags are kept unchanged regardless the
>     modification done.
>
> In all cases, if unknown tags are not involved in a modification, the
> dtb version is not downgraded when the modification is node.
                                                         ^
							 made?


>
> Compared to previous version, it is worth noting that the dtb is not
                                                               ^
				                        "dtb version"

> downgrade for all modification but only when unknown tags are removed
  ^
  downgraded for any


> due a property modification.
  ^
  "due to a ..."

I'm not sure I got what you mean by the initial "Compared to previous
version". Version(s) of what?

If I just remove those 4 words the sentence seems OK to me BTW.

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

I am unable to fully understand the implications of this patch, but the
code seems OK to me as far as I can tell.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
