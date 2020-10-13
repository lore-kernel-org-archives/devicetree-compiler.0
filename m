From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 09/11] dtc: Fix signedness comparisons warnings: pointer
 diff
Date: Tue, 13 Oct 2020 16:01:24 +1100
Message-ID: <20201013050124.GS71119@yekko.fritz.box>
References: <20201012161948.23994-1-andre.przywara@arm.com>
 <20201012161948.23994-10-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o/5eNASeIIpuMggS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602565786;
        bh=4xeOA6iAgvHXJfapqMR4sT6NKK+3E+PTMqIUbVjbFRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iYeqx16noUeE5wSUnwsKpPVoyA+DHPzcHRg9JGcevqaXD2b/XsFE+iaONxWTTe8Ql
         w7W483ZN3mxmOBKxPYfCW7A9B/Q6y1mzI8vx/tlxI7ncVXMHsIkXy8IRnIS06savaM
         TsI+cbKSKAFILhudPSQbdCUKWmJGxXzJOzyBGlus=
Content-Disposition: inline
In-Reply-To: <20201012161948.23994-10-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--o/5eNASeIIpuMggS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 05:19:46PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in comparisons in the function get_node_by_path().
>=20
> Taking the difference between two pointers results in a signed ptrdiff_t
> type, which mismatches the unsigned type returned by strlen().
> Since "p" has been returned by a call to strchr() with "path" as its
> argument, we know for sure that it's bigger than "path", so the
> difference must be positive. So a cast to an unsigned type is valid.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Again, (size_t) would be more strictly correct, I think.

> ---
>  livetree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/livetree.c b/livetree.c
> index 8393637..b8d0745 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -526,7 +526,7 @@ struct node *get_node_by_path(struct node *tree, cons=
t char *path)
>  	p =3D strchr(path, '/');
> =20
>  	for_each_child(tree, child) {
> -		if (p && strprefixeq(path, p - path, child->name))
> +		if (p && strprefixeq(path, (unsigned)(p - path), child->name))
>  			return get_node_by_path(child, p+1);
>  		else if (!p && streq(path, child->name))
>  			return child;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--o/5eNASeIIpuMggS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+FNKQACgkQbDjKyiDZ
s5JS6xAAjgYWhwCqvR7IT3eFtFDv0L8E3N4rymCY8q+MilLpz1qtMS3GEy240woz
tVb8M2Eps/4oYl2+yRXBke6/kPHSOqMF/ZEnX+mvz14PTdMt+9V44qPXnaTPOi2U
VTvMP3XI7I03y7pf3VvnZffkDu0I7VP4YOyPDweVP+/inyp8Q4cUox52DTnMmxmg
nl8QVFKOCHnEzT/yNxB2kEHInoWV0gjyJR3N0lVT3CuERHpdJMlPzskSGuRHXQmF
rVH/TT/i+K6KdWHWrBXRUrA/9igWP+2yjkWLde6R6xo8b8its26FCZaypRRse2Aj
kfPfmUkxESgel5P7pzQsdeEABR646VH/iWS/pXwbB1PlMjdwILH9pMUcvW0KN++V
Itxh/n9Z+4NHKTtEigZ4hktF2AVUUh/IckMas7qCnhky+3j+TV713kcbPYU3PFUO
ZkZD2MfNvUr+kQiLabWHxJeXWeIviUpHmL3cUcW7nSarldYqjaFAdTtOvjnpbgyG
UDCMJ9t4HDBzv9mcH5e6J5z4G5SbBRl+WSnHSVT5bRwuhO4tXJ/52BBeOHfXEMXb
W1QZpAekbHDBplN8H9qbrewynxYwTbVm0zgeoSTRxb15H+NjRTIRMt9SOGnTPtqH
3/E3qrU/6rhn7HAoqDXe0dfRhWsmuzmXYuHuu0itBBHjOJoMMxY=
=GcDS
-----END PGP SIGNATURE-----

--o/5eNASeIIpuMggS--
