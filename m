From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] fdt: strerr: Remove spurious BADOVERLAY
Date: Tue, 11 Oct 2016 21:16:41 +1100
Message-ID: <20161011101641.GF8952@umbus.fritz.box>
References: <20161011081033.28604-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5CUMAwwhRxlRszMD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1476194268;
        bh=6RGZuAZxyXEjnSrpxMZRg/cSMPUT4CkmcpRtcY/7u6w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bb4ObMPatau41TbS+pnEHhsPcgUckNKoj9JijqLo2toTG+Grqv+xC7algrmQgEAYk
         nb4w/Litw2aiertuDIiHBhtDu4jBZx7TCZ8qLbqLWp0d5Yh0OZxMWDB6q0LzCnLCUy
         NCprGiWh0EwQJG9iJSjK6YPMBcSA1HafnDIqRZTc=
Content-Disposition: inline
In-Reply-To: <20161011081033.28604-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2016 at 10:10:31AM +0200, Maxime Ripard wrote:
> There's one FDT_ERR_BADOVERLAY too many in the fdt error table.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

All applied to master.

> ---
>  libfdt/fdt_strerror.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
> index e00fcb19df60..4ab3eb70b2bd 100644
> --- a/libfdt/fdt_strerror.c
> +++ b/libfdt/fdt_strerror.c
> @@ -78,7 +78,6 @@ static struct fdt_errtabent fdt_errtable[] =3D {
>  	FDT_ERRTABENT(FDT_ERR_BADSTRUCTURE),
>  	FDT_ERRTABENT(FDT_ERR_BADLAYOUT),
>  	FDT_ERRTABENT(FDT_ERR_BADOVERLAY),
> -	FDT_ERRTABENT(FDT_ERR_BADOVERLAY),
>  	FDT_ERRTABENT(FDT_ERR_NOPHANDLES),
>  };
>  #define FDT_ERRTABSIZE	(sizeof(fdt_errtable) / sizeof(fdt_errtable[0]))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5CUMAwwhRxlRszMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX/LwHAAoJEGw4ysog2bOSsDkQAK6N85RxKwQZOt6LsSZGf6bV
iKOURQcF7NxtB1+fcloIYVM5kLSSmcWrSxP6fpgKcAUQf2SzRhHOdaIb2JW9WKRH
2ExCKEopMyFvgrVo1L9Nb6hZ7hPVi55MYfKAhWwjqNlH5Wt2mcY6IY261QHgv+j7
urJHeXhniN6TWsqh17GygFyyYq5r48HSFjI1q4AqSRokETVD4Ff75CWDlawJTnhe
nHR/asf4pkuWRNEgJMqnVOHCYcCkaqygQoj4GyKDsSGZxNiE7OtoIVW8Bmj+M5vR
+FGCSZiGHlZ7qz6dKAsm8PLG0qBrzp9PNxZ+ULWVtT8R16eCfAOaKSNM8aJ3cxen
5HMfUJkFW2oMyLuaj1cI3HFxRD5jNAz48L6VbCasZNv0eT6d/AO0pafXUmT3Zxp3
KXSpaS2mwd3neV01K9OnMOQ3RNTGttr0QCStQaBKmDUXWwzToq/K8hEOgf0ZYCcw
aKfoLGl/Fqd5V0MeginWybdbPCDl6cEKkGz5O+e5051qLP/LvvGFl/DM9iVZiCWS
hKk2Whi+hmuKJYDllVaM8orgPACnwzyVO+7ER/n0VgD8fDWBoxBX07ZDk0eOFH2S
5O3smUwYenBLhx3/DielkKFhIPGyyckY9p9rqPOs9rrk/AiJcBN9wWS7P09IXjx5
TK7juVE1BfgeVFvCqWsC
=PCNw
-----END PGP SIGNATURE-----

--5CUMAwwhRxlRszMD--
