From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCHv2] Set last_comp_version correctly in new dtb and fix
 potential version issues in fdt_open_into
Date: Tue, 29 Dec 2020 11:42:32 +1100
Message-ID: <20201229004232.GA51380@yekko.fritz.box>
References: <20201228234243.5058-1-jujugoboom@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1609208875;
        bh=XkXwHwTAjwWSxrAZ/5/uHtMuvYJdE2hZ8g4ppQLHKEc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pzmW/OPoxghjqbi3GO16kVoiDKmI0MdLL0fCzJMorglvT0WaREo9quXBqetRdf9/W
         7d9q2gZQRBWiCgbDrPayVorIi/3ZmQwWok3oHt8nlEBaunlHuAig2vbmmKOEqunNsJ
         PoZ3LoHQnKbcI9N0wTsJuTEdXSsE2WkF1tbIdImk=
Content-Disposition: inline
In-Reply-To: <20201228234243.5058-1-jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2020 at 03:42:43PM -0800, Justin Covell wrote:
> Hi,
>=20
> I've added checks to fdt_open_into to validate the version before reading=
 into buffer, as well as maintaining the accurate
> version information of the fdt when loaded into the buffer. Hopefully thi=
s would help stop any issues with reading a=20
> fdt with a lower than compatible verison into a buffer and it being misre=
presented as a current version.
>=20
> Signed-off-by: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> ---
>  libfdt/fdt_rw.c | 10 ++++++----
>  libfdt/fdt_sw.c |  2 +-
>  libfdt/libfdt.h |  1 +
>  3 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 68887b9..feab26c 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -428,12 +428,14 @@ int fdt_open_into(const void *fdt, void *buf, int b=
ufsize)
> =20
>  	if (can_assume(LATEST) || fdt_version(fdt) >=3D 17) {
>  		struct_size =3D fdt_size_dt_struct(fdt);
> -	} else {
> +	} else if (fdt_version(fdt) =3D=3D 16) {
>  		struct_size =3D 0;
>  		while (fdt_next_tag(fdt, struct_size, &struct_size) !=3D FDT_END)
>  			;
>  		if (struct_size < 0)
>  			return struct_size;
> +	} else {
> +		return -FDT_ERR_BADVERSION;

Right, this is further fallout from f1879e1a50ebc3786540a075701ccaead2bfbe1f

>  	}
> =20
>  	if (can_assume(LIBFDT_ORDER) ||
> @@ -442,7 +444,7 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
size)
>  		err =3D fdt_move(fdt, buf, bufsize);
>  		if (err)
>  			return err;
> -		fdt_set_version(buf, 17);
> +		fdt_set_version(buf, fdt_version(fdt));

This change doesn't make sense, though.  For starters, it's a no-op by
definition.  Secondly the change to v17 is correct: the difference
between v16 and v17 is that v17 adds the struct block size, which we
populate in the next line.

>  		fdt_set_size_dt_struct(buf, struct_size);
>  		fdt_set_totalsize(buf, bufsize);
>  		return 0;
> @@ -470,8 +472,8 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
size)
> =20
>  	fdt_set_magic(buf, FDT_MAGIC);
>  	fdt_set_totalsize(buf, bufsize);
> -	fdt_set_version(buf, 17);
> -	fdt_set_last_comp_version(buf, 16);
> +	fdt_set_version(buf, fdt_version(fdt));
> +	fdt_set_last_comp_version(buf, fdt_last_comp_version(fdt));

Likewise, these are no-ops, and the original version was correct.

>  	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
> =20
>  	return 0;
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 68b543c..4c569ee 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -377,7 +377,7 @@ int fdt_finish(void *fdt)
>  	fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings(fdt));
> =20
>  	/* And fix up fields that were keeping intermediate state. */
> -	fdt_set_last_comp_version(fdt, FDT_FIRST_SUPPORTED_VERSION);
> +	fdt_set_last_comp_version(fdt, FDT_LAST_COMPATIBLE_VERSION);

This is a necessary change, though, again because of f1879e1a.  So
adding a "Fixes" tag to the commit message would be useful.

>  	fdt_set_magic(fdt, FDT_MAGIC);
> =20
>  	return 0;
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 2bc16a8..73467f7 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -14,6 +14,7 @@ extern "C" {
>  #endif
> =20
>  #define FDT_FIRST_SUPPORTED_VERSION	0x02
> +#define FDT_LAST_COMPATIBLE_VERSION 0x10
>  #define FDT_LAST_SUPPORTED_VERSION	0x11
> =20
>  /* Error codes: informative error codes */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/qe3YACgkQbDjKyiDZ
s5Kgcw/9HvC6l8O8e16K8wkJqMj+Hq2Z9sy84PV2SxaOw9bwrw06b6MQVmO3qIcD
FBbJgbIHaiGzaxLBA0Dq9PmrtOTAQitxvWz7BA/xkhCKdpj/vsgiNJ1Fp+FHI+5R
10pLs3xpnrj73MYGl9ZcmlxU9eWo3H4K2GFN/L8uxmznz/8UsdM2OWsGGXZAR4fv
YBQ46JKuYchs4RNFEPSTMx2HSZ0U9efzI/EWDhNc8daCAcw4y9nINkU4yXjLe2JS
xCc4o8NytBCyLzDtiRuV1VO2PUigUMH1rJt3QRvhb63Iyo2rSIjtAGcJ/XPgqVCN
/ZnGYU/V6ieWFrQDtcOOXvigDFU/ocVt5xRjBT75ojjstNTukwVP/HC1fc3b8fxa
cYVPVDJlZqZ5ZraWrU/2E9v9K66AX8/9WcZeExU94s2meMwwa37dwn1eFd1QBrgW
TGeVORS65LrtFl0zO/rVSNcCWlllVw9ZgNvdN0L2LM50CsD5Yp7epAv1kg+PgI1M
gt9YoTufEGwzEKWaNyDR9xIZSQK+wnHEGHd3g0xsRqYoQEiX8cCb/l4Etl7bqttb
hzacPWxU6mQ+0f8d+3yGlhoStvcenypZGAoN+vM9NSVTVMNmlMW+OoFkYZA39Jjt
jcSmUvFE09im2BxKedTyKLCBEdLSnIP9uzeFehJlreqie2b0sQE=
=5VO/
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
