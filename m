Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948643;
	b=PhBaS+XWCoRN9S9qjpvhXkNvjTKLslEkxJBIdONyzKarPUEGdK10WWrxf9bcnvWWzq5E
	 rzcE5Hmm3WjfzKnmYQV3cfGGVsGk8W4clewcILDigTVKh+sF7jqm3E27BmgcTPchkJJNG
	 PjAIRiZdfxkgowmUHHciOnHTXZ2Jxcs2OEwAdXNzWJhB1rIC5Lmy9poC9pMMiAOf8a4ui
	 +QYBAbW/i47FQf/HQGum5WZgs1UHpi8k08eXAcA5MfjgGqNCTY/ZA3XMjvn6+gW+LWvg9
	 Kh09YLFECQyEiopeqYCS2xaxWfieQmcoYblvLTCh/CEz+4w/PlJbnd+aSL78YeYroGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948643;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=33Jmatagmlnqvb1pJE6yCW8RqVIos82303J/tbc7h1w=;
	b=xRrqyp0oI6jzjxTxal6vL/aTHU4Zx9himSmltNHpoXvUyMKqz3IxPLQsqSQgUqeZNnz4
	 Vy8lRvXxHeNizIxvBuenR+n990jDsD+7NPME3wtUXotbTL53wbYbgBbMlT8VVW69Zj88M
	 byEXnP5Q3EApfEPw5vECHnK0MoF+80oV5xcf6EZhq1fhHKjNmJpKWnaa0qf3lpt6g6/OC
	 /xZdkuJYglBOOFHBHGBTVQNl37u6uRiWIcatZ2grB3dzM1n1sV41XKJAArNVDHI7QaAtx
	 R46FxPsdVy+h0lOtbls10J3Q5lqEfuI2TG1DkRuAm7iGGFNuMWxHRiAxv8QIcnvjMGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=n4fyfnH3;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E0606D824
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 07:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 499E0606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=n4fyfnH3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 74C664E41392;
	Fri,  6 Nov 2026 07:03:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FFD25FF43;
	Fri,  6 Nov 2026 07:03:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AC32103291F0;
	Fri,  6 Nov 2026 08:03:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793948638; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=33Jmatagmlnqvb1pJE6yCW8RqVIos82303J/tbc7h1w=;
	b=n4fyfnH32vICA8OdrdES/suejQSxLg9TTrkKEP5Tf8cl5Csgiah8+a1QRL5szxM3/baXR6
	+cxsYAt1bzUxN8pM6kvUBucbAIfZmnkPeQ78uKP3+kxFWA9pRV1xfeZijqbfOp5k5BvJk7
	qbdRyptevL2YwSAi1VQLPHLepwtebC/ytE5tlM+sZEDkXEFitjghTTkXE79LrriJaMEpr+
	dVA0KVPAVexIglcrZyvKIT7UHikEM9elLi1UKPzvyR6yKxu3aNdyP7qKbvCR1Vtm5Il9ml
	F2CQxl0LyTWZit+2UijO7gXiE+1fBgNI0B3tvfSgei8YGM6+evxJ1Hmt8hZQ3w==
Date: Fri, 6 Nov 2026 08:03:54 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>, Simon Glass
 <sjg@chromium.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v3] libfdt: Fix fdt_get_path() reading before the start
 of the buffer
Message-ID: <20261106080354.32c54bde@bootlin.com>
In-Reply-To: <20261105180439.955822-1-ayan.kumar.halder@amd.com>
References: <20261105180439.955822-1-ayan.kumar.halder@amd.com>
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

Hi Ayan,

On Thu, 5 Nov 2026 18:04:39 +0000
Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:

> Asking fdt_get_path() for an offset past the root node's FDT_END_NODE
> tag makes it read before the start of the caller's buffer. Such an
> offset is not a node offset, so fdt_get_path() should return
> -FDT_ERR_BADOFFSET.
> 
> fdt_get_path() trims a component off the buffer for each level the walk
> comes back up, comparing the components it has against the depth from
> fdt_next_node(). On leaving the root node, fdt_next_node() takes the
> depth negative and returns the offset just past that tag rather than an
> error, as commit ce4d9c0f ("libfdt: Rework fdt_next_node()") intended so
> that fdt_node_end_offset_() can find where a node ends. The loop only
> tests the offset, so it runs once more and tries to trim a component
> that is not there, scanning back past the start of the buffer.
> 
> Stop the walk once the depth goes negative, as
> fdt_subnode_offset_namelen() and fdt_node_end_offset_() already do, and
> reject the offset up front with fdt_check_node_offset_() where input is
> not assumed valid. Add a bad-offset case to tests/get_path.c; run it
> under valgrind (tests/run_tests.sh -m) to catch the read.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
