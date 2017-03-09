From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/5] tests: Make realloc_fdt() really allocate *fdt
Date: Thu, 9 Mar 2017 12:35:53 +1100
Message-ID: <20170309013553.GN19967@umbus.fritz.box>
References: <20170304132647.23286-1-nicolas.iooss_linux@m4x.org>
 <20170304132647.23286-3-nicolas.iooss_linux@m4x.org>
 <CAPnjgZ0=jfYeYZSZUeQRf00wyHaQwDBRYvqAQqO6Bu0B2VA5NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eGLW8NzjjVmDHwQh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1489028393;
        bh=7ALRMFcpOklPo1HXzUbrIomLpUEuPSwO3S+sFQXhzYg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LUtffCno47M0206CGyKbRU3kU394pNrDmJW2uz3ABoK5f/v9C6p+c5aY9pn1XioS+
         kIunYQ/org/eFeKoZ8NidE8cRJg7RXrJsVp5iavwkCvMPrmrAqmoRkiIGaTTttwyB0
         0/0swPo8S8Rf6NOokEev7fyeRKLDWFBJE85Fs5UU=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0=jfYeYZSZUeQRf00wyHaQwDBRYvqAQqO6Bu0B2VA5NA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--eGLW8NzjjVmDHwQh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 02:01:47PM -0700, Simon Glass wrote:
> On 4 March 2017 at 06:26, Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org> wro=
te:
> > This bug has been found by using clang Static Analyzer: it reported that
> > the value stored to fdt was never read.
> >
> > Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
> > ---
> >  tests/sw_tree1.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> I suggest changing the code in main() so it starts with a 0 size. Then
> the test would catch this problem.

Ah, yes, I was going to suggest this when I reviewed the series, but
then I forgot.

>=20
> >
> > diff --git a/tests/sw_tree1.c b/tests/sw_tree1.c
> > index 6d4c53102967..4887dc3e1172 100644
> > --- a/tests/sw_tree1.c
> > +++ b/tests/sw_tree1.c
> > @@ -42,14 +42,14 @@ static void realloc_fdt(void **fdt, size_t *size, b=
ool created)
> >         switch (alloc_mode) {
> >         case FIXED:
> >                 if (!(*fdt))
> > -                       fdt =3D xmalloc(*size);
> > +                       *fdt =3D xmalloc(*size);
> >                 else
> >                         FAIL("Ran out of space");
> >                 return;
> >
> >         case RESIZE:
> >                 if (!(*fdt)) {
> > -                       fdt =3D xmalloc(SPACE);
> > +                       *fdt =3D xmalloc(SPACE);
> >                 } else if (*size < SPACE) {
> >                         *size +=3D 1;
> >                         fdt_resize(*fdt, *fdt, *size);
> >

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eGLW8NzjjVmDHwQh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYwLF4AAoJEGw4ysog2bOSQcoP/3HV8cCVuFSL/qtUZ7S0RF6W
eZ24WyPqZSmmhNT7x6zjkabfnyqSjaEY3e26F+Bm3pGAo58CKrlCJNkVxAGbM1GM
NAsqzcrWF/oXKiB37awNCSTVmLeTc5V+lpGxQsUn1WijDX2R4HyPHqh6RAQOX8l+
IV8Q7aN8zeP+k47p5OmQ//z4cqTaNGVtqQ8PsPiGzxmojoveNkHjBzMIowKeU4E6
OlzM1LGRDFAVRMncObS694cr3k8FVXBqur/df+RjLodzZZv2O1zwAvppjniBRmNH
uQCZvuAKiWePJoJcTkQkjUTtTsNrRh3TgLwOI8NE1WkT0/zepxA9jr2B+IctSz1X
1l4JpZ/sCB8b8e4XQy6JmXoq16p7CPM7rjrMZE5H8S5m4YqKh7/OqQU6IxIbKwLW
Df579St4BffnjFeEHhMnnVDxX3u3vkd/lXzdyK5zE3qpHIkbO/JPa4Z7RmLmHTjQ
5eQSxP1l+nmGwax+sRADjKNVN49w11ZK7Ert8ltlW37fy4MW0wFZf28GBLN0g3Nm
6D31wh18SyXIExM6/nRFji+ypydVlnTpJ/Qd2Al15f2IilMQCy+QZARPcX3kOjc+
eRYHnq5+uN6/UJDHbrSmw41PAKyaLd0V6IhWKYg0k6Z9zbu5d1/Fy2g2xG/yL1h7
jUkSuoBx358drcrFhK1a
=8/We
-----END PGP SIGNATURE-----

--eGLW8NzjjVmDHwQh--
