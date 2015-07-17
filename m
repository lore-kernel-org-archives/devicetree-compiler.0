From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] fdt: Add a function to count strings
Date: Fri, 17 Jul 2015 11:10:09 +0200
Message-ID: <20150717091008.GC3057@ulmo>
References: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com>
 <1436958839-14793-2-git-send-email-thierry.reding@gmail.com>
 <20150715134130.GA1567@voom.fritz.box>
 <20150716111352.GA4635@ulmo>
 <20150716122935.GD25179@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=6p59oM4BRVXnDVYqmEmrY98DNHgj1egDv4gEKM2XQPI=;
        b=jE2oSu5fZ25TAuFKgKk+lklpdqZRFjuBF+WgnXcZVyDHtaDJNWwBRM5ripwzbP4kQb
         fTWk8hxXVGOD9pLMUPMr3FSZ0Dn0XNzSjIa23KuM67IHqhlSDOU4watwwvSnBNZnbMKq
         upb4xs4cExnKqlh3kr0d54tiAdgSWh8VdBX3nIGSWcQtRifyjMMnTo2vjMWFW+dZOGiO
         lczsULq6P8Qtuw6ALYApN5AF7oKJJ7BHSptDZFA7Y7cUKkbWc8xrLp6sH0JQMP0t+55y
         harKIegHD87Ig1G68QXXjDn2Hz/mAU8pXCbqc04ClqUVxySHqdQ/g5HVNX07z8wCW/Iv
         51Kg==
Content-Disposition: inline
In-Reply-To: <20150716122935.GD25179-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 10:29:35PM +1000, David Gibson wrote:
> On Thu, Jul 16, 2015 at 01:13:53PM +0200, Thierry Reding wrote:
> > On Wed, Jul 15, 2015 at 11:41:30PM +1000, David Gibson wrote:
> > > On Wed, Jul 15, 2015 at 01:13:57PM +0200, Thierry Reding wrote:
> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >=20
> > > > Given a device tree node and a property name, the fdt_count_strings=
()
> > > > function counts the number of strings found in the property value.
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > >  libfdt/fdt_ro.c      | 20 ++++++++++++++++
> > > >  libfdt/libfdt.h      |  9 ++++++++
> > > >  tests/.gitignore     |  1 +
> > > >  tests/Makefile.tests |  1 +
> > > >  tests/run_tests.sh   |  3 +++
> > > >  tests/strings.c      | 64 ++++++++++++++++++++++++++++++++++++++++=
++++++++++++
> > > >  tests/strings.dts    | 10 ++++++++
> > > >  7 files changed, 108 insertions(+)
> > > >  create mode 100644 tests/strings.c
> > > >  create mode 100644 tests/strings.dts
> > > >=20
> > > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > > index a65e4b5b72b6..874975a0d8ad 100644
> > > > --- a/libfdt/fdt_ro.c
> > > > +++ b/libfdt/fdt_ro.c
> > > > @@ -538,6 +538,26 @@ int fdt_stringlist_contains(const char *strlis=
t, int listlen, const char *str)
> > > >  	return 0;
> > > >  }
> > > > =20
> > > > +int fdt_count_strings(const void *fdt, int nodeoffset, const char =
*property)
> > > > +{
> > > > +	int length, i, count =3D 0;
> > > > +	const char *list;
> > > > +
> > > > +	list =3D fdt_getprop(fdt, nodeoffset, property, &length);
> > > > +	if (!list)
> > > > +		return -length;
> > > > +
> > > > +	for (i =3D 0; i < length; i++) {
> > > > +		int len =3D strlen(list);
> > >=20
> > > I like the concept of these patches, but this implementation is unsafe
> > > if the given property does not, in fact, contain a list of \0
> > > terminated strings.
> >=20
> > This should be fixed in v2 of the patches. This isn't quite as simple as
> > using strnlen() instead of strlen() because it also means we need extra
> > handling for the case where a NUL byte isn't found within the value.
>=20
> Yes, I suspect it will actually be easier to use memchr().

I don't see how that would make it easier. The problematic bit isn't
about determining whether or not the NUL byte is there. The problematic
bit is determining what to do about it. For example we could enforce
that these functions only work on well-defined properties, that is,
properties that end with a NUL-byte. Currently we don't do that in
fdt_find_string() and fdt_get_string() for performance reasons. For
fdt_count_strings() the check is implicit because the last string would
not be bounded by the property value if it wasn't terminated with a NUL
byte.

It would be easy to add this additional check as a way to short-circuit
implementations and abort early on malformed property values, but that
would be additional work that most users may not care about.

Thierry

--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVqMZsAAoJEN0jrNd/PrOhBkAP/3U4MB9SI1JLPz1HLeqfWtTk
dLx29kDv6PhFY/hOoJlFjggiWIym1cIWYbL2tczbnMOu78ZLWJMlqGAreJ47VCsR
zdyMc2HRHXLs84exZV9GpQUxPNv81KH+whrzwZJsw++Uj6AglbAcSKZz+IAWNnj9
U4jve3s4MI6mqNIx5LQ8szTvjkJsL3uBYHGq+S56wh3loVfoiRYMFeZ5hUXqcmpA
qfouO/BvWgOBL+gqy/KvPDFhMXqPdddJH3shuXuTZw8WENtywlAoZaGtGJ3O40Aw
CozX1mtH2XG2zygdZ3Ga0RpYuZIIRq8mCDqrmrK7Ha+AQjUVKe+OobeY58VWsLX8
TW8F8QQvGnbLe5/k04l3Bzq3VWihREWjSUAN810GAA40UNHpquKM8SUvzLlKzsU5
b+jMHM04fWQy/qEs/R/HSWKUHy6inXlc7bzKhjhY7sKnTZXvfLWuxiI4IPSID4DS
Jn0ZnnSWO+nT4lSyGV2DPzyYtMgG0aaGKl+bxR3aeyU7R5CPGjRYX7uMBUewSI6d
TJVMGAMlJkeAeV6ACUoHuVWDbg8fV6V/87fToGYHxGiHJ03HbUUdMEixaTWmFKYy
bNUZwQHNgjVSnrG1gUK/k8gTXMr3uTHm7rf+jd7TzVfLV0OFuQj2+0t7a1dzA4BE
TJo4lKVHGr7N3wOgPL6U
=PGjd
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--
