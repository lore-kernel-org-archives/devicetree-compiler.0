Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A312D2C236C
	for <devicetree-compiler@vger.kernel.org>; Mon, 18 Aug 2025 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755513544; cv=none; b=GPcRsZq+nTY5FzfIHUU58uRGuFWsJuyG0GVR6P8tTeivTH7it83aBRIcYUGuO6YONd4wm0iTGAlDUrT5kE80dHdwsNs/d1eC1Inrc0omkjuRTTthi0PBW1QnhlPRUvEtaBaUoQ5A2vsesEt/VN8LJJ/xV3tORX1QxzKGR9SJEKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755513544; c=relaxed/simple;
	bh=1k0gKS3HLFYLZgqB6uOyN67+fLJh7dUbXqWGYdgvs3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ts/1eIPwCPlSfd1idKyoOSPAvg2ZrHt1ZmTo9HvxRIvpCwJ0CNXyn+E+Vyfz/esRKbfoTMPadAwIH/N+ZZJyU9u2x4ghCCT3JW1hdWs/8GYD8Y0hwPRoWuzrAR4sk5AZ5jOdszHls4qtTRXfzICuHjFWL61n7R6hAveb+JzmS/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xhRFv0MX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xhRFv0MX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a286135c8so6793175e9.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 18 Aug 2025 03:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755513539; x=1756118339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1k0gKS3HLFYLZgqB6uOyN67+fLJh7dUbXqWGYdgvs3A=;
        b=xhRFv0MXG4PMAURRZFGTuxKDaRPKAtUZ8InTSG8rKoqItdjnpEon294V21gUKrSPJ+
         2GzLlb1Ahj4sdqo2sGPvXm8UIhFkhfQjqT1jXgnhddugJNjKiFWICbfhwCpekjBgTH7V
         gUUN+GgHGS368U/aLnFIOYiD5AGeIt1n5Lusvu2GbCTTNd+rZyvgS+KkSU01mSvGQd5a
         vWIH6uX0Py6ON6mmyOLh81nXxZTIGCcICam0pN35rlHqHEaANH/N6X2ZFLWU3dMhQSsz
         WmABpKKtItOVnXFROSYr18tkn/TMzK13qyEtc6ukZMFMyTeWNTNGf/5bTHjk1q1MQOIF
         7NmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755513539; x=1756118339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1k0gKS3HLFYLZgqB6uOyN67+fLJh7dUbXqWGYdgvs3A=;
        b=O68XGJVeVTSC38Ag27DasbHC8QHi3Da8eqH92fmcU9TfGl/ps/l/ooU4j1cNBXHKLH
         p3vERS60BkL7DEZksQAWMa9elz9TzPPISvwJ7Jk49/ps5s4uLl+XGpjzz/oe+cnU6bTf
         efgMxJcLELMkEJwkiyAWYZbr8v57rRtcysqzolQmgToXyG8y7c3wg9UhGBGs6ZegfRdC
         apxfpgDdUB2Jx+l4OjG6zsMBbEkrfQT/jJoxbkARcqrrXMaZeK3Ut1wTtUQSTweVbXXq
         iZxtBsabFuUvZrJSITr7kAWxx2wJIEO4OzT2yndprwO4K8yhH8zmgvmvoLwVjCa5y9kQ
         8wAQ==
X-Gm-Message-State: AOJu0YxOkJtb8q4XC3/x6kGc+Bygh6JmUGzBTVl+iLt144hZJXtVcExC
	9eZ9KEnK6tCSzeyEde9nJGUtZi47KLcWcFWLBVZoi/GqHjxWWRZ95GXoh7gXLoUCZw3wms8iP5x
	ZrAs7
X-Gm-Gg: ASbGnct0PockTCeo/y7X7z+cqMl5CsO51moc3HqOQTZnZo1M6Db7vavK53gmKZQkJxY
	j2c6paSmQVlQb3VpRKEp1oS0MOljAwHOr0nZLxK78ot2voqztmQ+RC1d4MdS1XGaNw4zg3jnDts
	a2q2eiylmo2gzcXbeIk4x0uW/uL4SmhOUgXCpg+wCDKUDegG25zjhVmsjoV7MC0+l79JQCW4A7F
	SZGg+LxdyXPDvG/n0JtGSV2X7mpUg5Amygq3wKT60gDznuRwHi194oqAU7KxOP7XwXXkAIkT8ol
	vhmKIIHcbGbwH7mS3Emc8QPZDXF+dG0QNGeUjkgO15vg0IP5A+9PmxkOKqwWI2bCFpwFYvMiXbQ
	2vRBQPXIUFWApbZGEUuc2iHTqy3kFqALxmfUov1RNV1WQn9WthkcQWvkJod169NOmUw0pVfqEbG
	w=
X-Google-Smtp-Source: AGHT+IHf8MmKje8+Ff+GZkCTLKDFBnNfa4x5yH3j0KXuYmYMHvkMlzyq5QGJBbmODS6bNWJD0Yd7cg==
X-Received: by 2002:a05:600c:444d:b0:459:e39e:e5a5 with SMTP id 5b1f17b1804b1-45a22345439mr83899235e9.5.1755513538805;
        Mon, 18 Aug 2025 03:38:58 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c773e57sm175936595e9.23.2025.08.18.03.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 03:38:58 -0700 (PDT)
Date: Mon, 18 Aug 2025 12:38:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 1/2] livetree: Simplify append_to_property()
Message-ID: <f3nskwqmfkf5i47qbnt4bfh4bfl4c4mt6lygay5cfethpzddj7@6c5bmfnd7g67>
References: <cover.1755512759.git.u.kleine-koenig@baylibre.com>
 <eef88e559f5b9818c4c2311fa8a75ab6fd4508d5.1755512759.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xsrjhvrpt2rnf4vt"
Content-Disposition: inline
In-Reply-To: <eef88e559f5b9818c4c2311fa8a75ab6fd4508d5.1755512759.git.u.kleine-koenig@baylibre.com>


--xsrjhvrpt2rnf4vt
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] livetree: Simplify append_to_property()
MIME-Version: 1.0

Hello,

On Mon, Aug 18, 2025 at 12:35:45PM +0200, Uwe Kleine-K=F6nig wrote:
> The two if branches are quite similar. Build the property first (in case
> it doesn't exist) and then the common parts can be done outside the if
> block.

Argh, I failed to add my s-o-b line here. Maybe b4 picks it up when I
write:

Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

here. It's fixed in my working copy know, so if there will be a v4, this
isn't an issue any more.

Best regards
Uwe

--xsrjhvrpt2rnf4vt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmijAr4ACgkQj4D7WH0S
/k5W2ggAlNAttvmjsVvJck3JilCxyfl5c5pT5TIRJt7v6iifmwKBYLHMCai+2J7p
yCybTuSmWs4rCo3n/aaaTMx93UQgZ3fMf4RKaNnhiDv+9Gp23mu4A7NTp70PQoaO
YVbs4GO2HZyMLZqGxXdXr+q1aymzJUfjdgCGA17KVCA9v7Ry1GN70t7NvF8q8R+u
2yiYleDL0Hm5OJFo6Hq6OWKq36C88wwpZkCOspB7A3SBOkkUxyJro9LsuhUanBlI
EEspJBoQHenc3jk8tPDcvS/YWOFCbSDWJkls08qwE1y2iRyIZU/HFoY6PzM561VO
gUUXTT63o6a2R+tTAvyFRIzboAQKvg==
=+HhJ
-----END PGP SIGNATURE-----

--xsrjhvrpt2rnf4vt--
