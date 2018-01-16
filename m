From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in
 base fdt
Date: Wed, 17 Jan 2018 10:40:41 +1100
Message-ID: <20180116234041.GT30352@umbus.fritz.box>
References: <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw@mail.gmail.com>
 <41a2006b-9b54-d803-7a28-457091db6f42@gmail.com>
 <CACNAnaGoZ+Ne6-d75q7bRokQ-Kr4iDr5kJAEXUybYvw2g2cbPg@mail.gmail.com>
 <5c11d86d-da33-ece5-3170-8fa0bbe5b546@gmail.com>
 <CACNAnaER1_EW0_HSWcViSiGPTqoLKkh-JF0UKLN1hAwzxhizvw@mail.gmail.com>
 <79ae4708-6a55-a6b6-7eaf-e473baa2c1ac@gmail.com>
 <20180112053310.GL24770@umbus.fritz.box>
 <CACNAnaEWn4+hOREZ57-UNKRuypgght1C6_5oVkqhwmaj-1yGLw@mail.gmail.com>
 <20180116133040.GK30352@umbus.fritz.box>
 <CACNAnaFfXLVCG0e7KHtvU3rboKJpwMYV-WPqFw+kSMQeMqHu+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QCC2I/2CckNfI+Tr"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516146076;
        bh=P2DXOKFftp8yE4yHCA5205Qhn05CSIhjJzwM4zvSCZ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VJDqLN/xvBNvvSEPS7bafMKQAx0vP9LxRvGIxf30y6DSRRDriqP/F1fLKhJ25DhFN
         ozuL/8nUJ/WhQsIc0lWshZ5aYRj4+G7cYNNA7QMGD6nYuZgmXk6A8H/5rsOBOWGW53
         z0WAWPHZgt4vgO15ajTR9u/M6Xb14PxZPbfjS0xg=
Content-Disposition: inline
In-Reply-To: <CACNAnaFfXLVCG0e7KHtvU3rboKJpwMYV-WPqFw+kSMQeMqHu+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--QCC2I/2CckNfI+Tr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2018 at 09:32:41AM -0600, Kyle Evans wrote:
> On Tue, Jan 16, 2018 at 7:30 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Fri, Jan 12, 2018 at 09:57:26AM -0600, Kyle Evans wrote:
> >> On Thu, Jan 11, 2018 at 11:33 PM, David Gibson
> >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> > On Fri, Jan 05, 2018 at 12:40:13PM -0800, Frank Rowand wrote:
> >> >> On 01/04/18 21:47, Kyle Evans wrote:
> >> >> > On Thu, Jan 4, 2018 at 11:02 PM, Frank Rowand <frowand.list@gmail=
=2Ecom> wrote:
> >> >> >> On 01/04/18 19:50, Kyle Evans wrote:
> >> >> >>> On Thu, Jan 4, 2018 at 9:14 PM, Frank Rowand <frowand.list@gmai=
l.com> wrote:
> >> >> >>>> On 01/04/18 18:39, Kyle Evans wrote:
> >> >> >>>>> On Thu, Jan 4, 2018 at 7:55 PM, Frank Rowand <frowand.list@gm=
ail.com> wrote:
> >> >> >>>>>> On 01/04/18 13:47, Kyle Evans wrote:
> >> >> >>>>>>> On Thu, Jan 4, 2018 at 3:34 PM, Kyle Evans <kevans@freebsd.=
org> wrote:
> >> >> >>>>>>>> On Thu, Jan 4, 2018 at 2:41 PM, Kyle Evans <kevans@freebsd=
=2Eorg> wrote:
> >> >> >>>>>>>>> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand <frowand.lis=
t@gmail.com> wrote:
> >> >> >>>>>>>>>> [... snip ...]
> >> > [snip]
> >> >> > Your implementation knows what my overlay means otherwise because=
 I
> >> >> > reference a labelled node using &foo, dtc generated a /__fixup__ =
for
> >> >> > it, your implementation takes that /__fixup__ and does the lookup=
 in
