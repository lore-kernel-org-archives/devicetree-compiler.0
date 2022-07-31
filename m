From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc 1.6.0 overlay full-path reference in array produces broken
 property names
Date: Sun, 31 Jul 2022 22:12:10 +1000
Message-ID: <YuZxmtlBclJnNYGO@yekko>
References: <20210927140456.4e45f05b@gmail.com>
 <YX+G6PE7fWx/x3QR@yekko>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iFz1+4yGntUEoLyZ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1659269556;
        bh=G7gw0Ruxuv1IU8iVu5GNhAhrjuIiRJJC2LL2u15QdHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pCuPNDK7ieKgvtnjn5w+IeNLzASq+8zlaMYb3rY9UepOzd9zdtBmc3jVqzy5F5+aJ
         7kiCEDs8/g0iYpncVE4kCw0tLdH53eD5cxYdmXLY+loX/7WjCguaowHEa2mXi4sM42
         ZsrmgytPLoiC9SU2NJXyPwfyx5cBMyg5Av7FNp70=
Content-Disposition: inline
In-Reply-To: <YX+G6PE7fWx/x3QR@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--iFz1+4yGntUEoLyZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 01, 2021 at 05:19:20PM +1100, David Gibson wrote:
> On Mon, Sep 27, 2021 at 02:04:56PM +0000, Vincent Pelletier wrote:
> > (please keep me cc'ed in replies)
> >=20
> > Hello,
> >=20
> > I suspect this may be a dtc bug, but I am not too familiar with
> > devicetree specs to tell.
> >=20
> > Here is a simplified example reproducing this issue:
> >=20
> > (SNIP)
> > /dts-v1/;
> > /plugin/;
> >=20
> > / {
> >   compatible =3D "foo";
> > };
> >=20
> > &{/soc/gpio@7e200000} {
> >     status =3D "okay";
> > };
> >=20
> > &{/soc/spi@7e204000} {
> >     cs-gpios =3D <&{/soc/gpio@7e200000} 8 0x01>;
> > };
> > (SNIP)
> >=20
> > This code builds fine:
> >   $ dtc -I dts -O dtb -o test.dtbo test.dts
> >   $
> > But then when disassembling the output, I get:
> >   $ dtc -I dtb -O dts test.dtbo
> >   <stdout>: ERROR (property_name_chars): /__fixups__:/soc/gpio@7e200000=
: Bad character '/' in property name
> >   ERROR: Input tree has errors, aborting (use -f to force output)
> > And forcing output:
> >   $ dtc -I dtb -O dts -f test.dtbo
> >   <stdout>: ERROR (property_name_chars): /__fixups__:/soc/gpio@7e200000=
: Bad character '/' in property name
> >   Warning: Input tree has errors, output forced
> >   /dts-v1/;
> >=20
> >   / {
> >           compatible =3D "foo";
> >=20
> >           fragment@0 {
> >                   target-path =3D "/soc/gpio@7e200000";
> >=20
> >                   __overlay__ {
> >                           status =3D "okay";
> >                   };
> >           };
> >=20
> >           fragment@1 {
> >                   target-path =3D "/soc/spi@7e204000";
> >=20
> >                   __overlay__ {
> >                           cs-gpios =3D <0xffffffff 0x08 0x01>;
> >                   };
> >           };
> >=20
> >           __fixups__ {
> >                   /soc/gpio@7e200000 =3D "/fragment@1/__overlay__:cs-gp=
ios:0";
> >           };
> >   };
> >=20
> > Indeed, the node in __fixups__ has an invalid name.
> >=20
> > I suspect this is uncommon because:
> > - it probably only occurs in overlays and not in self-contained trees,
> >   as a self-contained tree would likely produce an internal phandle and
> >   never store the full path anywhere.
> > - ...which does not attach to labels but full paths
> >   Labels being (probably ?) valid node names, they would avoid the issu=
e.
> > - ...in arrays
> >   In a node overlay, the full path ends up as a quoted string, not as a
> >   name, so it is safe.
> >=20
> > Is this a dtc bug ?
>=20
> I've looked at this again and... not really.
>=20
> Unfortunately, such a reference can't work given the specification of
> the overlay format.  The property name in fixups is the target of the
> reference, which works fine for labels, but will necessarily result in
> an invalid property name for path references.
>=20
> dtc should, of course, have a less ugly failure mode.

I finally got a chance to tackle this, and just sent out a patch which
should make this case fail on attempting to build the dtbo in the
first place, rather than later when processing the bad output.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iFz1+4yGntUEoLyZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLmcZIACgkQgypY4gEw
YSJOjBAArT2G2M5jxbP0wlgxyObxL5RWptBiIqxNx5M3gW2Q+drA0ESURd7deopA
6IK4N4VPee95sJ0hbVPwAMXtisM/Bkf4ekvvaf/jcoY8LG3ivHV/ByilAe/yVe0Q
pZFZ8V9DRoYJIbyHnnChrNJGb4kDfY6KFqcBTuAwwmW1y/R7gUc0hbgcC4uJ5Gn3
stKryO1oDIASNf5gCjCPUj9z0k7SG8midUnJ+SkUFREaBSPHQUDopPEBHBGN8J9A
urOU4okYQ+OW7A1RtM70SrQEQsuiiIxuWu/TXUWBxEI3uzzv1PQ/aNOU0+SDf2ey
9d6rXKFSb6Bal7CpqzUDG/ozKK1bi6hEUd4VQJw48SvPAfGl9PPGo3UBBPEyN6YD
S2xydJM4z1/QCMhdfM/6a9CgbdHtYMERy0p5mEwpnokTKwfCsEJAd3c9Zq4yYsu4
uiwSJn+0bYAFGc6nnJ+MnuUp5Y09p1vlhSJU97Su/EiN9ULSXYuUEo8Sibq7JdLT
hA2oqxXaVdYOA2XITh46IJDyemRK3wxULD2iU2le4c7sPcJjxCsqq1Ko90mw9eZS
5Q46J+Ne0U7lrJL9J6Cy9SW2kiJmfZheWvvbMIs/kkXbU0E/mi0hhnaj/Y0OFyED
D4PXkHRPDnqbePh9g56ZuhpqiOWeN4+4OHuXx+J5arp7BlGnSsg=
=bbkR
-----END PGP SIGNATURE-----

--iFz1+4yGntUEoLyZ--
