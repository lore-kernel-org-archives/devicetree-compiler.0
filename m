Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803693;
	b=QH9Pobdnv258Wdbimbxq1iYwp7L8VcBLsedW7gADZDZR7XR9ZTAhYEpZigcDDmnUNmzd
	 551zGRLnRwvRRbgj84+Vi3Xt4aTkSZ+Kwbp4Tr0/O+5qtQio10oM4D8JqlJBDtY+6fgZJ
	 lH9pKIaeM9IYVL15im0IOvgW+cE0T0DdtCzhx3E/o7LX/J8/ylxxNzQPsSpKqTFkDHfbM
	 aBZWdERtKzxJPZPIGTQRy8iRliZFmcGbcqUVktnNkcZUVBmOQA06nw4GWkqAQlIGGU1t6
	 a0c2RziYwqnStdalOkpUUxkCJeK7wrFDFdkJ+ExUUvlcX08UIOHu/J5DBrBP4jsZRNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803693;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=GIufkInBVFcD1RQsDfEV/JuprcDFYy01sjewgFhcfIs=;
	b=5c/ppxz4jWeuYEvRTdINCfE7CvqMCdemnAEDh+84qUcFoTarPjVnCL67sQJZaY81oLor
	 5URmWmbaE0M5ITb5I1Rfj61NEYew1r6rPup73mWYEF3+jtqlQrQV3UTqzCEii9nSAQ7fM
	 7+FaRrdPIyiOm1AmUGl2PhL6xdP7W5afC/x4QIi96rbLWRlsubQpLJeljTVk6h3zkYw/j
	 ZivFogj6HdD+CkrKnGqtdznQswTe89blzAKk8Y/p2BVdsCbLK5/dIqPUZTgMIKGBu2TdK
	 FK5s34ovQ9wa9vTFfg3nb/4pPgSGDiePsbuTQxIcZj7VDo4lfPx7hZKzS7QbFHQKuwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=rRlE+gMY;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F49606A330;
	Mon, 16 Nov 2026 04:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F49606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=rRlE+gMY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794803680;
	bh=GIufkInBVFcD1RQsDfEV/JuprcDFYy01sjewgFhcfIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRlE+gMYMUA0KJuH2rVPQRYFDonpcw10RsxxjcUDCxpKr3jUhSAscXqcZ48IZxlyM
	 pJva1pLQCdC5cXL7jzQ84DSTRemE3cS1Up3kOajj0d2zbksRpvhg/wJ+2VV8BbZkTo
	 KfG7fSHyCz9LxYqqQwgqKvoNcLAJD4Q5GFno6f59yNX8lYanA27i9unL79HWu4E6dl
	 fWAUtudhKHWdmsipsdgePMPxBFzKqL+l/yiqc1RoeAvO3Qj89R5JvFjpXIQqiDg0u5
	 7Ev/r96DgK+/CijQYcB6bmezeXK9Ztgiqa+QsBD5qxl4AgNYUBMRhah4m7OZ/4yQRR
	 nHd7xpG88yIvg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jSZlN1WRbz4wLn; Mon, 16 Nov 2026 15:34:40 +1100 (AEDT)
Date: Mon, 16 Nov 2026 14:35:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH v3 12/15] fdtfactor: Add tool to split DTBs into a base
 DTB and overlays
Message-ID: <avp6GjL1jqEfEFkR@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-13-dianders@chromium.org>
 <avPsIBLWNrNexcbt@gractus.seuss>
 <CAD=FV=Uy0dxbzoMN6hA7FY3R6hyqcL2j8d2-YeivS=_+dA7NfQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="GfvHdseZSzCPbPfY"
Content-Disposition: inline
In-Reply-To: <CAD=FV=Uy0dxbzoMN6hA7FY3R6hyqcL2j8d2-YeivS=_+dA7NfQ@mail.gmail.com>

