From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 5/5] build-sys: replace makefiles to wrap meson/ninja
Date: Tue, 8 Jun 2021 13:54:03 +1000
Message-ID: <YL7p244p81KaDrHz@yekko>
References: <20201207130055.462734-1-marcandre.lureau@redhat.com>
 <20201207130055.462734-6-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vetUxwcXUDAGVj+x"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623124482;
        bh=oNntANYp9aCwYNjp0+VJK7L0SksT4rurSDgnjMeGDqY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U5Dndd6jTwiICdvoIK5enKSv5rKrCytPz1frPeTfi919z3rdqC2vpQGX6fRlq5S6W
         Yn025t9jQzoBpFwU3pC5VKaeT/eFvYZ7Vo1FNwfua9jZd9ah/3lM0tfnSKp/bng1iM
         k/9AUCEWz3QVejmBRMebP0h3f6tnCPZ4S7RcR1Gk=
Content-Disposition: inline
In-Reply-To: <20201207130055.462734-6-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--vetUxwcXUDAGVj+x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 07, 2020 at 05:00:55PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> This avoids maintaining two build systems, and update the documentation.
>=20
> Makefile now wrap meson, so that make all/check/checkm/clean/install
> continue working as they used to.
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Sorry I've neglected this so long.  I finally got around to lookup up
a cheatsheet for how to use meson "natively" to understand this
better.

Couple of issues with this path though:

> ---
>  Makefile                   | 380 ++-----------------------------------
>  Makefile.convert-dtsv0     |  14 --
>  Makefile.dtc               |  23 ---
>  Makefile.utils             |  31 ---
>  README                     |  24 ++-
>  libfdt/Makefile.libfdt     |  18 --
>  pylibfdt/Makefile.pylibfdt |  30 ---
>  tests/Makefile.tests       | 100 ----------

First, it no longer applies clean due to some added tests.  Can you
rebase please.

> +checkm:
> +	WITH_VALGRIND=3D1 meson test -C $(BUILD_DIR) -v

Second, the valgrind stuff doesn't seem to work.  I tried
"WITH_VALGRIND=3D1 meson test" and it completes much to fast to actually
be using valgrind.  Also it doesn't give any error if valgrind isn't
installed.

It's also not ideal that the output from "meson test" is trivial with
all the content now in the meson log file.  Assuming we can sort out
this first part, would you be willing to help convert the existing
testsuite / testrunner to be more "meson native" so we can improve
that?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vetUxwcXUDAGVj+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC+6dkACgkQbDjKyiDZ
s5KuIBAAyxdotNSCa9w3Ynlnx2s+JzanlTAZLWZGWJV9F4p3yH4vPdE+WhM5tmDO
nurfMZlIl3x6cBTqT3OFQglGCMUQYmTon1Wj47YndIrfhRU0jU81kgP+qaOuy4oj
NTh6oKzRnSCc/3Et2/bPTHtgq60I+JWocB0PE2WrrrywBh9MBw4c4MzEeaJBbWRP
TPDy/JsPKhY3amp5ybP6bGWs1H9kzK2zi4lcbEPXXwtP+of2+vpBgL/uWU14KkBj
7hJL2N3WeqiIJji5Uqhdq1EjPmnGUsCJpYWxd/vAB32gTP9OCOeGwR68k0Wx8ReI
t7nuykEoFUKZ79ZdPjsjvRvospCX2+7ZJIeb6Y44UPHp/ftkkDG5KhY1iDBHDelI
PHj9xX2Sv8UkNf1djtIl7jitpGj+Qi7dlV214iulTtJ/BeR90ovO1tWNfuq6P4Fk
O/e+uniIBgDyIEdHz9ADJrHFoDRkKSUXVr4gxG+Z51TDP/X0lI14N7eU0bS5OfW6
iHkKF6guya6Kng5BiemougQn1CBunHucYjtpl5U9FSBV9si0gL2Hn0hPLaIk5EMI
45BFmZZeAIyRc9CBJek2AUk3xYZ/waayA04GUpx7WEdKPPLtKMmJ931eZMZNa2zJ
5N+efShX02fD0opA4alHkOjterkdeS6Ao4yEFW6bTMJtDMVlels=
=5/AS
-----END PGP SIGNATURE-----

--vetUxwcXUDAGVj+x--
