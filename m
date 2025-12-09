Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5EF2C17A0
	for <devicetree-compiler@vger.kernel.org>; Tue,  9 Dec 2025 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765267089; cv=none; b=Z7KPtOPrhn102SIAayrwFoPBDnGAh5E7lbjO2FYAPY0jO8lVgqqNXNny5X/+Ff/242Gm4ioCRluKVQMd3zvjlSqXrmlIY27+XaXeahAzgz3qYwsiCrIgXo7kIdYkgjwrrllpT9abyPeM+PUY6EE4UqR0vb90N7eEfktS4f8nvfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765267089; c=relaxed/simple;
	bh=GH6YtaPJNCc9xwHKpE2wh/Q1Le5u6e4BVD/GMqTMUSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+MV9dYygvdufkZFfaU9f8mnrzAaFGngH9PWjlEMuRZtdvDgcFQx9vaa/RYjdBHgda9RnAt6v4fRcz3ji1vd+7MsZTtJj0O+d77e8k1P3PyhMeb9QGD3FQi0ELJfb3e5kV22CVfoYzWFebvf54TPGJyGkCDu3VufIz/Kd/XHUoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xRDd0Kg6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xRDd0Kg6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so41038265e9.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 08 Dec 2025 23:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765267082; x=1765871882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Zk9XntnoazVEyxKeuYrbKxCoL2uBtZGniMTRBkiOYo=;
        b=xRDd0Kg6iFjbD/GIBZBz4To812xiRJxWsLFhDDG9ifdX6QqQQsm+zAfudmqQaq5aux
         aNnO2nQEb3bngtLIqpRfGf0ErZDZ+E4hNM9o+NyhX6GVLeEkyaxj/p/GKiQ+V3Rr2zLw
         iycNwuNxa1aa0zhtPVIog3weDxyjh96tiC5UYWbqI3kv90A2aXLUfg0VS+NiUfbvPjIY
         5t913uQdE9HREWrVcvvXJU884s7/3RRFzkpuurCc/tHfs6jGTXPQkUdfmgvd/rKeNoas
         qZp+cxB8NJwpivyMgWPkEal4ckP6cw0KjT8m9Vm3lg0MtI9s5e8/9TX22ANWZ9XM8aPA
         OZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765267082; x=1765871882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Zk9XntnoazVEyxKeuYrbKxCoL2uBtZGniMTRBkiOYo=;
        b=a6prsVHy3p5Uv82eNVqBXT8n6wNttsLBbsWqyGcOY5gkJriPSmPDacrcMwU6xe8vkF
         o9Nga8pIgRF+KRMB3dQZuHbSMQ6JfKGNz6HMsRoYCrxrmm6xIEv7t2oH3v3k2wQIRoX3
         4uvbClQDg4tQ0IP2qU0zh7+jT53YqDe/EqsU0HFs3XoHWO4YBsoGe0+olfrpoX6fOrAV
         COJYqk1soP7dnAGFXO4UFDvzy7j2PvLx13MiU1wpiMbdDAaQ2ZKDT5RwiHbNUj6uJR1O
         Z3KlhJAPxiiD3tcliJxULZt6PyAWggOE9Y3/VdpUov+gk89iENW6GNwnGR6FKgsqe9sd
         PvCQ==
X-Gm-Message-State: AOJu0YzK1h4TZBnoGvDxOlQiz0jNhdJl+u2Ngfi5yb0KUNt7RINmqaij
	8X80HjlsmCqhfoCn40nFvy17G3LMZ27XG+svEtCDx2WwXsLBt5ub1YSbzQ81BJUkZQeGaSe4VBw
	nO22L
