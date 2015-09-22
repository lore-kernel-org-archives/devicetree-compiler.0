From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v2 3/3] dtc: linux kernel build process to create
 annotated .dts
Date: Tue, 22 Sep 2015 20:40:13 +1000
Message-ID: <20150922104013.GQ20331@voom.fritz.box>
References: <5600E191.9020903@gmail.com>
 <5600E9A2.5050000@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Evp0T6PXIQ26qRMT"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5600E9A2.5050000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Evp0T6PXIQ26qRMT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 10:39:46PM -0700, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>=20
> Add a new temp file in the build directory arch/${arch}/boot/dts/
> that contains the expanded device tree source with source file locations.
>=20
> Requires a new version of the dtc compiler that understands the
> --annotate flag.
>=20
> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Bit weird having a patch against an entirely different project / tree
in the same series, but the patch itself looks file.

> ---
>  scripts/Makefile.lib |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> Index: b/scripts/Makefile.lib
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -287,12 +287,15 @@ cmd_dtc =3D mkdir -p $(dir ${dtc-tmp}) ; \
>  	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 \
>  		-i $(dir $<) $(DTC_FLAGS) \
>  		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
> +	$(objtree)/scripts/dtc/dtc --annotate -O dts -o $(dtc-annotate-tmp) \
> +		 $(dtc-tmp) ; \
>  	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> =20
>  $(obj)/%.dtb: $(src)/%.dts FORCE
>  	$(call if_changed_dep,dtc)
> =20
>  dtc-tmp =3D $(subst $(comma),_,$(dot-target).dts.tmp)
> +dtc-annotate-tmp =3D $(subst $(comma),_,$(dot-target).annotate.dts.tmp)
> =20
>  # Bzip2
>  # ----------------------------------------------------------------------=
-----

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Evp0T6PXIQ26qRMT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWATANAAoJEGw4ysog2bOSLEUQANy4xjVhopZ5VhXUjBZt3l7I
Q0DIB1HS1luJXP6ggbvM9XjYCDZq8Y40RyjpL9dXCiXDTOVprnkFtGP/Cf419UyT
vkWyouSipG0lWVPtQ2Y9Ty6BjrjuUrySVRh4TEDc/6YfVmJntS/4cSHXNgxnBtUI
S+Zf8Se3oMfKPlVJ3wyESbJZs3spnqtJBDDSLdEThCrREBDRR/DULNm9x9WSlxSR
4+LwPAsrIcEKSZL3QJFArHBoAxMTNGdGkjOeS5c8EaG6CHvVlaWbjlddh/AcNZ1/
fEYgC+0tE7Jr8Zp7aP6ZPydMnhq3UsE/PCbNCGU+YxCRWO+hNJ07VtR/bp1q0FF0
bLKzV1zib38BlQUmMXlSOw24gLv9VWAfzCYmxRWRD8CCJr0RxVmxmzqLMpsiCoq5
J/mF0k5Q0EZyaIE4Jumn1raRUsdkaoxCIry5T7Z1nYqbPIMqBWLE07eA+Jctly+s
kXsNHMz6BBF0gcqU5OTZnbuS2zyoHYwPTc1JUqRLrkbCbIyg9PN/1FI+o95j7qqc
7WKB2hSh19XRKJnVbGV2gCbxLPrHAQvI5rbgcjwMtNW9pLDsvzMyAExV4i2inRmN
0tyVFhq4ouN4FYPmUk30w0o2HhXdsBehdhNnyyzODKMwlFRhNbpbyIYkQNBccMKP
74Nw+0LwWYCMBZ2mLC1Z
=fGxw
-----END PGP SIGNATURE-----

--Evp0T6PXIQ26qRMT--
