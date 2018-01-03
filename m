From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in
 base fdt
Date: Wed, 3 Jan 2018 16:42:20 +1100
Message-ID: <20180103054220.GP24581@umbus.fritz.box>
References: <20180101065945.65451-1-kevans@FreeBSD.org>
 <20180101065945.65451-2-kevans@FreeBSD.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="A6Z7MKnLVMfR85kG"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1514958162;
        bh=NMv21HhOHT+f0gec3eL6CwBc04fYCFUNN+LGovzD0r0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VsDdWKMO4tHzCZHxvXPcMR5WuB/Px/ZCS8qiAAD7HDLPktWL+byxM6tmA1IxKrm1R
         m516vUbuZfP40Y88Eu/7qCinKLyD5oH9ViS4610Md2/P/aQrw3EnyZMy6JP5R+hqJ9
         e003NHtkLVhwk6FS8LAavLmn8pNpUCXp/jcCmdyA=
Content-Disposition: inline
In-Reply-To: <20180101065945.65451-2-kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--A6Z7MKnLVMfR85kG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Regardless of anything else, these two patches need different one-line
summaries.

On Mon, Jan 01, 2018 at 12:59:44AM -0600, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
> Currently, references cannot be made to nodes in the base that do not alr=
eady
> have phandles, limiting us to nodes that have been referenced in the base=
 fdt.
> Lift that restriction by allocating them on an as-needed basis.

Hmm.  I'm a bit dubious about this.

- My feeling is that one of the problems with the overlay format is
  that it's already too free, allowing the overlay to change
  essentially anything in the base tree.  So I'm not that keen on
  making it even more free.

- An overlay can already add a 'phandle' property to a node in the
  base tree.  Can you use that directly instead of adding a new
  mechanism?


> Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
> ---
>=20
> Changes since v1:
>  - Added a function to grab the next phandle; once we've assigned one pha=
ndle
>  to a node automatically, we'll need to choose max phandle from the base
>  blob instead of the overlay since they've not necessarily been merged ye=
t.
>=20
>  libfdt/fdt_overlay.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++=
------
>  1 file changed, 74 insertions(+), 9 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index bd81241..10a57ae 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -335,6 +335,66 @@ static int overlay_update_local_references(void *fdt=
o, uint32_t delta)
>  						    delta);
>  }
> =20
> +/**
> + * overlay_next_phandle - Grab next phandle to be assigned
> + * @fdt: Base Device Tree blob
> + * @fdto: Device tree overlay blob
> + *
> + * overlay_next_phandle() determines the next phandle to be assigned to =
the
> + * fdt blob.
> + *
> + * This is part of the device tree overlay application process, when you=
 need to
> + * assign a phandle to a node that doesn't currently have one.
> + *
> + * returns:
> + *      Next phandle to be assigned on success
> + *      Negative error code on failure
> + */
> +static int overlay_next_phandle(void *fdt, void *fdto)
> +{
> +	int base_max, overlay_max;
> +
> +	base_max =3D fdt_get_max_phandle(fdt);
> +	if (base_max < 0)
> +		return base_max;
> +	overlay_max =3D fdt_get_max_phandle(fdto);
> +	if (overlay_max < 0)
> +		return overlay_max;
> +	return (base_max > overlay_max ? base_max : overlay_max) + 1;
> +}

This is deceptively expensive, doing a full scan of both base and
overlay blobs whenever you want to get a new phandle.  I also don't
think it's quite necessary: I'm pretty sure the way we adjust the
overlay phandles they always have to be greater than those in the base
tree.  You could find the maximum phandle of the (adjusted) overlay
while evaluating overlay_adjust_local_phandles().

That would let you generate new phandles without extra full scans
through the blobs.

