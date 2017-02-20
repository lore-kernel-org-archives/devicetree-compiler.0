From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 1/5] Add an initial Python library for libfdt
Date: Mon, 20 Feb 2017 14:37:26 +1100
Message-ID: <20170220033726.GN12644@umbus.fritz.box>
References: <20170215035200.29934-1-sjg@chromium.org>
 <20170215035200.29934-2-sjg@chromium.org>
 <20170215052942.GI12369@umbus.fritz.box>
 <CAPnjgZ2SK-WRkeZwzjh+gA_zB0GiNFyVyer4zA_k9LUdXRV94Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GEn4szYucjS2InE7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487562156;
        bh=KE6dlniAH4a0r6DTR4Mwhf2hyDyl7CZOxMhYtWQnrD8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lZvYId90S63H8cpNwPmLBKmnkevvDdgoKh4G2olf45B4EA6KFicTAYxsMFhIrwYCs
         gziPWEOvWeNnKp5lLinCfWAURvvqGMAP45+l/r7KQBzpdVnFYPDsrnKD8z+5tMso5u
         Y/lXUlpuTMOwaid1QCfxuZAInRVNg9/Dw0NWXzww=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2SK-WRkeZwzjh+gA_zB0GiNFyVyer4zA_k9LUdXRV94Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--GEn4szYucjS2InE7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2017 at 09:48:22PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On 14 February 2017 at 22:29, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> > On Tue, Feb 14, 2017 at 08:51:56PM -0700, Simon Glass wrote:
> >> Add Python bindings for a bare-bones set of libfdt functions. These al=
low
> >> navigating the tree and reading node names and properties.
> >>
> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> ---
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
> >>  pylibfdt/libfdt.swig       | 465 ++++++++++++++++++++++++++++++++++++=
+++++++++
> >>  pylibfdt/setup.py          |  34 ++++
> >>  5 files changed, 521 insertions(+)
> >>  create mode 100644 pylibfdt/.gitignore
> >>  create mode 100644 pylibfdt/Makefile.pylibfdt
> >>  create mode 100644 pylibfdt/libfdt.swig
> >>  create mode 100644 pylibfdt/setup.py
> >>
>=20
> [..]
>=20
> >> +def check_err_null(val, quiet=3D[]):
> >> +    """Raise an error if the return value is NULL
> >> +
> >> +    This is used to check for a NULL return value from certain libfdt=
 C
> >> +    functions
> >> +
> >> +    Args:
> >> +        val: Return value from a libfdt function
> >> +        quiet: Errors to ignore (empty to raise on all errors)
> >> +
> >> +    Returns:
> >> +        val if val is a list, None if not
> >> +
> >> +    Raises
> >> +        FdtException if val indicates an error was reported and the e=
rror
> >> +        is not in @quiet.
> >> +    """
> >> +    # Normally a tuple is returned which contains the data and its le=
ngth.
> >
> > Is it a tuple returned..?
> >
> >> +    # If we get just an integer error code, it means the function fai=
led.
> >> +    if not isinstance(val, list):
> >
> > ..or a list?  Seems like either the comment or the code must be
> > incorrect here.
>=20
> OK.
>=20
> >
> > Come to that, what is it tells swig to map fdt_propery_by_offset() and
> > the like to the pair of values?  How does it know how to detect the
> > error cases?
> >
> > From the usage, I take it that in the success case val[0] is a string
> > or bytearray containing the relevant chunk of data.  Remind me what
> > the second value is?
>=20
> It's the length, or error number. The final arg to
> fdt_get_property_by_offset() is int *len.

Ok.  Why is it sometimes a tuple and sometimes a bare error value
then?  I would have expect it to always return a 2-tuple, the first
being the return value (maybe NULL/None) and the second being the
len/err value returned by reference.

I guess that's a swig question rather than  question for you, though.

> [..]
>=20
>=20
> >> +
> >> +/* This is used to copy property data into a bytearray */
> >> +%mypybuffer_mutable_binary(char *str, size_t size);
> >> +void pylibfdt_copy_value(char *str, size_t size,
> >> +                     const struct fdt_property *prop);
> >
> > This still seems convoluted to me.  Maybe I'm misunderstanding
> > something about SWIG.  But instead of using pylibfdt_copy_value() as
> > an intermediary, couldn't you create a custom typemap that directly
> > maps struct fdt_property *prop (as an outbound value) to a Python
> > tuple, doing the copy right there.
>=20
> Possibly, but here I am trying to use a standard typemap to do this
> and it would involve changing the error handling.

Hm, ok.

> The other problem is that the output typemap would need access to the
> device tree (fdt input parameter) in order to look up the name of the
> property.

Ah.. yes.  But you could have the "raw" function return a tuple with
the name offset and value, then just look up the value in Python
code using fdt_string().

> I suspect a full-custom function could do this, but then it would need
> to written separately for each of the functions that returns struct
> fdt_property.
>=20
> Also my enthusiasm for more SWIG wrangling is waning faster than a
> schooner at the races...perhaps someone other than myself can plot a
> course to a better solution here?

Heh, fair enough.

>=20
> >
> > Oh.. also if you do need this function, use 'uint8_t *val' instead
> > of 'char *str' to reinforce the fact that this is a bytestring not a
> > C-style string we're dealing with.
>=20
> OK.
>=20
> [...]
>=20
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
> >> +}
> >
> > Since you already have a custom typemap here for getprop(), couldn't
> > you drop the now unnecessary length (because Python strings know their
> > length) here, instead of doing it from the Python side?
>=20
> The length is necessary if it is an error number (the last parameter
> to fdt_getprop()).

Ah, of course.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GEn4szYucjS2InE7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYqmR0AAoJEGw4ysog2bOSyqYP/2Bxt8wHf+hr6PbSr1SGcP53
YtoDvGOPRM5r5zloXzgjyhyURDIsLTK5glFjicpvL18yY5w4H/owleSfAdL1Klnj
u8ha3dqNYNSeqd+RhtFdb9AIxkaukXFZ2S3LdDB2IpiFjUYt0wU5p6P6R4FsOZZm
LXL9+sRKJ464IJNK9fyzIgU1ukw+2eHUWAkwdu9hqlHohu+IPtpeW7A64II6sBGX
SX9fZmemK0HrbHzGou+d4HIup+hz83CQgM9fSsy7zao+Y+jV1syxPN+yB94HAL5q
ktGGk/kH2SlIfNEkY0SjRMr2nytSZVnmYff9UVYC1w2r6vrwI5NJV6wlxWc2vmOJ
Ot09jqSWaY45dNWdwwJGutJT+fQeRSMHBcdYlD5TnF1MqBC17OApgwCh89VkEf50
FyE5NMYX8UxeHrk5+0/r5Bo6OQQG4JdJZzV9r1kJo0gCI8qrsxW12nihUgI4T7VT
gn4cwbFQB3g671i9G4U6LP6ewAFLolubbWPbCljd6MsLFoOTTZb6NL4L1vqbaauy
M+TuueLIEZF3WJ2I+VPWLTj7jiz5sGgOcLl5bHkeLljzswABscyZTrbFssA9OrDw
ohqzwasgKHnNtZ1ul/EetjBz0HwL7AtSYqUiLLSob3qD023V6TefFjOiv61zyTqP
eQPAVahWmpTHp/QRP+vb
=ijDF
-----END PGP SIGNATURE-----

--GEn4szYucjS2InE7--
