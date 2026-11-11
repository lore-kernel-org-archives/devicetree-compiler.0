Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379229;
	b=ktIrAju2yRO5NS/DJl/kaO3nTdDUnIESilEOJhVHU5Z1tMH2TV4CGcGROwelfex6sKWa
	 PKgbqUuou+Hkwk++ZWJJKz5zvgscBEu5jlGtqfbnCS4hMbnmyK/EODk9Vw21MqEAkVFrG
	 4cy4M5XWPVisO+IHQfWIAwBQhOyLzb1EiUY9s99qq3PxXwkpxYBenIe3XNs8BAU3LY/l6
	 w6xdp/I2atLMk9S8wxEdWxfM+JR6V9vGZJPbQui7E4bCOQLa28b2dr9F6RHoxaQ865AC5
	 bgiJy5gjRjHuwunVs7gscqiZYC5s6VbGoQ92OxT4k7o4DdNuTwL0v+UltdZCu9iebpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379229;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=/B2WjY8dPxmE4iNTBpaNxomms+KriRCOJTHJlhIkAS8=;
	b=PaI6QZkAkuBV/WDNI7O88iZrsgUIpoIsFRZbJ+EwsEJRErrVVwrV7NYy3gJEiHjhzXKy
	 lmOtVaMgF1ZDzY+T6WUBR8BUp9a7//8OhLLYzm6VLr0KhEG30TMcn58Lh57+OSaeGtMlk
	 kG/FPFly8259A2ERh9PC/M1m5HtM8cXQTO5rvqU66DPlWEIc8egxtx50aCHIUUD09gLHr
	 apsy6Ew4vCSen+AVeEiZt+xkrN/lbAY3AAC9KXNejUXxo12IJY3ptWQl+YEF6TY0CixrP
	 iDWgU3JIojrmR1UrptzUEOEZyLznK1iJTya+/mLSVCDCftGz84N1S0m2B7hMkd/AFLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=TUEoKV5Q;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CE1606A321
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Nov 2026 06:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CE1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=TUEoKV5Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794379225;
	bh=/B2WjY8dPxmE4iNTBpaNxomms+KriRCOJTHJlhIkAS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TUEoKV5QOJOBSvOmYCXDRbiRH7U553+SGo8eVj/9549/kjY3CdE3uJYs/O19dmKa0
	 02UZUDbYo4b9QNsQhQyOwrAgx/qhnIIEsb172uamMALDzyl7c6Iie9spmrHLS17y54
	 9dNZT29qXV4XZOv21TcB+iJTLU+sOgY3g9MHaL12UOXln/9XqesZhA6R9svaIVlcWy
	 UNledmvyWpbhfAPjhjZmLknOZ9OR9m7B12NIO+y2XoeOgxQ+MJRJyGMxGixiMAHD+u
	 AtrpeN92mQ7MfpA1KcHS/e196yHAsKm+qRgmxJmiuy3Qjt78UVK43V6uVfsfdsTVCt
	 z4rjsZ8mvQY7A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jPYmn3ZGqz4wT7; Wed, 11 Nov 2026 17:40:25 +1100 (AEDT)
Date: Wed, 11 Nov 2026 17:40:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?utf-8?B?6IOh5pmv5rWp?= <jinghaohu33@163.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: dtc: 5 memory-safety =?utf-8?Q?defect?= =?utf-8?B?KHMpIOKAlA==?=
 reports, PoCs and patches attached
Message-ID: <avQNwCvyCiv35sGu@gractus.seuss>
References: <65dc9b31.9048.1a134c2fb58.Coremail.jinghaohu33@163.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U1cALpMsq7XFbFvO"
Content-Disposition: inline
In-Reply-To: <65dc9b31.9048.1a134c2fb58.Coremail.jinghaohu33@163.com>

--U1cALpMsq7XFbFvO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 06:15:55PM +0800, =E8=83=A1=E6=99=AF=E6=B5=A9  wrot=
e:
> Hello,
>=20
>=20
> I found 5 defect(s) in dtc. Each has a minimal PoC, a reproduction
> command and a proposed patch.

I'm now looking at these in more detail.

> 1. Negative size passed to memcpy while reading a flattened device tree p=
roperty
>    CWE-787 / CWE-190 =E2=80=94 Medium | CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/=
C:H/I:H/A:H (7.8 High)
>    A negative length (derived from the property header) bypasses the boun=
ds check and is passed to memcpy, producing a huge copy.

