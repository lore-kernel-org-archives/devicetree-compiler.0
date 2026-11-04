Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781663;
	b=LSBt6eb8y5fif9Izxu/JF80rYcUORSt/FEtP6SQGzgT2KoX3HbQcPPVpo70Hd7q3uYzv
	 8R+7vI2Jv8Xrkfino0ZyRFDPFy6HVnDx50um2moLHiwq2kmK+IL9GTvEyU38Gi/HGjKTJ
	 LHenPOIucu8iy5LPkfPQM0msjDj1+bqTCCO22iYXz8yEHlKas9/nOo0YKF0ZTRed8kb5f
	 1e+/zGTTxZrgU7N3GzhktQwLnCt1Eq2zs/ioo5UMpkr0syRWSoDOdDNyOxp0X08OAXSN9
	 ej8zQkk7ZcU2aIy1a3joPJ2wAE9agX2p9ypflPFhR+tFrCNNDJeYmiR01BnZYcGTI/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781663;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=8jIwKBqK3LUAPB75k//r3wbSz6OMecPylnaXvhafLCM=;
	b=imxZIRUO5MW/kmDjnHXahHAFZBIlZYfTtFzfByJwMEXlXz6FAbu9WZABgPSeN6QjaFiJ
	 RwMAhXbx/5Je50OYKE95lz/nk8AqLrzsrQV3OYdbhET/HHB0EFtpzWAJzgDtBnJSyygpp
	 sHcUI9ck2q+IHhpzMs1eNSTid5dcwRubQz7oGVpH6upRxU04kEj/EqLlb9Yqwkg2vc6YK
	 NOnDSzrcqqEzl4vHByw0HspLyrHEF5Tq5Ua6uTfBVwvrIYOMf85QR2fAprcHZ4TKfGwX+
	 696vvp43oPT0Gm8PHE7352amFfmficinPW2kmoLFUxzSL9gCfdlE7xrmzAEkgwTuaGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RAsXG5Fa;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CF7606A31B
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 08:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CF7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RAsXG5Fa
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E1034E413F5
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 08:40:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D53060770;
	Wed,  4 Nov 2026 08:40:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6772B103290E8;
	Wed,  4 Nov 2026 09:40:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793781658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8jIwKBqK3LUAPB75k//r3wbSz6OMecPylnaXvhafLCM=;
	b=RAsXG5Fadqp44fhFoO59w8qkK1WKLT2gbZihJ5WDbssPlSGmgb4pn23YhYW97O7t3Fspr7
	xrvIz7U8eqn5NK/KvcdivFsJhMk1l4mFyX5jhgbEMAezAF6ENBPhpicTAMPKNQLsvSmSw3
	C+H/BPvzaxu1F3J4nsn05fEAq57O/2wFh3yrzvkbfjbpmuZNUGzxc8ZtUKgi5TTPQ26OIP
	SJwDAfui83TGbrOITgwC/2yE7SCENJeE2Fxol2khkSYYjfnZO2Ww3JaBzS/E2SvY5Yi5o5
	t6vK683Z4WUsAVXVD5oS9OTrlc0zp6fSjw23it6JXSnVwnJ1gXPuK4Rr7QdKSw==
Date: Wed, 4 Nov 2026 09:40:55 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree Compiler
 <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 13/13] dtc: Merge the fragments of a dts file in main()
Message-ID: <20261104094055.2ca24664@bootlin.com>
In-Reply-To: <aurV_EO8OpYad26x@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
	<20261101163721.2458982-14-sjg@chromium.org>
	<20261103180803.416e25c7@bootlin.com>
	<aurV_EO8OpYad26x@gractus.seuss>
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

Hi David,

On Wed, 4 Nov 2026 17:51:41 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Nov 03, 2026 at 06:08:03PM +0100, Herve Codina wrote:
> > On Sun,  1 Nov 2026 09:37:07 -0700
> > Simon Glass <sjg@chromium.org> wrote:
> >   
> > > We would like to run checks on each fragment of a dts file before it is
> > > merged, but that requires dt_from_source() to return the fragments
> > > unmerged, so that main() can decide what to do with them. At present
> > > they are merged at the end of the parse.  
> > 
> > Why running checks on each fragment instead of the dt where fragments are
> > merged ?  
> 
> This is part of the aim of the series.  Some checks make sense on an
> individual fragment, others don't.  Allowing both kinds lets us
> address several longstanding problems.
> 

To clarify this point, what kind of checks for individual fragment?
What kind of longstanding problems?

Can you give me details about them?

Maybe I've faced some of them in the support for addons implementation.

Best regards,
Hervé

