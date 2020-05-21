From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Supporting aliases in PATHREFs
Date: Thu, 21 May 2020 11:18:40 +1000
Message-ID: <20200521011840.GB63349@umbus.fritz.box>
References: <8D778C5A-59DB-4649-B5BF-6918603876A1@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1590029719;
        bh=YyNuNA9KIhL/Et5zEOSOIWBMMD7yJwEJKPzsAcdKi8U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QYLStkOCZb8SoqFQE/Cx73L3cLWajl0NCvMiaU5Gc4EC9KC0TfLG4uHjO5nryhtZ+
         8cguwEIDR4IT02prLLPeuCb3ZyVzYWyS8UIFhn/Q+mtxzaIGgqlsQVr7zN/lNVdCSz
         9o2xpDOsCiJ4Casn4dHgtkqhEHv9/MKv1sNOKSFo=
Content-Disposition: inline
In-Reply-To: <8D778C5A-59DB-4649-B5BF-6918603876A1-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 11:04:54AM -0500, Kumar Gala wrote:
> We currently have support for referring to a path via:
>=20
> &{/foo/bar}
> {
>   =E2=80=A6
> };
>=20
>=20
> Was looking at supporting aliases in that as well, so you could have:
>=20
> aliases {
>    aname =3D &{/foo/bar};
> };
>=20
> &{aname}
> {
> =E2=80=A6
> };
>=20
> As I look at making the changes to support this, had a few questions:
> 1. So we use DT_PATH_REF in the lexer for this, or introduce
> something like DT_ALIAS_REF?

I think generalizing DT_PATH_REF would be a better idea.  The {}
present in path and alias refs but not not label refs should be enough
to distinguish it there.

> 2. On the yacc side, looks like there is get_node_by_ref() and
> add_orphan_node() would need changing to distinguish a PATH, ALIAS,
> and LABEL reference as right now they utilize the ref starting with
> =E2=80=9C/=E2=80=9C to distinguish between PATH & LABEL references.  Woul=
d passing a
> 3rd parameter that is some ENUM type be the way to go here?

I'd treat alias references as an extension of path references even
here.  In OF you can traditionally use an alias as the first element
of a path, instead of / - and, for example, fdt_path_offset() will
resolve paths of that format.  So that would let you use a reference
like &{aname/baz} as a bonus.

I'm not immediately sure whether it would be better to have an enum
parameter, or to just have separate functions to resolve label and
path references.  Depends how much common code there is.

> 3. Are there any other places I should look to fix things so aliases
> can be used similar to a path?

Probably...


My only real concern with this proposal is that it makes a pretty
subtle distinction between &aname and &{aname} which might make
reading dts files a bit hardware for humans.

How much does allowing alias references buy over using a label, like:

aname: &{/foo/bar} {
	...
};

aliases {
	aname =3D &aname;
}

&aname {
	...
};

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7F1u0ACgkQbDjKyiDZ
s5JRQA/9HWkJM70EPPC7UaTX2RwFW3+SL1DQQOHFE1BJW6/jG1hcetiNTmUFCc6p
1ymlDbu8zhUye85uMbJ7xvI6YLPaDBl/MQgDMZ/ntYdKKWyX0WUNGx2WWWo2T0n8
7r3ja4uE9pZQnHnYsVczCZCwnMOJRN5PShvHnoPLp6pa2awPlYxkKp7xUDJhkjFj
zT64FyarUEiEfWUIv59B4nR5VWN8wzfpc+aSbUNVcjVvll5My/KF+JZ/Tg/Qa9mS
in+rUl/ycZDVrVwAvWCZw9aHFG8IVBPQK5uYPwy/Ae2GhsRIgS2QjQuCIPW+IiW8
VatckDFXw9WcpTsdrJVu2p2uq01LP+Mgf9fSZs3Lf+jYGKWA8bs4YEIdc3cq1BeG
qyx1DX6x50bLPguGTcojHX+lMGoEM73/odhzXocmtvGxJ7CEzI7etx4KzJiiapRN
EIB/+0NFQMfy9heIfvtAVgnjpK3x4neH+WfC6OQEBlXFuDN9Kp+/f0sRevxVXdAx
AXXqmJwaiSNusnohm0OvhMrZrKQoT+SdqZjRvwdLKVKHs01nMhfrbtzUDB0x5aq7
COKum07vZdr4tgRHY9+jjeOEbLg9yH6qqTbKP/8gFqJiWXKS4vproXze55zVu58O
sV2TLRdwTN3u94406C3kS2dst5jJCcY8ix8odMVlDR5GQ9XlKwQ=
=E/j6
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
