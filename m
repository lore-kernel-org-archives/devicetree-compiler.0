From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in
 base fdt
Date: Wed, 17 Jan 2018 00:34:18 +1100
Message-ID: <20180116133418.GL30352@umbus.fritz.box>
References: <fe1b36f1-9e38-0d32-6879-b9cd495afd12@gmail.com>
 <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw@mail.gmail.com>
 <41a2006b-9b54-d803-7a28-457091db6f42@gmail.com>
 <CACNAnaGoZ+Ne6-d75q7bRokQ-Kr4iDr5kJAEXUybYvw2g2cbPg@mail.gmail.com>
 <5c11d86d-da33-ece5-3170-8fa0bbe5b546@gmail.com>
 <CACNAnaER1_EW0_HSWcViSiGPTqoLKkh-JF0UKLN1hAwzxhizvw@mail.gmail.com>
 <79ae4708-6a55-a6b6-7eaf-e473baa2c1ac@gmail.com>
 <20180112053310.GL24770@umbus.fritz.box>
 <CACNAnaEWn4+hOREZ57-UNKRuypgght1C6_5oVkqhwmaj-1yGLw@mail.gmail.com>
 <CACNAnaHL2q7kxNdete2L+ZNs7kDZY-g-Ly4bgYWfQsBy0R5KdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oOpJzULQ70+PGW7h"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516110129;
        bh=2kyLnCwwcryDKbID0/BRkvTI1Z3uWpZIDLANLrPgEsU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lNsfPMDdcAgfitXkKiy1c1mno7UVOrSWaZaGSkttiZ2drF9DDZ3aGBcPWE9EJlpwT
         A4H2wst83DNfEU3bl1Y1Z22szVNrFMTsYbxkMvaL+OMe7O820L+tLRNxhS39Kpq9Wb
         4sqiMz80arkBQ62REPROhH2FMtEfn0FaC9OC5lIQ=
Content-Disposition: inline
In-Reply-To: <CACNAnaHL2q7kxNdete2L+ZNs7kDZY-g-Ly4bgYWfQsBy0R5KdA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--oOpJzULQ70+PGW7h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2018 at 10:24:34AM -0600, Kyle Evans wrote:
> On Fri, Jan 12, 2018 at 9:57 AM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> > On Thu, Jan 11, 2018 at 11:33 PM, David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> On Fri, Jan 05, 2018 at 12:40:13PM -0800, Frank Rowand wrote:
> >>> On 01/04/18 21:47, Kyle Evans wrote:
> >>> > On Thu, Jan 4, 2018 at 11:02 PM, Frank Rowand <frowand.list@gmail.c=
om> wrote:
> >>> >> On 01/04/18 19:50, Kyle Evans wrote:
> >>> >>> On Thu, Jan 4, 2018 at 9:14 PM, Frank Rowand <frowand.list@gmail.=
com> wrote:
> >>> >>>> On 01/04/18 18:39, Kyle Evans wrote:
> >>> >>>>> On Thu, Jan 4, 2018 at 7:55 PM, Frank Rowand <frowand.list@gmai=
l.com> wrote:
> >>> >>>>>> On 01/04/18 13:47, Kyle Evans wrote:
> >>> >>>>>>> On Thu, Jan 4, 2018 at 3:34 PM, Kyle Evans <kevans-h+KGxgPPiorF2uMehF1BdA@public.gmane.org=
g> wrote:
> >>> >>>>>>>> On Thu, Jan 4, 2018 at 2:41 PM, Kyle Evans <kevans@freebsd.o=
rg> wrote:
> >>> >>>>>>>>> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand <frowand.list@=
gmail.com> wrote:
> >>> >>>>>>>>>> [... snip ...]
> >> [snip]
> >>> > Your implementation knows what my overlay means otherwise because I
> >>> > reference a labelled node using &foo, dtc generated a /__fixup__ for
> >>> > it, your implementation takes that /__fixup__ and does the lookup in
> >>> > the symbol table. The symbol exists and points to a node, what's the
> >>> > point of rejecting it there?>
> >>> > It seems unreasonable to me, because you cannot always control the
> >>> > source of your live tree. In many cases, sure, it's generated in-tr=
ee
> >>> > or in U-Boot and passed to you, and you can reasonably expect you
> >>> > won't encounter this. What if you have vendor-provided tree?
> >>> >
> >>> > I think the point I'm getting at is that it seems like this will ha=
ve
> >>> > to change at some point anyways simply because you can't control all
> >>> > sources of your devicetree, and this isn't strictly wrong. Telling
> >>> > someone "No, we can't apply that overlay because your vendor's
> >>> > internal tool for generating dts and $other_format_used_internally
> >>> > simultaneously didn't generate a phandle for that" is kind of hard,=
> especially when your reasoning ISN'T "their blob is malformed" or
> >>> > "your overlay's reference is ambiguous" but rather, "we know what
> >>> > that's pointing at, but we just don't generate handles."
> >>>
> >>> No, the blob _is_ malformed.  I know there is no official binding
> >>> document for overlays (we do need such things once we figure out
> >>> what we are doing), so this comment is purely my opinion.
> >>
> >> In this case it's not a spec for overlays that's the issue, it's a
> >> spec for what base trees require in order to accept overlays.
> >>
> >>> The blob is malformed because it was not compiled with the "-@"
> >>> flag.  Mostly not because of anything in the source, although
> >>> again the __symbols__ node should not be hand coded.
> >>
> >> I don't think it's reasonable to claim a blob is malformed based
> >> purely on how it was generated, it needs to be something about it's
> >> actualy contents.
> >>
> >> So the question is: is "includes a phandle for every node with a
> >> symbol" a requirement for an overlay accepting base tree.  It's never
> >> been explicitly stated, since overlays were just kind of hacked
> >> together rather than fully specced out.  dtc has been written assuming
> >> that is a requirement, BSDdtc has not.
> >>
> >> I'm inclined to say "yes, it should be a requirement" on the grounds
> >> that:
> >>     a) that's the interpretation that's more widely deployed already
> >> and
> >>     b) that simplifies the overlay application logic, which generally
> >>        takes place in a more restricted environment than the initial
> >>        compilation.
> >>
> >> I'm entirely open to arguments against that position though.
> >
> > To be honest, I think both of these points are kind of wobbly. Just
> > because something has been largely interpreted a certain way does not
> > make it necessarily a good way to do so.
> >
> > It's also kind of hard to make the simplification point, my latest
> > patch [1] that I run locally doesn't really touch existing stuff all
> > that much, and it certainly doesn't feel any more complex than what
> > was already there.
> >
> > I would be inclined to say that a spec shouldn't hold a strong
> > position on this, for the following reasons:
> >
> > 1.) I've not yet seen a good technical reason for requiring explicit
> > assignment. Explicit assignment was useful when you had no other
> > method for resolving xrefs, but this isn't the case here.
> >
> > 2.) It's hard for a spec to say what the environmental restrictions
> > will be of an implementation. While you might be memory-constrained, I
> > might be disk-constrained. While you may not want to spend the extra
> > cycles to walk the tree the first time to figure out the next phandle
> > to be assigned, I might be OK with that trade-off.
> >
> > Ultimately, it should be up to the implementation actually applying
> > these overlays to decide what it's willing to accept. I don't see that
> > as a big problem, but I'm also coming from a stand-point that the only
> > *blobs* I physically receive are those that I have no real control
> > over because they come from firmware. No one that I know is physically
> > passing blobs around to be used in u-boot or otherwise (save for
> > rpi-firmware)... the transparency is crap and that's just silly.
> >
> > My suggested wording would likely be along the lines of "a base tree
> > for accepting overlays should have a phandle assigned to every node
> > that may be referenced in an overlay, but the mechanism for actually
> > applying overlays may or may not require this."
> >
> > I like the 'should' wording, because it gives room to say "Look, if
> > you're going to force a blob on people or expect these blobs to work
> > on a wide range of systems, you should really do it this way for
> > optimal compatibility" while also not restricting what I do as a
> > consenting adult in the name of keeping things clean in an environment
> > that I otherwise control.
>=20
> Sorry, I meant to add- this also gives you, Frank and co. room to say
> "Sorry, this implementation doesn't accept this."

