Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1186345EB1;
	Mon, 28 Sep 2026 04:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570958; cv=none; b=KZ4UDoehXZl+Fss6KX+03ZKsTkMQB/H4l32jYpKZ8biY5DPDJCbhjrEyZ4Cv9YB8xA4k8xocseDJvMXkj8wtaOZ7qXEDzVGDOKlwQd/4o+EzhhY6K0XxNy9OTFOHF6XrqG11hm81cxMlXP1QvqNdNVa45ontLH9vKPubwEf6Zgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570958; c=relaxed/simple;
	bh=LI7sVj6sqCovy3alIyty2p7jb8amQFP/4ZXw7TXf2ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZDDOL8YmJBh9jw8GNar7l1Y4QypSbOBEKZUd175KVKyHKmArxt9PHy45sxcmX/0rArGsFKFj2TJPZGq5+peUqb/eFBw8ReiaBL6yMp0eAredjGzLcCpErmIFHYZGz2uaDePaschLhItg5QkEzG6H3ndTCf9M7ASkaK7hPIX7Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=B95JpFsv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="B95JpFsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1790570336;
	bh=ox6Qj7rZI2VeLEFQ6kBpAP5ug5k0UNbOrHWBazehVyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B95JpFsvvoTmuvTp/0HhOz4Tfh827+ha/oXi4GzBk0OCAN12C/Nj2yONFc5ep0yhU
	 GiQ+VAMp+vpXOwjsgWxeECYcOiW9jSR6mwzZMFAyc5dogp+kxNRUNr44FJREpTkQne
	 V1tCdKNrQVGUeOLtpxrqlEAz98z21XEd3XB44COCVClHhQsvmO5qHfVPrf7eFenAJT
	 Wp7yi969dqGCEtJH3iMSvORggiKlfOhTNF7ZufSaPU+WbcQT7rO9mu+dPhM3vztrRP
	 Ra52q/zIbpDOlK4hQ6RVLXTO6Kt3IiPXsxKpslBD1eIsdEaxN34uuJ08ulxaAgEpzi
	 EAEuZAmvcccbQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4htT8w3TJwz4w9g; Mon, 28 Sep 2026 14:38:56 +1000 (AEST)
Date: Mon, 28 Sep 2026 14:39:18 +1000
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 14/15] libfdt: Handle unknown tags on dtb modifications
Message-ID: <arnvWl4PJUG9b8pb@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-15-herve.codina@bootlin.com>
 <arDJSBEh9Duus0kz@gractus.seuss>
 <20260925144003.61f72c0e@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iLDXjwvw94YOjn12"
Content-Disposition: inline
In-Reply-To: <20260925144003.61f72c0e@bootlin.com>

--iLDXjwvw94YOjn12
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 02:40:03PM +0200, Herve Codina wrote:
> On Mon, 21 Sep 2026 16:06:13 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Aug 26, 2026 at 10:31:45AM +0200, Herve Codina wrote:
> > > The structured tag value definition introduced recently gives the
> > > ability to ignore unknown tags without any error.
> > >=20
> > > When the dtb is modified those unknown tags have to be taken into
> > > account.
> > >=20
> > > First, depending on the unknown tag location, the item associated with
> > > the tag is identified:
> > >   - An unknown tag located just after a FDT_BEGIN_NODE is related to =
the
> > >     node.
> > >=20
> > >   - An unknown tag located just after a FDT_PROP is related to the
> > >     property.
> > >=20
> > >   - An unknown tag out of any node (i.e located before the first
> > >     FDT_BEGIN_NODE or after the last FDT_END_NODE) is a global tag
> > >     related to the dtb itself. =20
> >=20
> > Since we rely on those constraings here, it seems like those should
> > probably be written into the structured tag specs / description.
> > Which to my mind strengthens the case for explicitly calling them
> > "metadata tags".
>=20
> Yes this need to be documented somewhere but where?

Yeah, that's a good question.

> In the end it should be present in the Devicetree Specification.

Right, eventually.  But that will take a while, plus it's preferable
to have the documentation as close as possible to the things you'd be
looking at when it becomes relevant.

So, for starters, I think your commit messages should include this
kind of context and rationale at the point the concepts are introdcued
to the code.  It also might make sense to have some of this  in
comments in fdt.h.  We haven't done much of that so far, but providing
more detail around the bare structure and constant definitions is
probably worthwhile.

