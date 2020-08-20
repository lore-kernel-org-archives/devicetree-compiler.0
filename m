From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: libfdt / fdt_check_node_offset_ with VALID_INPUT
Date: Thu, 20 Aug 2020 20:18:10 +1000
Message-ID: <20200820101810.GQ271315@yekko.fritz.box>
References: <34725235.0rVAnNm8GT@noys4>
 <20200813070945.GD17532@yekko.fritz.box>
 <1846921.vbHbvM2az7@noys4>
 <CAL_JsqLAWa-wMMiD=VffemMiqAv-3=GNehNojWrFQqED_+QDow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rKoHqF+aPLVth8b2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1597922567;
        bh=dhb6fo26uz7VnWNicQyBFeHrf3riHpEjk9/AuPzmkUg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kfwOhK78QbW4FWlxJw5jBC1VlosvO3/iOEBHtV22Jptz1BO0V5mD0ZrDXoGlr5JL0
         T6jANqbKZ6TEcsBL4p9Sisk8YrPlgBgWX1ibk0/K/Ryx1BJdpxrd9j//eyrJoXrRI6
         GbWsmz/RuQaoRM8WsWU7xE3ri54qFOwHkuDAL0Bk=
Content-Disposition: inline
In-Reply-To: <CAL_JsqLAWa-wMMiD=VffemMiqAv-3=GNehNojWrFQqED_+QDow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Mehnert <frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--rKoHqF+aPLVth8b2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2020 at 10:19:37AM -0600, Rob Herring wrote:
> On Thu, Aug 13, 2020 at 2:06 AM Frank Mehnert
> <frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.org> wrote:
> >
> > Hi David,
> >
> > On Donnerstag, 13. August 2020 09:09:45 CEST David Gibson wrote:
> > > On Wed, Aug 12, 2020 at 05:48:56PM +0200, Frank Mehnert wrote:
> > > > Hi all,
> > > >
> > > > I'm not sure if I found a bug or if I mis-use libfdt.
> > > >
> > > > I have a valid Linux device tree in memory and want to recursively =
scan
> > > > thru it. The device tree contains a root node and several subnodes.
> > > >
> > > > First, I start with the root node:
> > > >   int root =3D fdt_next_node(fdt, -1, NULL);
> > >
> > > Tangential aside: the offset of the root node is *always* 0, you don't
> > > need to "find" it with code like this.
> > >
> > > > Here, root is set to 0. Now I determine the offset of the first sub=
 node:
> > > >   int subnode =3D fdt_first_subnode(fdt, root);
> > > >
> > > > Here, subnode is either 0 if FDT_ASSUME_MASK contains ASSUME_VALID_=
INPUT
> > > > or 164 (in my case) if FDT_ASSUME_MASK does not contain
> > > > ASSUME_VALID_INPUT.
> > >
> > > That certainly sounds like a bug.  Adding things to FDT_ASSUME_MASK
> > > shouldn't change behaviour for valid inputs.
> > >
> > > > As far as I understand, fdt_first_subnode() should not return the n=
ode
> > > > offset of the current node if there are subnodes available.
> > >
> > > That's correct.
> > >
> > > > I think the problem origins at fdt_check_node_offset_() in fdt.c: If
> > > > VALID_INPUT is set, the whole code in that function is skipped. If =
that
> > > > flag is not set then fdt_next_tag(fdt, offset, &offset) is called a=
nd
> > > > the resulting 'offset' is returned.
> > > >
> > > > In other words, fdt_check_node_offset_() has a side effect which de=
pends
> > > > on the VALID_INPUT flag.
> > >
> > > Right.  Looks like the problem is that the next if *looks* like just
> > > an error/sanity check, which can_assume(VALID_INPUT) is bypassing.
> > > However, it also has the fdt_next_tag() call which alters offset.
> > >
> > > I was afraid of this sort of thing when we added the assumptions
> > > stuff.  Really we need to be running the testsuite with different
> > > assumptions masks, but it's fiddly to do.
> >
> > Thank you for these explanations!
> >
> > > Care to send a patch?
> >
> > Done in a separate e-mail. Please forgive me if the format is not
> > 100% correct.
> >
> > > [Another aside: why are you using ASSUME_VALID_INPUT - it's really
> > > only of value if you have to run your code in an *extremely* space
> > > limited environment, I don't recommend it as a rule]
> >
> > Actually we are using libfdt for parsing and altering the device tree
> > before starting a Linux guest in a virtual machine. The setup is kind
> > of static, that is, we can assume that the device tree is valid for
> > the setup.
> >
> > Parsing and altering the device tree is part of the setup boot time
> > which we need to keep low. Therefore I investigated several approaches
> > to speed up parsing and to prevent expensive operations.
> >
> > I'm completely aware that libfdt is not made for benchmarks and in
> > time-critical scenarios it would be probably better to read the device
> > tree, create an internal tree representation in memory of it, then
> > do the required modifications and finally create a new device tree
> > from memory and use that blob for the guest.
> >
> > However, so far we didn't want to take the effort of such a project,
> > because that also requires test cases and proves of correctness.
>=20
> FYI, there's been some related discussions related to this (mostly at
> past Linux Plumbers). One idea is to extend the FDT format to append
> overlays rather than applying them in place to the FDT (which is
> probably also slow).

