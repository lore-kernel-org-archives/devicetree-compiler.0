From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Add a couple of string-related functions
Date: Tue, 29 Sep 2015 15:50:56 +1000
Message-ID: <20150929055056.GO19428@voom.redhat.com>
References: <1437045021-4549-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hOh8F6DNH/RZBSFD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437045021-4549-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--hOh8F6DNH/RZBSFD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 01:10:18PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> These three patches add a couple of string functions that have proven
> useful in U-Boot's copy of libfdt, so they are likely to be useful for
> other users as well.
>=20
> Patch 1 adds a function to count the number of strings in a property's
> value. This also adds a new DTS sample along with a small test program
> to validate the implemented functions.
>=20
> Patch 2 adds a function to retrieve the index of a given string in any
> given property's value. This adds code to the test program introduced in
> the previous patch to exercise the new functionality.
>=20
> Patch 3 adds a function to retrieve a string by index from a property's
> value along with a shortcut for index 0. This extends the test program
> introduced in patch 1 to validate the new functionality.
>=20
> Changes in v2:
> - Safely handle non-NUL-terminated values. Uses strnlen() instead of
>   strlen() to restrict accesses to the property value.
> - Return FDT_ERR_BADVALUE if a non-NUL-terminated value is detected.
>   Note that for performance reasons this doesn't always work. Cell or
>   byte properties can look very much like NUL-terminated strings. The
>   fdt_find_string() and fdt_get_string_index() functions can return a
>   valid index or string, respectively, because they don't look at the
>   complete value to determine validity. This could of course be fixed
>   but the cases in which this succeeds the user did ask for trouble,
>   so I didn't think it worth the extra effort.
> - Improve documentation and tests.

Sorry, it looks like these fell off my radar for ages.

They look pretty good, but there are a few details I'm unhappy with.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hOh8F6DNH/RZBSFD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWCia/AAoJEGw4ysog2bOSiKEQAJnLp/kD0nF1VVpONXj3/8X0
Yy1gQnI4rGTVI61xDVi/pZ1TPHwugUfPtiNnJRds/GMVVDAW8pWB4EqX/RlglTYN
tb3H5MdyKh7k5aLEb9NmLHVDH44Z4C53+OOE4lBIzXMf8Bt9MAGzcnxIFBtOluZ/
+pzJI/rp+ztuR6IeLP2fX86DH4Z8wLRUOr4I3LTnzsm0P/WRS5k2z7/vjp6HyClo
Ceu4AHhQ9TxV9/siHCMXovGB9JEshTZqdshLaji1OsziN0TIt4AqB6BlloP5+AP4
m6dgIohqUarW+33cY7r2ijjS9P3UJXrpZX9HYfKTvcawHJ+/3UN2LXKmwO+ukUup
ssc/KwJX6EuRWhkN4s6fSJMXsxC+szwGeur5s7sDGGuaQHFCMTT4hi3Q/le5gCOF
xkM9vi8TRKGtZ8Y0bhsyOJQqvTAKWQ4JKcTHXgLsklHyD6+l0X6OUh2EUHlrDPB7
138mdfxV0avbou88f0myxBZDCMdQg8X8IIeOXeYhHjnlLk+jMmSmVioMlHV1Ygr+
vVqKGAdh2mmdCSJ+6dicOPOKZYnDjmhwsMy3QMdWWikbWY08ZhjvNteNQLQOarF+
JHF/cCqy/Q0qTjHHYSjJPh6yk/+0DO5/ziPWjptychrtrQBTRXhbmT7b4tScBxlk
Ynay8xAMM1+/QoSuhSCB
=XVam
-----END PGP SIGNATURE-----

--hOh8F6DNH/RZBSFD--
