Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EAE326D5A
	for <devicetree-compiler@vger.kernel.org>; Tue, 19 Aug 2025 11:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602700; cv=none; b=BkI/5fmWkiEKx6PtNlUDfTHhB4uG5zXpZbdZFqcDBjtYdtCOUVObaXJgpB88oYEmPJNdZeYE20DJDEazHLw8+hNkOxkJXeMdmCCJWORQZdoLXy3Rm30Oz7dSOwc6IM5RTOg8yt9Ph7RJAnTwtsbVS85RkYtiZm6YVgRl1jiOwx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602700; c=relaxed/simple;
	bh=2ORheMATY1473hlDJ+BDnVB/ycCY2F5XVcbkQPCi1bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COe+axpBV+MSt6Drc5ep95fudwhNdQ07pUY55vRFFMUeUvL6oMKRQ1ootreqt1dC5/qB/B4WYUj3H9Sc/rjI+d2jgVx0h8gxEg28b1/4k5zD3/SecDShXsd2TUgz+IE0LE3MyGJhqqPKGHi42RkzvtqdGmyCEszz4snsrzkGfz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=l9GLsvcj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="l9GLsvcj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso3621339f8f.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 19 Aug 2025 04:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755602694; x=1756207494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+h5gxhCTuX6VHC3izab2POwP/2UTF+rM7mMObyz1Dg=;
        b=l9GLsvcjhFzJnAdZJOwYNXbIkmPLIEted+crVT3iZXN8BcRxVvX3P2/vEQLEvq26O4
         kCHgm6WccnN+jVzSYlUL3Hm2uipm5sOt/jIJswu524LriGnOU7kW0YVcFztZ1OpA6mJf
         5Ar6ZA4E6ymFuJm8WY08qBDdGgbchVhiezKGaXGV2U1SKlkhCkQYFiNekXH1TuUNipp9
         7RZbwdRlQFp8TWVD3DQ0zn/52c5/qc5hWalHhWlLYcRdH+Zbm4uKEeN804gk9q0C5aH1
         bNjJItKQgXwE0s68hFz5bc3R931eqT7XYgviCVv3vd2k1S53a9SjpIZMZeVEuMrPfr3s
         z/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755602694; x=1756207494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+h5gxhCTuX6VHC3izab2POwP/2UTF+rM7mMObyz1Dg=;
        b=vlvvH/iW7thHIJCDoB9XM/g2InBrRsJyfoMT7CED0fpX4bjiG0JHr1RBDityGYlDYo
         hOdnjQoAKh6qy6+JYSlgRDYnE26mpQUyiOBlgGaBklYnzWQzmkGPwQUdXM++Su2BlnF1
         2vDTGKotHP8PJCxsPAUtVj1vEcfNTGbDmhDuCWyEO72JUqJaU4dwzaML1FVLHY6TnytZ
         6okyGBbwTZ+gK2JF9Pnpok7iEdD2SB+nql6T78f+JJ11qBFxJa+7ZOQiOp1GSp/GCF/8
         /AiuSAP7rftMgI+FPkpzWrF+Z0/fsuhwvkqo9zV3R4c5UK64oWHrnPD02KKLvgaw5ClB
         /qzA==
X-Gm-Message-State: AOJu0YzaDZCITA9jjUM96/VoBBjHeVsxcpnroJ60uqdK8IUYa12s9yjl
	OUWJBzpe7DmNjTFKVnEynkK+TNPbrhBfhhHbfIJaepz4O0Fj4IBM8ZUyh3qPYNEnTa6YGPFCZkc
	5Q9GA
X-Gm-Gg: ASbGnctpTwPCy4QJBKOlPf+eSLOod5ZVNW6Ct3z6URd/JLqBgKXZlXGfGpVZuNqpQhn
	lmH7pbXgxI690/dPxP2/x8wmKyVDPMxAWTtKd3UnjLMoJOfj+dIOSazN+7hfqW4VA9EkyL7TtEx
	v8Aya029Hif0k/lEhPlqIRLYDY4hsnVs5mXJlpN+g49CqVv26UnStj9g+UH8JcFEJLma4A65r5W
	2M7keQztk9bkVq7mY1cwdeshnaRNEq4mAPPbczIeB+JeY4E4sTbWN/hOfzmGLGGNn8K4RQ0WfYq
	t6teY+Q3ub5djB1cCfqfuRx3NJsQGaUKLqRQAOZMN01ynGZbLTU7peWPdINzf4VXAhiMGDIw4Qt
	Ez3G66Vv4Bre58KWfq0pvyNjyC0HsqTlwFsp7P8phZEOTcdx9mCVKs4ln+4YNFFD/
X-Google-Smtp-Source: AGHT+IFy6FtftIzUjnRumwhXfFarCSiwEMvhATqRff2cEl26Yd8jpYZwlVXcph4WoQaRoVc3d/i5mQ==
X-Received: by 2002:a05:6000:4026:b0:3b8:d740:a16a with SMTP id ffacd0b85a97d-3c1333b557fmr1578386f8f.16.1755602693995;
        Tue, 19 Aug 2025 04:24:53 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074d43626sm3275246f8f.15.2025.08.19.04.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:24:53 -0700 (PDT)
