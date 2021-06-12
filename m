From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/4] libfdt: Check DT struct size for integer overflow
Date: Sat, 12 Jun 2021 12:29:28 +1000
Message-ID: <YMQcCHGY+FZnQxG1@yekko>
References: <20210611115823.31583-1-andre.przywara@arm.com>
 <20210611115823.31583-4-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QDECMvoGLy//dld2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623470335;
        bh=gIEnDkL04DluTD5UnYDjsBJ/hXy6Y3N72UtPDEzYfbA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LABCJThIRdeGr4rJjolE9r0rUmkNmtqDfrsSMcIv6pGppTJrkTF4V63jtzeoO2LVu
         FAEBtgPHzkI+4T3aEQl+BO6DuczHSNqKs4b7FKLfCwRj4ZnkFMDi2PeLGl0b8T+JnO
         w+gJIqJbOEVzCnecjU17hQPnA+Q35WAS4HH/MgGo=
Content-Disposition: inline
In-Reply-To: <20210611115823.31583-4-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--QDECMvoGLy//dld2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 12:58:22PM +0100, Andre Przywara wrote:
> The DTB header fields store unsigned values for size and offset, however
> we have a 2 GB limit on the overall size, since we use signed "node"
> offsets everywhere.
>=20
> As fdt_open_into() is no exception here, check that the advertised DT
> structure size fits in an int, before using that value as an offset into
> a buffer.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Hm, I feel like we should probably just call fdt_check_header() from
fdt_open_into() which will make this check, amongst others.  In fact
slightly tigher, it will check that struct_end <=3D totalsize <=3D INT_MAX.

> ---
>  libfdt/fdt_rw.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index a0f03d0..062edcc 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -437,6 +437,8 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
size)
> =20
>  	if (can_assume(LATEST) || fdt_version(fdt) >=3D 17) {
>  		struct_size =3D fdt_size_dt_struct(fdt);
> +		if (!can_assume(VALID_DTB) && struct_size < 0)
> +			return -FDT_ERR_NOSPACE;
>  	} else if (fdt_version(fdt) =3D=3D 16) {
>  		struct_size =3D 0;
>  		while (fdt_next_tag(fdt, struct_size, &struct_size) !=3D FDT_END)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QDECMvoGLy//dld2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDEHAgACgkQbDjKyiDZ
s5LzrBAAmbtiy+uTZHG/Vv8gnbsFjUuuv86i3ukJq/aHjp9Kdmm7ugMsMyAu/15g
EPf+GKlGMN/wCUB3kpbedc8Lv/j/h5MjfBQveEOrs5Zq3lIlSb5oS1f64PZkhA59
zt3tAw3HQ2gTbNXI8esRAcP/n3MCGJ/1oVn5yAajjjyBCXgtyF8COnbnUtvFuIDh
07dBTFHu4D/n7ViqdZWWL+gSf1Z1n1o997RAM4iDF6rM6Fp5J62Nym2Tq4oghA4N
+FzjmSlVvIREexXgu2J15XcYGUTeFyJDaTgtIiEULbeI63KnduhHtg5diFdiReHu
k4G/g0KpG/mOG/wsgNxpNsZLarOZ1mppGSVWZbuYw3lZ5pv2ypp9UIpCNIXZLeC7
ollYBHsV144N+IpqhD9Hc75EWxTp7gHpvtsqqu8biWg+hjj9i6+cXybckyElnZ5f
RnSA3lD/BW1WFoleSPRzLP8oKCheCBGTsfEroQsFhQ9+uuLxnoUy7p6KOnOXonBD
hUjF0vV3ztCQVAx2+c8xQnpM6A0XrlFg2WivSINcbGYee17ZZBxDSk6pjip0EMJL
adoKe9qvJPch/NIQ1r4XNsDtGqllxlz5UkI1bz4WGaMSBHyMwCxwa9mgDU9JY9Dp
JKsWxzRwo8cG0dK1Li9+J7R8zJY0dLK2wOS6aY+up080U2AP/bI=
=Qmts
-----END PGP SIGNATURE-----

--QDECMvoGLy//dld2--
