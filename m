From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc 1.6.0 overlay full-path reference in array produces broken
 property names
Date: Mon, 1 Nov 2021 17:19:20 +1100
Message-ID: <YX+G6PE7fWx/x3QR@yekko>
References: <20210927140456.4e45f05b@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9YqUeua5/if++q3Y"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1635747569;
        bh=Uf34rZ8Vf+hHEKNlsulEggGzfQN+4h3x3BVu4iF0QIk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ByDtgUkVRy3LeT1R4ISLROJT2IDYx2wZEDdV6t6uh1jpPs/Y04UM9/75QLb79yLnE
         McJFx9cTqmp+eQMcSBFcoxF2qwNhVLyUdHgM09FI+1rDuzjqn8lYh2gDcQK5pbOz7u
         wsgq8PTQ+UeHjaKF/atY3H1fDWkjDRd2cI14p6FM=
Content-Disposition: inline
In-Reply-To: <20210927140456.4e45f05b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--9YqUeua5/if++q3Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 02:04:56PM +0000, Vincent Pelletier wrote:
> (please keep me cc'ed in replies)
>=20
> Hello,
>=20
> I suspect this may be a dtc bug, but I am not too familiar with
> devicetree specs to tell.
>=20
> Here is a simplified example reproducing this issue:
>=20
> (SNIP)
> /dts-v1/;
> /plugin/;
>=20
> / {
>   compatible =3D "foo";
> };
>=20
> &{/soc/gpio@7e200000} {
>     status =3D "okay";
> };
>=20
> &{/soc/spi@7e204000} {
>     cs-gpios =3D <&{/soc/gpio@7e200000} 8 0x01>;
> };
> (SNIP)
>=20
> This code builds fine:
>   $ dtc -I dts -O dtb -o test.dtbo test.dts
>   $
> But then when disassembling the output, I get:
>   $ dtc -I dtb -O dts test.dtbo
>   <stdout>: ERROR (property_name_chars): /__fixups__:/soc/gpio@7e200000: =
Bad character '/' in property name
>   ERROR: Input tree has errors, aborting (use -f to force output)
> And forcing output:
>   $ dtc -I dtb -O dts -f test.dtbo
>   <stdout>: ERROR (property_name_chars): /__fixups__:/soc/gpio@7e200000: =
Bad character '/' in property name
>   Warning: Input tree has errors, output forced
>   /dts-v1/;
>=20
>   / {
>           compatible =3D "foo";
>=20
>           fragment@0 {
>                   target-path =3D "/soc/gpio@7e200000";
>=20
>                   __overlay__ {
>                           status =3D "okay";
>                   };
>           };
>=20
>           fragment@1 {
>                   target-path =3D "/soc/spi@7e204000";
>=20
>                   __overlay__ {
>                           cs-gpios =3D <0xffffffff 0x08 0x01>;
>                   };
>           };
>=20
>           __fixups__ {
>                   /soc/gpio@7e200000 =3D "/fragment@1/__overlay__:cs-gpio=
s:0";
>           };
>   };
>=20
> Indeed, the node in __fixups__ has an invalid name.
>=20
> I suspect this is uncommon because:
> - it probably only occurs in overlays and not in self-contained trees,
>   as a self-contained tree would likely produce an internal phandle and
>   never store the full path anywhere.
> - ...which does not attach to labels but full paths
>   Labels being (probably ?) valid node names, they would avoid the issue.
> - ...in arrays
>   In a node overlay, the full path ends up as a quoted string, not as a
>   name, so it is safe.
>=20
> Is this a dtc bug ?

I've looked at this again and... not really.

Unfortunately, such a reference can't work given the specification of
the overlay format.  The property name in fixups is the target of the
reference, which works fine for labels, but will necessarily result in
an invalid property name for path references.

dtc should, of course, have a less ugly failure mode.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9YqUeua5/if++q3Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmF/huYACgkQbDjKyiDZ
s5K0VRAApBGHi0RCdmUKwe2POFbQ4L61Qt99xEZ1qfrwbQi1oHH77GNzFso8mgeK
fxcyEVayYfddxIBrd7p31OWqYsIfX9mitaNsvhu96j1dq7zdXDD09Co5to4VEPcp
lrebSgZcw4D6k4aWL0eSBvlV4IwiYZav/TpbW1ZcTZor/tCHoeRmjEaq+g2DMCR4
PygkAAzoIHqfAP8rWaGdPSX9hjKXkGqFQewksSMIn/mdAzqGILxJ2v7veoWXmD6T
L6wjB8RbEbuf5xeTL3WOSrZaByafXVofLu8J1J/uGEsz/Oj8D/S8+/g15r/YSTgp
XdP3RohD15czPxMe5FlZU4Ussz8ILTGHv3CZC2EVwEc+5DfGuNM19ow/k9mU5Kmr
ZdmmblXt5aD+l39B2SG6CSsPP7SjegFyi2XayTu9N8Chha+Y0KAjua3Z4eXDYFRD
ra2FaZ10jfpoWWboX+CZRVvSv6EsONud4y/oiaZPv+D4a+ax8wBWXPhDqdC3omx1
sHsBqfEktSY8I9UtIuhuZL1rojAXdbqaz5w8HWHNlm9RSyG2k4vE6qVKi0/UdKxg
+AY1PPEyFhcsAkbVlojX+iGCTGx0BdoefuYzYDTjRRiL5gZji83wLLlpqXtMOuAT
oRhgS7ZBS3oBw6bu07Q7DaPe09VPhq1oKZaaKyAz539FYp0MLSQ=
=CwPo
-----END PGP SIGNATURE-----

--9YqUeua5/if++q3Y--
