From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/4] checks: clean up string parsing
Date: Tue, 4 May 2021 14:53:44 +1000
Message-ID: <YJDTWGTacZPK6Mzs@yekko>
References: <20210504035944.8453-1-ilya.lipnitskiy@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CwbL2/Knj9mzl84a"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1620107596;
        bh=mphrW+wEUbl5sUT7ORhBDUTiPSwzbDX+ATZI9n5PR94=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J+YUG6Zxtz/3LYLbxfSQPlyLhZ2wUOpzlPj1vGwAgwxXlguiA2kA9VFSMEvOnig+Z
         t5BKuzvTRtuk+U1qaZkqJOAcTCRf3rZWQ884wVPCMeYQ133IzKjnBXMNPO01l8Y0Ch
         SHMANALpAQ63FVdPdaP4yUiQ1W+Wx0vsLFPzthmY=
Content-Disposition: inline
In-Reply-To: <20210504035944.8453-1-ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


--CwbL2/Knj9mzl84a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 08:59:40PM -0700, Ilya Lipnitskiy wrote:
> Add a new function, strends(), as suggested in [0]. Replace existing
> suffix logic with calls to strends().
>=20
> Make nr-gpios exception stricter by aligning with the devicetree spec
> and the logic in the Linux kernel.
>=20
> Add a test case to cover correct non-deprecated GPIO properties.

Applied, thanks.

>=20
> [0]: https://www.spinics.net/lists/devicetree-compiler/msg03634.html
>=20
> Ilya Lipnitskiy (4):
>   checks: tigthen up nr-gpios prop exception
>   dtc.h: add strends for suffix matching
>   checks: replace strstr and strrchr with strends
>   tests: add a positive gpio test case
>=20
>  checks.c            | 25 +++++++------------------
>  dtc.h               | 10 ++++++++++
>  tests/good-gpio.dts | 12 ++++++++++++
>  tests/run_tests.sh  |  2 ++
>  4 files changed, 31 insertions(+), 18 deletions(-)
>  create mode 100644 tests/good-gpio.dts
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CwbL2/Knj9mzl84a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCQ01YACgkQbDjKyiDZ
s5LtQQ/+Il6eVLO9IFUMJsa/DyrzVCiyHdfG48ANTYl0wUN294ogC5fV//roEpnB
pik+HVXfLEBFAqo6TEIUJMqTHlAdHqMROrA5knTk8939XNlVJN5hbPyLfO/WjKNi
R3YPk9azAA4AWfyR7f9yP9yyWwfLIi1qURJ+OGuerxrza5dqQKWyvId5DWsADhUh
ozdw31SziEYweTqIjXkiFH1CN60/C033Qg0IFwP0nIDhH3bM/Sp1oZQwTg4p0IC3
rFGQRPRFOO4CUFE3tr5a09Vpkpff//iPv54VA9dBgJHv+0YEhbD/+QVWeaeeRJwN
T80BsJRXQCQzOtyOXSZY8zv6V/TI1e+vlMW1rSTAJefawxJzf9bvaD61sBn0becB
453wsCXZ4W/ULAD77e40F6BNOt1D3tWr+5kkIWeUGIZjwiKevROAcwz39QxwbHJn
yC8Aq7hNfUjNoN+kNiQjtDZlxcT88Pjicgxsur8+atZN8hsSf1rrOcHKvmbaAGku
wXGn0jCPnSwsGKr5mgPqNmLU7/NOFE/Zm+tz4K4xJEcPWoEjCsBRCSKdOP6rO3H8
a2NSZsx47CXrqQ/sTD4jklnfhHsKo8mRbsnxsIO2C91o9NFJgEmu8igTS0E67H62
8FhkB3RVEP1gogq4teomRilkfxKjoJqRqDVr5MaewZspN+oWKv4=
=OIdU
-----END PGP SIGNATURE-----

--CwbL2/Knj9mzl84a--
