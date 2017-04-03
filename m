From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 7/7] pylibfdt: Use the call function to simplify the
 Makefile
Date: Mon, 3 Apr 2017 14:44:07 -0400
Message-ID: <20170403184407.GA24205@vapier>
References: <20170326190623.27518-1-sjg@chromium.org>
 <20170326190623.27518-8-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cFzf7FtGyCxP0iFx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170326190623.27518-8-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--cFzf7FtGyCxP0iFx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 26 Mar 2017 13:06, Simon Glass wrote:
> +run_setup = SOURCES="$(1)" CPPFLAGS="$(CPPFLAGS)" OBJDIR="$(PYLIBFDT_objdir)" \
> +	VERSION="$(dtc_version)" \
> +	python $(PYLIBFDT_objdir)/setup.py --quiet $(2)

would be cleaner to use `define` here imo.
define run_setup
 ....
endef
-mike

--cFzf7FtGyCxP0iFx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAljil/cACgkQQWM7n+g3
9YG6Wg/7BvimdQXEpoqgwXPbsjnRCwdoakR6SHoDwwRLxyPU6s6ZOq27Qpmtk6Pl
Mr79zqOGt1Q0jzV/NbOAe9xVaFQ9/4X+Wx55Vm/DugpNXSgBsKlGhk3ZqJZhlFBk
z20USwpjNuivT7NhWFrB7Sz2sZEQnOsKffOuV0rVXMrYoPacCYAViQaoe/QEJg8Z
0sJtCop33v1ZdYsSrx0IpF/uZ0gaxtBoG2YPI1n96uL1m8Lzagv47qhzksyRxtRa
/RkSMf4TlLZp9m8TNhtPOaRJ7TNnnEl4BBmVc+TMC6Wxd7qkiN7LNog6+dqpo4yf
VF8x3sfiw4MzyTUUNTLcOJFmvE7XwDWOyhjp2LlzAUVxZbb6g0G03QYl0z4ztyir
LPhhE8FiAdRnEFT9BCnakq/XhRO4/buliWcnnw6qilaMWDXhZq/dR556jAvYCXDs
y5x5Vaz331p/H45A7Nw5dSRRuISgvhWGRn7+gV2v/N4YRO+oQDkwiGEBrIC2j5ge
g93Bfhtmx4GsZVaejqCH/jMy4hinrO+n1j53IUXx6uPbIPe7WFeDGg2l8428VQ+5
MoDuPw9fbxg987rdzz3/yExA+URxsbwpSaD7s0efxxnt+tgko3hsvCTWgoKMsGHT
541HB3O2c5WBCj073b4M+YKWMibO8P2N9Po5dfbad0oLw6ZbVJo=
=Nu2B
-----END PGP SIGNATURE-----

--cFzf7FtGyCxP0iFx--
