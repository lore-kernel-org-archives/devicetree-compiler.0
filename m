From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] fdtget: Split out cell list display into a new
 function
Date: Mon, 21 Aug 2017 10:29:57 +1000
Message-ID: <20170821002957.GE12356@umbus.fritz.box>
References: <20170820122855.171271-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1503279685;
        bh=woeb1/0PUK28bcuWBICbfAs9m+bwLZ19tSqMM7jLxRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nloh/ihN5uKkWMIHjLzga1sxt/SQ0/nxThPO59RuqztxdAwOxvJTrZkEaz2iXcwcy
         8jC+dw/H3p5YiJCEbR6p/jVccDQ4bpdN3xA56Mw26LhLQdBa0zAlLX54UtTYdl1rot
         BFOvKOxOcLpAS2EyrCcwxFqCGTQRMuIGBGw3N7WI=
Content-Disposition: inline
In-Reply-To: <20170820122855.171271-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Clinton <jclinton-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 20, 2017 at 06:28:54AM -0600, Simon Glass wrote:
> The show_data() function is quite long. Split out the part that loops
> through the values. This makes it easier to add new features.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Applied, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmaKYUACgkQbDjKyiDZ
s5L/ghAAoICowpL6WqIyo2PTDFbq7i3QGJye4RQBRWdLkAfY4nWF4FNJYg7UxJN3
Pm3l58GRAmTAk22VGCgdFpbo6HXO5ekizke6bt4RpJe3seuQM1Wpv9Y80CI213Su
Hx2iZgfDJFvFNMDxh7ysOMRmU+LITnlgecHKDUOoQITDnzY1p5NkZZpEzZmoZ/s6
s+Fh3xsZhC9bys/d1tANUK/Q4Cxc3X9al9ifUUp9v1NHpYsW1CxYHytP0ZzQH0/0
UvNqnDG465JrtxX+c+lKF2cwgWXimdaE7AKLSOwjsf/yPlARkDc79pvFvUEOhhxe
Nij+VMbkQAEfODlwN7Vd53TAkxzgtNQcuv++qSqTn5PaPyOvmPZk0Q8TNCH9lglw
LAxfeiVu836RGrqxRxmZfWBgtNNvdcEgR0rv/jOFJRpZRXmQfp2/bs4tEK88LEq0
PV4ExjjUh2xLpJj8FdeR13b3XypEDPS30HDDY34TW1pYTJC7EvHq6RfHBJqHUyIN
y+u7OETJ1ELA1AP5aMijYBaNjCIUd66JthY2vsyD9zaBhp/4KjeOA+RbHOeTjtxB
9ZRCvy19rQaPTkbnc0ZCF1a3bFqGc6HMCL3kkbn3HnxbaKsNoftcjb+ckym0/yuu
9l71OQDqR3JHqeker6ajJAlmy8ulIIIONMTV0kZMz9HAqdnx7z4=
=HhsB
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
