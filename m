From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix crash with poorly defined #size-cells
Date: Thu, 30 Apr 2015 10:56:48 +1000
Message-ID: <20150430005648.GA32589@voom.redhat.com>
References: <1430334144-26986-1-git-send-email-jack@codezen.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZa61AII3s1sGKYx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430334144-26986-1-git-send-email-jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--YZa61AII3s1sGKYx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2015 at 02:02:24PM -0500, Jack Miller wrote:
> If you have a parent block with #size-cells improperly set to 0, and
> then subsequently try to include a regs property in the child, dtc will
> crash with SIGFPE while validating it. This patch fixes that crash,
> instead printing the same invalid length warning that was causing it.
>=20
> Test included.
>=20
> Signed-off-by: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>

Applied, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YZa61AII3s1sGKYx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVQX3QAAoJEGw4ysog2bOSqFYP/i79cuWudjkKgXzykE8+GsS3
ufsMdqyD+NgYEa6WQdFUFIcOmuppDfJvPw0GehdDwqAGJduqzgBqpWcQKsp+VpyL
Pm2TYS/BWPUDAKsTAplxhny9IoLOlLgn9uzNsOVaWf9lbXZWaxqmp8GgTbyDoHZv
y/BL0bndtGYzD1xuO3McVE1T5Gc6JwoEKmSGN1RAq0hFpBig+Geu44XqqnQrucT1
QBAD9MdgaMCxI4/fZ1EpfUZCoOzaL2dxk1Mj/OTqnn5q984WHc9CT1QzvnH1y1My
fqYQxrhZAPHtV97/brNApuYeE6K6Lkkm+05s/o2Rbz0ZzujOZGpubQ1QLLRWoRWL
EDJSs11PZG5f2VQPZjIcY1Jq5OMkkfyLHwrPmyRXZm0ZOWNVmepzGRrqJAFqWq6I
qq+PQy0fLOA2GVXFsy46buBd7Njw6Upy5hq+81pdGbQC8ZMWp/mGZAtT9AfaFsik
2nKXazLg+Okvnkw9Cfc2nXp0FvhCNwMpXKmDAN4+D5z80Hqn/LrX60wzAwoTGjHv
PuWokKxM4i5aaZlbbLXQy+D+DsvZ4axsdramEfSuKrXSy91apR+ztTOrH5pHFs2G
mxwIkSGbALRRNnCYnxwW8xGS7uGcHnPvgHor52SrXmHsP7LKm2lCHn0zMzG8wms3
uEw/mJ5/ac/llmpzhldC
=tktO
-----END PGP SIGNATURE-----

--YZa61AII3s1sGKYx--
