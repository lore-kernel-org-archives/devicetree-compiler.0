From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in
 base fdt
Date: Wed, 17 Jan 2018 00:30:40 +1100
Message-ID: <20180116133040.GK30352@umbus.fritz.box>
References: <CACNAnaHa=OuCrzVegg=7AemS8x=ADFsDs88WQ0phM+TLuYcZJw@mail.gmail.com>
 <fe1b36f1-9e38-0d32-6879-b9cd495afd12@gmail.com>
 <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw@mail.gmail.com>
 <41a2006b-9b54-d803-7a28-457091db6f42@gmail.com>
 <CACNAnaGoZ+Ne6-d75q7bRokQ-Kr4iDr5kJAEXUybYvw2g2cbPg@mail.gmail.com>
 <5c11d86d-da33-ece5-3170-8fa0bbe5b546@gmail.com>
 <CACNAnaER1_EW0_HSWcViSiGPTqoLKkh-JF0UKLN1hAwzxhizvw@mail.gmail.com>
 <79ae4708-6a55-a6b6-7eaf-e473baa2c1ac@gmail.com>
 <20180112053310.GL24770@umbus.fritz.box>
 <CACNAnaEWn4+hOREZ57-UNKRuypgght1C6_5oVkqhwmaj-1yGLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cN0A5YokcrYPGsSB"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516110129;
        bh=48MKXE2WwVQlzQBXPyGh5/lI6tPxHYwUTn92gPyr7wA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NLAChEiRXh+M2B7qQSgU0jduOFbhQEC6BAUVqtVvdWcztgO0Bf1PCI2dsoog4d18l
         x/D1YXSI3T2TCE6gxEk0J3Vt8bu2MMXvnD8v5+09mrBMu0sXkTy9MjP3dpW95kbsyD
         Ly5BA6k/e4/oeUuclFSWvuyeMa6K7Ib7WS8ADi8o=
Content-Disposition: inline
In-Reply-To: <CACNAnaEWn4+hOREZ57-UNKRuypgght1C6_5oVkqhwmaj-1yGLw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--cN0A5YokcrYPGsSB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2018 at 09:57:26AM -0600, Kyle Evans wrote:
> On Thu, Jan 11, 2018 at 11:33 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Fri, Jan 05, 2018 at 12:40:13PM -0800, Frank Rowand wrote:
> >> On 01/04/18 21:47, Kyle Evans wrote:
> >> > On Thu, Jan 4, 2018 at 11:02 PM, Frank Rowand <frowand.list-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> >> >> On 01/04/18 19:50, Kyle Evans wrote:
> >> >>> On Thu, Jan 4, 2018 at 9:14 PM, Frank Rowand <frowand.list@gmail.c=
om> wrote:
> >> >>>> On 01/04/18 18:39, Kyle Evans wrote:
> >> >>>>> On Thu, Jan 4, 2018 at 7:55 PM, Frank Rowand <frowand.list@gmail=
=2Ecom> wrote:
> >> >>>>>> On 01/04/18 13:47, Kyle Evans wrote:
> >> >>>>>>> On Thu, Jan 4, 2018 at 3:34 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org=
> wrote:
> >> >>>>>>>> On Thu, Jan 4, 2018 at 2:41 PM, Kyle Evans <kevans-h+KGxgPPiorF2uMehF1BdA@public.gmane.org=
g> wrote:
> >> >>>>>>>>> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand <frowand.list@g=
mail.com> wrote:
> >> >>>>>>>>>> [... snip ...]
> > [snip]
> >> > Your implementation knows what my overlay means otherwise because I
> >> > reference a labelled node using &foo, dtc generated a /__fixup__ for
> >> > it, your implementation takes that /__fixup__ and does the lookup in
> >> > the symbol table. The symbol exists and points to a node, what's the
> >> > point of rejecting it there?>
> >> > It seems unreasonable to me, because you cannot always control the
> >> > source of your live tree. In many cases, sure, it's generated in-tree
> >> > or in U-Boot and passed to you, and you can reasonably expect you
> >> > won't encounter this. What if you have vendor-provided tree?
> >> >
> >> > I think the point I'm getting at is that it seems like this will have
> >> > to change at some point anyways simply because you can't control all
> >> > sources of your devicetree, and this isn't strictly wrong. Telling
> >> > someone "No, we can't apply that overlay because your vendor's
> >> > internal tool for generating dts and $other_format_used_internally
> >> > simultaneously didn't generate a phandle for that" is kind of hard,>=
 especially when your reasoning ISN'T "their blob is malformed" or
> >> > "your overlay's reference is ambiguous" but rather, "we know what
> >> > that's pointing at, but we just don't generate handles."
> >>
> >> No, the blob _is_ malformed.  I know there is no official binding
> >> document for overlays (we do need such things once we figure out
> >> what we are doing), so this comment is purely my opinion.
> >
> > In this case it's not a spec for overlays that's the issue, it's a
> > spec for what base trees require in order to accept overlays.
> >
> >> The blob is malformed because it was not compiled with the "-@"
> >> flag.  Mostly not because of anything in the source, although
> >> again the __symbols__ node should not be hand coded.
> >
> > I don't think it's reasonable to claim a blob is malformed based
> > purely on how it was generated, it needs to be something about it's
> > actualy contents.
> >
> > So the question is: is "includes a phandle for every node with a
> > symbol" a requirement for an overlay accepting base tree.  It's never
> > been explicitly stated, since overlays were just kind of hacked
> > together rather than fully specced out.  dtc has been written assuming
> > that is a requirement, BSDdtc has not.
> >
> > I'm inclined to say "yes, it should be a requirement" on the grounds
> > that:
> >     a) that's the interpretation that's more widely deployed already
> > and
> >     b) that simplifies the overlay application logic, which generally
> >        takes place in a more restricted environment than the initial
> >        compilation.
> >
> > I'm entirely open to arguments against that position though.
>=20
> To be honest, I think both of these points are kind of wobbly.

