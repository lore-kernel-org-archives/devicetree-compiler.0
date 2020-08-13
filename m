From: Frank Mehnert <frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.org>
Subject: Re: libfdt / fdt_check_node_offset_ with VALID_INPUT
Date: Thu, 13 Aug 2020 10:06:55 +0200
Message-ID: <1846921.vbHbvM2az7@noys4>
References: <34725235.0rVAnNm8GT@noys4> <20200813070945.GD17532@yekko.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200813070945.GD17532-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi David,

On Donnerstag, 13. August 2020 09:09:45 CEST David Gibson wrote:
> On Wed, Aug 12, 2020 at 05:48:56PM +0200, Frank Mehnert wrote:
> > Hi all,
> >=20
> > I'm not sure if I found a bug or if I mis-use libfdt.
> >=20
> > I have a valid Linux device tree in memory and want to recursively scan
> > thru it. The device tree contains a root node and several subnodes.
> >=20
> > First, I start with the root node:
> >   int root =3D fdt_next_node(fdt, -1, NULL);
>=20
> Tangential aside: the offset of the root node is *always* 0, you don't
> need to "find" it with code like this.
>=20
> > Here, root is set to 0. Now I determine the offset of the first sub nod=
e:
> >   int subnode =3D fdt_first_subnode(fdt, root);
> >=20
> > Here, subnode is either 0 if FDT_ASSUME_MASK contains ASSUME_VALID_INPUT
> > or 164 (in my case) if FDT_ASSUME_MASK does not contain
> > ASSUME_VALID_INPUT.
>=20
> That certainly sounds like a bug.  Adding things to FDT_ASSUME_MASK
> shouldn't change behaviour for valid inputs.
>=20
> > As far as I understand, fdt_first_subnode() should not return the node
> > offset of the current node if there are subnodes available.
>=20
> That's correct.
>=20
> > I think the problem origins at fdt_check_node_offset_() in fdt.c: If
> > VALID_INPUT is set, the whole code in that function is skipped. If that
> > flag is not set then fdt_next_tag(fdt, offset, &offset) is called and
> > the resulting 'offset' is returned.
> >=20
> > In other words, fdt_check_node_offset_() has a side effect which depends
> > on the VALID_INPUT flag.
>=20
> Right.  Looks like the problem is that the next if *looks* like just
> an error/sanity check, which can_assume(VALID_INPUT) is bypassing.
> However, it also has the fdt_next_tag() call which alters offset.
>=20
> I was afraid of this sort of thing when we added the assumptions
> stuff.  Really we need to be running the testsuite with different
> assumptions masks, but it's fiddly to do.

Thank you for these explanations!

> Care to send a patch?

Done in a separate e-mail. Please forgive me if the format is not
100% correct.

> [Another aside: why are you using ASSUME_VALID_INPUT - it's really
> only of value if you have to run your code in an *extremely* space
> limited environment, I don't recommend it as a rule]

Actually we are using libfdt for parsing and altering the device tree
before starting a Linux guest in a virtual machine. The setup is kind
of static, that is, we can assume that the device tree is valid for
the setup.

Parsing and altering the device tree is part of the setup boot time
which we need to keep low. Therefore I investigated several approaches
to speed up parsing and to prevent expensive operations.

I'm completely aware that libfdt is not made for benchmarks and in
time-critical scenarios it would be probably better to read the device
tree, create an internal tree representation in memory of it, then
do the required modifications and finally create a new device tree
from memory and use that blob for the guest.

However, so far we didn't want to take the effort of such a project,
because that also requires test cases and proves of correctness.

Thanks

Frank
--=20
Dr.-Ing. Frank Mehnert, frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.o=
rg, +49-351-41 883 224

Kernkonzept GmbH.  Sitz: Dresden.  Amtsgericht Dresden, HRB 31129.
Gesch=E4ftsf=FChrer: Dr.-Ing. Michael Hohmuth


