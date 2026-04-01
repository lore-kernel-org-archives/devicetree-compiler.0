Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA503DD53F;
	Wed,  1 Apr 2026 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056529; cv=none; b=gMDGlpQ9xl3TgaBioATblCyObvNeaiHHWoDQiQdEW1tOBNP9kye7r9vEGkAf9BeV1Q6rAyNAOQJevW5yROLejXSDjmJBVnbE12n2RIFzCyjk32eOP+Ix3OGHAsAJSv1vhFUT/tGT3p/yYBOxd+ko2OenfbYFBiTAlW3+qGC8MeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056529; c=relaxed/simple;
	bh=N8ih93fMcy6ObGNKQT6Q3GJzuwL6lWWtw8BeJ6+B4Ms=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=o30tp/DeGWHdHHo1EJvKrfEajNIOGqRd+HbRzA2RbZ55PgU8oaoi8AUny1v7pZkblEbWC78Q/QsL0kLlNVI8vfT6GnObAHQY0I4sr5ulq3SSSDFKk/pNqag6oK19WPKUS7ekKou1ZtVrqn5/UUU+0tSNa9G/g7qpPhjuC9NOfhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2Z7AJP7i; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2Z7AJP7i"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5976D4E4288D;
	Wed,  1 Apr 2026 15:15:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21584602BF;
	Wed,  1 Apr 2026 15:15:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B3251045030B;
	Wed,  1 Apr 2026 17:15:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775056523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=owrRNavymzHeAJXF5hgYXwHzgQpo9JfloW7TpGALRgg=;
	b=2Z7AJP7iIyCJXJUR8IAFyDEd4E1kVXXwuN5nwkWErHrehBu7tOZwQRF7sVMOMbsJz8W+C7
	o+oebENUtOp60CEQhXz3EBFxBUh3k7nic8KXmeabssUg+6xHmwA7wxFBZLTcnBlu73t99V
	1Naa9YD6BuT0KxTRB2zeXS7hA0TIPxMizpg97cU5ZFWqMl2nSm4kmWVK5lAElABKUfuobP
	U9kJK9SPxI10z5/rXl1BEpYYpDhNB8xdbMxKnI+08kbSea2EdckBK+D/O5kOVc+Sc0mij9
	U2DFSqcWLp0GffETl0E9qsXMzXfiDKqO0VNBq+rFsOOnk6hBVgXu13BoBr5cGg==
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 17:15:20 +0200
Message-Id: <DHHX0S8YH3OP.28WMS8WVJWHJK@bootlin.com>
Subject: Re: [RFC PATCH 11/15] flattree: Handle unknown tags
Cc: "Ayush Singh" <ayush@beagleboard.org>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, <devicetree-compiler@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree-spec@vger.kernel.org>, "Hui Pu" <hui.pu@gehealthcare.com>, "Ian
 Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "Herve Codina" <herve.codina@bootlin.com>, "David Gibson"
 <david@gibson.dropbear.id.au>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-12-herve.codina@bootlin.com>
In-Reply-To: <20260210173349.636766-12-herve.codina@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> The structured tag value definition introduced recently gives the
> ability to ignore unknown tags without any error when they are read.
>
> Handle those structured tag.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

> +++ b/tests/unknown_tags_can_skip.dtb.dts.expect
> @@ -0,0 +1,19 @@
> +/dts-v1/;
> +
> +/ {
> +	prop-int =3D <0x01>;
> +	prop-str =3D "abcd";
> +
> +	subnode1 {
> +		prop-int =3D <0x01 0x02>;
> +	};
> +
> +	subnode2 {
> +		prop-int1 =3D <0x01 0x02>;
> +		prop-int2 =3D <0x01 0x02>;
> +
> +		subsubnode {
> +			prop-int =3D <0x01 0x02>;
> +		};
> +	};
> +};

Of course this will need updating in case you adopt the changes to the
tests I suggested in patch 10.

With that done:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