> Related to the term "metadata" I am not sure that all future tags will be
> "metadata" tags. Especially global tags (out of any nodes). At this point
> we have "skippable" tags without any more knowledge.

Hm, ok.

> But anyway, I will use the term "metadata".
>=20
> >=20
> > > Then, if we are allowed to write a dtb containing unknown tags, the
> > > following rules are used:
> > >   - When a property is modified, tags related to this property are
> > >     removed and the dtb version is downgraded. =20
> >=20
> > Hmm.  This seems weird to me, but maybe that's because we haven't
> > pinned down in specs / docs what the interaction is between new
> > skippable tags and the overall version.
> >=20
> > My assumption had been that tags - even structured tags - newer than
> > vNNN must not appear in a dtb with version =3D=3D NNN (but they can app=
ear
> > in a dtb with last_compat_version < NNN).
> >=20
> > With that model, this seems kind of backwards - downgrading the
> > version would require removing newer tags throughout the tree, rather
> > than removing some tags causing the version to be downgraded.
>=20
>=20
> The discussion which led to this mechanism is available at [1].

Ah, thanks for the reminder.

> If all tags are removed, there is no way to forward a dtb with unknown ta=
gs
> from a bootloader point of view (support for Vnnn in bootloader) to a Lin=
ux
> Kernel having support for newer dtb version.

I'm guessing that's with the assumption that the bootloader is making
at least minor changes to the tree?  Certainly a tree with unknown
tags can be forwarded unmodified.

