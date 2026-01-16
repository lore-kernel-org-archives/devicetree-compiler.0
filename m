Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C883624A4;
	Fri, 16 Jan 2026 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560784; cv=none; b=eJYanW+wT5y9DN1fDxpMIJDDPPfTEU7BQ9kPUocPBzVNGsTyQUksMI3BhnL8MmVdeO2GMQ5b3TnZb9DCF9eUyPNqT6B2N/FIm4YqnVPmZLKZmOLoEs29FO/EBM+R7DohlmVd43R5BKAhfBZg77TYaEGC9zTRUtO5hDJY0FSpqhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560784; c=relaxed/simple;
	bh=Hp+kVfIsGA3OD3ATPz6uv9SKEcqheCaU7YCaJTF4Uzw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oxIw3DoWlV8ENZ2Tz1qTd7TpZ+9nn6sxS56EiiU8ccBuoFDuD49zfnB7ahayjoDN3tgYLtaU/YFntJDgJ7fbyDCBvmpmjdnrEeNWuDtx6IdtKWBCdhrrvxxVVgJM1zJUZ+qVBEXRYddW6tDYt63fYYb5dadpzGrbGA1v1Eqq4ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XsnvR7jF; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XsnvR7jF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EAFE24E42115;
	Fri, 16 Jan 2026 10:53:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFC2960732;
	Fri, 16 Jan 2026 10:53:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F43510B689C1;
	Fri, 16 Jan 2026 11:52:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768560779; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8N72Oa0JkK9luLDW7G04DbCX3YQ3eT2DSZiDReseaCs=;
	b=XsnvR7jFXuE24/rt9spoxxOrx4BmrtXwlFtToLhi4wDjGJmv/ZxntuTr/u6ZY/Y/qGRMb6
	7CZZuTS3FOf+R0veQ2nsDIoIXA4bhVXJTfXmD6Q1GUIBU1hZBREHXG0S6gCkFcAWVRusI4
	hvIQtJzZeNjTZVaciC+tfDO7d8kspvKyrCf5fRWbK4n2Jn1R6GJSbHdCfKITX7HibCSAi4
	2pthlmAxcCJ4Bc9LZ8T/TUUqKB3xJXEsd8pZPtlLPJ7OxeBIGwD0Asire4y8W/KKtdkyED
	N875e89sC/9W1IhDDRcgC29Qdpo8VECvc6IG2l713mZdpctMnoHA3OAGJ9CPYw==
Date: Fri, 16 Jan 2026 11:52:54 +0100
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
Subject: Re: [RFC PATCH 07/77] livetree: Improve get_node_by_phandle()
Message-ID: <20260116115254.3002ca05@bootlin.com>
In-Reply-To: <aWg3vOBK4uKwyRp4@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-8-herve.codina@bootlin.com>
	<aWg3vOBK4uKwyRp4@zatzit>
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

On Thu, 15 Jan 2026 11:41:32 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:18:57PM +0100, Herve Codina wrote:
> > get_node_by_phandle() allows to get a node based on its phandle value.
> > It checks the phandle value against value available in internal node
> > structure.
> > 
> > This internal phandle value is updated during process_check() and so,
> > get_node_by_phandle() cannot give correct results before the
> > process_check() call.
> > 
> > Improve get_node_by_phandle() to look at node phandle properties when
> > the internal phandle value is not valid.
> > 
> > This allows to return a correct matching node even if process_check()
> > was not called yet.
> > 
> > With the recently introduced FDT_REF_LOCAL dtb tag, this will be needed
> > to update internal phandle references before the call to process_check().
> > Indeed, this tag allows to identify phandles and internal references
> > need to be updated based on the phandle value before the
> > process_check() call.  
> 
> Having two entirely different paths for get_node_by_phandle() is
> really ugly.
> 
> I suspect a better approach would be to special case updates to the
> internal phandle field as we parse the phandle properties, rather than
> doing it as a batch during the checks.

Doing that when we parse the property will be quite complex. Indeed,
when we parse a dts, the node internal object is not yet created when
the property is parsed.

What I think could be done is to set the phandle field just after the
parsing of input (dts or dtb). In current implementation this is done by
process_check() when fixup_phandle_references() is called.

This fixup_phandle_references() call should be removed from process_check()
and called right after the input parsing.

I you are ok with that, I can propose something in the next iteration.

Best regards,
Hervé
