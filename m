From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 4/5] checks: Ensure '#interrupt-cells' only exists in
 interrupt providers
Date: Thu, 14 Oct 2021 14:46:26 +1100
Message-ID: <YWeoEh6n6yzJvEjc@yekko>
References: <20211011191245.1009682-1-robh@kernel.org>
 <20211011191245.1009682-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VromDQs3sx65OGrv"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1634183456;
        bh=rCKqt4A/po8bQtUsTsskvev8wyeAFFuoh4VxvEdGG8s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f7c936Qf5FL2M6wxoTFkAxySWCP2B4eujKKNbI4o5s1rMSuprDMhPWI5rLnU69wGc
         KvvoACMRYgKuWvYRgJwMNGfK+yAd18/MFRy7M592X2Dev+sT5OG5d78/bHw1M4QK2e
         LjQlur3ieSGxYM8jbP+PycXVth3zkHkvlC5iU5VY=
Content-Disposition: inline
In-Reply-To: <20211011191245.1009682-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>


--VromDQs3sx65OGrv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 02:12:44PM -0500, Rob Herring wrote:
> The interrupt provider check currently checks if an interrupt provider
> has #interrupt-cells, but not whether #interrupt-cells is present
> outside of interrupt-providers. Rework the check to cover the latter
> case.
>=20
> Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
>  checks.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 1a39bfd2cd94..903083bfc423 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1573,14 +1573,20 @@ static void check_interrupt_provider(struct check=
 *c,
>  				     struct node *node)
>  {
>  	struct property *prop;
> +	bool irq_provider =3D node_is_interrupt_provider(node);
> =20
> -	if (!node_is_interrupt_provider(node))
> +	prop =3D get_property(node, "#interrupt-cells");
> +	if (irq_provider && !prop) {
> +		FAIL(c, dti, node,
> +		     "Missing '#interrupt-cells' in interrupt provider");
>  		return;
> +	}
> =20
> -	prop =3D get_property(node, "#interrupt-cells");
> -	if (!prop)
> +	if (!irq_provider && prop) {
>  		FAIL(c, dti, node,
> -		     "Missing #interrupt-cells in interrupt provider");
> +		     "'#interrupt-cells' found, but node is not an interrupt provider"=
);
> +		return;
> +	}
>  }
>  WARNING(interrupt_provider, check_interrupt_provider, NULL, &interrupts_=
extended_is_cell);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VromDQs3sx65OGrv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFnqBIACgkQbDjKyiDZ
s5LKgRAAlANGzbQRnOtbi2PK+ZJTqHH+4X+Qeq+t5shxweFO3++c3Y/t690VqpdY
W2weEH4osiAcHwDLIBS3zJFR23Xs+jy8rEO/i8mDxy+2yetjqxNrqDdS3lILdtPC
xiNF6r92DtAeUVy97UBZMtvefRW57e+sNqiQ5KZsU89wVAvD66BdNNtdp7LUpEFn
6q+9d7wBRoIAPYxmi3+Xgh9hEGsG31UUfoqQP+d1+FnBahvcHI2sl26Hc4VmLdA9
ZcnUX6A+ANf5oV+0jXBJJ1onF4qTja2hE72NB/z6IY+W++bZzU4LOLmGL7Mqnccu
CaghXjaG+h5lL/BfU4tjq7/aMpp1kMV0KpD5AIOsJKp2X2amPRM4nU38F/DPrS5n
Pt2YqJ8Q7RWgUA5D3VF6dQtttnRo+TPCCGQTdzsBzVPqugfX8MHsFw/lHeqG8Tnx
5BeUFCebwVpwVbgSNuAVVzUb+ztmDuOrmibtppB3LJgDDNoD5uYrn6QvssYKfour
JEkU2AAUe6ou4HTGS3nTBR/u/YFpZ4L80mOsfupBIDCBTQZbbbO9oy3YM6AzcKFY
g9SQZLfknR8Buxs6AB9zU+PkHxELjhX6+hEB6do/cOh8Ldgwl6Md5rVwcaBX19AK
lBjOn5uYzaHeVluLADdHQ7kPfZlB6KDth3upf6aNFHPB/dLbNvs=
=TjZL
-----END PGP SIGNATURE-----

--VromDQs3sx65OGrv--
