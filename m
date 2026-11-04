Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775115;
	b=UL6hGzr28y23UShrOlJZ0EA1GS0ItMvXdqNwX2sAhCqfBzK6UJ9Rop3q6vF0tE7ulrZj
	 0cd0rNu65QaPwdAJpCeWg9Bx3/sBX1bY5WUlj4kBFMBCEsewfskWhetljTJ0JTvPeMIWI
	 LBHBGE5KbXvbrwKNhgxHKqPqzcy9sOI/x50jh2qf0I/CetdOvkLnQ4bGqHWFCUBjekj+8
	 AIKnnBl2vzn/l3LkDmJJWBs6TKVr9T/YtQYLXZiaL3w7YWpC8O1kIpIOJl1bbgayr9VuU
	 6XlSBcOsl/xmoJ0GzfnBcLujx9QRlnRKGS8jFICEp03qLInbBa92G8mzgRTGhxn0WSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775115;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Hne3KV8zNUYk1wyqc92nv6hP/N7AnCdEmVWTn9x5Am4=;
	b=VJ+3KuG5D4Mc+8QHxhtj9x3LHBtsz3UHNKVUs65UFdI/7UA6tWzH40KSpMgNuCp2QPJl
	 wWh9UZ9rmK7xmPQEER/IBQ+fot7lHZJfCiwH1Uwwq1CGvmhDUdHsrNBtMGbtsksOtK5ve
	 JO6gi6B7ednUX/238YRrldTc2YD9En4kMrCHYWe9uY0W/G0FCHFlqJdW17d+vZzNBeYzk
	 6BkRBGugBDNn6Gom7qHwnxl+2rQyc+lbKL+uJQ7nifZQkUAuJnqnUHdLaVsKbtWi8LTz9
	 zqzcrFGBO63dIzJaxdrh28JSQl0SUD/eEOshPSAE+MxrsZ29ZpaTQpzo3sE1iJWK2lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=fi4MyQTg;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED4B606A326
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 06:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED4B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=fi4MyQTg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793775111;
	bh=Hne3KV8zNUYk1wyqc92nv6hP/N7AnCdEmVWTn9x5Am4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fi4MyQTgYEc6DGEtBVskHxDjeGbCAEqvZ/Ux1O/P0KS86/jS1gPcpZ9D9lXED2L2m
	 PfdwTtKfFE3VKgJJgPvn+qmN6EF/o/8i3NQVISQ/KltBHycKFBIrsQJV0FXdCmnS4h
	 xYkEUwyaSDx8ekbCi09wxIywAjThGByjF/GWRi8eKVoAsS/LCeQ9jqF6VPTZ3E/+AJ
	 /fjjM/DNfig/kBiZ5hRZoEwgh+JSEkAI29uu1b/T6Smg9/uO5O5EfC0keefgpbjVeo
	 hK9+eAOqu0GgglOVOb17xHLP/qsa92/vEHb/JYli5U9RzleVPw9JtOMz07H7PuwwGU
	 eUDv/hDg8x+oQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jKGMC5QwVz4w91; Wed, 04 Nov 2026 17:51:51 +1100 (AEDT)
Date: Wed, 4 Nov 2026 17:50:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 12/13] dtc: Merge the fragments of a dts file after
 parsing
Message-ID: <aurVnLe9QRE2IYCt@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-13-sjg@chromium.org>
 <20261103180753.37c83a4c@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="ic9dtaqyQwdr3Bzz"
Content-Disposition: inline
In-Reply-To: <20261103180753.37c83a4c@bootlin.com>

