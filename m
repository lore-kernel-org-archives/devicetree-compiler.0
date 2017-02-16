From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 1/5] Add an initial Python library for libfdt
Date: Thu, 16 Feb 2017 13:11:23 +1100
Message-ID: <20170216021123.GO12369@umbus.fritz.box>
References: <20170205201323.15411-1-sjg@chromium.org>
 <CAPnjgZ31rZqoYTg4m=3yAFuT2UuL9i4qc4+w-G34Aq75sdfrfA@mail.gmail.com>
 <20170213052022.GB25381@umbus>
 <32332134.humTfG1UmO@schleppi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aTCJOP0qgkSGqHWA"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487211670;
        bh=5+HlxI2pL/+hflyAjU5kT6ZPJ7iz0NFy9sHDhhxssLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l7p6dzFQ1aSZg08miMlMym0Ln9WXfsgqrZ32x0n+G2X17NghCD5yU8wCqgCEg8CsX
         Diriib6E2udC8Kyfv8VShp2zHiozQzYnvnQKP3SyrrMgxtGU2WWaRkhEaKevZ2Se+2
         Qc5cBC6EWtBPPVnDeCNg6opFFjFmoplOTjs5MPpE=
Content-Disposition: inline
In-Reply-To: <32332134.humTfG1UmO@schleppi>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>


--aTCJOP0qgkSGqHWA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2017 at 07:55:01PM +0100, Ulrich Langenbach wrote:
> Hi David, hi Simon,
>=20
> Am Montag, 13. Februar 2017, 16:20:22 CET schrieb David Gibson:
> > On Fri, Feb 10, 2017 at 11:39:21AM -0700, Simon Glass wrote:
> > > Hi David,
> > >=20
> > > On 9 February 2017 at 21:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6iEOx6SR5NKn@public.gmane.org=
u>=20
> wrote:
> > > > On Sun, Feb 05, 2017 at 01:13:19PM -0700, Simon Glass wrote:
> > > >> Add Python bindings for a bare-bones set of libfdt functions. These
> > > >> allow
> > > >> navigating the tree and reading node names and properties.
> > > >>=20
> > > >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > >> ---
> > > >>=20
> > > >> Changes in v4:
> > > >> - Make the library less pythonic to avoid a shaky illusion
> > > >> - Drop classes for Node and Prop, along with associated methods
> > > >> - Include libfdt.h instead of repeating it
> > > >> - Add support for fdt_getprop()
> > > >> - Bring in all libfdt functions (but Python support is missing for
> > > >> many)
> > > >> - Add full comments for Python methods
> > > >>=20
> > > >> Changes in v3:
> > > >> - Make the library more pythonic
> > > >> - Add classes for Node and Prop along with methods
> > > >> - Add an exception class
> > > >> - Use Python to generate exeptions instead of SWIG
> > > >>=20
> > > >> Changes in v2:
> > > >> - Add exceptions when functions return an error
> > > >> - Correct Python naming to following PEP8
> > > >> - Use a class to encapsulate the various methods
> > > >> - Include fdt.h instead of redefining struct fdt_property
> > > >> - Use bytearray to avoid the SWIG warning 454
> > > >> - Add comments
> > > >>=20
> > > >>  pylibfdt/.gitignore        |   3 +
> > > >>  pylibfdt/Makefile.pylibfdt |  18 ++
> > > >>  pylibfdt/libfdt.swig       | 565
> > > >>  +++++++++++++++++++++++++++++++++++++++++++++ pylibfdt/setup.py  =
   =20
