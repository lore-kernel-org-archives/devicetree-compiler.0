From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH V4] Support 'r' format for printing raw bytes with fdtget
Date: Thu, 9 Dec 2021 17:52:48 +1100
Message-ID: <YbGnwFEo3icv7Rxl@yekko>
References: <20211209053041.17984-1-zajec5@gmail.com>
 <20211209061420.29466-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iBJAZ9B/OJz8PS9k"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1639032844;
        bh=/jnq08RWTnac+JjxeLZ5GSnVK/l8eFiykSmItwTK4p0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iVUi8s/IJv3UzmxHjlihlcALHT4ZB4JzcojdHG39ft7RGjvHnpzxVF65OD3rNeFmv
         CP4J+f2nyzB1MTFaC8bWHcSjsnrvH3dZgDXwvFPB+GmuG9IT1ZptlyLWGMh5R+ISFB
         c0KSvr1XhC8xz89F4jMucNXt8ace12W5sQ83TwEk=
Content-Disposition: inline
In-Reply-To: <20211209061420.29466-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>


--iBJAZ9B/OJz8PS9k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 07:14:20AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>=20
> FT is sometimes used for storing raw data. That is quite common for
> U-Boot FIT images.
>=20
> Extracting such data is not trivial currently. Using type 's' (string)
> will replace every 0x00 (NUL) with 0x20 (space). Using type 'x' will
> print bytes but in xxd incompatible format.
>=20
> This commit adds support for 'r' (raw) format. Example usage:
> fdtget -t r firmware.itb /images/foo data > image.raw
>=20
> Support for encoding isn't added as there isn't any clean way of passing
> binary data as command line argument.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Applied, thanks.

