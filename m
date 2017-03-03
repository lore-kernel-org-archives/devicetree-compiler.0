From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 1/5] Add an initial Python library for libfdt
Date: Fri, 3 Mar 2017 15:21:54 +1100
Message-ID: <20170303042154.GD667@umbus.fritz.box>
References: <20170222043340.17008-1-sjg@chromium.org>
 <20170222043340.17008-2-sjg@chromium.org>
 <20170224024317.GI17615@umbus.fritz.box>
 <CAPnjgZ3p3KfDwJwj=VfnQURL5MQ2tWXBMrb8RViK+tDhj1ikHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1488514983;
        bh=rj3c6zPaTwxfjre8tpWlA4RytVvScYkAraVuTczVixk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iwWrIdwmUjUh1fPFVDIawsT2h2YaVMg0Z1miabkPWD5LpDfNP97dXISNUGj85r6hq
         ve47PWK+UlD/n3FEekD9VZiyV7qzIbJW6sRSn+3HQDp1H2GHbYvJ4IGUcLUfIdHeNr
         JOzmZ3oGE2QnepV8DdMKsTvHkrYfD21ZunohnDok=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3p3KfDwJwj=VfnQURL5MQ2tWXBMrb8RViK+tDhj1ikHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 10:40:16PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On 23 February 2017 at 19:43, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> > On Tue, Feb 21, 2017 at 09:33:36PM -0700, Simon Glass wrote:
> >> Add Python bindings for a bare-bones set of libfdt functions. These al=
low
> >> navigating the tree and reading node names and properties.
> >>
> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> ---
> >>
> >> Changes in v7:
> >> - Add QUIET_ALL to silence all exceptions
> >>
> >> Changes in v6:
> >> - Use a tuple instead of list for the default quiert parameter
> >> - Use a tuple instead of list for QUIET_NOTFOUND
> >> - Use 'list' instead of 'tuple' for the comment in check_err_null()
> >> - Return a bytearray from getprop()
> >> - Adjust the Property constructor to accept the name and value
> >> - Use uint8_t for pylibfdt_copy_value
> >>
> >> Changes in v5:
> >> - Use a 'quiet' parameter instead of quiet versions of functions
> >> - Add a Property object to hold a property's name and value
> >> - Drop the data() and string() functions which are not needed now
> >> - Rename pylibfdt_copy_data() tp pylibfdt_copy_value()
> >> - Change order of libfdt.h inclusion to avoid #ifdef around libfdt mac=
ros
> >> - Drop fdt_offset_ptr() and fdt_getprop_namelen() from the swig interf=
ace
> >> - Use $(SWIG) to call swig from the Makefile
> >> - Review function comments
> >>
> >> Changes in v4:
> >> - Make the library less pythonic to avoid a shaky illusion
> >> - Drop classes for Node and Prop, along with associated methods
> >> - Include libfdt.h instead of repeating it
> >> - Add support for fdt_getprop()
> >> - Bring in all libfdt functions (but Python support is missing for man=
y)
> >> - Add full comments for Python methods
> >>
> >> Changes in v3:
> >> - Make the library more pythonic
> >> - Add classes for Node and Prop along with methods
> >> - Add an exception class
> >> - Use Python to generate exeptions instead of SWIG
> >>
> >> Changes in v2:
> >> - Add exceptions when functions return an error
> >> - Correct Python naming to following PEP8
> >> - Use a class to encapsulate the various methods
> >> - Include fdt.h instead of redefining struct fdt_property
> >> - Use bytearray to avoid the SWIG warning 454
> >> - Add comments
> >>
> >>  Makefile                   |   1 +
> >>  pylibfdt/.gitignore        |   3 +
> >>  pylibfdt/Makefile.pylibfdt |  18 ++
> >>  pylibfdt/libfdt.swig       | 477 ++++++++++++++++++++++++++++++++++++=
+++++++++
> >>  pylibfdt/setup.py          |  34 ++++
> >>  5 files changed, 533 insertions(+)
> >>  create mode 100644 pylibfdt/.gitignore
> >>  create mode 100644 pylibfdt/Makefile.pylibfdt
> >>  create mode 100644 pylibfdt/libfdt.swig
> >>  create mode 100644 pylibfdt/setup.py
> >>
> [...]
>=20
> >> +
> >> +_NUM_ERRORS =3D 18
> >> +
> >> +# Error codes, corresponding to FDT_ERR_... in libfdt.h
> >> +(NOTFOUND,
> >> +        EXISTS,
> >> +        NOSPACE,
> >> +        BADOFFSET,
> >> +        BADPATH,
> >> +        BADPHANDLE,
> >> +        BADSTATE,
> >> +        TRUNCATED,
> >> +        BADMAGIC,
> >> +        BADVERSION,
> >> +        BADSTRUCTURE,
> >> +        BADLAYOUT,
> >> +        INTERNAL,
> >> +        BADNCELLS,
> >> +        BADVALUE,
> >> +        BADOVERLAY,
> >> +        NOPHANDLES) =3D range(1, _NUM_ERRORS)
> >
> > Nit: you could actually assign QUIET_ALL right here.
>=20
> it means the comment stands alone, but OK.
>=20
> >
> >> +# Pass this as the 'quiet' parameter to return -ENOTFOUND on NOTFOUND=
 errors,
