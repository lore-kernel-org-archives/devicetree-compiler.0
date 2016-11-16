From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] Add a libfdt function to write a property placeholder
Date: Wed, 16 Nov 2016 11:17:32 +1100
Message-ID: <20161116001732.GJ24747@umbus.fritz.box>
References: <1477353294-15212-1-git-send-email-sjg@chromium.org>
 <CAPnjgZ10ZR1sycDZYxvQs=sAM9rCV0irXatqMt0KPm-PCkQmYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Re2uCLPLNzqOLVJA"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1479257802;
        bh=NgtTbV2MVmwVXZCLldrllRe07v37xl7HmpLgCoEzaDc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kidi9M3vQVDHJVUBim1hnggGQpr7/buTEJ9xpqt8WQTWwzjEAvibaqTrx15AOfP/t
         lKYHBZKpQNsno3fzLceP0h4b/DHjhDSbgAOd7yuojxdX3SNlKKCv46aQ3R34oXd+tv
         x2tyfllZZ4x7A8yFxtg9n1fBNf0HJ0CerWz3KfRA=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ10ZR1sycDZYxvQs=sAM9rCV0irXatqMt0KPm-PCkQmYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--Re2uCLPLNzqOLVJA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2016 at 04:37:17PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On 24 October 2016 at 17:54, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > The existing function to add a new property to a tree being built requi=
res
> > that the entire contents of the new property be passed in. For some
> > applications it is more convenient to be able to add the property conte=
nts
> > later, perhaps by reading from a file. This avoids double-buffering of =
the
> > contents.
> >
> > Add a new function to support this and adjust the existing fdt_property=
() to
> > use it.
> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> >
> > Changes in v2:
> > - Add tests
> >
> >  libfdt/fdt_sw.c                    | 16 ++++++++++++++--
> >  libfdt/libfdt.h                    | 16 ++++++++++++++++
> >  tests/include7.dts                 |  1 +
> >  tests/sw_tree1.c                   |  5 +++++
> >  tests/test_tree1.dts               |  1 +
> >  tests/test_tree1_label_noderef.dts |  1 +
> >  tests/trees.S                      |  2 ++
> >  7 files changed, 40 insertions(+), 2 deletions(-)
>=20
> Did you see this one?

No, somehow I missed it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Re2uCLPLNzqOLVJA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYK6WZAAoJEGw4ysog2bOSLVEP/3H5IJWXqs20VQrQoJXVPt+u
6+Z0IcE0fbR7PL3F9v9Nn1lUFgxE1Ugo/6NQoyqSQfKmcUuEIXhjm93kIaZ6f8ou
vlutGRi+vmAphKJ+oOA1JcB3362hjoo/t6ko73EF/+JmjuwXNBIig5sVs4a9qeK6
1et6P5G1cTDOwQJIN1NM7zTKxHMuUoj7uMa5Alf3DYoK6IwnLw9W9F5fVNDJUVUV
cYY+Cqy7JjP/q7jBnwJePJjsZobeYbWKV8r4xVsb8ocRSF3ViVBTK12Led5tHfxo
afWsWF3166rzEYIJV65PiCz4oMJwTOkLV/gbxUu3xwMqBMmoJCubuEE3phNfubNQ
B/t5J+15yfnB+sJO1dftZ7J31ci3edlI6tpEJWSXGvyEizAmtmSL7H2mEecnj5h9
+SzdccuzyF8b+pC5cuZQD8rZabBEfcdWF+gNgt9TUzjq38X/MKd8bjR446cA1k5e
cC0aXdvDSVwBcRI6hrzmp31ZxorYh5eKWccVvyp37rcHdHL7plaJ3NUpXZtJeTIG
YBYSMV/VcqQqr31aQgN6pSzuONQ/m00lWDinnBKT3VzGs81zcyAb2ZwFqfpffzHS
JSoXoT++bAA86+ihK5HHYtUbe+NWY5CJ74fjd60GxTc9JZyy3Hh9e1yqH5JAbKOp
+i/U1b3arfv9hHXcw3bq
=Vnox
-----END PGP SIGNATURE-----

--Re2uCLPLNzqOLVJA--