> >> >> > the symbol table. The symbol exists and points to a node, what's =
the
> >> >> > point of rejecting it there?>
> >> >> > It seems unreasonable to me, because you cannot always control the
> >> >> > source of your live tree. In many cases, sure, it's generated in-=
tree
> >> >> > or in U-Boot and passed to you, and you can reasonably expect you
> >> >> > won't encounter this. What if you have vendor-provided tree?
> >> >> >
> >> >> > I think the point I'm getting at is that it seems like this will =
have
> >> >> > to change at some point anyways simply because you can't control =
all
> >> >> > sources of your devicetree, and this isn't strictly wrong. Telling
> >> >> > someone "No, we can't apply that overlay because your vendor's
> >> >> > internal tool for generating dts and $other_format_used_internally
> >> >> > simultaneously didn't generate a phandle for that" is kind of har=
d,> especially when your reasoning ISN'T "their blob is malformed" or
> >> >> > "your overlay's reference is ambiguous" but rather, "we know what
> >> >> > that's pointing at, but we just don't generate handles."
> >> >>
> >> >> No, the blob _is_ malformed.  I know there is no official binding
> >> >> document for overlays (we do need such things once we figure out
> >> >> what we are doing), so this comment is purely my opinion.
> >> >
> >> > In this case it's not a spec for overlays that's the issue, it's a
> >> > spec for what base trees require in order to accept overlays.
> >> >
> >> >> The blob is malformed because it was not compiled with the "-@"
> >> >> flag.  Mostly not because of anything in the source, although
> >> >> again the __symbols__ node should not be hand coded.
> >> >
> >> > I don't think it's reasonable to claim a blob is malformed based
> >> > purely on how it was generated, it needs to be something about it's
> >> > actualy contents.
> >> >
> >> > So the question is: is "includes a phandle for every node with a
> >> > symbol" a requirement for an overlay accepting base tree.  It's never
> >> > been explicitly stated, since overlays were just kind of hacked
> >> > together rather than fully specced out.  dtc has been written assumi=
ng
> >> > that is a requirement, BSDdtc has not.
> >> >
> >> > I'm inclined to say "yes, it should be a requirement" on the grounds
> >> > that:
> >> >     a) that's the interpretation that's more widely deployed already
> >> > and
> >> >     b) that simplifies the overlay application logic, which generally
> >> >        takes place in a more restricted environment than the initial
> >> >        compilation.
> >> >
> >> > I'm entirely open to arguments against that position though.
> >>
> >> To be honest, I think both of these points are kind of wobbly.
> >
> > I'm not claiming they're conclusive, just the best arguments I've seen
> > so far.
> >
> >> Just
> >> because something has been largely interpreted a certain way does not
> >> make it necessarily a good way to do so.
> >
> > No, but the fact that widely deployed implementations rely on a
> > certain interpretation is a fairly strong argument for keeping it,
> > even if it's not the best by other measures.
> >
> >> It's also kind of hard to make the simplification point, my latest
> >> patch [1] that I run locally doesn't really touch existing stuff all
> >> that much, and it certainly doesn't feel any more complex than what
> >> was already there.
> >
> > It adds and doesn't remove code, so I think it's hard to argue it
> > doesn't add complexity.
>=20
> I think we have different definitions of complexity, then. =3D) To me,
> this isn't added complexity unless it actually entails some kind of
> real re-design and work put into it.
>=20
> >> I would be inclined to say that a spec shouldn't hold a strong
> >> position on this, for the following reasons:
> >>
> >> 1.) I've not yet seen a good technical reason for requiring explicit
> >> assignment. Explicit assignment was useful when you had no other
> >> method for resolving xrefs, but this isn't the case here.
> >
> > I'm not really sure what you mean by explicit assignment.
>=20
> Explicit assignment of phandles to a node.

Um.. that didn't help.  As far as I can tell we're discussing implicit
assignment of phandles to nodes by the compiler, versus implicit
assignment of phandles to nodes by the overlay applier.  Nothing
explicit about either case.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QCC2I/2CckNfI+Tr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpejXkACgkQbDjKyiDZ
s5LFlxAAplTBZNPYQ8oVzz/BtC8McnDZ82fWnVTObS+4hkGHg0ct0u0Yd/F39Fs+
kjfX/KQDtULi0rhVg7DtNKNLtMLWxVxyqF1xFVxEsBRHfAT+BMucTQXVwnpPLYAj
sQjvB6xpmSWyqv0xBuc2MHm8h7D6LZOLoO2Db1h0+zeElSGjAK0xixxNwq3znlRM
go80OgJOQIZCUxTe3O5od+dSZdgb7vlMk8OAgDiH7mmECe7Oj1eh4xpbhdNXT4Qd
7RQnUlez7mHciwmhyItvplE0018gVU/18u4WbjELRVIPDlQ2ok73uC6d7oEAeo0v
Zqm3lfdhYdPxTAv3V7ntBbhsYTakKv70jRR56rKysVwCH1YFfJOeLxWdoeDzIW37
2uEuKPFPmnpq9qR+q6HSj+2ZOgBmJrV+zMxf5V0tHZGbPmiOMj9ts5GtYyqF3Hfg
qUx+0A+uUScwcIG6X7P1qG3ths1JiGNb+KuvEEz8h+gDYJWPnI82iH5eSovkgg4U
OdSy6c1jotBZKs/r9LlFWcs7KkVJdhI441DLkQpT/ZgJII1DiuP9YahiTgr3WBF/
jvoqtt2StuA+ZGOnmXc0q/kaTdhiDOEzrrclI4Cn4QFAaFViwh4j8OMF6qRu2iX7
s6nCtZYMV3BH2PxKrq2CFgL/fGPgZ+SRAlVCmjEAmTKyo/HoFAU=
=Yqnl
-----END PGP SIGNATURE-----

--QCC2I/2CckNfI+Tr--
