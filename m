From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 1/5] Add an initial Python library for libfdt
Date: Wed, 22 Feb 2017 12:15:07 +1100
Message-ID: <20170222011507.GE12577@umbus.fritz.box>
References: <20170215035200.29934-1-sjg@chromium.org>
 <20170215035200.29934-2-sjg@chromium.org>
 <20170215052942.GI12369@umbus.fritz.box>
 <CAPnjgZ2SK-WRkeZwzjh+gA_zB0GiNFyVyer4zA_k9LUdXRV94Q@mail.gmail.com>
 <20170220033726.GN12644@umbus.fritz.box>
 <CAPnjgZ2hWsfm7PoNReLt7cAk=OiZBzwERFQnb-utF4fWMuUXgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487727282;
        bh=7GHcMmooaN39Cxv/iDX0QF3ys0Kqp9QsMGBGLO4mgmQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JuebbhJqdcnH1QMeY2n98r1BizDUBS0BckoaxCu0bThajYvlXigdicSZt649yBB+8
         m4UYyH12LDsKwerfMLgNvN4Hzs9gRpXQgcduLc1z4tN3dVyYRjPoBRfHtAWjWUMiNG
         YUm2Ijv9ZfK+h2SqpFMDRVhc7sTmPudxWqrwPydY=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2hWsfm7PoNReLt7cAk=OiZBzwERFQnb-utF4fWMuUXgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2017 at 11:07:58AM -0700, Simon Glass wrote:
> Hi David,
>=20
> On 19 February 2017 at 20:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> > On Thu, Feb 16, 2017 at 09:48:22PM -0700, Simon Glass wrote:
> >> Hi David,
> >>
> >> On 14 February 2017 at 22:29, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6iEOx6SR5NKn@public.gmane.org=
u> wrote:
> >> > On Tue, Feb 14, 2017 at 08:51:56PM -0700, Simon Glass wrote:
> >> >> Add Python bindings for a bare-bones set of libfdt functions. These=
 allow
> >> >> navigating the tree and reading node names and properties.
> >> >>
> >> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> >> ---
> >> >>
> >> >> Changes in v5:
> >> >> - Use a 'quiet' parameter instead of quiet versions of functions
> >> >> - Add a Property object to hold a property's name and value
> >> >> - Drop the data() and string() functions which are not needed now
> >> >> - Rename pylibfdt_copy_data() tp pylibfdt_copy_value()
> >> >> - Change order of libfdt.h inclusion to avoid #ifdef around libfdt =
macros
> >> >> - Drop fdt_offset_ptr() and fdt_getprop_namelen() from the swig int=
erface
> >> >> - Use $(SWIG) to call swig from the Makefile
> >> >> - Review function comments
> >> >>
> >> >> Changes in v4:
> >> >> - Make the library less pythonic to avoid a shaky illusion
> >> >> - Drop classes for Node and Prop, along with associated methods
> >> >> - Include libfdt.h instead of repeating it
> >> >> - Add support for fdt_getprop()
> >> >> - Bring in all libfdt functions (but Python support is missing for =
many)
> >> >> - Add full comments for Python methods
> >> >>
> >> >> Changes in v3:
> >> >> - Make the library more pythonic
> >> >> - Add classes for Node and Prop along with methods
> >> >> - Add an exception class
> >> >> - Use Python to generate exeptions instead of SWIG
> >> >>
> >> >> Changes in v2:
> >> >> - Add exceptions when functions return an error
> >> >> - Correct Python naming to following PEP8
> >> >> - Use a class to encapsulate the various methods
> >> >> - Include fdt.h instead of redefining struct fdt_property
> >> >> - Use bytearray to avoid the SWIG warning 454
> >> >> - Add comments
> >> >>
> >> >>  Makefile                   |   1 +
> >> >>  pylibfdt/.gitignore        |   3 +
> >> >>  pylibfdt/Makefile.pylibfdt |  18 ++
> >> >>  pylibfdt/libfdt.swig       | 465 +++++++++++++++++++++++++++++++++=
++++++++++++
> >> >>  pylibfdt/setup.py          |  34 ++++
> >> >>  5 files changed, 521 insertions(+)
> >> >>  create mode 100644 pylibfdt/.gitignore
> >> >>  create mode 100644 pylibfdt/Makefile.pylibfdt
> >> >>  create mode 100644 pylibfdt/libfdt.swig
> >> >>  create mode 100644 pylibfdt/setup.py
> >> >>
> >>
> >> [..]
> >>
> >> >> +def check_err_null(val, quiet=3D[]):
> >> >> +    """Raise an error if the return value is NULL
> >> >> +
> >> >> +    This is used to check for a NULL return value from certain lib=
fdt C
> >> >> +    functions
> >> >> +
> >> >> +    Args:
> >> >> +        val: Return value from a libfdt function
> >> >> +        quiet: Errors to ignore (empty to raise on all errors)
> >> >> +
> >> >> +    Returns:
> >> >> +        val if val is a list, None if not
> >> >> +
> >> >> +    Raises
> >> >> +        FdtException if val indicates an error was reported and th=
e error
> >> >> +        is not in @quiet.
> >> >> +    """
> >> >> +    # Normally a tuple is returned which contains the data and its=
 length.
