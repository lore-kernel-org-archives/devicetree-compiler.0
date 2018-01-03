From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Add limited read-only support for older (V2 and V3)
 device tree to libfdt.
Date: Wed, 3 Jan 2018 11:40:27 +1100
Message-ID: <20180103004027.GI24581@umbus.fritz.box>
References: <20171208063149.76523-1-nwhitehorn@freebsd.org>
 <9c383dc9-c8c2-2b65-b527-ffc9b922b7dc@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8/UBlNHSEJa6utmr"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1514940588;
        bh=C5tJrR1NIZYA1jEOANCKhpTfJ4HYq6fmRQpiXwckp6I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aivGR6oNPPB/d9RtIG7lx5PPzCQ7vqEDe4cxjElcR1svrAPzP1pxVfhE/Ku4JIYRV
         H1cJVIK+DXWz3IPv+AKYHRBjaZH0yoJW9uZdRshCbH+sm+EFTREO124vGddPhCpwqn
         5oinH6xB0s5TVYktMfFMrcM+WljizIN74NV1P0/8=
Content-Disposition: inline
In-Reply-To: <9c383dc9-c8c2-2b65-b527-ffc9b922b7dc-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--8/UBlNHSEJa6utmr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2017 at 10:12:04AM -0800, Nathan Whitehorn wrote:
> Has anyone had a chance to look at this? We need it, or something like it,
> to support some older firmwares with the FreeBSD kernel and I would like =
to
> make sure that our copy of libfdt does not diverge from upstream.

Sorry, I've been busy and haven't had a chance to look at it.  I
haven't forgotten..