> >> +# instead of raising an exception.
> >> +QUIET_NOTFOUND =3D (NOTFOUND,)
> >> +
> >> +# Pass this as the 'quiet' parameter to avoid exceptions altogether. =
All
> >> +# functions passed this value will return an error instead of raising=
 an
> >> +# exception.
> >> +QUIET_ALL =3D range(1, _NUM_ERRORS)
> >> +
> >> +
> >> +class FdtException(Exception):
> >> +    """An exception caused by an error such as one of the codes above=
"""
> >> +    def __init__(self, err):
> >> +        self.err =3D err
> >> +
> >> +    def __str__(self):
> >> +        return 'pylibfdt error %d: %s' % (self.err, fdt_strerror(self=
=2Eerr))
> >> +
> >> +def fdt32_to_cpu(val):
> >> +    """Convert a device-tree cell value into a native integer"""
> >> +    return struct.unpack("=3DI", struct.pack(">I", val))[0]
> >
> > I think this is conceptually wrong, although I think it will give the
> > right results.  AIUI this is used when swig's built in type conversion
> > has incorrectly treated a structure with an integer member as being in
> > native format when it's actually in BE format.
> >
> > So rather than storing as BE, then loading as native, you should store
> > as native - "undoing" the incorrect load within swig - then correctly
> > loading as BE.
> >
> > Even better would be configuring swig not to make the mistake in the
> > first place, but I can accept that that's more trouble than it's
> > worth.
>=20
> Well I can drop this function and incorporate this code into the typemap.

Ok, that sounds good.

>=20
> [...]
>=20
> >> +
> >> +    def get_property_by_offset(self, prop_offset, quiet=3D()):
> >> +        """Obtains a property that can be examined
> >> +
> >> +        Args:
> >> +            prop_offset: Offset of property (e.g. from first_property=
_offset())
> >> +            quiet: Errors to ignore (empty to raise on all errors)
> >> +
> >> +        Returns:
> >> +            Property object, or None if not found
> >> +
> >> +        Raises:
> >> +            FdtException on error (e.g. invalid prop_offset or device
> >> +            tree format)
> >> +        """
> >> +        pdata =3D check_err_null(
> >> +                fdt_get_property_by_offset(self._fdt, prop_offset), q=
uiet)
> >> +        if isinstance(pdata, (int)):
> >> +            return pdata
> >> +        name =3D fdt_string(self._fdt, fdt32_to_cpu(pdata[0].nameoff))
> >> +        value =3D bytearray(fdt32_to_cpu(pdata[0].len))
> >> +        pylibfdt_copy_value(value, pdata[0])
> >> +        return Property(name, value)
> >
> > So.. just to check I understand.  swig is translating the the return
> > value of fdt_get_property_by_offset() into:
> >         If it returns NULL, an integer from the error code in *lenp
> >         Otherwise, a tuple, where the second element is the length
> >         from *lenp, the first element is a Python object with nameoff
> >         and len attributes with those fields from the C structure?
> >
> > I still find the copy_value() thing ugly, but I think I've finally
> > understood why it's the easiest way to accomplish what you need.  I
> > take it swig guarantees that if you pass that structure/object back
> > into a C function it will pass an identical pointer, not a copy of the
> > C structure (which might no longer have the data in the variable
> > length field).
>=20
> Yes, but I can do it with a typemap so I'll go with that for the next ver=
sion.

