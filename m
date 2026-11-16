Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873449;
	b=eJmFLp/WiXXwl8Ipnew0LJ0/HlsU2NlLdzTOU6hDpa4QOglvt3sKzh7h90PEekSrxwG1
	 D56DCKTRKUP79RSNah4sgFtC6EDca4y9NrH6BoyuhSCjlREyCyK0BYCj5pCE3lmgwwfhQ
	 aQofRqllwALUfysscvTryjUVaHOPTf5iPl+cQ+ioUOgtipPWgWKCy+352LDNoQrF7WZvt
	 nDVqsyoVUyk3Uwo8jz9lGuboL13F5tJQrWoiMBDd9S/qIL9VgrnZA+j7dNoyEHyqzh8V3
	 w9Kd+OZYwBLY0Pn4aG/SUT6NnBcZij1L4GGmDXdcMd2LVv0I3pn31YUhrVuhAXgzbjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873449;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=DStBctkBWnOo9NR+AZxAsf4SOTaATKfbyrsYZ2wwzVU=;
	b=iEELvMjE++XJVJ5OckbXs9FOQe5VxK0a19qkOuOmpdlC0g3iTxsUhYeh5Haiqy1wQB5F
	 Vm7pCYm/F3R0E2kpUg7IuBbLI1ED0D0sjKZqRlTsZ3xNIwxeOAJmGRZAIu69bBHU5DD8j
	 1losDltaDwVJmCw1uCaQlwNZSYNy0mm+Px2XoAImBZsVNQ9lQmrRQHm6wjha8IZwhoNTB
	 Wnj7MNCrSSSa5EOH+HXykXVBFoPubHrU1GLSr/isWJxxTz3TlqoXjB0qXADnTfrAxHCpW
	 NSxc1BeMbl3UPZtUCZdfBgGh/QIppuRURkNYKlGm7RdwttigbW6TLGd/VAse67dyZ2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=DrePfff+;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504D6606A323
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 504D6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=DrePfff+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794873445;
	bh=DStBctkBWnOo9NR+AZxAsf4SOTaATKfbyrsYZ2wwzVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DrePfff+rAVUgsfLQ70rlj9+zR3TnpWCL4k6oiAOzqQOOQI1oqySEpA0BP/FkpXYB
	 X1ay7YeW6eMRY+RBFLiGe7LUeBrsPIJ8seijK9Aml0bswIiBDVwOP6cRCeBz+aWt35
	 63mTU8pAB/FyknmDsFEoOFEAMaay3zBCQVg1oZMN3L8CQbANTPQOy29oGeyxteBWAN
	 4pmD9ywgjyHNQ5y9g6/XomJ+PPtXcO1u1NGoqfbukVTyyBXm3i64XqzCZOMG29JLqv
	 lVT78jhnhkZTArxLJRwpbLps0dpd2gL6gJl9cggU3e1Lhix8GqMhmM8W/AteBRcaJJ
	 w/o3mWpNkmEwg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jT4Y1193Vz4wLT; Tue, 17 Nov 2026 10:57:25 +1100 (AEDT)
Date: Tue, 17 Nov 2026 10:55:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 09/18] dtc: Move path-reference handling out of the
 grammar
Message-ID: <avuX9aUcIXxMcn43@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-10-sjg@chromium.org>
 <avaNYs7ZU6bLDy2h@gractus.seuss>
 <CAFLszThKSAWmf-DWaHztT9aCK6yNrHgObcusRW9XuJOZ_8QKKQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="8Z7YU6x4ZgmuhuXk"
Content-Disposition: inline
In-Reply-To: <CAFLszThKSAWmf-DWaHztT9aCK6yNrHgObcusRW9XuJOZ_8QKKQ@mail.gmail.com>

