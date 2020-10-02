From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 6/6] libfdt: fdt_strerror(): Fix comparison warning
Date: Fri, 2 Oct 2020 10:34:27 +1000
Message-ID: <20201002003427.GG1844@yekko.fritz.box>
References: <20201001164630.4980-1-andre.przywara@arm.com>
 <20201001164630.4980-7-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Cp3Cp8fzgozWLBWL"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601602063;
        bh=Jb/D9Qu2gKmZY2S46rcTCHTNH9wwxyK5NNFE67DzjBc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RX7+LvjH0mfdqdYiLnCdVETrOOURkW0DVRF6Dqny/iZyFP2CcLpt7Ib1unKogKUI7
         V0HF3Xr4KGA+RkNdwdVXaEl+UozLIxE5MSH1wRWJbC09jc1wkp56srQTDXSsJlHORl
         hukwCDl89qi89hMANOiYMcQjGBdOKTOKhoS5/fNk=
Content-Disposition: inline
In-Reply-To: <20201001164630.4980-7-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--Cp3Cp8fzgozWLBWL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 05:46:30PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in fdt_strerror().
>=20
> Force FDT_ERRTABSIZE to be signed (it's surely small enough to fit), so
> that the types match. Also move the minus sign to errval, as this is
> actually what we use in the next line.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_strerror.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
> index 768db66..b435693 100644
> --- a/libfdt/fdt_strerror.c
> +++ b/libfdt/fdt_strerror.c
> @@ -40,7 +40,7 @@ static struct fdt_errtabent fdt_errtable[] =3D {
>  	FDT_ERRTABENT(FDT_ERR_NOPHANDLES),
>  	FDT_ERRTABENT(FDT_ERR_BADFLAGS),
>  };
> -#define FDT_ERRTABSIZE	(sizeof(fdt_errtable) / sizeof(fdt_errtable[0]))
> +#define FDT_ERRTABSIZE	((int)(sizeof(fdt_errtable) / sizeof(fdt_errtable=
[0])))
> =20
>  const char *fdt_strerror(int errval)
>  {
> @@ -48,7 +48,7 @@ const char *fdt_strerror(int errval)
>  		return "<valid offset/length>";
>  	else if (errval =3D=3D 0)
>  		return "<no error>";
> -	else if (errval > -FDT_ERRTABSIZE) {
> +	else if (-errval < FDT_ERRTABSIZE) {
>  		const char *s =3D fdt_errtable[-errval].str;
> =20
>  		if (s)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Cp3Cp8fzgozWLBWL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92dZIACgkQbDjKyiDZ
s5I+8A/+KLrbb8H8xWcgMbX1SYCMrjvYLhfQAjWO4lfJU9D2bt8Nwt3Yki8KX7Ro
bMG1J2KZQxvIU9TLB8NzjpeXshaoeSqRQbDyggU4oreUM7aU3cK6SfRR+W4XEDn6
A3YOKcYOku/TvFrxrbqttI0YAccAbGz6yenJz7TN86+iftTutEBhdqSPHlqAO3iK
C9GMKjFxeA+sPgC+9D6CklDgqCZU5wYl2WdyGMQjPcpekCh9/WWAhMtz+wu2oeRo
24jWZRRPb6aILSgVYI5K9oRXjl/7EbOAwHfDray5UrIlhQUoigegk5dG5eRoQMKg
O7JQEPHmqI8+OsrkUzOE3gRvPc2EAFo6fqDVqARAveNtxXX8ijGYTAFfRmmTbSH5
XnYAgNStuCCHy1GUQymEjeYFTVM9emXhplPvi0hcnpiR1s9jqhFVAWGQGVy6X6dE
kgK4jERweiwjbwjOwwtXjJB7mUQIsKNlKSVggDr3iGk54ITNV35Ti3orMGdSE3yN
a9lSbvb3j2Gn1soKKDFE7Uz9JH5BOhZh3SsNoYz57l0WoSa88Of5pLrwzh0rPsEo
6U6pwl4tiGrQwxrK0bvIt9YsPcgTBUM2KCd4r6sVm2oq6hCtd1JKfJbcQ+kKChYL
NZtAvFla+RbcJDFqVe+WeWBt5ZWmhzJ/PHGag8RnTKthoJssWiY=
=f3/q
-----END PGP SIGNATURE-----

--Cp3Cp8fzgozWLBWL--
