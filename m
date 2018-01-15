From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/5] annotations: Add position information to various
 calls
Date: Mon, 15 Jan 2018 18:36:09 +1100
Message-ID: <20180115073609.GA26066@umbus.fritz.box>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
 <1515418607-26764-3-git-send-email-Julia.Lawall@lip6.fr>
 <20180109111614.GL2131@umbus.fritz.box>
 <alpine.DEB.2.20.1801111614420.3390@hadrien>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516001774;
        bh=fuQp8bHvCANz38jMvHwbPunRuwxTIwAgQrpaIN9GV9s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GSqWMZNF8q9aW/LcymFjL9zRPcawCQcSCDnpMKbFLAEYeMvUDY/1EEPziF0v8oLe7
         nISR1Pb2ceu0KBk2XJYc8nG23REeg+nvJ73NT1DihUTUrTjUxcLEzTfH5unrO3NmgG
         KCU8BBYXPlvYc5pdI/pj0LOidydYbAh+qMgmdhU0=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1801111614420.3390@hadrien>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2018 at 04:21:44PM +0100, Julia Lawall wrote:
> > > +	old_node->srcpos =3D srcpos_copy_all(new_node_begin_srcpos);
> >
> > This doesn't seem right.  Replacing the old position with the new
> > makes sense for indivudal properties where the whole value is also
> > replaced.  But for nodes we really need to track both locations.
> >
> > I think the extra complexity here is why I didn't add this tracking
> > earlier.
>=20
> I have the following example:
>=20
> /dts-v1/;
>=20
> / {
>         #address-cells =3D < 1 >;
>         #size-cells =3D < 1 >;
>=20
>         tree_1: soc@0 {
>         	reg =3D <0x0 0x0>;
>         };
>=20
>         foo: foo_node {
>                 prop_1: added-prop =3D <0x99>;
>         };
>=20
>         bar_node {
>                 added-prop =3D <0x77>;
>         };
>=20
> };
>=20
> /include/ "test_b1.dts"
> /include/ "test_c1.dts"
>=20
> -------------------
>=20
> Then test_b1.dts and test_c1.dts are both /include/ "test_d.dts".  And
> test_d.dts is:
>=20
> / {
>         foo_node {
>                 added-prop =3D <0x1 0x2 0x3>;
>         };
>=20
>         foo_node {
>                 added-prop =3D <0x1 0x2 0x3>;
>         };
>=20
>         bar: bar_node {
>                 added-prop =3D <0x5>;
>         };
> };
>=20
> ----------
>=20
> The point of the example is that via the includes there are tw ways to
> reach test_d.dts.
>=20
> Accordingly, by accumulating a list of positions in merge_nodes, I end up=
 with:
>=20
> /dts-v1/;
>=20
> / { /* tests/test_d.dts:1, tests/test_d.dts:1, tests/test_a.dts:10 */
> 	#address-cells =3D <0x1>; /* tests/test_a.dts:11 */
> 	#size-cells =3D <0x1>; /* tests/test_a.dts:12 */
>=20
> 	tree_1: soc@0 { /* tests/test_a.dts:14 */
> 		reg =3D <0x0 0x0>; /* tests/test_a.dts:15 */
> 	}; /* tests/test_a.dts:16 */
>=20
> 	foo: foo_node { /* tests/test_d.dts:6, tests/test_d.dts:2, tests/test_d.=
dts:6, tests/test_d.dts:2, tests/test_a.dts:18 */
> 		prop_1: added-prop =3D <0x1 0x2 0x3>; /* tests/test_d.dts:7 */
> 	}; /* tests/test_d.dts:8, tests/test_d.dts:4, tests/test_d.dts:8, tests/=
test_d.dts:4, tests/test_a.dts:20 */
>=20
> 	bar: bar_node { /* tests/test_d.dts:10, tests/test_d.dts:10, tests/test_=
a.dts:22 */
> 		added-prop =3D <0x5>; /* tests/test_d.dts:11 */
> 	}; /* tests/test_d.dts:12, tests/test_d.dts:12, tests/test_a.dts:24 */
> }; /* tests/test_d.dts:13, tests/test_d.dts:13, tests/test_a.dts:26 */
>=20
> --------
>=20
> For example, in the last line, we see tests/test_d.dts:13 twice, because =
it
> is merged in twice.  Is this what is wanted?  Should it be there only onc=
e?
> Should there be some indication on how tests/test_d.dts:13 is reached?
> This is a fake example, but I saw some examples with duplicated positions
> in the Linux kernel code.

Right, that's ugly, but it's not that easy to fix.  Really we'd need
to merge/overlap each element in the list to accumulate them.  Going
back to the original proposal isn't a solution though because of cases
like this, which will be much more common that duplicated includes:

/ {
	foo {
		compatible =3D "...";
		reg =3D < .. >;
		ranges =3D < ... >;
		lots =3D ...;
		of =3D ...;
		other =3D ...;
		properties =3D ...;
	};
}

&{/foo} {
	one-tiny-change =3D "yes";
};

The original proposal would annotate the output with *only* the
location of the one-tiny-change, which is extremely misleading.  Much
worse than duplicated locations.	=09

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpcWecACgkQbDjKyiDZ
s5K4LxAAjDc8CBqU0Kyxe8Zf6Y5lxOOHN4mry530W4JnGVhM5yiotaP+yKAY3ASL
LQOeOhPP5202dcqUJHfBRsLXaWXXUgESTv6tVTkq24yBb5H4kcubt4nswFJJiKOZ
X86fwI5AkEo/s1nvZ/LmqB1EuIBzdHDhfotwKhSenHdHvA9dsGXayLsIcbh8TgcM
3YtylRncQgpsG0lr6ROqlnLoiIb2jiCxn/GVP//J8b2Yy5SBAJYPII+38sWm4tR0
SgaRFsffzA+jog9nZ1lpMeb6vkFRAxihednVaRLPR2COP3CcbW3oNUs25CaoWci1
SXkRvjGvgaNvJl/crFDfMcGX1jxKFlVZa+vZMhbhXW8XL1obf+xjQXlUd+MV2mn5
+AzMZrSZ6OzdTNGZRd79oV56sEUieZXIZ5cuCTDiJgUVXUR4NmgazBgjU6pc2vWP
Gs2NQSDWx0mp52AJgBMhrKFp3XcvzDuMAoBEgY/Ux+sNef/JY0Qvt+HuUM4dLo14
LTYqOjV1zncywvI5PJ5Zzvm82i8tC5yHITbBCvsFJpr80c98N7Bs5YKXGsEfQ1R6
Z9n7Jk6LB1CFgkterO/nJ5NRmCM9gPn2AQFZ9p/7QyqUG2n5zWqwPNP4KPoUEqSC
diLgE69PLRl+q/ZKwFbvxb/CyLE0vfgnef52ueD4PCy3Oc/P8uc=
=OwGG
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
