From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] checks: Fix bus-range check
Date: Wed, 30 Jun 2021 10:32:57 +1000
Message-ID: <YNu7uV+z5bR3znsh@yekko>
References: <20210629114304.2451114-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6bR5wLXzImhVW2px"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1625014244;
        bh=6YYnlEoJARJZpeqViQCBsyOpeGD5zU0psR6wNpTKOVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AhCzDNHNS52hIPdzGpuJzC+LSaq9g0KGfMCcA90dWWvT7X1mGtK6DEa6QAYhpJOLE
         vxuIE/DKIsGCm3YeY5IeBH+2r6F5dwzJ7x88VDH1ed/etn1uiDRNgNNqbw1AtyGIeV
         MMnpZfV2UyV2X0HEonAxWNhWDiy0Fvr1/8VNO10U=
Content-Disposition: inline
In-Reply-To: <20210629114304.2451114-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--6bR5wLXzImhVW2px
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 29, 2021 at 01:43:04PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The upper limit of the bus-range is specified by the second cell of the
> bus-range property.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

> ---
>  checks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index e2690e90f90c..fb3fc9cda4b1 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -892,7 +892,7 @@ static void check_pci_device_bus_num(struct check *c,=
 struct dt_info *dti, struc
>  	} else {
>  		cells =3D (cell_t *)prop->val.val;
>  		min_bus =3D fdt32_to_cpu(cells[0]);
> -		max_bus =3D fdt32_to_cpu(cells[0]);
> +		max_bus =3D fdt32_to_cpu(cells[1]);
>  	}
>  	if ((bus_num < min_bus) || (bus_num > max_bus))
>  		FAIL_PROP(c, dti, node, prop, "PCI bus number %d out of range, expecte=
d (%d - %d)",

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6bR5wLXzImhVW2px
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDbu7cACgkQbDjKyiDZ
s5LNqA//ZfY04qfTZ33ObCezWz7i8Cf6wxiUVYST5Caxu4ZGFZjt6TVy7GzdkRw9
9wsCu07+bAlvrTW/IRpIiqRKxBE6wXDUmOt/71TBuWX2nXBQ1rvFntrLZBOGLXFg
/r+o3PBPV2Z4kxg43j9snLZRgKogxfn3jUG2Quw/DuxD8rvDwhv9znGaqcQfD+0R
senfNwW7xZXMdNytgwJE9W6NuwAGyD1S+YtWRqQVaxUwB6bLpcFftYqOhZcVTzQR
Ej6Hapz5tWoaU4getevJx3v4GD3131eaXg84n/cjQHCrQuB17tTAfIUxIQ9Ew7wd
idRiMMVbRhKaQzHieqQprKBxXDStGbHbUrD6SGHkeRnTnxAoBBkr6zbbdTnEuAjN
2HfIWrcACbYK2WDxo65NHwCbMjWHxEC1/wBL2ckGyfDR+shMcd1ZZ9YWWgN5iN7u
ypJRM3JBTYNT2bz0CY6HNkiZ5AuhXEsH2wwB2VlwThmDnrC3juDLn18oGnS4G1Bk
QnyF9796a1em/3zl0lp5Qa87G+9EeZ6behqj154Y0edA8F67fvZmqCnuJEzac3l1
fF76BbK/N5wwZD8jrYQyS8F4RWPKwAM315bVa5EU0WJcpWf2sR6w+b0KS8Sd/hVg
oJaucGfRa4Jk44DKDYDK9uuEAxGmgfzdmmi6KvspsKa8zHIKN34=
=yrHN
-----END PGP SIGNATURE-----

--6bR5wLXzImhVW2px--
