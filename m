Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066708;
	b=YbZjqnc1/hcnfTg+L+5kTc0DAG1/21a/h5ieozqjjZ0Oi0PCdms1DfXzsPvNPgL/7oVu
	 f1fahvc91gIPLsghnPDh2PwaWNJSSg4/SaVQcV57eH7eEIYZt4bPrEpY3yTfPwjgJtx6k
	 e/mn8DGuKqm79p2or8z5a3Oj+jQor1I/btHib6zyYseuMwvRvjj9FBkQyrvkl6gY9bUxp
	 BFSHz62QEFLV9oABPcMktQwEzeg3+D3MWKlhAYt37gQ5nM/05CCPn329wP4HTIQ/KMKEF
	 3LGTA5phMwd1H0IbAkchLCJHIHWLL/XYf6UtoVmech+Xg8dqnYB6V8OGs2UbLtKdfhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066708;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=fx9fJODlL+lWwMwqWe/RwnzZ7ak13QffDWy3uYpo01A=;
	b=NJ30ZJ3jN2/PjQGngwUnWkplYwhmVw9sJReonyLvnCrn6HnMlxHk/ShqypbOOnSUGfj8
	 p0SY72zMqOO6TjXoX0ULhlRkIworphwKCO9OlVi/fG/yjhgAm0f4Q5+F+1+Ckd+jbvkt1
	 5yxy7nBSBGuLyRAEAHDoi9DtQn0OpnP+0hErElO6NoHOdU+WY7FPzKGBF09dHEBksf1Ii
	 w7qGaWzylsUW3nNwBKRRJTUEk5MjYgeYpUV92VUFtCoyyUXqdKqohUZoDuk9CPa8El5gp
	 p3Ehzg0zlKrQoWZyoUxJzigKmbzJJE8zxJx1qBJXcA8zb47yNy/VXbaBR+iLKRTG9EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="H/0h3UqV";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A26606A6FE;
	Thu, 19 Nov 2026 05:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A26606A6FE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=H/0h3UqV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795066699;
	bh=fx9fJODlL+lWwMwqWe/RwnzZ7ak13QffDWy3uYpo01A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/0h3UqVimi2dlK6RZDovHWPgBgbaBwNSioREzicJAnMTXLTFQ8AxFcSZBBurxSML
	 Be2g9EB/aDwUQIoPzlZ/QM1r82i7nQQRNaQpESguljEGrc5HgTHpWB+uVCyQ2X8yM3
	 en1pTpdjXNrzXnyTkTO5ramZE22s6UnkP5CI2GkjeRW7qd5M52jeDyq/8CZm5qSI3v
	 VvL/33j42qAnka6NS9SXZwh/9lIWN0NRtJ2Xkvbnk5YdJIrJkpHSc7aAfizS6HMORb
	 /bPaBoTt7KNaeRrBTdVoCIcoNyvgz/39VXYGZpum2Fu4CQcldLV5B9UFEbof49Cp6S
	 iHBWFDfVnw9nQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jVS1R0YG4z4wSr; Thu, 19 Nov 2026 16:38:19 +1100 (AEDT)
Date: Thu, 19 Nov 2026 16:32:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Doug Anderson <dianders@chromium.org>
Cc: David Laight <david.laight.linux@gmail.com>,
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
Message-ID: <av6J47fOAYxejSgr@gractus.seuss>
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org>
 <20261118095418.51d30ee8@pumpkin>
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="Oda6Tp0/pg70SI9T"
Content-Disposition: inline
In-Reply-To: <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>