--ic9dtaqyQwdr3Bzz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 06:07:53PM +0100, Herve Codina wrote:
> On Sun,  1 Nov 2026 09:37:06 -0700
> Simon Glass <sjg@chromium.org> wrote:
>=20
> > We would like to deal with each top-level fragment of a dts file before
> > it is merged into the tree, but that requires the fragments to be kept
> > apart until the whole file is parsed. At present the parser merges each
> > one as soon as it is parsed. The grammar actions also need to know
> > whether the file is a plugin, which they find using $<flags>-1
> >=20
> > Have the grammar build a list of the fragments instead, in source order,
> > and merge them with a new merge_fragments() once the whole file is
> > parsed. This calls merge_fragment() for each one, so the output does not
> > change, and frees each fragment once it is merged.
> >=20
> > The $<flags>-1 term is no longer needed. Within a devicetree action it
> > reaches back up the parser stack to the value of headers, i.e. the flags
> > from /dts-v1/ and /plugin/. The sourcefile action passes the same value
> > to build_dt_info(), which stores it in dti->dtsflags, so
> > merge_fragments() can use that instead.
> >=20
> > There are two differences in the errors. A syntax error later in the
> > file now stops dtc before any earlier reference errors are reported, and
> > reference errors now come after any other errors which the parser
> > reports, such as a division by zero, rather than in source order.
> >=20
> > dtc gives the same output and messages as before for all 4162 .dts and
> > .dtso files in Linux v7.3-12284-g3799eeb906c9, and for the dts files in
> > tests/
> >=20
> > Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> > Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@grac=
tus.seuss/
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >=20
> >  dtc-parser.y | 43 +++++++++++++------------------------------
> >  dtc.h        |  2 +-
> >  livetree.c   | 36 ++++++++++++++++++++++++++++++++++--
> >  3 files changed, 48 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/dtc-parser.y b/dtc-parser.y
> > index 1ed9731..c1aa4ad 100644
> > --- a/dtc-parser.y
> > +++ b/dtc-parser.y
> > @@ -24,22 +24,6 @@ extern void yyerror(char const *s);
> >  extern struct dt_info *parser_output;
> >  extern bool treesource_error;
> > =20
> > -/*
> > - * Merge a fragment into the tree as soon as it is parsed. The flags c=
ome
> > - * from the actions using $<flags>-1, which relies on the rule being a=
lways:
> > - *   headers memreserves devicetree
> > - * so $-1 is the value of headers
> > - */
> > -static struct node *merge_parsed_fragment(struct node *dt, struct frag=
ment *f,
> > -					  unsigned int flags)
> > -{
> > -	if (merge_fragment(&dt, f, flags & DTSF_PLUGIN))
> > -		treesource_error =3D true;
> > -	free_fragment(f);
> > -
> > -	return dt;
> > -}
> > -
> >  %}
> > =20
> >  %union {
> > @@ -94,7 +78,7 @@ static struct node *merge_parsed_fragment(struct node=
 *dt, struct fragment *f,
> >  %type <labelref> dt_ref
> >  %type <fragment> fragment_ref
> > =20
> > -%type <node> devicetree
> > +%type <fragment> devicetree
> >  %type <node> nodedef
> >  %type <node> subnode
> >  %type <nodelist> subnodes
> > @@ -119,8 +103,10 @@ static struct node *merge_parsed_fragment(struct n=
ode *dt, struct fragment *f,
> >  sourcefile:
> >  	  headers memreserves devicetree
> >  		{
> > -			parser_output =3D build_dt_info($1, $2, $3,
> > -			                              guess_boot_cpuid($3));
> > +			parser_output =3D build_dt_info($1, $2, NULL, 0);
> > +			parser_output->fragments =3D $3;
> > +			if (merge_fragments(parser_output))
> > +				treesource_error =3D true;
>=20
> Why not just pass the fragment list to build_dt_info() instead of using t=
he=20
> parser_output->fragments and later in merge_fragments() setting this same=
 field
> to NULL once the merge is done?

As I noted elswhere, the point of this series is to delay the merge,
and it will need to be after build_dt_info() to do what we want.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ic9dtaqyQwdr3Bzz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrq1ZwACgkQzQJF27ox
2GcFMg//Yoz2zQtLOjBiLaxLPLVq6+qc3R9Zv3Kv8ZGomPAYEKrpyboSD1CSLm+f
Q+LOEH5SRzQdSznyYWkE+zfDq4wRFk3CWxaMTU1LHrKgOoRs5/md7YXLhqnnmPfo
MtpCVxtki77FMVdy1UPVzXCfk6a2buBUbLkC6LwztAIxega7AtZ6bQxWEPH/OYTg
8ze+fIZ6K2MbX0UBSz75ejUTfVmK8UDXiabycaFjKWldqc2BYPpnTXgkpkkC4ugl
b85MfBbZFn0i/NSFa53695/uRMJSA+BB5qVq4CXsdXIGFMm7n+ZkJkDVv8c0PRLY
wBfcZBHa+cgoxWOarFMQTRJHRlYhacm+1RHozC8VVExyKQMimVugF5G+j9jdsF9a
QHfOD4W3pPFp67lUYA/MCJDr+A+lxfcBjx8xuYpNvWBDcBPHJ51f6lPIbYYHqCC5
KkfH/s89MqME+y/HBFhxHdXI6btQN5Ca+kUk+EUv7lBY24nuBvrPj1PYtlDDfIzW
TarLCn5xFs1YnG/zmIajuhkaI27JFcFAc7rJeK9Agp2kyBX10JyGVvwI1i+J2glm
fI5xTB+6zz3VMzSwI4qejiegKvCyszHuICGA7h9lh97Yfi4yjy+3txBvKyb+K+ka
9gUzlGp7i24+XptyaqLTQrsi5aNVwUTStLB5Z0Mel8Q7aRE73eg=
=EHq5
-----END PGP SIGNATURE-----

--ic9dtaqyQwdr3Bzz--
