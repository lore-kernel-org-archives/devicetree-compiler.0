Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16682FD69E
	for <devicetree-compiler@vger.kernel.org>; Fri,  5 Dec 2025 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764949438; cv=none; b=CyPknN+ysOzL7bFrg5kglLKo8ggwKgz1pVxMbgN2b4ydLrZ7BvYUyultbP1eYUSAJnAZn/KaoQq5bKMSeCIoF9zkICB9HJIqp0URFnsi9ajS6V18//9fIX8gK/tn5u9hkDB13zZQkiucrG6GvDittBr6a5Iw51TWTWf0pHgKbiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764949438; c=relaxed/simple;
	bh=GYsm5cuOhIYWXOINSS3JGfmA47Tuc7uP6G6EAP9I7WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHm1ndMCV42UrsLi3VLW+An/7Z3fK34Kx34N7B5NxfZzVXBZFmB5NAxL+iNI25VGGkorTzsGLqUlny/yefJ+cVuXUdFI4ezTdfgYpOyzrTDXWSBkML4wQEYRFPsRcgvoy9ulL4bm5itlCU9ax5tsiooWtmdpYbNRGtth3hCePG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nB9HEaqV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nB9HEaqV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso29157195e9.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 05 Dec 2025 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764949425; x=1765554225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYsm5cuOhIYWXOINSS3JGfmA47Tuc7uP6G6EAP9I7WQ=;
        b=nB9HEaqVY0dUa/HdcjXHNrjeYqTRlFUH/YRa75eYwCpGA1U6HY0zLjauWKe6qLJc/J
         KtIu4IWcUi+iOzICUtq8K6qnPS4o6SgVXtGmvNzumVkJDcnuWX4UHxPFSvCUNlQkUNCX
         37To2yA7MVUqD3FKjYQPYGF7WC7CAbRg2rh/1JLcvQ86GPiWuCBFxfgAqD+ZZ5GFdVxv
         Ey7WAkXnTbcBrA4xFvELMTMJGmzX8uYL9G7WJ1BqH2mZYhydgrmX0W75/a8/iCD7/Sqf
         +bLBVGsIngN14kl7Y8DsFmynrX+C/LpZCDh93NQPkMBwHsBb8Dc2Aou16YIQkDgGmnQo
         kVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764949425; x=1765554225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYsm5cuOhIYWXOINSS3JGfmA47Tuc7uP6G6EAP9I7WQ=;
        b=heUtMi0OxAKIEKTXdHitE9s9MAKucgzDnfpfeZkdXvgV6nw+SHjcFGOVgKA3AWY7UV
         GdRk5/W46hZKeidy4/md9Pods1iy/n53ckQfIJ2hkPpnip4qs8OM0yg1dJ1Ys5TEFa4f
         WTiB4ogmw7NhJGPaThL+UR9URMkJiNA8gSxGyF70YN036BmASw6O+IruVR1Z0shEVQxC
         nz7yNytRoidSafQPtL0ajan14ZVExAITUpRfEid7yeAu/fksMKkgjVJsXa93+lhsirp0
         ccmZ/LW9SajFJqUsmcqIXV5Rc6d+VTpNBZCy7aL4apKWqEiS2OO2YDX5P6NdU5/mMQRv
         HABA==
X-Gm-Message-State: AOJu0Yx1ZUciVpCc+H6BBU0o5CTlQMBWXi/EIIl0byhxJ8fSP2XugzAH
	7YyjURSQLGgO56ri97op9QRnpCJe9V01vjH0zNxnITQsuKB6NXa2GWMFarMb+4iX1q3LFQAYngH
	ey35t
