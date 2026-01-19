Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BEC23D7CF;
	Mon, 19 Jan 2026 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768833398; cv=none; b=ATivRnnRULLrYKggpViVNgs65sWQ8Po5je7Fo2wnoVNv28kl6gnni/esurXgr93L7xhsyF0Jkq4LT0Q0IzvdGuz4du1/ISnwGQsqyvOpo/pzLIbnufZwxWto264NcZg+d+7/HTfyjRNbtPWQHN4KuFZcTzTZ1Sr/zU+n+1GmPkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768833398; c=relaxed/simple;
	bh=DSPrpSf0LWJLqHjm3ttmtuFsri+3Hw7h5T/bLjPsmL4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2TOMYrRQ7e+Q7AyWp2xgF/1K4tn/hjcTtYPpU85DrnXzgDxaLjpMlI1tsJ1K8H/se5s/ezbA4X7rNiia72t3+cXSklGVZ3M6YXNB0c9AAHmgmnaw7wgNzmCj0ji6fWapsHQtADhYaOo3HzwN4/z57/lz3dQ98Olo3fObfEYc8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Lep/++66; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Lep/++66"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 152BC1A2951;
	Mon, 19 Jan 2026 14:36:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEAE360731;
	Mon, 19 Jan 2026 14:36:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D49B810B6B09B;
	Mon, 19 Jan 2026 15:36:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768833394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a+xqZLXHQfagtj+iXfEgTO2mtajyxN/ZOkd2GLwZgxI=;
	b=Lep/++66PIdAeYzkK5bKBrO3lCBuOtEPpU5wmOUd3Wp/DMsSAkj1vP4n8Q581P7zc8dLcY
	hW+7LS6m5IntlgzpSPbbMxkLhISGKc6BUK3hQDzS61f7fQgOtcCtOSvjhSVSg56nw4q+VP
	FiT0VYuBMRVbRM6racAjC2YF/qpNpI+ogjIE7F4C259JJD0kehzwFs+p73VJrtW4SSAXws
	3JpIFtc6+MVJKG8vZvlaWG/AvUEqtn9XZZ4Y9LGmUmI7KTBnUjwSkdvDCATgJbbvyEIjgR
	pAka+j2u7cHRxtiGchZquycKW3RHvw5d/f0g2l9m16rJ0JuGT9oDsV1PuWUP1w==
Date: Mon, 19 Jan 2026 15:36:29 +0100
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
Subject: Re: [RFC PATCH 35/77] Add support for FDT_IMPORT_SYM dtb tag
Message-ID: <20260119153629.26fa0f94@bootlin.com>
In-Reply-To: <aWiMB8MljbOl-RRX@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-36-herve.codina@bootlin.com>
	<aWiMB8MljbOl-RRX@zatzit>
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

On Thu, 15 Jan 2026 17:41:11 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:19:25PM +0100, Herve Codina wrote:
> > The FDT_IMPORT_SYM dtb tag is a meta-data tag defining an imported
> > symbol. It can be present globally in an addon dtb (i.e. outside nodes
> > definition) meaning that this symbol needs to be resolved when the dtb
> > is applied.
> > 
> > The tag is followed by two values and possible alignment paddings:
> >   - name (string including \0)
> >       The import symbol name. I.e. the name used to reference this
> >       imported symbol.
> >   - padding:
> >       Padding (0x00) added to have the next value aligned on 32bit.
> >   - compatible (string including \0)
> >       The compatible string that can be used for symbol resolution.
> >       This string can be an empty string if it is not relevant.
> >   - padding:
> >       Padding (0x00) added to have the next value aligned on 32bit.
> > 
> > Example:
> >   FDT_IMPORT_SYM 'foo1' 0x00 0x00 0x00 'bar,foo'
> > 
> >   This means that 'foo1' is an imported symbol and it is 'bar,foo'
> >   compatible.
> > 
> >   This is what is encoded in the dtb when the related dts has the
> >   following imported symbol defined:
> >     /import/ foo1: "bar,foo";
> > 
> > If several symbols are imported, several FDT_IMPORT_SYM are present.
> > Each of them defining one imported symbol. For instance, importing
> > 'foo1' ("bar,foo" compatible) and 'baz1' ("bar,baz" compatible) leads
> > to the following sequence:
> >   FDT_IMPORT_SYM 'foo1' 0x00 0x00 0x00 'bar,foo'
> >   FDT_IMPORT_SYM 'baz1' 0x00 0x00 0x00 'bar,baz'
> > 
> > If FDT_IMPORT_SYM tags are present in the dtb, they are present after
> > the root node definition (i.e. after the FDT_END_NODE related to the
> > first FDT_BEGIN_NODE).
> > 
> > Add support for this new dtb tag.  
> 
> Since these are global to the whole tree, would a new block make more
> sense?

I don't know.

Exports symbols are in node blocs and that makes sense. I wouldn't expect
imports out of the dtb "structure block".

They could be grouped into an other tag, FDT_INFO_DTB for instance (part of
the "structure block").

If you think that a new block is really relevant, I can implement this new
block.

Best regards,
Hervé
