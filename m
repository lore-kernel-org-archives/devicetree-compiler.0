Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F72DE70D;
	Mon, 19 Jan 2026 05:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768801220; cv=none; b=Vnl2CTpqIrYKtjPPnu1tpfZ7+/uIAw1EwT9RsosUUvmmrWTo6prZDAjP6IKpCOd9eRt8hoBHWHFUBH/uCjThhacdrn2CeTVdePHIB/lxb0rdvxnNuMPVTDnJ7Q9TAIQSttuLI/2qEio12UhGPHtSmxgYTCh733OyygSipeEJ+L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768801220; c=relaxed/simple;
	bh=boo2RkLYxVAUlhtMUCkiD8pB8e6d/oRHjJvWNH6fbyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYOMCY9hD9FJya17kMiCrzRq3keONJvx1938Sd7Ha3APax38ag9oMKiCj2no26l0HH1u+1l7sgnsS8KPGtnNgAgEJTl5wrQbYG8pagsLCdBIXDYGenjeASZGXpPMYbUN2VW3voqeNCse7/zSHBIibRV9yovO3emvLfdqnZArH+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=TD21t0uf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="TD21t0uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768801217;
	bh=fwDdDG9Zql2oBsaC8x2QxCmFKhOsuXc6agTtcM0PLwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TD21t0ufUohFeKbVK8fFAp3wBx+1Olpy+vYLmahJJmasADImC9dUoxAhA1PwX5QzP
	 TbbJxaGLJQfYbwLQTsa58KXG5591UYP8mHzjjmGkdezhaiA+W7X1yWcHMPoNgV3Aq+
	 spGSwBUVgW3kUuwM3ssfeoYQcpOuLNFmW64KoFYjGV8MluUYqsIjPMIltVf45xfxyK
	 7KW2hAACghAFyg8HUEH+AK9ZadmUlZ0tDcWaoLg2+kTDH4fbkcvutUBMHmISJ8VJcI
	 A2JV7rrFZYUjCWDS3NQ/RDt+Ej2VgY/uzNkq2Qc8i1kN35YWv2LkOLPOLMqiYumOmU
	 ClSmQNku8pKVA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dvfS11b0Cz4wCG; Mon, 19 Jan 2026 16:40:17 +1100 (AEDT)
Date: Mon, 19 Jan 2026 16:21:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 08/77] dtc: Introduce update_phandles_ref()
Message-ID: <aW2_Zm3RmOkNWkiO@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-9-herve.codina@bootlin.com>
 <aWg4_KIBbUMOdP9C@zatzit>
 <20260116122630.35d4fba3@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rRoa7HnolBFEvCP8"
Content-Disposition: inline
In-Reply-To: <20260116122630.35d4fba3@bootlin.com>


--rRoa7HnolBFEvCP8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 12:26:30PM +0100, Herve Codina wrote:
> On Thu, 15 Jan 2026 11:46:52 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:18:58PM +0100, Herve Codina wrote:
> > > With the introduction of FDT_REF_LOCAL dtb tag, a local phandle used
> > > by a property is identify when a dtb is parsed.
> > >=20
> > > In order to have consistent internal data, the reference related to t=
his
> > > phandle usage needs to be updated based on the phandle value.
> > >=20
> > > This is done by update_phandles_ref().
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > >  dtc.c      |  2 ++
> > >  dtc.h      |  2 ++
> > >  livetree.c | 38 ++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 42 insertions(+)
> > >=20
> > > diff --git a/dtc.c b/dtc.c
> > > index b3445b7..88f03ff 100644
> > > --- a/dtc.c
> > > +++ b/dtc.c
> > > @@ -333,6 +333,8 @@ int main(int argc, char *argv[])
> > >  		generate_fixups =3D 1;
> > >  	}
> > > =20
> > > +	update_phandles_ref(dti);
> > > +
> > >  	process_checks(force, dti);
> > > =20
> > >  	if (auto_label_aliases)
> > > diff --git a/dtc.h b/dtc.h
> > > index 965321c..351fe41 100644
> > > --- a/dtc.h
> > > +++ b/dtc.h
> > > @@ -345,6 +345,8 @@ void generate_label_tree(struct dt_info *dti, con=
st char *name, bool allocph);
> > >  void generate_fixups_tree(struct dt_info *dti, const char *name);
> > >  void generate_local_fixups_tree(struct dt_info *dti, const char *nam=
e);
> > > =20
> > > +void update_phandles_ref(struct dt_info *dti);
> > > +
> > >  /* Checks */
> > > =20
> > >  void parse_checks_option(bool warn, bool error, const char *arg);
> > > diff --git a/livetree.c b/livetree.c
> > > index 9b67934..9e30a63 100644
> > > --- a/livetree.c
> > > +++ b/livetree.c
> > > @@ -1158,3 +1158,41 @@ void generate_local_fixups_tree(struct dt_info=
 *dti, const char *name)
