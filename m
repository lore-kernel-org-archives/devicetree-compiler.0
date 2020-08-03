From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 4/6] dtc: Add support for signed operations
Date: Mon, 3 Aug 2020 20:21:32 +1000
Message-ID: <20200803102132.GH7553@yekko.fritz.box>
References: <20200714154542.18064-1-andrei.ziureaev@arm.com>
 <20200714154542.18064-5-andrei.ziureaev@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ISKrrfpKsPiF35CV"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1596450106;
        bh=HrZxzwWc9f3NzhiwR5xI1sxS8CeWur8zvMJa9M/NjAk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jK2wSUzKW+k6ElsCDfVzDI2bqRbd+XSRyj+GD1bV12mZ4sV3v2JYarptHPLtWrDU4
         e6qfxQonWFuf+OeMQ7UoE6Kl62ES0YKfRlaoTtbLOKyYStRYxnkFrHYJkvu4ZMAbp0
         q+nIRxYRYzLjp/bd1K4z4M7Q/r9shIhODGsbkPmQ=
Content-Disposition: inline
In-Reply-To: <20200714154542.18064-5-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ISKrrfpKsPiF35CV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2020 at 04:45:40PM +0100, Andrei Ziureaev wrote:
> Add support for signed operations, including division, modulo, right
> shift and comparisons. Signed values are "created" by the negation and
> subtraction operators and preserved by other operators as long as the
> value stays negative. Therefore "negative" and "signed" are the same
> thing in this case. Bitwise operators always return unsigned values.
>=20
> This is useful for validation with dt-schema, which uses
> arbitrary-precision arithmetic and needs explicit information about the
> sign.
>=20
> The TYPE_SIGNED marker can be used by yaml and dts emitters and, if a
> plugin interface is added, by plugins.
>=20
> Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>

Nack to this approach.

I'm pretty inclined to think that having signed arithmetic in dtc is
overkill to begin with.  But even if I'm convinced that we do need it,
then having the operator itself change the type is a really bad idea.


