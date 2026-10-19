Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D7A305E1F;
	Mon, 19 Oct 2026 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415928; cv=none; b=hNRRiiME2EAIRoP2fhDhcMDS6A7GJpzNS1IfQPZl5HYXp21DLNdWrixnszaStolJsdbPlysmtOGnH7UqMRYutTiRXVQ5D8uoX2JfIZaQiD0fZbrBnpq/E+Y8XEuGs8fr7dsDbm0G9JpmetDQDD+CJdF3QBN0zTZatE553Cb/rnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415928; c=relaxed/simple;
	bh=wHsgS7FBj/xFYolQNhaUfjMoV6ciEmQHxlP7VTz2dQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p/LuUimljT2/h3RZm0FN7eXnczpcxJsESST6Cy6WmRtgvMN5ZlrDxrbjcskMfnHG31gdwHdb8sb1H60v9PB7ThtG+nubcXnlMY9i0aZovin12cRV3Lz/6mbb66TAHH2SK+b1CXLWUH8syHMbvQBX5QKNht374irsN0SFml76E7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=grKfAOwx; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="grKfAOwx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3F6A61A1285;
	Mon, 19 Oct 2026 13:18:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13CF860582;
	Mon, 19 Oct 2026 13:18:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDEB710328D37;
	Mon, 19 Oct 2026 15:18:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792415920; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eGBaNcGre/pDcsajAEndciG0acG4qabHIlcIpQeDfW8=;
	b=grKfAOwx5gq5RDunt2eyoowf7wN2fPbPXEyq2S41J1sHa3xbmG3KEgpPBHu2Xdb+zgrx9R
	/CUIVLMUIebdv+qT4ITGMfkoLkfqcJsBWa4SEHtBP/hx/uzp4V77ov2bxkhs/WXUHpesHM
	5TAQBJO6dqT8740xBcaffIJnLfnA9TmqUqBpdzOUuyEx9pcReG89ZoIM7NOwUbmXmHheWc
	Z9C4SCvFbt/TMTaQQaA7+87puSTbFIJ1qwb6+YmOnuPRkJ6KvwEdpdsV+6pBNFNWSLtYaC
	rrRxLJeUnYBqDS+8re38066UCUN9oKB2shfql1SGSrzoDxwPOLRu6Md5S3zxiw==
Date: Mon, 19 Oct 2026 15:18:34 +0200
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 04/74] libfdt: Introduce
 fdt_get_structured_tag_data()
Message-ID: <20261019151834.435671cb@bootlin.com>
In-Reply-To: <atVjIcRxUPyak50o@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-5-herve.codina@bootlin.com>
	<atVjIcRxUPyak50o@gractus.seuss>
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

On Mon, 19 Oct 2026 11:24:17 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 11:48:33AM +0200, Herve Codina wrote:
> > With structured tag, data len can be encoded in the tag itself (no data,
> > 1 cell data, 2 cells) or with a dedicated cell (varlen) added between
> > the tag and the data.
> > 
> > In multiple places, getting the data related to the tag will be needed.
> > 
> > To avoid code duplication, introduce fdt_get_structured_tag_data() which
> > purpose is to get the tag data part and its length based on the tag
> > value.  
> 
> I'd prefer to see this folded into the series introducing structured
> tags:  the final result is no more complex than it started, so folding
> th patches reduces churn and makes it easier to review.
> 

Ok, will be moved.

Best regards,
Hervé
