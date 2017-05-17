From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: check.c fix compile error
Date: Wed, 17 May 2017 12:12:18 +1000
Message-ID: <20170517021218.GC15596@umbus.fritz.box>
References: <20170516160808.8075-1-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1494992935;
        bh=NXW/QVhrHMOWBjxq0SnDchzP3dpVzttEjST4RbSKMGY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WvXF1MZj6zD93gYUf/LK7x2XqFOJPd3BIR8EnhiWAHSIZE825MXLG9f57Ca+/J6F3
         Kx9h+T6bhSHQTQ2rJ5sP1m+rl9jArgM+xoYvBbW484TFIFuc6tnxQ62Hqg2MdEBE46
         5boFA2u8YDYjaODgj7KW0MzwudhlytoSqCfApgeQ=
Content-Disposition: inline
In-Reply-To: <20170516160808.8075-1-shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2017 at 10:08:08AM -0600, Shuah Khan wrote:
> Fix the following compile error found on odroid-xu4:
>=20
> checks.c: In function =E2=80=98check_simple_bus_reg=E2=80=99:
> checks.c:876:41: error: format =E2=80=98%lx=E2=80=99 expects argument of =
type
> =E2=80=98long unsigned int=E2=80=99, but argument 4 has type
> =E2=80=98uint64_t{aka long long unsigned int}=E2=80=99 [-Werror=3Dformat=
=3D]
>   snprintf(unit_addr, sizeof(unit_addr), "%lx", reg);
>                                          ^
> checks.c:876:41: error: format =E2=80=98%lx=E2=80=99 expects argument of =
type
> =E2=80=98long unsigned int=E2=80=99, but argument 4 has type
> =E2=80=98uint64_t {aka long long unsigned int}=E2=80=99 [-Werror=3Dformat=
=3D]
> cc1: all warnings being treated as errors
> Makefile:304: recipe for target 'checks.o' failed
> make: *** [checks.o] Error 1
>=20
> Signed-off-by: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

The bug is real, but the fix is only correct for some platforms (just
as the original would only compile for some platforms).  I've adjusted
to %zx which should be right for all platforms and applied.

> ---
>  checks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index 5adfc8f..6dfb82f 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -873,7 +873,7 @@ static void check_simple_bus_reg(struct check *c, str=
uct dt_info *dti, struct no
>  	while (size--)
>  		reg =3D (reg << 32) | fdt32_to_cpu(*(cells++));
> =20
> -	snprintf(unit_addr, sizeof(unit_addr), "%lx", reg);
> +	snprintf(unit_addr, sizeof(unit_addr), "%llx", reg);
>  	if (!streq(unitname, unit_addr))
>  		FAIL(c, dti, "Node %s simple-bus unit address format error, expected \=
"%s\"",
>  		     node->fullpath, unit_addr);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZG7F/AAoJEGw4ysog2bOSw4AQALjQ61M1EsYIY18TEbbH5r1E
FNXUQCR9AsCkEd+UGJ9hr+RPeBoaxsvGzulcZB6BGsfPj0pyAi+SSxhJNYweEXTD
VdYG8ilOamyqBG7kNh7bHfDoncqbemIJiBE9RZOlVyVW8PWYTyW4jfG4j7hXWJOY
yTU4z6XeIEZM52ujaXeEFPGX8QCU5EFJukDashk/jqJPa9uuUsFgGPJbIaWucN7n
OA54SURjs54EWfXJ7W0aM26g6KebMmAF/oLjODziydnKGBkM5nQm6CPIZhBM+sNw
pfAuZhKtc9on5tO6vnTFI14YMbbJG71SxiVozotmrCwzm0DJ5dvKNxlpkS87qX7v
4Xt3OTbz+1djDOMYvde7hkjA4pXCZ/jpGNwx/3BoRz9vG+usjzV9e3t8m8JyTG1j
7dWXDtnJWZ7rVLP5HqUp/K/9bD+WkmErabf8g8FAWZ244kSL5IneJUt3GvURgouu
Tgmtk3iFWhzYuRc/Klb6uG3bAlWxprouoTlUFUadHtoorneP9Tv9wdhXkuCD9cfH
OCQafn+Qmf0fC4Zjaj6Xr35y/y0P2/T8LGb+7ctO9rQ5E939Cxq+Eo5XsHRHBtwJ
aljWjsj2TaSaA/VBdCjsB6AomuWiDMHB/W7vpd421U2SlhqxXHVVDOEWROCbQnlg
dCyFrcJgrO0IE42ksMcV
=414d
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
