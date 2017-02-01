From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Warnings do include offending filename
Date: Wed, 1 Feb 2017 12:00:04 +1100
Message-ID: <20170201010004.GG30639@umbus.fritz.box>
References: <1485767585.7612.23.camel@hellion.org.uk>
 <20170130234932.GB14879@umbus.fritz.box>
 <1485851088.7612.32.camel@hellion.org.uk>
 <20170201001654.GB30639@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Sw7tCqrGA+HQ0/zt"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1485910810;
        bh=hJkJd1M6qeupKqwhLcYmkU0pTmoBubKOTECi6vzuEA8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UytXCztZxM4vSvcJkZmnfM0rwGrhXKS9Y/ykRbaHSaipSErNTVyiOB/P0XK+FDQWC
         rdNkdXgQ9BSq4kWJyccAECjeSrfokJRAY3njiLPzXHU3Mc9seJLq80KeJXxRakvmGr
         5/fCFgaJEpLZzY39LKH1XgOyOZ5SnDmRyAej3taU=
Content-Disposition: inline
In-Reply-To: <20170201001654.GB30639-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Sw7tCqrGA+HQ0/zt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2017 at 11:16:54AM +1100, David Gibson wrote:
> On Tue, Jan 31, 2017 at 08:24:48AM +0000, Ian Campbell wrote:
> > On Tue, 2017-01-31 at 10:49 +1100, David Gibson wrote:
> > > On Mon, Jan 30, 2017 at 09:13:05AM +0000, Ian Campbell wrote:
> > > > Hello,
> > > >=A0
> > > > I wasn't sure how/where to make a wishlist bug report, so I hope th=
is
> > > > will suffice, am happy to be pointed in a different direction thoug=
h.
> > > >=A0
> > > > I recently[0] stumbled over around 1,000 of these:
> > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg or=
 ranges property, but no unit name
> > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-oscilla=
tor has a reg or ranges property, but no unit name
> > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg or=
 ranges property, but no unit name
> > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg or=
 ranges property, but no unit name
> > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-oscilla=
tor has a reg or ranges property, but no unit name
> > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg or=
 ranges property, but no unit name
> > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-oscilla=
tor has a reg or ranges property, but no unit name
> > > >=A0
> > > > When building the split device tree repo[1] from the Linux source
> > > > (essential it's a build of every single dts in the kernel source).
> > > >=A0
> > > > The cause of the warning is an issue which needs to be fixed but I
> > > > thought I would mention that it would be very useful (I expect) if =
dtc
> > > > would include the offending file in warnings (like e.g. gcc would),=
 not
> > > > just because of the number of *.dtb being built here but also due to
> > > > #include and /include/ of .dtsi files.
> > >=20
> > > Right, having the filenames - and line numbers - there would certainly
> > > be helpful.=A0=A0Unfortunately, it's not at all trivial to implement.=
=A0=A0As
> > > someone said in a different thread, these checks take place (and have
> > > to) after the tree is completely parsed and we no longer have source
> > > locations readily to hand.
> >=20
> > Would it be easier (or possible) to print the name of the eventually-
> > to-be-output binary? At the moment=A0the user is left guessing which one
> > of 1,200 *.dtb files they just built produced each of the similar
> > number of warnings. If the message was instead:
> >=20
> >     Warning (unit_address_vs_reg): arch/arm/boot/dts/foo.dtb: Node /soc=
 has a ...
> >=20
> > Then that would at least be something to go on.
> >=20
> > In fact, given the checks are on the final tree, naming the output file
> >  in the messages seems fairly logical (you could even imagine doing
> > these checks in a separate linter tool after the fact, given the *.dtb
> > as input, I suppose)
>=20
> Hm, possible, though a bit messy to do within dtc.  The output file is

s/is/isn't/  duh.

> currently passed into that section of the code, but I guess we could
> add it.
>=20
> However, it seems this would more easily be fixed from the Makefile
> side: if you echo a (suitably abbreviated) dtc command line, then it
> should become obvious which dtb the errors are associated with.
>=20
> > > It might be possible to attach (optional) srcpos * markers to each
> > > node and property in the live tree.=A0=A0However, that runs into other
> > > complications: when using dts includes nodes can be merges of
> > > information from several different dtsi files.=A0=A0So, a node can be
> > > composed of information from several non-contiguous chunks of source
> > > from different files.=A0=A0It's not clear what should be printed in t=
hat
> > > case.
> >=20
> > Yeah, tricky!
> >=20
> > Hopefully the above suggesting will suffice for 99% of cases.
>=20
> Actually, this might be made more feasible by some of the overlay
> stuff in the works.  We're looking at doing the overlay merges in a
> separate pass after parsing is complete.  There are some interesting
> edge cases about whether checks get run before or after that merge,
> but I'm hoping most of the checks can run before.  For those that do,
> we should have a well defined chunk of source from which each node and
> property comes.
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Sw7tCqrGA+HQ0/zt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYkTMUAAoJEGw4ysog2bOS0D8P/0tW/GkphX53KeyaHSbIW3R5
GAE7CC401QC0WUdznvvxYv1Anid7OpBmuKxPvUMQrEcp8CZc3rz3MNI4dLbrOLxE
dC9ppctW7+eOsTn8f0Bd1ebGLv/BRyaFo834S81csw8WOjzjAmnxopgcr48IRI62
tb5z/hlkphSA4kH0RMpkBfLPnGyJ7TquMx3nPYzTAlWFqvth+yM0g61tAO0Qb6lc
r34B0eWizIyY0E9OHui8xzHOhIgdr1EyI//iKs1auI6rYdC4s/1FdhDmaGHLbELy
jRycDFvaNVjSwGy8jSTv73xTI5rAzDyvVfThPZZwWd0WBnwwVbGcxZYmFogqgtAv
jeWJA06mSoOugax39iy4+ntiDGbGMA+viq2oOsoFCzMuZlQeYtiYu3UWdo+hySCj
05I3krcz7ZJvkFTxda7h5z0HNqKHq/3FyuI3WaV6QlMqvfuQzcFnK59Ub+dUQ6ql
VNbR3GZ0qNjrfYu6zlRDct1qG7FkpjUwDiN+nTO0sIerJDKpdAmr9ZqwmdDPY8Gd
K5cwX/gxahpJB7KqsjmCM3PcvOkRFt6ZyKcU//m0OZgvZKsCmImzbr12inwy0GHz
Sj7Oekq7N7bL4Lp+rBCUkV7uulIjEswmyb+ox9i26jI8HlcipOgJsNdrq1TBaF7f
VA90hjjsmBtllz8Eo38f
=F5j4
-----END PGP SIGNATURE-----

--Sw7tCqrGA+HQ0/zt--