> [1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49on=
8VfkP7CDvw@mail.gmail.com/

TBH, I'm finding it pretty hard to follow what Rob's saying there.  It
does help me understand some things you've said elsewhere.

> > >   - When a property is removed, tags related to this property are
> > >     obviously removed. The dtb version is kept unchanged.
> > >=20
> > >   - When a property or a node is added, obviously no unknown tags are
> > >     added and the dtb version is kept unchanged. =20
> >=20
> > This seems weird to me in combination with the behaviour on
> > modification.  The previous one makes more sense to me in the context
> > of an alternative model: newer versions might *require* certain
> > metadata tags are present.  But in that case this part doesn't work.
>=20
> Suppose a tag defined at Vnnn. An older libfdt can add a property to a no=
de
> but cannot add the tag defined at Vnnn. Indeed this tag is unknown.
>=20
> At a given version, libfdt cannot add unknown tags and so as unknown tags
> are not involved when a property is added, there is no need to dowgrade t=
he
> version.

Only if we assume "skippable" tags are always optional.  Making this
assumption means we can't, for example, say: from v23, all properties
_must_ have an FDT_XXX metadata tag.  Constraining future versions
that way seems undesirable to me, since a number of previous revisions
exist to say "you can count on this particular information being
present".  That's been in the form of extra header fields previously,
but I think the same principle applies.  e.g.  it seems like it would
be pretty useful to tell an addon aware bootloader "if version >=3D NNN
then you can rely on all necessary fixup tags being present.

> > >   - When a node is removed, tags related to this node are obviously
> > >     removed. The dtb version is kept unchanged.
> > >=20
> > >   - Adding, removing or modifying a property is not considered as a n=
ode
> > >     modification and so, those operations have no impacts on unknown
> > >     tags related to the node. Those node related tags are kept unchan=
ged. =20
> >=20
> > That.. certainly constrains what it's possible to put in skippable
> > tags, in a way that we'd have to document, though it's not especially
> > easy to do so.
>=20
> Yes, and that's why the FDT_BEGIN_NODE_REF tag defined by the support for=
 addon
> cannot be skipped. If this tag is skipped by older libfdt weird behavior =
will
> happen. The old libfdt will think that the root node is a subnode of an o=
rphan
> node.

Sure, it's pretty clear than anything that would alter the tree
structure can't be skipped.  But the constraints on what needs to be
dropped on what sorts of modification constrict things substantially
further.  For example. the fact that property modifications don't
affect node tags means it wouldn't be possible to have a node tag
which was, say, "total number of properties in this subtree".  That's
a contrived example, obviously, but it's not obvious to me there
wouldn't be some use for "summary" tags of this nature, that is,
something which collates information for an entire node or subtree for
quick reference.

> top level dtb:
>   FDT_BEGIN_NODE_REF <--- Skip by old libfdt
>     FDT_BEGIN_NODE <---- Root node identified by old libfdt
>=20
> To avoid that FDT_BEGIN_NODE_REF cannot be skipped and so old libfdt will
> report an error: Unknown tag which cannot be skipped.
>=20
> >=20
> > >   - The only modification considered as a node modification is setting
> > >     its name. We consider that this operation has no impact on tags
> > >     related to the node. Here also, those node related tags and the
> > >     dtb version are kept unchanged.
> > >=20
> > >   - Global (dtb related) unknown tags are kept unchanged regardless t=
he
> > >     modification done.
> > >=20
> > > Implement those rules when a dtb is modified.
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > ---
> > >  libfdt/fdt_rw.c                               | 129 ++++++++++++++++=
+-
> > >  libfdt/fdt_wip.c                              |  28 +++-
> > >  libfdt/libfdt_internal.h                      |   3 +
> > >  tests/run_tests.sh                            |  78 +++++++++++
> > >  ...own_tags_can_skip.fdtput.test.dtb.0.expect |  31 +++++
> > >  ...own_tags_can_skip.fdtput.test.dtb.1.expect |  35 +++++
> > >  ...own_tags_can_skip.fdtput.test.dtb.2.expect |  33 +++++
> > >  ...own_tags_can_skip.fdtput.test.dtb.3.expect |  35 +++++
> > >  ...own_tags_can_skip.fdtput.test.dtb.4.expect |  34 +++++
> > >  ...own_tags_can_skip.fdtput.test.dtb.5.expect |  32 +++++
> > >  ...own_tags_can_skip.fdtput.test.dtb.6.expect |  27 ++++
> > >  ...nknown_tags_can_skip.wip.test.dtb.0.expect |  31 +++++
> > >  ...nknown_tags_can_skip.wip.test.dtb.1.expect |  35 +++++
> > >  ...nknown_tags_can_skip.wip.test.dtb.2.expect |  37 +++++
> > >  ...nknown_tags_can_skip.wip.test.dtb.3.expect |  38 ++++++
> > >  15 files changed, 603 insertions(+), 3 deletions(-)
> > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.0.exp=
ect
> > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.1.exp=
ect
> > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.2.exp=
ect
> > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.3.exp=
ect
> > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.4.exp=
ect
> > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.5.exp=
ect
> > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.6.exp=
ect
> > >  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.0.expect
> > >  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.1.expect
> > >  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.2.expect
> > >  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.3.expect
> > >=20
> > > diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> > > index ceef49b8..87776609 100644
> > > --- a/libfdt/fdt_rw.c
> > > +++ b/libfdt/fdt_rw.c
> > > @@ -197,10 +197,69 @@ int fdt_del_mem_rsv(void *fdt, int n)
> > >  	return fdt_splice_mem_rsv_(fdt, re, 1, 0);
> > >  }
> > > =20
> > > +static void fdt_nopify_area(void *fdt, int start_offset, int next_of=
fset) =20
> >=20
> > This should be written in terms of fdt_nop_region_() from fdt_wip.c
> > (or else the other way around).  It should also probably live in
> > fdt_wip.c.
> >=20
> > > +{
> > > +	int count =3D (next_offset - start_offset) / sizeof(fdt32_t);
> > > +	fdt32_t fdt32_nop =3D cpu_to_fdt32(FDT_NOP);
> > > +	fdt32_t *ptr;
> > > +
> > > +	ptr =3D fdt_offset_ptr_w_(fdt, start_offset);
> > > +	while (count--)
> > > +		*(ptr++) =3D fdt32_nop;
> > > +};
> > > +
> > > +int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
> > > +				 int prop_offset, bool downgrade_version)
> > > +{
> > > +	int nextoffset, offset;
> > > +	bool is_unknown;
> > > +	uint32_t tag;
> > > +
> > > +	/*
> > > +	 * Only inplace using nopify is supported even if we could use an o=
ther
> > > +	 * method involving splices if force_inplace is set to false. =20
> >=20
> > This comment is fairly hard to understand without reading a lot of the
> > rest of the patch first.  It's also really not ideal - when we're in
> > the fdt_rw context, we want to be able to really truly remove the
> > stale tags, not just NOP them.
>=20
> Well nopifying them is not optimized in the fdt_rw context but it is not
> incorrect.

It breaks the principle of least surprise, though.  Especially since
we don't have a "strip nops" function (aside: that would be a nice
addition).

> Well if nopifying them in the fdt_rw context is a no go, I will add more
> complexity in the next iteration to really remove them instead of just
> nopifying them. Let me know what do you prefer.

I don't think it's actually that much more complex.  You already have
to deal with tree splicing in this case.

> > > +	 */
> > > +
> > > +	tag =3D fdt_next_tag(fdt, prop_offset, &nextoffset);
> > > +	if (tag =3D=3D FDT_END)
> > > +		return nextoffset;
> > > + =20
> >=20
> > Should this error out if tag !=3D FDT_PROP?
>=20
> prop_offset points to a FDT_PROP. Already ckecked.

Not in this function, AFAICT.  I assume the callers ensure this, but
that's not obvious when looking just at this code.  I'd prefer to see
this checked here (unless can_assume(ASSUME_LIBFDT_FLAWLESS))
returning FDT_ERR_INTERNAL if it fails.

> The check here is done to be sure that nextoffset if set to the next offs=
et
> and not to a error code. Indeed, we use nextoffset as the next offset in =
the
> following loop.

Yes, but I get nervous whenever I see a non-exhaustive check on a
return value.

> > > +	/*
> > > +	 * Look at all tags related to the current property. I.e. tags afte=
r the
> > > +	 * current property and before either the next property, a sub-node=
  or
> > > +	 * the end of current node
> > > +	 */
> > > +	do {
> > > +		offset =3D nextoffset;
> > > +		tag =3D fdt_next_tag_(fdt, offset, &nextoffset, &is_unknown);
> > > +		if (tag =3D=3D FDT_END)
> > > +			return nextoffset;
> > > +
> > > +		/*
> > > +		 * Unknown tags are returned as NOP. Force FDT_NOP to be really
> > > +		 * present in the area to remove the unknown tag and its related
> > > +		 * data. Also, as a tag is removed, downgrade the dtb version
> > > +		 * if asked for.
> > > +		 */
> > > +		if (tag =3D=3D FDT_NOP) { =20
> >=20
> > It seems to me this would be more natural using fdt_next_tag_all() (or
> > whatever it ends up being called) and handling the nopping in the
> > 'default' case.
>=20
> This doesn't work in current implementation. All unknown tags are returne=
d as
> FDT_NOP tags. That's fdt_next_tag_() is used. It allows to know if the re=
turned
> FDT_NOP tag is a real FDT_NOP or an unknown tag translated to FDT_NOP.
>=20
> This is the only use case where we really have to handle unknown tags. We=
 need
> to remove them and so not skipping them.

Yes, exactly, that's why I'm saying it would make more sense to use
the iterator that *doesn't* skip unknown tags (whatever it gets called).

> Of course, you asked to change the fdt_next_tag() behavior to have it ret=
urned
> all tags (known and unknown skippable ones) and so this part of code will=
 be
> updated accordingly.

Sure.

> > > +			if (is_unknown) {
> > > +				if (downgrade_version)
> > > +					fdt_downgrade_version(fdt);
> > > +				fdt_nopify_area(fdt, offset, nextoffset);
> > > +			}
> > > +		}
> > > +
> > > +	} while ((tag !=3D FDT_PROP) && (tag !=3D FDT_BEGIN_NODE) &&
> > > +		 (tag !=3D FDT_END_NODE));
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int fdt_resize_property_(void *fdt, int nodeoffset,
> > >  				const char *name, int namelen,
> > >  				int len, struct fdt_property **prop)
> > >  {
> > > +	int prop_offset;
> > >  	int oldlen;
> > >  	int err;
> > > =20
> > > @@ -209,6 +268,15 @@ static int fdt_resize_property_(void *fdt, int n=
odeoffset,
> > >  	if (!*prop)
> > >  		return oldlen;
> > > =20
> > > +	/*
> > > +	 * The property is resized. Remove possible unknown tags related to=
 the
> > > +	 * property downgrading the dtb version.
> > > +	 */
> > > +	prop_offset =3D fdt_ptr_offset_(fdt, *prop);
> > > +	err =3D fdt_prop_remove_unknown_tags(fdt, false, prop_offset, true);
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	if ((err =3D fdt_splice_struct_(fdt, (*prop)->data, FDT_TAGALIGN(ol=
dlen),
> > >  				      FDT_TAGALIGN(len))))
> > >  		return err;
> > > @@ -217,6 +285,29 @@ static int fdt_resize_property_(void *fdt, int n=
odeoffset,
> > >  	return 0;
> > >  }
> > > =20
> > > +static int fdt_node_skip_unknown_tags(void *fdt, int next) =20
> >=20
> > Is 'next' the offset of a node?  If so it should probably have a more
> > suggestive name.
>=20
> No, next is the offset of the first tag available after a FDT_BEGIN_NODE.

Ah, right.

> Should I rename to 'node_next' ?

No, it's ok as is.

> > > +{
> > > +	int nextoffset =3D next;
> > > +	int offset;
> > > +	uint32_t tag;
> > > +
> > > +	/*
> > > +	 * Skip all tags related to the current node. I.e. tags after the
> > > +	 * current node and before either the next property, a sub-node or =
the
> > > +	 * end of current node.
> > > +	 */
> > > +	do {
> > > +		offset =3D nextoffset;
> > > +		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> > > +		if (tag =3D=3D FDT_END)
> > > +			return nextoffset;
> > > +
> > > +	} while ((tag !=3D FDT_PROP) && (tag !=3D FDT_BEGIN_NODE) &&
> > > +		 (tag !=3D FDT_END_NODE));
> > > +
> > > +	return offset;
> > > +}
> > > +
> > >  static int fdt_add_property_(void *fdt, int nodeoffset, const char *=
name,
> > >  			     int namelen, int len, struct fdt_property **prop)
> > >  {
> > > @@ -235,6 +326,15 @@ static int fdt_add_property_(void *fdt, int node=
offset, const char *name,
> > >  	if ((nextoffset =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
> > >  		return nextoffset;
> > > =20
> > > +	/*
> > > +	 * nextoffset it at the first tag after the node.
> > > +	 * Skip possible unknown tags related to the node in order to add t=
he
> > > +	 * property after those tags.
> > > +	 */
> > > +	nextoffset =3D fdt_node_skip_unknown_tags(fdt, nextoffset);
> > > +	if (nextoffset < 0)
> > > +		return nextoffset;
> > > +
> > >  	namestroff =3D fdt_find_add_string_(fdt, name, namelen, &allocated);
> > >  	if (namestroff < 0)
> > >  		return namestroff;
> > > @@ -333,11 +433,22 @@ int fdt_appendprop(void *fdt, int nodeoffset, c=
onst char *name,
> > >  {
> > >  	struct fdt_property *prop;
> > >  	int err, oldlen, newlen;
> > > +	int prop_offset;
> > > =20
> > >  	FDT_RW_PROBE(fdt);
> > > =20
> > >  	prop =3D fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
> > >  	if (prop) {
> > > +		/*
> > > +		 * The property is going to be modified. Remove possible unknown
> > > +		 * tags related to this property downgrading the dtb version.
> > > +		 */
> > > +		prop_offset =3D fdt_ptr_offset_(fdt, prop);
> > > +		err =3D fdt_prop_remove_unknown_tags(fdt, false, prop_offset,
> > > +						   true);
> > > +		if (err)
> > > +			return err; =20
> >=20
> > Just NOPing the unknown tags isn't ideal here.  This function can
> > already insert/remove stuff from the structure block, so removing the
> > tags entirely would be preferable.
>=20
> I can add the complexity needed to fully remove those tags.
> IHMO it could be added later as an optimisation.
>=20
> >=20
> > >  		newlen =3D len + oldlen;
> > >  		err =3D fdt_splice_struct_(fdt, prop->data,
> > >  					 FDT_TAGALIGN(oldlen), =20
> >=20
> > > @@ -360,6 +471,8 @@ int fdt_delprop(void *fdt, int nodeoffset, const =
char *name)
> > >  {
> > >  	struct fdt_property *prop;
> > >  	int len, proplen;
> > > +	int prop_offset;
> > > +	int err;
> > > =20
> > >  	FDT_RW_PROBE(fdt);
> > > =20
> > > @@ -367,6 +480,15 @@ int fdt_delprop(void *fdt, int nodeoffset, const=
 char *name)
> > >  	if (!prop)
> > >  		return len;
> > > =20
> > > +	/*
> > > +	 * The property is going to be removed. Remove also possible unknown
> > > +	 * tags related to this property. Keep the dtb version unchanged.
> > > +	 */
> > > +	prop_offset =3D fdt_ptr_offset_(fdt, prop);
> > > +	err =3D fdt_prop_remove_unknown_tags(fdt, false, prop_offset, false=
);
> > > +	if (err)
> > > +		return err; =20
> >=20
> > Here, only NOPing the tags is worse, since delprop is expected to
> > entirely remove the property without leaving NOPs.
> >=20
> > Also.. just NOPing unknown tags isn't correct either.  The property is
> > being removed, so *all* the associated skippable tags should be
> > removed as well (ideally with a single fdt_splice_struct_()).
>=20
> Skippable tags are remove. They don't exist anymore in the resulting DT.

No, *unknown* (by this libfdt version) tags are nopped.  Known
skippable tags are left unaltered.  Presumably they would then apply
to the previous property, which is definitely wrong.

> You have FDT_NOP tags. No issue with that.
>=20
> It is not optimized but it is correct.
>=20
> Here again, I can fully remove them.

That would be good, but it's not the issue I'm pointing out above.

> > > +
> > >  	proplen =3D sizeof(*prop) + FDT_TAGALIGN(len);
> > >  	return fdt_splice_struct_(fdt, prop, proplen, 0);
> > >  }
> > > @@ -395,7 +517,12 @@ int fdt_add_subnode_namelen(void *fdt, int paren=
toffset,
> > >  	else if (offset !=3D -FDT_ERR_NOTFOUND)
> > >  		return offset;
> > > =20
> > > -	/* Try to place the new node after the parent's properties */
> > > +	/*
> > > +	 * Try to place the new node after the parent's properties and unkn=
own
> > > +	 * tags related to those properties.
> > > +	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag.
> > > +	 * Skipping FDT_NOP tags will correctly skip unknown tags. =20
> >=20
> > True, but I think it would be clearer and more robust to explicitly
> > look for an FDT_BEGIN_NODE or FDT_END_NODE tag instead.
>=20
> Ok, will have look in that direction.
>=20
> >=20
> > > +	 */
> > >  	tag =3D fdt_next_tag(fdt, parentoffset, &nextoffset);
> > >  	/* the fdt_subnode_offset_namelen() should ensure this never hits */
> > >  	if (!can_assume(LIBFDT_FLAWLESS) && (tag !=3D FDT_BEGIN_NODE))
> > > diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> > > index c2d7566a..7ca3ffbc 100644
> > > --- a/libfdt/fdt_wip.c
> > > +++ b/libfdt/fdt_wip.c
> > > @@ -15,17 +15,30 @@ int fdt_setprop_inplace_namelen_partial(void *fdt=
, int nodeoffset,
> > >  					uint32_t idx, const void *val,
> > >  					int len)
> > >  {
> > > +	int prop_offset;
> > >  	void *propval;
> > >  	int proplen;
> > > +	int err;
> > > =20
> > > -	propval =3D fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
> > > -					&proplen);
> > > +	prop_offset =3D fdt_getprop_offset_namelen(fdt, nodeoffset, name, n=
amelen);
> > > +	if (prop_offset < 0)
> > > +		return prop_offset;
> > > +
> > > +	propval =3D fdt_getprop_by_offset_w(fdt, prop_offset, NULL, &prople=
n);
> > >  	if (!propval)
> > >  		return proplen;
> > > =20
> > >  	if ((unsigned)proplen < (len + idx))
> > >  		return -FDT_ERR_NOSPACE;
> > > =20
> > > +	/*
> > > +	 * Remove unknown tags related to the property downgrading the dtb
> > > +	 * version.
> > > +	 */
> > > +	err =3D fdt_prop_remove_unknown_tags(fdt, true, prop_offset, true);=
 =20
> >=20
> > Functions in fdt_wip.c should not depend on functions in fdw_rw.c.
> > Part of the reason for organising things this way is so that a client
> > only uses write-in-place functions, the linker will omit the more
> > complex full read-write code (even if an old or limited linker that
> > doesn't do e.g. function sections).  fdt_rw.c by contrast _is_
> > permitted to rely on fdt_wip.c
>=20
> Makes sense.
>=20
> I will take this relationship into account in the next iteration.
>=20
> >=20
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	memcpy((char *)propval + idx, val, len);
> > >  	return 0;
> > >  }
> > > @@ -59,12 +72,23 @@ static void fdt_nop_region_(void *start, int len)
> > >  int fdt_nop_property(void *fdt, int nodeoffset, const char *name)
> > >  {
> > >  	struct fdt_property *prop;
> > > +	int prop_offset;
> > >  	int len;
> > > +	int err;
> > > =20
> > >  	prop =3D fdt_get_property_w(fdt, nodeoffset, name, &len);
> > >  	if (!prop)
> > >  		return len;
> > > =20
> > > +	/*
> > > +	 * The property is going to be removed (nopified). Remove unknown t=
ags
> > > +	 * related to this property. Keep the dtb version unchanged.
> > > +	 */
> > > +	prop_offset =3D fdt_ptr_offset_(fdt, prop);
> > > +	err =3D fdt_prop_remove_unknown_tags(fdt, true, prop_offset, false);
> > > +	if (err)
> > > +		return err; =20
> >=20
> > Similar to fdt_delprop() this needs to NOP *all* the properties
> > associated with the property we're killing, not just the unknown ones
> > (again, ideally with a single fdt_nop_region_()).
>=20
> I don't follow you.
>=20
> Only unknown tags need to be removed for the moment.
> What other tags do you want to remove?

Again, all skippable tags on the property need to be nopped, not just
unknown ones.  Otherwise they'll stay there and now apply to the
previous property.

> > >  	fdt_nop_region_(prop, len + sizeof(*prop));
> > > =20
> > >  	return 0;
> > > diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> > > index e3923629..ce128fda 100644
> > > --- a/libfdt/libfdt_internal.h
> > > +++ b/libfdt/libfdt_internal.h
> > > @@ -26,6 +26,9 @@ uint32_t fdt_next_tag_(const void *fdt, int startof=
fset, int *nextoffset,
> > >  int fdt_check_node_offset_(const void *fdt, int offset);
> > >  int fdt_check_prop_offset_(const void *fdt, int offset);
> > > =20
> > > +int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
> > > +				 int prop_offset, bool downgrade_version);
> > > +
> > >  int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
> > >  			       const char *name, int namelen);
> > >  static inline int fdt_getprop_offset(const void *fdt, int nodeoffset,
> > > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > > index 419a24d8..980ed6a0 100755
> > > --- a/tests/run_tests.sh
> > > +++ b/tests/run_tests.sh
> > > @@ -586,6 +586,34 @@ libfdt_tests () {
> > >  		unknown_tags_no_skip.dtb; do
> > >  	run_test check_full -n $bad
> > >      done
> > > +
> > > +    # Check inplace modification with "unknown" tags that can be ski=
pped
> > > +    dtb=3Dunknown_tags_can_skip.wip.test.dtb
> > > +    cp unknown_tags_can_skip.dtb $dtb
> > > +    base_run_test wrap_fdtdump $dtb $dtb.0.out
> > > +    # Remove unneeded header fields (keep those related to versions)
> > > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
> > > +    base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect" =20
> >=20
> > As noted earlier in the series, tests of binary-level behaviour
> > shouldn't depend on specific source formatting.  The use of wip_func
> > to essentially do some of the test steps in shell seems clumsy to me -
> > I think this would be nicer as explicit tests written in C which
> > directly look at the binary dtb contents.
>=20
> I don't like that.
>=20
> We need to check all the output dtb to be sure that everything is correct=
 and
> avoid missing something.

Yes.. a C program can do that...

> Here with unknown tag handling and with future metadata tags, we have to =
observe
> those tags in the binary blob.

Certainly.

> If fdtdump is an issue, I will write fdtanalyze which dump a dtb blob in =
an other
> human readable format. We need to see all tags, and they raw data values =
an hex.

fdtdump is an issue - it's a sometimes-useful hack, not a tool to be
relied on.  What would probably make more sense here is a
'dtbs_equal_with_tags' or something, that performs a stricter
comparison that the existing dtbs_equal_ordered.

> When I wrote the code, I did some mistake and using only binary files is =
really
> not easy to debug stuff. When a given test is broken by some modification=
, we need
> to have an easy way to see the root cause.
>=20
> >=20
> > > +    run_test wip_func $dtb set_prop / prop-str 0 "vwxy"
> > > +    base_run_test wrap_fdtdump $dtb $dtb.1.out
> > > +    # Remove unneeded header fields (keep those related to versions)
> > > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
> > > +    base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"
> > > +
> > > +    cp unknown_tags_can_skip.dtb $dtb
> > > +    run_test wip_func $dtb nop_prop /subnode2 prop-int1
> > > +    base_run_test wrap_fdtdump $dtb $dtb.2.out
> > > +    # Remove unneeded header fields (keep those related to versions)
> > > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.2.out
> > > +    base_run_test check_diff $dtb.2.out "$SRCDIR/$dtb.2.expect"
> > > +
> > > +    cp unknown_tags_can_skip.dtb $dtb
> > > +    run_test wip_func $dtb nop_node /subnode2/subsubnode
> > > +    base_run_test wrap_fdtdump $dtb $dtb.3.out
> > > +    # Remove unneeded header fields (keep those related to versions)
> > > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.3.out
> > > +    base_run_test check_diff $dtb.3.out "$SRCDIR/$dtb.3.expect"
> > >  }
> > > =20
> > >  dtc_tests () {
> > > @@ -1045,6 +1073,56 @@ fdtput_tests () {
> > >      run_wrap_error_test $DTPUT $dtb -d /chosen   non-existent-prop
> > > =20
> > >      # TODO: Add tests for verbose mode?
> > > +
> > > +    # Modify a dtb containing some "unknown" tags that can be skipped
> > > +    dtb=3Dunknown_tags_can_skip.fdtput.test.dtb
> > > +    cp unknown_tags_can_skip.dtb $dtb
> > > +    base_run_test wrap_fdtdump $dtb $dtb.0.out
> > > +    # Remove unneeded header fields (keep those related to versions)
> > > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
> > > +    base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"
> > > +    run_fdtput_test "vwxyz" $dtb / prop-str -ts "vwxyz"
> > > +    base_run_test wrap_fdtdump $dtb $dtb.1.out
> > > +    # Remove unneeded header fields (keep those related to versions)
> > > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
> > > +    base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect" =20
> >=20
> > Doing these as fdtput tests again seems kind of clumsy, unless the
> > point is explicitly to check the fdtput utility's behaviour.  The core
> > library functionality should be tested directly without introducing
> > extra layers.
>=20
> Need to check the whole resulting binary skippable tags removed, version
> downgrade. We need to check that the whole binary is still correct.

Yes, but how does that relate to the use of fdtput?

> 'hexdump $dtb' could be used but having an array of hex value without any
> other formatting related to dtb defined format will be ugly.

Sure.  Again, seems like what you want is a dtbs_equal_with_tags.

> Here also fdtanalyzer could output hex values with some formating based on
> dtb format definition. For instance:
>   (0x1-FDT_BEGIN_NODE): "my_node"
>     (0x3-FDT_PROP): ...
>     (0x3-FDT_PROP): ...
>   (0x2-FDT_END_NODE)
>   ...
>   (0x9-FDT_END)
>=20
> Maybe offset (absolute and/or based on the beginning of the structure blo=
ck)
> could also be interesting in this kind of dumps.
>=20
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--iLDXjwvw94YOjn12
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmq573AACgkQzQJF27ox
2GfWmw/+Kw+mSewDhsyw49Bju0oGInS8z44Mo74dlOY37UwtxAfEItewvGRKOVv3
zErUIi1zE7djW1GbQjXCQOKNCiA/XFH1FMuCPGywZSEDUvp9czZ+FWDc/60l/TwJ
VF+EdRAdenfbR+HRujoVH0hYXz3GCYXChKl4hi2WYvTmlwb4CMl9gSwkarxIK8S/
OGrw3XlbrjZ4NSmboBP9Sn92RnAKfl9g6JaNu72ONnTQo32yFt6asEALu9RV60I+
52e9ALMuNS6f0d7Pp0cRmb3mHGJh2q39nfExvCLwSwcrdnyvmZxLl+6DO6nERH1I
Lo5csGIz/m5rkjwrMR/tmlimVB6zeb0vim1oZA3Su0F0sdRQoYhmaOwm6nU2UUdB
TqGFnbyd4qsYhif9R86Qqxp8bOBqL0/zJ3hJwMhr9W6Ofl0r5Zp60eIF4W2ZnLwV
DtOpxzqgsLb7ngnnCRg7ql4FBSzS/GciJ4HSq1BV5ld/7UQI7t3nbeJiEEfILuTI
2392RMfbSdh+Rn3mNfbzDk8NjkJlVxagH31y7YvUO7spZt69o1Heput166DAeUpx
uY1ncBoNKMEw5Ok74cPbIyE3jnoOEVDv6ojSsFlY0okl+RvYPp0SNEcHQh1g6MLG
o4yoM0Qr19t3+60rrKSZu89Z1oMXola251qHH03JV7kGChGF5S0=
=W59b
-----END PGP SIGNATURE-----

--iLDXjwvw94YOjn12--