This has since been fixed by 5664b4514077 ("flattree: reject property
lengths exceeding remaining blob size").


> 2. strchr over-read on a non-terminated property value (alias path checki=
ng)
>    CWE-125 =E2=80=94 Low | CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:N/A:N (=
5.5 Medium)
>    A property value that is not NUL-terminated is passed to strchr() whil=
e checking alias paths, reading past the property buffer.

The proposed patch is nonsense.  It checks whether the path parameter
is NULL (pointer), which is unrelated to whether it points to a NUL
(\0) terminated string.

The "proof of concept" is also nonsense.  The change made from
orig.dts to poc.dts does not remove a terminating \0 from the string.
There is already an existing test that *does* test this case (the
"nonull" property).

Maybe there's a real bug in the vicinity, but please don't waste my
time with garbage reports like this.

> 3. fdtdump reads the memory-reserve map at an unvalidated offset
>    CWE-125 =E2=80=94 heap-buffer-overflow read -> crash | CVSS:3.1/AV:L/A=
C:L/PR:N/UI:R/S:U/C:H/I:N/A:N (5.5 Medium)
>    fdtdump computes the reserve-map pointer straight from the header fiel=
d off_mem_rsvmap and then walks it without ever comparing against totalsize.

Real bug, though the impact for a bug in fdtdump is pretty small.  The
provided fix was not very good.  I've written a better fix which I
will push soon.

> 4. fdtdump passes an unvalidated nameoff to printf("%s")
>    CWE-125 =E2=80=94 heap-buffer-overflow read via printf %s -> informati=
on leak and crash | CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:N/A:N (5.5 Mediu=
m)
>    The property-name offset nameoff from the structure block is added to =
the string-block pointer without any validation against size_dt_strings or =
totalsize, and the result is handed to printf("%s").

Like 3, a real bug, but anything in fdtump is low impact.  Fix
provided was poor, I've written an improved one which I will push
shortly.

> 5. fdtdump walks the structure block without a totalsize bound
>    CWE-125 =E2=80=94 heap-buffer-overflow read | CVSS:3.1/AV:L/AC:L/PR:N/=
UI:R/S:U/C:H/I:N/A:N (5.5 Medium)
>    dump_blob() starts at p_struct and follows tags without bounding the c=
ursor by totalsize / size_dt_struct; strlen() on a node name is likewise un=
bounded.

Again, real bug, small impact, poor patch.  I've made a much more
robust fix and will push shortly.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--U1cALpMsq7XFbFvO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr0DcAACgkQzQJF27ox
2GfgthAAjWjzwHOBPU3TiqHYOW3xHPLNqf89IXOnp6HBliACpemacRuocPp6oopL
+WWLft/PqmCfVQxQuK9iah1S+NpvX/d0s+xmOHxFEvFadL/DCiH3jKqspLXB5ESJ
WBk8IVg94Hpc7iIPqNzi6ZE124LKkiIUDHyCLtKspHDzwkFudpmU32ZFZPsZJX7s
0Wn3O0l3RCJZconmt9LIrATFVkkV+ap5ezZsW83GbFvmC6Y4vofntE5cCxvWDK72
zKasyVw2S0q9Nwu+dR3P0hMlllJjw7/fRoYFpolPkBGgMHKdRRflPuPRKY8diWCC
vb0eUI/db2MlP4KdGcnb9j/0nxBSzPr3n/TWhhLuH/tmouCNxDO44vBwaLCikI5c
JVeJB45MlveKxQDHGry8aNkKzZaQurWzkDNXquxec4xPLtRbHsfFh6kPxx4rIuAS
HUd5dovZMoLlvfu9wqShi5WWXdZuI515FSyKty/NlUnlRtYvca99eEc/pjisZkAR
u/57RW4/T1DZtOYYuXKJN8Z5oTWxwkvoJHmXSjA6HDmqZ+OLjzIp5Gh2HZLnoKuV
jWRHbjVbctLhvEh9jgRG9qT70j4RkgKkb8A9xa0zCE7cq88u7c7app7fkpzrEeTe
UKKJ4wB2b6crpcvDXV2f7xc0atbKhe2MCnQWCEsCoVDCZSOS9cg=
=oX4g
-----END PGP SIGNATURE-----

--U1cALpMsq7XFbFvO--
