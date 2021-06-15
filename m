From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 6/8] dtc: Fix signedness comparisons warnings: pointer
 diff
Date: Tue, 15 Jun 2021 12:49:31 +1000
Message-ID: <YMgVO6w1oXki9b0G@yekko>
References: <20210611171040.25524-1-andre.przywara@arm.com>
 <20210611171040.25524-7-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PcCvcCIN9zHGvMwL"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623729378;
        bh=TyLVeZWZv+J3FPF4LGdfWyU4s80cgjABYxKPbvTOYn8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j0U3u66o3GQpb6I+SHjb5THTy02+C7SX2FiK5fcmpw4NcN4EzEzeEEC2blxc/qfJV
         2xnuNgSVPYj1AJpDWExh1+ZO1Iag0HkOqVDumRl6NAEQww0SUFpzZyuEoZ/OM0j4eI
         IqZM+jevbHDvwhba8sWVFJROY6lk/5T+7ZR4Sv+E=
Content-Disposition: inline
In-Reply-To: <20210611171040.25524-7-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--PcCvcCIN9zHGvMwL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 06:10:38PM +0100, Andre Przywara wrote:
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

Applied, thanks.

> ---
>  livetree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/livetree.c b/livetree.c
> index cf2f63d..ef141a0 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -526,7 +526,7 @@ struct node *get_node_by_path(struct node *tree, cons=
t char *path)
>  	p =3D strchr(path, '/');
> =20
>  	for_each_child(tree, child) {
> -		if (p && strprefixeq(path, p - path, child->name))
> +		if (p && strprefixeq(path, (size_t)(p - path), child->name))
>  			return get_node_by_path(child, p+1);
>  		else if (!p && streq(path, child->name))
>  			return child;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PcCvcCIN9zHGvMwL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIFTsACgkQbDjKyiDZ
s5JQVhAAmSnq5I+K14IfDve/1mbq4IAemgsHj2wXjbEIznVhUJdky8HMWf55dE32
hd4kOFWpgIgS4Rl36+T3+oIbJZkoiYuiMq+MxrAXJ3E9EH/BPwVyMXIXVE1SwyRo
gWeWkx9d+qfp7xUZ9fwfSHxTkwTFJhgl2GkKOUnD3enArhqAdqDjmkASy5//WKbo
y9r0MJYHMkx5f5ncJbzzqpehPPX8Q5UsSvOjHsHPqI2e9ZFqEfpbf5lXfLI/xr2A
xRyua3B+zH8gr/QOkecMyxPvZTDUhbnvF5+KdpS1/ipaQ/p2mBDmX42jmelVrMFy
cYCxXR/olJzTnlbQilDX992joMJnrR6u+yJ7KE4ijZXO0STRiBV/r7uTMJJvxJfy
D6rYwNDWM34rAufdI/vbBo/D88DN8otPQttw4ATFRmTF/gV6PFdDcp0uJqGDUYSX
nRBevHQJj/EMojMpt1SmCx/e5E+8kuMAgKF4G+kue+XC4pMVodHhvD88jt6fb+H1
3U2uDHJWDWKpG/VAdwlIEAJpTKltrc6AE0GWOJr3CA1nYI+Fl3zhQRCO6KkCQkZX
/aGpxwox3cV4ExQ2w1W38oCiHD58qDLPBiDBSQXTUf9IJwmaq6OfCI8GBSR3q+fb
w/MTn8DMKF35rRFrcU53bUjoJy/Qj0Gov5OnmkCYWwW1q/Gi8VE=
=tw6t
-----END PGP SIGNATURE-----

--PcCvcCIN9zHGvMwL--
