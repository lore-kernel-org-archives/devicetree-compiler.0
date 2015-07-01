From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 0/2] dtc: simplify command line invocation
Date: Wed, 1 Jul 2015 13:35:00 +1000
Message-ID: <20150701033500.GL26353@voom.redhat.com>
References: <1435707088-12800-1-git-send-email-osp@andrep.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KSn4sQg3MnruwCB4"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1435707088-12800-1-git-send-email-osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--KSn4sQg3MnruwCB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2015 at 12:31:26AM +0100, Andre Przywara wrote:
> Hi,
>=20
> as promised the revised version of my mini-series.
> Compared to the first drop I do not bother anymore to do file name
> based guessing in case of an error opening or accessing the input
> file. Also the .dts heuristic (first character is a '/') is now gone.
> I omitted the third patch ("allow a second parameter to be the output
> file name") entirely.
>=20
> Hope that fits better, if not, let me know!

Applied, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KSn4sQg3MnruwCB4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVk1/jAAoJEGw4ysog2bOSZewP/1OuqIhdluULN4lfd0F1XWoY
rBzayceoBR5BUEVFqxMnosctwyqr5hSHy1/qMftmt3ZSjAfHtA/8CaTkyussW0zN
t0JxJFatc9XkniB3hAJXUqc85jLazIWmojV0ZUJj39gNp+NyENHLIYBggKmg35yt
fKQHvrv1sK6RYD0eIKK7qz6TbB3Caw/UlzFVh0VX+diQeNfLOonTF4y2cj4QNZft
+mQ2v8fCGl4oGvYIYDh3cOm1vdCFW/UUzvXqCkmGbf48/RKewb4vIX9Fdt1fGHDF
CdZ78O0CsqY543gio35JyIvYobocDZ0vpJAFQOL5b5tqcKe2XR/YhT0jfObREnml
ktc8NXTyHQvzJmNIgn33BC/pJeM8/TaaWbS2lTyC0UiXDbEwLoDyssu1Ot9lRi7X
yvXDbZZjz+dZsvG9Z5JRVg/pOFhSMYOMoYB/kI36prDPzUukKlH4PVUmSCtCB6gx
78sOO1jiG2BRMfLT4KvnnGNrUkEppg8C7bwO6iKf15jLk7mhMbdk4JFx/w8PnFdA
YRuEaItIfWzTW9nfIpIqKv7rFxhU+QaXh99b/SDsxKcbRtbsXtza9mWxXecMx6Ic
mcOB+vcamjBEE1dU5xtsz0QG6MnFbWp0VT9PAM9s/X3pDD3sx7crB5ykFxHlF6Wv
iSxF7yCM477SsB8j0VEl
=XP6l
-----END PGP SIGNATURE-----

--KSn4sQg3MnruwCB4--
