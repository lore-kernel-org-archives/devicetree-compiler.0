From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: fdt_path_offset_*(): Fix handling of paths with
 options in them
Date: Fri, 29 May 2015 22:26:05 +1000
Message-ID: <20150529122605.GC3664@voom.fritz.box>
References: <1432213252-30292-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432213252-30292-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2015 at 03:00:52PM +0200, Hans de Goede wrote:
> This is another approach at fixing the issues with paths with have options
> appended seperated by a ':' character.
>=20
> commit b4150b59ae ("libfdt: Add fdt_path_offset_namelen()")
>=20
> Is related to this, it allows the caller to specify to only look at part
> of the passed in path. But as experience with using this in the kernel has
> shown using this properly is quite hard since the options itself may have
> a '/' in them, also see the comment above the new fdt_path_next_seperator
> helper this commit adds.
>=20
> So this commit, which currently is being used by u-boot, instead simply
> teaches fdt_path_offset() to just do the right thing when it encounters
> paths with a ':' in them.

I dislike this - it's building into the core path handling something
related to how external things happen to glue extra options on there.

I also don't see why it's necessary.  ':' shouldn't appear in paths,
so why can't you just strchr() for the first ':', pass the first path
to path_offset_namelen, and the last part to your option parsing code?
>=20
> Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  libfdt/fdt_ro.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index a65e4b5..9efbcb2 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -154,6 +154,25 @@ int fdt_subnode_offset(const void *fdt, int parentof=
fset,
>  	return fdt_subnode_offset_namelen(fdt, parentoffset, name, strlen(name)=
);
>  }
> =20
> +/*
> + * Find the next of path seperator, note we need to search for both '/' =
and ':'
> + * and then take the first one so that we do the rigth thing for e.g.
> + * "foo/bar:option" and "bar:option/otheroption", both of which happen, =
so
> + * first searching for either ':' or '/' does not work.
> + */
> +static const char *fdt_path_next_seperator(const char *path, int len)
> +{
> +	const char *sep1 =3D memchr(path, '/', len);
> +	const char *sep2 =3D memchr(path, ':', len);
> +
> +	if (sep1 && sep2)
> +		return (sep1 < sep2) ? sep1 : sep2;
> +	else if (sep1)
> +		return sep1;
> +	else
> +		return sep2;
> +}
> +
>  int fdt_path_offset_namelen(const void *fdt, const char *path, int namel=
en)
>  {
>  	const char *end =3D path + namelen;
> @@ -164,7 +183,7 @@ int fdt_path_offset_namelen(const void *fdt, const ch=
ar *path, int namelen)
> =20
>  	/* see if we have an alias */
>  	if (*path !=3D '/') {
> -		const char *q =3D memchr(path, '/', end - p);
> +		const char *q =3D fdt_path_next_seperator(path, end - p);
> =20
>  		if (!q)
>  			q =3D end;
> @@ -182,10 +201,10 @@ int fdt_path_offset_namelen(const void *fdt, const =
char *path, int namelen)
> =20
>  		while (*p =3D=3D '/') {
>  			p++;
> -			if (p =3D=3D end)
> +			if (p =3D=3D end || *p =3D=3D ':')
>  				return offset;
>  		}
> -		q =3D memchr(p, '/', end - p);
> +		q =3D fdt_path_next_seperator(p, end - p);
>  		if (! q)
>  			q =3D end;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVaFrdAAoJEGw4ysog2bOSVmUP/0veDB8+k0yBoA0JmO5sRSeu
NctV0GiBkYiSJOW5urGPgVTgl5WT6JtSvTjmbvyB2BZ44IDKinSnByP7lYKLI0Zc
vDptL4wRw+PpkmT0anF3ZbBvhE7A2q7YvNwRYVg2dulmUH6eXTUFqWBrtmHZC6Jj
6xBoTvEm7MPPo1JmP5rgDeUhVtmLIi8hf/tLozm4Vpd5DzOeoc2vPH0WtSBK1a9A
D2fr0RJjXAyvBCSu5RnYFsILewVANBzg8FZBDoGlRlX6MER/KQH8+jGVwY2fuXHX
6omCD/kFdi7Qe7d1Hk2/gVXkjWkPulrOiXEUjgV7X5janu/5GFbrhcnWsbXJcdl+
pDag/TqgzPROdyhayt+CsoUVqaouuv4W89XfK2DRyjGEOKPp+YSy+JaD1sd9zyIb
vvjWimIdstjXHHJikEcGdfFzrHVAHmepOAMIVJxuyGshftlQrsYWb4D7DNoo3lAx
wT8WrP59D2nVXDttVOFj21HTMgMt4Hm5DUV2zh0dnHiPMcuByW2g7O4u1NW5qWBk
wbCYwvB9dKXKDdVBRqJ1x/V361YIpY7oEBq4YB0DhRBtkb4yJ5CtxEtL09+DvQyk
PqKXoxJ5tMH1rtSmgNg1+fuY4hUi2s1EqO5WYsSCXw93pT0KP+IQ82ZhwpxiUDWx
Abs4AdmegTyGBZ+tX9U5
=HBQa
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
