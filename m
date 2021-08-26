From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/5] Move marker functions to dtc.h
Date: Thu, 26 Aug 2021 14:00:53 +1000
Message-ID: <YScR9WbrB/1KHsk9@yekko>
References: <20210727183023.3212077-1-robh@kernel.org>
 <20210727183023.3212077-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0KEXkOKxnHH9C3aA"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1629950975;
        bh=X8KGFwKus0lKwelSICrKeXsEqgHWQsA5YoHkZ2FBGgc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qS3FQlWxL6pqPhvqc4NOx3Q4IJVgD0hwx/ShLikSHP8e+25Dg1dww7m2ltYrujQ51
         zQdJpCOglQ5+daIqhopAOxbr2kyzU1lLmHzx0H04xsgXm3AtFdnjhSaKrrFUGzFDmI
         Nn3lgh5p5uH/28X9wGc40iBAuGv6+iPxQZPUZB90=
Content-Disposition: inline
In-Reply-To: <20210727183023.3212077-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--0KEXkOKxnHH9C3aA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 12:30:19PM -0600, Rob Herring wrote:
> In preparation to share the marker related functions, let's move them all
> out of treeresource.c into dtc.h. Rework the next_type_marker()
> implementation to use for_each_marker() instead of open coding it.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
> v3:
>  - New patch
> ---
>  dtc.h        | 23 ++++++++++++++++++++++-
>  treesource.c | 23 +----------------------
>  2 files changed, 23 insertions(+), 23 deletions(-)
>=20
> diff --git a/dtc.h b/dtc.h
> index cf2c6ac6e81e..0a1f54991026 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -116,6 +116,12 @@ enum markertype {
>  	TYPE_UINT64,
>  	TYPE_STRING,
>  };
> +
> +static inline bool is_type_marker(enum markertype type)
> +{
> +	return type >=3D TYPE_UINT8;
> +}
> +
>  extern const char *markername(enum markertype markertype);
> =20
>  struct  marker {
> @@ -140,7 +146,22 @@ struct data {
>  	for_each_marker(m) \
>  		if ((m)->type =3D=3D (t))
> =20
> -size_t type_marker_length(struct marker *m);
> +static inline struct marker *next_type_marker(struct marker *m)
> +{
> +	for_each_marker(m)
> +		if (is_type_marker(m->type))
> +			break;
> +	return m;
> +}
> +
> +static inline size_t type_marker_length(struct marker *m)
> +{
> +	struct marker *next =3D next_type_marker(m->next);
> +
> +	if (next)
> +		return next->offset - m->offset;
> +	return 0;
> +}
> =20
>  void data_free(struct data d);
> =20
> diff --git a/treesource.c b/treesource.c
> index 061ba8c9c5e8..db2ff69f5ccb 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -124,27 +124,6 @@ static void write_propval_int(FILE *f, const char *p=
, size_t len, size_t width)
>  	}
>  }
> =20
> -static bool has_data_type_information(struct marker *m)
> -{
> -	return m->type >=3D TYPE_UINT8;
> -}
> -
> -static struct marker *next_type_marker(struct marker *m)
> -{
> -	while (m && !has_data_type_information(m))
> -		m =3D m->next;
> -	return m;
> -}
> -
> -size_t type_marker_length(struct marker *m)
> -{
> -	struct marker *next =3D next_type_marker(m->next);
> -
> -	if (next)
> -		return next->offset - m->offset;
> -	return 0;
> -}
> -
>  static const char *delim_start[] =3D {
>  	[TYPE_UINT8] =3D "[",
>  	[TYPE_UINT16] =3D "/bits/ 16 <",
> @@ -230,7 +209,7 @@ static void write_propval(FILE *f, struct property *p=
rop)
>  		size_t data_len =3D type_marker_length(m) ? : len - m->offset;
>  		const char *p =3D &prop->val.val[m->offset];
> =20
> -		if (has_data_type_information(m)) {
> +		if (is_type_marker(m->type)) {
>  			emit_type =3D m->type;
>  			fprintf(f, " %s", delim_start[emit_type]);
>  		} else if (m->type =3D=3D LABEL)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0KEXkOKxnHH9C3aA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEnEfMACgkQbDjKyiDZ
s5K6iw//XC7U61SD3sKK99Oe1gy2e+YtDx38uCVRGfIEJP0Ihexaxdx0Qro0ZHB3
1cnr9F24qtneK69DS1OUuYufEG1hsiviEGuzH2rx+ayaX4Sie8oRoaBmrVfoI/gB
I6nG7nRzVXD2IRff92aitKhM7td5P4w9INSkb61spED8D4BNLuGXdi3FNvvedi5M
qCbe6ah7yDio2UVkfVmnTjEd1cYx9hmQYy4/rLxDCQ9WnZb8Gjo8UBeIZBL86Ree
unaPYgxBx1QV9AWGFRphMjiKpiSwdfvbhGkQRvGazyYg1RZ3CpH8DCSks5mtNe4I
XwmPZsD/8ipespKeh8Ar+RY7UTkYqCehddUeUTopKgranvlwMbnlQQlzhbPwntdB
QGI41R9YR/uYIudPIlfPxtt6Q6VFf6luucVZDZu/Vi5XfO8ov9AtGYKNZSLNYXEn
YhcuBE/36TFFVqA2M/WV4KZOVNFC8IrKoDvM1gCGxLIR8O7j8XA2DH4CBRKp5Hhz
saW7tQQFB1qZsu7YV9VWokomT0Kt/hzD1eKw/Hmw7vLu7Qxo2tsDNfuEJnI9kqiE
ur7J6YEjYwTY8Yxwcok8U1z9M4aqIpnxDWryGZd+Cxbnfi2B2CJIOOG4kIy8uQu9
ZmMNUq9vCzDB/9KwjqpeBInuYEqq0qgy7CGqqenvBShFQ5zVoJY=
=UPXG
-----END PGP SIGNATURE-----

--0KEXkOKxnHH9C3aA--
