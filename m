Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873449;
	b=kRvet0zGY/3vdNcs5yBiFlHjydp17norOsUKpf6ekTQzrok7ks3T6RhYEF8IRuL10p9Z
	 nS/ADSSIutBZWlaC7u0KHWQiUkwRd/uFMl8OxZ/rz1UDjCf0FP2NE/V2JvJCA7AiZWEG/
	 MvRXT9k5lQIj8CtCsGEu+mHjMK9ZtGfaewyVhp6kYKgzUmNuvNpv59Lb6wZkfosat4deH
	 1TV09B7xCLNoKxeAjoGvwJrbXpVTue8lemT4cdxRj4PLhAClh5TbEQw6UkSoVUylntHE+
	 XY1NmgLbCus9xJfsODXqIIk68+pCUUmvi2fj0fibabw/cNlMIIPuOCQUQhGfWWh+//g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873449;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=61bX5Pllewhuc9rV5oZMwSroHWu7wKjpht8TAjfcY9A=;
	b=bdd3CslivTrnXCkdTp1EXojDgG59IjHNWr6XKyP6F61g9YMbn2xn+KSeZCJbpgHrDHX0
	 w+iXEcaoAZjZJDj9qN0dTggaACayoYHYySF8xdOb4pq8Bz7Ee/2/p6J91ZUDtNpFvaYfW
	 13b9nqmPg7qz13C/n3AA/K8p9Cc74Okm7QNIQAeXJjs/VgkMl/qGs2DH0XDopkn/RiU0H
	 KpNwrgZyJYDBM9ZEF+Zn6LcekGUWIABKs4Z3k82SEfXqKjSy9eBb1C3sERWVIhumiqXra
	 Ai2DYuBzHTX70zjKZQlW/IaGeHc8cAwpDHn1C5gIB/vxb/NnOlU/2fyemTmW7vHzOZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=jfEZszcX;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503BA606A31C
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 503BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=jfEZszcX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794873445;
	bh=61bX5Pllewhuc9rV5oZMwSroHWu7wKjpht8TAjfcY9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfEZszcXqO61TqGaAnOAMCjUWvn9umO1icuyQ2O04yKyjNlaDikHxL+jjjQNwPpPi
	 fyHUgL07ZHfE50RSrHw7VoryNkQzlxz4qd+2znIhz8l4PzFlRCVwajqS7vtBlv047v
	 1yER2jmS/Jnb/1gKxLMef2ZhcA9a9NnMzfOYCABj5ZW+G7drFiuoWXdwtoLf8tXPAM
	 FkLt3sTOl1WQAE/iI1ctUFYRUfmCWXy8VRN60Pt/gWxMltmNt1lYKxSS0BpPqzQHqM
	 XLR1PzUrnp/wLzb+qiRTnqUMi9iZkPj/XBpPwV5BbR4sTP9e+kRrL5+kkE2zkEwZlt
	 adZznTrpYh7sw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jT4Y11LMqz4wDw; Tue, 17 Nov 2026 10:57:25 +1100 (AEDT)
Date: Tue, 17 Nov 2026 10:57:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 10/18] dtc: Move labelled-reference handling out of
 the grammar
Message-ID: <avuYXXqjUVbJaRJJ@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-11-sjg@chromium.org>
 <avaOT8P1B7WMeEG4@gractus.seuss>
 <CAFLszTigXO2Aoxo=-qBmuROTw5mQFgaeKqhLSpW9G2yorpFh2Q@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="0BS7Pw2hNXyFsJlO"
Content-Disposition: inline
In-Reply-To: <CAFLszTigXO2Aoxo=-qBmuROTw5mQFgaeKqhLSpW9G2yorpFh2Q@mail.gmail.com>

--0BS7Pw2hNXyFsJlO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:49:55PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Thu, 12 Nov 2026 at 21:19, David Gibson <david@gibson.dropbear.id.au> =
wrote:
> >
> > On Fri, Nov 06, 2026 at 12:51:37PM -0700, Simon Glass wrote:
> > > The grammar action for a top-level label: &ref { ... } holds its merge
> > > logic, which adds the label to the node referred to.
> > >
> > > Move it into merge_ref(), passing it a struct fragment with the label.
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
> > > - Combine merge_labelled_ref() into merge_ref()
> > > - Use dt_ref instead of fragment_ref
> > >
> > >  dtc-parser.y | 13 ++++---------
> > >  livetree.c   | 14 ++++++++++----
> > >  2 files changed, 14 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/dtc-parser.y b/dtc-parser.y
> > > index 3ec9254..8d505a1 100644
> > > --- a/dtc-parser.y
> > > +++ b/dtc-parser.y
> > > @@ -179,16 +179,11 @@ devicetree:
> > >               }
> > >       | devicetree DT_LABEL dt_ref nodedef
> > >               {
> > > -                     struct node *target =3D get_node_by_ref($1, $3);
> > > -
> > > -                     if (($<flags>-1 & DTSF_PLUGIN) && is_ref_relati=
ve($3))
> > > -                             ERROR(&@2, "Label-relative reference %s=
 not supported in plugin", $3);
> > > +                     struct fragment *f;
> > >
> > > -                     if (target) {
> > > -                             add_label(&target->labels, $2);
> > > -                             merge_nodes(target, $4);
> > > -                     } else
> > > -                             ERROR(&@3, "Label or path %s not found"=
, $3);
> > > +                     f =3D build_fragment_ref($2, &@2, $3, &@3, $4);
> > > +                     if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> > > +                             treesource_error =3D true;
> > >                       $$ =3D $1;
> > >               }
> > >       | devicetree dt_ref nodedef
> > > diff --git a/livetree.c b/livetree.c
> > > index 2e9a3b2..7ab9437 100644
> > > --- a/livetree.c
> > > +++ b/livetree.c
> > > @@ -574,10 +574,12 @@ bool is_ref_relative(const char *ref)
> > >  }
> > >
> > >  /*
> > > - * Merge a fragment which refers to a label or path into the node it=
 refers to.
> > > + * Merge a fragment which refers to a label or path into the node it=
 refers to,
> > > + * adding any label in the fragment to that node.
> > >   *
> > >   * In a plugin, a path always refers to the base tree and a label ma=
y do so, if
> > > - * it is not found. In both cases, the fragment becomes an overlay f=
ragment.
> > > + * it is not found. In both cases, the fragment becomes an overlay f=
ragment,
> > > + * unless it adds a label, which needs a node in the plugin itself.
> > >   *
> > >   * Returns true on success, false on an error, which has been report=
ed.
> > >   */
> > > @@ -589,12 +591,14 @@ bool merge_ref(struct node *dt, struct fragment=
 *f, bool plugin)
