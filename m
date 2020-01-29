From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Revert "yamltree: Ensure consistent bracketing of
 properties with phandles"
Date: Wed, 29 Jan 2020 14:42:45 +1100
Message-ID: <20200129034245.GZ42099@umbus.fritz.box>
References: <20200124144657.29749-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8jEihaNHb65WmIJG"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580269372;
        bh=0mDyEpZUHHwaBCL5HnoDy5y//X10SSAuiT5LNVGBVco=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BLiz/u8W/AlfqpS1H08BIpz5R/UrygBSy2YNfkiNq4lSj5GVEeqe4X0PzB1SG8c22
         4WIBzSyqFCDEmhlfUf3D5CcJAruNStEGrck86aVbU52CWcZgBln4Ii7649eJFcKBLk
         OFkUf3EzXhNdVbsahm1U4SK+lxK+9fZioHB2b+mk=
Content-Disposition: inline
In-Reply-To: <20200124144657.29749-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--8jEihaNHb65WmIJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2020 at 08:46:57AM -0600, Rob Herring wrote:
> This reverts commit 18d7b2f4ee45fec422b7d82bab0b3c762ee907e4.

Applied, it looks like that commit was based on some pretty faulty
assumptions about how properties are structured.

> This doesn't work for properties such as 'interrupt-map' that has
> phandle in the middle of an entry. It would also not work for a 0 or -1
> phandle value that acts as a NULL.

I can't really make sense of that last sentence, though.

>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  yamltree.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
>=20
> diff --git a/yamltree.c b/yamltree.c
> index 43ca869dd6a8..5b6ea8ea862f 100644
> --- a/yamltree.c
> +++ b/yamltree.c
> @@ -138,27 +138,6 @@ static void yaml_propval(yaml_emitter_t *emitter, st=
ruct property *prop)
>  		(yaml_char_t *)YAML_SEQ_TAG, 1, YAML_FLOW_SEQUENCE_STYLE);
>  	yaml_emitter_emit_or_die(emitter, &event);
> =20
> -	/* Ensure we have a type marker before any phandle */
> -	for_each_marker(m) {
> -		int last_offset =3D 0;
> -		struct marker *type_m;
> -
> -		if (m->type >=3D TYPE_UINT8)
> -			last_offset =3D m->offset;
> -
> -		if (!(m->next && m->next->type =3D=3D REF_PHANDLE &&
> -		      last_offset < m->next->offset))
> -			continue;
> -
> -		type_m =3D xmalloc(sizeof(*type_m));
> -		type_m->offset =3D m->next->offset;
> -		type_m->type =3D TYPE_UINT32;
> -		type_m->ref =3D NULL;
> -		type_m->next =3D m->next;
> -		m->next =3D type_m;
> -	}
> -
> -	m =3D prop->val.markers;
>  	for_each_marker(m) {
>  		int chunk_len;
>  		char *data =3D &prop->val.val[m->offset];

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8jEihaNHb65WmIJG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4w/zUACgkQbDjKyiDZ
s5JMhxAAlvJl0fIO/5haSyBy93nLsmR0FDFp/Ok7wPXCfJFOuDx4Vv5iM9Qo+GFB
+QLioASiXaZGxAxhtP1+jiLvVdlqCGtSYHZzfyG0JOgMTUntERGKT8+DyjB8FYQa
5VmSsfwg27qD/qBYWbGyclzsUvzvDERILL41Qwidq9+D9uTuYuBgSMsmZB+Yfsw3
35Uo/+RWJFy65+uyL5Yxvu5tCIifndFsdHSxf5qFCZo96rlZJ3m3iq8LhhUXDb+l
R8CpHzI+U8eBek7VQ6Uk+8dEak4R17Tacdc6+bHxN8yrszJUfINR+KWAFiIlJjHc
2L1136YrzzlQGaBZxA+3ljXSGM1UsH8Me3khN68loLX+r17HO/7EDdpJykDljXAZ
c0leC2AHdq0WLpHzHOEr6VTxLRg0KgG6I2LcsC1OBRJPJbc0EjbPkAyqenk6rzpw
SrbWg+7rpNCCSEuQ1QiTgedHf3f2gUhYEJpd/eykHJuYg/szBkW6rwfBTN2OzmOW
NtEov/u3WsfWOdAsHytoMDWT/PDmv3MWslA3XDmnKKfjI9l9+vNqp4FQXLsCWMPD
fZ6id7krpxBg4XGJe8tDmqL47Xnx5KmdXAVZPQgqcpxd6LBXIiZ705MUgvbCw345
DyjznXHF0Lu2DN7TPfqXvgMkS/rtklMKKCx4sNhRaBl2U6lT3lY=
=tHw0
-----END PGP SIGNATURE-----

--8jEihaNHb65WmIJG--
