From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/1] dtc: fdtdump: check fdt if not in scanning mode
Date: Thu, 22 Dec 2016 09:41:38 +1100
Message-ID: <20161221224138.GA14282@umbus.fritz.box>
References: <20161220223216.28686-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1482360967;
        bh=0KoT7HYfewerY2sPAR+NDyA0QPynEAJSlJH+2AbRTyI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dKVcp9ebA3GAfG4F8YQg/p/d4pSvrrIeuqPtzBeRCIFmczgYQn+EsqIOvAFqrat7U
         SPDuo5ZESRIEusbfZoGU/UzaG30Eb+1umBDiSCWtkdJwmg9h6Zc41g5L28t2APhLQ7
         aRthCsKQzbmwm7O+kEfhSCSHm1hDkxdub7VcZWEE=
Content-Disposition: inline
In-Reply-To: <20161220223216.28686-1-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2016 at 11:32:16PM +0100, Heinrich Schuchardt wrote:
> Running fdtdump without scan mode for an invalid file often
> results in a segmentation fault because the fdt header is
> not checked.
>=20
> With the patch the header is checked both in scanning as
> well as in non-scanning mode.
>=20
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

This seems to be more complex than it needs to me.

The idea of validating the header in non-scan mode seems sensible, but
this also appears to scan in non-scan mode.

It would be more sensible to just pull the header validation out of
the scanning block.

That said, fdtdump is pretty much a deliberately dumb tool.  In
general the preferred way for decompiling a dtb is to use dtc -I dtb
-O dts.

> ---
>  fdtdump.c | 57 +++++++++++++++++++++++++++++----------------------------
>  1 file changed, 29 insertions(+), 28 deletions(-)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index a9a2484..717fef5 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -189,39 +189,40 @@ int main(int argc, char *argv[])
>  		die("could not read: %s\n", file);
> =20
>  	/* try and locate an embedded fdt in a bigger blob */
> -	if (scan) {
> -		unsigned char smagic[FDT_MAGIC_SIZE];
> -		char *p =3D buf;
> -		char *endp =3D buf + len;
> +	unsigned char smagic[FDT_MAGIC_SIZE];
> +	char *p =3D buf;
> +	char *endp =3D buf + len;
> =20
> -		fdt_set_magic(smagic, FDT_MAGIC);
> +	fdt_set_magic(smagic, FDT_MAGIC);
> =20
> -		/* poor man's memmem */
> -		while ((endp - p) >=3D FDT_MAGIC_SIZE) {
> -			p =3D memchr(p, smagic[0], endp - p - FDT_MAGIC_SIZE);
> -			if (!p)
> +	/* poor man's memmem */
> +	while ((endp - p) >=3D FDT_MAGIC_SIZE) {
> +		p =3D memchr(p, smagic[0], endp - p - FDT_MAGIC_SIZE);
> +		if (!p)
> +			break;
> +		if (fdt_magic(p) =3D=3D FDT_MAGIC) {
> +			/* try and validate the main struct */
> +			off_t this_len =3D endp - p;
> +			fdt32_t max_version =3D 17;
> +			if (fdt_version(p) <=3D max_version &&
> +			    fdt_last_comp_version(p) < max_version &&
> +			    fdt_totalsize(p) < this_len &&
> +			    fdt_off_dt_struct(p) < this_len &&
> +				fdt_off_dt_strings(p) < this_len)
>  				break;
> -			if (fdt_magic(p) =3D=3D FDT_MAGIC) {
> -				/* try and validate the main struct */
> -				off_t this_len =3D endp - p;
> -				fdt32_t max_version =3D 17;
> -				if (fdt_version(p) <=3D max_version &&
> -				    fdt_last_comp_version(p) < max_version &&
> -				    fdt_totalsize(p) < this_len &&
> -				    fdt_off_dt_struct(p) < this_len &&
> -					fdt_off_dt_strings(p) < this_len)
> -					break;
> -				if (debug)
> -					printf("%s: skipping fdt magic at offset %#zx\n",
> -						file, p - buf);
> -			}
> -			++p;
> +			if (debug)
> +				printf("%s: skipping fdt magic at offset %#zx\n",
> +					file, p - buf);
>  		}
> -		if (!p || ((endp - p) < FDT_MAGIC_SIZE))
> -			die("%s: could not locate fdt magic\n", file);
> -		printf("%s: found fdt at offset %#zx\n", file, p - buf);
> -		buf =3D p;
> +		if (!scan)
> +			die("%s: fdt missing\n", file);
> +		++p;
>  	}
> +	if (!p || ((endp - p) < FDT_MAGIC_SIZE))
> +		die("%s: could not locate fdt magic\n", file);
> +	if (scan)
> +		printf("%s: found fdt at offset %#zx\n", file, p - buf);
> +	buf =3D p;
> =20
>  	dump_blob(buf, debug);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYWwUgAAoJEGw4ysog2bOSIG0P/Ai9PikYqO2uL/I1g8SVzfoR
aw5vewM0bNOKRvb2vjhJnCtrQSQmQdrmp49QNCDsuSpMBMsKa7iNxsRAW2MQyjbZ
GTQyvpudzjUb4HzLskOS0XU8DiWqwNVOZTFlSd8i3PSNRNWiKVQi/0TiR5pYhYeh
xvzYCors+9OCDBw4i7Yay0fG8Cv5q1a6tv3Vkz3q6/nymA84qNTskYp6HfC+tUjE
t2e4+goKQSF+d8u+A6iNhvUQaYk23ec4MMszyUdOc7KY/tN8sEc+mx6oFXx7NdrF
8ydzusLAepLRQMupR1OWSpaiPnrawwEXU/YHgr1JntAzbJiJHtScr40oVS9Ih7qX
01EiAsuYAXqyFuW1QeTw//89MWk9nUGom3RUMHHHo1faXm/rhp1b0Y7PmDEeu7bp
GeCypNrT//gffioGgms1ZYwMCcDvi22VzqRkDe4Sj8R5BXqVaw5ksoSvdG6C+bmz
qm2iIW/e0opLuO573j5sdvVryCH3AYShGsuFPvesN3M7j7bkRya+e8dHH3W95/QQ
oPOqECcRLtd/51RuVeoLS3/L4XDxKr30HkHnlkH53DIzsbJWOT5Qj+SOJe/JSww4
e6UizOpdKb0+je633FEHFmKIVDUJd2twLlmQ48h7fBuBW9wHynT9BmuCZQXj7Bsm
DF76Qi9wScAKFH3epjeW
=bkrs
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