> > >       assert(f->type =3D=3D FRAGMENT_NODE);
> > >       if (plugin) {
> > >               if (is_ref_relative(f->ref)) {
> > > -                     srcpos_error(f->ref_srcpos, "Error",
> > > +                     srcpos_error(f->label ? f->label_srcpos : f->re=
f_srcpos,
> > > +                                  "Error",
> >
> > This change doesn't make sense to me - the problem is with the ref,
> > not the label, whether or not the label exists.
> >
> > >                                    "Label-relative reference %s not s=
upported in plugin",
> > >                                    f->ref);
> > >                       ok =3D false;
> > >               }
> > > -             if (f->ref[0] =3D=3D '/' || !get_node_by_ref(dt, f->ref=
)) {
> > > +             if (!f->label &&
> >
> > Why does having a label preclude an orphan merge? IIRC, we can encode
> > this by putting label =3D "/fragment@XX/__overlay__" into the dtbo's
> > __symbols__.
> >
>=20
> I'd like to leave this one to a later feature (I am chopping this
> series back) - at the moment it reports 'Label or path not found'.

Ok, again something in the commit message along the lines of "We're
not doing X yet, because Y" would be helpful.

>=20
> > > +                 (f->ref[0] =3D=3D '/' || !get_node_by_ref(dt, f->re=
f))) {
> > >                       /* Add a fragment@N node for the reference */
> > >                       add_orphan_node(dt, f->node, f->ref);
> > >                       return ok;
> > > @@ -607,6 +611,8 @@ bool merge_ref(struct node *dt, struct fragment *=
f, bool plugin)
> > >                            "Label or path %s not found", f->ref);
> > >               return false;
> > >       }
> > > +     if (f->label)
> > > +             add_label(&target->labels, f->label);
> > >       merge_nodes(target, f->node);
> > >
> > >       return ok;
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

--0BS7Pw2hNXyFsJlO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr7mF0ACgkQzQJF27ox
2GeYyQ/9E5hkfIsEU9jHcsCtmbgO8SMtPuj4yhbCKc+dDVOBseumlV3QBGP9G6H1
9qO1T/0wzr7irIBEdxxq2qU8TCg4rEEbk86jfCCEwoTcq9J+RCbLhhvUfx21qweX
uHF7Ich+4KhIsp1tSujLb1Kuldv056A4waew1VsduT/CZWwWobdNbkcjyD8TRaD5
JyZRU5p7TJwiFaX6V6khtgJ4jCiDEt9q7FSW83Q2mbBlb5mOHLvOfzlaOw9fDUrf
gA4AiTeDK2nekzthq3uYQG0LVVaU37Rt5BboDqx1kklxd2ejgeoKtvLnFcBIZ9G2
1Tbmn4zT21S+86cWqEfZTC18F2IQeoa/DIMHwzBXuzQtqAlEqrf4/4MrrQHuzDGV
z2hZ+Bkf5G7dfUIABA/AJMYFmLQqui5i8xyDWENZkcc5HM/n5Cbju8bxtV8Bt242
mCFtwdao0eYhzjVIYuq3uBvGyM1sstaOMauU497RxEl+CUx9cjdRmqgevP//iaof
eOZOoz7bKJOF7LMjbMbloe+dvDvwqdPy1lERz/ADxuvoqjF1nndUTLUbSKlVpi93
U0EWxXNHE5wnHn/58eVNigb/gXU3iblAvODvqunr5fzJB4KXuqlLC6N2k3tuNBlt
QKRZwNyWUDBUBOkxBWy2MuEbOFI4Aa9uAbdHzk7EGRMenq97ung=
=iL32
-----END PGP SIGNATURE-----

--0BS7Pw2hNXyFsJlO--
