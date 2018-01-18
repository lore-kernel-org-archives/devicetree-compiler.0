From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] Add limited read-only support for older (V2 and V3)
 device tree to libfdt.
Date: Thu, 18 Jan 2018 15:59:03 +1100
Message-ID: <20180118045903.GL30352@umbus.fritz.box>
References: <20171208063149.76523-1-nwhitehorn@freebsd.org>
 <20171231022858.10834-1-nwhitehorn@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8tIZwPmdq+hd82jQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516253016;
        bh=RuqMGjrnMMIEzx/EKF4r3iIJbP6/xFHxCkiRVTzWy8I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CQB01NSS9dIpHegVUEz2bkAZMEPMXhiIpGw8c3/r4jVcq1x0QGlbtLGTccQmUWwzr
         dXv/JRhqeRctIU+jIIcfTGkJ/yyNpii58sMnRtFgl32HXB5pZ4fhnvWtPZ4BwJDPSw
         vzctLvfU5izB/GbT73Dp/QMah67uKhPgyCAFfUX4=
Content-Disposition: inline
In-Reply-To: <20171231022858.10834-1-nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--8tIZwPmdq+hd82jQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 30, 2017 at 06:28:58PM -0800, nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org wrote:
> From: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
>=20
> This can be useful in particular in the kernel when booting on systems
> with FDT-emitting firmware that is out of date.

Hrm, really, *really* out of date.  V2 and V3 are positively ancient.

> Releases of kexec-tools
> on ppc64 prior to the end of 2014 are notable examples of such.

Good grief, that's ridiculous.  They were also using dts-v0 years and
years after it should have been gotten rid of.


Anyway that said, the changes below don't look too bad.  There's a few
nits, but in principle I'd be ok to apply

>=20
> Signed-off-by: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
> ---
>=20
> This fixes some minor bugs in the original version of the patch with name
> matching and properties that were exactly 8 bytes long. Tested and running
> (though uncommitted for now, to prevent divergence from upstream) in the
> FreeBSD kernel.
>=20
>  fdtget.c        |  4 +--
>  libfdt/fdt.c    |  8 ++++--
>  libfdt/fdt_ro.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++--=
------
>  libfdt/libfdt.h |  5 +++-
>  4 files changed, 87 insertions(+), 17 deletions(-)
>=20
> diff --git a/fdtget.c b/fdtget.c
> index 6cc5242..34d8194 100644
> --- a/fdtget.c
> +++ b/fdtget.c
> @@ -140,7 +140,6 @@ static int show_data(struct display_info *disp, const=
 char *data, int len)
