From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] pylibfdt: Compile and build libfdt directly into
 shim library
Date: Tue, 8 Feb 2022 16:51:20 +1100
Message-ID: <YgIE2ImH9GjFEVa/@yekko>
References: <20220203180408.611645-1-robh@kernel.org>
 <20220203180408.611645-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uNET36rMSScsOgoT"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1644300082;
        bh=qf2iwjvsKeQf8evIo0OsMvMi9SjAnq2UV36IJlGgA+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bP0VM8zRzRRq4uW+OUzujTd6GIx9qPM5iIHxecnLMyv3y7gdotnSV/a3CPAujev/D
         Nw8+81h5sHoY8ZahTbQlOceYS+vDc6Ifi9Tf76k/m8aYLhe+ydLaFklct+yUnfXw8u
         IFPK8TGv2iYr9o+NvIUWR7Tpckl9BLx+mouYqmG8=
Content-Disposition: inline
In-Reply-To: <20220203180408.611645-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hector Oron <zumbi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Natanael Copa <ncopa-Tvuechaw34bCfDggNXIi3w@public.gmane.org>


--uNET36rMSScsOgoT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 12:04:08PM -0600, Rob Herring wrote:
> The interactions between pylibfdt setup.py and the host and build system
> is fragile. setup.py can be called directly or via pip, tox, pytest, etc.
> Building the SWIG shim library needs the libfdt headers and library .so
> file. These can be located in the source tree, the OOT build directory,
> or several locations in the host filesystem if installed.

Right.  I do believe that if feasible we should only support building
=66rom the main dtc tree, and therefore only using the files from that
tree, not anywhere else on the host system.

> Furthermore, the SWIG shim library is tightly coupled to the version of
> libfdt it is built against. Specifically, all functions defined in the
> libfdt.h header used for the build must resolve at runtime whether they
> are used or not. IOW, the installed libfdt must be the same version (or
> newer?) than what pylibfdt was built against.

I believe "or newer" should be safe, at least assuming we don't badly
screw up the symbol versioning.  That's a pretty significant
difference from "must be the same version".

> The typical way to solve this problem would be to allow user provided
> library and include directories, but this doesn't seem to work too well
> with setup.py. While setup.py sub-commands can take such options, it
> doesn't work with implicit commands (e.g. an 'install' triggers 'build')
> or pip.
>=20
> The simplest solution to all this is just build libfdt into the shim
> library. This avoids any possibility of version mismatches. The python
> setuptools already knows how to compile C files in extensions, we just ne=
ed
> to list the files.

Urgh.  I don't love having what's essentially a different way of
building the code than the existing make or meson stuff.

> Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Hector Oron <zumbi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> Cc: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Natanael Copa <ncopa-Tvuechaw34bCfDggNXIi3w@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> RFC because this leaves the meson integration broken and I suspect the
> distro folks (Cc'ed here) won't really like duplicating libfdt. Note that
> the 'shim' alone is about 3x the size of libfdt.

No, they probably won't.  Note that the primary reason that distro
folks like to re-use shared libraries as much as possible isn't about
size, it's about ease of deploying updates (including for security).

Then again, they're probably having to get used to the harder case
these days, due to Go's static linking fetish.

> IMO, the meson wrapper should just be removed. Python users know how to
> run setup.py or pip. Why add a layer of indirection?

I'm not exactly sure what you're considering the "meson wrapper".
Note that from my point of view anything which means that doing a full
build and test from scratch would require more than a single make or
meson command is pretty much unacceptable.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uNET36rMSScsOgoT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmICBNEACgkQgypY4gEw
YSKpgw/+Io3K6eQYkHsZ4w1kKRY8wsRBC1woExgl/cod3NubCrqglxUKU46igDrD
RBs+e+ANPlRTs0eNhXWrzVvsWSjtEWzoO5PAbW/wVPgynX3+ngCBEhOBKdq8DPcb
jZ6SMwcAgAvAdqAVZVH1icUalxlHEeU9T+x7UgTtiThSTrg5Ft5x/B6wGQzebzr/
KW3aSb1xt2QMjXc8ETuP/Ngj8UZaU2z3303i41wYcSw9hGlIjqOwTxVmIt85XMSz
TZZgA00QkNTiTpAhPrqr+n433alCwuTlGsi2TolTb7mRfFcAzAAe7CZyPzLp1MIi
wCCcRz824UMiRIRM1CoKwx/5tapq+CbrF40Qml8+YcImktPwxBDyXxJ5fsnja10G
qlUbBS6RES/GBIp0E0rjq/h6i4bBspO10JQviQhBNDphyCMXqcWwnWkZdMM4UyHN
t6jl6QvQ/u/njR6WVltVAaQbGqSnJ9Pa0lPVK8DaddXsYxrTJ3cHSRKPhXY1xAwF
hohUSA3qI57Op+au3SFolsaf6nKN0K+xq0HwSVbBAbDh4l4tFtC0AUb3Ha7lUgGD
kC1797LOjgdSroL9pmXaEJFk1uQeEkQ8vm+1x7A5UBsXpnNOLxiG7rCmr1Q4J5Sa
v+E26g/CmUB7/SoFhFjpZB4C5jBVOwm4TAKEWjQzPswlh7jru+I=
=fSw+
-----END PGP SIGNATURE-----

--uNET36rMSScsOgoT--
