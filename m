From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 02/14] libfdt: fdt_mem_rsv(): Fix comparison warnings
Date: Wed, 23 Sep 2020 21:50:24 +1000
Message-ID: <20200923115024.GH2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-3-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tT3UgwmDxwvOMqfu"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600862023;
        bh=k10rd+oO8VyK2XxJuajK8ua6JUQR0HnXUgmB/Ga9MDc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lplFeyfWFd4cuSudNFTGnz3q8i9JAdj2dUTHRhLs41id/wQtbmSxOZictluSBGyCt
         pZDTQ/0x3V02gRUiAHhVVtfXVUi0Hl+rMRzh943sC6C2RrqKa+BPbjmycY8jXny0gY
         xVlIG77vtaIb2KCJdg6IGjKBJ0MhAOOuPWhBqVp0=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-3-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--tT3UgwmDxwvOMqfu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:52:51PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in comparisons in fdt_mem_rsv().
>=20
> Since all involved values must be positive, change the used types to be
> unsigned.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_ro.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index e03570a..3c8d143 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -157,8 +157,8 @@ int fdt_generate_phandle(const void *fdt, uint32_t *p=
handle)
> =20
>  static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int =
n)
>  {
> -	int offset =3D n * sizeof(struct fdt_reserve_entry);
> -	int absoffset =3D fdt_off_mem_rsvmap(fdt) + offset;
> +	unsigned int offset =3D n * sizeof(struct fdt_reserve_entry);
> +	unsigned int absoffset =3D fdt_off_mem_rsvmap(fdt) + offset;
> =20
>  	if (!can_assume(VALID_INPUT)) {
>  		if (absoffset < fdt_off_mem_rsvmap(fdt))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tT3UgwmDxwvOMqfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9rNoAACgkQbDjKyiDZ
s5KjuRAA3hdZxrnWbu0LZl+bC+86JM83xscLDXqLDxccKXQsQHoAcFLcuNkYs5tv
T1/UbliJ0hU2iG3UmOisXxjN2n09N6y9BmtO6v9kpwzX8GAho2zPgmGc+iS/N203
T3oveHI7YPaIS3GEbMAAIZcSQvoQHj/wVJMV6jLSdEfbbFIcevA1/1wvutX29xzw
TLZa0GoxJtzvovWVevL81FNGCUnOhG+BeRN1jx32s4r2xs5lLx8wxElaZ27R3qgs
z3JhQEeG6cIWD8WMaUsS2dY3GY1qI14q1siCm2XDGyTKndtnX1q5y5eH+X967p6F
eVHkzz7q8v2YEBKv5j8qO0ePv+x1HzIIorfjI2QdJng0GT+eeVo8AEo6P3tWovS/
tbfJU1yWOqmS6YgmuJDykiwIT2NCa3AIIoEi/hFbKemrLc2qyRTtGg1d8puS7sAM
uqei8uJCF1dK1I/554W/kGZg/0vGw3gAzQkcsmD3ts1SpvKojzy1AcPdlzaUgx2k
tYuhdvsrqkV6hXudwkWXtAxq0u4ZYfK/k6o6XaTkcVz7jRCSsQaElbQH06CvaUsj
/cGwdczYbSbKn5fPcYafiHmux0O4vCqWpfuhumEvdXqpT2XAsztL1AkICiyA3PKk
Xd/qCGJRZzVjECGQS/UoRL3S61itfAr1GlwqAMwyDFCAOMMgB3o=
=eQt6
-----END PGP SIGNATURE-----

--tT3UgwmDxwvOMqfu--