> ---
> V2: Update usage info & add tests
> V3: Use "r" instead of "b" to avoid confusiong with qualifier
> V4: Don't rework utilfdt_decode_type() code handling qualifiers
> ---
>  Documentation/manual.txt | 2 +-
>  fdtget.c                 | 5 +++++
>  fdtput.c                 | 2 ++
>  tests/run_tests.sh       | 2 ++
>  tests/utilfdt_test.c     | 5 ++++-
>  util.c                   | 4 ++--
>  util.h                   | 3 ++-
>  7 files changed, 18 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 97e53b9..cf4b253 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -712,7 +712,7 @@ The syntax of the fdtget command is:
> =20
>  where options are:
> =20
> -    <type>    s=3Dstring, i=3Dint, u=3Dunsigned, x=3Dhex
> +    <type>    s=3Dstring, i=3Dint, u=3Dunsigned, x=3Dhex, r=3Draw
>          Optional modifier prefix:
>              hh or b=3Dbyte, h=3D2 byte, l=3D4 byte (default)
> =20
> diff --git a/fdtget.c b/fdtget.c
> index 54fc6a0..dd70985 100644
> --- a/fdtget.c
> +++ b/fdtget.c
> @@ -97,6 +97,11 @@ static int show_data(struct display_info *disp, const =
char *data, int len)
>  	if (len =3D=3D 0)
>  		return 0;
> =20
> +	if (disp->type =3D=3D 'r') {
> +		fwrite(data, 1, len, stdout);
> +		return 0;
> +	}
> +
>  	is_string =3D (disp->type) =3D=3D 's' ||
>  		(!disp->type && util_is_printable_string(data, len));
>  	if (is_string) {
> diff --git a/fdtput.c b/fdtput.c
> index 428745a..c2fecf4 100644
> --- a/fdtput.c
> +++ b/fdtput.c
> @@ -433,6 +433,8 @@ int main(int argc, char *argv[])
>  			if (utilfdt_decode_type(optarg, &disp.type,
>  					&disp.size))
>  				usage("Invalid type string");
> +			if (disp.type =3D=3D 'r')
> +				usage("Unsupported raw data type");
>  			break;
> =20
>  		case 'v':
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index d100d5a..11068e1 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -855,6 +855,8 @@ fdtget_tests () {
>      run_fdtget_test 8000 -tx $dtb /cpus/PowerPC,970@1 d-cache-size
>      run_fdtget_test "61 62 63 0" -tbx $dtb /randomnode tricky1
>      run_fdtget_test "a b c d de ea ad be ef" -tbx $dtb /randomnode blob
> +    run_fdtget_test "MyBoardName\0MyBoardFamilyName\0" -tr $dtb / compat=
ible
> +    run_fdtget_test "\x0a\x0b\x0c\x0d\xde\xea\xad\xbe\xef" -tr $dtb /ran=
domnode blob
> =20
>      # Here the property size is not a multiple of 4 bytes, so it should =
fail
>      run_wrap_error_test $DTGET -tlx $dtb /randomnode mixed
> diff --git a/tests/utilfdt_test.c b/tests/utilfdt_test.c
> index c621759..ba6462f 100644
> --- a/tests/utilfdt_test.c
> +++ b/tests/utilfdt_test.c
> @@ -73,6 +73,9 @@ static void check_sizes(char *modifier, int expected_si=
ze)
> =20
>  	*ptr =3D 's';
>  	check(fmt, 's', -1);
> +
> +	*ptr =3D 'r';
> +	check(fmt, 'r', -1);
>  }
> =20
>  static void test_utilfdt_decode_type(void)
> @@ -90,7 +93,7 @@ static void test_utilfdt_decode_type(void)
>  	/* try every other character */
>  	checkfail("");
>  	for (ch =3D ' '; ch < 127; ch++) {
> -		if (!strchr("iuxs", ch)) {
> +		if (!strchr("iuxsr", ch)) {
>  			*fmt =3D ch;
>  			fmt[1] =3D '\0';
>  			checkfail(fmt);
> diff --git a/util.c b/util.c
> index 40274fb..14d3868 100644
> --- a/util.c
> +++ b/util.c
> @@ -353,11 +353,11 @@ int utilfdt_decode_type(const char *fmt, int *type,=
 int *size)
>  	}
> =20
>  	/* we should now have a type */
> -	if ((*fmt =3D=3D '\0') || !strchr("iuxs", *fmt))
> +	if ((*fmt =3D=3D '\0') || !strchr("iuxsr", *fmt))
>  		return -1;
> =20
>  	/* convert qualifier (bhL) to byte size */
> -	if (*fmt !=3D 's')
> +	if (*fmt !=3D 's' && *fmt !=3D 'r')
>  		*size =3D qualifier =3D=3D 'b' ? 1 :
>  				qualifier =3D=3D 'h' ? 2 :
>  				qualifier =3D=3D 'l' ? 4 : -1;
> diff --git a/util.h b/util.h
> index c45b2c2..7a4e910 100644
> --- a/util.h
> +++ b/util.h
> @@ -143,6 +143,7 @@ int utilfdt_write_err(const char *filename, const voi=
d *blob);
>   *		i	signed integer
>   *		u	unsigned integer
>   *		x	hex
> + *		r	raw
>   *
>   * TODO: Implement ll modifier (8 bytes)
>   * TODO: Implement o type (octal)
> @@ -160,7 +161,7 @@ int utilfdt_decode_type(const char *fmt, int *type, i=
nt *size);
>   */
> =20
>  #define USAGE_TYPE_MSG \
> -	"<type>\ts=3Dstring, i=3Dint, u=3Dunsigned, x=3Dhex\n" \
> +	"<type>\ts=3Dstring, i=3Dint, u=3Dunsigned, x=3Dhex, r=3Draw\n" \
>  	"\tOptional modifier prefix:\n" \
>  	"\t\thh or b=3Dbyte, h=3D2 byte, l=3D4 byte (default)";
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iBJAZ9B/OJz8PS9k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGxp74ACgkQbDjKyiDZ
s5J6uxAAthDXnDRwZGEOxUaYir2eWMUp+8Nzlq3tQQU+B61Tv6WHhyf48M58aRzN
3YXQXm0HGW61IU5LHosWO/63UBmIAm/aiticeYRWongDjvdqP29MWHzuKzu/ief9
x4jPAp13dsUgC2EaU8LFwAxMqtorQSI/9NJd/8qXtto0Ic7gIT9DrmQ8wAoB2e1U
FCTgwamZ+1J8eXQqEdsmt+dE3eveYgHDfUPAs12vThMr8FB8dnCwVP5KDRVkeFjv
ePdgK9lr/EEkUioYXj8qlCZ0+WmrR55bsBnGz6wHa/t2vK94QIcBp5XaZ9ENCYck
kxdJ+GiXJR6IjgO46DwTlImiDUCNfzzCQZhPZqmIm1qtVg444XNRDe9AfTSU2smB
W4FaTtOKh+4gbl1yzGcNNfmlbKZS5TNC45MRl37K54j3xzypRSMQJTianRqXjFow
f+djQlqIC++FtBZL1D3vu/RpNVcSnZ5Wsj04yigsNktMEaa9M8ClZTa9Em3MbtXn
Fn1nffZeF1hW6wWWCH8JalFVKItGXMEy90idNgNYWnTux0a1nr/PfLNZV4n48GhN
VQoZdulPe6FGdsjvm1aPCAEhVOsIA1i2tSyNw7CMtbZyg0445FjjzovEnvdkoZB+
v/USdiGvDqT/q/rU1OCxiOpGXjJsuDxruAY32FZgBK5rNW6szuQ=
=mbxl
-----END PGP SIGNATURE-----

--iBJAZ9B/OJz8PS9k--