>   */
>  static int list_properties(const void *blob, int node)
>  {
> -	const struct fdt_property *data;
>  	const char *name;
>  	int prop;
> =20
> @@ -149,8 +148,7 @@ static int list_properties(const void *blob, int node)
>  		/* Stop silently when there are no more properties */
>  		if (prop < 0)
>  			return prop =3D=3D -FDT_ERR_NOTFOUND ? 0 : prop;
> -		data =3D fdt_get_property_by_offset(blob, prop, NULL);
> -		name =3D fdt_string(blob, fdt32_to_cpu(data->nameoff));
> +		fdt_getprop_by_offset(blob, prop, &name, NULL);
>  		if (name)
>  			puts(name);
>  		prop =3D fdt_next_property_offset(blob, prop);
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index fd13236..b1cc253 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -84,8 +84,9 @@ const void *fdt_offset_ptr(const void *fdt, int offset,=
 unsigned int len)
>  		return NULL;
> =20
>  	if (fdt_version(fdt) >=3D 0x11)
> -		if (((offset + len) < offset)
> -		    || ((offset + len) > fdt_size_dt_struct(fdt)))
> +		if (((offset + len) < offset) ||
> +		    (fdt_version(fdt) >=3D 0x10 &&

This doesn't make sense - you're already guarded by an fdt_version > 0x11
above.

> +		     (offset + len) > fdt_size_dt_struct(fdt)))
>  			return NULL;
> =20
>  	return fdt_offset_ptr_(fdt, offset);
> @@ -123,6 +124,9 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
>  		/* skip-name offset, length and value */
>  		offset +=3D sizeof(struct fdt_property) - FDT_TAGSIZE
>  			+ fdt32_to_cpu(*lenp);
> +		if (fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >=3D 8 &&
> +		    ((offset - fdt32_to_cpu(*lenp)) % 8) !=3D 0)
> +			offset +=3D 4;
>  		break;
> =20
>  	case FDT_END:
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index ce17814..d011bd3 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -58,9 +58,10 @@
>  static int fdt_nodename_eq_(const void *fdt, int offset,
>  			    const char *s, int len)
>  {
> -	const char *p =3D fdt_offset_ptr(fdt, offset + FDT_TAGSIZE, len+1);
> +	int olen;
> +	const char *p =3D fdt_get_name(fdt, offset, &olen);
> =20
> -	if (!p)
> +	if (!p || olen < len)
>  		/* short match */
>  		return 0;
> =20
> @@ -233,16 +234,31 @@ int fdt_path_offset(const void *fdt, const char *pa=
th)
>  const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
>  {
>  	const struct fdt_node_header *nh =3D fdt_offset_ptr_(fdt, nodeoffset);
> +	const char *nameptr;
>  	int err;
> =20
>  	if (((err =3D fdt_check_header(fdt)) !=3D 0)
>  	    || ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0))
>  			goto fail;
> =20
> +	nameptr =3D nh->name;
> +
> +	if (fdt_version(fdt) < 0x10 && nodeoffset !=3D 0) {
> +		/*
> +		 * For old FDT versions, match the naming conventions of V16:
> +		 * give only the leaf name (after all /) except for the=20
> +		 * root node, where we should still return / rather than ""

What's the rationale for returning "/" rather than "" on the root
node?  a V16 file will return "", typically.

> +		 */
> +		const char *leaf;
> +		leaf =3D strrchr(nameptr, '/');
> +		if (leaf !=3D NULL)
> +			nameptr =3D leaf+1;

If leaf is NULL (no '/') I think that indicates a badly formed V3 or
less tree, the full path should already have at least one /.

> +	}
> +
>  	if (len)
> -		*len =3D strlen(nh->name);
> +		*len =3D strlen(nameptr);
> =20
> -	return nh->name;
> +	return nameptr;
> =20
>   fail:
>  	if (len)
> @@ -268,9 +284,9 @@ int fdt_next_property_offset(const void *fdt, int off=
set)
>  	return nextprop_(fdt, offset);
>  }
> =20
> -const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
> -						      int offset,
> -						      int *lenp)
> +static const struct fdt_property *_fdt_get_property_by_offset(const void=
 *fdt,
> +						              int offset,
> +						              int *lenp)

I've been trying to get rid of symbols starting with _ since they're
technically reserved for the system and can cause problems in some
compilation environments.  Go to alternative is ending with a _ instead.

