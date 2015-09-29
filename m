From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/3] fdt: Add functions to retrieve strings
Date: Tue, 29 Sep 2015 16:00:41 +1000
Message-ID: <20150929060041.GR19428@voom.redhat.com>
References: <1437045021-4549-1-git-send-email-thierry.reding@gmail.com>
 <1437045021-4549-4-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5xr6Gr0irOxp3+3c"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437045021-4549-4-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--5xr6Gr0irOxp3+3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 01:10:21PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Given a device tree node, a property name and an index, the new function
> fdt_get_string_index() will return in an output argument a pointer to
> the index'th string in the property's value.
>=20
> The fdt_get_string() is a shortcut for the above with the index being 0.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> - handle non-NUL-terminated properties more gracefully
> - improve documentation
>=20
>  libfdt/fdt_ro.c | 37 +++++++++++++++++++++++++++++++++++++
>  libfdt/libfdt.h | 41 +++++++++++++++++++++++++++++++++++++++++
>  tests/strings.c | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 110 insertions(+)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 39b84b1cea60..4315815969b6 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -593,6 +593,43 @@ int fdt_find_string(const void *fdt, int nodeoffset,=
 const char *property,
>  	return -FDT_ERR_NOTFOUND;
>  }
> =20
> +int fdt_get_string_index(const void *fdt, int nodeoffset, const char *pr=
operty,
> +			 int index, const char **output)

So, once again, I don't like the name.  I'd prefer
'fdt_stringlist_get()'.

I'm also not 100% behind the interface.  In libfdt so far, we've
mostly avoided the pattern of returning just an error code, with
actual data returned via a pointer parameter.

It's still a bit ugly, but to closer match the signature of existing
functions like fdt_getprop_by_offset(), I'd prefer to see this return
the output string directly (or NULL on error).  Then add a *lenp
parameter which will return either the string's length or an error
code.

The function is already determining the string's length, and there's a
fair chance it could be useful to the caller.

> +{
> +	const char *list, *end;
> +	int length;
> +
> +	list =3D fdt_getprop(fdt, nodeoffset, property, &length);
> +	if (!list)
> +		return -length;
> +
> +	end =3D list + length;
> +
> +	while (list < end) {
> +		length =3D strnlen(list, end - list) + 1;
> +
> +		/* Abort if the last string isn't properly NUL-terminated. */
> +		if (list + length > end)
> +			return -FDT_ERR_BADVALUE;
> +
> +		if (index =3D=3D 0) {
> +			*output =3D list;
> +			return 0;
> +		}
> +
> +		list +=3D length;
> +		index--;
> +	}
> +
> +	return -FDT_ERR_NOTFOUND;
> +}
> +
> +int fdt_get_string(const void *fdt, int nodeoffset, const char *property,
> +		   const char **output)
> +{
> +	return fdt_get_string_index(fdt, nodeoffset, property, 0, output);
> +}
> +

Please drop this shortcut.  It's not that useful, and encourages a
caller to treat a stringlist property as if only the first string
matters, which is probably a bad idea.
--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5xr6Gr0irOxp3+3c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWCikJAAoJEGw4ysog2bOSW10QAI8ldZ6bLtrUODgEFqkrYWTK
AG9QhI/u31h0KU1g2JKY9cm8UIXGdGZuMhyRFjD6hS11A9PsIu+XPvZD6sqbmhxZ
SrQak4vNV4Xn2BdW7Qr2l4Yv8WV4D1r0T2c5NdotzQ7aQ6ElzuEoB471oGqQ50Ts
XWNkcWYmvmHrx0UlXiyT+1s7Kvv8ioKTiBXdYWREIJ0h/T3Eeh9A4thiVjcKds+Y
W+aeaGtkK1Q7iWcNaNeFR3TY39t7Sp8AJjM4vW42XlEUQFywHBX+PgBUvBCQ2X/h
Y4Z2R11Lf+ji7BDua3GJ8KtlK2JEoyXa004yX1FcFItEh2ukTymjjlcyA09Tp33F
1b0pHoQk6dg7neJpC2bA/3Ut09L/zfWjCjTSRmyLJoysx1OqS99XfS99OhEQCg2M
WyyFztVr30M67WiCAJd4e+VuVA2iIrU1GpCbtKY6Q/yv3VF+e/3JqHt4IvmBN55u
6fJSiaTauSZovpr8SrDBHiJQ6hduQlZZdwU8akfPCldC7B9G3Jc2Yh7yhGkFh5wK
nrSiPTIsLvZbxOLTF3U/gByVbltR6rE+IfVbTsx4rXnqraMYi+I0GT7d8zC/DZjq
0qhFHjfVFfKzhy+CWL+qftiN98dSjwvqUvkMDsOUuEdH4T8t9WRw840ciNWxUn0a
jFubNpyP5LQPXGJKf67P
=3tks
-----END PGP SIGNATURE-----

--5xr6Gr0irOxp3+3c--
