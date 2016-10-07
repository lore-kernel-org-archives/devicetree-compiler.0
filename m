From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/4] libfdt: A few overlay fixes
Date: Fri, 7 Oct 2016 15:08:35 +1100
Message-ID: <20161007040835.GA29155@umbus.fritz.box>
References: <20161006113959.30865-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1475814749;
        bh=SF3rn05oIJS/hySHOJ45/qBwUlYG7jV4EDCm9XNHHl4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SxNFaDs/LQydr6AsKih4cxDRiQzFE8hsE1iweKgvvJjh2/NYfjnYroCgI+n8J4AO6
         qZigirby73umSyZzetubxW6GGb7xJuzh6MZfTVDOwJP/WtIYn8HIDOVclI46EWvpx5
         qODbmM5Yqv0VmQnL/b3hzUA2hguMz6RPUtLKnhTU=
Content-Disposition: inline
In-Reply-To: <20161006113959.30865-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2016 at 01:39:55PM +0200, Maxime Ripard wrote:
> Hi David,
>=20
> Here are a few patches to fix the things you requested and a few bugs
> encountered while doing so.
>=20
> Let me know what you think,

All applied, thanks.

Couple of other little errors to correct if you have time:

  - BADOVERLAY is listed twice in the error string table (a hangover
    from when there was both BADFIXUP and BADOVERLAY, I guess)

  - The testcases re-use the same file name for the intermediate
    dtbs.  That's not a terrible problem, but it can make sorting out
    what's going on when there are multiple errors in a test run
    harder

  - Generated dtb/dts files during the test should generally have a
   .test.dtb / .test.dts extension (makes gitignores and clean targets
   easier)

  - In order for the apply_overlay function to be usable from the
    libfdt shared library, you'll need to add it to version.lds

> Maxime
>=20
> Maxime Ripard (4):
>   libfdt: Add BADPHANDLE error string
>   libfdt: overlay: Report a bad overlay for mismatching local fixups
>   libfdt: overlay: Fix symbols and fixups nodes condition
>   tests: overlay: Move back the bad fixup tests
>=20
>  libfdt/fdt_overlay.c  |  9 +++++----
>  libfdt/fdt_strerror.c |  1 +
>  tests/run_tests.sh    | 14 +++++++-------
>  3 files changed, 13 insertions(+), 11 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX9x/AAAoJEGw4ysog2bOSab8P/A+mM5j8G+FgtJSh9IqVMYsD
oQ3AevBbcZzWuNdYdLtXPoY5HYkLrMvcfLJrLxcr+IEIj0/+2bOxPEklOGrgxhwd
WkvlOdaeMIU1QVNs2KKmembxckeT91hFrR9/Y8sfALH6coZ7oCd21cMg8nduEiTT
AAaidK+uEaTxsGPo1XiF8JQxS7up+ebrIA6qKUZcxePMBB5MObz3KI9Hx+GiUtMW
Blm/lSwu/7vhplF37kiYx2t1XQxcn8JDuhdAaKjLv4s0y1kZQuowVC73FNWdnbIN
Pb0AHwDr1nGHZakxQDysMQeQSeNM3aapzPyn1EIXOSnZVKR69XtuUjcxJb0ATRQD
a/owrrSRoJmgOOpmDcQiE+DRfeV9CdLJRQHdJI/UCRqaVfKhW+oDAA4tGaNl+/BU
FUQEdFNoBnHyCLDncXdnsNSQ8Ugu4MRKDhFyS4az+QR5cB9VZKDLs4bTlT911JyO
kWUpNiFP63x5vh8Frh77lUCKAw2kr3QozdMU1aup67DXTbxBoML59FP73QyHe3Ue
UURuvIaW0jlasioVSq4X7bNnGbAKS8MvRlUWqJpQvxagEr4PET8ZCM/jHQt7/Vp3
fXOJTKtquAr6VZR9H9E9U2FOfgKcv3xtvRB8MPlSuLWUCFJ1DGJPCR+T1qp9T59R
4Y67oHEc0BMu9K6Z2zar
=vQ9Z
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