--8Z7YU6x4ZgmuhuXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:49:42PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Thu, 12 Nov 2026 at 21:09, David Gibson <david@gibson.dropbear.id.au> =
wrote:
> >
> > On Fri, Nov 06, 2026 at 12:51:36PM -0700, Simon Glass wrote:
> > > The grammar action for a top-level &{/path} { ... } holds its merge
> > > logic, including making an overlay fragment in a plugin.
> > >
> > > Move it into merge_ref(), which can tell a path from a label by looki=
ng
> > > at the reference, and use a single rule for both kinds of reference.
> > >
> > > The output does not change.
> > >
> > > Assisted-by: Claude:claude-opus-5-5
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > ---
> > >
> > > (no changes since v2)
> > >
> > > Changes in v2:
> > > - Combine merge_path_ref() into merge_ref()
> > > - Combine the rules for label and path references, using dt_ref
> > >
> > >  dtc-parser.y | 27 +--------------------------
> > >  livetree.c   | 33 +++++++++++++++++++++++----------
> > >  2 files changed, 24 insertions(+), 36 deletions(-)
> > >
> > > diff --git a/dtc-parser.y b/dtc-parser.y
> > > index 3614d71..3ec9254 100644
> > > --- a/dtc-parser.y
> > > +++ b/dtc-parser.y
> > > @@ -191,32 +191,7 @@ devicetree:
> > >                               ERROR(&@3, "Label or path %s not found"=
, $3);
> > >                       $$ =3D $1;
> > >               }
> > > -     | devicetree DT_PATH_REF nodedef
> > > -             {
> > > -                     struct node *target =3D get_node_by_ref($1, $2);
> > > -
> > > -                     /*
> > > -                      * We rely on the rule being always:
> > > -                      *   versioninfo plugindecl memreserves devicet=
ree
> > > -                      * so $-1 is what we want (plugindecl)
> > > -                      */
> > > -                     if ($<flags>-1 & DTSF_PLUGIN) {
> > > -                             if (is_ref_relative($2))
> > > -                                     ERROR(&@2, "Label-relative refe=
rence %s not supported in plugin", $2);
> > > -                             /* A path is in the base tree and a lab=
el may be */
> > > -                             if ($2[0] =3D=3D '/' || !target)
> > > -                                     add_orphan_node($1, $3, $2);
> > > -                             else
> > > -                                     merge_nodes(target, $3);
> > > -                     } else {
> > > -                             if (target)
> > > -                                     merge_nodes(target, $3);
> > > -                             else
> > > -                                     ERROR(&@2, "Label or path %s no=
t found", $2);
> > > -                     }
> > > -                     $$ =3D $1;
> > > -             }
> > > -     | devicetree DT_LABEL_REF nodedef
> > > +     | devicetree dt_ref nodedef
> > >               {
> > >                       struct fragment *f;
> > >
> > > diff --git a/livetree.c b/livetree.c
> > > index 179866d..2e9a3b2 100644
> > > --- a/livetree.c
> > > +++ b/livetree.c
> > > @@ -574,29 +574,42 @@ bool is_ref_relative(const char *ref)
> > >  }
> > >
> > >  /*
> > > - * Merge a fragment which refers to a label into the node with that =
label. In
> > > - * a plugin, a label which is not found becomes an overlay fragment.
> > > + * Merge a fragment which refers to a label or path into the node it=
 refers to.
> > > + *
> > > + * In a plugin, a path always refers to the base tree and a label ma=
y do so, if
> > > + * it is not found. In both cases, the fragment becomes an overlay f=
ragment.
> > >   *
> > >   * Returns true on success, false on an error, which has been report=
ed.
> > >   */
> > >  bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
> > >  {
> > > -     struct node *target =3D get_node_by_ref(dt, f->ref);
> > > +     struct node *target;
> > > +     bool ok =3D true;
> > >
> > >       assert(f->type =3D=3D FRAGMENT_NODE);
> > > -     if (target) {
> > > -             merge_nodes(target, f->node);
> > > -             return true;
> > > +     if (plugin) {
> > > +             if (is_ref_relative(f->ref)) {
> > > +                     srcpos_error(f->ref_srcpos, "Error",
> > > +                                  "Label-relative reference %s not s=
upported in plugin",
> > > +                                  f->ref);
> >
> > AFAICT, the fact that we can't encode label-relative references in
> > .dtbo is only relevant in the case that we can't resolve it locally.
> > So I think this should go within the next if.
>=20
> Just on this one, it changes changes behaviour (a local &{label/node}
> would be merged rather than rejected), so I think it is better as its
> own patch, with a test, in the next series (the second half of what
> was in v3).

Fair enough.  Mentioning that in the commit message would be helpful.

> > > +                     ok =3D false;
> > > +             }
> > > +             if (f->ref[0] =3D=3D '/' || !get_node_by_ref(dt, f->ref=
)) {
> > > +                     /* Add a fragment@N node for the reference */
> > > +                     add_orphan_node(dt, f->node, f->ref);
> >
> > Pre-existing, but what will add_orphan_node() actually *do* if given a
> > ref it has no way to encode in a dtbo?
>=20
> It adds target =3D <&label/node>, then dies when writing __fixups__ with
> 'Can't generate fixup for reference to path &{label/node}'. The early
> error gives a position instead.

Well that's certainly an improvement, yay.

>=20
> >
> > > +                     return ok;
> > > +             }
> > >       }
> > > -     if (!plugin) {
> > > +
> > > +     target =3D get_node_by_ref(dt, f->ref);
> >
> > You can leave the get_node_by_ref() at the top, since it's used in
> > both branches.
> >
> > > +     if (!target) {
> > >               srcpos_error(f->ref_srcpos, "Error",
> > >                            "Label or path %s not found", f->ref);
> > >               return false;
> > >       }
> > > -     /* The label may be in the base tree, so add a fragment@N node =
for it */
> > > -     add_orphan_node(dt, f->node, f->ref);
> > > +     merge_nodes(target, f->node);
> >
> > > -     return true;
> > > +     return ok;
> > >  }
> > >
> > >  /*
> > > --
> > > 2.43.0
> > >
> > >
>=20
> Regards,
> Simon
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--8Z7YU6x4ZgmuhuXk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr7l/UACgkQzQJF27ox
2Ge5HQ/+Mw7vYkCWPHvtkv7WcrkoApCgxuC8Y1wPqmhp9vvb+6lQQtRIe5+A/UbL
ODpZALsYm7G+icZ/fTlV3s8wEYBCAQbUt/MihHInUeIO+/LEy6Q3DIXLTWx1YoR3
cR3PS5AbjC1ODE2pGLqIw16FM+H16bhc8Ku5C8KxcBYhcEROf+qu16LGHYL19QiV
e8vzNDKBIknKKdQoGVobERen9R1g3BPYfeE1IOPpnTZFevmvdBUmqbLHD8T9ZxRN
jU6IhIFQtuoGiYzUEQHNIuac9n2CLjg6MIzuJPALfzqN5NFm16hCBzPdYrZs4q2/
6bolSDEKhKN5F2esIC0td7zWjNomwSKNrqO8UT6Yh9AauS5dozguupvljmDMCJMW
R5HBOdpa93nxg3xXkfO0ZLrb1Lxe/cmJ+r3mQkGflZCNbXN2T8hntQo/GE4c/TX5
uMvwUL2zstOuIo6np86eYT3lk+oxIEOF9o0UAhuY/UObeC5GwoG9BV4lWexRMsUb
qmOmF6aFHuXapqCIoQ3vTKOVSvJnGPikw1/U2lHdxXU8mlFr2t3kKfnR+fmFogK7
ts8IfsSaaTGlVXwEPhS5J9IHkj5X2bLWuUV3NEXaHHUXiAC+FBgj75RjXGSSWgBz
GHEU/ZlMYeHJeI+56bBJZBzXgtD+IRrsL4jaYbChGD90fbTVYbE=
=DPT8
-----END PGP SIGNATURE-----

--8Z7YU6x4ZgmuhuXk--