> > >  			"Warning: Preexisting data in %s malformed, some content could no=
t be added.\n",
> > >  			name);
> > >  }
> > > +
> > > +static void update_phandles_ref_internal(struct dt_info *dti, struct=
 node *node)
> > > +{
> > > +	struct node *c;
> > > +	struct property *prop;
> > > +	struct marker *m;
> > > +	struct node *refnode;
> > > +	cell_t phandle;
> > > +
> > > +	for_each_property(node, prop) {
> > > +		m =3D prop->val.markers;
> > > +		for_each_marker_of_type(m, REF_PHANDLE) {
> > > +			if (m->ref)
> > > +				continue; =20
> >=20
> > IIUC this means that REF_PHANDLE markers can be missing their ref.
>=20
> Yes, no ref are present in dtb for phandle pointing to local node, only
> the phandle value is present. We need at some point to set the ref from
> this phandle value.
>=20
> > Allowing the markers to be in an incomplete state is a footgun.  If
> > possible it would be better to fully generate the markers when we
> > create them.  If not, we should use a different marker type when it's
> > introduced, and convert it later.
> >=20
> > I think what's going on here is one type is saying "you have a
> > reference, fill in the phandle", the other is saying "you have a
> > phandle, fill in the reference".  Those seem like they should be
> > different types to me, even if they can be converted once all the
> > fixups are applied.
>=20
> Right, I can introduce
> - REF_PHANDLE_FILL_PHANDLE: "you have a phandle, fill in the reference"
>=20
> - REF_PHANDLE_FILL_REF: "you have a reference, fill the phandle"
>   Well, fill the phandle or not... Indeed, this reference can be external=
 and
>   so this can be an unresolved symbol.
>=20
> But anyway those new marker types will exist only between the parsing ste=
p and
> the step where we convert them to REF_PHANDLE markers.

So REF_PHANDLE always has a complete reference, and a
complete-as-possible phandle value (-1 if it's an external reference)?
I think that makes sense - I don't love the proposed names for the
earlier markers, but better ones aren't immediately occurring to me.

>=20
> Will see what I can propose in the next series iteration.
>=20
> Best regards,
> Herv=E9
>=20
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--rRoa7HnolBFEvCP8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmltv2UACgkQzQJF27ox
2GdPOg/+JRPoTUmAw6YPu2Xpq02NBoksas2b14HcZSQjVW+pqNN2ToQHJVCYCnej
NXzm6/5TtLcf4ce3Ncz46nKYHL7eq4rv3LSuVBj90Kil9RGkgZGx+JcvRUGiysXK
cHEUuxyJxCyMbziiP5NcOJLncVxtBGjzgmVH777SC9ITIW1rd6ALXyDdTiUYEUaS
SZAJLZr0vMGQTZMJeipUxcaEWmozCBGvcmBkwhtX7bigOagSURBvmXw0rvSKO4bL
amXkYt3WE8BMkN9PjVyP9paQ1oBPLC5S9roIiejts7GbrvRS50MOMWtubBNsyWre
wwXaMBhlsvdQXg+LLBuxFUug1FHoyAV2MIVWASJ4w+oBg2y+S5i0rCmzyqTzMDD/
/ODWMeCwCHlye+oMGkGdJtwh8S3wYC3vNmSfw6e29zGy0PSYE0ev6IK4iy+GrWtH
VCCxBbHe5HgMczukFUSfQqni/96jhY+F06xFvuojhr7mfB9i81CN2xi6oMBiffdv
tzQ0lvp8qh/ofN05choamNRyKXeUpVe5cGpHuJcUKHkwtw2/BZj8taGj7Xt2hwBp
4Qv27Rs5jt5d4+2WeFGWFqoapN0hivyBdByRDcbqqn35GOzxI2nlJ1jlnr6EiMoE
ATiGjVtob3o/PSOzdA85QgbHDpBPe4e+WxTeF7ZjD2Dlhfv0ijI=
=uf9O
-----END PGP SIGNATURE-----

--rRoa7HnolBFEvCP8--