X-Gm-Gg: ASbGncumi87KkkSxT/7BQJmxNQ0ZME0ngUdUNDT58Rk0stiImbeJK7G5D+hMjZhv3Zt
	XImvNkKqqLhITYECjg/JSM+O9V1/UVLEWqa6nk7DZGho6aM+zu9j9aWQ/X5gufaurO88MYOgjJr
	ZtiN59pdxmhYeHPhcu6lbaQrff1uLBUlT2GkdtXOet+FV69BpkazhfbiZilz2LcHFUGEe/CabjM
	ydXyvKRxmlYdGWXq3g4QBAS/yCe8BZ1s5AMsqwzdYEPxI82urVj3F2BrsiHYk8bksD/EfJUKYpP
	mOfCqiHtjbj1BY6ZWlQP7tqFsGIkj4UXwpYwUDlNYMhbE7KebQcLaAd/a4RYcEShoj7FGPcuJaf
	IqZJ0CPjTTwRZRfj1JcR0MkhYdTHbNgRc2dffN0MpXqHrYNBLYgEgSmacdUOMObLGeC0BQpi8xD
	sQpWkj9Z9vIPh4TgVG/r9xBNFL1aoEKjJ0oiIrymew+tQC5jYiHzDMK+HDc4OGz9+58NCsvwO3/
	q0=
X-Google-Smtp-Source: AGHT+IHz79af6bGeQpFzLZC4CyBbg9Yy+n0Yu6p/bp1vf/7dNbT4O/RAdsHMQlh0UFcqRfjvBk7WkA==
X-Received: by 2002:a05:6000:22c9:b0:42b:30d4:e3f0 with SMTP id ffacd0b85a97d-42f89f0e237mr9760072f8f.22.1765267081381;
        Mon, 08 Dec 2025 23:58:01 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7cbfeadesm29531746f8f.10.2025.12.08.23.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 23:58:00 -0800 (PST)
Date: Tue, 9 Dec 2025 08:57:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Restore phandles from binary representations
Message-ID: <wm4ot5mmlflj4jrg2f4z57rlcfcjhrdws43l4ewgjpikzqwizh@napkquii4krl>
References: <20250919092912.663304-8-u.kleine-koenig@baylibre.com>
 <khp2b262g5iyp27z5aancaaffbn7j3dqwja5mywftnwmmuzten@35jd5sodbho6>
 <aTZuGaccu-WDN6Ny@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="akdjvzssgrbt3shk"
Content-Disposition: inline
In-Reply-To: <aTZuGaccu-WDN6Ny@zatzit>


--akdjvzssgrbt3shk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/6] Restore phandles from binary representations
MIME-Version: 1.0

Hello David,

On Mon, Dec 08, 2025 at 05:20:09PM +1100, David Gibson wrote:
> On Fri, Dec 05, 2025 at 04:43:43PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Fri, Sep 19, 2025 at 11:29:13AM +0200, Uwe Kleine-K=F6nig wrote:
> > > the motivation is to improve the result when compiling from dtb to dt=
s.
> > > By restoring the labels and phandles the noise in the output of dtdiff
> > > is considerably reduced in many cases.
> > >=20
> > > This is v2 of the series. (Implicit) v1 can be found at
> > > https://lore.kernel.org/devicetree-compiler/cover.1755692822.git.u.kl=
eine-koenig@baylibre.com
> > > . The only change is an added return statement in an error case that i
> > > missed to add. Thanks to David who spotted that.
> >=20
> > I wonder if you have this series still on your radar.
>=20
> Theoretically, yes.  Finding time to look as been.. challenging :(.

OK, now that I know that it's not forgotten, I can be patient. I know
the time phases where it's hardly possible to care for the non-paid
duties.

Best regards
Uwe

--akdjvzssgrbt3shk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmk31oQACgkQj4D7WH0S
/k7Zhwf8DIrFTtXWe6WolHth2jsNeREYgdtkeMQUYgfET8pu5q5OjGSJwqBuukhV
LzGZsupAlXYTxRofNzUWImVfOsifg1DKzlYR5grh+x/NHwfXDNYbwHfwMqVwcc2G
/Bqc0CVQmPeuPW9z8FLMtc+6h51GALCUjGKUyBm0aXCVZifPQjvhHu5hWnSS0LxC
bV2k+6oDL3HOPEQmlvpC6H9nks0AZpKaChGI9fqRau77zBfQttpgSCkHvXdn+iz5
kyWCIWUAeL3/6a16XUj0lExsa8ZxftQmkxQNaoolxMbBAFi+l2nPJnpCM1FW46fL
nTq3/aSXmotcKk93MAoBNeodrgONwg==
=fRb7
-----END PGP SIGNATURE-----

--akdjvzssgrbt3shk--
