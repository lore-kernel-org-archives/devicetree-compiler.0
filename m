From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: Warnings do include offending filename
Date: Wed, 01 Feb 2017 07:34:06 +0000
Message-ID: <1485934446.7612.36.camel@hellion.org.uk>
References: <1485767585.7612.23.camel@hellion.org.uk>
         <20170130234932.GB14879@umbus.fritz.box>
         <1485851088.7612.32.camel@hellion.org.uk>
         <20170201001654.GB30639@umbus.fritz.box>
         <20170201010004.GG30639@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170201010004.GG30639-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, 2017-02-01 at 12:00 +1100, David Gibson wrote:
> On Wed, Feb 01, 2017 at 11:16:54AM +1100, David Gibson wrote:
> > On Tue, Jan 31, 2017 at 08:24:48AM +0000, Ian Campbell wrote:
> > > On Tue, 2017-01-31 at 10:49 +1100, David Gibson wrote:
> > > > On Mon, Jan 30, 2017 at 09:13:05AM +0000, Ian Campbell wrote:
> > > > > Hello,
> > > > >=A0
> > > > > I wasn't sure how/where to make a wishlist bug report, so I hope =
this
> > > > > will suffice, am happy to be pointed in a different direction tho=
ugh.
> > > > >=A0
> > > > > I recently[0] stumbled over around 1,000 of these:
> > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg =
or ranges property, but no unit name
> > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-oscil=
lator has a reg or ranges property, but no unit name
> > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg =
or ranges property, but no unit name
> > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg =
or ranges property, but no unit name
> > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-oscil=
lator has a reg or ranges property, but no unit name
> > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg =
or ranges property, but no unit name
> > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-oscil=
lator has a reg or ranges property, but no unit name
> > > > >=A0
> > > > > When building the split device tree repo[1] from the Linux source
> > > > > (essential it's a build of every single dts in the kernel source).
> > > > >=A0
> > > > > The cause of the warning is an issue which needs to be fixed but I
> > > > > thought I would mention that it would be very useful (I expect) i=
f dtc
> > > > > would include the offending file in warnings (like e.g. gcc would=
), not
> > > > > just because of the number of *.dtb being built here but also due=
 to
> > > > > #include and /include/ of .dtsi files.
> > > >=A0
> > > > Right, having the filenames - and line numbers - there would certai=
nly
> > > > be helpful.=A0=A0Unfortunately, it's not at all trivial to implemen=
t.=A0=A0As
> > > > someone said in a different thread, these checks take place (and ha=
ve
> > > > to) after the tree is completely parsed and we no longer have source
> > > > locations readily to hand.
> > >=A0
> > > Would it be easier (or possible) to print the name of the eventually-
> > > to-be-output binary? At the moment=A0the user is left guessing which =
one
> > > of 1,200 *.dtb files they just built produced each of the similar
> > > number of warnings. If the message was instead:
> > >=A0
> > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): arch/arm/boot/dts/foo.dt=
b: Node /soc has a ...
> > >=A0
> > > Then that would at least be something to go on.
> > >=A0
> > > In fact, given the checks are on the final tree, naming the output fi=
le
> > >=A0=A0in the messages seems fairly logical (you could even imagine doi=
ng
> > > these checks in a separate linter tool after the fact, given the *.dtb
> > > as input, I suppose)
> >=A0
> > Hm, possible, though a bit messy to do within dtc.=A0=A0The output file=
 is
>=20
> s/is/isn't/=A0=A0duh.
>=20
> > currently passed into that section of the code, but I guess we could
> > add it.
> >=A0
> > However, it seems this would more easily be fixed from the Makefile
> > side: if you echo a (suitably abbreviated) dtc command line, then it
> > should become obvious which dtb the errors are associated with.

Not with "make -j12" sadly. I suppose people could rerun make without
the -j to figure out where the warning came from, but it seems rather
suboptimal to me.

Ian.
