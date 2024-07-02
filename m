Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFF915B109
	for <devicetree-compiler@vger.kernel.org>; Tue,  2 Jul 2024 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719927886; cv=none; b=bvTHZgvgnZXgy0g1GCVsWKHs2diIEvZoPDnOJ/dOMVy3Fo4xNwUzUsa/nKub6XdJdss1txxNXOjLioKA0mwiT1YkZCDjZPaJxg3DuqAVgnrfgL+wBK91DzsKdKge08X3A/tfcH15kTviaCuifqIfBN43NM5+0Kh+iTfTLzkWp/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719927886; c=relaxed/simple;
	bh=zS9XCvdP1o0PSlfWs4fqjR/02ZVlnvObzYJCICybb6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKnLhcBSfh2AsShgca9IakWrQjcVqwPGb0/sjrAxaPwgSYoNAHUs7WD7C4erFKh09XLz0bK0/+cTmW5QX64nT6/iZumMpCP8KVooafVgtAOB16ckmBK4oZ5RXG6+BYQ/xK8BewijqcnNpLZ+xXqySzHa32t7iQBOScSwLjteIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iO47arJZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iO47arJZ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7252bfe773so445676966b.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 02 Jul 2024 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719927882; x=1720532682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zS9XCvdP1o0PSlfWs4fqjR/02ZVlnvObzYJCICybb6Y=;
        b=iO47arJZyKELnXouRi5azeeedp2mIItdcMxn2BpSI7nKH9qR4zssbkCCGypeZpVRYt
         2mTLpAtCaqHjRf3+tMjdcB9YkLs41mqCFR9EUIdJEhDk0NK+eNkSLzSneIcUm8XgvsF/
         KFly+jb97bYx51K8GB14S11XrdPpzA9oZcR4AJoQWOdwaPw38JgkwuNA/oReDk9k3BgA
         G+QnWNRIQoFtmnqk3tb6JStcDFnoh9QeJ0YzNktSpGIVeMT9JPuNlHE52zyl39VqXPMy
         pifEpAJ5Owk74is15Zqxz0z3XMPHrxhxyCLujQ9GYc1odoAbf151z0eHRlhk5cGBokb4
         wWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719927882; x=1720532682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS9XCvdP1o0PSlfWs4fqjR/02ZVlnvObzYJCICybb6Y=;
        b=wakazjK3d6fKcdnKVimf0Hvpl7T23oJvsYQjLaBtuNdBkjAXshb2eDetS8y1Tsw+Yd
         Hbs8FbVa/6kY2Rk+wNEUwc4Im8ypbz69byRlUFYdtbFQwjsTOQbVWeICt0MxcGKIGIVw
         EOmPp9wk5XqrPzJFbHWw8xYphwwpt77AlKzac5Wzsy7MGAybEQJGvUHRL6Fuv3mxRyrE
         5b2530RgItWN9wFr2Gu32JI36KSggco9DI7rpOO0u8l/Zf8FHmP72GhHWOfhZB56Wxn2
         7+1ZElr68tcCQzrVWG2AFdtlPReKeIt7/2W4ERre3FtpKVTgOB2/WGgpkxVg/Pf/yOmb
         wu4Q==
X-Gm-Message-State: AOJu0YyJc7xlHq0+hIMyXUKB8b7i8PCHlQYAhAmPew+gEw7lVqbXgGse
	xShbeqTg2Xn7C8j/y/8ef8E6dYA+F2OZKEENI3Wgzd6Scz9CRmb0QYxQ7BuYqwo=
X-Google-Smtp-Source: AGHT+IFV6uq/mxPcGfN5aH4a/OFa1sbDPk/m8vabkvNXag5OPZpCY7tWDQyniafAg8pECIQM+VnRsQ==
X-Received: by 2002:a17:906:4f05:b0:a6f:b5cc:9190 with SMTP id a640c23a62f3a-a75143e7166mr494336866b.28.1719927881662;
        Tue, 02 Jul 2024 06:44:41 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:281e:e880:6485:fc37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf63981sm413799466b.82.2024.07.02.06.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 06:44:41 -0700 (PDT)
Date: Tue, 2 Jul 2024 15:44:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Saravana Kannan <saravanak@google.com>, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] libfdt: overlay: Fix phandle overwrite check for new
 subtrees
Message-ID: <bxyscvary2ozzvdnszl3rtfqy3oo5bxnpn6avvaexhtnd47tck@qa44v5zxqhps>
References: <20240626075551.2493048-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y4wirvo74doowopy"
Content-Disposition: inline
In-Reply-To: <20240626075551.2493048-2-u.kleine-koenig@baylibre.com>


--y4wirvo74doowopy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello David,

On Wed, Jun 26, 2024 at 09:55:52AM +0200, Uwe Kleine-K=F6nig wrote:
> If the overlay's target is only created in a previous fragment, it
> doesn't exist in the unmodified base device tree. For the phandle
> overwrite check this can be ignored because in this case the base tree
> doesn't contain a phandle that could be overwritten.
>=20
> Adapt the corresponding check to not error out if that happens but just
> continue with the next fragment.
>=20
> This is currently triggered by
> arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso in the kernel
> repository which creates /panel in its first fragment and modifies it in
> its second.
>=20
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/all/CAL_JsqL9MPycDjqQfPNAuGfC6EMrdzUivr+fuO=
S7YgU3biGd4A@mail.gmail.com/
> Fixes: 1fad065080e6 ("libfdt: overlay: ensure that existing phandles are =
not overwritten")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

I wonder about this patch's state. Does David wait for feedback by Rob
as he reported the issue? Does Rob expect Geert to comment as
salvator-panel-aa104xd12.dtso is in his maintainer area? Are the
responsible people just busy; or is this fix already hidden in their
backlog?

Otherwise I think the patch is fine to go in. It passes the test suite
and adds a new test that fails without the code change (but passes when
the patch is applied completely).

Best regards
Uwe

--y4wirvo74doowopy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaEBDIACgkQj4D7WH0S
/k7f8wf/dhhF2NOboCquMSh7Bp8FVLF/VF6i4EonH4PO+Vtupj0TpBwrJ5/jORSZ
0x6x50LEuDKgJtpxrTTgbO0NGEEm1Gyw75n+9PwrIJAFt/wC7nOQwbk5WqSrotyJ
EkHPa9eazX8THU/Y9wwwi193YmycMyo2uX5QetcEFkeWFF554mp2tJJi/+rwnp0h
pVPdmF2JSKeRgRf5LS7dSY1QCcI/f7szkSDx0p281Z5HGV6k2rPbEjKtgtIaBfvW
hhUJ2+h8UVYgTD8RjSqOEjTi7aAVwJxQM90weuszHhlr0pRm2FDm07e6XO2CoJRS
X7Czgv+Yg3TCTVT6l4g/f4JSg7UlEg==
=LHkh
-----END PGP SIGNATURE-----

--y4wirvo74doowopy--