--Oda6Tp0/pg70SI9T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 09:24:38AM -0800, Doug Anderson wrote:
> Hi David,
>=20
> On Wed, Nov 18, 2026 at 1:54 AM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Mon, 16 Nov 2026 12:53:05 -0800
> > Douglas Anderson <dianders@chromium.org> wrote:
> >
> > > `fdt_find_string_len_()` currently calls `memcmp()` at every byte off=
set
> > > across the string table (`for (p =3D strtab; p <=3D last; p++)`). When
> > > building or modifying trees with large string tables (such as DTBs and
> > > overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
> > > `fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
> > > byte dominates serialization time.
> >
> > Are those symbols just in a linear list with embedded '\0' ?
> > That doesn't scale well at all :-)
>=20
> I'm assuming from your :-) that your "That doesn't scale well at all"
> was intended to be wrapped in <sarcasm> tags? :-P
>=20
>=20
> > > Advance `p` between candidate first-byte matches using `memchr()` (wi=
th
> > > an explicit `slen =3D=3D 0` check for empty property names and a `tab=
size <
> > > slen + 1` bounds check before computing `last`), preserving identical
> > > suffix-sharing behavior.
> >
> > Might it be better to scan for the '\0' that terminated/separates the s=
trings?
> > Then you do one memcmp() for each string/symbol rather than for each ti=
me
> > the first character appears in any string.
>=20
> Two things work against scanning for `'\0'` here:
>=20
> 1. `fdt_find_string_len_()` intentionally supports suffix sharing (e.g.
>    `"controller"` matching the tail of `"interrupt-controller\0"`), so
>    scanning for `'\0'` can't check `nul + 1` (the start of the next
>    string) -- it has to start at `strtab + slen` and test `p =3D nul -
>    slen` before each `'\0'`.
>=20
> 2. Every stored string ends with `'\0'`, whereas `s[0]` only appears in
>    a smaller fraction of bytes. On a real upstream Qualcomm base DTB's
>    `dt_strings` block (855 strings in 11,259 bytes, average 13.2 bytes
>    per string), `'\0'` occurs on 7.6% of bytes while `s[0]` averages
>    3.9%. Replaying those 855 insertions makes 362k `memchr()` calls when
>    scanning for `'\0'` vs. 187k `memchr()` calls when scanning for
>    `s[0]`.
>=20
> > Even with the code below you want to do the !p[slen] check before the m=
emcmp().
>=20
> Agreed. Since `p <=3D last` (`strtab + tabsize - (slen + 1)`), `p[slen]`
> is always in bounds, and checking `!p[slen]` (i.e. `p[slen] =3D=3D '\0'`)
> before `memcmp(p, s, slen) =3D=3D 0` cuts the `memcmp()` call count across
> that 855-string replay from 187k down to 14.3k (the exact same 14.3k
> `memcmp()` calls you'd get from scanning for `'\0'` with a `*p =3D=3D *s`
> pre-check, just with half as many `memchr()` stops).
>=20
> Timing 200 replays of that 855-string (11,259-byte) Qualcomm
> `dt_strings` block with `gcc 15.2 -O2` on x86_64:
> * Original (per-byte `memcmp`): 3.45 s
> * Scan for `'\0'`, `memcmp(nul - slen, s, slen)`: 0.45 s
> * Scan for `'\0'`, `*p =3D=3D *s` then `memcmp`: 0.36 s
> * Scan for `s[0]`, `memcmp` then `!p[slen]` (merged `c954f9dd8357`):
>   0.27 s
> * Scan for `s[0]`, `!p[slen]` then `memcmp`: 0.21 s (~20% faster)
>=20
> Since you already applied this patch to `main` (`c954f9dd8357`), so
> I'll include a 1-line follow-up patch swapping the check order (with
> `Suggested-by:` you) in v5.

Uh.. "you" seems to be referring to two different people here.  I
applied the patch, David Laight suggested the optimization.

Fwiw, since this further optimization is essentially free in terms of
code complexity, I'm certainly happy to apply it.  I am absolutely not
keen on further micro-optimization of this.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Oda6Tp0/pg70SI9T
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr+ieMACgkQzQJF27ox
2GcBcBAArVAy1t9Ls36S1i9km52WSVqKgw+U4UavrTY092dMT8smZtkV9g2RI55C
kMr4JXhuuhN0cadkOtjFPGKn1vKJ/cyw+oiwZwQuN7fgnYM/hJO174WJ6ztTT8pe
YsYm1YzG7U+HGrvQj4AG3xHC/pF6+xGpQLAkOniuN2DNva4aEl5dgknPwKp5W8ou
kY3BiZCW+1hmbhxf7lClmajZaAcPug6rPAC5v2p3HrXdGAfxFPRPqy8VXReKfgNr
pjYEdQAufzow3DaBAS3IIG/qjadsSlZ0yfOCocQWLCuaFrG/HmCWzNcpBJsAAhla
DLXDt37SvXx9H0p9DlnbO/M04W46N1+5R7zcodExThSJ0RDlS+yGK02ZavRFUZz/
1qA9ACDKarpA2mIVf9wJ7+q7OQOf2QooKTjs+kw2reBy/45KV5wePX9C55RxCVjy
tkF1xkiiznnXR54vIZLS2ZJN/zVHG8F06IPNJNjuXoo+9qK5b+6XkRr3nm/IkQaQ
Q6ckw6+/7z05Ph897Y0UBzVR2xi882DbNHtuLoq15CnPSnQJMsV2Uj1JXIcPV+Hf
uY9rxQ2+L/GHqRaStf5fWXzu6WCnPSSgbq04UpQRieyov++caBivDyPlVXx22EEZ
hzdJS3ozK2vBG/Sdx0qTjtYp3/p6eQVCuVU65EQ3weEShm4hNlg=
=zR9B
-----END PGP SIGNATURE-----

--Oda6Tp0/pg70SI9T--
