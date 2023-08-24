From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/1] dtc: fix asm_emit_data()
Date: Thu, 24 Aug 2023 15:15:10 +1000
Message-ID: <ZObnXq5cN6RgWBB/@zatzit>
References: <20230822110627.141540-1-heinrich.schuchardt@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hVUlnf8vC6rbV6fl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1692858761;
        bh=RQ0Cja1JnUtGP4efZLn2hR66JJL6/l6P6CRflVPYXxk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kOFyEH90HlwrLlmWfz4NBEjyVuKgtrfzbdx9GDgAeRJFwPzhjCdpPaasZl17xLjZU
         EJIEU9zWYk67xjGnmnGPPVIn656/kVXOPYLuz0luD7QwJN04CvqxlMw3DaLwmOlNGX
         Npj/3yAjoo4fAASzbg7SWA/hXePBmnvTVk0s8HlU=
Content-Disposition: inline
In-Reply-To: <20230822110627.141540-1-heinrich.schuchardt-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Heinrich Schuchardt <heinrich.schuchardt-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--hVUlnf8vC6rbV6fl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 01:06:27PM +0200, Heinrich Schuchardt wrote:
> ((d.len - off) >=3D sizeof(uint32_t)) will possibly be true if off > d.le=
n:

Technically true, but the code is constructed such that off is
always less than or equal to d.len.

> sizeof(uint32_t)) is an unsigned type. The C language will convert
> (d.len - off) to an unsigned type before executing the comparison.
>=20
> Correct the inequality.
> Change the equality for byte output to match the one for uint32_t.
>=20
> Fixes: 53359016caf6 ("dtc: Use stdint.h types throughout dtc")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> ---
>  flattree.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/flattree.c b/flattree.c
> index 1bcd808..9f67104 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -156,12 +156,12 @@ static void asm_emit_data(void *e, struct data d)
>  	for_each_marker_of_type(m, LABEL)
>  		emit_offset_label(f, m->ref, m->offset);
> =20
> -	while ((d.len - off) >=3D sizeof(uint32_t)) {
> +	while (d.len + sizeof(uint32_t) >=3D off) {

This eliminates the possibility of underflow, but replaces it with a
possibility of overflow.  Now there will be an overflow if d.len is
within 4 of UINT_MAX, again giving a surprising result.

Now, in practice I don't think d.len can ever exceed 2^31, but
confirming that requires looking through the entire codebase.  In
contrast confirming that off <=3D d.len requires only examining the few
lines of this function.

So, nack.

>  		asm_emit_cell(e, dtb_ld32(d.val + off));
>  		off +=3D sizeof(uint32_t);
>  	}
> =20
> -	while ((d.len - off) >=3D 1) {
> +	while (d.len + 1 >=3D off) {
>  		fprintf(f, "\t.byte\t0x%hhx\n", d.val[off]);
>  		off +=3D 1;
>  	}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hVUlnf8vC6rbV6fl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmTm51cACgkQzQJF27ox
2Gfg+BAAgUuZO7V4koVfF4v2ZPURpHXZiTPZ+DZaBt4OMQqkDwadrHa2i0LUaPx/
b3H4xQNfwdsi16pr3I5Gp4cCN6znRyindOCbPSM+DSVnRN//leP5g5pRPU3gjnwT
LdonXe6sUoEaVGpmJTM+KTK5A7xdiQSQCkaI63TinoddUkUqHrFg6oALELcDPxYz
4V2b4YlYDjqZ1L1bxq7BYofY+A2e2vc3dFbAiUMAOMMrusbTHt84yCgfsehyxrD5
hoLVkYuBeUQvrZUXd65bQvxzwoP1qJtXTGJJwrRmWBtOQB6bJRHIFS/n4LHM2mo2
iCCDn1pqW7iZG/RbfciO4X+XeanGuiT7chMIvi83pOoCTEE7Djtne3CQlSplOY2p
aFYZCFvNzG36dvL2LB6NnVhN1zv6q+MLne+bmqoII/JlSv/mdmkQQOW3Q8Tw70sp
zV6LcaEGcYNvadyIj9NhbvI2jobnd2us92cYU7uir9q33fxpQtWd9A+wect0bMoL
WkfH9eMQkLpUMqVGb4eY/hYPDl1dgZAHDVmdiVcFQxP1Fg4RKkSTmhhchb8nLPo6
hi2uorFuIt5spxVJJVPZ3IH2RUcYmwsiiaOxd1tzd7npKneBgtd4ek0gkvNZDthz
RJpv0O/UoyCCiCAYhdp5RZKe71iSfH04pDKQUs3uzlvl1bu/Wh4=
=Pj/9
-----END PGP SIGNATURE-----

--hVUlnf8vC6rbV6fl--
