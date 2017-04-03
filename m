From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/7] pylibfdt: Allow building to be disabled
Date: Mon, 3 Apr 2017 14:41:06 -0400
Message-ID: <20170403184106.GX24205@vapier>
References: <20170326190623.27518-1-sjg@chromium.org>
 <20170326190623.27518-3-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nw7Js0ltx4YC415X"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170326190623.27518-3-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--nw7Js0ltx4YC415X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 26 Mar 2017 13:06, Simon Glass wrote:
> --- a/Makefile
> +++ b/Makefile
> @@ -120,6 +120,7 @@ SCRIPTS = dtdiff
>  # We need both Python and swig to build pylibfdt.
>  .PHONY: maybe_pylibfdt
>  maybe_pylibfdt: FORCE
> +	if [ -n "${NO_PYTHON}" ]; then exit; fi; \

normally this is handled at the Makefile level, not inline in the script.
also, negative variables are messy.

what about:
PYTHON ?= y
ifeq ($(PYTHON),y)
all: maybe_pylibfdt
endif
-mike

--nw7Js0ltx4YC415X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAljil0IACgkQQWM7n+g3
9YGlOQ/7BFMhXm9HZyf7uChNvxhRDaaSQe0bNELATBQBt4Yzjb/JJGBDGan0hjYl
LHB9efPD2XaCod3lgm3UBuvcahpneQWwXWriLO5bOEL1+pG6D5f/96e8pa03r/b6
H/o1rGXw4DCyBf10y+ysqcpEOYljLmBlMXN8cRfw9aR32nlZOks2dt/NASJbsoAL
/qEOy5uGeGxzEYYETMW4sjPq/gb5DluXxmvsekljr1kZijrn+J44Sub//2zR6+fr
Lnte2cAa9NEQ+2z3WKIRL0HQJeCCQrK38rBQ+ASgs49aZqpdBorPZwI/ch8wE+t2
iwc/MrQF75u4/G/M4uuYeodqzNFEUqKjjMWZnG8UFfB9j+vBiPe1d97bUbT1wJGq
WWY+Y2xNDYVSrnKRuOG8fI3HEeFVKdA2zC45UHIkH69Pyiu/2kLyqFKcPBXuAW9p
0BfaWMsplQvs8p/nxDmORHf0slmURmCwe02ewvid53gIAsH3Y5gPU7bk1WmdkEX1
S3+4z03GDWYXO0OhP80H3eP/Eph5jXIlJJNQ5QhcqqAse0O4hhnxHtV+fwSMnikS
AjRmoUhXzTvhdjA07c2+qjb9RggqB+vwBgRHhNuDw/bl1hhA4X74wVEdJaI1BwcM
3di1lvJwLsHepEaYpcOp3p39QEXagTS4s8HA6fjjV2lJHUygpfU=
=Lw56
-----END PGP SIGNATURE-----

--nw7Js0ltx4YC415X--