>=20
> Thanks,
> Nathan
>=20
> On 12/07/17 22:31, Nathan Whitehorn wrote:
> > This can be useful in particular in the kernel when booting on systems
> > with FDT-emitting firmware that is out of date. Releases of kexec-tools
> > on ppc64 prior to the end of 2014 are notable examples of such.
> >=20
> > Signed-off-by: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
> > ---
> >   fdtget.c        |  4 +--
> >   libfdt/fdt.c    |  8 ++++--
> >   libfdt/fdt_ro.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++++=
++-------
> >   libfdt/libfdt.h |  5 +++-
> >   4 files changed, 79 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/fdtget.c b/fdtget.c
> > index 6cc5242..34d8194 100644
> > --- a/fdtget.c
> > +++ b/fdtget.c
> > @@ -140,7 +140,6 @@ static int show_data(struct display_info *disp, con=
st char *data, int len)
> >    */
> >   static int list_properties(const void *blob, int node)
> >   {
> > -	const struct fdt_property *data;
> >   	const char *name;
> >   	int prop;
> > @@ -149,8 +148,7 @@ static int list_properties(const void *blob, int no=
de)
> >   		/* Stop silently when there are no more properties */
> >   		if (prop < 0)
> >   			return prop =3D=3D -FDT_ERR_NOTFOUND ? 0 : prop;
> > -		data =3D fdt_get_property_by_offset(blob, prop, NULL);
> > -		name =3D fdt_string(blob, fdt32_to_cpu(data->nameoff));
> > +		fdt_getprop_by_offset(blob, prop, &name, NULL);
> >   		if (name)
> >   			puts(name);
> >   		prop =3D fdt_next_property_offset(blob, prop);
> > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > index fd13236..e783e6a 100644
> > --- a/libfdt/fdt.c
> > +++ b/libfdt/fdt.c
> > @@ -84,8 +84,9 @@ const void *fdt_offset_ptr(const void *fdt, int offse=
t, unsigned int len)
> >   		return NULL;
> >   	if (fdt_version(fdt) >=3D 0x11)
> > -		if (((offset + len) < offset)
> > -		    || ((offset + len) > fdt_size_dt_struct(fdt)))
> > +		if (((offset + len) < offset) ||
> > +		    (fdt_version(fdt) >=3D 0x10 &&
> > +		     (offset + len) > fdt_size_dt_struct(fdt)))
> >   			return NULL;
> >   	return fdt_offset_ptr_(fdt, offset);
> > @@ -123,6 +124,9 @@ uint32_t fdt_next_tag(const void *fdt, int startoff=
set, int *nextoffset)
> >   		/* skip-name offset, length and value */
> >   		offset +=3D sizeof(struct fdt_property) - FDT_TAGSIZE
> >   			+ fdt32_to_cpu(*lenp);
> > +		if (fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) > 8 &&
> > +		    ((offset - fdt32_to_cpu(*lenp)) % 8) !=3D 0)
> > +			offset +=3D 4;
> >   		break;
> >   	case FDT_END:
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index ce17814..025dd0f 100644
> > --- a/libfdt/fdt_ro.c
> > +++ b/libfdt/fdt_ro.c
> > @@ -233,16 +233,26 @@ int fdt_path_offset(const void *fdt, const char *=
path)
> >   const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
> >   {
> >   	const struct fdt_node_header *nh =3D fdt_offset_ptr_(fdt, nodeoffset=
);
> > +	const char *nameptr;
> >   	int err;
> >   	if (((err =3D fdt_check_header(fdt)) !=3D 0)
> >   	    || ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0))
> >   			goto fail;
> > +	nameptr =3D nh->name;
> > +
> > +	if (fdt_version(fdt) < 0x10) {
> > +		const char *leaf;
> > +		leaf =3D strrchr(nameptr, '/');
> > +		if (leaf !=3D NULL)
> > +			nameptr =3D leaf+1;
> > +	}
> > +
> >   	if (len)
> > -		*len =3D strlen(nh->name);
> > +		*len =3D strlen(nameptr);
> > -	return nh->name;
> > +	return nameptr;
> >    fail:
> >   	if (len)
> > @@ -268,9 +278,9 @@ int fdt_next_property_offset(const void *fdt, int o=
ffset)
> >   	return nextprop_(fdt, offset);
> >   }
> > -const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
> > -						      int offset,
> > -						      int *lenp)
> > +static const struct fdt_property *_fdt_get_property_by_offset(const vo=
id *fdt,
> > +						              int offset,
> > +						              int *lenp)
> >   {
> >   	int err;
> >   	const struct fdt_property *prop;
> > @@ -289,11 +299,35 @@ const struct fdt_property *fdt_get_property_by_of=
fset(const void *fdt,
> >   	return prop;
> >   }
> > +const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
> > +						      int offset,
> > +						      int *lenp)
> > +{
> > +	/* Prior to version 16, properties may need realignment
> > +	 * and this API does not work. fdt_getprop_*() will, however. */
> > +
> > +	if (fdt_version(fdt) < 0x10) {
> > +		if (lenp)
> > +			*lenp =3D -FDT_ERR_BADVERSION;
> > +		return NULL;
> > +	}
> > +
> > +	return _fdt_get_property_by_offset(fdt, offset, lenp);
> > +}
> > +
> >   const struct fdt_property *fdt_get_property_namelen(const void *fdt,
> >   						    int offset,
> >   						    const char *name,
> >   						    int namelen, int *lenp)
> >   {
> > +	/* Prior to version 16, properties may need realignment
> > +	 * and this API does not work. fdt_getprop_*() will, however. */
> > +	if (fdt_version(fdt) < 0x10) {
> > +		if (lenp)
> > +			*lenp =3D -FDT_ERR_BADVERSION;
> > +		return NULL;
> > +	}
> > +
> >   	for (offset =3D fdt_first_property_offset(fdt, offset);
> >   	     (offset >=3D 0);
> >   	     (offset =3D fdt_next_property_offset(fdt, offset))) {
> > @@ -324,12 +358,33 @@ const struct fdt_property *fdt_get_property(const=
 void *fdt,
> >   const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
> >   				const char *name, int namelen, int *lenp)
> >   {
> > -	const struct fdt_property *prop;
> > +	const struct fdt_property *prop =3D NULL;
> > +	int offset =3D nodeoffset;
> > -	prop =3D fdt_get_property_namelen(fdt, nodeoffset, name, namelen, len=
p);
> > -	if (!prop)
> > +	for (offset =3D fdt_first_property_offset(fdt, offset);
> > +	     (offset >=3D 0);
> > +	     (offset =3D fdt_next_property_offset(fdt, offset))) {
> > +		if (!(prop =3D _fdt_get_property_by_offset(fdt, offset, lenp))) {
> > +			if (lenp)
> > +				*lenp =3D -FDT_ERR_INTERNAL;
> > +			return NULL;
> > +		}
> > +
> > +		if (fdt_string_eq_(fdt, fdt32_to_cpu(prop->nameoff),
> > +				   name, namelen))
> > +			break;
> > +	}
> > +
> > +	if (lenp && offset < 0)
> > +		*lenp =3D offset;
> > +
> > +	if (!prop || offset < 0)
> >   		return NULL;
> > +	/* Handle realignment */
> > +	if (fdt_version(fdt) < 0x10 && (offset + sizeof(*prop)) % 8 &&
> > +	    fdt32_to_cpu(prop->len) > 8)
> > +		return prop->data + 4;
> >   	return prop->data;
> >   }
> > @@ -338,11 +393,15 @@ const void *fdt_getprop_by_offset(const void *fdt=
, int offset,
> >   {
> >   	const struct fdt_property *prop;
> > -	prop =3D fdt_get_property_by_offset(fdt, offset, lenp);
> > +	prop =3D _fdt_get_property_by_offset(fdt, offset, lenp);
> >   	if (!prop)
> >   		return NULL;
> >   	if (namep)
> >   		*namep =3D fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
> > +
> > +	if (fdt_version(fdt) < 0x10 && (offset + sizeof(*prop)) % 8 &&
> > +	    fdt32_to_cpu(prop->len) > 8)
> > +		return prop->data + 4;
> >   	return prop->data;
> >   }
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index baa882c..7ac3e8a 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -54,7 +54,7 @@
> >   #include <libfdt_env.h>
> >   #include <fdt.h>
> > -#define FDT_FIRST_SUPPORTED_VERSION	0x10
> > +#define FDT_FIRST_SUPPORTED_VERSION	0x02
> >   #define FDT_LAST_SUPPORTED_VERSION	0x11
> >   /* Error codes: informative error codes */
> > @@ -526,6 +526,9 @@ int fdt_next_property_offset(const void *fdt, int o=
ffset);
> >    * fdt_property structure within the device tree blob at the given
> >    * offset.  If lenp is non-NULL, the length of the property value is
> >    * also returned, in the integer pointed to by lenp.
> > + *
> > + * Note that this code only works on device tree versions >=3D 16. fdt=
_getprop()
> > + * works on all versions.
> >    *
> >    * returns:
> >    *	pointer to the structure representing the property
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8/UBlNHSEJa6utmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpMJnsACgkQbDjKyiDZ
s5IERRAAvWEEz3QPspVmjz8aOkBVKlid1ndoczWbhW8VoBMEOJvLc4sPpeEPSHKl
7z6cbSP9dTyVZ/3XjqylHjTnsy6avAuWeRFuzcxOE0v4Z49gygYPZKwOJobEH4u/
DyzkKc5GsqKyr6V/C47ClJ+gFdB4eHQajicQUIJQIbvauvDQSzjWno85sVH4nCm3
BS/yNMGt5h5MZSchEkFJ7B9FvADQ4Bjm0TPfQSdi1HHXOj3hujCvfpm9ZAhjII8K
pglANuBpa6SPu6wYU2mqDsOUyfaG/vucSXL2RNp6FTZtNQ60YnwB+0G1EZ+YK5s2
m5hMVTGGoNn5qBZprP0EH2IupByM/5orVbnE2QJWOJTTzm3PLag2mGXan8EdHY86
MvjHoQN6HKE8KEnfUezj1JXXtnyLgx7lTQz9/5fOZOaDN6se1n0ZqYEuVIXZ+mW7
bCSY2dy0w7bkoDrUnJwMbFmHOq1FLuu18O7NM/AngNFK0L8VocBaa4pWyEGmfMH7
ciz2BaD51NGfYHwGLsU4UlsoR/zK2BDwHQClcYKTB47zdHyqSrrpYcekqp/Rp8PX
sXxgCT1TYZZi+CswBc3L+3Kv8H/aqns73db6XlLRNHk8Z/onq2vlVc0/v6lJE3Mw
OuL/UIpSpaPvx61Dgul/M/7aHOjzpItPfPI/fw3v5ZR62EsLI6k=
=ilo7
-----END PGP SIGNATURE-----

--8/UBlNHSEJa6utmr--
