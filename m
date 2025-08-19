Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2278D27FB2A
	for <devicetree-compiler@vger.kernel.org>; Tue, 19 Aug 2025 05:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755581748; cv=none; b=qoSgUBMEETouXiPZM4wD3Yb9SIuDIJb51V0e6sVfYqhEgP9trgz4mtnFiFxr8qFlNJ/CW52Skn6ijXyEogH6mhpas3wVoVcrXSOjjDM8xjj2rcH6t6doaN1vy1nuAg/EwV4Yn5MNnKVsbCWlwCdGKLwNFuKpFF5pHiI/u6ygS+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755581748; c=relaxed/simple;
	bh=8J5U8tmP1f5ZAOxPO3VFLBP5vEPg7ujy8+k7TVjvtYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igUkjB9UHPgXTZi4MGihU9e08qHqh9lI0luCKRkXaBO0WmPgpobQWfjUf3shfhmz0dM1FUMYhXnNKolcVJfOnSXCySZrguwNMoiRxQUSyrzctpn11j8231BJ48ebsR6X5m5dIixKVmTlAVl+12eEXoKu4pDHrcK0ffo6JPnRUBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EgBYBnND; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EgBYBnND"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9d41c1963so2395583f8f.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 18 Aug 2025 22:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755581742; x=1756186542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Po0y0ZW7qPueslbxGpTV/oAEHPGisW/aMyLVkWXDHIQ=;
        b=EgBYBnNDvt8Te4bEt3Cb8Uv8JJLIt7P6oi+1e7N1xioK7BdMXaP5YOEHYZWwt/hA8J
         WG0SCJSJe6TC2Z7dshuvmSI7Mq7MWzT9Y3s2+BbJpbUiHiHzyIOhw0SuWpTPLkz4sw/M
         fySwfgIPbJinrfIC0/JwGIKsrWgXRcY137hO94VbN/gvoR3yUrRC1C8y83s91hSUn9HS
         B4f0R7ne0W0tdoBSIdBnr7d7YUABLq/CFQsVFciJRQOs/a5Mintl3Y4W2cTd2LNInS0Z
         5T0JFcqgUmffBta0EMJ6+u+cnTgeyUwO/OlgRRUMD8jUpZYj9/wYVvR98pfOODz+pDBE
         loDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755581742; x=1756186542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po0y0ZW7qPueslbxGpTV/oAEHPGisW/aMyLVkWXDHIQ=;
        b=Gu/L6jKz6p0woYMZ8rZjDmnRPJviEqXHeWTMD5K71h7MbD+K9vDy8BZRRh7EUePf8S
         VAApSX8pwwbhWQDQz0PtGGoRjw00vdugSJrRZKZXr/ZHLNLUq5ZUsC7njQDJFpUjjeZy
         JWhhCF6qAzuYhfOFnrCfq9H8G6uBtq9M8sePm3FRXfNEtSWDH3WEAlQhtM0JiSeQ7nDS
         u/xHMoqUNxGFngeIZXLHMg3aem0zRMooO0mOxlAhnIcbTLVJKjLeeBOJDwPX0eSHhOd4
         eMg62zJRfs5dfyTmDL/j7VPO5Hb9SslpE1lVwJYkCCvH8LN7FX12ZHpN1cyXsvk8rMlr
         kj8A==
X-Gm-Message-State: AOJu0Yyd+13itMEZxfyMNB2s7NKLaKLZXY8c6VJupHGcX80OKKNvBSNn
	gd1xdaJxaX+XL+kMNUi8U1x86ExxIggKrqH9GGjkQEChfC8s0sVh3pb2wdyUUmaQ9cHCXLvu2lv
	1wXYY