I really don't want to do that.  There's already rather a lot of fuzz
in DT and surrounding specs.  I don't want to add yet more room for
incompatible implementations if we can avoid it.

> This allows one to
> strip explicit phandles from things that their implementation does not
> want xref'd and for the resulting blob to still be considered 'overlay
> accepting' and accepted by implementations, because the
> implementations have some choice in what they accept for base trees.
>=20
> Linux's loader implementation may accept willy-nilly for base trees,
> while their live tree implementation will be a lot less accepting.
> Sure, they also control the pipeline from loader to live tree, but for
> demonstration purposes it's not that crazy to consider. Their live
> tree implementation is still a valid implementation that applies
> overlays to base trees, and I consider that fact significant to this
> discussion.
>=20
> It gives me room to add an optional flag to our BSDL dtc to go back to
> our former method of assigning phandles at compile-time, so that the
> default for '-@' is the compatible behavior but a minimal approach may
> be taken instead for those that choose to do so.

I'm still not seeing why you're so keen on avoiding adding phandles.
Doing so will already work with existing overlay implementations, and
it's pretty much trivial to add, so why not just make the change to
BSDdtc?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oOpJzULQ70+PGW7h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpd/1oACgkQbDjKyiDZ
s5L2dhAAgyD4oE8oNDSXp54sTfYUZvvPvSLRJ6UDAbRuvGfw2gIc1hunSZgA98R5
Q/w18owjHOAf7LV7HWajJV7mg25JTyAfuhcs/qsK83fG/WW2i90xTxGnRPXRcdtC
GJ8N+9w5gASk6JuSoAgfPpYwMGTa/fHYpzMSjcr8xodN7gy9d6+9ETFz5bwGq7sa
z9Mj+SUt8Oa1clBlFU1nVsoElClf2ccvKn1gj08xO11sqXZxCCu20WEt/A92Wy19
ZCTrUUAkgf2qWqNor+sg4mLBt1JGWNFBpjXk0O/bOusyL2Q0zzVfMjyJmLJwNcQF
Pa8dmf4bp1bl9HdwK9B+oakhvWHZDbfWD6ksfuqhZvfw4hA03g7IHou0Bo6kSv3j
DrvRVsTklI+WIqfBQ2zRDW15vjYmGmDfMQfY24mK1qZ3j1VIiK8Jd2PKUOCvSdK+
9Mbfq6YmJZkNIr6OuvCTwuKL+jTsERJ4t5NXUauW5DN4FLaxiEpn0FaNPLLvbLr+
0IGKNe4SSurG62m96q/Gjahee324I5JO/qEGogESRVBWFhdChzZdmCnN/m3XsmNn
GAVAFlfUg+Y5yBo4bon1uVfOVIklDvClzX4gMEA5nAK5U+r9a169s66P7I0AkFU3
HDZdVJeu92BTByJe62tyGLL2rFSfuCrqarSDSC7H1VHKRTB1V4I=
=xaNm
-----END PGP SIGNATURE-----

--oOpJzULQ70+PGW7h--