>  {
>  	int err;
>  	const struct fdt_property *prop;
> @@ -289,11 +305,35 @@ const struct fdt_property *fdt_get_property_by_offs=
et(const void *fdt,
>  	return prop;
>  }
> =20
> +const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
> +						      int offset,
> +						      int *lenp)
> +{
> +	/* Prior to version 16, properties may need realignment
> +	 * and this API does not work. fdt_getprop_*() will, however. */
> +
> +	if (fdt_version(fdt) < 0x10) {
> +		if (lenp)
> +			*lenp =3D -FDT_ERR_BADVERSION;
> +		return NULL;
> +	}
> +
> +	return _fdt_get_property_by_offset(fdt, offset, lenp);
> +}
> +
>  const struct fdt_property *fdt_get_property_namelen(const void *fdt,
>  						    int offset,
>  						    const char *name,
>  						    int namelen, int *lenp)
>  {
> +	/* Prior to version 16, properties may need realignment
> +	 * and this API does not work. fdt_getprop_*() will, however. */
> +	if (fdt_version(fdt) < 0x10) {
> +		if (lenp)
> +			*lenp =3D -FDT_ERR_BADVERSION;
> +		return NULL;
> +	}
> +
>  	for (offset =3D fdt_first_property_offset(fdt, offset);
>  	     (offset >=3D 0);
>  	     (offset =3D fdt_next_property_offset(fdt, offset))) {
> @@ -324,12 +364,33 @@ const struct fdt_property *fdt_get_property(const v=
oid *fdt,
>  const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
>  				const char *name, int namelen, int *lenp)
>  {
> -	const struct fdt_property *prop;
> +	const struct fdt_property *prop =3D NULL;
> +	int offset =3D nodeoffset;
> =20
> -	prop =3D fdt_get_property_namelen(fdt, nodeoffset, name, namelen, lenp);

Couldn't you use an fdt_get_property_namelen_() here instead of having
to duplicate most of its logic.

> -	if (!prop)
> +	for (offset =3D fdt_first_property_offset(fdt, offset);
> +	     (offset >=3D 0);
> +	     (offset =3D fdt_next_property_offset(fdt, offset))) {



> +		if (!(prop =3D _fdt_get_property_by_offset(fdt, offset, lenp))) {
> +			if (lenp)
> +				*lenp =3D -FDT_ERR_INTERNAL;
> +			return NULL;
> +		}
> +
> +		if (fdt_string_eq_(fdt, fdt32_to_cpu(prop->nameoff),
> +				   name, namelen))
> +			break;
> +	}
> +
> +	if (lenp && offset < 0)
> +		*lenp =3D offset;
> +
> +	if (!prop || offset < 0)
>  		return NULL;
> =20
> +	/* Handle realignment */
> +	if (fdt_version(fdt) < 0x10 && (offset + sizeof(*prop)) % 8 &&
> +	    fdt32_to_cpu(prop->len) >=3D 8)
> +		return prop->data + 4;
>  	return prop->data;
>  }
> =20
> @@ -338,11 +399,15 @@ const void *fdt_getprop_by_offset(const void *fdt, =
int offset,
>  {
>  	const struct fdt_property *prop;
> =20
> -	prop =3D fdt_get_property_by_offset(fdt, offset, lenp);
> +	prop =3D _fdt_get_property_by_offset(fdt, offset, lenp);
>  	if (!prop)
>  		return NULL;
>  	if (namep)
>  		*namep =3D fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
> +
> +	if (fdt_version(fdt) < 0x10 && (offset + sizeof(*prop)) % 8 &&
> +	    fdt32_to_cpu(prop->len) >=3D 8)
> +		return prop->data + 4;
>  	return prop->data;
>  }
> =20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index baa882c..7ac3e8a 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -54,7 +54,7 @@
>  #include <libfdt_env.h>
>  #include <fdt.h>
> =20
> -#define FDT_FIRST_SUPPORTED_VERSION	0x10
> +#define FDT_FIRST_SUPPORTED_VERSION	0x02
>  #define FDT_LAST_SUPPORTED_VERSION	0x11
> =20
>  /* Error codes: informative error codes */
> @@ -526,6 +526,9 @@ int fdt_next_property_offset(const void *fdt, int off=
set);
>   * fdt_property structure within the device tree blob at the given
>   * offset.  If lenp is non-NULL, the length of the property value is
>   * also returned, in the integer pointed to by lenp.
> + *=20
> + * Note that this code only works on device tree versions >=3D 16. fdt_g=
etprop()
> + * works on all versions.
>   *
>   * returns:
>   *	pointer to the structure representing the property

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8tIZwPmdq+hd82jQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpgKZUACgkQbDjKyiDZ
s5Ia6g//W7dnKzB7URmc5K+tfvI9SBZLPLgpdlcT1v43oyOlLsNjTOtjl7Alc6Ur
uGlHU5WuWRZBZfH4XvxTab+1s459subSSAekzCq9rgx2gGa6r8VltuJdcy90OOcp
pPHpS1Dc8RXWpBQ48txh0otrsket4fw4pVHz2vh9sVj5n/61YfFu0L7NcSaNNCsK
wgXRmzYunPi26pf9I2G+cY11ySREy1o1XeO+igafjV06vHcQ8XRSwQ2WSUcHiCQg
UUzLLsMg44fV2mdTYvC3C/wZKHE/5Y6rRyP6gg9MrbHvaxEgYIwLY2TiZl7+dJAw
oJ+3n028RDyyIWJt4ip9ymuYSN7ff/tZ6NAYitWT5z0Ek2VhbLvKNTTxvDvUqk1i
LoItFJAG0NLtHPrRbnU6fE2zkkV5giZGomIvML+zeJNgibgudzBoUdPWXLM/Kq6o
nEHY3KI9HlEs5Q/JxhOfGfZNm4fnxlyD0Zpw2WmH+cr2JP2VwnIo+cm83y7L6chY
kQu25mZjxZRZoGM25YK0HwU7OB7JTsyZNIcfae0Z9emB6wQNZj6fQ62Sqy1jK2TX
QYQwBiEPsEfj7TrfBHMV8qUYs8Z/5WsogcGXucAFY1nR5uLV8u4wUTA25bgv4DG1
TIGqOxcMP2T8CSqAH6wPlgnessDjoVlB+2e8P5c/KVFPOZBFS7k=
=ce8S
-----END PGP SIGNATURE-----

--8tIZwPmdq+hd82jQ--