--GfvHdseZSzCPbPfY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 09:22:38PM -0800, Doug Anderson wrote:
> Hi David,
>=20
> On Tue, Nov 10, 2026 at 8:16 PM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Sun, Nov 01, 2026 at 02:01:19PM -0800, Douglas Anderson wrote:
> > > diff --git a/README.md b/README.md
> > > index fcfc2e55d804..61fefc4424fe 100644
> > > --- a/README.md
> > > +++ b/README.md
> > > @@ -112,6 +112,49 @@ $ meson setup -Dpython=3Ddisabled build
> > >  More work remains to support all of libfdt, including access to nume=
ric
> > >  values.
> > >
> > > +## fdtfactor
> >
> > Pre-existing, but it would be nice to have blurbs for dtdiff,
> > fdt{get,put} and the other anciliary tools we already include.
>=20
> Agreed -- in my draft v4 I've added a preparatory patch adding brief
> `README.md` sections for `dtc` and the ancillary tools (`dtdiff`,
> `fdtget`, `fdtput`, `fdtdump`, `convert-dtsv0`, and `fdtoverlay`).

Terrific, thanks.

> > > +        self.filename =3D filename
> > > +        with open(filename, 'rb') as f:
> > > +            raw_bytes =3D f.read()
> > > +        self.raw_bytes =3D raw_bytes
> >
> > AFAICT, self.raw_bytes is never used again (unlike the raw_bytes
> > local).
>=20
> `_print_dtb_stats()` actually used `len(d.raw_bytes)` further down to

Ok, in a later patch.  Better to add the field at that point in the
series, then.

> compute `orig_uncomp` when `--stats` is passed, though nothing ever
> reads the buffer contents again after `__init__()`. In my draft v4 I've
> replaced `self.raw_bytes` with `self.uncompressed_size =3D len(raw_bytes)`
> (pairing with `self.compressed_size` in the compression patch) so we
> don't keep all the uncompressed DTB buffers in memory just for their
> lengths.

Or that.

> > > +            if 'phandle' in node.props:
> > > +                node.phandle =3D node.get_u32('phandle')
> > > +                del node.props['phandle']
> > > +
> > > +            if node.phandle is not None:
> >
> > Changing this to:
> > if node.phandle is None:
> > continue
> > reduces nesting and IMO, would make this a little more readable.
>=20
> Done in my draft v4 (and did the same for a couple of other `for` loops
> in `fdtfactor`).

Ok.

> > > +                offsets =3D sorted(set(lf_node.get_u32_list(prop_nam=
e)))
> >
> > I don't think there's any reason to convert the list to a set before so=
rting.
>=20
> Done in my draft v4 (`offsets =3D sorted(lf_prop.as_uint32_list())`).
> Neither `dtc` nor `libfdt` emits duplicate offsets in
> `/__local_fixups__`, and dropping `set()` also means any duplicate
> offset in a malformed blob will be caught by the overlapping-offset
> check right below.

Sounds good.

> > > +    base_root =3D FactoredTree()
> > > +    next_ph =3D 1
> > > +    for path, _ in dtbs[0].root.walk():
> > > +        if path not in common_paths:
> > > +            continue
> >
> > I think this makes the loop equivalent to:
> > for path in common_paths:
> >    ....
> >
> > > +        if path and base_root.get_node(path.rpartition('/')[0]) is N=
one:
> > > +            continue
>=20
> We can't iterate `common_paths` directly here because `common_paths` is
> an unordered `set`:

> 1. The `base_root.get_node(path.rpartition('/')[0]) is None` check right
>    below relies on parents always being visited before their children so
>    that if an ancestor was excluded, its descendants are skipped too.
>    Iterating a `set` can visit `/a/b` before `/a`, causing `/a/b` to be
>    wrongly skipped.
> 2. Walking `dtbs[0].root.walk()` preserves `dtbs[0]`'s subnode ordering
>    in `base_root` and keeps sequential `next_ph` assignment
>    deterministic across `PYTHONHASHSEED` values.

Ah, right.

> I've added a comment above the loop in my draft v4 explaining why it
> iterates `dtbs[0]`'s nodes in pre-order instead of iterating
> `common_paths`.

