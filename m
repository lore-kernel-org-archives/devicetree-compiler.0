From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in
 base fdt
Date: Wed, 10 Jan 2018 20:19:42 +1100
Message-ID: <20180110091942.GA24770@umbus.fritz.box>
References: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
 <9711cac8-2501-7d68-2fb3-1c3a952fa96a@gmail.com>
 <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ@mail.gmail.com>
 <CACNAnaG=kcaUFFH7Dh70o1x-=1WxgJJGE1s0zsTdLvdYCcviMg@mail.gmail.com>
 <CACNAnaHa=OuCrzVegg=7AemS8x=ADFsDs88WQ0phM+TLuYcZJw@mail.gmail.com>
 <fe1b36f1-9e38-0d32-6879-b9cd495afd12@gmail.com>
 <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515577476;
        bh=J0wp2pBVCk+S3R2Kobw6GCk5rHqUQf6WoDJINy3CWeI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EkWAWmHnRsq2s5NrV7wBKJRqgyyptdphcFLcIfpvrAWMXElmQaLWO6oyM/km7UaGY
         iz5sER3xf3API9NPDcufigJ0gaBOlbWD25JueBmSfZekoXIvKOxB+eN1B7i8cJZOWn
         GXJI2F/aaAV2Wj1Lk9hkOXt6dOhmPgmce/i1RJLk=
Content-Disposition: inline
In-Reply-To: <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2018 at 08:39:38PM -0600, Kyle Evans wrote:
> On Thu, Jan 4, 2018 at 7:55 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> > On 01/04/18 13:47, Kyle Evans wrote:
> >> On Thu, Jan 4, 2018 at 3:34 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> >>> On Thu, Jan 4, 2018 at 2:41 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> >>>> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
> >>>>> [... snip ...]
> >>>>>
> >>>>> Does this remove the need for the proposed patch, or am I still
> >>>>> missing something?
> >>>>
> >>>> ... nope. Apparently I never tested this with this particular dtc(1)
> >>>> and instead just assumed it did the same as ours- allocate phandle
> >>>> sparsely, even with -@. That certainly removes the need for this
> >>>> patch, and I'm somewhat upset that I hadn't previously considered
> >>>> this.
> >>>>
> >>>> @David, Jon: Please disregard all of the patches along these lines...
> >>>> I'll fix this in our dtc, where it should be fixed.
> >>>>
> >>>> Thanks, Frank!
> >>>
> >>> Actually, I'm kind of torn on whether this is useful or not. With
> >>> being able to have EFI-provided FDT, it's hard to guarantee whether
> >>> the FDT we're provided has been compiled with GPL dtc(1) and -@. The
> >>> above solves this problem for most of my personal use-cases , though,
> >>> since I can guarantee that our FDT and U-Boot provided FDT is compiled
> >>> properly.
> >>
> >> Apologies for the triple post; I realized that this argument is
> >> inherently wrong, since we can't reference the node if there's no
> >> symbol anyways.
> >>
> >> The only way this might still be a good idea is to support more
> >> minimal cases where an implementation might prefer to not create a
> >> phandle for nodes that haven't been referenced.
> >>
> >> In our case, we have a function [1] that walks the tree and generates
> >> metadata on nodes that have phandles, under the assumption that these
> >> have been referenced somewhere and provides a way to more quickly
> >> reference these specifically through a separate linked link.
> >> Allocating phandles for everything as GPL dtc does adds quite a bit
> >> more overhead to this.
> >>
> >> [1] http://src.illumos.org/source/xref/freebsd-head/sys/dev/ofw/openfi=
rm.c#119
> >
> > The "-@" option does not add a phandle to _every_ node, just to nodes
> > that have a label:
> >
>=20
> In practice, this is still a not necessarily close superset of those
> that are actually going to actually get referenced in a given .dts. I
> note that a number of nodes will still get labelled that are unlikely
> to be referenced for any number of reasons.
>=20
> For instance, as an example [1][2][3] of one of the boards I'm working
> on currently, all of the ehci/ohci/mmc nodes, some set of the pio
> nodes... almost every single node has a label, and most of them don't
> need a phandle based on what is currently referenced and actually
> used. I note that 27 of these nodes seem to be referenced, out of 39
> nodes with labels (numbers are approximate), leaving ~30% (12) of
> labelled nodes unreferenced.
>=20
> For a slightly larger example, [4][5][6][7]; 74 referenced nodes out
> of 113 labelled nodes, leaving ~35% (39) of labelled nodes
> unreferenced.

Right, but what I'm not getting is why having a lot of symbols is a
bad thing, other than because of a FreeBSD internal detail.

>=20
> This is only bothersome because it starts adding up as these things
> get bigger, and I don't think it really needs to. The alternative to
> keep phandles down to the minimum set required doesn't add much in
> maintenance cost or overhead from the overlay application side;
> especially for blobs generated by this dtc(1) that make the active
> decision to allocate liberally rather than conservatively.
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm/boot/dts/sun8i-a83t.dtsi
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm/boot/dts/sunxi-common-regulators.dtsi
>=20
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm/boot/dts/am335x-bonegreen.dts
> [5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm/boot/dts/am33xx.dtsi
> [6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm/boot/dts/am335x-bone-common.dtsi
> [7] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm/boot/dts/am335x-bonegreen-common.dtsi

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpV2qsACgkQbDjKyiDZ
s5KM0g//R43waHUkdg6pwzHuILEl8gxXfU6Ajrac/zOyUhvXTdxCnvhLfieEAuna
54uNgi/+YFxwRlXwXwci7G51tTs2xS6tO/ie+PuNY/ll/nC1yeOqx1HrE9Pjs2iA
e8QcHs/BB2/8fuz7uahavmVtIzSb7nkVOSgB3P61Y5yfgBYz52t5OGrpSdErwc0S
xY2psdactqd2WAJNgCEeJzcnH0EdH+kHY7t+bIBHi+sSSyl1dMmhb3ntdm6IuV0X
gsvevxPqb4eY6djfN+fWLCsI+amhCM8pE0io9zBepZuDMaIbewIRzc8QxUlz7nr9
CILaNdVHZrWlfj7zMHmzDsgyhGuYt6UHPVcvX4dTeKULWJOZZMfAGsqy+e+SQ631
XP9IX2HrxaZwecKSFJ7flvAjmR4OOf3YVqk9c5kce8e0qjXZxN3oAdfyDUl2gI8F
0WmfNzgqOH7kwQ7utf9EIOZUXR9NKXpiPnx5Br4Ef2Iooab5u2xyl6qMHPBwYKUe
/AWGnZJg8DV7t6IBK9zmf3ru7KYTKnZz2XZ40R6sr8M/UPTgYdz0ypnM2FfxcFks
8CxMbRpSX+wzUvz7y+vQgMqs6Be90P9T6lW5xA2L0BIihnYruIH3Tl3uduK1E6WS
q6NGeo8HAgA+iHthHvy4dsIQDLSfU3tNdKbVgRRsH3wnVEh7Wio=
=wRjM
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
