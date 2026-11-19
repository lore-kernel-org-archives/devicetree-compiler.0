Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066708;
	b=uSgZZgLbiIB3hqyg5ADxQcVHqx+21Hm7jGyIGYzI+UOyCdSr+lQCY4QzR5jxubmi5+x7
	 aomwX0BmW4epE7VnKqEsv6jUSoMpEjFzvn+6ShiBNSg9xGCBnVMIADjqTAGwWZl+2VLLD
	 xKztLtnYRzu07dLAa1bG/3DlSIqb/Bmvmgv1lXJD2hBGr8R/XdYW0yEzPC+wVexIW5FcL
	 WRleuLW1cjZaCTQuoyEvhWumv9UExFQ4O8oWXPyieDLCut59ZWIgbrCtMrX6gOqbS9oqi
	 JJO8lf0HVQIRnKEcvBsR8F+N8x8uBIwq2uNSC9XTMELFEssq5qqvkhvk/2zGaRN+DbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066708;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=0/TFnWIlNhCYceE6zeQvgZdYUhkwhC73B7FwWHubetQ=;
	b=XJSXIiuIMg47dvbVkjzg7Tmp1lBtShryaW46dNMee9NaMJaQsQaT8JHkc6qEcTgEPXeN
	 HKBoUsmE34iuBLWcmbQAZmTCttizUIOrK9uC6no4xmwGUA68bMQlVJ4j7WdbGqypJzRxj
	 ybrRDwhNla5otrxmFjJ2bfnodERmarX5fEmJEP4DvUDeolQpvtK1V+mujjnP5cgP8jhNF
	 8W8CGnA+ElkHS0+92CfF88TOiy27GTfqcfLtvQHO+x4pkSMTGMCxlcsrs8vrtVszTQVzq
	 TTJppf4/MgH2vHi+t1V11t6gRNDVI/wkEochE0Y3d847HLygr2HTOb0uvSpopVOQb6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=ccBoAVIs;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59F0606A6FD;
	Thu, 19 Nov 2026 05:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E59F0606A6FD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=ccBoAVIs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795066699;
	bh=0/TFnWIlNhCYceE6zeQvgZdYUhkwhC73B7FwWHubetQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccBoAVIskk4HrWlJUy1g+oOxUUtCSjvkcQNGCpBvasgzz7kI5cI81KNXkhaUdkUR+
	 nZBEj5XBlm2oLdXJ7bUkvzs4ZrBme97jVCtB0ZyWdv4wVcWuQq9UWA1L02gjfP5QGw
	 2pthJdYhVRwd4ObHZmcaEsgUJC+GC/2mY2unhpK9GbIxDzEgN6O7Al2TXSOTb58ekn
	 h7PdznlOcaPoxRLmztaPCkEMWPrUdWMWqZhvcQqJnxYVbHpBUD/VAWYNdtwI2SGeIt
	 L7YZK9vranN2kcjbLh8jY0WDPHNLvKrXC69GPD/aclqWhCIFbQyla5QEjuLb/T9jrT
	 ACgu9hn9Ho6Wg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jVS1R0dKkz4wT7; Thu, 19 Nov 2026 16:38:19 +1100 (AEDT)
Date: Thu, 19 Nov 2026 16:35:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: David Laight <david.laight.linux@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>,
	Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with
 memchr()
Message-ID: <av6KvEBGjIbY-2oC@gractus.seuss>
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org>
 <20261118095418.51d30ee8@pumpkin>
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
 <20261118191559.7a39c37f@pumpkin>
 <CAD=FV=U+KX9-XMK0xAzeciAapjFecfTS_DjyVDMGwypVmEE7vg@mail.gmail.com>
 <20261118221538.4de223fd@pumpkin>
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
	protocol="application/pgp-signature"; boundary="7XtHViK9hk8fldPA"
Content-Disposition: inline
In-Reply-To: <20261118221538.4de223fd@pumpkin>

