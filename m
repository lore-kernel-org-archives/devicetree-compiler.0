From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/4] libfdt: A few overlay fixes
Date: Mon, 10 Oct 2016 12:08:19 +0200
Message-ID: <20161010100819.GE3462@lukather>
References: <20161006113959.30865-1-maxime.ripard@free-electrons.com>
 <20161007040835.GA29155@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161007040835.GA29155-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Oct 07, 2016 at 03:08:35PM +1100, David Gibson wrote:
> On Thu, Oct 06, 2016 at 01:39:55PM +0200, Maxime Ripard wrote:
> > Hi David,
> >=20
> > Here are a few patches to fix the things you requested and a few bugs
> > encountered while doing so.
> >=20
> > Let me know what you think,
>=20
> All applied, thanks.

It doesn't look like it's on the repo, did you push it?

> Couple of other little errors to correct if you have time:
>=20
>   - BADOVERLAY is listed twice in the error string table (a hangover
>     from when there was both BADFIXUP and BADOVERLAY, I guess)
>=20
>   - The testcases re-use the same file name for the intermediate
>     dtbs.  That's not a terrible problem, but it can make sorting out
>     what's going on when there are multiple errors in a test run
>     harder
>=20
>   - Generated dtb/dts files during the test should generally have a
>    .test.dtb / .test.dts extension (makes gitignores and clean targets
>    easier)
>=20
>   - In order for the apply_overlay function to be usable from the
>     libfdt shared library, you'll need to add it to version.lds

I'll deal with those this week. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX+2iTAAoJEBx+YmzsjxAgY5UQAKb9VMyGzRO4ccFwN/RuWjwM
cYMOa6M3dIGi3KJscCMtXTT2YM3Iko95Rtaf/GNBHOED32oqDOWv/al6t2f3NV32
Jl6xPD31CsnoMzd/B21xyFBZJL57jhxzk3GgkWJD83hgbMi47TZO1MYkbVqeKt+H
BXeTd/RsQ/4JGrhOouRuuyBvmC51f037eYWJPjid6AFrUUzxYatlAFdQkB8/mRLx
8C5ErEkH1UNWyxZ1dcA5IKtGFqbAetM4KBWalh+EPjRIqQ1Yz1E4XK4DMpqHwaLk
yhmGrAO2Lmt6gma8EWKz5ossQsixWIUwV5zj6V9oi/NkAeahljjWfjP/z+OsOIbw
K2Qteo0+5xDEXBA9tUgsgOH3QBUNAvBCO9WQSiQmtrZbiawfM7fXgpBu5hXbxlzK
x1nFpAZMf2qslyC72zWKhH8gl337XYt3qu2Dp7ihM2jqJfMjKhxVqCXHN6yFB54U
kyRWqkRAOe9pkn9+NMnvBY1LCblBnIlUrh4QV9o1D3A+dX9qI8cQBKnrSSx2s9uD
0l/NUoOCATD6xoWo3pqaCMQUNbErKqNWx+M3W1Hswb5X9mY/Qob4ZHeoAPE1JlYZ
4zijfrJ15SEWMFeb958SLMP+qWvmzc47helKPtMDDEyF5X8qI3SwWDx43QXzlqyg
JwJ8IBCtAc7KDYBuQbUF
=Kk7Z
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--
