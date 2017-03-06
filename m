From: David Gibson <dgibson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] fix libfdt_env.h for RHEL7
Date: Mon, 6 Mar 2017 12:25:57 +1100
Message-ID: <20170306122557.71669b69@umbus.fritz.box>
References: <1488558597-21364-1-git-send-email-pbonzini@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6/CfMyq9Zw/t34IPu2hK=V3"; protocol="application/pgp-signature"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488558597-21364-1-git-send-email-pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

--Sig_/6/CfMyq9Zw/t34IPu2hK=V3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri,  3 Mar 2017 17:29:57 +0100
Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> RHEL7 defines __bitwise to "__bitwise__" in /usr/include/linux/types.h.
> Because QEMU uses -Werror, the redefinition of the macro in libfdt_env.h
> is is causing QEMU's build to fail when it includes libfdt.h.
>=20
> This is the minimal fix, but a better one in the long term is probably
> to define libfdt-specific macros LIBFDT_FORCE and LIBFDT_BITWISE.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> 	David, it would be nice to have this in QEMU 2.9 but I
> 	am not sure of the mechanics of that.

Urgh.  So from an upstream libfdt perspective, I'd prefer to go
straight to the long term fix - it's not that much more complicated.
And, in fact, I have now done so.  It also reminded me to actually do a
sparse check and fix some warnings.

It would be nice to have in qemu 2.9, but having just made a dtc
release and updated the qemu submodule, I'm not too keen on doing so
again almost immediately afterwards.  So I'm inclined to leave this
unless there's a more compelling reason than I can see for now.

I'm not sure which your primary concern is:

1) For the RHEL release itself.  I don't think updating the qemu module
is terribly relevant for this, since we build against the packaged
libfdt rather than the qemu submodule.  We could ask Mirek to pull the
define fix into the downstream libfdt package.

2) For building upstream qemu on RHEL, using the submodule.  I don't
have a good answer for this one.

> diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
> index 9dea97d..2cf0826 100644
> --- a/libfdt/libfdt_env.h
> +++ b/libfdt/libfdt_env.h
> @@ -60,6 +60,8 @@
>  #define __force __attribute__((force))
>  #define __bitwise __attribute__((bitwise))
>  #else
> +#undef __force
> +#undef __bitwise
>  #define __force
>  #define __bitwise
>  #endif
> --=20
> 1.8.3.1
>=20


--=20
David Gibson <dgibson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Senior Software Engineer, Virtualization, Red Hat

--Sig_/6/CfMyq9Zw/t34IPu2hK=V3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYvLqlAAoJEGw4ysog2bOSyq0QAONBXwZnu7e0EYG4rCaZJeXX
cpP91oAU9sSFzu8Se5YWv3pV95QOlCx0f9OrO48XVuEBBTkeZN1GanulR0HAhjpr
HJqh768HAVM0DAHelk4wxCByEH1DxALeBR6dUHHt5D2h/RKixeeyQO6GkukuBegm
VEc1o8XdI9OF0sRHKG/Sud6kP1B3/1I5VHT9vBRP89agyjURx0tjZYGl30LCcW/+
TUCuiAxUm54L+3o2akV0ObSh/L2/Lyj/Dh2tK89f7TloD/fpRgivO/nIseRm7gwd
5eFdANFUPkeXtes9hstBE/uCveMmh3i59c8yA7x2RklDKsVABzBnxTzh6VxT9O2Y
ygahXyOs54Bo2S3pXUeV0muRwLF87a5mjfW8/Rg4RKSM3QNpXCl9QSiJB7RmoOTU
+V94XO/azoJ20d0UCLm0wG7ZR9ZxWzIRmZmjr3aS8BmWEPecWsG11O5fc+isXoRQ
iVEqGbdVXcZIyVccN3ua4r7tDCxh9rCx/PRxHrIm0hIRK3gMX9QnGtYsRRAz034B
M1pKgmO0zyBgFRHeeOfJfPRjdPHpdKOWsJjYMfX7DgBf563FpUUkInIJdswVR5Op
8P70T95EWytk/DESyYdaAEoxtjFI3Q8PHdFuYtBo2BZtrHak/trbgsNtcvxxA4nj
INcUdYpTvSC4DlbyMjEK
=evWW
-----END PGP SIGNATURE-----

--Sig_/6/CfMyq9Zw/t34IPu2hK=V3--
