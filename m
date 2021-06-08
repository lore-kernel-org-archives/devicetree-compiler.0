From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/5] yamltree: Remove marker ordering dependency
Date: Tue, 8 Jun 2021 11:54:33 +1000
Message-ID: <YL7N2Q1zjvtFcy3z@yekko>
References: <20210526010335.860787-1-robh@kernel.org>
 <20210526010335.860787-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ik0lkSKcq9bkQkbr"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623119149;
        bh=neUWfCzbheYRS0sjoPjqeATvBrBYAjfNZCiuxxGkwgQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pm4ON0+0rhyv+QCyyddFmtvZmU3+rfNO9jR1K/oPzxUVZ2/6YmkTTdLccuvtjVA+v
         oeyUqCYGW7vnRcdRStiOcjuoBbLOcUcGgsjc7y8xa+7Ict3nvmXDHJl46N+s0SPCr9
         ZrpsYa6ie4oKo9JOFepq938eyRnLi3BqdXTKqTf4=
Content-Disposition: inline
In-Reply-To: <20210526010335.860787-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ik0lkSKcq9bkQkbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:03:31PM -0500, Rob Herring wrote:
> The check for phandle markers is fragile because the phandle marker must
> be after a type marker. The only guarantee for markers is they are in
> offset order. The order at a specific offset is undefined.
>=20
> Rework yaml_propval_int() to get the full marker list, so it can find a
> phandle marker no matter the ordering.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Frankly, I think the difference in data models is enough that yaml
output will *always* be fragile, but this helps somewhat so I've
applied it.

> ---
>  yamltree.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/yamltree.c b/yamltree.c
> index e63d32fe142a..55908c829c98 100644
> --- a/yamltree.c
> +++ b/yamltree.c
> @@ -29,11 +29,12 @@ char *yaml_error_name[] =3D {
>  		    (emitter)->problem, __func__, __LINE__);		\
>  })
> =20
> -static void yaml_propval_int(yaml_emitter_t *emitter, struct marker *mar=
kers, char *data, unsigned int len, int width)
> +static void yaml_propval_int(yaml_emitter_t *emitter, struct marker *mar=
kers,
> +	char *data, unsigned int seq_offset, unsigned int len, int width)
>  {
>  	yaml_event_t event;
>  	void *tag;
> -	unsigned int off, start_offset =3D markers->offset;
> +	unsigned int off;
> =20
>  	switch(width) {
>  		case 1: tag =3D "!u8"; break;
> @@ -66,7 +67,7 @@ static void yaml_propval_int(yaml_emitter_t *emitter, s=
truct marker *markers, ch
>  			m =3D markers;
>  			is_phandle =3D false;
>  			for_each_marker_of_type(m, REF_PHANDLE) {
> -				if (m->offset =3D=3D (start_offset + off)) {
> +				if (m->offset =3D=3D (seq_offset + off)) {
>  					is_phandle =3D true;
>  					break;
>  				}
> @@ -114,6 +115,7 @@ static void yaml_propval(yaml_emitter_t *emitter, str=
uct property *prop)
>  	yaml_event_t event;
>  	unsigned int len =3D prop->val.len;
>  	struct marker *m =3D prop->val.markers;
> +	struct marker *markers =3D prop->val.markers;
> =20
>  	/* Emit the property name */
>  	yaml_scalar_event_initialize(&event, NULL,
> @@ -151,19 +153,19 @@ static void yaml_propval(yaml_emitter_t *emitter, s=
truct property *prop)
> =20
>  		switch(m->type) {
>  		case TYPE_UINT16:
> -			yaml_propval_int(emitter, m, data, chunk_len, 2);
> +			yaml_propval_int(emitter, markers, data, m->offset, chunk_len, 2);
>  			break;
>  		case TYPE_UINT32:
> -			yaml_propval_int(emitter, m, data, chunk_len, 4);
> +			yaml_propval_int(emitter, markers, data, m->offset, chunk_len, 4);
>  			break;
>  		case TYPE_UINT64:
> -			yaml_propval_int(emitter, m, data, chunk_len, 8);
> +			yaml_propval_int(emitter, markers, data, m->offset, chunk_len, 8);
>  			break;
>  		case TYPE_STRING:
>  			yaml_propval_string(emitter, data, chunk_len);
>  			break;
>  		default:
> -			yaml_propval_int(emitter, m, data, chunk_len, 1);
> +			yaml_propval_int(emitter, markers, data, m->offset, chunk_len, 1);
>  			break;
>  		}
>  	}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ik0lkSKcq9bkQkbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC+zdYACgkQbDjKyiDZ
s5KiwhAAlRm/AjI9rRDBbANmwrKaTxoQ+3P9lAwABT0gBtf+TGJr7nNRtB2EHbNP
9oQIrqYU9P30h2VVnYf8FEtuDshbk/Te5+mwzgqwND+gk1bYqf9LpXosQZee9vYT
ALb/UFCTR8J2u/1RFCxJ7yy5x05BwW1rwkM+X4aC6U67Lgnr/9UirFcC8SIEF1pN
ODed8JiGhtXb2KivTZvd4u1Lohrj8aXOTTe2flauLZWJYlnG/sMJ75ke93eiY1+l
SdpUo38+mTW6xRhSLjN8jlp5NNdZ2kR9zwR+O1aF42oLK63ha27yDFop0biHZ3Zk
RVExexcKxzzg0NiBwgD3ayB3FIbWXOlXBShlf9AJSOGIVdEnKWax4fypqqkkbEG5
YmmdTPL0jGiScIHa1aRCXnxHqHYgi73TCQzGOy8SxDCRR2qHiYDu2fPvKtAk+H8z
Mjlf/MnHMpkL7PLkgSGVUndrK6KdRgwsK+KfW1ozmg7C/tcyn45sI6WQUBQaYayg
+QwssNNOdN0Xu9TYbxIMalBbV4WohWEaJi+auUUAlCR3OTJ5YPkqpQ0oev9dzyY7
D7uoe8BS9GZiYxZ6VfZIXt6yGG2TsDj28tnpcm7VUGJ9jwoyn449rljfRH+sLHlF
PNHQGGuhb15RCxiRwihohaFIBQD/pe1xute24KzcJEuk87/K/ME=
=+wYP
-----END PGP SIGNATURE-----

--ik0lkSKcq9bkQkbr--
