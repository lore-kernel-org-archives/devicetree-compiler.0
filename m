From: "david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org" <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4] Makefile: Fix build on MSYS2 and Cygwin
Date: Sat, 20 May 2017 16:18:27 +1000
Message-ID: <20170520061827.GA26046@umbus.fritz.box>
References: <ee8fd5de5a5e47d5af81ecbf352f506a@nordicsemi.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1495361639;
        bh=dRUHeHoTl0lkowYhFI1rueLEFsCcrH/+JwROwP7HFZc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VXD8nu/YrXkgaU66o0evvmEQpdpmZ1Z0Noch7K0LcGpZDlOyeNFF81tQM+7mex5MH
         5Zmoo456kvsF++JN3mnTduLsS1p0O3qPP9IhYyEGIcSb99O4KrBoVbO/DFIs4SKfDn
         ZQMuVAK4ouavm4ejp1jhsZte/ZCoOB6tmR47Wpdg=
Content-Disposition: inline
In-Reply-To: <ee8fd5de5a5e47d5af81ecbf352f506a-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: "Cufi, Carles" <Carles.Cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
Cc: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2017 at 09:06:54AM +0000, Cufi, Carles wrote:
> The host compiler on MSYS2 and Cygwin does not allow the -fPIC option,
> issuing a warning that is treated as an error and stops the build.
> Detect whether we're running under MSYS2 or Cygwin and avoid adding
> -fPIC to prevent the error from happening.
>=20
> Tested on Linux, MSYS2 and Cygwin.
>=20
> Signed-off-by: Carles Cufi <carles.cufi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks.

> ---
>  Makefile | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index 7fa2be8..a3eb585 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -33,12 +33,15 @@ LIBDIR =3D $(PREFIX)/lib
>  INCLUDEDIR =3D $(PREFIX)/include
> =20
>  HOSTOS :=3D $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
> -	    sed -e 's/\(cygwin\).*/cygwin/')
> +	    sed -e 's/\(cygwin\|msys\).*/\1/')
> =20
>  ifeq ($(HOSTOS),darwin)
>  SHAREDLIB_EXT     =3D dylib
>  SHAREDLIB_CFLAGS  =3D -fPIC
>  SHAREDLIB_LDFLAGS =3D -fPIC -dynamiclib -Wl,-install_name -Wl,
> +else ifeq ($(HOSTOS),$(filter $(HOSTOS),msys cygwin))
> +SHAREDLIB_EXT     =3D so
> +SHAREDLIB_LDFLAGS =3D -shared -Wl,--version-script=3D$(LIBFDT_version) -=
Wl,-soname,
>  else
>  SHAREDLIB_EXT     =3D so
>  SHAREDLIB_CFLAGS  =3D -fPIC

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZH9+rAAoJEGw4ysog2bOSBI8P/14Ot5vXd3So9Fd1D61thb5n
GbWfHqeAA29bkw9VYy7iIJMT0gfi/EOJmmXanL6wgeWPFcKHNZYqhKNARSSFuYop
9zTRIxudy0xw3IV5IObPcwhBrVXpa/2MI+noEQ/Ifty7cO9OOKL2aPKswPePu+z4
JQTcSJZusjJfWRs7HBK7Ac/DJOHV3IzBAt1Pgh/F8fSC/IzwvP+lZQ9JbbA6Ghe9
vw7XP/NMKWc54Pyc1L0BD6Jcu4GIlmFB9e/Ko+mRsRTzXZGhKD8r8HaRAPTFZLfJ
xYQfI5z/r3Kb3mnVQ8aIeVx7YUS1KQjUu/EpFcXqzIV6h160sRNH3qJnEKg1eNHe
g2Odm7toJ8oFt1/3AvGmil0et8IqNoSmhZwvrq5tDXFiP6DHrgPnGeidFqjt6Y1u
n9htpo5B8534ug+zYMb3sFNoc/FdRH7CisnjrVxOH2013ugngBcvVxRaEdmy2CDu
EH9RFMuYPgmVfA03sAexLQck8tKCmADAeDOrhUCiSWJb8KSbh4+bxeKO0eKY0KqG
4FX4QtaJRO00Fddp1AJhQgxx2l/42tNDsYWathYhzkE4ccVhZteir49gqkZT7Mum
hw0nGp3YxzbNKiQYZrRYeoZnzFHTsr5ZrFJObLoD43K6+1bzoyqdEh99vLo5p7lU
OFfkER1chSoWWsG1mH5f
=M/C1
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