Right, the version in the latest posting looks much better, thanks.

> [...]
>=20
> >> +%inline %{
> >> +
> >> +/**
> >> + * pylibfdt_copy_value() - Copy value from a property to the given bu=
ffer
> >> + *
> >> + * This is used by the Property class to place the contents of a prop=
erty
> >> + * into a bytearray.
> >> + *
> >> + * @buf: Destination pointer (typically the start of the bytearray)
> >> + * @size: Number of bytes to copy (size of bytearray)
> >> + * @prop: Property to copy
> >> + */
> >> +void pylibfdt_copy_value(uint8_t *buf, size_t size, const struct fdt_=
property *prop)
> >> +{
> >> +     memcpy(buf, prop + 1, size);
> >
> > Oh.. one more nit.  I was recently reminded that memcpy(dst, src, 0)
> > isn't guaranteed to be a no-op so may invoke undefined behaviour (some
> > checkers like Coverity complain about it).  So it's probably worth
> > having a check for zero length either here or in the Python caller.
>=20
> I think I can drop this.
>=20
> >
> >> +}
> >> +
> >> +%}
> >> +
> >> +%apply int *OUTPUT { int *lenp };
> >> +
> >> +/* typemap used for fdt_getprop() */
> >> +%typemap(out) (const void *) {
> >> +     if (!$1)
> >> +             $result =3D Py_None;
> >> +     else
> >> +             /* TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Can we avoid the 'arg4'? */
> >> +             $result =3D Py_BuildValue("s#", $1, *arg4);
> >
> > What's the arg4 about?  This isn't relying on swig internals which are
> > subject to change is it?
>=20
> Possibly, as it is not documented.  I'm not sure if there is a good
> way share input parameters with an output typemap. The typemap.i file
> is quite mystical to me, but it does seem to be a rule that parameters
> are called 'arg' and numbered. If you have any better solutions I am
> all ears.
>=20
> I will ask on the swig-users mailing list two as I cannot seem to find
> a solution already mentioned.
>=20
> [...]
>=20
> Regards,
> Simon

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYuO9iAAoJEGw4ysog2bOSsugP/3IkH1G9eazi59auVd1MV2zh
1zb+4Gv+hrhhZyBHVDaSlumsgng5xF0e6h7gU0eX95kZkmjB3u0/2KabUW1mJH52
aI79rO7PWcf1j0Qpz+EZlVLYK7tZE4mOiqXHl9pZ5q8M0It/I/jqKEHpPjOBwnJc
BEBfFevFsgbF2t3gpkRsPaKc/UYFkZWdPB8c2kgQnfqpiqZIrOOVwLnxwoe9cxXq
aCjhPPgZlQuMhZtXukZUpquRzDtUxoOFggUPAG53tr6Aqmq/0mDnJ9v5sAhspcSR
cK6S7FxJBn+MV1QmCl5tVsHkRxO3jvq3zYp0jsnl94oZg/RgWKFpFoGB651dkNGx
RoNq5E6mqTlPZ1DVWvQl5b6XxMLkdXAaMXWVHdOimdg76sw8tmxwC5qiCVcekN9R
V4BhruLD1nlMsuKnmEqE7SGRhVkwh/ZuVmzpcNczl6CFhPj1gbzu8O5iiUA06GNE
Iftc7OXCo3cGlEB4Ktbv8VCvJWj+gI4HepB817IlUQCYz1RNfte/n67QNev1dsyp
Kgq1m8Dx+8BsItZJQbZ0XCpMqnlJ9HSwCZZFAm4Alebzyaz4t86e4UeZLVY0Xx3h
CkZAFO5E3DcwpuIx4qNqW/jFSlxgGo3Jtwfa5fZ3va0BBpCorL6h7DpB3NXGll3U
D4XyvyAO88+KP+lnSC6H
=QorC
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