--7XtHViK9hk8fldPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 10:15:38PM +0000, David Laight wrote:
> On Wed, 18 Nov 2026 12:39:59 -0800
> Doug Anderson <dianders@chromium.org> wrote:
>=20
> > Hi David,
> >=20
> > On Wed, Nov 18, 2026 at 11:15 AM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > > =20
> > > > 2. Every stored string ends with `'\0'`, whereas `s[0]` only appear=
s in
> > > >    a smaller fraction of bytes. On a real upstream Qualcomm base DT=
B's
> > > >    `dt_strings` block (855 strings in 11,259 bytes, average 13.2 by=
tes
> > > >    per string), `'\0'` occurs on 7.6% of bytes while `s[0]` averages
> > > >    3.9%. Replaying those 855 insertions makes 362k `memchr()` calls=
 when
> > > >    scanning for `'\0'` vs. 187k `memchr()` calls when scanning for
> > > >    `s[0]`. =20
> > >
> > > You need to count the number of times that a letter that is the first
> > > character of a string you are going to lookup appears in the entire b=
uffer.
> > > There might only be one 'j' in the entire buffer - but you never look=
 for it.
> > > (But I might still be wrong) =20
> >=20
> > That 3.9% (`187,315` `memchr()` calls across ~4.77M scanned bytes) was
> > actually measured directly by replaying those 855 real lookups (`s[0]`
> > of each string being inserted), not an unweighted 1/26 average across
> > the alphabet. Even though common prefixes like `'p'`, `'u'`, `'q'`, and
> > `'s'` get looked up a lot, 26.6% of the `dt_strings` block (`2,139`
> > bytes of `'_'`, `'-'`, `'0'-'9'`, and `'#'`, plus `855` NUL bytes) are
> > characters that almost never appear as `s[0]`, which pulls the
> > lookup-weighted hit rate back down to 3.9%.
> >=20
> > Intuitively, `'\0'` hits once per string (`1 / L`), so `s[0]` wins as
> > long as average string length `L` stays below the ~22-26 byte crossover
> > -- and even on plain non-`-@` DTBs without `/__symbols__`, property
> > names average ~12-14 bytes (`'\0'` still made 1.6x-2.2x more `memchr()`
> > calls than `s[0]` across plain DTB `fdt_sw` builds, `/chosen` fixups,
> > and `.dtbo` overlay application).
> >=20
> > > Have you tried an open coded scans instead of calling memchr() and me=
mcmp()?
> > > With an average of 13 bytes per string (26 for your memchr()) the cod=
e loop
> > > might be faster.
> > > But beware, gcc is likely to convert the code back to a call to memcm=
p()
> > > - it certainly does for strlen and memcpy.
> > >
> > > Oh - and if this code runs in kernel the timings will be significantly
> > > different to glibc - it uses some magic avx instructions for strlen()
> > > and memchr() is effectively the same.
> > > The kernel functions are likely to be out of line byte loops. =20
> >=20
> > Out of curiosity I timed all of those across 200 replays of the same
> > 855-string (11,259-byte) Qualcomm `dt_strings` block with `gcc 15.2` on
> > x86_64 (`gcc -O2` kept the open-coded loops inline and didn't turn them
> > back into `memcmp()`):
>=20
> Once you are doing timings, adding a few more doesn't take long.
>=20
> > * glibc `memchr` + `!p[slen]` + glibc `memcmp`:
> >   0.25 s (`-O0`), 0.23 s (`-Os`), 0.22 s (`-O2`)
> > * glibc `memchr` + `!p[slen]` + open-coded inner compare:
> >   0.23 s (`-O0`), 0.21 s (`-Os`), 0.21 s (`-O2`)
>=20
> So that one is a marginal win.
>=20
> > * Fully open-coded (`p[0] =3D=3D s[0] && !p[slen]` + inner byte loop):
> >   0.91 s (`-O0`), 0.62 s (`-Os`), 0.40 s (`-O2`)
> > * Out-of-line byte-loop `memchr` + `!p[slen]` + byte-loop `memcmp`:
> >   0.86 s (`-O0`), 0.90 s (`-Os`), 0.50 s (`-O2`)
> > * Original per-byte out-of-line byte-loop `memcmp`:
> >   3.31 s (`-O0`), 1.87 s (`-Os`), 1.86 s (`-O2`)
> >=20
> > Even with a ~25-byte average stride, glibc's AVX2 `memchr()` handles
> > almost an entire stride in a single 32-byte vector load + compare, so it
> > beats the open-coded scalar loop by ~1.9x at `-O2` (and ~2.7x at `-Os`).
>=20
> Using avx2 is 'cheating' ...
> Someone at Intel realised that strlen() does matter and threw some silico=
n at it.
> They finally did the same for integer divide (but I think AMD did it firs=
t)
> and did a divide that generates move than one bit per clock.=20
>=20
> > Open-coding just the inner compare barely moves the needle since
> > `!p[slen]` already cut `memcmp()` down to 14.3k calls across the 855
> > insertions.
> >=20
> > On the kernel / bootloader side, `fdt_find_string_len_()` is only called
> > by `fdt_sw` and `fdt_rw` when adding new property names to `dt_strings`
> > -- normal read-only DTB parsing (`fdt_ro.c`) never calls it. And even
> > with a naive out-of-line byte-loop `memchr()`, `memchr()` + `!p[slen]` +
> > `memcmp()` is still 3.7x faster at `-O2` (`1.86 s -> 0.50 s`) and 2.1x
> > faster at `-Os` (`1.87 s -> 0.90 s`) than the old code, so keeping the
> > simpler `memchr()` + `!p[slen]` + `memcmp()` seems like the right
> > tradeoff.
>=20
> Seems reasonable.

