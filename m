From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 2/4] pylibfdt: allow build out of tree
Date: Mon, 12 Oct 2020 16:49:18 +1100
Message-ID: <20201012054918.GA71119@yekko.fritz.box>
References: <20201006082712.241224-1-marcandre.lureau@redhat.com>
 <20201006082712.241224-3-marcandre.lureau@redhat.com>
 <20201012054319.GF4787@yekko.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602481764;
        bh=GhzHeikLCS2jSxbmN7F04iEhsFWUSfhk641GN/WTThQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FQPgYPpcAMBdZU5XJats0GlPvBISS0HoK0NJb4DiLYM5LU+o2fvvFzNs+1mbDWFd8
         wnk6LGCgXwZoJiqqnGO+7WfDkwr4Bk3wL8IzqIe4L+sr9txqkZPvvppjM2RdyRideO
         nhXefFXd/uFA5yjTAB6HU1BMyFxUInks51mkRRKg=
Content-Disposition: inline
In-Reply-To: <20201012054319.GF4787-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 04:43:19PM +1100, David Gibson wrote:
> On Tue, Oct 06, 2020 at 12:27:10PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wro=
te:
> > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >=20
> > With meson, we have to support out-of-tree build.
> >=20
> > Introduce a --top-builddir option, which will default to the current
> > directory to lookup generated filed such as version_gen.h and output
> > directories.
> >=20
> > Other source paths are derived from the location of the setup.py script
> > in the source tree.
> >=20
> > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> Applied, thanks.

Wait... no... unapplied.  This somehow breaks the auto-detection &
build of pylibfdt.  After applying on a clean tree:

    $ make check
    [...]
    ********** TEST SUMMARY
    *     Total testcases:	2033
    *                PASS:	2033
    *                FAIL:	0
    *   Bad configuration:	0
    * Strange test result:	0
    **********

That number doesn't include the pylibfdt tests (it should be 2070
including them).  Plus, the extension module doesn't appear to have
been built in the expected place:

$ ls pylibfdt/
libfdt.i  Makefile.pylibfdt  setup.py*

Explicitly running "make pylibfdt" works around it, but I'd rather not
have to.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+D7l4ACgkQbDjKyiDZ
s5Kovg/9GZBCSEhZFV8gbDvha0PsGiBYuo5f4jHkXZj1QfF0ODFrvHc8qgfng4lG
A9YZsUjGWa/tgC9hLviLU02T++l/fhlvEuTo8zAIj9ruxfl24dijpOk0cd9/WCug
jxiAMs7DW6nXCgG7PehIs5J2maAdVZ4TSTdiamdp875WbJgwFDPU1S4sAHzHbIbC
ayKmufhgRC5kXDfojsbieHt63NIrTIxfbeHFFXCxxThl2EycNk3G/ife8upQnLkt
xFHgZlIzQT47di0/dr+uO+WjVQb0vwZpA3vh7BC5lJn8eUZem39XfzjbDh1mW6BL
ayQBGndclkK+KqZEaZgIXCYphrXoW3q3LvNaq5DYhwD1c+99gnv+EOBDJSHDvDPn
Q1r+XWyufSc+yT1KsoWphImPUhNGhi58C6GWsqbrSdjuywqB6w0EjP2VKNa4db9G
3gUVZfXhqsFY0+xFfjUTA/u5SG5bxaiIHfBlquMfMsbWhx3eqxlcbwQd/XpHiTVv
HdHDSIHnX66APx5TJJy1Ihnf//bYk5t0/d0rQOD9SRaZd+4gBb9m7rZE3JldcMIJ
DQU4W0PrBVCEDbCqUdwApubplU09HHhvreXMq69FMdv6uWglLL+BmEyXWJeylgCY
759BTUKPEgxf8pK19bB8BsdRvnEGqTQEpLAudHQfyR+ikfTrm3o=
=+pLy
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
