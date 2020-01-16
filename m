From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Remove redundant YYLOC global declaration
Date: Thu, 16 Jan 2020 11:33:09 +1000
Message-ID: <20200116013309.GD54439@umbus>
References: <20200114175341.2994-1-dmueller@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1579139300;
        bh=EKu3+SMNX7Trz1mSXpWAnlS7AnguKN5jlcymDMWllHs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fejeJx93Fq0ptF9coKOsT1GcVj1OHLw7y/bxPbtG1MBNaM5PdjyXGEbHLmuhc/qGC
         wTKnZFVRRLf8FU2IcWEMNvp/hJIoU4fdYzk+MvvhOsjcfCwlrNZbnzUBIuvPVPvxcm
         pV3G1Jb/CLwBxDymDXMN5SJ8y8m5SLYvKIbEnEdU=
Content-Disposition: inline
In-Reply-To: <20200114175341.2994-1-dmueller-IBi9RG/b67k@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Dirk Mueller <dmueller-IBi9RG/b67k@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 06:53:41PM +0100, Dirk Mueller wrote:
> gcc 10 will default to -fno-common, which causes this error at link
> time:
>=20
>   (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol f=
rom plugin):(.text+0x0): first defined here
>=20
> This is because both dtc-lexer as well as dtc-parser define the same
> global symbol yyloc. Before with -fcommon those were merged into one
> defintion. The proper solution would be to to mark this as "extern",
> however that leads to:
>=20
>   dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc' [-Werror=
=3Dredundant-decls]
>    26 | extern YYLTYPE yylloc;
>       |                ^~~~~~
> In file included from dtc-lexer.l:24:
> dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
>   127 | extern YYLTYPE yylloc;
>       |                ^~~~~~
> cc1: all warnings being treated as errors
>=20
> which means the declaration is completely redundant and can just be
> dropped.
>=20
> Signed-off-by: Dirk Mueller <dmueller-IBi9RG/b67k@public.gmane.org>

Applied, thanks.

> ---
>  dtc-lexer.l | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index 5c6c3fd..b3b7270 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -23,7 +23,6 @@ LINECOMMENT	"//".*\n
>  #include "srcpos.h"
>  #include "dtc-parser.tab.h"
> =20
> -YYLTYPE yylloc;
>  extern bool treesource_error;
> =20
>  /* CAUTION: this will stop working if we ever use yyless() or yyunput() =
*/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4fvVIACgkQbDjKyiDZ
s5JpbA/+KWH4DZscRgs9c7TDRiR+sFe3i/wWK3dG3lM6Io89kpOyOsW7Tr1twRkP
xAxRg4wpBGcOWN1bloNivhIJJ0zm6d4rOX4BdudZxSXdMPFfnXaMJQuMgzTLkbxm
64klFjXAxNZk9vaz0aJ64QVEHksshCTu4O6N4OUbn8c2dXr+03KF1RwgQNE0X6Bh
kVbM6PR1FkCZPTl/2MlWLk8DPK54XhWdCSW2TVDv+3m+9dSAtG/3UaVVyNowJIob
lvKDacpA2emXEf8LozV2DE9u2HhkSgAQy8NtiIeG4pdcLf3b3QYVPy+jq8Sliwzx
0y8wa9bcE4+Nr7ejf2uN1eskvFle3i/JjYfvgo7gCm2U9kOom/gv2xM0yfmUEsyl
g5nLmaQLLJ9PDdv22Hn1dH+zyb+A+xrV/yKVtoWpV2N56mxZloaTl1LKN8lu2zQz
lFy55Q1ReL8ZXvR5g+0Nth0kRYx2m0Hs8O3IMelKnimUkpY0oDTeCn1SDnJRFPxj
Yy1OMhGRNPAv8TRd8mMRZaHH8GEUo6nYae+R5/KgVV7KgR4/HW2tyGVLVnvu4yOQ
/CVPp+7Jc4xaUilAcbQ2SLfdtcVABN+Yv9ZksrapStufDhudVImG8Qn5v9+OrvDE
k0qi8DdxaSiUeE+6FwHm+Q8govhye+ZoCdZ+ooCeNTvvIFByEhw=
=99kX
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--