Uh, calm down folks.  I'm happy to take easy performance wins, but
this really isn't worth getting deep into the weeds on.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--7XtHViK9hk8fldPA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr+irwACgkQzQJF27ox
2GfQIA//cGUo+rd5IxcCmAuHNzTqnnDAW2cp8yKEou6aBds0Iti3MPt1ZO16UBXZ
LC6tHg9aEpE5O06lsjYzfFcnDIsO2/0wwPIQJGQyqfSR/Q21W/if28my9qv2A+g1
OqokTsYIhCRFl3XS+8wld+Xet2zyBDnHlFep1BkgMRa/KhcNNfPIlLrreyZ4SAeu
ZE7p9Tf1jTiuZtKihs5lI15tT7acbbB1WRpHtPqiZK1rSMvXXwVROKyP4QMuAb43
S7wHIrnVuAVUmaJMdxMcmCBPU83DD0R74lF7SLo4L1nDZZS8qrvc198A+R1xnyfi
l50pIxC3Ni9v4bN6X9oMWC1UE7Puk9t2QcOr28iiuQ33pABu6BBxO5MDbpIj1Dz6
bg6U9tb2xcBC/N/ivnaDs0NAjxOl1Fu++avSc5FbzPcioejtqT9hdF7uNxuUTS+N
gSzMeWCAt0X5g0vvUFUuEwF4LRXMSoZU2I4/d6isYwr6VYRuSywLTxDIMAjnaIts
Dgt4jwpkDpyU6W1747N+oONYFWS3pZXjXIBUoSjM73fXG87jb0XacHSBTazsKTT7
m9EnvIirLzr4PgWwC3Obmp4pih+H30Kk5jhnLgWeHitMuAM1rVCo/Q5BiwAaKYSU
8+i7DfX93HY3DOkrjzDz4aUadp/mGWDMSOkyfrMnCSd3LYeQ86o=
=RDKr
-----END PGP SIGNATURE-----

--7XtHViK9hk8fldPA--
