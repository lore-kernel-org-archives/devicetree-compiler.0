From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] libfdt: fix fdt_stringlist_count()
Date: Mon, 17 Oct 2016 20:58:13 +1100
Message-ID: <20161017095813.GV25390@umbus.fritz.box>
References: <1476684504-3626-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xbjSOCWVZ1q9zj4g"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1476744000;
        bh=BXNuOajr9htR6POrG+ZT8wlMXT1L8s86USZSS46cZPU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U0wQhHiw9iK8sQ5E20yyaQeyjrMUlMqizZNJJifHGUHofAxSRVpgIMCFHo7ekpM6C
         Nnz4j1z6nm0TXGOeqOel5p3DzRH5S0Dt9C1KFLiIzCXM/4yiHNLpF5gHOKkuL6Peuq
         V2XqswOSdvkK0UZ1PqZRh/Dv3sFy/PcLlV86E5+Q=
Content-Disposition: inline
In-Reply-To: <1476684504-3626-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--xbjSOCWVZ1q9zj4g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2016 at 03:08:23PM +0900, Masahiro Yamada wrote:
> If fdt_getprop() fails, negative error code should be returned.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

Nice catch.  Both fixes applied to master.

> ---
>=20
>  libfdt/fdt_ro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 0459098..db8d10f 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -571,7 +571,7 @@ int fdt_stringlist_count(const void *fdt, int nodeoff=
set, const char *property)
> =20
>  	list =3D fdt_getprop(fdt, nodeoffset, property, &length);
>  	if (!list)
> -		return -length;
> +		return length;
> =20
>  	end =3D list + length;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xbjSOCWVZ1q9zj4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYBKCzAAoJEGw4ysog2bOStNwQAJkNsVw5aqpLVJtAPXkcozUS
wOWE18+i3KrUeT8uBeuyPAKnwbtZ6RSTp/RfsQ4qjPG/YiCkin3SIB5mjfn5+7WA
iPnC+/0rXLpcEfRaqm3Ws0jEYIewWub29zurk5g/NdErONKhAstUQ8aXxZqgmEvV
YvAEWRIgJHHwiFYtoksdlVCDj0CrI15scBeTCjf0N+RJJr+xxtScZWmA2l3msutf
8JwUgOXJm8F5dbVsim5hWrDN+qGBUDpPtxFedRJkiUb1A1NBbowYQtDNAnkEGsS2
pXWagTIOJbRT8PPtAOuXZJR+Thc73eS18xTSsn/kc3d4RCGr30gFhZ55NuurTX6y
r9mLnOinEc4uwQmQMwCNzLrNphfzzMtDPFEpVrzd6zM6wg4AmeaKe7ubXt6F6mRr
mDV4rBFLboCK7ykxuUGe0kNqoImoxS8Mz7A7jy+tlogHvmktjZxdREf9L+M15RLa
pEvOO2d3ETaGgXuKu4owGL01m9kVxEZJ/DZv4jmyyzXrV0SC67M+lShOge3qrtSb
hICW9PrE++zBOJijjHQtpsTneNMPcOaUaCv48c4YY2QADqn6DDq0vJ8sjoku2ABS
xYXmYz4Z/z1ijR7kuRFyF4aWxDf1JZpBHKuuapHR+SRxF+InBV0HjoMRfRx0TLhl
v5T1DgQUn7QimnIfE6MQ
=po5U
-----END PGP SIGNATURE-----

--xbjSOCWVZ1q9zj4g--