> > > >>     |  34 +++
> > > >>  4 files changed, 620 insertions(+)
> > > >>  create mode 100644 pylibfdt/.gitignore
> > > >>  create mode 100644 pylibfdt/Makefile.pylibfdt
> > > >>  create mode 100644 pylibfdt/libfdt.swig
> > > >>  create mode 100644 pylibfdt/setup.py
> > >=20
> > > [..]
> > >=20
> > > >> +def data(prop):
> > > >> +    """Extract the data from a property
> > > >> +
> > > >> +    This is an internal function only.
> > > >> +
> > > >> +    Args:
> > > >> +        prop: Property structure, as returned by
> > > >> get_property_by_offset()
> > > >> +
> > > >> +    Returns:
> > > >> +        The property data as a bytearray
> > > >> +    """
> > > >> +    buf =3D bytearray(fdt32_to_cpu(prop.len))
> > > >> +    pylibfdt_copy_data(buf, prop)
> > > >> +    return buf
> > > >=20
> > > > AFAICT this data() function (and the C functions it uses) aren't
> > > > actually used any more.  I think you can remove them.
> > >=20
> > > It is used in tests, and needs to be used to process the return value
> > > from fdt_get_property_by_offset(). You ask later what we need from
> > > that function other than the property contents. We need the property
> > > name.
> >=20
> > Ok.. so why can't you just return a tuple of two bytestrings?
> >=20
> > > So we could create a Prop class (again) with the name and data in it,
> > > and have get_property_by_offset return it. Of course this means that
> > > scanning the tree requires allocating space for the property contents
> > > all over again, when you use it or not, but this is Python.
> >=20
> > Yeah, I think trying to avoid lots of allocations when working in
> > Python is not really going to fly.
> >=20
> > > >> +
> > > >> +def strerror(fdt_err):
> > > >> +    """Get the string for an error number
> > > >> +
> > > >> +    Args:
> > > >> +        fdt_err: Error number (-ve)
> > > >> +
> > > >> +    Returns:
> > > >> +        String containing the associated error
> > > >> +    """
> > > >> +    return fdt_strerror(fdt_err)
> > > >> +
> > > >> +def check_err(val, quiet=3DFalse):
> > > >> +    """Raise an error if the return value is -ve
> > > >> +
> > > >> +    This is used to check for errors returned by libfdt C functio=
ns.
> > > >> +
> > > >> +    Args:
> > > >> +        val: Return value from a libfdt function
> > > >> +        quiet: True to ignore the NOTFOUND error, False to raise =
on
> > > >> all errors +
> > > >> +    Returns:
> > > >> +        val if val >=3D 0
> > > >> +
> > > >> +    Raises
> > > >> +        FdtException if val < 0
> > > >> +    """
> > > >> +    if val < 0:
> > > >=20
> > > >> +        if not quiet or val !=3D -NOTFOUND:
> > > > I don't really like hardcoding the specialness of NOTFOUND here -
> > > > depending on the call, there could be different error codes which a=
re
> > > > relatively harmless.
> > > >=20
> > > > Instead of a quiet boolean, you could pass in a set (list, sequence,
> > > > whatever) of error codes to be considered quiet.
> > >=20
> > > OK I can do that, except that later you suggest that the whole idea is
> > > wrong. See below.
> > >=20
> > > >> +            raise FdtException(val)
> > > >> +    return val
> > > >> +
> > > >> +def check_err_null(val, quiet=3DFalse):
> > > >> +    """Raise an error if the return value is NULL
> > > >> +
> > > >> +    This is used to check for a NULL return value from certain li=
bfdt
> > > >> C
> > > >> +    functions
> > > >> +
> > > >> +    Args:
> > > >> +        val: Return value from a libfdt function
> > > >> +        quiet: True to ignore the NOTFOUND error, False to raise =
on
> > > >> all errors +
> > > >> +    Returns:
> > > >> +        val if val is a list, None if not
> > > >> +
> > > >> +    Raises
> > > >> +        FdtException if quiet is False and val indicates an error=
 was
> > > >> +           reported. If quiet if True then an FdtException is rai=
sed
> > > >> only if +           the error is something other than -NOTFOUND.
> > > >> +    """
> > > >> +    # Normally a tuple is returned which contains the data and its
> > > >> length.
> > > >> +    # If we get just an integer error code, it means the function
> > > >> failed.
> > > >> +    if not isinstance(val, list):
> > > >> +        if not quiet or val !=3D -NOTFOUND:
> > > >> +            raise FdtException(val)
> > > >> +        return None,
> > > >> +    return val
> > > >> +
> > > >> +class Fdt:
> > > >> +    """Device tree class, supporting all operations
> > > >> +
> > > >> +    The Fdt object is created is created from a device tree binary
> > > >> file,
> > > >> +    e.g. with something like:
> > > >> +
> > > >> +       fdt =3D Fdt(open("filename.dtb").read())
> > > >=20
> > > > I noticed when playing with this that doing Fdt("filename.dtb") will
> > > > appear to succeed, but then (of course) fail with BADMAGIC as soon =
as
> > > > you do anything.  Might be an idea to at least do a magic number ch=
eck
> > > > in the constructor.
> in general this will fail once we start thinking of creating files, e.g. =
due to=20
> rearchitecting a DT into multiple ones with includes or creating new DTs.
> However, with taking r/w modes into account the check can be skipped when=
 the=20
> file is opened for writing or deferred to a later read call as it is just=
=20
> now...

Hrm, not if we're smart about it.  I'd envisage several ways of
invoking the Fdt constructor.  One like this would read in a file and
do a basic verification.  We'd also need variants for creating a new
device tree.  We'd need one variant for creating a tree using the
sequential write functions, which would call fdt_create() in the
constructor.  Then we'd need another for creating a fresh tree using
the random access read-write functions, which would call
fdt_create_empty_tree() in the constructor.

> > >=20
> > > OK I'll add that.
> > >=20
> > > >> +
> > > >> +    Operations can then be performed using the methods in this cl=
ass.
> > > >> Each
> > > >> +    method xxx(args...) corresponds to a libfdt function fdt_xxx(=
fdt,
> > > >> args...). +
> > > >> +    Almost all methods raise an FdtException if an error occurs. =
The
> > > >> +    following does not:
> > > >> +
> > > >> +        string() - since it has no error checking
> > > >> +
> > > >> +    To avoid this behaviour a 'quiet' version is provided for some
> > > >> functions. +    This behaves as for the normal version except that=
 it
> > > >> will not raise +    an exception in the case of an FDT_ERR_NOTFOUND
> > > >> error: it will simply +    return the -NOTFOUND error code or None.
> > > >> +    """
> > > >> +    def __init__(self, data):
> > > >> +        self._fdt =3D bytearray(data)
> > > >> +
> > > >> +    def string(self, offset):
> > > >> +        """Get a string given its offset
> > > >> +
> > > >> +        This is an internal function.
> > > >> +
> > > >> +        Args:
> > > >> +            offset: FDT offset in big-endian format
> > > >> +
> > > >> +        Returns:
> > > >> +            string value at that offset
> > > >> +        """
> > > >> +        return fdt_string(self._fdt, fdt32_to_cpu(offset))
> > > >> +
> > > >> +    def path_offset(self, path):
> > > >> +        """Get the offset for a given path
> > > >> +
> > > >> +        Args:
> > > >> +            path: Path to the required node, e.g. '/node@3/subnod=
e@1'
> > > >> +
> > > >> +        Returns:
> > > >> +            Node offset
> > > >> +
> > > >> +        Raises
> > > >> +            FdtException if the path is not valid
> > > >> +        """
> > > >> +        return check_err(fdt_path_offset(self._fdt, path))
> > > >> +
> > > >> +    def path_offset_quiet(self, path):
> > > >> +        """Get the offset for a given path
> > > >> +
> > > >> +        Args:
> > > >> +            path: Path to the required node, e.g. '/node@3/subnod=
e@1'
> > > >> +
> > > >> +        Returns:
> > > >> +            Node offset, or -NOTFOUND if the path is not value
> > > >> +
> > > >> +        Raises
> > > >> +            FdtException if any error occurs other than NOTFOUND
> > > >> +        """
> > > >> +        return check_err(fdt_path_offset(self._fdt, path), True)
> > > >=20
> > > > Ugh.  I don't much like the idea of making quiet versions of a bunch
> > > >=20
> > > > of entry points.  I think we need to pick one:
> > > >     a) Just return error codes (not very Pythonic, but you can't ha=
ve
> > > >    =20
> > > >        everything)
> > > >    =20
> > > >     b) Always raise exceptions, and the user has to try: except: to
> > > >    =20
> > > >        quiet then (creating different error classes for the differe=
nt
> > > >        codes could make this easier).
> > >=20
> > > I don't like it either, but on the other hand, you did ask for except=
ions.
> > >=20
> > > I'm happy to go back to a) if that suits you.
> > >=20
> > > Re b) this is really ugly IMO. Exceptions shouldn't be used in normal
> > > program flow - e.g. they can appear in logs and cause confusion. Also
> > > the syntax is not great.
> >=20
> > Yeah, I guess I agree.  Although Python does essentially use this
> > approach internally for iterators, it's mostly hidden by the syntactic
> > sugar.
> >=20
> > > The reason for the 'quiet' function is that it handles 99% of the
> > > cases where you get an error return from a libfdt function. Also it
> > > means that you don't have to check return values most of the time, but
> > > still catch 'bad' things like out of space, bad offset, etc. without
> > > blundering onwards.
> > >=20
> > > As I say I don't like having 'quiet' versions of the functions. There
> > > is one other option I can think of, which is to add an additional
> > >=20
> > > argument to each function like this:
> > >    def path_offset(self, path, quiet=3DFalse):
> > > Then you can add 'quiet=3DTrue' to avoid the exception. Then you use =
the
> > > same function name, and most of the time you get exceptions when there
> > > are problems, but it's easy to avoid when you know there is a chance
> > > an error will be returned.
> > >=20
> > > If we go that way, then you are probably going to ask what is so
> > > special about -NOTFOUND.
> > >=20
> > > So we could make quiet a list (or perhaps Set) of exceptions, like th=
is:
> > >=20
> > > def path_offset(self, path, quiet=3DNone)   # or perhaps quiet=3D[]
> > >=20
> > > and have callers do:
> > >=20
> > > fdt.path_offset("/", quiet=3D[NOTFOUND])
> > >=20
> > > and I suppose we could define a constant for [NOTFOUND] also.
> >=20
> > Yes, this looks better than the other alternatives I think - it's
> > basically an extension of what I suggested for check_err().  I think
> > you can exploit duck typing here to let the user use a list or set as
> > they please (basically just allow anything supporting the 'in'
> > operator).
> >=20
> > > That might be better all round?
> >=20
> > Yes, I think so.  The remaining question, of course, is whether to a)
> > have the quiet set default to nothing, or b) default to the "usually
> > quiet" errors (NOTFOUND for most functions).  (b) will be less verbose
> > for common use cases, but (a) reduces invisible magic which is
> > generally a good goal.
> I like the idea of hiding the not so important errors. I would also throw=
 in a=20
