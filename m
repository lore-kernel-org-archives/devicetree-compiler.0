From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 04/14] libfdt: fdt_add_string_(): Fix comparison warning
Date: Thu, 24 Sep 2020 11:01:45 +1000
Message-ID: <20200924010145.GJ2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-5-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yhze8HlyfmXt1APY"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600911797;
        bh=mNOtDaVjskTQaJX/qCFK9pPDfoZwOeblaKNNGSdl+50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c6btj85wlpBaftOYkww7V8N++LkV9hV+scbuqIBJKluY1lBr4mjNb+KGyTbsVT7Vo
         pxgJcPk7Mi2G3n2jR/tVBAXbZsxb/4iC7BRYpYYh1xixaK+ui/NvHC4pFagpe/G6LO
         HebNe+v3ljjJc96090kVTUBotnNsdbMHOxomnZWI=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-5-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--yhze8HlyfmXt1APY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:52:53PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in fdt_add_string_().
>=20
> As struct_top can only be positive, just use an unsigned type for it,
> and avoid the signedness difference.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

I'm not sure this is right.  Well.. I'm also not sure it was right
before.  Adding some more context to explain why..

> ---
>  libfdt/fdt_sw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index d10a720..d65e9c8 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -249,7 +249,8 @@ static int fdt_add_string_(void *fdt, const char *s)
>  	char *strtab =3D (char *)fdt + fdt_totalsize(fdt);
>  	int strtabsize =3D fdt_size_dt_strings(fdt);
>  	int len =3D strlen(s) + 1;
> -	int struct_top, offset;
> +	unsigned int struct_top;
> +	int offset;
> =20
>  	offset =3D -strtabsize - len;
>  	struct_top =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
>	if (fdt_totalsize(fdt) + offset < struct_top)
>		return 0; /* no more room :( */

So strtabsize and len will always be positive (or, if they're not,
that's another problem), so offset is always negative.  Which means we
need the signed addition between totalsize and offset for this to be
correct.

So I suspect we want to make 'len' and 'offset' unsigned as well,
reverse the sign on offset and make it a subtraction in the if instead
of an addition-of-negative.

We might then need to explicitly check for offset < totalsize as well,
to cover the overflow case.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yhze8HlyfmXt1APY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9r7/cACgkQbDjKyiDZ
s5IGsQ//dxIJtpXL41bm9Le0hvl+2r6RWP1F2vYW4tyQnjWzRdAEwu96fxJBNOTy
OWY6cxArDyC+uCrvonj25x4FpCk6qiLG7v7SV+d2SL3ui/xwaylZuDM+nt5i5sRL
1lnlDxVRm3+C4n7zpX+N9xCxTptqspdRLFAz89i36kjeQK+ZKqeiU5SS7rdCnlk3
Xe7ZFQiTUXUh3TVhie2APNLpAcmTtG+ZkDFje+bkRAU6mg/TbwP3OBMRKC3yx2US
z0UasErA9Cr//rYz4gCRZryvLCSeHLMhRySkiH8v6M2qULhbIFZRsGWXeWu8jsML
/DCRPz1i+zp6a7ObGt1MhyQbjqdt5/8zxNjLVL6UVTK57HMPVA/v3YwSq5U6dnl4
lkJ/TiFzuUf1wghGLNuDviGDZOKVPO5JBKdfdbU6hzrj9kRsIWoe5mP52weFCUae
RnnNExMQyxRpcnNwa2GE5O6FjtiHqbp21GGO6chO1JhCLLTikHvFvDQeAWjWc6px
fsfwY7P6JPJHpq9E6opSYFAnvuJLk2eCl8WW6IEVAVhoe31C8XfIY0g8osGa5vBF
h3drnPairMfLsnCpWN+ezkzHU478Pj7LY8lhkp00EcVBxagFyQreCRyGUR1iJub9
92wgVlvwv4KmtjklON0gP8K8kUQK8wQ8NtyKLgC262Gdr2J++uE=
=JZle
-----END PGP SIGNATURE-----

--yhze8HlyfmXt1APY--
