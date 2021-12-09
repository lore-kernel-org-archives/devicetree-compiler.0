From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH V2] Support 'b' format for printing raw bytes with fdtget
Date: Thu, 9 Dec 2021 13:22:56 +1100
Message-ID: <YbFogDZI5x5MJktR@yekko>
References: <20211206154953.17089-1-zajec5@gmail.com>
 <20211208170055.13811-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7My4dlthIItZqT9b"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1639026654;
        bh=sVNYG49SYN+Ss+G/BbqFUxtMHxEIiIOhLqdcrHEbRQM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bh7UEzNTgvD8BquK3i0jMBq59eQ8oQXp3PPTEByBQ8Txkvxkqhtuir3TdubxJlkEi
         7iYOe91vWH2XI2/r8hxC1C7geYJDh7woExo14N22isH2qwJtBvABgiZJZF6VoHZ2fg
         IdLzvdMSOkQ7GxInZztg4ZnipeHJxjIYRAogY+NI=
Content-Disposition: inline
In-Reply-To: <20211208170055.13811-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>


--7My4dlthIItZqT9b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 06:00:55PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>=20
> FT is sometimes used for storing raw data. That is quite common for
> U-Boot FIT images.
>=20
> Extracting such data is not trivial currently. Using type 's' (string)
> will replace every 0x00 (NUL) with 0x20 (space). Using type 'x' will
> print bytes but in xxd incompatible format.
>=20
> This commit adds support for 'b' (binary) format. Example usage:
> fdtget -t b firmware.itb /images/foo data > image.raw
>=20
> Support for encoding isn't added as there isn't any clean way of passing
> binary data as command line argument.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> V2: Update usage info & add tests
>=20
> Alternatively I could use e.g. "r" (raw) instead of "b" (binary) if you
> find it more accurate. Please let me know.
> ---
>  Documentation/manual.txt |  2 +-
>  fdtget.c                 |  5 +++++
>  fdtput.c                 |  2 ++
>  tests/run_tests.sh       |  2 ++
>  tests/utilfdt_test.c     |  5 ++++-
>  util.c                   | 21 +++++++++++----------
>  util.h                   |  3 ++-
>  7 files changed, 27 insertions(+), 13 deletions(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 97e53b9..73e0593 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -712,7 +712,7 @@ The syntax of the fdtget command is:
> =20
>  where options are:
> =20
> -    <type>    s=3Dstring, i=3Dint, u=3Dunsigned, x=3Dhex
> +    <type>    s=3Dstring, i=3Dint, u=3Dunsigned, x=3Dhex, b=3Dbinary
>          Optional modifier prefix:
>              hh or b=3Dbyte, h=3D2 byte, l=3D4 byte (default)

I don't think using "b" as both a type specifier, and a length
modifier is a good idea.  You can probably disambiguate them in
parsing, but it's still likely to cause confusion.

How about "r" for "raw"?

> =20
> diff --git a/fdtget.c b/fdtget.c
> index 54fc6a0..6e4abf1 100644
> --- a/fdtget.c
> +++ b/fdtget.c
> @@ -97,6 +97,11 @@ static int show_data(struct display_info *disp, const =
char *data, int len)
>  	if (len =3D=3D 0)
>  		return 0;
> =20
> +	if (disp->type =3D=3D 'b') {
> +		fwrite(data, 1, len, stdout);
> +		return 0;
> +	}
> +
>  	is_string =3D (disp->type) =3D=3D 's' ||
>  		(!disp->type && util_is_printable_string(data, len));
>  	if (is_string) {
> diff --git a/fdtput.c b/fdtput.c
> index 428745a..99b0bf9 100644
> --- a/fdtput.c
> +++ b/fdtput.c
> @@ -433,6 +433,8 @@ int main(int argc, char *argv[])
>  			if (utilfdt_decode_type(optarg, &disp.type,
>  					&disp.size))
>  				usage("Invalid type string");
> +			if (disp.type =3D=3D 'b')
> +				usage("Unsupported binary data type");
>  			break;
> =20
>  		case 'v':
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index d100d5a..484be18 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -855,6 +855,8 @@ fdtget_tests () {
>      run_fdtget_test 8000 -tx $dtb /cpus/PowerPC,970@1 d-cache-size
>      run_fdtget_test "61 62 63 0" -tbx $dtb /randomnode tricky1
>      run_fdtget_test "a b c d de ea ad be ef" -tbx $dtb /randomnode blob
> +    run_fdtget_test "MyBoardName\0MyBoardFamilyName\0" -tb $dtb / compat=
ible
> +    run_fdtget_test "\x0a\x0b\x0c\x0d\xde\xea\xad\xbe\xef" -tb $dtb /ran=
domnode blob
> =20
>      # Here the property size is not a multiple of 4 bytes, so it should =
fail
>      run_wrap_error_test $DTGET -tlx $dtb /randomnode mixed
> diff --git a/tests/utilfdt_test.c b/tests/utilfdt_test.c
> index c621759..906f250 100644
> --- a/tests/utilfdt_test.c
> +++ b/tests/utilfdt_test.c
> @@ -73,6 +73,9 @@ static void check_sizes(char *modifier, int expected_si=
ze)
> =20
>  	*ptr =3D 's';
>  	check(fmt, 's', -1);
> +
> +	*ptr =3D 'b';
> +	check(fmt, 'b', -1);
>  }
> =20
>  static void test_utilfdt_decode_type(void)
> @@ -90,7 +93,7 @@ static void test_utilfdt_decode_type(void)
>  	/* try every other character */
>  	checkfail("");
>  	for (ch =3D ' '; ch < 127; ch++) {
> -		if (!strchr("iuxs", ch)) {
> +		if (!strchr("iuxsb", ch)) {
>  			*fmt =3D ch;
>  			fmt[1] =3D '\0';
>  			checkfail(fmt);
> diff --git a/util.c b/util.c
> index 40274fb..b9e88f1 100644
> --- a/util.c
> +++ b/util.c
> @@ -340,24 +340,25 @@ int utilfdt_decode_type(const char *fmt, int *type,=
 int *size)
> =20
>  	/* get the conversion qualifier */
>  	*size =3D -1;
> -	if (strchr("hlLb", *fmt)) {
> -		qualifier =3D *fmt++;
> -		if (qualifier =3D=3D *fmt) {
> -			switch (*fmt++) {
> -/* TODO:		case 'l': qualifier =3D 'L'; break;*/
> -			case 'h':
> +	for (; *(fmt + 1); fmt++) {
> +		if (!strchr("hlLb", *fmt))
> +			return -1;
> +		if (qualifier) {
> +			if (*fmt =3D=3D 'h' && qualifier =3D=3D 'h')
>  				qualifier =3D 'b';
> -				break;
> -			}
> +			else
> +				return -1;
> +		} else {
> +			qualifier =3D *fmt;
>  		}
>  	}
> =20
>  	/* we should now have a type */
> -	if ((*fmt =3D=3D '\0') || !strchr("iuxs", *fmt))
> +	if (!strchr("iuxsb", *fmt))
>  		return -1;
> =20
>  	/* convert qualifier (bhL) to byte size */
> -	if (*fmt !=3D 's')
> +	if (*fmt !=3D 's' && *fmt !=3D 'b')
>  		*size =3D qualifier =3D=3D 'b' ? 1 :
>  				qualifier =3D=3D 'h' ? 2 :
>  				qualifier =3D=3D 'l' ? 4 : -1;
> diff --git a/util.h b/util.h
> index c45b2c2..fa381fc 100644
> --- a/util.h
> +++ b/util.h
> @@ -143,6 +143,7 @@ int utilfdt_write_err(const char *filename, const voi=
d *blob);
>   *		i	signed integer
>   *		u	unsigned integer
>   *		x	hex
> + *		b	binary
>   *
>   * TODO: Implement ll modifier (8 bytes)
>   * TODO: Implement o type (octal)
> @@ -160,7 +161,7 @@ int utilfdt_decode_type(const char *fmt, int *type, i=
nt *size);
>   */
> =20
>  #define USAGE_TYPE_MSG \
> -	"<type>\ts=3Dstring, i=3Dint, u=3Dunsigned, x=3Dhex\n" \
> +	"<type>\ts=3Dstring, i=3Dint, u=3Dunsigned, x=3Dhex, b=3Dbinary\n" \
>  	"\tOptional modifier prefix:\n" \
>  	"\t\thh or b=3Dbyte, h=3D2 byte, l=3D4 byte (default)";
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7My4dlthIItZqT9b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGxaH4ACgkQbDjKyiDZ
s5KQFw/+NGHvSDCjAbcZlLUNJ9jwTBwrbmwMjlzuhWmHpAxI9LnrHXsEMlY3YkPV
hcMhtTTP/2Bd3OEQUrJwqRUA0MTaxy5hydleofibOiP70INUNIBiyAHWy+meqEC9
GePd/ZFMa0qZWZH/vViTfwNaC3eDZD23+iw9QdHdYYFwf+e8coYwU5wDrQxSkn+C
OG89gd/efRcLd0NHVt2iIigioD2rXmLNd46lp5Q6sG1FpAIXiAK8WqAvL5M3jW0c
V4H2baIJdA2jUvVe1znYnkDZGxgdmmzwCgNlds+VWDSa0joV5MUnvtwBeXBVlJ9B
zth/eNAxl02nQ1t4pA/F4K8sbcmLNLmwBlyCu+dX3J/CvRQY9w6V87p4T3wu9a/0
CanM7JryB1C+AkgNw+i+l+T+RR9RhbsXp1plmihoM4JnLU2hK4shsbXISP9Xcau1
wtAGN8CsWi3NDmwZJxkuLtyqPEHBRMAzO7cXTniNPDtb5bVO0dIu7Q/X3PAuf+Sm
crUUD2PHIV9g82oUgB4m4H4eAHgSYisFkg+CoHYCIyW16IcJpSv9VLkSf93jpqen
52QoBmwfWknYvoOTXfdUEiC4rW68fdt7FgY6Js0NdlF0AJiuRljdLJZ1eqfn8Vf5
6hr0J6dm8HHA08aJivcaBXwCv9OJ/5f8rn7i/88oigd/vPZzW9s=
=IyMK
-----END PGP SIGNATURE-----

--7My4dlthIItZqT9b--
