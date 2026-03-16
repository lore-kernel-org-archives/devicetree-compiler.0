Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BB73346BE;
	Mon, 16 Mar 2026 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677809; cv=none; b=kBLLIP4s14sxWiuLXjRRwbOX/0UnDH58YBfuN/ZMOyfSXf9nTw2nx9LRmi5CaLLd+4W7NDC/1hpCdPLeysW+B1MBOAufBjEWWvk+3LagEiiiE5bfgWPh9C2FtDeLYfOM8c6EkQblJneC/b3GGGbIWj5fZIHeobmhCPcHFgkE53M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677809; c=relaxed/simple;
	bh=eGZMUpQCogsTMRCvLwheEJQSb9CXW9JCeyIvMqidtd4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fSYw0O3aTnkII8dcpwRrutXKQHGahQBev+LZaCICudj6AplWIBlBYVzZvX1ksVkhM3+1S9aAKxCPe9MP2yY2w3aQzMbPuGPy7ArBvVovZS5LQKrp0+O3wgLleBBq9MAcL1gAOVbD5lnk+W+lBlRLrk1Vrn3xMzb+ZrOcI+h2cPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NmwhUxVA; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NmwhUxVA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F2F39C55043;
	Mon, 16 Mar 2026 16:17:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44E825FC4A;
	Mon, 16 Mar 2026 16:16:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5AAD10371EC0;
	Mon, 16 Mar 2026 17:16:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773677805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gWqRY4zfYwBxnp8FcVKfm1vow2ss+l+5owPYbpC8Nhc=;
	b=NmwhUxVA1MRJtQgsdRzMvYTThBgDG//8lXjdW7mS7XRhCjxB1kSVnnq2QvfWc+dBiSFwXY
	DLo4BnpbQU7ST2ynpvYZKQHQ/rUdLuA0hbv9s7TNG/HUYmgFK3WP4Y388B1Q3//KdAikzo
	CYqjqa7B5uluBXw/aIv91jxcBQ3SL7PBRWtKcEbBJkUadTHRgKTFs9glbcMSgBp2OLEA+x
	fg2zy7cE7Ze6JDYwSlwr4sF+d+ekbXA13xQnL20P8qgTanJ+cldBt6hfl92dIVEh/wRsv5
	pHVzaOilBWPzyRF8g88p4/whV2CvKHN+l59sYP+8bE2l+SnC2ozfan5LsUawuQ==
Date: Mon, 16 Mar 2026 17:16:40 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ayush Singh <ayush@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Hui Pu
 <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 00/15] Add support for structured tags and v18 dtb
 version
Message-ID: <20260316171640.6fb0d952@bootlin.com>
In-Reply-To: <abKTueGkoFYpOwap@zatzit>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
	<20260312085400.3a11df8b@bootlin.com>
	<abKTueGkoFYpOwap@zatzit>
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

Hi David,

On Thu, 12 Mar 2026 21:21:45 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> > 
> > I know some patches have been applied but what's the plan for the remaining
> > ones?  
> 
> Get to them as time permits, which I do not expect to be soon.
> 
> > Is there anything I can do to help move things forward?  
> 
> Usher forth a world where small projects get sufficient support to
> have apprentice maintainers?  Other than that, not really.
> 
> > Let me know if you want some rebase and/or modification and so a new version
> > of the series or if you need anything else that can help in moving forward.  
> 
> I will when I can.
> 

I have subscribed to the devicetree-compiler mailing list. I hope I could help
you reviewing new requests and series related to dtc and libfdt.

Also I have a look at any pending patches to review, but found none.

I can offer to help on other topics to spread the workload if you want.
Let me know.

Best regards,
Hervé
