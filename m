From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in
 base fdt
Date: Wed, 10 Jan 2018 20:38:36 +1100
Message-ID: <20180110093836.GB24770@umbus.fritz.box>
References: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
 <9711cac8-2501-7d68-2fb3-1c3a952fa96a@gmail.com>
 <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ@mail.gmail.com>
 <CACNAnaG=kcaUFFH7Dh70o1x-=1WxgJJGE1s0zsTdLvdYCcviMg@mail.gmail.com>
 <CACNAnaHa=OuCrzVegg=7AemS8x=ADFsDs88WQ0phM+TLuYcZJw@mail.gmail.com>
 <fe1b36f1-9e38-0d32-6879-b9cd495afd12@gmail.com>
 <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw@mail.gmail.com>
 <41a2006b-9b54-d803-7a28-457091db6f42@gmail.com>
 <CACNAnaGoZ+Ne6-d75q7bRokQ-Kr4iDr5kJAEXUybYvw2g2cbPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515577476;
        bh=Zo8EwD4J/EEfqEknkF8wVjl5IxqWxj+jFxBHB0+YMdU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hiU0gQFe9FDC3VkZD5lotAFphJa/osNrTtrHgWUI6RfzZTmwkh5UJCgHht4NzJN2R
         JqQ5nIuLQ8VDhWOBuAAGu7JHnZnmJOVHugyA2Pl1Ph4yz1Y+Zmju7+lIV5qhuqwVAd
         rroo8YRO3XbU/TRB+RIX5DndEpVihNNRm6DzbZ/g=
Content-Disposition: inline
In-Reply-To: <CACNAnaGoZ+Ne6-d75q7bRokQ-Kr4iDr5kJAEXUybYvw2g2cbPg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2018 at 09:50:54PM -0600, Kyle Evans wrote:
> On Thu, Jan 4, 2018 at 9:14 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> > On 01/04/18 18:39, Kyle Evans wrote:
> >> On Thu, Jan 4, 2018 at 7:55 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
> >>> On 01/04/18 13:47, Kyle Evans wrote:
> >>>> On Thu, Jan 4, 2018 at 3:34 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrot=
e:
> >>>>> On Thu, Jan 4, 2018 at 2:41 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wro=
te:
> >>>>>> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand <frowand.list@gmail.c=
om> wrote:
> >>>>>>> [... snip ...]
> >>>>>>>
> >>>>>>> Does this remove the need for the proposed patch, or am I still
> >>>>>>> missing something?
> >>>>>>
> >>>>>> ... nope. Apparently I never tested this with this particular dtc(=
1)
> >>>>>> and instead just assumed it did the same as ours- allocate phandle
> >>>>>> sparsely, even with -@. That certainly removes the need for this
> >>>>>> patch, and I'm somewhat upset that I hadn't previously considered
> >>>>>> this.
> >>>>>>
> >>>>>> @David, Jon: Please disregard all of the patches along these lines=
=2E..
> >>>>>> I'll fix this in our dtc, where it should be fixed.
> >>>>>>
> >>>>>> Thanks, Frank!
> >>>>>
> >>>>> Actually, I'm kind of torn on whether this is useful or not. With
> >>>>> being able to have EFI-provided FDT, it's hard to guarantee whether
> >>>>> the FDT we're provided has been compiled with GPL dtc(1) and -@. The
> >>>>> above solves this problem for most of my personal use-cases , thoug=
h,
> >>>>> since I can guarantee that our FDT and U-Boot provided FDT is compi=
led
> >>>>> properly.
> >>>>
> >>>> Apologies for the triple post; I realized that this argument is
> >>>> inherently wrong, since we can't reference the node if there's no
> >>>> symbol anyways.
> >>>>
> >>>> The only way this might still be a good idea is to support more
> >>>> minimal cases where an implementation might prefer to not create a
> >>>> phandle for nodes that haven't been referenced.
> >>>>
> >>>> In our case, we have a function [1] that walks the tree and generates
> >>>> metadata on nodes that have phandles, under the assumption that these
> >>>> have been referenced somewhere and provides a way to more quickly
> >>>> reference these specifically through a separate linked link.
> >>>> Allocating phandles for everything as GPL dtc does adds quite a bit
> >>>> more overhead to this.
> >>>>
> >>>> [1] http://src.illumos.org/source/xref/freebsd-head/sys/dev/ofw/open=
firm.c#119
> >>>
> >>> The "-@" option does not add a phandle to _every_ node, just to nodes
> >>> that have a label:
> >>>
> >>
> >> In practice, this is still a not necessarily close superset of those
> >> that are actually going to actually get referenced in a given .dts. I
> >> note that a number of nodes will still get labelled that are unlikely
> >> to be referenced for any number of reasons.
> >>
> >> For instance, as an example [1][2][3] of one of the boards I'm working
> >> on currently, all of the ehci/ohci/mmc nodes, some set of the pio
> >> nodes... almost every single node has a label, and most of them don't
> >> need a phandle based on what is currently referenced and actually
> >> used. I note that 27 of these nodes seem to be referenced, out of 39
> >> nodes with labels (numbers are approximate), leaving ~30% (12) of
> >> labelled nodes unreferenced.
> >>
> >> For a slightly larger example, [4][5][6][7]; 74 referenced nodes out
> >> of 113 labelled nodes, leaving ~35% (39) of labelled nodes
> >> unreferenced.
> >>
> >> This is only bothersome because it starts adding up as these things
> >> get bigger, and I don't think it really needs to. The alternative to
> >> keep phandles down to the minimum set required doesn't add much in
> >> maintenance cost or overhead from the overlay application side;
> >> especially for blobs generated by this dtc(1) that make the active
> >> decision to allocate liberally rather than conservatively.
> >
> > This concept relies on a hand coded __symbols__ node instead of
> > having dtc generate it.  This makes the overlay devicetree source
> > more fragile.  The example dts file in patch 2/2 is fairly safe,
> > but it is legal syntax to specify:
> >
> >   test =3D "/test-node";
> >
> > instead of:
> >
> >   test =3D &test;
> >
> > And the fragile syntax is exactly what results from a decompiled
> > overlay dtb.
>=20
> I think I might be misunderstanding something here- our dtc (BSDL
> dtc), with -@, still writes a full /__symbols__ node of all labeled
> nodes, given that this is what -@ is expected to do. The difference is
> that our dtc allocates phandles conservatively because they're a
> concept for cross-referencing nodes.

