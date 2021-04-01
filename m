From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Fix the undefined behavior in fdt_num_mem_rsv()
Date: Thu, 1 Apr 2021 14:25:08 +1100
Message-ID: <YGU9FH3WccMBrfl1@yekko.fritz.box>
References: <20210330095645.515056-1-bmeng.cn@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0dK8LU/2ReiczGMQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1617251446;
        bh=bc9zLbKWH6Vsj/g2RllyzLtzw/lwjqwpxQB473eMnmw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=StntMlZ8EzkSELTrJXS6qFzs+kbQ9/cWDySLJGKmq4UJxpskoP2HExMaXaB2YABag
         0q0PqSMKA1dmugQmCHymvRgmbUjLbBMpapw6F3JpOiGeSn1ryZ4Nz7bcwlJvZc/8Re
         V5zhRwpglC/lZvBM6OaTGhx1JI4TWeuTW2ceWurg=
Content-Disposition: inline
In-Reply-To: <20210330095645.515056-1-bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--0dK8LU/2ReiczGMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 05:56:45PM +0800, Bin Meng wrote:
> With LLVM 10.0.0+, the following codes in fdt_num_mem_rsv() does not
> work any more for an fdt that is at address 0:
>=20
>     for (i =3D 0; (re =3D fdt_mem_rsv(fdt, i)) !=3D NULL; i++) {
>         if (fdt64_ld_(&re->size) =3D=3D 0)
>             return i;
>     }
>=20
> Due to LLVM's optimization engine utilizing a UB in C, the following
> code pattern:
>=20
>     if ((pointer + offset) !=3D NULL)
>=20
> is transformed into:
>=20
>     if (pointer !=3D NULL)
>=20
> because if pointer is NULL and offset is non-zero, the result of
> (pointer + offset) is UB. So LLVM is free to exploit such UB to
> perform some optimization.
>=20
> In this case, fdt_mem_rsv() gets inlined and returns (pointer + offset).
> And LLVM in turns emits codes to check fdt against NULL, which won't
> work for fdt at address 0.

I don't think this really fixes anything.  It might fool LLVM into
doing what you need right now, but I don't see any reason to expect it
will keep doing so.

IIUC, you're saying that the specific problem is that adding a
non-zero offset to a NULL pointer is UB, which happens inside
fdt_mem_rsv_() if n !=3D 0.  But with your patch, that UB still exists..


>=20
> Signed-off-by: Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>=20
>  libfdt/fdt_ro.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 17584da..4db4013 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -157,18 +157,26 @@ int fdt_generate_phandle(const void *fdt, uint32_t =
*phandle)
>  	return 0;
>  }
> =20
> -static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int =
n)
> +static bool fdt_is_mem_rsv(const void *fdt, int n)
>  {
>  	unsigned int offset =3D n * sizeof(struct fdt_reserve_entry);
>  	unsigned int absoffset =3D fdt_off_mem_rsvmap(fdt) + offset;
> =20
>  	if (!can_assume(VALID_INPUT)) {
>  		if (absoffset < fdt_off_mem_rsvmap(fdt))
> -			return NULL;
> +			return false;
>  		if (absoffset > fdt_totalsize(fdt) -
>  		    sizeof(struct fdt_reserve_entry))
> -			return NULL;
> +			return false;
>  	}
> +
> +	return true;
> +}
> +
> +static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int =
n)
> +{
> +	if (!fdt_is_mem_rsv(fdt, n))
> +		return NULL;
>  	return fdt_mem_rsv_(fdt, n);
>  }
> =20
> @@ -191,7 +199,8 @@ int fdt_num_mem_rsv(const void *fdt)
>  	int i;
>  	const struct fdt_reserve_entry *re;
> =20
> -	for (i =3D 0; (re =3D fdt_mem_rsv(fdt, i)) !=3D NULL; i++) {
> +	for (i =3D 0; fdt_is_mem_rsv(fdt, i); i++) {
> +		re =3D fdt_mem_rsv_(fdt, i);

=2E. here ^^.


Basically if your compiled is going to optimized based on (NULL +
something) being UB, and the NULL pointer is address 0, that's
fundamentally incompatible with storing a device tree at address 0.

>  		if (fdt64_ld_(&re->size) =3D=3D 0)
>  			return i;
>  	}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0dK8LU/2ReiczGMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBlPRQACgkQbDjKyiDZ
s5IheBAAq03k6z1XdpQlC3iqPzjwAEaD/8mXF/rgb9Enc4RuXnZJf5Fmvq31aJ6x
FwYKxonVWoteE6YA0wynnYThXT8cis1TIvcpTZgfQMw3MbzAwpRq+0cla6rQAFjo
a2ROmnTwSIaR+t8rmEamqglWKgXuZFMQLZdyjPbxlsTnUlewsXI83kVmYrfmKpX6
VKTRJC+riEc7GsaezAARdAZk6Y6WQNKVyEeoM3TiKCxu2VRJkacjIW0WCqkrb3nP
8XZgfooMWxdBYTh4eOKpRnqEFnRaz+xiezYfpiNnhcvQLvyTSMQf7StYx2W6Qbix
PqM59XErPvmZFzpcFt04MNZm+uoUAmioa2GONBVMakZouIfRDGexZoIkpjPpoUtz
Nilm+9XiwqpKTWV00zsYxC4H6w58FFrNGD9EfnUpH0Rtr96TDqyEzwEwuq94go1j
kBVSKVzE8eVO7D0vwdggfeyyXUvuGDegM0r9bJopfzxZ0skHZ6wSsELxxJBrhGJ0
i7pkG842dSDZ+NlpZwxqqKZuSiX273yHYYYeg76H+Njr7XjVrvPhzqgbaOADqZ1i
5VykGlLbDGD7FcvuDG/FksFM0kMKMA2+YWp71nu6t+M+RYUyMJnRzVH+bnGSDBx5
cFus73FZTMqtkdZsEfOxyfgbf61dlTCmgL7L9X0LYp6h0+VgeP4=
=DjGA
-----END PGP SIGNATURE-----

--0dK8LU/2ReiczGMQ--
