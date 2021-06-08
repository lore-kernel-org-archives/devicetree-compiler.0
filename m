From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/5] checks: Add check_is_cell() for all phandle+arg
 properties
Date: Tue, 8 Jun 2021 11:57:46 +1000
Message-ID: <YL7OmqDaZRrcWbjo@yekko>
References: <20210526010335.860787-1-robh@kernel.org>
 <20210526010335.860787-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="orhl8VZgfCCEYRAu"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623119149;
        bh=tdI+gnu7UWw/vFRBOsPY9rIgtiaS9ziZ2LP4AXiebxU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e0E1e/E2onitgqK/lVFY/jc5Lg1YBWDrm93US+1G4XqNCRUaxrUvUrk7gZdNlgLpC
         Bz6e9JK/Ijw8WO9G7TUX5GsYS4m7NidnC9PEvnNoEoSnriN25/rMD6CASbTgaAzpHS
         OR/SsqUlnogCHixncQ++oKwTAW37lCHCRHo3aUqc=
Content-Disposition: inline
In-Reply-To: <20210526010335.860787-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--orhl8VZgfCCEYRAu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:03:32PM -0500, Rob Herring wrote:
> There's already a check for '#.*-cells' properties, so let's enable it for
> all the ones we already know about.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Good idea, applied.

> ---
>  checks.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index eb91c8ea22fa..6a01a2468c42 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1466,7 +1466,8 @@ static void check_provider_cells_property(struct ch=
eck *c,
>  }
>  #define WARNING_PROPERTY_PHANDLE_CELLS(nm, propname, cells_name, ...) \
>  	static struct provider nm##_provider =3D { (propname), (cells_name), __=
VA_ARGS__ }; \
> -	WARNING(nm##_property, check_provider_cells_property, &nm##_provider, &=
phandle_references);
> +	WARNING_IF_NOT_CELL(nm##_is_cell, cells_name); \
> +	WARNING(nm##_property, check_provider_cells_property, &nm##_provider, &=
nm##_is_cell, &phandle_references);
> =20
>  WARNING_PROPERTY_PHANDLE_CELLS(clocks, "clocks", "#clock-cells");
>  WARNING_PROPERTY_PHANDLE_CELLS(cooling_device, "cooling-device", "#cooli=
ng-cells");
> @@ -1843,21 +1844,37 @@ static struct check *check_table[] =3D {
>  	&chosen_node_is_root, &chosen_node_bootargs, &chosen_node_stdout_path,
> =20
>  	&clocks_property,
> +	&clocks_is_cell,
>  	&cooling_device_property,
> +	&cooling_device_is_cell,
>  	&dmas_property,
> +	&dmas_is_cell,
>  	&hwlocks_property,
> +	&hwlocks_is_cell,
>  	&interrupts_extended_property,
> +	&interrupts_extended_is_cell,
>  	&io_channels_property,
> +	&io_channels_is_cell,
>  	&iommus_property,
> +	&iommus_is_cell,
>  	&mboxes_property,
> +	&mboxes_is_cell,
>  	&msi_parent_property,
> +	&msi_parent_is_cell,
>  	&mux_controls_property,
> +	&mux_controls_is_cell,
>  	&phys_property,
> +	&phys_is_cell,
>  	&power_domains_property,
> +	&power_domains_is_cell,
>  	&pwms_property,
> +	&pwms_is_cell,
>  	&resets_property,
> +	&resets_is_cell,
>  	&sound_dai_property,
> +	&sound_dai_is_cell,
>  	&thermal_sensors_property,
> +	&thermal_sensors_is_cell,

Incidentally, if anyone can see a decent, portable way of avoiding the
ugly redundancy of listing all the tests in this array, I'd love to
hear it.

>  	&deprecated_gpio_property,
>  	&gpios_property,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--orhl8VZgfCCEYRAu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC+zpoACgkQbDjKyiDZ
s5Icew/9F06tbCSgWMDohsBJ/vXywMpay3h05lCVkH+suRxkW7ZWkTb2Q00GMLfD
YIhMbN85k1APKbAmu6mzSi4RDtT/a0VPK6GaDbV3fJCi/kehjB4lm+el7OFa+JZJ
BkjTyCoQwTDGkV8cvsJ1eGuCy9pqH6cYK0PmW4GlrVvLoCy8I0Tvt8b3et8WNuDo
BMnPpBCskveAKdQHoEM+uRNZ8JYD0vQjPh2xfbTPTwZ4br73/hJnWaD82BXxb6Xc
vxLAR6Rjhb2o715JVWPPu+eQvZxcOHm8cdFInK/5DHmLhkstHHY6GXfHKWmKWbmv
pSKvhckyveWRHqUu6xI09gptJqC067isxokIzQckHDGarxaii9SZhA+1ebJYJpyF
DIXiKBzzIo3PwhpMFsNYF5YWIuza+K2nlr9mqJtzjCAC7C5+CIz0BUTfv/NifPtw
Ms2GUIkMBEjWYbu2Nz+946h7NprWf/s1A2x1SnjH/F2Ph5YdokgHbTi4AL4fb/fX
2rjAijZOFNSHLCTporFrLU89PmRNT3FBPfJ0MEayeN1BYu/Oz2TA0vVcL9+dAIp7
NYZ58gnd3kO8mkKzfR1JugMPn1uaC8vfukL0enfs5W+Suh1yjaSX6u0ZTKfFHQaL
ktY6CYX+EdEXtW8Xh2OVSovL1LGod1LX/5wpnBp9IQh3Q50eGE0=
=P000
-----END PGP SIGNATURE-----

--orhl8VZgfCCEYRAu--
