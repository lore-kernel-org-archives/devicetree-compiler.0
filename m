From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] write_propval_string: Use a list of strings instead
 of "\0" in a string
Date: Sat, 29 Apr 2023 16:29:50 +1000
Message-ID: <ZEy5Xnh/DM/wzUWa@yekko>
References: <20230428113217.744447-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m8VQgvKGTy/ldZ+c"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1682751134;
        bh=FItAZknTn96rAa9w3VtAUMUP12dVM+3Lp7qI/IYCfX4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YHqUrNm/lEHn4lPqhcT0QdUd9jmIjP3YQE4xYtWcjKxvIlHcS64IHbjNSeOwImSBG
         c6l/9gk5yOQAiWPkdzGhL7B1RIddn1eRIrojHTEJq77lgP+URoyTSq7KTk72C5WQIJ
         4F2Q6zsLywxBWXw0JxNyI78PQMPKESoSr2VdXTj8=
Content-Disposition: inline
In-Reply-To: <20230428113217.744447-1-uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>


--m8VQgvKGTy/ldZ+c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 01:32:17PM +0200, Uwe Kleine-K=F6nig wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>=20
> A string that contains '\0' can be written as a list of strings e.g.
>=20
> 	clock-names =3D "di0_pll\0di1_pll\0di0_sel\0di1_sel\0di2_sel\0di3_sel\0d=
i0\0di1";
>=20
> is equivalent to
>=20
> 	clock-names =3D "di0_pll", "di1_pll", "di0_sel", "di1_sel", "di2_sel", "=
di3_sel", "di0", "di1";
>=20
> The latter is easier to read, to use this format instead.
>=20
> Two test files are adapted accordingly to keep the test suite happy.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> Changes since (implicit) v1, sent with Message-Id:
> 20230426182405.572729-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org:
>=20
>  - Adapt the test suite
>=20
>  tests/type-preservation.dt.yaml | 2 +-
>  tests/type-preservation.dts     | 2 +-
>  treesource.c                    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/type-preservation.dt.yaml b/tests/type-preservation.dt=
=2Eyaml
> index a0cc64cc4b69..e238d395aa02 100644
> --- a/tests/type-preservation.dt.yaml
> +++ b/tests/type-preservation.dt.yaml
> @@ -12,7 +12,7 @@
>      int16-matrix: [!u16 [0x1234, 0x5678], [0x90ab, 0xcdef]]
>      int64: [!u64 [0x200000000]]
>      int64-array: [!u64 [0x100000000, 0x0]]
> -    a-string-with-nulls: ["foo\0bar", "baz"]
> +    a-string-array: ["foo", "bar", "baz"]


Ah.  I was afraid of this.  So "fixing" the test highlights another
problem.  It's pretty clear to me that the whole point of this test is
to test the preservation of the internal \0, as distinct from the
separate strings later in there.  So, this is exercising an edge case
of the typing markers we now add.

Now.. personally, I've never been particularly convinced that the type
preservation stuff was a particularly good idea.  It will never be
perfect, and it can give a misleading impression that information is
preserved into the dtb which isn't.  But, it's pretty well established
now, and I assume people had reasons for wanting it.

So, your patch makes things nicer when going from dtb -> dts, but
breaks an established feature when going dts -> dts, or dts -> yaml.
So, I think we need to rethink.

Rather than changing how "strings" are emitted, I think you want to
change how we guess typing information when coming from dtb: instead
of just putting a single string marker on the property, we should put
one after every \0 and we should get the output you're after.

>      a-phandle: [[!phandle 0x1]]
>      a-phandle-with-args: [[!phandle 0x1, 0x0, 0x1], [!phandle 0x1, 0x2, =
0x3]]
>      subsubnode:
> diff --git a/tests/type-preservation.dts b/tests/type-preservation.dts
> index 921ea21172d1..443424dc28ec 100644
> --- a/tests/type-preservation.dts
> +++ b/tests/type-preservation.dts
> @@ -15,7 +15,7 @@
>  		int16-matrix =3D /bits/ 16 <0x1234 0x5678>, <0x90ab 0xcdef>;
>  		int64 =3D /bits/ 64 <0x200000000>;
>  		int64-array =3D /bits/ 64 <0x100000000 0x00> int64_array_label_end:;
> -		a-string-with-nulls =3D "foo\0bar", "baz";
> +		a-string-array =3D "foo", "bar", "baz";
>  		a-phandle =3D <&subsub1>;
>  		a-phandle-with-args =3D <&subsub1 0x00 0x01>, <&subsub1 0x02 0x03>;
> =20
> diff --git a/treesource.c b/treesource.c
> index 33fedee82d58..de30188189fb 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -87,7 +87,7 @@ static void write_propval_string(FILE *f, const char *s=
, size_t len)
>  			fprintf(f, "\\\"");
>  			break;
>  		case '\0':
> -			fprintf(f, "\\0");
> +			fprintf(f, "\", \"");
>  			break;
>  		default:
>  			if (isprint((unsigned char)c))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--m8VQgvKGTy/ldZ+c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRMuUoACgkQzQJF27ox
2GdXHA//aOcWbTzt3jDFHjEx1iBqVHr43Z/6NtV7PR5CvJXutzBvVPR2bet6l3oy
ok6SuJUiC84RmNRW7Smy5juvmsNnznK9DqQx9UxoTClgo367wjfpEj+pitGw+nkn
ZQh4U1LJYL2o26K/ld1StZXPtUKXkTzNAzTf/wmwyi8UKxUPDJpfalugoTvbmkhZ
Lx2Dp0zDCg69NvjHHjs3TXUh/Vcfbj/rOKvpAJCTFfFieCItSPZcsTqupE0YjPVf
qETmM647GWtg4csK4YmIZTZHFZi3qfKN7FPrcbZJtw1PlN90IY+Beo5+9wnjt1O8
ZFeHHJholCFG3E4myAGq6TNPDWg3GcOJ9ThZv4z8EE+27gS+wqQhcUsGW3K6mQEm
9YkcJ+KWce6kpqATQRnHmeLNl5/HR1ik68XbiRGYfZ2xovQImVeXM/5hgP/hBhUM
2Wm1fFlmHjQEwZFfq1gTD1Seb0oy9nYIu+xPKixIMnogvU6M5vnr30jT1taTIGNR
gvqOob2JdsJl94iwfNdq2/fqDDOYC+bqOCLwRTJeHuONOZzyeschxIG6CfOpXB95
ha1UnyCa8bzxreWqbBr/zoTdIfQjJNpR00hkOb7W/rdrebvxi6/BU5NxgJe9sNZp
Ida0EqNUgJwz5gc9xG/BvObD5DJ2LQpeuDnXPI3U2DXpbEKGRko=
=joSh
-----END PGP SIGNATURE-----

--m8VQgvKGTy/ldZ+c--