X-Gm-Gg: ASbGncv0GqfRZ2nw7xLWQiBW6caOAk/C0NmAjTVPeesJv01zLz1zc9oALuogAOk6y5q
	z05A+IRNJJzpCXg5aeCY/TryJxP1J52TYToumkPANsrokz7I9Z/1GRxtQvX1qAtTZoyofqlnePe
	qDcDItVVLxZBBfM3VkENcVjyZiCeG4m6VzgKLyhFDVpbefvX2MUU4PK9jvNXpwX6uWPou++Op3c
	yGog7fvONV8PiAoZCWZk5h8blvh75WUCuYjwTFx8haB9c/Up+0dRBkmPJP43UnVF2u3VZLkmoD7
	HxzbWWPYRmulUbpHKRmnWooE1v5Zo78dFJp0bkQygny7OvXsajPY3TaRqtFAdRLcATOdJl4vpR6
	v+nIMu3C8yxknz2q3cyLWVh8tuH42sthqiiB8QxY0TncPNE7ryXfCTOy+SmKYm7qB
X-Google-Smtp-Source: AGHT+IGrUwcJleVHWFc49baO5SjxcVQ7bHKLc0eLJI3BeEaKhI1JKHSinEtLE5MKg3RWPyTRMnfiEA==
X-Received: by 2002:a05:6000:18a7:b0:3b8:f318:dc61 with SMTP id ffacd0b85a97d-3c0ec660614mr841837f8f.40.1755581742071;
        Mon, 18 Aug 2025 22:35:42 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c07496f432sm2097770f8f.6.2025.08.18.22.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:35:41 -0700 (PDT)
Date: Tue, 19 Aug 2025 07:35:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v3 1/2] livetree: Simplify append_to_property()
Message-ID: <vfuiklzwdz5jpyr4mrozbqx6eauoz42mhdwcriri26g3hfj6yi@4etztt5te4ug>
References: <cover.1755512759.git.u.kleine-koenig@baylibre.com>
 <eef88e559f5b9818c4c2311fa8a75ab6fd4508d5.1755512759.git.u.kleine-koenig@baylibre.com>
 <f3nskwqmfkf5i47qbnt4bfh4bfl4c4mt6lygay5cfethpzddj7@6c5bmfnd7g67>
 <aKO2b1OK3eE8-yVo@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j3kadla4xyghgi3k"
Content-Disposition: inline
In-Reply-To: <aKO2b1OK3eE8-yVo@zatzit>


--j3kadla4xyghgi3k
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] livetree: Simplify append_to_property()
MIME-Version: 1.0

Hey David,

On Tue, Aug 19, 2025 at 09:25:35AM +1000, David Gibson wrote:
> On Mon, Aug 18, 2025 at 12:38:57PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Mon, Aug 18, 2025 at 12:35:45PM +0200, Uwe Kleine-K=F6nig wrote:
> > > The two if branches are quite similar. Build the property first (in c=
ase
> > > it doesn't exist) and then the common parts can be done outside the if
> > > block.
> >=20
> > Argh, I failed to add my s-o-b line here. Maybe b4 picks it up when I
> > write:
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> Heh, thanks for adding this after.  I'll take it from here and paste
> it in.

Does that mean you're not using b4, or that b4 doesn't pick it up?

Best regards
Uwe

--j3kadla4xyghgi3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmikDSgACgkQj4D7WH0S
/k5gzwf+JOe2nKv5JY2XNJQqmLk3f07cZdWX6UfkwXym0gVM4Bj1HGF4RlNdmWUT
H8Pe03Gse7wG09AlMPmA8oTcG4nPzF2NKyXO6kHsR49M7Gj1Ia8U1wZY1O/g8NI0
5rPZtzYicwysXkh+DJizrMcsT/KTZkNN2f6nLP1N730lFSsPDCFYm6KwO0PLA9fV
PFIjo/h12c3dlxdN6qCpb/kfLEslxiEqcCpYmppKcOg4Zf6p90miJkfNYpmSc/B0
h9gbH0VYQhOI7BBIdQfBAvL8QD/bDmoXdVqWAV3w1pvF0MKFgK/Kg4uqfZal01sr
GPkxCU1LCtqVH0hHekr9NOFytApTZw==
=O3Jm
-----END PGP SIGNATURE-----

--j3kadla4xyghgi3k--