> +
> +/**
> + * overlay_assign_phandle - Assign a phandle to a symbol in the base fdt
> + * @fdt: Base Device Tree blob
> + * @fdto: Device tree overlay blob
> + * @symbol_off: Node offset of the symbol to be assigned a phandle

I don't like that name - this is is the offset of the node that the
symbol references, not the symbol itself (which is a property).

> + *
> + * overlay_assign_phandle() assigns the next phandle available to the re=
quested
> + * node in the base device tree.
> + *
> + * This is part of the device tree overlay application process, when you=
 want to
> + * reference a symbol in the base device tree that doesn't yet have a ph=
andle.
> + *
> + * returns:
> + *      phandle assigned on success
> + *      0 on failure
> + */
> +static int overlay_assign_phandle(void *fdt, void *fdto, int symbol_off)
> +{
> +	int phandle, ret;
> +	fdt32_t phandle_val;
> +
> +	/* Overlay phandles have already been adjusted, grab highest phandle */
> +	phandle =3D overlay_next_phandle(fdt, fdto);
> +	if (phandle < 0)
> +		return 0;
> +	phandle_val =3D cpu_to_fdt32(phandle);
> +	ret =3D fdt_setprop(fdt, symbol_off, "phandle", &phandle_val, sizeof(ph=
andle_val));
> +	if (!ret)
> +		return phandle;

You can use fdt_setprop_u32() to avoid the manual byteswap.

> +	return 0;
> +}
> +
>  /**
>   * overlay_fixup_one_phandle - Set an overlay phandle to the base one
>   * @fdt: Base Device Tree blob
> @@ -359,7 +419,7 @@ static int overlay_update_local_references(void *fdto=
, uint32_t delta)
>   *      Negative error code on failure
>   */
>  static int overlay_fixup_one_phandle(void *fdt, void *fdto,
> -				     int symbols_off,
> +				     int *symbols_off,
>  				     const char *path, uint32_t path_len,
>  				     const char *name, uint32_t name_len,
>  				     int poffset, const char *label)
> @@ -370,10 +430,10 @@ static int overlay_fixup_one_phandle(void *fdt, voi=
d *fdto,
>  	int symbol_off, fixup_off;
>  	int prop_len;
> =20
> -	if (symbols_off < 0)
> -		return symbols_off;
> +	if (*symbols_off < 0)
> +		return *symbols_off;
> =20
> -	symbol_path =3D fdt_getprop(fdt, symbols_off, label,
> +	symbol_path =3D fdt_getprop(fdt, *symbols_off, label,
>  				  &prop_len);
>  	if (!symbol_path)
>  		return prop_len;
> @@ -383,8 +443,14 @@ static int overlay_fixup_one_phandle(void *fdt, void=
 *fdto,
>  		return symbol_off;
> =20
>  	phandle =3D fdt_get_phandle(fdt, symbol_off);
> -	if (!phandle)
> -		return -FDT_ERR_NOTFOUND;
> +	if (!phandle) {
> +		phandle =3D overlay_assign_phandle(fdt, fdto, symbol_off);
> +		if (phandle =3D=3D 0)
> +			return -FDT_ERR_NOTFOUND;
> +
> +		/* Re-lookup symbols offset, it's been invalidated */
> +		*symbols_off =3D fdt_path_offset(fdt, "/__symbols__");
> +	}
> =20
>  	fixup_off =3D fdt_path_offset_namelen(fdto, path, path_len);
>  	if (fixup_off =3D=3D -FDT_ERR_NOTFOUND)
> @@ -418,7 +484,7 @@ static int overlay_fixup_one_phandle(void *fdt, void =
*fdto,
>   *      0 on success
>   *      Negative error code on failure
>   */
> -static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
> +static int overlay_fixup_phandle(void *fdt, void *fdto, int *symbols_off,
>  				 int property)
>  {
>  	const char *value;
> @@ -519,8 +585,7 @@ static int overlay_fixup_phandles(void *fdt, void *fd=
to)
> =20
>  	fdt_for_each_property_offset(property, fdto, fixups_off) {
>  		int ret;
> -
> -		ret =3D overlay_fixup_phandle(fdt, fdto, symbols_off, property);
> +		ret =3D overlay_fixup_phandle(fdt, fdto, &symbols_off, property);
>  		if (ret)
>  			return ret;
>  	}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--A6Z7MKnLVMfR85kG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpMbToACgkQbDjKyiDZ
s5JopA//TjAH0TweKzKmIKs+y/fJejZqPKQ1XMEOBZbOHunp//pkzFD0cH+dmWmn
qdcTTTYvUZP61a4q5K7SUYadqBTcEiQNzxRa7CQOmLzzJAMb6V+OZHep605js1N/
MXwjx4sSJUwUxAcogfwHk7X5kklCfGUJS2Rl/bhrw9eBTb026s0GKoMVndsiq8HL
oa/Rh9hzIi++4mHNXt6c6t48bU1Yu2H+0Otcw0ERaga10Ky9ScjB3JJYOaJE+lvv
opzvdPwA6uZ3J4gjRC0UG+863GXXTnWBdBnae2EfNEj7Xw6bM92mfwDHNjWjVutB
TDBJfTEbaThHW9Topr0nnsFS+Y2FUuxbwn+yNE5rjWpQIh1XK9qoCYo1FUfjbDBr
7Q3rCOsuNo7CEcVVW3Tk/qh2cfOcl7SCRiD+sEsFB01+Yy6c8I0Y+4dKjqBWay2K
aqTwgXo0jv9LEBOIyikVrFLsjz96kJhFpdHdl34MiceUF/Ump2iovVtyZrY5ie2M
4IqQkXf1v1GQUjEHfe+pxA601aYtByzAses9nv8LE+1QsE95DLB9LoGXu2DzqMwV
lUx31ntGSBqaG4uHh4zWAJbpw3VXs2HEduGw69wfYW/RBh/sSYRnRMmjuJnQqF9c
/YibG1ow6ERKlD03X+raJGWD5Fk6+DypXHRFcH99K+ZHwyAwG8Y=
=95gF
-----END PGP SIGNATURE-----

--A6Z7MKnLVMfR85kG--
