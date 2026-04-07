Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9CE3AEF36
	for <devicetree-compiler@vger.kernel.org>; Tue,  7 Apr 2026 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562159; cv=none; b=jV2TFXt4BRSoYdeOQN+sMCPyvviqLZ0ofjtxrW7tb0nfWw7eXMBInVkfyTFCmgdDfCxuzE4b3RJeW8nPTX1Q/pp2YcLZDqoe0lPL8mNospc6NFv9xvmGMdXJ85m8lPkwyHoW38hPR1DZ0JdguiacExU10pIJWnxVtqlKrfdr3Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562159; c=relaxed/simple;
	bh=gUqig0acgfJgnMnKDKHU0GHRv8tSmRk9cAa9+z78I+k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aAawmrSBDzf+wzNREKfl7AE+pxrDSvReHryefDcfcrA9P2GeaevOPiVDsbPARSw0zFPSeayDyWiYZ8D/GqwKoxrx9u4gHRzb0g3cEumgZ+kIivXio8/1mr+SKSNYJo39uB80DQ+dD7RYYA2OOdKUNVMePkx4CvYIIdI5K5f9CsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wQxxLNsb; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wQxxLNsb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 56766C5B182;
	Tue,  7 Apr 2026 11:43:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FED9603C7;
	Tue,  7 Apr 2026 11:42:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E539210450022;
	Tue,  7 Apr 2026 13:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775562150; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mdH8deOysMUfQPgp4dNeBsArN3+MZM5twmMArAbHy7E=;
	b=wQxxLNsbSEDSOp5HHm9s+CVb58WNn5g7Ps99w2wScQPkBiLkKWW79eXfANLV/040X86s1f
	BazmH6ZBOJq5qQpFwri9rnpsXMNvRyeGMWb6opXgVw8dy61qw2Ae2+dFrBlJCdKJDTTnLE
	uNFSFRDu/RcNmGBuVM2bZMYKHt/Yzvs4cOnmAyP01RfZN7HFfGINr0An8uoEo2aWCVkxXs
	fhnJifIMGjSN17kc/MXlGOULTECv64iHytf0zuY1MhNX/6ocLsaM4ACrhJDKMox2tXiqRT
	5BYj1heWQ5leqkSDJl5IuVmGnCmCEeWgUusXIR0rmNKJDNVzZb8ueYLDciDy5A==
Date: Tue, 7 Apr 2026 13:42:24 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "David Gibson" <david@gibson.dropbear.id.au>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Ayush Singh" <ayush@beagleboard.org>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>,
 <devicetree-compiler@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree-spec@vger.kernel.org>, "Hui Pu"
 <hui.pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 09/15] Introduce structured tag value definition
Message-ID: <20260407134224.3f621289@bootlin.com>
In-Reply-To: <DHHWXWJD78XO.5RNDZHYZE0U4@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
	<20260210173349.636766-10-herve.codina@bootlin.com>
	<DHHWXWJD78XO.5RNDZHYZE0U4@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Luca,

On Wed, 01 Apr 2026 17:11:35 +0200
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> > The goal of structured tag values is to ease the introduction of new
> > tags in future releases with the capability for an already existing
> > release to ignore those structured tags. In order to do that data length
> > related to the unknown tag needs to be identify.  
>                                          ^
> 					 identified

Will be fixed in the next iteration.

> 
> > Also a flag is present  
>  "Also add a flag"

Will be updated in the next iteration.

> 
> > to tell an old release if this tag can be simply skipped or must lead to
> > an error.
> >
> > Structured tag value is defined on 32bit and is defined as follow:
> >
> > Bits  | 31 | 30       | 29             28 | 27    0|
> > ------+----+----------+-------------------+--------+
> > Fields| 1  | CAN_SKIP | DATA_LNG_ENCODING | TAG_ID |
> > ------+----+----------+-------------------+--------+
> >
> > Bit 31 is always set to 1 to identified a structured tag value.  
>                                ^
> 			       identify
> 
> > Bit 30 (CAN_SKIP) is set to 1 if the tag can be safely ignore when its  
>                                                          ^
> 							 ignored

Both will be fixed in the next iteration.

> 
> 
> > TAG_ID value is not a known value (unknown tag). If the CAN_SKIP bit is
> > set to 0 this tag must not be ignored and an error should be reported
> > when its TAG_ID value is not a known value (unknown tag).
> >
> > Bits 29..28 (DATA_LNG_ENCODING) indicates the length of the data related  
> 
> I think "LEN" is more common than "LNG".

Agree, will be changed.

...
> >
> > +/* Tag values flags */
> > +#define FDT_TAG_STRUCTURED	(1<<31)
> > +#define FDT_TAG_SKIP_SAFE	(1<<30)  
> 
> This is called CAN_SKIP in the commit message and SKIP_SAFE here. Using a
> consistent name would be better IMO.

I will use SKIP_SAFE and so update the commit message accordingly in the next
iteration.

> 
> > +#define FDT_TAG_DATA_MASK	(3<<28)
> > +#define FDT_TAG_DATA_NONE	(0<<28)
> > +#define FDT_TAG_DATA_1CELL	(1<<28)
> > +#define FDT_TAG_DATA_2CELLS	(2<<28)
> > +#define FDT_TAG_DATA_LNG	(3<<28)  
> 
> I find _LNG (or _LEN) misleading: this is not the length, but rather an
> enum value telling you the length is stored in the next cell. What about
> FDT_TAG_DATA_VARLEN?

Yes indeed, VARLEN is better.
I will use FDT_TAG_DATA_VARLEN in the next iteration.

Best regards,
Hervé
