From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Warnings do include offending filename
Date: Wed, 1 Feb 2017 11:16:54 +1100
Message-ID: <20170201001654.GB30639@umbus.fritz.box>
References: <1485767585.7612.23.camel@hellion.org.uk>
 <20170130234932.GB14879@umbus.fritz.box>
 <1485851088.7612.32.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1485910429;
        bh=Gh0jmJqJcnT0lOG+W8+9XJr3S98u5J0jLE9nSg0O+OU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j+EgKWjaN1WoR2CZjIAt9m9jernNcUal9WjF1nElt8FyOVmi4m3FFuP0RslGnlH9d
         aaimQqZQTowP34hsXOClJDugtBBNAuVHc0UaGxAlEBAvquBUftXkD7rNuuw9k/ox+G
         kl8IvBBCsS4/YnYNm2I4tPgPTMi15pOHrVOW4adE=
Content-Disposition: inline
In-Reply-To: <1485851088.7612.32.camel-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 08:24:48AM +0000, Ian Campbell wrote:
> On Tue, 2017-01-31 at 10:49 +1100, David Gibson wrote:
> > On Mon, Jan 30, 2017 at 09:13:05AM +0000, Ian Campbell wrote:
> > > Hello,
> > >=A0
> > > I wasn't sure how/where to make a wishlist bug report, so I hope this
> > > will suffice, am happy to be pointed in a different direction though.
> > >=A0
> > > I recently[0] stumbled over around 1,000 of these:
> > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg or r=
anges property, but no unit name
> > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-oscillato=
r has a reg or ranges property, but no unit name
> > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg or r=
anges property, but no unit name
> > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg or r=
anges property, but no unit name
> > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-oscillato=
r has a reg or ranges property, but no unit name
> > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a reg or r=
anges property, but no unit name
> > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-oscillato=
r has a reg or ranges property, but no unit name
> > >=A0
> > > When building the split device tree repo[1] from the Linux source
> > > (essential it's a build of every single dts in the kernel source).
> > >=A0
> > > The cause of the warning is an issue which needs to be fixed but I
> > > thought I would mention that it would be very useful (I expect) if dtc
> > > would include the offending file in warnings (like e.g. gcc would), n=
ot
> > > just because of the number of *.dtb being built here but also due to
> > > #include and /include/ of .dtsi files.
> >=20
> > Right, having the filenames - and line numbers - there would certainly
> > be helpful.=A0=A0Unfortunately, it's not at all trivial to implement.=
=A0=A0As
> > someone said in a different thread, these checks take place (and have
> > to) after the tree is completely parsed and we no longer have source
> > locations readily to hand.
>=20
> Would it be easier (or possible) to print the name of the eventually-
> to-be-output binary? At the moment=A0the user is left guessing which one
> of 1,200 *.dtb files they just built produced each of the similar
> number of warnings. If the message was instead:
>=20
>     Warning (unit_address_vs_reg): arch/arm/boot/dts/foo.dtb: Node /soc h=
as a ...
>=20
> Then that would at least be something to go on.
>=20
> In fact, given the checks are on the final tree, naming the output file
>  in the messages seems fairly logical (you could even imagine doing
> these checks in a separate linter tool after the fact, given the *.dtb
> as input, I suppose)

Hm, possible, though a bit messy to do within dtc.  The output file is
currently passed into that section of the code, but I guess we could
add it.

However, it seems this would more easily be fixed from the Makefile
side: if you echo a (suitably abbreviated) dtc command line, then it
should become obvious which dtb the errors are associated with.

> > It might be possible to attach (optional) srcpos * markers to each
> > node and property in the live tree.=A0=A0However, that runs into other
> > complications: when using dts includes nodes can be merges of
> > information from several different dtsi files.=A0=A0So, a node can be
> > composed of information from several non-contiguous chunks of source
> > from different files.=A0=A0It's not clear what should be printed in that
> > case.
>=20
> Yeah, tricky!
>=20
> Hopefully the above suggesting will suffice for 99% of cases.

Actually, this might be made more feasible by some of the overlay
stuff in the works.  We're looking at doing the overlay merges in a
separate pass after parsing is complete.  There are some interesting
edge cases about whether checks get run before or after that merge,
but I'm hoping most of the checks can run before.  For those that do,
we should have a well defined chunk of source from which each node and
property comes.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYkSj2AAoJEGw4ysog2bOSt+EQAOKRdy1eTAkzdarQWjRga6RH
P+AA49WuoXrYVgDDK5JdmMgHmgSh1jdMGFRIJBX1W/M/W0W2mkD0wH462PMh8DdY
u3IBzyNM4My/NP3EBlPOxKuXvC49Yx+LASHkxN7tAo+RSl328q9zL9etzviXHZBs
+YSTwfQXl9crsxkWqC8vqlNv8YYrXsJHhbytY76QtCeP8IDvmLe5IwzVJyh1DMNj
5l/w/sA2SGWA5rqlbvhK0i6IwI/EutITrqdzZoK9iScTfwvFc1lEXVdn1ABn8Ycg
uYU7qg/+WbcabxhPXEZacCzDGICKkHXyS6xZohJtMkX49ab7PKq5D975dTmX6ZjT
KjAvDELIoS7Q3yAdzRBWgYLyoSpRRWnU8T3SWyO0cSzElckFYQEHWPmxjKGsrRnu
5lOFJ5So4XbQ9L1RFMsePPYV/K/FFBWMdOWiC4VNb3jjw8W9bqk3fv1eUfXYSmE2
itX5kwi44FiAHBsDSH4ov7mIB6LUFFadz4ZyWVizXtLiBLzUKv6L4b5lX+FyCfsF
dAJ7ko1WxVTTYRCTvFyHMBnSMrys3PN9NPSdKaDR7eaca1nvKFdn5PUETFWvIDUE
bvHnHU3zA5HfACmMFq/+embcdRP373/b17bKg9jOeUYAR0UQs/qoxrjyV0H2UAHq
KX47yzzA+PT70ONwgo68
=BZhA
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
