From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/5] annotations: Add position information to various
 calls
Date: Tue, 16 Jan 2018 19:33:34 +1100
Message-ID: <20180116083334.GI30352@umbus.fritz.box>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
 <1515418607-26764-3-git-send-email-Julia.Lawall@lip6.fr>
 <20180109111614.GL2131@umbus.fritz.box>
 <alpine.DEB.2.20.1801111614420.3390@hadrien>
 <20180115073609.GA26066@umbus.fritz.box>
 <alpine.DEB.2.20.1801151026410.3305@hadrien>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SdaPbLtAangIkrMZ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516091618;
        bh=pwRslx0MhZtwazV6xKLWL7Ke8AuEQGrMypLDU4Jh8kA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PLXRE8w2bC+c5PaltvKD4fOHRyeDPYCvRvf1yDuh5haBsCKoqX87/N0uj4G14gb85
         u2fAzlRufkXe4nMZsky/iDx4C8rKo1/8bBF6FGmcX5G6LmCBQDlj7ntjmhuFtWL7mx
         wT3V3jcsyVpjL5MpmFmQWFBkjbYZhqLHtS1h/L08=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1801151026410.3305@hadrien>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--SdaPbLtAangIkrMZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2018 at 10:28:38AM +0100, Julia Lawall wrote:
>=20
>=20
> On Mon, 15 Jan 2018, David Gibson wrote:
>=20
> > On Thu, Jan 11, 2018 at 04:21:44PM +0100, Julia Lawall wrote:
> > > > > +	old_node->srcpos =3D srcpos_copy_all(new_node_begin_srcpos);
> > > >
> > > > This doesn't seem right.  Replacing the old position with the new
> > > > makes sense for indivudal properties where the whole value is also
> > > > replaced.  But for nodes we really need to track both locations.
> > > >
> > > > I think the extra complexity here is why I didn't add this tracking
> > > > earlier.
> > >
> > > I have the following example:
> > >
> > > /dts-v1/;
> > >
> > > / {
> > >         #address-cells =3D < 1 >;
> > >         #size-cells =3D < 1 >;
> > >
> > >         tree_1: soc@0 {
> > >         	reg =3D <0x0 0x0>;
> > >         };
> > >
> > >         foo: foo_node {
> > >                 prop_1: added-prop =3D <0x99>;
> > >         };
> > >
> > >         bar_node {
> > >                 added-prop =3D <0x77>;
> > >         };
> > >
> > > };
> > >
> > > /include/ "test_b1.dts"
> > > /include/ "test_c1.dts"
> > >
> > > -------------------
> > >
> > > Then test_b1.dts and test_c1.dts are both /include/ "test_d.dts".  And
> > > test_d.dts is:
> > >
> > > / {
> > >         foo_node {
> > >                 added-prop =3D <0x1 0x2 0x3>;
> > >         };
> > >
> > >         foo_node {
> > >                 added-prop =3D <0x1 0x2 0x3>;
> > >         };
> > >
> > >         bar: bar_node {
> > >                 added-prop =3D <0x5>;
> > >         };
> > > };
> > >
> > > ----------
> > >
> > > The point of the example is that via the includes there are tw ways to
> > > reach test_d.dts.
> > >
> > > Accordingly, by accumulating a list of positions in merge_nodes, I en=
d up with:
> > >
> > > /dts-v1/;
> > >
> > > / { /* tests/test_d.dts:1, tests/test_d.dts:1, tests/test_a.dts:10 */
> > > 	#address-cells =3D <0x1>; /* tests/test_a.dts:11 */
> > > 	#size-cells =3D <0x1>; /* tests/test_a.dts:12 */
> > >
> > > 	tree_1: soc@0 { /* tests/test_a.dts:14 */
> > > 		reg =3D <0x0 0x0>; /* tests/test_a.dts:15 */
> > > 	}; /* tests/test_a.dts:16 */
> > >
> > > 	foo: foo_node { /* tests/test_d.dts:6, tests/test_d.dts:2, tests/tes=
t_d.dts:6, tests/test_d.dts:2, tests/test_a.dts:18 */
> > > 		prop_1: added-prop =3D <0x1 0x2 0x3>; /* tests/test_d.dts:7 */
> > > 	}; /* tests/test_d.dts:8, tests/test_d.dts:4, tests/test_d.dts:8, te=
sts/test_d.dts:4, tests/test_a.dts:20 */
> > >
> > > 	bar: bar_node { /* tests/test_d.dts:10, tests/test_d.dts:10, tests/t=
est_a.dts:22 */
> > > 		added-prop =3D <0x5>; /* tests/test_d.dts:11 */
> > > 	}; /* tests/test_d.dts:12, tests/test_d.dts:12, tests/test_a.dts:24 =
*/
> > > }; /* tests/test_d.dts:13, tests/test_d.dts:13, tests/test_a.dts:26 */
> > >
> > > --------
> > >
> > > For example, in the last line, we see tests/test_d.dts:13 twice, beca=
use it
> > > is merged in twice.  Is this what is wanted?  Should it be there only=
 once?
