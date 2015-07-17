From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] fdt: Add a function to count strings
Date: Fri, 17 Jul 2015 23:44:23 +1000
Message-ID: <20150717134423.GH25179@voom.redhat.com>
References: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com>
 <1436958839-14793-2-git-send-email-thierry.reding@gmail.com>
 <20150715134130.GA1567@voom.fritz.box>
 <20150716111352.GA4635@ulmo>
 <20150716122935.GD25179@voom.redhat.com>
 <20150717091008.GC3057@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G3juXO9GfR42w+sw"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150717091008.GC3057@ulmo>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--G3juXO9GfR42w+sw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2015 at 11:10:09AM +0200, Thierry Reding wrote:
> On Thu, Jul 16, 2015 at 10:29:35PM +1000, David Gibson wrote:
> > On Thu, Jul 16, 2015 at 01:13:53PM +0200, Thierry Reding wrote:
> > > On Wed, Jul 15, 2015 at 11:41:30PM +1000, David Gibson wrote:
> > > > On Wed, Jul 15, 2015 at 01:13:57PM +0200, Thierry Reding wrote:
> > > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > >=20
> > > > > Given a device tree node and a property name, the fdt_count_strin=
gs()
> > > > > function counts the number of strings found in the property value.
> > > > >=20
> > > > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > > ---
> > > > >  libfdt/fdt_ro.c      | 20 ++++++++++++++++
> > > > >  libfdt/libfdt.h      |  9 ++++++++
> > > > >  tests/.gitignore     |  1 +
> > > > >  tests/Makefile.tests |  1 +
> > > > >  tests/run_tests.sh   |  3 +++
> > > > >  tests/strings.c      | 64 ++++++++++++++++++++++++++++++++++++++=
++++++++++++++
> > > > >  tests/strings.dts    | 10 ++++++++
> > > > >  7 files changed, 108 insertions(+)
> > > > >  create mode 100644 tests/strings.c
> > > > >  create mode 100644 tests/strings.dts
> > > > >=20
> > > > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > > > index a65e4b5b72b6..874975a0d8ad 100644
> > > > > --- a/libfdt/fdt_ro.c
> > > > > +++ b/libfdt/fdt_ro.c
> > > > > @@ -538,6 +538,26 @@ int fdt_stringlist_contains(const char *strl=
ist, int listlen, const char *str)
> > > > >  	return 0;
> > > > >  }
> > > > > =20
> > > > > +int fdt_count_strings(const void *fdt, int nodeoffset, const cha=
r *property)
> > > > > +{
> > > > > +	int length, i, count =3D 0;
> > > > > +	const char *list;
> > > > > +
> > > > > +	list =3D fdt_getprop(fdt, nodeoffset, property, &length);
> > > > > +	if (!list)
> > > > > +		return -length;
> > > > > +
> > > > > +	for (i =3D 0; i < length; i++) {
> > > > > +		int len =3D strlen(list);
> > > >=20
> > > > I like the concept of these patches, but this implementation is uns=
afe
> > > > if the given property does not, in fact, contain a list of \0
> > > > terminated strings.
> > >=20
> > > This should be fixed in v2 of the patches. This isn't quite as simple=
 as
> > > using strnlen() instead of strlen() because it also means we need ext=
ra
> > > handling for the case where a NUL byte isn't found within the value.
> >=20
> > Yes, I suspect it will actually be easier to use memchr().
>=20
> I don't see how that would make it easier. The problematic bit isn't
> about determining whether or not the NUL byte is there. The problematic
> bit is determining what to do about it. For example we could enforce
> that these functions only work on well-defined properties, that is,
> properties that end with a NUL-byte. Currently we don't do that in
> fdt_find_string() and fdt_get_string() for performance reasons. For
> fdt_count_strings() the check is implicit because the last string would
> not be bounded by the property value if it wasn't terminated with a NUL
> byte.

Yeah, true; memchr() was just the first implementation that popped
into my head.

So, actually checking for a final \0 in advance isn't a real
performance cost - getprop already gives you the total property
length, so you can check if you have a valid stringlist in O(1).

> It would be easy to add this additional check as a way to short-circuit
> implementations and abort early on malformed property values, but that
> would be additional work that most users may not care about.

The implementation you have now seems fine to me - only thing I'm
still thinking about is whether I like the function names or not.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--G3juXO9GfR42w+sw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVqQa3AAoJEGw4ysog2bOSq18QAKkw/e7qXUSpyKB2RS+0jXfs
pqwwny3IHipajrhG/3SjE4VVFgLvWBANVozVNmy/oYdVQucvAIm5+Q+91r1BB8Ab
0aUu6JZQRc/DiiuNl6akBQO1e9STelK/V7+yPOJpZ+uYdBuz4pin0rQGEtDk/CMO
ZiKnQK8Y3QiE2BEVv9/fXITI+az/Jz0KRBXoBkSR4sufZ5RhYlFlrU9Kpm3DydDh
IR3GcPzBHZVJYitAMYdDe7PEsk7opn2xMgSO0KGg/uQXh6A1BB4BbMX3ExlQ7IJI
bvO7pRadRcknK1VHCFRvdTamIDgA9OBUrSiNWG9FVk+I7tD0F6PaDjBudh09KQUd
amC88A/nFbH+uYcdz1QFgV3lXJ0F7FkQ78HrRjrs84dm8GqxCQ2W8VCPKY/VRxdc
bPes4LlPQou2AstSsQjDaoCsJFvudwFuj6sp6LnxdDe50BVoGtH5LAXZocQkImbJ
ONLgUKjVRfEEm8AmRpZVMNvcFU67np5c3zLIOszSGdKb4wNGcCgiOAOcOfMagsMP
nVUsIIoFdsfAOnrMUanJKZVuYMmnJpEf7EC3OuxYscSLRzh8icuRmPn9X8j5nGOb
Wfg0q7e1C9Nb/RUaX6pLTsDA7vihDF7jA/w/y7+T39vF2LtKMcJ+i40CI3eiZo3K
fQkGJ0HI4BPb1/3OlO5w
=fKGE
-----END PGP SIGNATURE-----

--G3juXO9GfR42w+sw--
