From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 5/6] pylibfdt: Rename libfdt.swig to libfdt.i
Date: Mon, 3 Apr 2017 14:37:21 +1000
Message-ID: <20170403043721.GD10997@umbus.fritz.box>
References: <20170329181541.28856-1-sjg@chromium.org>
 <20170329181541.28856-6-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="M38YqGLZlgb6RLPS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1491194282;
        bh=ydiPHlm5D6X/t7WBl+GLfsBSdIpkcNKHYaxu4Kcl88k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CuN3CZfXoKr8OWslVyEcbAFeRIT9d8hei+qEqsJY1as1VYsstfYxAgSsuA1M7p/N7
         4j6EDybWoqhUYAJ3n63xbPtlttFyQww/TKNhJjhX9CgdCPB5TWQGvPDzzY/DRnUWOA
         /53RvsaIcn4TbEwf/qm30WQcrkV5Pe8LnYw20Jio=
Content-Disposition: inline
In-Reply-To: <20170329181541.28856-6-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>


--M38YqGLZlgb6RLPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2017 at 12:15:40PM -0600, Simon Glass wrote:
> The .i extension allows Python distutils to automatically handle the swig
> file. Rename it.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Uh.. please don't.  The existing Makefiles use %.i as a target for
preprocessed-but-not-compiled sources (occasionally useful for
debugging).

> ---
>=20
> Changes in v2:
> - Add new patch to rename libfdt.swig to libfdt.i
>=20
>  pylibfdt/Makefile.pylibfdt         | 2 +-
>  pylibfdt/{libfdt.swig =3D> libfdt.i} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename pylibfdt/{libfdt.swig =3D> libfdt.i} (100%)
>=20
> diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> index 0d95c11..06f9296 100644
> --- a/pylibfdt/Makefile.pylibfdt
> +++ b/pylibfdt/Makefile.pylibfdt
> @@ -13,7 +13,7 @@ $(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
>  	@$(VECHO) PYMOD $@
>  	$(call run_setup, $^, build_ext --inplace)
> =20
> -$(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
> +$(WRAP): $(PYLIBFDT_srcdir)/libfdt.i
>  	@$(VECHO) SWIG $@
>  	$(SWIG) -python -o $@ $<
> =20
> diff --git a/pylibfdt/libfdt.swig b/pylibfdt/libfdt.i
> similarity index 100%
> rename from pylibfdt/libfdt.swig
> rename to pylibfdt/libfdt.i

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--M38YqGLZlgb6RLPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY4dF/AAoJEGw4ysog2bOSl70P/RK9oHTRWjsmz2o9mazoCPcf
tGvQ7LuoY/cz66h+OqkrSxwSafNwSTwq0gL7FRpTJko8fTmOphEj4/fIL2ce1OA8
y28E5PndAr8BpcQzFDUCZinvRxwjUBK21AIo3qF0GtNb4O5+dODTdB5u8jiTUHHB
t+kOJvBw1gQqxBvsXm7maUHQMaS0xyhb5kFyoKaKfMnLFyxlvNgozlHRkp2pxnlV
AFtdqReswo3tbMYJhlSPRydG155O5nnV0GJxQgHdcTmHxuAiWYTeTPjnpz0cw90k
BIfslRGcWGOGuUfusVAPDXrmjj56cU+qLY4h0gmL+xndBOVnzCQOOk4I6pgaG1L2
WrgkKdn73UvUK4/GQxqgOu/QB2fztaToTy66NpVRqAvH0oIXsPZKl7wU2S/3v39G
b/XF2b1ojZoS8Md4gCLT66hnwMrJfHySYA4uN0jLPk0ReDO18emGRDR9aNLqcB8j
o/GU6Kz4w24HoQWIK4K1+ApcRTfs78mRRkVwN7p3pvnT6pQ+TszrbucmG0KUFFHh
R1K3TWW2kLmD4PKMavXWSUTWjNe4v0CFqZC4mNx2E5ErEuOZyUX4D7Og36oO6xzf
HirxGHOD0bCYZeM5Uy5eNvDeJkexXr4znlMNMWY5QVfVXATy2DHO0PD4ho0bhFTu
JbPk6k7o/S4XQdEsaIfn
=35PX
-----END PGP SIGNATURE-----

--M38YqGLZlgb6RLPS--