Thanks.

> > > +        has_phandle =3D any(
> > > +            d.root.get_node(path).phandle is not None for d in dtbs
> > > +        )
> >
> > I expect this will work in practice, but arguably the condition you
> > really need here is whether the node is referred to by any fixup in
> > any non-common property.
> >
> > > +        if has_phandle and path and path not in common_sym_targets:
> > > +            continue
> > > +        base_node =3D base_root.create_path(path)
> > > +        if has_phandle:
> > > +            base_node.phandle =3D next_ph
> > > +            next_ph +=3D 1
>=20
> For the `common_sym_targets` exclusion (`if has_phandle and path and
> path not in common_sym_targets: continue`), that's true in principle
> with respect to `/__fixups__`: an overlay only needs a symbol in
> `base.dtb`'s `/__symbols__` if a non-common property ends up referencing
> `path`. There are a couple of catches if we tried to relax this, though:
>=20
> 1. Which properties are common vs. non-common isn't known yet here --
>    `_build_base_tree()` decides that next, and its candidate eligibility
>    depends on which fixup target nodes are in `base_root` (so resolving
>    both together would need an iterative pass).
> 2. Even when no non-common property references `path`, `base_node` still
>    needs a `phandle` in `base.dtb` if `path` is referenced by a *common*
>    property in `base.dtb`, or if `path` has a symbol in `/__symbols__`
>    (from `dtc -@`) so the reconstructed DTB retains its `phandle`
>    property and remains valid as a base for any further runtime overlays
>    targeting that symbol. Conversely, if one board had a `phandle` on
>    `path` (e.g. a board-specific label) and another board didn't,
>    putting `path` in `base.dtb` with a `phandle` would add a `phandle`
>    property to the second board's reconstructed DTB that wasn't in its
>    original DTB.
>=20
> Since in `dtc -@` inputs almost every node with a `phandle` also has a
> label in `/__symbols__`, checking `has_phandle` up front keeps this
> single-pass and exact. I've expanded the docstring on
> `_find_common_nodes_and_phandles()` in my draft v4 to note this.

Ok, understood.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--GfvHdseZSzCPbPfY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr6ehoACgkQzQJF27ox
2GeI6w/9HIoovJR4EU3JaL6nXcX7asyQ3QI2wUaZ8CFIVOCV3qw55bpnWzZ21DeD
D/f6+1HX1Tlz8TxDxoC4I5wRhzvYEBOSgGEcSK70hPLLQYxgPLDsNn9YW2zCWTnF
C4HL4EQklWIc55eSC5f4fqWR6eaN4TBLoi9XxpGq2KrLEug9h821ADgnu5P+CEkU
YRuLP0/ndp4lYqNYAYaxl6KXtYXgF0kEYHQZtmS3g5MnraufSHfqS+VCvBKekAsV
/91/dlBl5J7AGkXJ2Jkf/khvhRoH9TTZGIZda79S2hJdXm7eMZeIw8m9/HUNtx4+
furU7qlO6h4N8ivhSUQgU9N9EyqGjD8Pk38VCBS3lWdJkKyB6ynNG1wnpaw9G0tu
ZGvBUKVJfEjWUf+Hybq02uz5qtW1vggv5sOwUiNsGmI2YOqi7SqqifeQnHx3CXOW
peVoVRvvE4Ls3ma80G1Cd1znXZgBBKDReuwwNZwmQQu5ELt++Fqec2XqcfGHNoM/
Tm2Ow99r0mc028Oo1O2PO5nI6chK6mQOVou/AOVE2nQROw2NZe9g2mcYLxVK0Ela
BmDOyb3WGS8giydeo7pmaukwgCkDIZmicYFg+l2A4Uf+FdXLS6v7no6zkk8cUy8p
plybUNiWn80lwwwG7Sl/kHKoxOVIlJiN7VZYj56vQY4RdQcCLq0=
=s9Ao
-----END PGP SIGNATURE-----

--GfvHdseZSzCPbPfY--
