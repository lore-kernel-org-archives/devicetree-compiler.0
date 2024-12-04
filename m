Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3434623
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Dec 2024 00:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733272578; cv=none; b=uc37zzTrLYR4LdwePOU89GhqClqI3HeiFzFNmZtxlbrCatvEOdFnKfqi1tCPoxvv1hk5C/4Bh4qGXUJ2bCNJuMuDitQwwcnzapoW8e+MJ7XC9rPnBU4x+dbDfpjcoU+8+VQzUBa6KJm88q9TsR6ZR1pzXGMjRz+ocjbFS1pPl4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733272578; c=relaxed/simple;
	bh=z0QnxP3megZjk2ealu2tYteu1z8QKsUo1sN62QF3U/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPF1pw9E3npecRsa+wkgRK5HnnjfOUSGRW+CBNKZV6LqIbPp68wjR0Qfjl5xin9xzoejwzEulpIJ8JbvoCAtAMWVzrsDtLnE0pUV54KX0Y1vcGBsOCkZf4s2Esk2ZemFelkJBGMmLPw2GLzYk4bsg3i7LwnJh/QT8eVQ23bQBPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=HHIkSz/u; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="HHIkSz/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733272569;
	bh=Gj4dWjW+ljfKduOy6iNO8SSIaa/rQSaMLJJCb20Wq1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHIkSz/u1sxPfDDkibXJA3vk0Gz3HLqgcrsLlxARZcS575eURxBKitShxBzOW5ZlS
	 bJymY0C1JiWuQgPhCNPtoRsGQC9SQ5LCfY1d4k8JxWy9UONVMz1YcF/enaDK2uMJ0W
	 b9LyjX35YFsUKfEzkB5aPP1hZWtu1TsH6HbOlgjAGR3IEpiwUIuAB4JJFBNpUYkd7Z
	 1ildQmMeAFKO+K7g3H+tzzb1uHhqGBdUzsUgzWWnxUFx53mEQqxmxpvH8a54Db825S
	 riZLRHR7IjmY2rZpQrCfP8rhEdy6MxEV+knLUrPlQfU1WYwMMpgJ7fGOH3zMIGCBZt
	 HSggM2xu6NoqQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y2z8n3Ryvz4xfh; Wed,  4 Dec 2024 11:36:09 +1100 (AEDT)
Date: Wed, 4 Dec 2024 11:35:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/5] dtc: Allow path fixups in overlays
Message-ID: <Z0-jtUTp9qn0WAVr@zatzit>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-1-ac3e121359e9@beagleboard.org>
 <Z06GPpmkDEPU1XUP@zatzit>
 <b34fa351-ba29-4e40-8ffa-69d40cdbb3c4@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwv75EIEWpjAKhZC"
Content-Disposition: inline
In-Reply-To: <b34fa351-ba29-4e40-8ffa-69d40cdbb3c4@beagleboard.org>


