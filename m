From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 0/5] pylibfdt: Add installation support
Date: Fri, 7 Apr 2017 15:49:43 +1000
Message-ID: <20170407054943.GC27571@umbus>
References: <20170405160142.10564-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1491544188;
        bh=HUVqH/XS1Buy2tLMW9/1fLuxFoWC4Nqh1b8KHDsbT7s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E49qYP+lniHVhjYr/vYNqYmaNj7GmL6Yks8XvKmG5QC09HKxVzyhYX7OmIqRL4nEf
         eo4mxRpHwA1+CW2EOC1bL3GF+e0+ScNGzoeqXWDKoxVHtKeweC4TkHgrH6CIqbX+BE
         1K9mvCnhcurTEVngYRZucKUaIUMA0LMkuzzVpjhQ=
Content-Disposition: inline
In-Reply-To: <20170405160142.10564-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2017 at 10:01:37AM -0600, Simon Glass wrote:
> This series adds support for installation of the Pylib module. It adjusts
> the setup.py file to provide this functionality and the Makefile rules
> to call it correctly.
>=20
> It also adds a way to disable building the Python module. This is useful
> since some build systems want to use setup.py to do both the build and
> the install step. In this case the correct build commands would be:
>=20
>    make NO_PYTHON=3D1
>    make install_pylibfdt SETUP_PREFIX=3D/path/to/install_prefix
>=20
> Version 3 adds support for running setup.py stand-alone:
>=20
>    ./pylibfdt/setup.py --install_path
>    [--prefix=3D/path/to/install_dir]

I've applied 1&2, 3 breaks make check, somehow, so I've left the rest.

>=20
> Changes in v3:
> - Add new patch to fix code style in setup.py
> - Update README to suggest using setup.py for an easy install
> - Allow setup.py to be run from the base directory
> - Make setup.py executable
> - Use define..endef instead of line continuations
> - Add new patch to move to Makefile constructs for NO_PYTHON
> - Add a new patch to use setup.py to build the swig file
>=20
> Changes in v2:
> - Add new patch to rename libfdt.swig to libfdt.i
> - Add new patch to allow setup.py to operation stand-alone
> - Rebase to master
>=20
> Simon Glass (5):
>   pylibfdt: Rename libfdt.swig to libfdt.i
>   pylibfdt: Fix code style in setup.py
>   pylibfdt: Allow setup.py to operate stand-alone
>   pylibfdt: Use Makefile constructs to implement NO_PYTHON
>   pylibfdt: Use setup.py to build the swig file
>=20
>  Makefile                           |  13 ++++-
>  README                             |  14 +++--
>  pylibfdt/Makefile.pylibfdt         |  29 ++++------
>  pylibfdt/{libfdt.swig =3D> libfdt.i} |   0
>  pylibfdt/setup.py                  | 113 +++++++++++++++++++++++++++++++=
+-----
>  5 files changed, 130 insertions(+), 39 deletions(-)
>  rename pylibfdt/{libfdt.swig =3D> libfdt.i} (100%)
>  mode change 100644 =3D> 100755 pylibfdt/setup.py
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY5yh3AAoJEGw4ysog2bOSeYsP/RkFxx3ety6/hy/xwM4pd07E
5vYqHglki2oXWGW1lSalmVumtHpW1NYHfQOLQCt0+5G/uxoPdRZRbVMaHiZ6svgA
kHumUWUTQiQEV9gI2tFcQDx3CvfdkyzvBnooXUHxM2tAAmftKW5K9lwFkwiO0fJ4
VZDQeRcDQDOBodK8DTbUXGlMXvG8CPgPYtSlG2tvTEEu3Vn1qvpPIAYWK3BA65cv
B23on3/wGJz6B7WeJJBlCaPqNFB1zzS88PkJBY57R0ScUGETyND4XAAqs+vKSjKk
vdiQNeF326FNXLdd2UniPz6rGtwN1oiup+ByT7YImVYSb+I3n7B+YBG6W0mq37w5
hQXTCoJl1gZBq875fvWIfVXhHMXuko1R8cJMcwf6kMmtXtinU5tiBTGbm17lTwZW
EiSpBnk/2ZC3U+TyrodZNk/t9Ug2HnXydVDrZrGxH1Z6fbUy/D8rqoY6t2v48eH9
WbpTd89hYhaY5CzNlcXvCsZKQ7NaqY9LHCL3tDGSc85kcKpniZq1g6JOLOlnHTY+
goyBen60dQVW9M6ZRFNtnJL/APVYuW1zZUbYWsWBxTI7Eo8q5YhsXAuTslKADAYJ
jaYN4Oq6OaqlLYjTtVcumIZFSc8WzHI6eO30nRSHEQEITVC+eDQufgC7fdR7JJkm
w/K3BcNIJck8+yhogXOF
=v1kZ
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
