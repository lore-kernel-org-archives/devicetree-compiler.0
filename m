From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Fix fdt_appendprop_addrrange documentation
Date: Mon, 4 Sep 2023 15:31:01 +1000
Message-ID: <ZPVrlffenIPXDxJb@zatzit>
References: <20230831123918.rf54emwkzgtcb7aw@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5mdBduTc3aSRfVVg"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1693805519;
        bh=z8FA5S0Wq5P7F7WRaxVYDtZoVNMNISPLnHczefAC5PU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=acadO9ES8OhWnA9RKPcsYrJS1tgz/hpIV4kOr+3camJNvdfawnfpelpeTXaR4LEei
         MCGdnx35mlKXJvajSK59lIYj1FP1z+y7KbRu07pBFIzcsX+MCgjt0FIehzRtGaENRn
         fkE06/Xbk9xksYhrk7ugC+qeaJ58KpSrDUEGuo0Y=
Content-Disposition: inline
In-Reply-To: <20230831123918.rf54emwkzgtcb7aw-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mostafa Saleh <smostafa-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>


--5mdBduTc3aSRfVVg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 01:39:18PM +0100, Pierre-Cl=E9ment Tosi wrote:
> According to the documentation, the function should default to the very
> common property name <reg> when none is "specified". However, neither
> passing NULL (ends up calling strlen(NULL) and segfaults) nor ""
> (appends a property with an empty name) implements this behavior.
>=20
> Furthermore, the test case supposed to cover this default value actually
> passes the value to the function, somewhat defeating its own purpose:
>=20
>     /* 2. default property name */
>=20
>     // ...
>=20
>     err =3D fdt_appendprop_addrrange(fdt, 0, offset, "reg", addr, size);
>     if (err)
>             FAIL("Failed to set \"reg\": %s", fdt_strerror(err));
>     check_getprop_addrrange(fdt, 0, offset, "reg", 1);
>=20
> Finally, nothing in the implementation of the function seems to attempt
> to cover that use-case.
>=20
> As the feature can't ever have been used by clients and as the resulting
> reduced readability of the caller seems (IMO) to outweigh any potential
> benefit this API would bring, remove the erroneous documentation instead
> of trying to fix the function.
>=20
> Reported-by: Mostafa Saleh <smostafa-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Nice catch, and an excellent commit message.

I don't recall this specifically, but my guess would be that an
original draft included that behaviour, but I nixed it during review,
but then both the submitted and I forgot to update the documentation
comments as well.

Merged.

> ---
>  libfdt/libfdt.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 2a4f32c..0677fea 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -2029,7 +2029,7 @@ static inline int fdt_appendprop_cell(void *fdt, in=
t nodeoffset,
>   * address and size) to the value of the named property in the given
>   * node, or creates a new property with that value if it does not
>   * already exist.
> - * If "name" is not specified, a default "reg" is used.
> + *
>   * Cell sizes are determined by parent's #address-cells and #size-cells.
>   *
>   * This function may insert data into the blob, and will therefore

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5mdBduTc3aSRfVVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmT1a4AACgkQzQJF27ox
2GeaeQ//XIkZchdEDjc1mH5ebN94se1TV6j5GTbIwoz6974rB4elWJUat3ucheKp
T460USaS3Xb+eQtSuAUwtySFnPy6luJ0vlpRpTTOiafqNU7cUWxHAVW2+U8QGq2g
GVIKXGxLZzktX7OSw5keVdEepAOiSg2rKNHS5Ah9g2tvZe1jgYqf9qst5yN82GpL
CccJvmf6ZPAU5DTy5NFCGCUA6OG/9/5IIrhC76xzMPkrmc6d4z96VDwx4ttJV32U
QUd29JW3GgkxbAfA+/Y3ikqI+eVV48n0/R7XpY32HaYxymd0gzDZOKvB56mo2kC1
4+Ut9ss97y7m6SnBdSnB7GRWjUnwsbTjEJMHNdX0z9uyPim2zxPcHdHhHOPfCyFg
MTl/j+lzjf0qdYqdGB1hL0/XaZKL/rmM9TjKQ/tletRwfqN75i6rxZHw3pINu8ad
7Z8cX4myGNl7qxsoxAfiA496xM5GeVUr8jUqAC51VKmGDCGa4wRsoYDiLJEGbMYJ
Af8QaN9K4+aKN27C7wJubWklxYp7f8doL31rE6sxIiraFhy9giI/VuR0Kbq41ef8
0s6YGvymDo0f3qa2k/ti7W/yz2S7PfQVc3fYZ7k1tKj/J/lq+YR1uAbymvX0r/+5
VWF2OJ+zw8zHZq8s8p3+oFbemXpbmSjI/CDF2LG9Q6ypGnpMH0g=
=ms5W
-----END PGP SIGNATURE-----

--5mdBduTc3aSRfVVg--
