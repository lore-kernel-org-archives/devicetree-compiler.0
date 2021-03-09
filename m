From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdt_rw.c: Fix Unchecked return value error
Date: Tue, 9 Mar 2021 14:52:14 +1100
Message-ID: <YEbw7ppxR9rwFA2o@yekko.fritz.box>
References: <1614715099-23657-1-git-send-email-ryan.long@oarcorp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VgZH5MTh119Yal2M"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1615264110;
        bh=ceWta52wUj168M5uhc8fZetwVWyixU3oVXd0ecsr6sk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e9Q4IgmtoTZWQ69k6vmICU5Khn3wLO6RNnBrt1GaZAv2JSLHAEhNUxEQpQSqFYdth
         c+xzjGy+y4cRgS55Luq1Uo5byPCfSd0HLOYS2QTQ7qlAo4NZslTmUWopbk05ZUxnTn
         jXJcG9hn+Y0jueGqxk5/hBWDrqVxDnwr83grG1uE=
Content-Disposition: inline
In-Reply-To: <1614715099-23657-1-git-send-email-ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ryan Long <thisisryanlong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ryan Long <ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>


--VgZH5MTh119Yal2M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 02:58:19PM -0500, Ryan Long wrote:
> Fixed "Unchecked return value" error, by adding "(void)" in front of the
> function call.
>=20
> When Coverity Scan was ran on some of your code, a "Unchecked return valu=
e"
> error was found at line 352 in fdt_rw.c. For similar errors that we recei=
ved
> for RTEMS, we created a macro that will assert the value returned and "us=
e" the
> return value with (void).
>=20
> Signed-off-by: Ryan Long <ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>

It's weird that the Coverity Scan on dtc upstream didn't pick this
up.  I thought maybe it did at some point and I just marked it as a
false positive, but I looked through and I couldn't seem to find it at
all (though the Coverity UI is pretty confusing, so maybe I just
missed it).

I've taken a slightly different approach to squashing this upstream,
so I haven't applied this as is.

> ---
>  cpukit/dtc/libfdt/fdt_rw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/cpukit/dtc/libfdt/fdt_rw.c b/cpukit/dtc/libfdt/fdt_rw.c
> index 1385425..cdae5dd 100644
> --- a/cpukit/dtc/libfdt/fdt_rw.c
> +++ b/cpukit/dtc/libfdt/fdt_rw.c
> @@ -348,7 +348,7 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffs=
et,
>  		return offset;
> =20
>  	/* Try to place the new node after the parent's properties */
> -	fdt_next_tag(fdt, parentoffset, &nextoffset); /* skip the BEGIN_NODE */
> +	(void) fdt_next_tag(fdt, parentoffset, &nextoffset); /* skip the BEGIN_=
NODE */
>  	do {
>  		offset =3D nextoffset;
>  		tag =3D fdt_next_tag(fdt, offset, &nextoffset);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VgZH5MTh119Yal2M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBG8OwACgkQbDjKyiDZ
s5JvKQ//f+RN7951lG3tTwTzUDbT63wR0LUNFv8oxIUYzJohNwKrDiW5c+KlScvX
jo9fMTUIHUhmL6oTF7ENE8B+Om4XipXVYptjS1AlOVJtANo+CqNIcgXSPO5Vk/2U
xePDfqAbJUkBRdsWLaa+XNyoblIog0lvEsccUH0fea5RnpNfdqqWYLPIyIovDAWV
LLKPodURhuqrbqmwz/Yif7a+a8d6nnqVAvGO2ngX4dQNit3fxo82m1d8Dhi7k6DN
UMYCiYacO3BGVzun80w9++3hrTIwWVSSkpWwCBeMbGbmsEx3LYTn2othdq+ABQL0
+z2MWzH7Kxih/i3hWCKSKZni+RO6VlsZJae/WbdFM0RMlT6kD3k/Lc10wqir27UJ
/OL8970HbbJ3auwFbU+V7jCY7m4qelgFxciWHnsO+0XmpKUgCXpPazUQa5TaNiYf
wNojHo+huJiT2FQw6fiPTH3/vDO7zQXFM0UdXAXZ5dvnOyHK2j+tUV4kL/mbkYQ8
DYlYTV/riM0+KxjteHjr42nNVCPkNATpULwcNBWLTj5i/5zxvc12q2CUFzdpRpgg
jPIIrAZEwOh8CLPVCoEdCPxxvzMXMzHbXVqEucxykRRfN7N/tTtYjKfJy3kl057n
HuIACnjfVH6yDCP9qTzrcM7RITJ1zO2fKUJjuXsG8KIkSzoBgig=
=U+9K
-----END PGP SIGNATURE-----

--VgZH5MTh119Yal2M--
