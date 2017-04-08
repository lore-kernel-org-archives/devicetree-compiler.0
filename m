From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 0/3] pylibfdt: Add installation support
Date: Sat, 8 Apr 2017 11:59:34 +1000
Message-ID: <20170408015934.GD27571@umbus>
References: <20170407215134.2477-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1491617079;
        bh=/Etc75nhmEokcZXMZJzPEQuoOFjJqEcz0qeMvZ+NLMA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oXKUitchG0YbIjv029KPDfDkIZcsLUYUK2Xh/wS2OPUuPiID+LsYIlOck6EsxYXB2
         j8c2lRYa5+EKz9qwZQlOqZLuirCVh1zuRUEhyQnrFBMGx7k1S5oMNp5SQo1k3QBt0o
         cF5BgN4JvXnHZ5p7UOnpIg1dfXXbxDDCFVEFhdgE=
Content-Disposition: inline
In-Reply-To: <20170407215134.2477-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 07, 2017 at 03:51:31PM -0600, Simon Glass wrote:
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
>


Applied, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY6EQDAAoJEGw4ysog2bOSBfUP/2tuF9agFASGHA9ovPbgMm8E
RELZVfAs5AaNlePo+OtkrOjAodsdQgTH1OUO6mTkpQCu0sbB/LZVGqIbEFGaqrdd
iZOYGD0+uxNqGagVGAI6JowFeh5MmUEuEC4t/V1oKr9k5oy2aNjjzNLOhxiNvQff
9Cxo9dg7TpQF0JoFjS3+7jyUUy9xfslMEyVpW+OKL7h0sOoSrdSN+UPrihdLZBB5
kyGuQzTyliQx+YtnOzbApx0aNu39qF9e9nebt/wWk56fAQZDFNQgqQYC5ps4LP1Y
h19LVBGUBhqnpF8SOaayyfoduuqqHrJW6MBd30gIbiqtXWSEPchzaCy6oYDEqsq9
PHHEymcKSO9kMqrzKiaTz5gHXaK6P+gbTYGsrRw+yHL1jRqaCa534VypPPydRdWJ
eFibbJ/ozWAsRqbsgCNSEJAu0l/Ap1XjICtUvI8YDt7z4vlSBh4z+CBGw0T0EbHF
Pljl+esR2uggIi8QluDJLmrY1Qzafb4+XLaZ91fHowB9hK4efI08GbHZOBOl/09v
O75eOMYLVKy9y86rd1ZDKtLHzgFMYBRahgQdGlPlzq2zITCeCDdLcOJnBDIuYfsi
PQmo3CDKfjBPXPt/mjK0vOIovCviZovVsTI0E3eqci7nFuLzM+S5A21+M2OdrLxn
KEa9U3JbXhq0mCbaBj8A
=Vh/C
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
