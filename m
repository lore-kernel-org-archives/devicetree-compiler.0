Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4ED3C8C48;
	Tue, 15 Sep 2026 15:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486070; cv=none; b=NNK9WGF3kNLjNWBrlyaZ4TRvpJ4HogL9F2CqGwVwarNv7t4MnqHLwC++G1HHZyN+UAXuMROnKJFrCaFcZZTctFZAeeGjM5u/pOZjLR6f6sXYdgXzXFhDB2abg5yzh53m/XeE+ExbvNMp58I2XF8+OZayB0bbCZyAXbjjAoXLpqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486070; c=relaxed/simple;
	bh=hWad+I440Ai4RT/R7JQbbC/EbtLWUriZWLZWxmmmJhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwMsqXL1u0CSQpXVHSTaXrihVu4Qeou0g0/6qMX0N21j1mHhHJXbykV+1yddDub28iZQEXD0fcRaEQ0TwDPmwKhf47baajKtUkoaVt8WNRknvZyE8B6tK/z9Qr3JTSt6NWr42KeVb6pVU3XRqrpXM1Gyt0VIB/kPP+qLCMAaH7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=AceE9NS3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="AceE9NS3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789486046;
	bh=lpn/oc3kh4jyZ8eUZM0bAh50zD1/couVZ7TCQcYplJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AceE9NS3A6LoTqRwEjHC3hgzSJmn5N2jOo67XmabcPp4sybc9QyfO8r11d0eY5CIe
	 Q/GmOh11ALm4vX0TXofELRzUXGpccdL6c5SOwU0cTQM8lRKE/rmambbhsL1WZONwOy
	 EsMyGa15t8L6UTDepzlbqWh+tk7qIQHd/l+zVd19reYUACrCbBX63vMCq+/8Z7UdRp
	 n8ql7rOdRwhUSvIj+Gp8DZEz/if5T9BPSDplvwkEXpEuo3aouB45lFEu3nWULLFAlY
	 kDREkHtru1e3l1n6McDiQ7IflaJpUPU6WqIH7wh98HRj48mG9WatYIlbV+cx8cGyOo
	 xne035DY0mw6Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hkm9B74DHz4wFN; Wed, 16 Sep 2026 01:27:26 +1000 (AEST)
Date: Tue, 15 Sep 2026 21:52:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 08/15] flattree: Handle unknown tags
Message-ID: <aqkxacdQHZuhhyxw@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-9-herve.codina@bootlin.com>
 <aqevEJ_VlBxYUp81@gractus.seuss>
 <20260915121635.39f13d34@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qz5AaaQc8onZepjH"
Content-Disposition: inline
In-Reply-To: <20260915121635.39f13d34@bootlin.com>