> ---
>  dtc-parser.y                | 81 ++++++++++++++++++++++++++++++++-----
>  dtc.h                       |  2 +
>  tests/integer-expressions.c |  8 ++++
>  3 files changed, 81 insertions(+), 10 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 3bc1aca..a7c1777 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -381,6 +381,8 @@ arrayprefix:
>  		}
>  	| arrayprefix integer_prim
>  		{
> +			struct data data =3D $1.data;
> +
>  			if ($1.bits < 64) {
>  				uint64_t mask =3D (1ULL << $1.bits) - 1;
>  				/*
> @@ -396,7 +398,10 @@ arrayprefix:
>  					      " %d-bit array element", $1.bits);
>  			}
> =20
> -			$$.data =3D data_append_integer($1.data, $2.ull, $1.bits);
> +			if ($2.is_negative)
> +				data =3D data_add_marker(data, TYPE_SIGNED, NULL);
> +
> +			$$.data =3D data_append_integer(data, $2.ull, $1.bits);
>  		}
>  	| arrayprefix dt_ref
>  		{
> @@ -492,19 +497,31 @@ integer_rela:
>  	  integer_shift
>  	| integer_rela '<' integer_shift
>  		{
> -			$$ =3D (struct integer){ $1.ull < $3.ull };
> +			if ($1.is_negative || $3.is_negative)
> +				$$ =3D (struct integer){ (int64_t)$1.ull < (int64_t)$3.ull };
> +			else
> +				$$ =3D (struct integer){ $1.ull < $3.ull };
>  		}
>  	| integer_rela '>' integer_shift
>  		{
> -			$$ =3D (struct integer){ $1.ull > $3.ull };
> +			if ($1.is_negative || $3.is_negative)
> +				$$ =3D (struct integer){ (int64_t)$1.ull > (int64_t)$3.ull };
> +			else
> +				$$ =3D (struct integer){ $1.ull > $3.ull };
>  		}
>  	| integer_rela DT_LE integer_shift
>  		{
> -			$$ =3D (struct integer){ $1.ull <=3D $3.ull };
> +			if ($1.is_negative || $3.is_negative)
> +				$$ =3D (struct integer){ (int64_t)$1.ull <=3D (int64_t)$3.ull };
> +			else
> +				$$ =3D (struct integer){ $1.ull <=3D $3.ull };
>  		}
>  	| integer_rela DT_GE integer_shift
>  		{
> -			$$ =3D (struct integer){ $1.ull >=3D $3.ull };
> +			if ($1.is_negative || $3.is_negative)
> +				$$ =3D (struct integer){ (int64_t)$1.ull >=3D (int64_t)$3.ull };
> +			else
> +				$$ =3D (struct integer){ $1.ull >=3D $3.ull };
>  		}
>  	;
> =20
> @@ -515,7 +532,13 @@ integer_shift:
>  		}
>  	| integer_shift DT_RSHIFT integer_add
>  		{
> -			$$ =3D (struct integer){ ($3.ull < 64) ? ($1.ull >> $3.ull) : 0 };
> +			if ($3.ull < 64)
> +				if ($1.is_negative)
> +					$$ =3D (struct integer){ (int64_t)$1.ull >> $3.ull };
> +				else
> +					$$ =3D (struct integer){ $1.ull >> $3.ull };
> +			else
> +				$$ =3D (struct integer){ $1.is_negative ? ~0ULL : 0 };
>  		}
>  	| integer_add
>  	;
> @@ -524,10 +547,20 @@ integer_add:
>  	  integer_add '+' integer_mul
>  		{
>  			$$ =3D (struct integer){ $1.ull + $3.ull };
> +
> +			if ($1.is_negative =3D=3D $3.is_negative)
> +				$$.is_negative =3D $1.is_negative;
> +			else
> +				$$.is_negative =3D $1.ull < -$3.ull;
>  		}
>  	| integer_add '-' integer_mul
>  		{
>  			$$ =3D (struct integer){ $1.ull - $3.ull };
> +
> +			if ($1.is_negative !=3D $3.is_negative)
> +				$$.is_negative =3D $1.is_negative;
> +			else
> +				$$.is_negative =3D $1.ull < $3.ull;
>  		}
>  	| integer_mul
>  	;
> @@ -535,12 +568,29 @@ integer_add:
>  integer_mul:
>  	  integer_mul '*' integer_unary
>  		{
> -			$$ =3D (struct integer){ $1.ull * $3.ull };
> +			/* For our purpose, signed multiplication is the same as
> +			 * unsigned multiplication */
> +			$$ =3D (struct integer){
> +				$1.ull * $3.ull,
> +				$1.is_negative !=3D $3.is_negative
> +			};
>  		}
>  	| integer_mul '/' integer_unary
>  		{
>  			if ($3.ull !=3D 0) {
> -				$$ =3D (struct integer){ $1.ull / $3.ull };
> +				if ($1.is_negative || $3.is_negative) {
> +					/* Prevent UB in signed division */
> +					if (($1.ull =3D=3D (1ULL << 63)) && ($3.ull =3D=3D ~0ULL))
> +						$$ =3D (struct integer){ $1.ull };
> +					else
> +						$$ =3D (struct integer){
> +							(int64_t)$1.ull / (int64_t)$3.ull
> +						};
> +
> +					$$.is_negative =3D $1.is_negative !=3D $3.is_negative;
> +				} else {
> +					$$ =3D (struct integer){ $1.ull / $3.ull };
> +				}
>  			} else {
>  				ERROR(&@$, "Division by zero");
>  				$$ =3D (struct integer){ 0 };
> @@ -549,7 +599,18 @@ integer_mul:
>  	| integer_mul '%' integer_unary
>  		{
>  			if ($3.ull !=3D 0) {
> -			$$ =3D (struct integer){ $1.ull % $3.ull };
> +				if ($1.is_negative || $3.is_negative) {
> +					if (($1.ull =3D=3D (1ULL << 63)) && ($3.ull =3D=3D ~0ULL))
> +						$$ =3D (struct integer){ 0 };
> +					else
> +						$$ =3D (struct integer){
> +							(int64_t)$1.ull % (int64_t)$3.ull
> +						};
> +
> +					$$.is_negative =3D $1.is_negative;
> +				} else {
> +					$$ =3D (struct integer){ $1.ull % $3.ull };
> +				}
>  			} else {
>  				ERROR(&@$, "Division by zero");
>  				$$ =3D (struct integer){ 0 };
> @@ -562,7 +623,7 @@ integer_unary:
>  	  integer_prim
>  	| '-' integer_unary
>  		{
> -			$$ =3D (struct integer){ -$2.ull };
> +			$$ =3D (struct integer){ -$2.ull, !$2.is_negative };
>  		}
>  	| '~' integer_unary
>  		{
> diff --git a/dtc.h b/dtc.h
> index ccfe689..a502bef 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -95,6 +95,7 @@ enum markertype {
>  	REF_PHANDLE,
>  	REF_PATH,
>  	LABEL,
> +	TYPE_SIGNED,
>  	TYPE_UINT8,
>  	TYPE_UINT16,
>  	TYPE_UINT32,
> @@ -119,6 +120,7 @@ struct data {
> =20
>  struct integer {
>  	uint64_t ull;
> +	bool is_negative;
>  };
> =20
>  #define empty_data ((struct data){ 0 /* all .members =3D 0 or NULL */ })
> diff --git a/tests/integer-expressions.c b/tests/integer-expressions.c
> index 6f33d81..041efb0 100644
> --- a/tests/integer-expressions.c
> +++ b/tests/integer-expressions.c
> @@ -28,15 +28,22 @@ static struct test_expr {
>  	TE(2*3),
>  	TE(4/2),
>  	TE(10/3),
> +	TE(-10/3),
>  	TE(19%4),
> +	TE(-19%4),
>  	TE(1 << 13),
>  	TE(0x1000 >> 4),
> +	TE(-0x1000 >> 4),
>  	TE(3*2+1), TE(3*(2+1)),
>  	TE(1+2*3), TE((1+2)*3),
>  	TE(1 < 2), TE(2 < 1), TE(1 < 1),
>  	TE(1 <=3D 2), TE(2 <=3D 1), TE(1 <=3D 1),
>  	TE(1 > 2), TE(2 > 1), TE(1 > 1),
>  	TE(1 >=3D 2), TE(2 >=3D 1), TE(1 >=3D 1),
> +	TE(-1 < 1), TE(1 < -1), TE(-1 < -1),
> +	TE(-1 <=3D 1), TE(1 <=3D -1), TE(-1 <=3D -1),
> +	TE(-1 > 1), TE(1 > -1), TE(-1 > -1),
> +	TE(-1 >=3D 1), TE(1 >=3D -1), TE(-1 >=3D -1),
>  	TE(1 =3D=3D 1), TE(1 =3D=3D 2),
>  	TE(1 !=3D 1), TE(1 !=3D 2),
>  	TE(0xabcdabcd & 0xffff0000),
> @@ -50,6 +57,7 @@ static struct test_expr {
>  	TE(0 ? 17 : 39), TE(1 ? 17 : 39), TE(17 ? 0xdeadbeef : 0xabcd1234),
>  	TE(11 * 257 * 1321517ULL),
>  	TE(123456790 - 4/2 + 17%4),
> +	TE(-123456790 - -4/-2 + -17%-4),
>  };
> =20
>  #define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ISKrrfpKsPiF35CV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8n5SkACgkQbDjKyiDZ
s5JC7g/8D8mLf2J9C85WcPJoclPSiAFtS7SEd1tgfhhaHmuRZv4ifvkigsWLSpwD
FxMbEcY4qzUbxKH16Ng9SHdbJW1nsmSJZr/wuBFiTUkT5yMjmH2cNKtIsk/pwFJz
vvx8Tez/SxrqqSoCqZYIKM+4F0HphagT004PwtSB9s6sOAhaHZLb50sWm71YJOMI
XmOPSVxSPa6BvP4yDAzUJYOwX+EkwxwKnunkc3d86lioyXfpg12RSeamnuTPg6f6
ggLGZEQnnRqckVY7QVpgnGH/5iCukFDDydLipIUc/ZPaBPZtQkW59uhlEIm2CzQL
usZMRnl04IWZ0SXrC3t5GrqQh1gzokQ7IuPIZS43Tk1TsPSMgcsNHymnUFQmE2ab
x8zSI2Tk3216E5A6vkDv8rV6EpdT4OyoncxdxIM5jJTFVLyY9FSdjT8NTjditxE2
2co4JfTesYxJKuenMrri7kcX+CPdkL5aTXVUJwilcgbYHEkUN6W6L0QYSsjPEfft
BEg+0lcDqFl9IKkGkXP/BaKlvmz43Gn+qHStkqxn8suePVbQuu8cVr6iGUJc1WU2
37rL1k72AjsnCzVaBYxRUJzw/mleSX0wp0F22snJAxDbQuqE5tKri5cSqhbTWhGf
ZYKFFOERQBj/2a20rmSuqck30sSBQJLuIgU7W3pUvsyWWTNsm0A=
=YzPi
-----END PGP SIGNATURE-----

--ISKrrfpKsPiF35CV--
