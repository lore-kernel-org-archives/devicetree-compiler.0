From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: Warnings do include offending filename
Date: Tue, 31 Jan 2017 08:24:48 +0000
Message-ID: <1485851088.7612.32.camel@hellion.org.uk>
References: <1485767585.7612.23.camel@hellion.org.uk>
         <20170130234932.GB14879@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170130234932.GB14879-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, 2017-01-31 at 10:49 +1100, David Gibson wrote:
> On Mon, Jan 30, 2017 at 09:13:05AM +0000, Ian Campbell wrote:
> > Hello,
> >=A0
> > I wasn't sure how/where to make a wishlist bug report, so I hope this
> > will suffice, am happy to be pointed in a different direction though.
> >=A0
> > I recently[0] stumbled over around 1,000 of these:
> >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg or ran=
ges property, but no unit name
> >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-oscillator =
has a reg or ranges property, but no unit name
> >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg or ran=
ges property, but no unit name
> >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg or ran=
ges property, but no unit name
> >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-oscillator =
has a reg or ranges property, but no unit name
> >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg or ran=
ges property, but no unit name
> >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-oscillator =
has a reg or ranges property, but no unit name
> >=A0
> > When building the split device tree repo[1] from the Linux source
> > (essential it's a build of every single dts in the kernel source).
> >=A0
> > The cause of the warning is an issue which needs to be fixed but I
> > thought I would mention that it would be very useful (I expect) if dtc
> > would include the offending file in warnings (like e.g. gcc would), not
> > just because of the number of *.dtb being built here but also due to
> > #include and /include/ of .dtsi files.
>=20
> Right, having the filenames - and line numbers - there would certainly
> be helpful.=A0=A0Unfortunately, it's not at all trivial to implement.=A0=
=A0As
> someone said in a different thread, these checks take place (and have
> to) after the tree is completely parsed and we no longer have source
> locations readily to hand.

Would it be easier (or possible) to print the name of the eventually-
to-be-output binary? At the moment=A0the user is left guessing which one
of 1,200 *.dtb files they just built produced each of the similar
number of warnings. If the message was instead:

    Warning (unit_address_vs_reg): arch/arm/boot/dts/foo.dtb: Node /soc has=
 a ...

Then that would at least be something to go on.

In fact, given the checks are on the final tree, naming the output file
 in the messages seems fairly logical (you could even imagine doing
these checks in a separate linter tool after the fact, given the *.dtb
as input, I suppose)

> It might be possible to attach (optional) srcpos * markers to each
> node and property in the live tree.=A0=A0However, that runs into other
> complications: when using dts includes nodes can be merges of
> information from several different dtsi files.=A0=A0So, a node can be
> composed of information from several non-contiguous chunks of source
> from different files.=A0=A0It's not clear what should be printed in that
> case.

Yeah, tricky!

Hopefully the above suggesting will suffice for 99% of cases.

Ian
