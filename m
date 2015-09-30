From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Add a couple of string-related functions
Date: Wed, 30 Sep 2015 13:31:32 +1000
Message-ID: <20150930033132.GD13035@voom.fritz.box>
References: <1443517748-27819-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443517748-27819-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2015 at 11:09:05AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> These three patches add a couple of string functions that have proven
> useful in U-Boot's copy of libfdt, so they are likely to be useful for
> other users as well.
>=20
> Patch 1 adds a function to count the number of strings in a property's
> value. This also adds a new DTS sample along with a small test program
> to validate the implemented functions.
>=20
> Patch 2 adds a function to retrieve the index of a given string in any
> given property's value. This adds code to the test program introduced in
> the previous patch to exercise the new functionality.
>=20
> Patch 3 adds a function to retrieve a string by index from a property's
> value. This extends the test program introduced in patch 1 to validate
> the new functionality.

Thanks, I've applied this.

I did end up making a couple of small changes.

First, I forgot to say earlier that I also wanted to change the
testcase name to stringlist* for clarity.

Second, Travis CI picked up some -Wshadow warnings: in a bunch of
places you were using 'index' as a variable name, which shadows the
libc index(3) function.  I'm not sure why that didn't show up on a
local "make check", but in any case I've changed thos to 'idx' to fix
it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWC1eTAAoJEGw4ysog2bOS35MQAOOoOx2x/iZ5rR4tkE2RSUoP
nixMi8sfUn4ic9m548TIbwRu7WO8H3i8+I+GVI02d5vHrWLlMU+djQALGdT1W5DW
kxRbNRCouAkPWB3Jm+Ji9S5KSMkZVZta89e7JchiM4LTYff3JswtxeTiryF8kMi9
Wl1xct+bjEK4XGVGwYgFmWtE+UgnoUdB15daubv8WNLZCavLB9n8Ods+tIq4tYqR
6+DRwjya0vw89bTJMeNKqUW+ymGGNelGN9nBGjhb3PmUq29oZr1MiQHkHczYEgay
KXZCqtOI4zG2anaIXthMQrCYXIhY+Itojx2Flp3dgz8cxY2y+2NznMdE6j4UqqeP
TRuERCwhXVeZ5owcMFo86opJYpdIPurb8bkC+9AZZy0LONGnWjDq+NJdxf/hOPRI
6nQyfkQ1y2PmZ4ZhmQR91E6GhxgTT+UHDl/pIMOrofWofiLkCRYeL6TKljuBEzoQ
7UFJ5Xno8DseE7tGBI2bijn0AuQv6D1YhkoQ/A5gnLCeuCTl9PsuVg4rQOii/PCy
kGyHTeBrdk/j+hRY3XYj8tHTVAh9cj9BOlN2ctmQk2/ljbc7+q4MFZ9MiQxTtUAJ
5bzuseE2GKso+qSO7SJnfqTlyHSGMa4sbpekaQWxRmdYt0O1lPJsl2NNVaGtvhWw
1B+un/IoRR+Ao3/lLMYv
=rAJA
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--