> > > Should there be some indication on how tests/test_d.dts:13 is reached?
> > > This is a fake example, but I saw some examples with duplicated posit=
ions
> > > in the Linux kernel code.
> >
> > Right, that's ugly, but it's not that easy to fix.  Really we'd need
> > to merge/overlap each element in the list to accumulate them.  Going
> > back to the original proposal isn't a solution though because of cases
> > like this, which will be much more common that duplicated includes:
> >
> > / {
> > 	foo {
> > 		compatible =3D "...";
> > 		reg =3D < .. >;
> > 		ranges =3D < ... >;
> > 		lots =3D ...;
> > 		of =3D ...;
> > 		other =3D ...;
> > 		properties =3D ...;
> > 	};
> > }
> >
> > &{/foo} {
> > 	one-tiny-change =3D "yes";
> > };
> >
> > The original proposal would annotate the output with *only* the
> > location of the one-tiny-change, which is extremely misleading.  Much
> > worse than duplicated locations.
>=20
> It's only the label on the braces that is affected.  compatible, reg, etc
> should still have their original locations.

Sure, it'll be ok if the errors are able to reference a specific
property.  But we can't really count on that - it seems likely that
there will be errors which refer to a node, but can't really point at
a specific property as the problem.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SdaPbLtAangIkrMZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpduNwACgkQbDjKyiDZ
s5JJzBAA1bUaSrwNMwVT4mrfk2JEvTAVXxHi0umkrLyqvMgxx5K8T/AA09Uu7YZI
h3l1Fw0FH7M6f0rM8WY0oeng2hi3YW7QEG47Ff8EpZV472RtueJ86x7cFWBRSqNA
OdGUtV4q9UE71nu2wDHh2ynLVNEMjGIHDFMRmKptJ7yAiFrZAqZ/LJy4PCsH1U9l
EsfP06ph/yPCyh+HmstcuPzPEOEer7S75ZtqApUvlZ6POV3znH/fLCgcJvVWZxLW
TT/7tAXkix5tWOwcNsb+9Ee6R44y7FU/9oVszLnFNC6Fb6zI5Jt/kPey+ghCtD+X
Ed/KFTVoqKh10aXBHMvMzl/aSD99RRxgM0rzfzexTMOKLu3RhdGDDKyrKYn3TwbA
YcCclge+IqTFBUbbTjqfVqbxxKF0z+gaQFV0qIGcCqxwK7N7TZ5xaoaexyt65h57
6Bikr0cg2VFf5o4wEJI7dv7O1lTeeS/2jbeI3yYyZqMFC0IsSLjOCZGhLRmiRfLv
46TFHftg4UgU7qsBbSlTNIAbH/XPLwVmPb3wnfLxMH5EZERxKaNivGZ8sEihuZli
45WuU+Qbh6bOK3ori5U+Wa+fkalYK2tEzSiV9qUFNarVpfOinYv9lqbOwlpQfSfP
gAEIr9O6SsNzU8uBc/KaHjtumrcysW2VvjRoXM1ERL+330tKvnw=
=fNj7
-----END PGP SIGNATURE-----

--SdaPbLtAangIkrMZ--
