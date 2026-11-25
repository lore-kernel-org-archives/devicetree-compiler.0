Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604494;
	b=nadnul3vUEmcFYvEcVemXVjKg5YRXGv2aw9f79Et/uQg0p4tMLN4EbJWY5vJzftSg1eL
	 W5buF0/rJqWeVO20mi3eFgr2pPPISAXQc3puRP8S+DisWQ3ugITeLH3MwuZbEo8B3bNDD
	 SwBS71P6cULyDmoROqf1TQeIjnok902tt4s9gsUAwXbajpkZU9KYHrzR7Or1e7/Gl4irK
	 h0Og+9kTt2HBKka8ees2QsuF2T9X4pVUZ2mNXcgCZqYxY8EZbIj4CFBiic4DtSm6sHObw
	 S0NfO4GwvUN7/UQBXP4114K7shqjYTOBkQXteDZlEzUuNOrOu59cPIw6nSZ7JdZ9hiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604494;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=YAQDyX8iJfibt7NThP2SkH4rUMTokIxsTyn5C7hLqWU=;
	b=j1Jd+UOuBiJUmR7aSIZjUzQyftVZx28laovYgB4BwiN7Eu+lGB/leY7ACWzCzgPQQoQQ
	 vFtQGmV1+NrGjEq4bpAZs9tw2hwpaG1t7s5RA3Jh/fMvuJSpkgjxaudUQ+j5uwKOzXALR
	 uEISeVHthozWSuK9yyStKRPXFUjKg4+k9EoMNyCOYt/o4i79mJwcCBfmqEXFFy7z5YEau
	 xeCSNwnEFNOyZbTbVmmuU8SiubAqYY2mqbrsErFwTlij39uGJsXr0ajXoYMX5OsnTL2qw
	 ovw9EX+k2T1pHw2lLDkgfbPPKChBhr2oyk3OqTFNWgahDCRfrdlDD1eNlAXuJ75rGXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HNAbOcoE;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4859606A321;
	Wed, 25 Nov 2026 11:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4859606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HNAbOcoE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F04D4C2F4C8;
	Wed, 25 Nov 2026 11:01:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20D6C60480;
	Wed, 25 Nov 2026 11:01:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D1F011E69385;
	Wed, 25 Nov 2026 12:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795604486; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YAQDyX8iJfibt7NThP2SkH4rUMTokIxsTyn5C7hLqWU=;
	b=HNAbOcoESKoDOkGVklPT5zirrElaTGhKnZPZic0QxuIT2vy/1r3aBabwODdGqUgd9zVj4e
	lkTd0m19WZ8qekNKUc1P4MOR5uuko1QnJFc+DU+Pb32d/z0nJBbtMx+eNW7caXkKqoGq6+
	llxNcs30Q7GrfaEAh/6ZN0fPQKxjZx5yHlSkGdVjIM4cSZ8+xi1+XbX0UOZkAHFlhckp65
	qGPRcZQkknqiAk+/pMcRMhkB0HO1HYMlwsCetKCgIuj70jgFasIDtKlOoF4UPermvFx9VT
	enWfCepOoZz8Ds9XsMLNt3HyuIhRzzjSO+uwbD8IO80A4kQ+ubZ2PC7CD+HMuA==
Date: Wed, 25 Nov 2026 12:01:18 +0100
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
Subject: Re: [RFC PATCH v2 13/74] Add support for /addon/ keyword
Message-ID: <20261125120118.2cfb9e33@bootlin.com>
In-Reply-To: <awanS_Wx4iRBw7-i@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-14-herve.codina@bootlin.com>
	<awanS_Wx4iRBw7-i@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 25 Nov 2026 20:16:18 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 11:48:42AM +0200, Herve Codina wrote:
> > The dts /addon/ keyword allows to mark a dts as an addon dts.
> > 
> > This is similar to /plugin/ used for overlay dts but specific to addon
> > dts.
> > 
> > It is also worth noting that a dts tagged with /addon/ will lead to a
> > dtb with the dt_flags set to FDT_FLAG_ADDON (0x1).
> > 
> > This allows to identify without any ambiguity an addon dts and an addon
> > dtb.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> I've hinted at this elswhere, but from this point, it gets pretty hard
> to review the series without having a better overall picture of where
> we're aiming - what the addon syntax looks like, what the encoding in
> the dtb is and the semantics of each.
> 
> I'll skim the rest of the series looking for any futher patches which
> make sense independently, but in general I'm not going to review the
> rest of this spin.  I'll reexamine in the next version, which I'm
> hoping will come with some better documentation of the overall
> feature.
> 

Ok, will see to add a dt-addon.txt file in Documentation/

Best regards,
Hervé
