From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 01/14] libfdt: fdt_offset_ptr(): Fix comparison warnings
Date: Wed, 23 Sep 2020 21:47:51 +1000
Message-ID: <20200923114751.GG2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-2-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rV8arf8D5Dod9UkK"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600862023;
        bh=DBngrSwgLnKS2yetrS0WS8hCMDvQzlFYfcJFmmKTCR8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gy0QLIoLYd1BdqIOk0GPm1Z0pQc/Y+Xchq5OMsAnTUZz/Ymw4f2BvnSi9u6kF54Dd
         dBKaMt8EsPBHCdI8YpTnRWOvwPUZCB2sgX+PAQ/XZl6kMQ9r5gwUdmYXO5amGq+Z3p
         XKdpijwWPiwTgY1DQRZklOKZmIXWHmNoHC2G9kLE=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-2-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--rV8arf8D5Dod9UkK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:52:50PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about mismatching signedness in
> comparisons in fdt_offset_ptr().
>=20
> This mostly stems from "offset" being passed in as a signed integer,
> even though the function would not really tolerate negative values.
>=20
> Short of changing the prototype, check that offset is not negative, and
> use an unsigned type internally.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 37b7b93..04e1e06 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -134,16 +134,20 @@ int fdt_check_header(const void *fdt)
> =20
>  const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
>  {
> -	unsigned absoffset =3D offset + fdt_off_dt_struct(fdt);
> +	unsigned int uoffset =3D offset;
> +	unsigned int absoffset =3D offset + fdt_off_dt_struct(fdt);
> +
> +	if (offset < 0)
> +		return NULL;
> =20
>  	if (!can_assume(VALID_INPUT))
> -		if ((absoffset < offset)
> +		if ((absoffset < uoffset)
>  		    || ((absoffset + len) < absoffset)
>  		    || (absoffset + len) > fdt_totalsize(fdt))
>  			return NULL;
> =20
>  	if (can_assume(LATEST) || fdt_version(fdt) >=3D 0x11)
> -		if (((offset + len) < offset)
> +		if (((uoffset + len) < uoffset)
>  		    || ((offset + len) > fdt_size_dt_struct(fdt)))
>  			return NULL;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rV8arf8D5Dod9UkK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9rNeUACgkQbDjKyiDZ
s5KMWhAAouUEEHhlHkFd1WNypHA3ijo/7NqvSPwn5SxFCyvcPflEX7S7Lgoz+tAs
Qlk/k3plXsVI9Fdpm8gpO87LgLArMRBvBjV/zf2X254x46NJT71jNh7leyhyXQLI
ng8u7O+xW5pU/4Cr8zfHgmfLHWqzhRYIFLA1mPOirqWkkrlqJABmwmtO9q1oWCsi
tqbLhlWEnzDqlEa9/l0WpuD9+bLMPpB/QGWdVEWLjYj3j1f2bPkZIAwCBIF/XgJu
26fFadcAIY0K5KuZG4J0XWu5NOnIyn6tCGjt7XH5s1C/WLBj1bs4pEei5cW45MqB
uPBS1pskf6hyiVMqyo4d+yUqjicdpQTSkEsVsEKyAjEefzKRWPJq9JVICIOWpPpa
+13BZjQif81nVmr7B5BmuNwMoLKBEohbuCEZn1m1KnlnhigrXHIm/om2TY+t2Pw7
hP4ef/97pzyL9uaYAilyOxxlyGU1ehHJIOnSEg/eYusoncujirWp02f0uZu5cnF8
YlHNUWuhz/bcNJgAPr1j2MbMPWrhV7kr39bTznO4/2d+9R8ObOZ0zM3sT675wlEU
7vjCzN2WOZnjtXSf2g1tJ41mEaitEzA5bYHrQMDdZ7RCcyCHBXh7kLdJBf2Q0lLm
XDPZc2+05kVaeMUb0UNjhoqOKOCoxpGfjK/4mab7HTUVri6DzPc=
=0umb
-----END PGP SIGNATURE-----

--rV8arf8D5Dod9UkK--
