Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA20D4D37C2;
	Wed, 16 Sep 2026 17:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579662; cv=none; b=deHcduhgdjTnI1P0q7IZJolMLp7pwvwrmg8y63Fqx106mTNsGWfWe9iEVU2sMwPAaocJsrctxq3BKeXJmWU+Yb3Nlp8Yj96PJveshx+HnnFERNgpCUzNVss4CSrtz8epW16ZwHP8nG7rVj+M7T32RH5QI6BPpbiMXouWWW4Av4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579662; c=relaxed/simple;
	bh=BxO6rgLM9SfX8tEbiU9nwYK0vqz+F0hGK0aWbt8kezo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=so3UBGt94ZfeUSGN5jM/KrJdpqcwFHY8Bd5KPivcNk4mwIDmjHyaDAYSsix7tHp7eg7f2IcCelHp7fErvS7QUKp/iL0LAlqannNss1Ks4954uHtZELOla6eArcT3s01yQd3e/BcLk+xpvmx9wD7Crchc3eHlGMIsTKBzYvQjeH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mSuvysOB; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mSuvysOB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E608E1A08EA;
	Wed, 16 Sep 2026 17:27:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AFDCD60337;
	Wed, 16 Sep 2026 17:27:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E4E811C7B00D;
	Wed, 16 Sep 2026 19:27:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789579654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dCA8Ne2C7wLdhEcx1e006q+Jrs7Uu0Is5AQBioqBLFk=;
	b=mSuvysOByqxjLwQqnHc7+WWWcyfDJDP7JEPeoSW7DjmMC2Jp/Oy/3LTLzTZtj80/zDxGB4
	RrkHbDqBTDGdt2/hhm6H+I7/2NWWZOsVz0KyKfWeFI55w1rxhCIGBvoy/ghmZHnURbPzZb
	2JqEixXywVAeVdVoBa/2CnuC1CZ6riAXv/Yh0gw+UKjzCNt5wHibTHPwlqB8IHDpDYR9Nc
	QEfhIwFjU+jwOrUhrWTlvH2iDFr2v8mm2nN9qGALtLlzSdBakYhh2hab4yjqCtWol5CYDO
	EsmAWYR8EL6/yp1EkbuQ1R34pYThZ9qSZaA41CDWrCztMfzdbymKfV/Lwa//OQ==
Date: Wed, 16 Sep 2026 19:27:27 +0200
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
Subject: Re: [PATCH v3 13/15] tests: Add wip_func utility
Message-ID: <20260916192727.28850127@bootlin.com>
In-Reply-To: <aqpoxzD14OQazE1y@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-14-herve.codina@bootlin.com>
 <aqpoxzD14OQazE1y@gractus.seuss>
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

On Wed, 16 Sep 2026 20:00:40 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 10:31:44AM +0200, Herve Codina wrote:
> > wip_func is a test utility allowing to wrap the write inplace functions.
> > 
> > It allows to create tests with custom wip write sequence.
> > 
> > Also the modified dtb is saved allowing to perform later checks on this
> > modified dtb.  
> 
> It's not clear to me what this is useful for that's not already
> covered by the existing write-in-place tests (nop_node.c,
> nop_property.c and setprop_inplace.c).
> 

Used in tests to check dtb updates when "unknown" tags are involved.
See '[PATCH v3 14/15] libfdt: Handle unknown tags on dtb modifications' [0]
or full source at [1].

Depending on modification performed, "unknown" tags must be removed or not
and the version must be downgrade or not. The test checked for rules defined
for modification when "unknown" tags are involved (see patch 14/15 commit log)

I don't think that this could be covered in a simple way by existing
write-in-place tests.

[0] https://lore.kernel.org/devicetree-compiler/20260826083146.304291-15-herve.codina@bootlin.com/
[1] https://github.com/bootlin/dtc/blob/2653bb9cd4414780c863051467b5e77eea6e5bdd/tests/run_tests.sh#L590

Best regards,
Hervé