--Qz5AaaQc8onZepjH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:16:35PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Mon, 14 Sep 2026 18:23:49 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Aug 26, 2026 at 10:31:39AM +0200, Herve Codina wrote:
> > > The structured tag value definition introduced recently gives the
> > > ability to ignore unknown tags without any error when they are read.
> > >=20
> > > Handle those structured tag.
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  flattree.c                                 | 65 ++++++++++++++++++++=
--
> > >  tests/run_tests.sh                         |  5 ++
> > >  tests/unknown_tags_can_skip.dtb.dts.expect | 19 +++++++
> > >  3 files changed, 84 insertions(+), 5 deletions(-)
> > >  create mode 100644 tests/unknown_tags_can_skip.dtb.dts.expect
> > >=20
> > > diff --git a/flattree.c b/flattree.c
> > > index f3b698c1..88dbfa7e 100644
> > > --- a/flattree.c
> > > +++ b/flattree.c
> > > @@ -579,7 +579,8 @@ static void flat_read_chunk(struct inbuf *inb, vo=
id *p, int len)
> > >  	if ((inb->ptr + len) > inb->limit)
> > >  		die("Premature end of data parsing flat device tree\n");
> > > =20
> > > -	memcpy(p, inb->ptr, len);
> > > +	if (p)
> > > +		memcpy(p, inb->ptr, len);
> > > =20
> > >  	inb->ptr +=3D len;
> > >  }
> > > @@ -604,6 +605,61 @@ static void flat_realign(struct inbuf *inb, int =
align)
> > >  		die("Premature end of data parsing flat device tree\n");
> > >  }
> > > =20
> > > +static bool flat_skip_unknown_tag(struct inbuf *inb, uint32_t tag)
> > > +{
> > > +	uint32_t lng;
> > > +
> > > +	if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
> > > +		return false;
> > > +
> > > +	switch (tag & FDT_TAG_DATA_MASK) {
> > > +	case FDT_TAG_DATA_NONE:
> > > +		break;
> > > +
> > > +	case FDT_TAG_DATA_1CELL:
> > > +		flat_read_word(inb);
> > > +		break;
> > > +
> > > +	case FDT_TAG_DATA_2CELLS:
> > > +		flat_read_word(inb);
> > > +		flat_read_word(inb);
> > > +		break;
> > > +
> > > +	case FDT_TAG_DATA_VARLEN:
> > > +		/* Get the length */
> > > +		lng =3D flat_read_word(inb); =20
> >=20
> > I think it would be more natural to get the length as a single value,
> > then have a common flat_read_chunk() and flat_realign() to consume it.
> > That's for two reasons:
> >  * Assuming we keep this length encoding, getting the final tag size
> >    seems like it would make a useful helper function anyway.
> >  * Using flat_read_word() is misleading - it implies it's integer data
> >    where endianness matters.  In this case it's not - it's just some
> >    bytes we're skipping over, we don't know the internal structure.
>=20
> Well, without the length for all tags (I mean keeping some size encoding
> in the tag value), we can avoid the flat_read_word().
> --- 8< ---
> 	switch (tag & FDT_TAG_DATA_MASK) {
> 	case FDT_TAG_DATA_NONE:
> 		lng =3D 0;
> 		break;
>=20
> 	case FDT_TAG_DATA_1CELL:
> 		lng =3D sizeof(uint32_t);
> 		break;
>=20
> 	case FDT_TAG_DATA_2CELLS:
> 		lng =3D 2 * sizeof(uint32_t);
> 		break;
>=20
> 	case FDT_TAG_DATA_VARLEN:
> 		/* Get the length */
> 		lng =3D flat_read_word(inb)
> 		break;
>         }
>=20
>         if (lng) {
> 		flat_read_chunk(inb, NULL, lng);
> 		flat_realign(inb, sizeof(uint32_t));
>         }
> ---- 8< ----

Right, that's exactly what I'm suggesting.

> Related to a helper, I have introduced one in the addon series where new =
tags
> are present and these new tags are no more "unknown" tags and flat_read_s=
ubbuf()
> has been introduced to parse them. You can see that in the patch 11/74 [0=
] or
> directly in the final code [1]
>=20
> [0] https://lore.kernel.org/devicetree-compiler/20260826094950.1088288-12=
-herve.codina@bootlin.com/
> [1] https://github.com/bootlin/dtc/blob/c68038e0ff4cde5de37a21419df8a0820=
32ef994/flattree.c#L1169
>=20
> I can see to avoid some more code duplication between functions skipping =
"unknown" tags
> and function parsing new "known" tags.

Uh.. I don't quite see the relevance of that here.  I'm just
suggesting the length calculation alone be a helper function.


> > > +
> > > +		/* Skip the following length bytes */
> > > +		flat_read_chunk(inb, NULL, lng);
> > > +
> > > +		flat_realign(inb, sizeof(uint32_t));
> > > +		break;
> > > +	}
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static uint32_t flat_read_tag(struct inbuf *inb)
> > > +{
> > > +	uint32_t tag;
> > > +
> > > +	do {
> > > +		tag =3D flat_read_word(inb);
> > > +		switch (tag) {
> > > +		case FDT_BEGIN_NODE:
> > > +		case FDT_END_NODE:
> > > +		case FDT_PROP:
> > > +		case FDT_NOP:
> > > +		case FDT_END:
> > > +			return tag;
> > > +		default:
> > > +			break;
> > > +		}
> > > +	} while (flat_skip_unknown_tag(inb, tag)); =20
> >=20
> > Having this as a separate function seems odd to me...
>=20
> Well, this clearly decouples "known" tags from "unknown" tags and keeps t=
he
> function small.
>=20
> >=20
> > > +	die("Cannot skip unknown tag 0x%08x\n", tag);
> > > +}
> > > +
> > >  static const char *flat_read_string(struct inbuf *inb)
> > >  {
> > >  	int len =3D 0;
> > > @@ -750,7 +806,7 @@ static struct node *unflatten_tree(struct inbuf *=
dtbuf,
> > >  		struct property *prop;
> > >  		struct node *child;
> > > =20
> > > -		val =3D flat_read_word(dtbuf);
> > > +		val =3D flat_read_tag(dtbuf);
> > >  		switch (val) { =20
> >=20
> >=20
> > .. rather than having handling unknown tags as part of the default:
> > case here.
>=20
> Here and probably on some other part if we go in that direction.
>=20
> Here you have already parsed a FDT_BEGIN_NODE to call unflatten_tree().
>=20
> Unknown tags should be handle and skipped if possible at lower level to h=
andle
> them everywhere and without code duplication.
>=20
> flat_read_tag() is this lower level.
>=20
> >=20
> > >  		case FDT_PROP:
> > >  			if (node->children)
> > > @@ -905,14 +961,13 @@ struct dt_info *dt_from_blob(const char *fname)
> > > =20
> > >  	reservelist =3D flat_read_mem_reserve(&memresvbuf);
> > > =20
> > > -	val =3D flat_read_word(&dtbuf);
> > > -
> > > +	val =3D flat_read_tag(&dtbuf);
> > >  	if (val !=3D FDT_BEGIN_NODE)
> > >  		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins wi=
th 0x%08x)\n", val); =20
> >=20
> > Hmm.. doesn't this already need to be fixed to handle NOP tags before
> > the root node?  Logically that change would go before this one.
>=20
> Oh yes, good catch. I missed that one.
>=20
> Will be update in next iteration (in offset 0 vs real root node offset pa=
rt)
> with 2 points:
>   - handle the case here with something like
>     --- 8< ---
>        /* Skip possible FDT_NOP available before the root node */
>        do {
> 	  val =3D flat_read_tag(&dtbuf);
>        } while (tag =3D=3D FDT_NOP);
>=20
>        if (val !=3D FDT_BEGIN_NODE)
> 	  die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0=
x%08x)\n", val);
>        ...
>     --- 8< ---
>=20
>   - Add a test calling dtc with a "nopulated" dtb
>     This test is really missing. Only functions from libfdt are tested wi=
th
>     a nopulated dtb. DTC has to be tested too.

Sounds good.

> >=20
> > > =20
> > >  	tree =3D unflatten_tree(&dtbuf, &strbuf, "", flags);
> > > =20
> > > -	val =3D flat_read_word(&dtbuf);
> > > +	val =3D flat_read_tag(&dtbuf);
> > >  	if (val !=3D FDT_END)
> > >  		die("Device tree blob doesn't end with FDT_END\n"); =20
> >=20
> > Likewise here for that matter, a NOP should be valid between the last
> > FDT_END_NODE and the FDT_END.
>=20
> Yes, exactly and this will be taken into account in the next iteration.

Great.

> > > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > > index f3647e63..8fc23cb7 100755
> > > --- a/tests/run_tests.sh
> > > +++ b/tests/run_tests.sh
> > > @@ -882,6 +882,11 @@ dtc_tests () {
> > > =20
> > >      # Tests for overlay/plugin generation
> > >      dtc_overlay_tests
> > > +
> > > +    # Tests with "unknown tags"
> > > +    run_dtc_test -I dtb -O dts -o unknown_tags_can_skip.dtb.dts unkn=
own_tags_can_skip.dtb
> > > +    base_run_test check_diff unknown_tags_can_skip.dtb.dts "$SRCDIR/=
unknown_tags_can_skip.dtb.dts.expect" =20
> >=20
> > It's best to avoid tests based on -O dts output unless we're
> > explicitly checking -O dts behaviour: because there are multiple ways
> > to format property values, the exact output isn't really guaranteed.
>=20
> But at a give version dtc and a given dtb file, there is only one way
> to generate a dts.

Yes, but if we tweak our -Odts formatting decisions, we don't want to
have to churn tests that aren't specifically related to -Odts.

> If it change because of some modification in dtc, having some changes in
> tests expected value should not be a big deal.

It's not a huge deal, but it's still preferable to avoid.

> > What I'd suggest instead is to adjust treegen to generate two dtbs
> > that are identical _except_ for the skippable tag.  Then you can use
> > dtc -I dtb -O dtb, and compare the dtc output (which should strip the
> > tag) against the dtb which was constructed without it in the first
> > place.
> >=20
> > Or, rather than explicitly creating two new trees, you could make your
> > skippable tag example identical to test_tree1, except for the
> > additional tag, and re-use one of the other instances of test_tree1 as
> > the "tagless" version.
>=20
> Why not just one dtb generated to treegen with unknown tags (already avai=
lable
> unknown_tags_can_skip.dtb)
>=20
> dtc -I dtb -O dtb -o unknown_tags_can_skip.dtb.dtb unknown_tags_can_skip.=
dtb
>=20
> And then
> 	base_run_test wrap_fdtdump unknown_tags_can_skip.dtb.dtb unknown_tags_ca=
n_skip.dtb.dtb.out
>     	# Remove unneeded comments
> 	sed -i '/^\/\/ [^U]/d' unknown_tags_can_skip.dtb.out
>     	base_run_test check_diff unknown_tags_can_skip.dtb.dtb.out "$SRCDIR/=
unknown_tags_can_skip.dtb.expect"

I don't like it - the output formatting of fdtdump is even less
guaranteed than -Odts.

> This avoid the need for 2 dtbs generated by treegen and also avoid to com=
pare
> binary files which are difficult to analyze when the comparison detects a=
 problem
> due to something broken by some modifications.

We _want_ to understand and test things at the binary byte level.
Debugging differences is a little trickier, but it's really not that
bad - -Odts or fdtdump or dtdiff can be used if/when there's a test
failure.  I really think doing the comparison in binary is preferable
- that's the level at which the behaviour is specified and should be
tested.

> > > +    run_wrap_error_test $DTC -I dtb -O dts -o unknown_tags_no_skip.d=
tb.dts unknown_tags_no_skip.dtb
> > >  }
> > > =20
> > >  cmp_tests () {
> > > diff --git a/tests/unknown_tags_can_skip.dtb.dts.expect b/tests/unkno=
wn_tags_can_skip.dtb.dts.expect
> > > new file mode 100644
> > > index 00000000..2194025b
> > > --- /dev/null
> > > +++ b/tests/unknown_tags_can_skip.dtb.dts.expect
> > > @@ -0,0 +1,19 @@
> > > +/dts-v1/;
> > > +
> > > +/ {
> > > +	prop-int =3D <0x3201>;
> > > +	prop-str =3D "abcd";
> > > +
> > > +	subnode1 {
> > > +		prop-int =3D <0x6401 0x6402>;
> > > +	};
> > > +
> > > +	subnode2 {
> > > +		prop-int1 =3D <0x64020 0x64021>;
> > > +		prop-int2 =3D <0x32022>;
> > > +
> > > +		subsubnode {
> > > +			prop-bool;
> > > +		};
> > > +	};
> > > +};
> > > --=20
> > > 2.55.0
> > >=20
> > >  =20
> >=20
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Qz5AaaQc8onZepjH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqpMWkACgkQzQJF27ox
2GfSog//QGhntDiHe7NMaQAgPjbHTkkY5U8gvCK2EOTt7zWJKAdrD1vWdBJsmLaK
F7H2Ar1mcv0tdJLh+AVBhxVZLKf8lC2L3XNHq8L/94acYTNJbRBQUCgRcxY+ke00
dccaOMhGx6+ziYLxBfjyIHjP36BSwHRl45nn6YTOEv427GILoPAeZJKO80ipSluo
ePhcTuJSNBLiVCrHc2zooJWOZMMSGY8E7ER7f81JpxKhmptcBhJJ3rL9nLxK/i6J
uyF4HM0yldhqrJI6fg5RXLPIxqkfQAO+32yv38ME2O1CqJpWniDGExFmT52k4ex0
5cXF45bE/0pNpNoxhWGp8RgUYiYoqL12KVOf0KvAhs/C88wLk8odvWLZaL2HfVmD
MtTolKTN37dTF2IBM+3LuB4rP/EgNVAyOa4bCu7eBkC0ybc+NUtKS+bxFBI4gYeW
GKrmirmVSXrxouGMUaXa8TQRzVPT2+glGoM2E4XBjlHlP0qyh6BiIK96P/1tI0bm
T5WzLu53IgN3udrFy+39aTuRVhvwjNo+CgL53eB5Y5NDlUc5uViEUtr3gOVX2eUN
WJO2vLlTffGeSgs8MoAFJ31F+M4ERlbjju15JYwwaro2M7NBSXB+a/uiSgOUviMN
Ng4WzFd7gh+yseNbGRWmYIj9Vylc6Ey0E/w3LBHMxaFB6HXg9+M=
=+v1h
-----END PGP SIGNATURE-----

--Qz5AaaQc8onZepjH--
