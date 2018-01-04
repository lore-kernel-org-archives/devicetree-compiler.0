From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: DTC v1.4.6 released
Date: Thu, 4 Jan 2018 14:03:33 +1100
Message-ID: <20180104030333.GV24581@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WWBpDPuG52WufD7Q"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515035330;
        bh=JitAgOoSf/3c/LtAlJEbY76eXDuyhywKo7Qnk9NWUns=;
        h=Date:From:To:Subject:From;
        b=ceewOsALFeJPwDqG2/BwSpzJjxtZZqIG76+T2et1jsWp9QAwhznA8rFi1f7pAF/U5
         bNrwMl4y+ZXhv6fjsmplB59P/caMC1wiF04/m8jhLzZZcVDhjUaAn2pD7DbtoZ2Be8
         nbk7AbPTUji0xHbinY4lk7qO7k4N8FPS2+cfNTMY=
Content-Disposition: inline
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--WWBpDPuG52WufD7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi everyone.  There have been a number of useful bugfixes added to the
dtc tree since v1.4.5, so I decided to tag another release.  The
signed tag is in the master git tree at:

    git://git.kernel.org/pub/scm/utils/dtc/dtc.git

Or you can download tarballs from:

    https://www.kernel.org/pub/software/utils/dtc/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WWBpDPuG52WufD7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpNmYIACgkQbDjKyiDZ
s5KUfBAAk23S5uEbFLulK86MTackuJZ4mZ4GBPsTKeode2uXHTDyH8K4237AWJoM
YEQ7Y8/r3Sf9P9cWa/orcW2UcsjF+nQPkJ62ljou4oYqfxIPbKFui4LkzpatyLv2
6S6dQL9M6JzPOGAXvBxltBE76tdeD/44YmsNoY9AtrB97J4lThbIVTkZiraCRwga
T3JQF8ccoYct22YQhYcQLCFucsu0dZcGWNvMlJTdM2NiX5+4wvXJNPJ+HH8djXVO
RyIU4jS4lc4Q0pqbot0j8fRC2XGcFll6eyQYcvYKNZZ+bLM9oHdEEcK3yBIS8NWe
ePwxkh/Rlcfm2Fiy2W1RxZhdGELhoQpFbLnxT+AdNYGnFjyfPExhN0sc/5GBqCwJ
H+/xRmMKlVO4mpJoI9b57WX4EkwnwKGIP023UY7fCiHB5szfTM6D3cZsI2EXWGMB
8+xCzZjp2xIOGAwGNUSZdIR7onbw/EV0KcFWf0Gp5ZKjIdGf08Rx+5jzQJ+AwRN6
5vKjkjvEJsu7iiXkSO1aEXJEOMmao7+n/z+lHi8JwnchiFssKozg9PAt6x5xOJkJ
80xeDPib78wI7l6htJ/hEA+NDM6/NOaKyRIEImYQFQNKoZ0JONqrwEy2qCAQvcea
V7ngqW87vD6TBWKy4JX9My2lhle5jovDOg6wsk0a7OvzkkJnbDo=
=kUS3
-----END PGP SIGNATURE-----

--WWBpDPuG52WufD7Q--
