Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980514;
	b=2Z/PnEVRE1LlaKtd8ayt8HGJVse7SViOrtbwcvJN1ELUWARNrsbyLSOORjQR8JAqlp0c
	 4IzfsTM5BZvwTMcyxXpxww3gs0AjpuBCDMJbJeacQr5QGWYoXVrQVMGHZU/7QxZ/wwaL+
	 pFoYVsQq5DAr672FJi79fBX28YCkHoYSYrK5XXJ4Oox1GDq6gcGppUiVR1Z9uejHw+oCZ
	 9oDu/lkuVtEMTWjV9PvVOJtdUGlO1fN9ZCcmF+7aFGsgY9JRBM9fapC/31jeK4QyXs8B9
	 mkorbfS8sC44ieG61SvhlK5mSMLICw88FosZhrWDQnWL99v/hfoik5VUDVli4Tg0rrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980514;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=p5QXnejGDkTscsrqaB0VwomO8NYOqADAm5dzNj/KSz4=;
	b=P2PWzRSTCbqdK1sq8TvCHnIdVg60aqd0ENoBeti8/W4H9DWS4fu09W6qOc1dzjxPMEQZ
	 ovyowlFA8dSeMrat//Zpbo1YboNWaJ2uXaWtNum+0q+aRt1+qzOSiUrJuPXGoq81vRcf7
	 mthSkS6I2FfJnEFqF9FKPWtRH3+uffTmX2+zgHFbKHG/kT6TJXsyzaxq3EE5fuwrjj+Sp
	 C0UL+DuSl8W3hSFSRHGpaaAOVcd1w2PcHDrpVeQts98hTokXCW+d9Ga5dtOla/5Ivc7Yj
	 TnjgfVfX5rbNlglGIfFZCJXwpH17PIbi2KmqPHueawjjWgJ7XWKBEGzTz5DUXp4fD/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pZG0tN1T;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB5C606A326
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 15:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB5C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pZG0tN1T
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E59C4E4147B
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 15:55:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 333CE5FFBC;
	Fri,  6 Nov 2026 15:55:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 786A8103291BA;
	Fri,  6 Nov 2026 16:55:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793980508; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p5QXnejGDkTscsrqaB0VwomO8NYOqADAm5dzNj/KSz4=;
	b=pZG0tN1TsXXkuMSaVNzjSbIb9M4ncv2ua82l9VKFDjFpezXN2a4AHg7DDdUmcUJY09jf7q
	i5OGpne4n/pwHftmGjIiTJFRivCZ7NWApckOuum5EgI8/g+KNy7NbVzjR/jkD9OTw2DDfk
	7T4mfGqxdWk4sNapCn0a7tA2QHAinPWilf0kvqdygHrG4RD5ax7L8eUniXWz+7CJubHAXh
	18NKwbHjX+YG59xKR8VPwaayOOfMbXUn/rhYBX10ztpis5WIcDB5kHgTuyOYiagGuzOKzF
	IC/AGnpvCUmbnZqRPOustSsrf4NdGwUAoMRIbemMBweDZGYopq6VTHtV2XhgGw==
Date: Fri, 6 Nov 2026 16:55:04 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 07/15] dtc: Move label-reference handling out of the
 grammar
Message-ID: <20261106165504.43b35ba2@bootlin.com>
In-Reply-To: <CAFLszTh4do1Yf0FF7LH3OpF7aOpKXpNN_fHjm0_VOY+7yLN8nQ@mail.gmail.com>
References: <20261104211807.972610-1-sjg@chromium.org>
	<20261104211807.972610-8-sjg@chromium.org>
	<20261105100714.47bf0434@bootlin.com>
	<CAFLszTg4tSr7+zJb35efy12TfMWiXc8xujcceL_H+_eGzqW-5g@mail.gmail.com>
	<20261106075641.0fd421ab@bootlin.com>
	<CAFLszTh4do1Yf0FF7LH3OpF7aOpKXpNN_fHjm0_VOY+7yLN8nQ@mail.gmail.com>
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

Hi Simon,

On Fri, 6 Nov 2026 06:05:52 -0700
Simon Glass <sjg@chromium.org> wrote:

...

> 
> It's only very minor. For example:
> 
> /plugin/;
> &foo { mine: x { a; }; };
> / { bar { }; };
> &mine { b; };
> &foo { c; };
> 
> This series will have bar between fragment@0 and fragment@1, but with
> this change it comes before both fragments. I think that is fine to do
> that, just that to my mind it fits better with step 2b of David’s
> plan, where each fragment is wrapped in fragment@N after the merge.
> There are a couple of other corner cases too, which I'm looking at.

I suppose fragment@0 and fragment@1 are the overlay output dts. If so, yes,
I think also it is fine.

Still need to be acked by David.

Otherwise the solution could be to have only fragments after parsing (the
root node is a fragment).

merge_fragments() merge fragments in previous one.

The fragment list in dt_info contains orphans + the root node.
The fragments order shouldn't be modified in that case.

Then overlay_convert_output_format() will have to deal with that.

Anyway, I don't think that adding this complexity is necessary to handle
this "bar in middle" use case.

In the end, nodes are not supposed to be ordered. Anything depending on
node ordering is not correct.

IHMO, internal fragments are obviously in an ordered list (same order as
input file) but nodes in the output file don't have any order requirements
except if '--sort' option is used but it should be already ok if you perform
the sort after the overlay_convert_output_format() call.

> 
> Anyway I've got a patch for your change and I'd like to put it at the
> end of the v3 series, since I am trying to move code largely unchanged
> out of the parser, avoiding behaviour changes as much as possible in
> this series. Does that sound OK?

No problem. Having it at the end of the series is ok on my side.

Best regards,
Hervé
