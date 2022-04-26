From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4] pylibfdt: add FdtRo.get_path()
Date: Tue, 26 Apr 2022 16:29:27 +1000
Message-ID: <YmeRR0n/fo07y4WF@yekko>
References: <20220419194537.63170-1-luca@z3ntu.xyz>
 <CAPnjgZ2izMUDXJ43jSOzXW7DKbuoN5j26MyKZaLn5Wt2gd28wQ@mail.gmail.com>
 <Yl92T9KL/dlQntRi@yekko>
 <11961807.O9o76ZdvQC@g550jk>
 <CAPnjgZ2CjKLrCXEcBH0vTN77d7zk29dxnmRta4tTR_Th2arBzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9PqmMzKZa19G35mJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1650955250;
        bh=eafqVwJH8B+w2UKTpChZ+c9/54eX+wjJmeB+2t5a4kc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TsXpVZAMlh6CU1fzioxXVRWcFKOwglHDoS7sbHeh+d3BQNTIdRh7PGiRdRWIF1YPp
         DXBDTR0M9+ub2cJ+sgqEYjMcitovM+GJsbSHwWVClwsKEiPKGhr92tqOZEXIFNL4R6
         bGjeoqo2pGQL6O0lb7j5PUOIGFEoTrrfkgedTUmk=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2CjKLrCXEcBH0vTN77d7zk29dxnmRta4tTR_Th2arBzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--9PqmMzKZa19G35mJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 03:29:49PM -0600, Simon Glass wrote:
> Hi Luca,
>=20
> On Wed, 20 Apr 2022 at 12:20, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> >
> > Hi Simon and David,
> >
> > On Mittwoch, 20. April 2022 04:56:15 CEST David Gibson wrote:
> > > On Tue, Apr 19, 2022 at 03:54:07PM -0600, Simon Glass wrote:
> > > > Hi Luca,
> > > >
> > > > On Tue, 19 Apr 2022 at 13:49, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > > > Add a new Python method wrapping fdt_get_path() from the C API.
> > > > >
> > > > > Also add a test for the new method.
> > > > >
> > > > > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > > > > ---
> > > > > Changes since v3:
> > > > > * add quiet parameter
> > > > > * return integer error when error is quieted
> > > > >
> > > > > Changes since v2:
> > > > > * Remove arbitrary size limit
> > > > > * Change size calculation to increase exponentially
> > > > > * Add test to verify we still get exceptions with bad parameters
> > > > >
> > > > >  pylibfdt/libfdt.i       | 28 ++++++++++++++++++++++++++++
> > > > >  tests/pylibfdt_tests.py | 13 +++++++++++++
> > > > >  2 files changed, 41 insertions(+)
> > > >
> > > > Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > >
> > > > You don't check for when it is output of space, but I think that is
> > > > OK.
> > >
> > > Right, a testcase for that would be good, but it can be a follow up.
> >
> > I don't quite understand what you mean "is output of space".
>=20
> is out of space (sorry)
>=20
> >
> > Maybe you mean a test for when the string is longer than 1024 characters
> > ("size =3D 1024") so the size increase gets triggered?
> >
> > If yes, then I did test that manually before by setting the value absur=
dly
> > low. Not sure how to properly check that in the tests though. Add a nod=
e with
> > a super long name into the test dtb?
>=20
> Another option is to add a parameter for the max size, just for
> testing, but I doubt David would like that!

Actually I'm fine with adding a "hint" size as a parameter - as long
as it's optional with a a sensible default.

> You could have a SIZE_INCREMENT =3D 1024 at the top of the file, then
> change it in a try/finally clause in your test.
>=20
> >
> > >
> > > Applied.
> >
> > Thanks!
> >
> > Regards
> > Luca
>=20
> Regards,
> Simon
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9PqmMzKZa19G35mJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJnkUAACgkQgypY4gEw
YSLumA/+L2HwB/10N57Fpj0g7+7EI+/yBp9Bcabx30eUg6bMs54goE8mtWABprkz
4UUuawOlcjwLss3UDmeYv9ItH5nYb3NVTQ7MKYIdG2wlop5AtTCNzE3QwBhMI/VC
6IlGRHh9Ugkx/cgySQo6quRkcRHDzIx2owqEPxKN6SK+lXM1IsgGFcXMyVNDc1ns
aNQjP93HVUxC0AotMOItn58UzQ53OmNUt8qDeqrqePgX5IxV6p+LKLfpaAozAkE9
IB9z4XODnstu03CR1KhtezX40GFgFvRyBXSCTVrGpvW9QEEPQA3AzJbKb4i9i5i3
fzUDO+dlgEJTOo5A85z8APWwFlOAeVYoCwuU307hecjp58YmX0T4cVNrMMIjIUUA
R97i29vditwGdGTGk6TEjEgjMlmpPQx147i/i05OUM/uW+HJM4wQ5QJ9nF0ljcCn
4wZz4fye7EMyPTnFKCkFWTiKiNEtUYE1HQRJ2mP/aAp0uC0d6SD92p186blpBcmi
JytX/9iMCOBMaorEPHKkDCdrXSvW/CCzT+VHXeAcuzq6ul7AD/fXuT0FkFQb/LEH
fJ4H3bQL7REWbUrW0RVG+FKj5YKmk+9ua0G8Kv8Z0iUCZwOZ0d0UPo8W9zr2r2r4
tb8imSgJ/LdZFzSKjKS3/4i9PZo8bxkgfSe26uXZFeACgFMqr7I=
=fPsb
-----END PGP SIGNATURE-----

--9PqmMzKZa19G35mJ--
