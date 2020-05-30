From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2] check: Add 10bit/slave i2c reg flags support
Date: Sat, 30 May 2020 11:31:52 +0200
Message-ID: <20200530093152.GA1038@ninjato>
References: <20200527122525.6929-1-Sergey.Semin@baikalelectronics.ru>
 <20200527141517.22677-1-Sergey.Semin@baikalelectronics.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200527141517.22677-1-Sergey.Semin@baikalelectronics.ru>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: devicetree-compiler@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	addr = reg & 0x3FFFFFFFU;
> +	snprintf(unit_addr, sizeof(unit_addr), "%x", addr);

Hmm, this hardcoded value will not work if we ever need to add another
bit. I hope this will never happen, though.

> +		if ((reg & (1U << 31)) && addr > 0x3ff)

Same here with bit 31. I haven't checked DTC but can't we import the
header with the defines into the project? Or is this then a circular
dependency?


--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7SKAQACgkQFA3kzBSg
KbZlOg//QVOBxervblGxNh6EaaJKJnG8BWawizgJ3J/y+8fLrL5/Jac8F/0I5mBh
j4gopVhrEJ45xp8Z8IyTUZyAc+gtYnL5+2ARrXCv5RWhOzHbym2EahgkAt5tJtfE
j8ntt3onMPaWTUGoEZOnhMT4qlS5R0cFzcE/hic/TXFKUgs5GNFycK/JTuqdIYWy
0nYLkQw3V+fyXHnBI9pssrx+wmJAlXM+pQzoIDlcmXCNbEPf0Yq5w9TD2svmIkl+
y6MxuryziguQ0YeLEaSVQlxuodi4fdAO0igcOlwmGtUTwCvPozgYN9S8lHNVqXMM
kFZ/jrKWdzSjFQwTjz5lc3dybJWMRip9Dbwzp7yLEYVLt4fbqRv4Hl9pFVfWIeOo
ahpJ4J8S+zrcLs16uOJv/G5q8/UyfCRI3TEd/gJlnvsh/surrNdbcagc4xqYIZax
/U0+EP7GEcFKZ3OE6C8xgSbossurkckTl+khtrSbReaX2iOYMrttOezJ8ttAs23A
wo3QdSPlwWJH66/wPmS9SPJITC/IVHYCCCHPBJBA1WqElU7OojMzyLHT7AIKjgHB
zFN0f8jlJhgbb3S97RLAAOWMwJyauKAFzzy3KQ9Lv7pZii7vi2d+9UbHsshyV2Pm
hcQ0zGzrjwEtIN6zcWZqwVqXyO0aGgfErGCK4IWG7IOEwCzKhBs=
=c1F6
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