--rwv75EIEWpjAKhZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 12:59:28PM +0530, Ayush Singh wrote:
> On 03/12/24 09:47, David Gibson wrote:
> > On Sat, Nov 16, 2024 at 08:30:19PM +0530, Ayush Singh wrote:
> > > Enable generating fixups entries for path references. These are the s=
ame
> > > as the entries for phandles.
> > >=20
> > > Path properties have empty value in generated overlay. This allows ea=
sy
> > > differentiation between path references (size > 0) and path references
> > > (size =3D=3D 0).
> > >=20
> > > Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> > > ---
> > >   checks.c   |  6 ++++--
> > >   livetree.c | 19 +++++++++++++++++--
> > >   2 files changed, 21 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/checks.c b/checks.c
> > > index 6e06aeab5503f78c8a969f8d1d0e96be7b91749e..1ec59c6a1be375e1695b6=
8203a0782cf23ee33fa 100644
> > > --- a/checks.c
> > > +++ b/checks.c
> > > @@ -651,8 +651,10 @@ static void fixup_path_references(struct check *=
c, struct dt_info *dti,
> > >   			refnode =3D get_node_by_ref(dt, m->ref);
> > >   			if (!refnode) {
> > > -				FAIL(c, dti, node, "Reference to non-existent node or label \"%s=
\"\n",
> > > -				     m->ref);
> > > +				if (!(dti->dtsflags & DTSF_PLUGIN))
> > > +					FAIL(c, dti, node,
> > > +					     "Reference to non-existent node or label \"%s\"\n",
> > > +					     m->ref);
> > >   				continue;
> > >   			}
> > > diff --git a/livetree.c b/livetree.c
> > > index 49f723002f855764452b30b5a979b6096730a33b..4e26d378e09407d6a395c=
2f1bbd73c1874de4ae0 100644
> > > --- a/livetree.c
> > > +++ b/livetree.c
> > > @@ -908,6 +908,13 @@ static bool any_fixup_tree(struct dt_info *dti, =
struct node *node)
> > >   			if (!get_node_by_ref(dti->dt, m->ref))
> > >   				return true;
> > >   		}
> > > +		m =3D prop->val.markers;
> > > +		for_each_marker_of_type(m, REF_PATH)
> > > +		{
> >=20
> > Opening brace goes on the same line as the for_each()
> >=20
> > > +			if (m->ref) {
> >=20
> >=20
> > As for phandle references, you don't need to emit a fixup if the
> > reference can be resolved within the current tree, so you want a
> > get_node_by_ref() before returning true.
> >=20
> > > +				return true;
> > > +			}
> >=20
> > No braces around single statements in dtc style.
>=20
> Is there any clang-format config or something for dtc? I am currently usi=
ng
> the format config from Linux kernel.

No, sorry.  Using the one from the kernel should be very close.

>=20
> >=20
> > > +		}
> > >   	}
> > >   	for_each_child(node, c) {
> > > @@ -924,8 +931,8 @@ static void add_fixup_entry(struct dt_info *dti, =
struct node *fn,
> > >   {
> > >   	char *entry;
> > > -	/* m->ref can only be a REF_PHANDLE, but check anyway */
> > > -	assert(m->type =3D=3D REF_PHANDLE);
> > > +	/* m->ref can only be a REF_PHANDLE or REF_PATH, but check anyway */
> > > +	assert(m->type =3D=3D REF_PHANDLE || m->type =3D=3D REF_PATH);
> > >   	/* The format only permits fixups for references to label, not
> > >   	 * references to path */
> > > @@ -961,6 +968,14 @@ static void generate_fixups_tree_internal(struct=
 dt_info *dti,
> > >   			if (!refnode)
> > >   				add_fixup_entry(dti, fn, node, prop, m);
> > >   		}
> > > +
> > > +		m =3D prop->val.markers;
> > > +		for_each_marker_of_type(m, REF_PATH)
> > > +		{
> > > +			refnode =3D get_node_by_ref(dt, m->ref);
> > > +			if (!refnode)
> > > +				add_fixup_entry(dti, fn, node, prop, m);
> > > +		}
> >=20
> > I don't see how phandle fixups are distinguished from path fixups.
> >=20
> > >   	}
> > >   	for_each_child(node, c)
> > >=20
> >=20
>=20
> Ayush Singh
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--rwv75EIEWpjAKhZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdPo7QACgkQzQJF27ox
2GdcxBAAmQpVCzKf/C2iwvGTAOmB0Il6catWc3nOztUn7UwOQ8Sph6isweSqv9iP
R8B+JmtLDWuXgDjNTAI1Q8N8WaHfVGut4mDysRseh44LD354Cc4Qk0Vyc0+y6FPq
GZuWGs5BfBA4xS/UOQBXUt92PS1HyLwW1t/ToAbBO31+oNqV19ShZaIxXGoOBhB6
wXi5BJsPfoY6ITVbjdcWrXuNTfT2anXCYrAWdmSd6wa0ZRaEOCLWkcpUoChGDxhL
Ua6NYThhjNyLNlxZBqlGFFjz0q+UKN3ziLUoZBMb+QKbDNPXFgloXK1wual/8bTL
O356KfAK/M3doF+/zJvW+dUTmjpDChkZxSb8FKY7Tpgq85F4X5VmSmToq62itd7y
35g+wLNhk6eP/CfjKSGvqw+WSiCXWupSOMaErQbk39mbA4SFjYg1pop7lcppvfsw
33TsgBF1Nds4EgnDHwVKqwUeicYejaIEitgZDsnBuoY9SLckI/J8kauHLYLUQNlS
eIWdbCZ6pmIVP0zIHi9DFneEZnQpUVBOB/X/Hfm2mdXEdo6TIV2FAXftnFbfyUZ6
YHzBkYTAhjxaLBqXAgVBScsSCy0MaY2AwszaPLssEXAzjE2QGKIaoBR0boFmw9g9
PWLp4n+epfh5rqBtwv30fAlQAEOZlfgyfQI+qrDzvxKzeOoAqVo=
=X/iV
-----END PGP SIGNATURE-----

--rwv75EIEWpjAKhZC--