I'm not claiming they're conclusive, just the best arguments I've seen
so far.

> Just
> because something has been largely interpreted a certain way does not
> make it necessarily a good way to do so.

No, but the fact that widely deployed implementations rely on a
certain interpretation is a fairly strong argument for keeping it,
even if it's not the best by other measures.

> It's also kind of hard to make the simplification point, my latest
> patch [1] that I run locally doesn't really touch existing stuff all
> that much, and it certainly doesn't feel any more complex than what
> was already there.

It adds and doesn't remove code, so I think it's hard to argue it
doesn't add complexity.

> I would be inclined to say that a spec shouldn't hold a strong
> position on this, for the following reasons:
>=20
> 1.) I've not yet seen a good technical reason for requiring explicit
> assignment. Explicit assignment was useful when you had no other
> method for resolving xrefs, but this isn't the case here.

I'm not really sure what you mean by explicit assignment.

> 2.) It's hard for a spec to say what the environmental restrictions
> will be of an implementation. While you might be memory-constrained, I
> might be disk-constrained. While you may not want to spend the extra
> cycles to walk the tree the first time to figure out the next phandle
> to be assigned, I might be OK with that trade-off.

True in principle, but stretched to breaking point in practice.  Given
that overlay application typically occurs in a bootloader, and
complication typically occurs in a full userspace environment, it's
pretty hard to see the overlay application environment as anything
other than (at least potentially) vastly more constrained in every
plausibly relevant dimension.

> Ultimately, it should be up to the implementation actually applying
> these overlays to decide what it's willing to accept.

Not if this is going to have relevant meaning as a
cross-implementation standard, even a de facto one.

> I don't see that
> as a big problem, but I'm also coming from a stand-point that the only
> *blobs* I physically receive are those that I have no real control
> over because they come from firmware. No one that I know is physically
> passing blobs around to be used in u-boot or otherwise (save for
> rpi-firmware)... the transparency is crap and that's just silly.
>=20
> My suggested wording would likely be along the lines of "a base tree
> for accepting overlays should have a phandle assigned to every node
> that may be referenced in an overlay, but the mechanism for actually
> applying overlays may or may not require this."
>=20
> I like the 'should' wording, because it gives room to say "Look, if
> you're going to force a blob on people or expect these blobs to work
> on a wide range of systems, you should really do it this way for
> optimal compatibility" while also not restricting what I do as a
> consenting adult in the name of keeping things clean in an environment
> that I otherwise control.

Well, that's fair enough, I guess.

Have you encountered the missing phandles with any blobs you've
encountered *other* than ones you've built with BSDdtc?

I mean, the basic position here is that we have a working[1]
implementation on both sides.  There is no formal spec - that's not a
good thing, but it's where we're at.  If your new implementation wants
to take a different interpretation, the onus is really on you to make
a concrete case that's stronger than staying with what we have.  So
far the best I've seen is "lots of phandles are inconvenient for our
kernel for poorly articulated reasons".  That doesn't have no weight,
but I don't think you've yet passed the threshhold required to
overcome inertia.

[1] To the extent that overlays can work, I have many, many issues
with the format, but that's a discussion that's been had elsewhere.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cN0A5YokcrYPGsSB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpd/n4ACgkQbDjKyiDZ
s5KCqxAAp3PrX5fhBRyDNsI+jyZk9jMXnojpfY65bed8Ucap6d2XJTQZDxgQZBrt
yWPqvm8M1TsWDVePFDRmAvnAHFVbEeH3UItwquIthO3ZqPOTSo9JP8myzy5dq1Iz
D0IfaXzpYqIHIRrf7HOkXxXx+3EDljObX4eK688xkKsh7bSTLla2CF9x3MdITb6x
BH6ShKdNpgn+OLf8GfH77Ij3qGEgaDrFEgdoHpvZWvfDXqyjcZOCuZ/VzAu1sE/3
rLdOnlHrBp3oshagZ2GINoS3fkrfW84CvlrUlR3sSXW8850iMtij9XFABfA3YHpp
bES4SVK3jDtBQ0ltcSX8yMWwN/kpWMOZIZGIeCNqOCyDHOF3MrOX7Uen8hlHALJv
qNlM3IA/6tbU8iIc8HpP6Hu+j06173In6BrxPbm0z1jLLRn5FBtIWZp8s6gJWbce
7+dRxqSQhK/Q09nB6fwyM/OXVxEsvemh3DITXi7h6rysPvwkBiwaUcVOizrNGFN0
JrgXJj1jo/W9eI1PT6JPQEkzs+otQF4SgJmLqxd2CasKSzsA+21sg66Pgu1VfGQJ
rUXtPMgJB4fgBDaY1pnpqBC/ALHd191YVGM4LDiCHRfsS4jzNa9wBAl5e6or/TQ9
6PNH9KoUJ1MI9pkZglu/E2+uAdVhN3MaeQSXiacFgGotDxtArmQ=
=LQ6w
-----END PGP SIGNATURE-----

--cN0A5YokcrYPGsSB--