> little bit different approach to this by adding a property to the Fdt obj=
ect=20
> used to control this. It can be configured by the user during instantiati=
on or=20
> later on. This just keeps the interfaces of the single function(s) cleane=
r.
> However I am not sure how this is usually handled, so that we could just=
=20
> follow already agreed best practices.

I dislike the idea of putting this into the overall object, because
the obvious choices for "quiet" errors varies with the function you're
using.  NOTFOUND is by far the most common, but EXISTS could also be a
non serious error in a number of circumstances.  When we start adding
write functions, NOSPACE becomes extremely common.

>=20
> > > >> +    def first_property_offset(self, nodeoffset):
> > > >> +        """Get the offset of the first property in a node offset
> > > >> +
> > > >> +        Args:
> > > >> +            nodeoffset: Offset to the node to check
> > > >> +
> > > >> +        Returns:
> > > >> +            Offset of the first property
> > > >> +
> > > >> +        Raises
> > > >> +            FdtException if the associated node has no properties=
, or
> > > >> some
> > > >> +                other error occurred
> > > >> +        """
> > > >> +        return check_err(fdt_first_property_offset(self._fdt,
> > > >> nodeoffset))
> > > >> +
> > > >> +    def first_property_offset_quiet(self, nodeoffset):
> > > >> +        """Get the offset of the first property in a node offset
> > > >> +
> > > >> +        Args:
> > > >> +            nodeoffset: Offset to the node to check
> > > >> +
> > > >> +        Returns:
> > > >> +            Offset of the first property, or -NOTFOUND if the nod=
e has
> > > >> no
> > > >> +                properties
> > > >> +
> > > >> +        Raises
> > > >> +            FdtException if any other error occurs
> > > >> +        """
> > > >> +        return check_err(fdt_first_property_offset(self._fdt,
> > > >> nodeoffset), True) +
> > > >> +    def next_property_offset(self, prop_offset):
> > > >> +        """Get the next property in a node
> > > >> +
> > > >> +        Args:
> > > >> +            prop_offset: Offset of the previous property
> > > >> +
> > > >> +        Returns:
> > > >> +            Offset of the next property
> > > >> +
> > > >> +        Raises:
> > > >> +            FdtException if the associated node has no more
> > > >> properties, or
> > > >> +                some other error occurred
> > > >> +        """
> > > >> +        return check_err(fdt_next_property_offset(self._fdt,
> > > >> prop_offset))
> > > >> +
> > > >> +    def next_property_offset_quiet(self, prop_offset):
> > > >> +        """Get the next property in a node
> > > >> +
> > > >> +        Args:
> > > >> +            prop_offset: Offset of the previous property
> > > >> +
> > > >> +        Returns:
> > > >> +            Offset ot the next property, or -NOTFOUND if there ar=
e no
> > > >> more
> > > >> +            properties
> > > >> +
> > > >> +        Raises:
> > > >> +            FdtException if any other error occurs
> > > >> +        """
> > > >> +        return check_err(fdt_next_property_offset(self._fdt,
> > > >> prop_offset), True) +
> > > >> +    def get_name(self, nodeoffset):
> > > >> +        """Get the name of a node
> > > >> +
> > > >> +        Args:
> > > >> +            nodeoffset: Offset of node to check
> > > >> +
> > > >> +        Returns:
> > > >> +            Node name
> > > >> +
> > > >> +        Raises:
> > > >> +            FdtException on error (e.g. nodeoffset is invalid)
> > > >> +        """
> > > >> +        return check_err_null(fdt_get_name(self._fdt, nodeoffset)=
)[0]
> > > >> +
> > > >> +    def get_property_by_offset(self, prop_offset):
> > > >> +        """Obtains a property that can be examined
> > > >> +
> > > >> +        TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Consider returning a property obj=
ect
> > > >> instead, +        with the data extracted from the Fdt.
> > > >=20
> > > > AFAICT you're already copying the property value out of the fdt as a
> > > > bytestring / bytearray.  I don't see what a property object would
> > > > encode apart from that bytestring.
> > >=20
> > > The property name.
> >=20
> > Hm, true.  Alright, how about this: reintroduce a Property object, and
> > also a version of the get_property() vs. getprop() variants which are
> > in the C library.  get_property() and get_property_by_offset() will
> > return Property objects which, to be clear, are *copies* of a property
> > name & value, not a handle to a property within the tree.  getprop()
> > will return just the value bytestring().
> >=20
> > Property should probably be derived from collections.namedtuple, since
> > it is basically just a wrapper on a (name, value) tuple.
> >=20
> > > [...]
> > >=20
> > > >> +    def getprop_quiet(self, nodeoffset, prop_name):
> > > >> +        """Get a property from a node
> > > >> +
> > > >> +        Args:
> > > >> +            nodeoffset: Node offset containing property to get
> > > >> +            prop_name: Name of property to get
> > > >> +
> > > >> +        Returns:
> > > >> +            Value of property as a string, or None if not found
> > > >> +
> > > >> +        Raises:
> > > >> +            FdtError if an error occurs (e.g. nodeoffset is inval=
id)
> > > >> +        """
> > > >> +        return check_err_null(fdt_getprop(self._fdt, nodeoffset,
> > > >> prop_name), +                              True)[0]
> > > >=20
> > > > There are a bunch of missing things here.  e.g. fdt_subnode_offset(=
),
> > > > off_dt_strings(), fdt_parent_offset(), ...
> > >=20
> > > Yes, I've only made a start. I don't want to implement the entire
> > > thing right away! I want to get something basic agreed and accepted.
> > > Then we can build on it. Refactoring everything as we iterate towards
> > > a good binding takes time, and the functions I have chosen are fairly
> > > representative of common uses.
> >=20
> > Ok, fair enough.
> >=20
> > > [..]
> > >=20
> > > Regards,
> > > Simon
> > >
> Regards,
> Ulrich
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aTCJOP0qgkSGqHWA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYpQpKAAoJEGw4ysog2bOSlQ0P/1gdzBYw1Ng146koJ3ULelJX
w+klbZ2sVRiRtoiiiRVae2VDkgYXBGOdDuQeLN69zLPOuuC7hU17EF86ylJ31npO
4nQFZPIHoKtoueBhLPsrz9A0QICCt4RBfZIrxZQCHIleLuUl/WkSdbpizhAltERi
Hhfdy17gwoc/8mabV1N7cqfZ6vcwLdwcsNOkZk0kdfywE4fUH3XeAL/YKGMxCWmR
/RCTCHJ+N2HpnZk2HUH8F5DXaaUFd8CcRIuSv9/5rS0jghegVBkVPrGiqJXbcn3h
syb6EIZDaN5Qb0DPrCoEIV69Ys47FgkrXq60VwltaBjzKeBKbwhK1J4S2kGD0d5r
kROX0Lj8N38ycYMNL6GWWNk9WbQIxZRLqJ2aGko0CaaX60ehPmYJmYijtc8FaOnm
IKBVGwJFk0k0B4HxB9oDzbddO1W20hKFPHB6lMqMwH3K0OdBgW8lA3y3wSUwlKtv
Os3r/0Y5sbsnmjTVXqltIKFatmeSZYoktMd2xwgYiBExSEGQR90j95JAIjVYflA+
xtc/yOisd2OeN4FE57GaxFsQyxn+ICcaZSdz+mgrzihnCw+LcoACp1gHaYFgIZjY
sjZlZnlS5SxfxQgR0MaBwUW7VQem1GZAHy6yFCi32zom0T93S3EMN9RkeOl3yR3i
QCmRM00RAKcWYB/C7Z3X
=OwCM
-----END PGP SIGNATURE-----

--aTCJOP0qgkSGqHWA--