Well, kind of.  But traditionally *every* node had a phandle (usually
it's the actual pointer to the node structure in a live OF).  Omitting
them is essentially an fdt size optimization.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpV3xkACgkQbDjKyiDZ
s5IcMA/7BJBc3y9iM8wMox9wV6efAAtLF/W+qx6aK3wynmAm5w8b6qQrN/nWYKSx
ltWhQOH7m7k/lxVStrLDoMBi6xxXwt1u1fV6n/djYrnn9bPh+U6zkY8DvbVsxUPx
AxbcBvQcxK9ihjDt+JzlkcqYRNL1bP30h1dSWPVhURyaCVg+4yzDj4kqsd8MoYcv
l+KnQd6o82MEbOlcXFgr09ZdeOdHKJEYsPf708w/nhbeURF8ftPUH35/YUvbnhnR
gayTh/Zt7O07A+iMoOaLVTGTLh7WYcD4V3wSfO84eTdXdeE1xTiIMo9G2Q88J0fn
LhWH1lZGOtihncdXlLSC+f5ZdK+la17c6H/ao6fHz1iKhQSsb8i9wVIVXQOboXyw
PMy57jX61UJgwvnTO37913vcgU1Z1M+xZJcTX9FRLGJBfA+yi8gNvRR7OE3s77DQ
QnobXjgzWrfxb7TbEEdTlmfzzPt9qufw5Ah5AJaDILmIoFjxi8+96+1iIt0FaEq4
RXHxRWkNzi8GT6Q0f5TrC7FhH8o/6E01rElPAeaTfIxCBzBXZMyfjVqzvw6fOCBf
M4kveWAYwgNY/tMkIrT6irJaxKLlif/0tZSlNNqRgDkg26V5QCen/dt5JXIGWjyy
SE4377aVLRId2KafFkgv+97R7Ul4/vtgjV1kCXJjeRAfAXtXFZs=
=H1xr
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