Hm, I don't really see what a format extension would give you over
just giving a bundle of dtbs concatenated.

> Then the overlays can be applied later in boot on
> an unflattened tree. The other is creating a 'libdt' as a common API
> to work on unflattened DTs. dtc has its own unflattened representation
> and so does the Linux kernel. Both implementations would need
> relicensing as we'd want it dual licensed. The kernel one is more
> featureful, but the dtc one would be easier to relicense.

I tend to think the dtc implementation isn't really suitable for
general usage.  It's augmented with a bunch of extra information
that's important to it as a compiler but not really for any other
purpose.

That said, actually writing a live dt implementation is almost
trivial.  What's hard is designing a good interface for it that's
flexible enough to cover the use cases without become too complex to
set up and use.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rKoHqF+aPLVth8b2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8+TeIACgkQbDjKyiDZ
s5KHQBAAnXrlMmkF3ybH63D9nTuSlJHii8Hogs+obuknGjHA4xwTn3LC0AvqFXzV
lUhp+yRNh5H1UnTG6fRIL+NYzNh8VdSkJdm7E4tiKLMqcGFhkRJrC7brdUz9zgda
hTgi+c2iJUA0UknQT9c1FmyodIRTbATgEzMVktl9X6HFnNtD67HJpfKt6NOhC3j7
bXr39rZSu1TN4i2gEuTQsaHAwZ+HNspmxZOMF3XlY5OMI+DV1vrBInFV/fukbSKs
GGWPar/6woGTUCBGoG2I9iPakJolXJfPXiM8rZKdh/ZQ+6cQcXihXnJLrognZL+b
7VcTD3O1V2zEjQpCKQWZtZQByl6TTrNLcLjoYkXBnz6nL5Btm933Vi9pSJgRgbZN
2blwoP14Ay/+G9O62+rb+AzxFHWmjcj5zj9xPYiSlEg808U6myes/m4JgXOSPBCz
Vaq8EnlKZcU2ss6QCfbVNOs3j16JIxGjcYGx1lh7swiqYnkrtVF/4c8A992q7qoJ
mm5Xpk8eLJiyqcZmvA4fa8UyucDCr5cU9f4eWyEG9jQMdPEog14vTC+3f/VZy5m3
xOlT5YV5GoerfuotHZuVN4J8VM7GWjmq0vMWbY5qBghLE31da9S5ARmv2b3Q228n
T+soZeCqz224McxbiAEtQVHGTd8aAgSqR+P3X3bbhantvv2lFXI=
=WHtX
-----END PGP SIGNATURE-----

--rKoHqF+aPLVth8b2--