X-Gm-Gg: ASbGnctQ5bsr5MVSERDjjHy7hLjzPZBGStfKBFc1dxghahh1VxRTlCRP4wgg1aPt/l6
	16FXP11LNygRanaiJh5vxfcn+mG8lVH4El4JdLa+4wrPM8q63tPY5Ik2nGe1wUVMdK/d4Sod79a
	CEaR89AAVRA2IRUf65JFpBReeUpBgJTF9ufCLgS7RLaQqE5/xEJ5PdkpYnr+exV0/un0/S/5gUL
	46vWNZQRxF190IL8gu602MTBBgu2FewgmIgWHng+hCuOqjbQGn4hCmR6Q/KTqWzO5Op5UeC+Yr7
	5TOWCcvbjM1twkkjwpd74jLOGN9NhXotfdTyb9GUOVXHFthDuuZd3yI+Y3KQrurKkgBc/W2c/pY
	L42XMMDqztWtBfSuKt7rIFa0vAUYjB9/XOLItRsGMB6CvNPFf0goj8lo+N49CkbbvW5byJXNBbW
	XESb5mrcIvwr9KQff01vuN0br/8ug1fkzXqSSrcLa3RKiJN6okkF93fElzR2sN3fBalHU/8sa5b
	A==
X-Google-Smtp-Source: AGHT+IHGV9XwL+fTJdTEkmlJUkjVaqD0v85U5rYzptecxCuLQBG6zZODz7s+RNr8fvn3Vsm9REmZTw==
X-Received: by 2002:a05:600c:6610:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-4792aeeb50cmr90112865e9.9.1764949425038;
        Fri, 05 Dec 2025 07:43:45 -0800 (PST)
Received: from localhost (p200300f65f0066080f2a7d55dcab4de7.dip0.t-ipconnect.de. [2003:f6:5f00:6608:f2a:7d55:dcab:4de7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479310b693csm87488505e9.4.2025.12.05.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 07:43:44 -0800 (PST)
Date: Fri, 5 Dec 2025 16:43:43 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Restore phandles from binary representations
Message-ID: <khp2b262g5iyp27z5aancaaffbn7j3dqwja5mywftnwmmuzten@35jd5sodbho6>
References: <20250919092912.663304-8-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="isgkol3wpl7t7oko"
Content-Disposition: inline
In-Reply-To: <20250919092912.663304-8-u.kleine-koenig@baylibre.com>


--isgkol3wpl7t7oko
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/6] Restore phandles from binary representations
MIME-Version: 1.0

Hello David,

On Fri, Sep 19, 2025 at 11:29:13AM +0200, Uwe Kleine-K=F6nig wrote:
> the motivation is to improve the result when compiling from dtb to dts.
> By restoring the labels and phandles the noise in the output of dtdiff
> is considerably reduced in many cases.
>=20
> This is v2 of the series. (Implicit) v1 can be found at
> https://lore.kernel.org/devicetree-compiler/cover.1755692822.git.u.kleine=
-koenig@baylibre.com
> . The only change is an added return statement in an error case that i
> missed to add. Thanks to David who spotted that.

I wonder if you have this series still on your radar.

Best regards
Uwe

--isgkol3wpl7t7oko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmky/awACgkQj4D7WH0S
/k4dwAgAh4wb9O6oUKWR2zJW82D4ohs2OPo5Jysl/dPOBbJbUV3bp7JxYluKJP+0
sU0+Dr557fEVYV/bFJDtLOYsRkLFouL/0zjLY+XNt/gLCLcIrR1SZ9Th2jlBLDDM
GJ0KpQ3yrvAB3CJxJXBZejYHiLJpFklnB7y7tKFQY1aBU127e5L0SBVbYZCtPA24
vfyIG1ILrdJcJMvAt/r77cQNJ++vUcEfsjjDRyYHZLZG5grD5WEzzn4LorTY68iL
0nVWfxgiGzMNC56uCNmgKKZDIs33g9qsbl997YvREIuzaj8Kiua/k06+wTwGwDGe
7oNzRv8K8E0ikkxEstKzDmMon922eQ==
=3oyO
-----END PGP SIGNATURE-----

--isgkol3wpl7t7oko--