Date: Tue, 19 Aug 2025 13:24:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v3 1/2] livetree: Simplify append_to_property()
Message-ID: <pdqikbvsxfxvjztooptpwt3esz42t5msncbh2ixpxpqitbmen7@hjfst72gvoac>
References: <cover.1755512759.git.u.kleine-koenig@baylibre.com>
 <eef88e559f5b9818c4c2311fa8a75ab6fd4508d5.1755512759.git.u.kleine-koenig@baylibre.com>
 <f3nskwqmfkf5i47qbnt4bfh4bfl4c4mt6lygay5cfethpzddj7@6c5bmfnd7g67>
 <aKO2b1OK3eE8-yVo@zatzit>
 <vfuiklzwdz5jpyr4mrozbqx6eauoz42mhdwcriri26g3hfj6yi@4etztt5te4ug>
 <aKQXB5PuW-vt9zKJ@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="stvfmhf4rlz43a3o"
Content-Disposition: inline
In-Reply-To: <aKQXB5PuW-vt9zKJ@zatzit>


--stvfmhf4rlz43a3o
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] livetree: Simplify append_to_property()
MIME-Version: 1.0

Hello David,

On Tue, Aug 19, 2025 at 04:17:43PM +1000, David Gibson wrote:
> On Tue, Aug 19, 2025 at 07:35:39AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > On Tue, Aug 19, 2025 at 09:25:35AM +1000, David Gibson wrote:
> > > On Mon, Aug 18, 2025 at 12:38:57PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > > Argh, I failed to add my s-o-b line here. Maybe b4 picks it up when=
 I
> > > > write:
> > > >=20
> > > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> > >=20
> > > Heh, thanks for adding this after.  I'll take it from here and paste
> > > it in.
> >=20
> > Does that mean you're not using b4, or that b4 doesn't pick it up?
>=20
> I'm not using b4 - never had enough impetus to figure it out.

In this case it would be just:

	b4 am -s -l -t -3 aKQXB5PuW-vt9zKJ@zatzit

and then execute the git-am at the end of its output.
("aKQXB5PuW-vt9zKJ@zatzit" is just a message id from one mail in the
thread you want to apply.)

I think it doesn't need any preparatory configuration to make that work.

The output for me (after changing my email address in .git/config to
test if my late S-o-b is picked up) is:

	$ b4 am -s -l -t -3 aKQXB5PuW-vt9zKJ@zatzit
	Analyzing 7 messages in the thread
	Analyzing 7 code-review messages
	Checking attestation on all messages, may take a moment...
	---
	  =E2=9C=93 [PATCH v3 1/2] livetree: Simplify append_to_property()
	    + Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> =
(=E2=9C=93 DKIM/baylibre-com.20230601.gappssmtp.com)
	    + Link: https://lore.kernel.org/r/eef88e559f5b9818c4c2311fa8a75ab6fd45=
08d5.1755512759.git.u.kleine-koenig@baylibre.com
	    + Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
	  =E2=9C=93 [PATCH v3 2/2] livetree: Add only new data to fixup nodes inst=
ead of complete regeneration
	    + Link: https://lore.kernel.org/r/b061ee57157fafbb9d5b9b0b86af760d13a0=
4eda.1755512759.git.u.kleine-koenig@baylibre.com
	    + Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
	  ---
	  =E2=9C=93 Signed: openpgp/u.kleine-koenig@baylibre.com
	  =E2=9C=93 Signed: DKIM/baylibre-com.20230601.gappssmtp.com (From: u.klei=
ne-koenig@baylibre.com)
	---
	Total patches: 2
	Preared a fake commit range for 3-way merge (62461e41cde3..3dab71c00c24)
	---
	Cover: ./v3_20250818_u_kleine_koenig_livetree_add_only_new_data_to_fixup_n=
odes_instead_of_complete_regenerati.cover
	 Link: https://lore.kernel.org/r/cover.1755512759.git.u.kleine-koenig@bayl=
ibre.com
	 Base: using specified base-commit 84d9dd2fcbc865a35d7f04d9b465b05ef286d281
	       git checkout -b v3_20250818_u_kleine_koenig_baylibre_com 84d9dd2fcb=
c865a35d7f04d9b465b05ef286d281
	       git am -3 ./v3_20250818_u_kleine_koenig_livetree_add_only_new_data_=
to_fixup_nodes_instead_of_complete_regenerati.mbx

So the added value is:

 - adds your Signed-off-by line (-s)
 - adds a Link: trailer (-l)
 - collects tags from replies to patches (also my late S-o-b)
 - collects tags from replies on the cover message and applies it to all
   patches (-t, though doesn't apply here)
 - apply some magic to make it more likely that git can apply the patch
   if you have a different base than the submitter (-3)
 - checks openpgp, DKIM etc.

Best regards
Uwe

--stvfmhf4rlz43a3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmikXwEACgkQj4D7WH0S
/k7UGwgAuvcLIcRaT6MBy09ia0PEeLi8ENbYMYR1Kpijsjo743czFy4YbJPSBuaw
4Lhy1/gZimXpXbtYsOzzp5md33ap34EWOnhIvimVLGFEsTkoPdJhHm8Tn+5EnGtl
u5IlZRyEzPV2BI6hhq9PWL09IAjPQee75De8/K4AE9W5lFBccUz3jzbLW1Vv4xL+
TwVISUGcCG6DUHvWbmU0MoHKy9DHi0qBYqs9sbclzkUBc+7treIu3LF/FNU21Ru/
UOpql2ZCSLsJZgIcecWpSqpiosZ3W7pL+jSKNc8Lb74NS2al2fKUOKeKVmYj1NOV
gWr8SQ4oWwLWnvSg9ZYQiXPcCqrSOA==
=bjtA
-----END PGP SIGNATURE-----

--stvfmhf4rlz43a3o--
