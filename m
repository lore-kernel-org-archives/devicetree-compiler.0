From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] fdt: Add a function to count strings
Date: Thu, 16 Jul 2015 13:13:53 +0200
Message-ID: <20150716111352.GA4635@ulmo>
References: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com>
 <1436958839-14793-2-git-send-email-thierry.reding@gmail.com>
 <20150715134130.GA1567@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=YdbJRX5GOo/6e5C7t7vziLll167gbIZWkgjqTvyW6eE=;
        b=Ih6O5g2iP7s6nnyRiZSh9y67lKyaOtDUU37XVQbIYLqw1/Nu+KUUEIXcpHyFCdyIZO
         3Y3jOqGnKSDP7S+asFItzUDAR1l0UvRQU4twCUeujECInKjtSq5WbF0Jbk5OsDTkwURl
         yqckv/SDt+7qgX1GpjYHDpeTPM8L0MucVzNsAJKeKCV+3DPE9Hr10pNkKiCPykYKgNo5
         S6n6KJuRkp/nn6hPzXdrPYcN3cQDfPb5ZQS39lNR71uJCqWVyTwKJFOdQPQoX8PjeQe5
         7+SL3LWJ5W9x225YKa9XICPu0mlCvRqMA/D+pACaL9cDzQkm5p9xT/WxEZ7YYRH1utyw
         zlgA==
Content-Disposition: inline
In-Reply-To: <20150715134130.GA1567-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2015 at 11:41:30PM +1000, David Gibson wrote:
> On Wed, Jul 15, 2015 at 01:13:57PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Given a device tree node and a property name, the fdt_count_strings()
> > function counts the number of strings found in the property value.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  libfdt/fdt_ro.c      | 20 ++++++++++++++++
> >  libfdt/libfdt.h      |  9 ++++++++
> >  tests/.gitignore     |  1 +
> >  tests/Makefile.tests |  1 +
> >  tests/run_tests.sh   |  3 +++
> >  tests/strings.c      | 64 ++++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  tests/strings.dts    | 10 ++++++++
> >  7 files changed, 108 insertions(+)
> >  create mode 100644 tests/strings.c
> >  create mode 100644 tests/strings.dts
> >=20
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index a65e4b5b72b6..874975a0d8ad 100644
> > --- a/libfdt/fdt_ro.c
> > +++ b/libfdt/fdt_ro.c
> > @@ -538,6 +538,26 @@ int fdt_stringlist_contains(const char *strlist, i=
nt listlen, const char *str)
> >  	return 0;
> >  }
> > =20
> > +int fdt_count_strings(const void *fdt, int nodeoffset, const char *pro=
perty)
> > +{
> > +	int length, i, count =3D 0;
> > +	const char *list;
> > +
> > +	list =3D fdt_getprop(fdt, nodeoffset, property, &length);
> > +	if (!list)
> > +		return -length;
> > +
> > +	for (i =3D 0; i < length; i++) {
> > +		int len =3D strlen(list);
>=20
> I like the concept of these patches, but this implementation is unsafe
> if the given property does not, in fact, contain a list of \0
> terminated strings.

This should be fixed in v2 of the patches. This isn't quite as simple as
using strnlen() instead of strlen() because it also means we need extra
handling for the case where a NUL byte isn't found within the value.

There is also a bit of an inconsistency for the fdt_find_string() and
fdt_get_string() functions because they can successfully work with non-
NUL-terminated values. I've gone into some detail about that in the v2
cover letter, so feedback there would be most welcome.

Thierry

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVp5HuAAoJEN0jrNd/PrOhRoUP/jpTiBTMJkP7YIJlnBN30CQc
tJPc9IyCuJ5pYTWEZQUFSjnjx2CQhT+M/Uuv7jL5yTGucDJGyr/P5z9UFtEFH8w9
sVQqkQy86gm7HD/t+qv2QQj405gQ07tTwGVgfS+ZnnmtpJQslV3h51qfmVXZybxR
6w2LuhbHb83XYRGeyPitC+vJEycjc1fw20MSNeszpkHljW41hxDVaMsIxRUjDUdc
jmFIxy0M8kKEJSg2bOzNJW/A+uH1F0z2To6sU4IbBEo6mwe2B4EkuIoMbIGLhJ0g
udv1H0RfPfAeDlY69sLh2JYD37Cia/0lGnV80TJF8gtBpZ8Umbe8cS9Ol9qak6i+
NSaxCMQYMgbVmmAUfHL5r5O2FZEkBEOnVJSAetDD388FxJzPWRaDjVIYRaQn0hUY
AwJrRd/tOskdIdz2Lvf38ZumEZmgNxAucomIntiR2B3QEtleO+rcm1an6to1ZXMB
lLcoBBTFMvRoQV62XqI4paI/0G8gZBvyTRSBWb/k4EkVWXtaIWJkBtwWeavNz6dy
dzaKA6KzZla1PzmNOBFbnMzXGm/kB9sGd773oyEhOzsHChGfLgYEq/CQK1D0UzD0
1kqghf2o5uZgmidceYnHs24zabgYRCTJbb1fNdHF4BJKjkUzK7cP99gol6TXPTJe
3VAhSzMJDEk+iZAwM8Gj
=4ZJ1
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
