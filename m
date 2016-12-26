From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] dtc: fdtdump: check fdt if not in scanning mode
Date: Tue, 27 Dec 2016 09:47:11 +1100
Message-ID: <20161226224711.GC25998@umbus>
References: <20161221224138.GA14282@umbus.fritz.box>
 <20161221235906.24281-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1482798003;
        bh=/Rn4yNkvyCTrLY6MUs5wNIPf6l6C2lR0KsrZFYineTY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=okQ8V+girdYmD5NdUR7/iv9g24YRIhd2WlzZFLCwQyRjTezQR9SYw3XvfDGDRr4Jy
         sGz+YfUSjwbM/9H4YQ9D3+4qlcJDSyVr+p6n5py0/oAXdIgUcw20Wh3aqSI/3Cu1YU
         ndx9gMe6kADb2nj+Ks6U3nPySkTArbGU+uI24Jn4=
Content-Disposition: inline
In-Reply-To: <20161221235906.24281-1-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2016 at 12:59:06AM +0100, Heinrich Schuchardt wrote:
> Running fdtdump without scan mode for an invalid file often
> results in a segmentation fault because the fdt header is
> not checked.
>=20
> With the patch the header is checked both in scanning as
> well as in non-scanning mode.
>=20
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>=20
> v2:
> 	Refactor header check as separate function.
>=20
>  fdtdump.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)

Applied, with a couple of tiny tweaks.

>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index a9a2484..4137689 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -16,6 +16,7 @@
>  #include "util.h"
> =20
>  #define FDT_MAGIC_SIZE	4
> +#define MAX_VERSION 17
> =20
>  #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
>  #define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
> @@ -159,6 +160,20 @@ static const char * const usage_opts_help[] =3D {
>  	USAGE_COMMON_OPTS_HELP
>  };
> =20
> +static inline int valid_header(char *p, off_t len)
> +{
> +	if (len < sizeof(struct fdt_header) ||
> +	    fdt_magic(p) !=3D FDT_MAGIC ||
> +	    fdt_version(p) > MAX_VERSION ||
> +	    fdt_last_comp_version(p) >=3D MAX_VERSION ||
> +	    fdt_totalsize(p) >=3D len ||
> +	    fdt_off_dt_struct(p) >=3D len ||
> +	    fdt_off_dt_strings(p) >=3D len)
> +		return 0;
> +	else
> +		return 1;
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	int opt;
> @@ -204,12 +219,7 @@ int main(int argc, char *argv[])
>  			if (fdt_magic(p) =3D=3D FDT_MAGIC) {
>  				/* try and validate the main struct */
>  				off_t this_len =3D endp - p;
> -				fdt32_t max_version =3D 17;
> -				if (fdt_version(p) <=3D max_version &&
> -				    fdt_last_comp_version(p) < max_version &&
> -				    fdt_totalsize(p) < this_len &&
> -				    fdt_off_dt_struct(p) < this_len &&
> -					fdt_off_dt_strings(p) < this_len)
> +				if (valid_header(p, this_len))
>  					break;
>  				if (debug)
>  					printf("%s: skipping fdt magic at offset %#zx\n",
> @@ -217,11 +227,12 @@ int main(int argc, char *argv[])
>  			}
>  			++p;
>  		}
> -		if (!p || ((endp - p) < FDT_MAGIC_SIZE))
> +		if (!p || endp - p < sizeof(struct fdt_header))
>  			die("%s: could not locate fdt magic\n", file);
>  		printf("%s: found fdt at offset %#zx\n", file, p - buf);
>  		buf =3D p;
> -	}
> +	} else if (!valid_header(buf, len))
> +		die("%s: header is not valid\n", file);
> =20
>  	dump_blob(buf, debug);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYYZ3vAAoJEGw4ysog2bOST+gQAMpCFujKLsiR0e+3VEKEWO2p
C0fo+be283fsqPKx5CaTd/XIbKSCuAdrNFz+I3rDa+Jj3GtiLcV2rySNVi7LUOLl
U8AG2Rnh7QA2tU7+S5+86RZLHThNk7wBBArTH5lRZQmEmaCIgGLA47MG8ACKe2WQ
eQJ8csPmeNxpFlIc+qdy6pFjEUgBTM5JkESyVK2+MsvzlwMUMdIAAt4zPeVA3Cev
U+m3DbrMM0iuEnblraxsiPbsfBGL1P84+M/pwMiIk3u5eZQmSeALjdnVbwhErtl6
1Oz2HVQ2GQMa2QC6aSTJW2CaJMyJuiqV0HZI4Ajqwd7V/RNMUejXE5IUg+2kci1g
Prd+kPOlXDNRzbj9Ur3P8A84sbdrKubCzpYAN5VA0COtComvIOmm78o3GQHtV7AG
AkVtqpQNVaEqvoZJ117KW/9Ar6+zqxco7QKe+hbyC1A59BMwDKrIpWtS91nPMck7
75i+kXbtRwt39iTnTamCXHBIxwoV3Kzpv3Egf9YHHgGZYLfzyt8dJXBYwbANCjiv
XNlQZBgdD4Iz+Y9fsU0134MNjlRjBD5fCoFcM+c9q8jNYxqValcDPVUc6/uOsPKR
GhTvnCgjneEX8LB8uuigbQjGnv2Y1ox2b7vVALXbSar6sSDpmsg1qnGuoJywIf6I
LV+EUdHUzdsFkOBmmmHa
=3gec
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--
