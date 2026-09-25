Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBB846F4A4
	for <devicetree-compiler@vger.kernel.org>; Fri, 25 Sep 2026 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342535; cv=none; b=MXiCMPCoaLCjKvfldPgSu5QL3qd0MwYdoa+ez4h1ISA8kS0wmNGnI5iVdf6H6k/A29ISHeWP+DG1UeRCiGEnUOz/+X9Gzd075AEZ4LsmOelhYZpZ7EKStXmSaubnukYwTi4nGroXDS6aJA8G7K4EM6MudUCKg/W1SMJ/bcgvxKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342535; c=relaxed/simple;
	bh=n/TKYly8xl3MXPb0OF34EJV7CyyTKW7ZFMwMfJtV9qE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mgWFfC/fNYkCgMf4vVnVO4wB2ftmjkK8QYAX066+DZIvDvwJLnie5yrVhGLWElMigiwlwe0J8Gq2/P0Cm7E6lYhNK1DC0v1DjPerJafbF+EsOyw/WOpQj/15y2uiyBmlhKdqeNMoggzZsQrcb+gZN+t1gpPTOagZz5N2zeh0ia0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cYdjzrjj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cYdjzrjj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 681EA4E41070;
	Fri, 25 Sep 2026 13:22:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A4B46073B;
	Fri, 25 Sep 2026 13:22:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D617103282AC;
	Fri, 25 Sep 2026 15:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790342523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JUDK+4onXhp2iRvPxU/uQSUAagGAh7xN++WKnr01BRU=;
	b=cYdjzrjjcvK5XlIByhhfwC1MpMqbU6K2XJ6C/V+eO6NRXuPMvJA7dEwdnG7y7Psf+mGYQQ
	TdQmayFJMI1iNlDMvYjGpLbSShTtFUmOP0FhEBRkP4U8cX2oSb2UsurkpgKjG0oMlrPqn3
	pYYSWMtmKK9OlA4cFasX6j1UwsayV1NeWuu1s4a8FLzlKVqUwDM86Iqu0qGGmBe6F9q3Ns
	YmRQWUREWaUwfTQqe//iewa5cnyfLvLPw1hR/t6UTrHxjFFJtSguGpAHPC4T+O/LCkshvi
	vytFOVwtP2wdZqUXwHtgzLKf2oR8xyy3ROg6t9Gjr0Mb9fLnyp2croS76UXyaQ==
Date: Fri, 25 Sep 2026 15:21:57 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
Message-ID: <20260925152157.511dc65c@bootlin.com>
In-Reply-To: <arDMhoNNXcPi81sR@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-16-herve.codina@bootlin.com>
	<arDMhoNNXcPi81sR@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Mon, 21 Sep 2026 16:20:02 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 10:31:46AM +0200, Herve Codina wrote:
> > This v18 version will add support for
> >   - Structured tags.
> >     Those tags value definition will allow "old" libfdt, dtc and other
> >     tools to skip unknown tags if encountered in future dtb version.
> > 
> >     libfdt, dtc and other tools implementing version v18 will be able to
> >     skip unknown tags available in dtbd generated with later version of
> >     dtc.
> > 
> >   - dt_flags header field.
> >     For now this flag field is set to 0. It is a placeholder for future
> >     dtb version and could be used to store some dtb related information
> >     such as the kind of dtb. For instance, the future addons format will
> >     use this field to clearly identify that the dtb is an addon dtb.
> > 
> >   - last_comp_version_w header field.
> >     This field is similar to last_comp_version but for writing.
> >     It contains the lowest version of the devicetree data structure with
> >     which the version used can safely perform modifications (taking into
> >     account following rules related to unknown tags).
> >     If this lowest version is greater than the last known supported
> >     version, modification are simply forbidden and lead to a
> >     FDT_ERR_BADVERSION error.
> > 
> > For modification, when an unknown tag that can be skipped is involved
> > and last_comp_version_w allows modifications, the following rules
> > apply:  
> 
> "last_comp_version_w allows modifications" is a bit hard to
> understand.  What exactly is the version number against which we're
> comparing that value?

We had one last_comp_version.

Now we have two last_comp_version, one for reading and one for writing.
We compare again the dtb version supported by our libfdt version.

This comes from the discussion [1]

[1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49on8VfkP7CDvw@mail.gmail.com/

> 
> >   - When a property is modified, tags related to this property are
> >     removed and the dtb version is downgraded.  
> 
> We need a definition of what "related to" means somewhere.

Yes a tag is said related to a property if it is available after its FDT_PROP and
before the next FDT_PROP (other proterty) of FDT_BEGIN_NODE (subnode) for FDT_NODE_END
(end of node).

This is defined by "structured tag"

Devicetree Specification will be updated to have all of this documentation
available.

> 
> >   - When a property is removed, tags related to this property are
> >     obviously removed. The dtb version is kept unchanged.
> > 
> >   - When a property or a node is added, obviously no unknown tags are
> >     added and the dtb version is kept unchanged.  
> 
> Again, this rule doesn't make sense to me at the same time as the
> property modification rule.

A current libfdt/dtc version cannot add tags which will be defined in the
future.

> 
> >   - When a node is removed, tags related to this node are obviously
> >     removed. The dtb version is kept unchanged.
> > 
> >   - Adding, removing or modifying a property is not considered as a node
> >     modification and so, those operations have no impacts on unknown
> >     tags related to the node. Those node related tags are kept
> >     unchanged.
> > 
> >   - The only modification considered as a node modification is setting
> >     its name. We consider that this operation has no impact on tags
> >     related to the node. Here also, those node related tags and the dtb
> >     version are kept unchanged.
> > 
> >   - Global (dtb related) unknown tags are kept unchanged regardless the
> >     modification done.
> > 
> > In all cases, if unknown tags are not involved in a modification, the
> > dtb version is not downgraded when the modification is made.
> > 
> > It is worth noting that with this v18 version, the dtb version is not
> > downgraded for any modification but only when unknown tags are removed
> > due to a property modification. In v17 or older version any modification
> > led to a dtb version downgrade.  
> 
> I don't think removing that behaviour is safe.  Even if the rules
> above make sense specifically for the metadata tags (which I'm not yet
> convinced of), that's not sufficient.  If nothing else, future
> versions could add extra header fields.  If we modify the tree, those
> header fields could be stale, or even removed.

last_comp_version_w will be used by the future version to prevent this
kind of issue with old version.

Best regards,
Hervé

