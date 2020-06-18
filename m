From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: add extern "C" for C++
Date: Fri, 19 Jun 2020 09:53:26 +1000
Message-ID: <20200618235326.GB17085@umbus.fritz.box>
References: <20200616011217.15253-1-patrick.oppenlander@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1592525874;
        bh=SzZ8/naHxFpBaSSr6GL0jW6Qafn3COeUHC6eWPpBHKY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WiA03ggeXEGK9D2P78xpiKTmNZsypzG3Qs/1Xi0JQIUlXgcmzBXEfvcWc+J2qwXKb
         6WVpxz90tw2qR95iDFDjl0ANlEw6/ELsdTXIM5PySWCo4ksHsy9kbi/LcPP8vaTK9J
         +RDNu5cWAKm6lGPh/Bi6WX84PF+AGrQzutDZshQ8=
Content-Disposition: inline
In-Reply-To: <20200616011217.15253-1-patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 11:12:17AM +1000, patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wro=
te:
> From: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Signed-off-by: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/libfdt.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 48f375c..544d3ef 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -9,6 +9,10 @@
>  #include <libfdt_env.h>
>  #include <fdt.h>
> =20
> +#ifdef __cplusplus
> +extern "C" {
> +#endif
> +
>  #define FDT_FIRST_SUPPORTED_VERSION	0x02
>  #define FDT_LAST_SUPPORTED_VERSION	0x11
> =20
> @@ -2069,4 +2073,8 @@ int fdt_overlay_apply(void *fdt, void *fdto);
> =20
>  const char *fdt_strerror(int errval);
> =20
> +#ifdef __cplusplus
> +}
> +#endif
> +
>  #endif /* LIBFDT_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7r/nIACgkQbDjKyiDZ
s5J0MRAAnhqZmfpw0VFotKII+MZZunKAtzlZsV3br2LlyknOSdpBtbnhTYpDRe+R
vXs7NdtI+SEr4tEZTeyoBmhnJZJtKRLkNwNwA3Gd8Flz3iBasCaAvgOXd3TD9leP
ifEuv/J5mxVFMP9FvoBNbwZn7ZEC3yRzae14KA6a2kI1ED8Z6Q2oJvNlFW6Mp+3S
OhlvFvHocokguZNT+9D6blUpKjcJRCAjmc6E79IGz+98W0t3V78Ru+8rXqzB6TgA
qXKBvEUEAOVWh2fAhO797Oz0sME7r5Ix57vrBOPRDPBxNedW4e4hK3Zq6qmib/ku
Vl7SpdcCnnHdO0lKS/2m1NBST1k7dvokLVCWXtd+OEBQPpq1nmYOp6PKmmio4XC0
kP3GJD2m7qJdSm4Mb4LJVTO2JH2Kcw6PWzIgtIlK8Re2BdKzDA1rmTMVdoCQkxnb
QYNH9+YM+xcmvP3xT4dQkIkfNwUNOgkw49Qx22L/yBaB3hFipNccT+X9+9+wl/K+
PqC22+P+kQNkPJ71jXhD8MusTfyPx7ymhBhoonmqowd58cXJiBPPAVsdzbFMhA+t
G4a0cjjZ3CgoSx082/HM1ZuHhJMTOsxr3dx5CTG3AJ0YXtrApvBWmMLQdJj1ZOfb
sSxrap1jtlfNSkzH+/jPRUwaFzam0SnCe9rW9LXnzMNTXWQ6rxM=
=QuLR
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
