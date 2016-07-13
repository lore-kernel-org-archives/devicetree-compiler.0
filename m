From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtget.c: Fix memory leak
Date: Wed, 13 Jul 2016 12:50:05 +1000
Message-ID: <20160713025005.GD14615@voom.fritz.box>
References: <1468362968-32090-1-git-send-email-jcd@tribudubois.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1468378695;
	bh=8OH1VPrbBp85EaVEU0GYKz+lzGaoLYQHt3cTgwRah38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTHp+2af/H1Y046n5s+1zXX8PO0ks/lyLg0sz8ElIgianPnBBBSkvMvbFFkahZHJf
	 +cgyNOL76k88WH/4nKz7Lm3t1dcxpr/iCy598do/yMM5Bx/eTwASAL3dfSC3Xy3fuH
	 TXC+1Gn5arKaIBdy4LezDrqdFu2gR7Cm0TEpQBxY=
Content-Disposition: inline
In-Reply-To: <1468362968-32090-1-git-send-email-jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org


--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 12:36:08AM +0200, Jean-Christophe Dubois wrote:
> CID 132823 (#1 of 1): Resource leak (RESOURCE_LEAK)
> 5. leaked_storage: Variable blob going out of scope leaks the storage it =
points to.
>=20
> Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

Since the program exits immediately after this free(), there's really
no point.

> ---
>  fdtget.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/fdtget.c b/fdtget.c
> index 4377419..fb9d0e1 100644
> --- a/fdtget.c
> +++ b/fdtget.c
> @@ -266,14 +266,20 @@ static int do_fdtget(struct display_info *disp, con=
st char *filename,
>  				continue;
>  			} else {
>  				report_error(arg[i], node);
> +				free(blob);
>  				return -1;
>  			}
>  		}
>  		prop =3D args_per_step =3D=3D 1 ? NULL : arg[i + 1];
> =20
> -		if (show_data_for_item(blob, disp, node, prop))
> +		if (show_data_for_item(blob, disp, node, prop)) {
> +			free(blob);
>  			return -1;
> +		}
>  	}
> +
> +	free(blob);
> +
>  	return 0;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhaxdAAoJEGw4ysog2bOS28IP+gLnq8V0+s5vfQpLvpJkaY4X
cCwyLnW9zt62VGmfYQNg9pd5lIkDUhrZ9Mglj+fPFvkQfBeFWC+Yph6KHq5Sd+Bp
sr64OCx5j85r31jAoSRTlmyHlAbRHYeP6TPsraUpv40SBUJ/0o/5/eOaOibkRFjU
M46thkC6TC4lCAYbl1cHUoIZtuUyV2rX9o2eJt+PkjjlCbiAdurZXt4/6DRUoFpw
UIPNV41Z2Ey6h+mCRpNqpgq7BmiPYSff1E4MbHcKrDlCPczhM0MN4pCwQZ1PDumT
SCLcOR6shmM2wR9xLBCKgPmTwy6BjKrteSorx89aRZ5gqjJc9nQAN2EUFIeDi0gZ
L+hFlAZQNFnnMZkjc7XL785RxTriVLU1a6NGfwqMtjyFDBDFmluOznz73dzY2vuX
Fyip+J/Hkia0ejasJY8hCC6uAMxiT+7reXqTMeIMthh9HQtziqp0wA2ae2VIrLVe
aE9DpR8VCdREvwpT8sFjF9WZMlgoW5cErVPaMVVR9IlPP7Q7U5ShHVoUfpcwGXQT
BxFvq4Vl92kyRFgUFYBbtf4sUvUUTM3O2l6VJHbJ2vK5J7oEWdITu2FNPOx0GoVj
7vDhb5uw8pu1M/mBhsXwm2+EAhcxi+yjmNpS374ngtinXHSnc4f5uiQnyAE8yprO
JKG2X7MipuXhn44mh1gW
=rxXQ
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--