> >> >
> >> > Is it a tuple returned..?
> >> >
> >> >> +    # If we get just an integer error code, it means the function =
failed.
> >> >> +    if not isinstance(val, list):
> >> >
> >> > ..or a list?  Seems like either the comment or the code must be
> >> > incorrect here.
> >>
> >> OK.
> >>
> >> >
> >> > Come to that, what is it tells swig to map fdt_propery_by_offset() a=
nd
> >> > the like to the pair of values?  How does it know how to detect the
> >> > error cases?
> >> >
> >> > From the usage, I take it that in the success case val[0] is a string
> >> > or bytearray containing the relevant chunk of data.  Remind me what
> >> > the second value is?
> >>
> >> It's the length, or error number. The final arg to
> >> fdt_get_property_by_offset() is int *len.
> >
> > Ok.  Why is it sometimes a tuple and sometimes a bare error value
> > then?  I would have expect it to always return a 2-tuple, the first
> > being the return value (maybe NULL/None) and the second being the
> > len/err value returned by reference.
> >
> > I guess that's a swig question rather than  question for you, though.
>=20
> Well it's just the way that it seems to work. I think it makes some
> sense in that we don't want to return a NULL pointer into Python. But
> I agree it is a bit odd and it took me a while to get used to it.

I suppose so.  Although None seems a pretty obvious way to translate
the NULL as well.

> Here is the generated code. I'm not sure what SWIG_IsTmpObj() does exactl=
y...
>=20
>   result =3D (struct fdt_property *)fdt_get_property_by_offset((void
> const *)arg1,arg2,arg3);
>   resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result),
> SWIGTYPE_p_fdt_property, 0 |  0 );
>   if (SWIG_IsTmpObj(res3)) {
>     resultobj =3D SWIG_Python_AppendOutput(resultobj, SWIG_From_int((*arg=
3)));
>   } else {
>     int new_flags =3D SWIG_IsNewObj(res3) ? (SWIG_POINTER_OWN |  0 ) :  0=
 ;
>     resultobj =3D SWIG_Python_AppendOutput(resultobj,
> SWIG_NewPointerObj((void*)(arg3), SWIGTYPE_p_int, new_flags));
>   }

Thanks for the info.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYrOYbAAoJEGw4ysog2bOSjkgP/jfJBUJyvSAbaTQnRRxbAnYV
MVGDw715pQbV07TlsL/x9eZA1QEA0onuhFfmrO1YCFKhpGgtDneTy5C5qnAAL1qf
75aFsK3fIWxXP2J29Yvc9mOHmpniF1UBq5Z9gq4eCPcEgGyJOMOi4DJxT+cdEkAD
o+Es+ltl1rc/SwXEJYPc7fkls7gJhHBTdGeXviZ6M5TwnltRefly5J00HYw2zuy3
xK0zbfKMQcWoND2KCvZr4fxq5iQ92Y8/YTSY6f8lJaQbeh8L4lAvRZZRbxOnU/rq
tQzWc5sxzjdbBOhmpSMhjuCE490tMcPjG9O7wVnMJRlYF2NyAwKvCvXHPJ9FYe95
xRPBKeHyrzEJIcjq2XEeYBYmt9HxZF4CaUgCoecZvPhA9WQD+vJzDQFq2rMPvaK3
FSo3WLLHSlXN1gn/R/HVgWwNFipAxAhk0YBDbXMqxz6y3JhnPEKRZs7Nc5OK2sVA
+nzb9GgnlPQHWxDMdxN63G79+cTJbq6SVY6d5701fcREX9bnh9An+5bYS3SVuy3w
VncGcGH4k4xUr5hAlGY9fQtNKNdVdLkFelqr9pPLzeJiec0ZS/RzVRzUlAROnJIn
n9gSmgLFj8MzoCHprPslTeCy7Y6KECxzoEOKXiHmQRumRAiopIUwf1ztTpHJ5fmJ
IFZn9UIwsOeXRaC7OQEL
=2xX9
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--
