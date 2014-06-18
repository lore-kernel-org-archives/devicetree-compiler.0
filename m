From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] Correct output from memreserve in fdtdump
Date: Wed, 18 Jun 2014 20:32:15 +1000
Message-ID: <20140618103215.GF29264@voom.redhat.com>
References: <1403074825-5069-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DO5DiztRLs659m5i"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403074825-5069-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>


--DO5DiztRLs659m5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2014 at 01:00:22AM -0600, Simon Glass wrote:
> This currently displays a hex value without the 0x prefix. Add the prefix
> as dtc requires it.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  fdtdump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index 723770d..a29aa5e 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -88,7 +88,7 @@ static void dump_blob(void *blob, bool debug)
>  		if (addr =3D=3D 0 && size =3D=3D 0)
>  			break;
> =20
> -		printf("/memreserve/ %llx %llx;\n",
> +		printf("/memreserve/ %#llx %#llx;\n",

Is the # modifier and its behaviour standardized?  I couldn't quickly
find a reference.

Might be safer to do it as an explicit 0x%llx.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DO5DiztRLs659m5i
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJToWqvAAoJEGw4ysog2bOSRB0QALbmDnYLy4+7gYTJedmZ2kf1
X6GU2Xw5Zvh2HvsMMMYdpNc2B4FO7E68iRI20PbTlN8EhG68gIOwDKIPSQY57Od6
IZxzCFl3xGrPajsPAxfJq8BzsfxwQzBdBPgSi7sVKUGLqR5w6FbebzlgitCL4zKp
jQXZZhJ4lCvgktej78mWQAU3joN/liGTOBBTyl1VVVOEoEkRg7CpChGZlrk808SC
lVL5F437yQOZkFhY4QQqbhzdWTZH2jcS8hwlGbJwC7EPIVgTVJOEiwlRf6kZlGah
ZAPSETV8bqot4G5mftD1Sq3HuC7xC7LPxcD3WeredCSZIbI/JkHsJiPQkBu23paj
z+Bp1lXwiPB8hjF0fRtYcCC00ikOlXIJzUzvaiXJ1x7onbrScLEf7u+4FQ/9YSYW
aZkG4EFw8Fc+CxTYE16D32BL+MAtjZdS3t+GhIJKjLu7DxUsWP7CgFUUl6YtVksa
tH9V/y+V6NWNo5P+mLccITaZZr74SIo5RzQqVNF7nD+yEELS2Huifn9eeTF1KRgT
R91micB3Vo2pQG2Hjp+ayETV7TrjcPUpALu8iQ9N/FrVYg0fcqakMBCbuEwrEbNh
ZYHosd0C9BpeDIlwnD4fT0Ds8ax2Kxsukr0oDJiL8PR5Sz2GGX6ePql6Beugi6XW
sOd9v9yO4tezwJUNwA+0
=VKlP
-----END PGP SIGNATURE-----

--DO5DiztRLs659m5i--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
