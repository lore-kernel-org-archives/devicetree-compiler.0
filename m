From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 07/26] libfdt: Add a function to write a property
 placeholder
Date: Fri, 29 Jan 2016 16:29:17 +1100
Message-ID: <20160129052917.GM23043@voom.redhat.com>
References: <1453999186-18747-1-git-send-email-sjg@chromium.org>
 <1453999186-18747-8-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hnsKUeImFCk/igEn"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453999186-18747-8-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--hnsKUeImFCk/igEn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2016 at 09:39:27AM -0700, Simon Glass wrote:
> The existing function to add a new property to a tree being built requires
> that the entire contents of the new property be passed in. For some
> applications it is more convenient to be able to add the property contents
> later, perhaps by reading from a file. This avoids double-buffering of the
> contents.
>=20
> Add a new function to support this and adust the existing fdt_property() =
to
> use it.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

So, obviously such a patch should really go towards upstream libfdt.

I'm happy enough with the concept, but I don't like the name.

I'd prefer fdt_property_reserve() - the idea being that it reserves
space for the property but doesn't fill it in.

> ---
>=20
>  include/libfdt.h    | 16 ++++++++++++++++
>  lib/libfdt/fdt_sw.c | 16 ++++++++++++++--
>  2 files changed, 30 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/libfdt.h b/include/libfdt.h
> index e48c21a..c3f37ee 100644
> --- a/include/libfdt.h
> +++ b/include/libfdt.h
> @@ -1181,6 +1181,22 @@ static inline int fdt_property_cell(void *fdt, con=
st char *name, uint32_t val)
>  {
>  	return fdt_property_u32(fdt, name, val);
>  }
> +
> +/**
> + * fdt_property_val - add a new property and return a pointer to its val=
ue
> + *
> + * @fdt: pointer to the device tree blob
> + * @name: name of property to add
> + * @len: length of property value in bytes
> + * @valp: returns a pointer to where where the value should be placed
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_NOSPACE, standard meanings
> + */
> +int fdt_property_val(void *fdt, const char *name, int len, void **valp);
> +
>  #define fdt_property_string(fdt, name, str) \
>  	fdt_property(fdt, name, str, strlen(str)+1)
>  int fdt_end_node(void *fdt);
> diff --git a/lib/libfdt/fdt_sw.c b/lib/libfdt/fdt_sw.c
> index 320a914..9c1df3d 100644
> --- a/lib/libfdt/fdt_sw.c
> +++ b/lib/libfdt/fdt_sw.c
> @@ -175,7 +175,7 @@ static int _fdt_find_add_string(void *fdt, const char=
 *s)
>  	return offset;
>  }
> =20
> -int fdt_property(void *fdt, const char *name, const void *val, int len)
> +int fdt_property_val(void *fdt, const char *name, int len, void **valp)
>  {
>  	struct fdt_property *prop;
>  	int nameoff;
> @@ -193,7 +193,19 @@ int fdt_property(void *fdt, const char *name, const =
void *val, int len)
>  	prop->tag =3D cpu_to_fdt32(FDT_PROP);
>  	prop->nameoff =3D cpu_to_fdt32(nameoff);
>  	prop->len =3D cpu_to_fdt32(len);
> -	memcpy(prop->data, val, len);
> +	*valp =3D prop->data;
> +	return 0;
> +}
> +
> +int fdt_property(void *fdt, const char *name, const void *val, int len)
> +{
> +	void *ptr;
> +	int ret;
> +
> +	ret =3D fdt_property_val(fdt, name, len, &ptr);
> +	if (ret)
> +		return ret;
> +	memcpy(ptr, val, len);
>  	return 0;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hnsKUeImFCk/igEn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqvisAAoJEGw4ysog2bOSRGwQAIV7DCWy6xiDY78V/FrgXmDM
lTttBktJitWXVhtDZS0nLu2Zb31dX9/qmlqVRwC/1qyv9rv0AW6/o84ltcsM8DXo
ph5gexZqoX2bxQhvpOCFnLJIvdrwcODvhjJQgQr1lu9wlLhd1hhVpLvf/OHtditd
7PTU5rE6N+T7Qt0rgKJ8iFeC6js27DHMWbKWgVRoWzUFfxdO6o8kvdsyiTyuFm3D
HL/XV1E9BmZVhtFI0S4BMsGI83QkEFn+2p2xQT8vBbVz9lvQ8udTbGfwE+TMXAF0
1kz5AcVyADMTi0pN/nb9nlnKq9Mxb6TimBtWCJnvd6W0MBx3aNbmVhrEpD6g1cr5
TF8TkXpDe3xA5dEhSzkn5rFiKFO20d7qXe6HyXe2S6hKrERSoMcM3T7DVV1KEb+P
3nwMcTC57lff9Z+On4lZPEw41Rn676njABcwMKNwz5ZogCtxAbdJTcy3tLKwHN0U
eZ/bjib2cGmiDwU+umlY4oyKTOjgpqH/WqSXxudXg9R+zd6oFqK7QmIzuLwyJtMk
JAehHKcDK040UFmlx7MfYEOSR6d/QwaMERZbSP8GA5sXXKtZFQyz26USYx1oJplo
IJlzeh31N2WxyXOyKedtZAPttVHfVmqwJCZ5IbCKgxtgCEIaXNsjVi7FmX8aUwHK
z81fpCt/Fogb5j6bKCR5
=eMv+
-----END PGP SIGNATURE-----

--hnsKUeImFCk/igEn--
