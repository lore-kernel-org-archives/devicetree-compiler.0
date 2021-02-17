From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [DTC][RFC] dtc: Allow better error reporting
Date: Wed, 17 Feb 2021 16:07:41 +1100
Message-ID: <YCyknRMDNA4+pd59@yekko.fritz.box>
References: <3950d7da35130a850ba9217ac7bfef781fa850b2.1613042485.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XkJ2NX5rmQz4V+jo"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1613538693;
        bh=ogRw4W9VqrP3kCSzeO/moSzBNo/9XFyDbR/eUkVfVoU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W9aShvo5lTEWweRLk2imNmFmxb+lpTYpZYJTwL9phmCSz6K69rwW9YH0jPRuhf3Bz
         UdEPG2IsBcA5QeMVffn0Jy77CHf9qds8wIQSh4fszI6NS+yPks4aEUNJvSj6gzlyg4
         DAFmyVIWFYTBH24nH4YLAhJ/gibomtwe4ThoHF2M=
Content-Disposition: inline
In-Reply-To: <3950d7da35130a850ba9217ac7bfef781fa850b2.1613042485.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bill Mills <bill.mills-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--XkJ2NX5rmQz4V+jo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 04:57:21PM +0530, Viresh Kumar wrote:
> The dtc tool doesn't do very elaborate error reporting to keep the size
> of the executables small enough for all kind of applications.

dtc itself does plenty of error reporting, it's just libfdt that tries
to keep things minimal.

> This patch tries to provide a way to do better error reporting, without
> increasing the size of the executables for such cases (where we don't
> want elaborate error reporting).
>=20
> The error reporting will only be enabled if 'VERBOSE' (as -DVERBOSE)
> flag is passed during compilation of the tools.
>=20
> This also updates the fdtoverlay tool to do better error reporting,
> which is required by the Linux Kernel for now.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> ---
> Hi David,
>=20
> Unfortunately I am not a core DT guy and don't understand most of the
> stuff going on here. I tried to do minimal changes to get more
> information out on errors and it may require someone who understands the
> code well to write better error logs.
>=20
> FWIW, I stumbled upon this because of the discussion that happened here:
>=20
> https://lore.kernel.org/lkml/74f8aa8f-ffab-3b0f-186f-31fb7395ebbb@gmail.c=
om/
>=20
> Thanks.
>=20
> ---
>  dtc.h                |   6 ++
>  fdtoverlay.c         |   1 +
>  libfdt/fdt_overlay.c | 156 ++++++++++++++++++++++++++++++++++---------
>  3 files changed, 132 insertions(+), 31 deletions(-)
>=20
> diff --git a/dtc.h b/dtc.h
> index d3e82fb8e3db..b8ffec155263 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -29,6 +29,12 @@
>  #define debug(...)
>  #endif
> =20
> +#ifdef VERBOSE
> +#define dtc_err(fmt, ...)	fprintf(stderr, "DTC: %s: %d: " fmt, __func__,=
 __LINE__, ##__VA_ARGS__)
> +#else
> +#define dtc_err(fmt, ...)
> +#endif

Actually, the natural way to handle this is to make dtc_err() -
hrm... bad name, since this is libfdt - be something that must be
provided by libfdt_env.h.  The default version would have it be a
no-op, with a define that makes it use stdio.

This has the additional advantage that it would be relatively
straightfoward to enable the rich reporting in a non-POSIXish
environment (these should provide their own libfdt_env.h and it can
implement the error reporting callback in a way that makes sense in
that environment.

You will also definitely need Makefile changes, because you'll need to
make the fdtoverlay binary link to the verbose-compiled version of
libfdt not the normal one.

Except.... it might make more sense to do this in dtc rather than
libfdt, more on that in different mails.

> +
>  #define DEFAULT_FDT_VERSION	17
> =20
>  /*
> diff --git a/fdtoverlay.c b/fdtoverlay.c
> index 5350af65679f..5f60ce4e4cea 100644
> --- a/fdtoverlay.c
> +++ b/fdtoverlay.c
> @@ -16,6 +16,7 @@
> =20
>  #include <libfdt.h>
> =20
> +#include "dtc.h"
>  #include "util.h"
> =20
>  #define BUF_INCREMENT	65536
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index d217e79b6722..b24286ac8c6c 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -10,6 +10,7 @@
>  #include <libfdt.h>
> =20
>  #include "libfdt_internal.h"
> +#include "../dtc.h"

Yeah, the libfdt code can't include dtc.h.

> =20
>  /**
>   * overlay_get_target_phandle - retrieves the target phandle of a fragme=
nt
> @@ -160,12 +161,16 @@ static int overlay_adjust_node_phandles(void *fdto,=
 int node,
>  	int ret;
> =20
>  	ret =3D overlay_phandle_add_offset(fdto, node, "phandle", delta);
> -	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> +	if (ret && ret !=3D -FDT_ERR_NOTFOUND) {
> +		dtc_err("Failed to add phandle offset (%d: %s)\n", node, fdt_strerror(=
ret));
>  		return ret;
> +	}
> =20
>  	ret =3D overlay_phandle_add_offset(fdto, node, "linux,phandle", delta);
> -	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> +	if (ret && ret !=3D -FDT_ERR_NOTFOUND) {
> +		dtc_err("Failed to add linux,phandle offset (%d: %s)\n", node, fdt_str=
error(ret));
>  		return ret;
> +	}
> =20
>  	fdt_for_each_subnode(child, fdto, node) {
>  		ret =3D overlay_adjust_node_phandles(fdto, child, delta);
> @@ -239,12 +244,17 @@ static int overlay_update_local_node_references(voi=
d *fdto,
>  		if (!fixup_val)
>  			return fixup_len;
> =20
> -		if (fixup_len % sizeof(uint32_t))
> +		if (fixup_len % sizeof(uint32_t)) {
> +			dtc_err("Invalid fixup length\n");
>  			return -FDT_ERR_BADOVERLAY;
> +		}
>  		fixup_len /=3D sizeof(uint32_t);
> =20
>  		tree_val =3D fdt_getprop(fdto, tree_node, name, &tree_len);
>  		if (!tree_val) {
> +			dtc_err("Failed to get property: %s: %d\n", name,
> +				tree_len);
> +
>  			if (tree_len =3D=3D -FDT_ERR_NOTFOUND)
>  				return -FDT_ERR_BADOVERLAY;
> =20
> @@ -274,11 +284,17 @@ static int overlay_update_local_node_references(voi=
d *fdto,
>  								  poffset,
>  								  &adj_val,
>  								  sizeof(adj_val));
> -			if (ret =3D=3D -FDT_ERR_NOSPACE)
> +			if (ret =3D=3D -FDT_ERR_NOSPACE) {
> +				dtc_err("Failed to update property's name: %s\n",
> +					name);
>  				return -FDT_ERR_BADOVERLAY;
> +			}
> =20
> -			if (ret)
> +			if (ret) {
> +				dtc_err("Failed to update property's name: %s: %s\n",
> +					name, fdt_strerror(ret));
>  				return ret;
> +			}
>  		}
>  	}
> =20
> @@ -289,10 +305,16 @@ static int overlay_update_local_node_references(voi=
d *fdto,
> =20
>  		tree_child =3D fdt_subnode_offset(fdto, tree_node,
>  						fixup_child_name);
> -		if (tree_child =3D=3D -FDT_ERR_NOTFOUND)
> +		if (tree_child =3D=3D -FDT_ERR_NOTFOUND) {
> +			dtc_err("Failed to find subnode: %s\n",
> +				fixup_child_name);
>  			return -FDT_ERR_BADOVERLAY;
> -		if (tree_child < 0)
> +		}
> +		if (tree_child < 0) {
> +			dtc_err("Failed to find subnode: %s: %s\n",
> +				fixup_child_name, fdt_strerror(tree_child));
>  			return tree_child;
> +		}
> =20
>  		ret =3D overlay_update_local_node_references(fdto,
>  							   tree_child,
> @@ -332,6 +354,8 @@ static int overlay_update_local_references(void *fdto=
, uint32_t delta)
>  		if (fixups =3D=3D -FDT_ERR_NOTFOUND)
>  			return 0;
> =20
> +		dtc_err("Failed to find local_fixups (%s)\n",
> +			fdt_strerror(fixups));
>  		return fixups;
>  	}
> =20
> @@ -435,6 +459,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdt=
o, int symbols_off,
>  	value =3D fdt_getprop_by_offset(fdto, property,
>  				      &label, &len);
>  	if (!value) {
> +		dtc_err("Failed to get property by offset (%s)\n",
> +			fdt_strerror(len));
>  		if (len =3D=3D -FDT_ERR_NOTFOUND)
>  			return -FDT_ERR_INTERNAL;
> =20
> @@ -450,8 +476,10 @@ static int overlay_fixup_phandle(void *fdt, void *fd=
to, int symbols_off,
>  		int poffset, ret;
> =20
>  		fixup_end =3D memchr(value, '\0', len);
> -		if (!fixup_end)
> +		if (!fixup_end) {
> +			dtc_err("fixup_end can't be 0: %s: %s\n", value, label);
>  			return -FDT_ERR_BADOVERLAY;
> +		}
>  		fixup_len =3D fixup_end - fixup_str;
> =20
>  		len -=3D fixup_len + 1;
> @@ -459,32 +487,47 @@ static int overlay_fixup_phandle(void *fdt, void *f=
dto, int symbols_off,
> =20
>  		path =3D fixup_str;
>  		sep =3D memchr(fixup_str, ':', fixup_len);
> -		if (!sep || *sep !=3D ':')
> +		if (!sep || *sep !=3D ':') {
> +			dtc_err("Missing ':' separator: %s: %s\n", value,
> +				label);
>  			return -FDT_ERR_BADOVERLAY;
> +		}
> =20
>  		path_len =3D sep - path;
> -		if (path_len =3D=3D (fixup_len - 1))
> +		if (path_len =3D=3D (fixup_len - 1)) {
> +			dtc_err("Invalid path_len: %s: %s\n", value, label);
>  			return -FDT_ERR_BADOVERLAY;
> +		}
> =20
>  		fixup_len -=3D path_len + 1;
>  		name =3D sep + 1;
>  		sep =3D memchr(name, ':', fixup_len);
> -		if (!sep || *sep !=3D ':')
> +		if (!sep || *sep !=3D ':') {
> +			dtc_err("Missing ':' separator: %s: %s\n", value,
> +				label);
>  			return -FDT_ERR_BADOVERLAY;
> +		}
> =20
>  		name_len =3D sep - name;
> -		if (!name_len)
> +		if (!name_len) {
> +			dtc_err("name_len can't be 0: %s: %s\n", value, label);
>  			return -FDT_ERR_BADOVERLAY;
> +		}
> =20
>  		poffset =3D strtoul(sep + 1, &endptr, 10);
> -		if ((*endptr !=3D '\0') || (endptr <=3D (sep + 1)))
> +		if ((*endptr !=3D '\0') || (endptr <=3D (sep + 1))) {
> +			dtc_err("Invalid name string: %s: %s\n", value, label);
>  			return -FDT_ERR_BADOVERLAY;
> +		}
> =20
>  		ret =3D overlay_fixup_one_phandle(fdt, fdto, symbols_off,
>  						path, path_len, name, name_len,
>  						poffset, label);
> -		if (ret)
> +		if (ret) {
> +			dtc_err("failed to fixup one phandle: %s: %s: %s\n",
> +				value, label, fdt_strerror(ret));
>  			return ret;
> +		}
>  	} while (len > 0);
> =20
>  	return 0;
> @@ -516,13 +559,19 @@ static int overlay_fixup_phandles(void *fdt, void *=
fdto)
>  	fixups_off =3D fdt_path_offset(fdto, "/__fixups__");
>  	if (fixups_off =3D=3D -FDT_ERR_NOTFOUND)
>  		return 0; /* nothing to do */
> -	if (fixups_off < 0)
> +	if (fixups_off < 0) {
> +		dtc_err("Failed to get fixups offset (%s)\n",
> +			fdt_strerror(fixups_off));
>  		return fixups_off;
> +	}
> =20
>  	/* And base DTs without symbols */
>  	symbols_off =3D fdt_path_offset(fdt, "/__symbols__");
> -	if ((symbols_off < 0 && (symbols_off !=3D -FDT_ERR_NOTFOUND)))
> +	if ((symbols_off < 0 && (symbols_off !=3D -FDT_ERR_NOTFOUND))) {
> +		dtc_err("Failed to get symbols offset (%s)\n",
> +			fdt_strerror(symbols_off));
>  		return symbols_off;
> +	}
> =20
>  	fdt_for_each_property_offset(property, fdto, fixups_off) {
>  		int ret;
> @@ -633,16 +682,27 @@ static int overlay_merge(void *fdt, void *fdto)
>  		if (overlay =3D=3D -FDT_ERR_NOTFOUND)
>  			continue;
> =20
> -		if (overlay < 0)
> +		if (overlay < 0) {
> +			dtc_err("Failed to find __overlay__ tag (%d: %s)\n",
> +				fragment, fdt_strerror(overlay));
>  			return overlay;
> +		}
> =20
>  		target =3D overlay_get_target(fdt, fdto, fragment, NULL);
> -		if (target < 0)
> +		if (target < 0) {
> +			dtc_err("Failed to retrieve fragment's target (%d: %s)\n",
> +				fragment, fdt_strerror(target));
>  			return target;
> +		}
> =20
>  		ret =3D overlay_apply_node(fdt, target, fdto, overlay);
> -		if (ret)
> +		if (ret) {
> +			if (ret !=3D -FDT_ERR_NOSPACE) {
> +				dtc_err("Failed to apply overlay node (%d: %d: %s)\n",
> +					fragment, target, fdt_strerror(ret));
> +			}
>  			return ret;
> +		}
>  	}
> =20
>  	return 0;
> @@ -718,24 +778,35 @@ static int overlay_symbol_update(void *fdt, void *f=
dto)
>  		root_sym =3D fdt_add_subnode(fdt, 0, "__symbols__");
> =20
>  	/* any error is fatal now */
> -	if (root_sym < 0)
> +	if (root_sym < 0) {
> +		dtc_err("Failed to get root __symbols__ (%s)\n",
> +			fdt_strerror(root_sym));
>  		return root_sym;
> +	}
> =20
>  	/* iterate over each overlay symbol */
>  	fdt_for_each_property_offset(prop, fdto, ov_sym) {
>  		path =3D fdt_getprop_by_offset(fdto, prop, &name, &path_len);
> -		if (!path)
> +		if (!path) {
> +			dtc_err("Failed to get prop by offset (%s)\n",
> +				fdt_strerror(path_len));
>  			return path_len;
> +		}
> =20
>  		/* verify it's a string property (terminated by a single \0) */
> -		if (path_len < 1 || memchr(path, '\0', path_len) !=3D &path[path_len -=
 1])
> +		if (path_len < 1 || memchr(path, '\0', path_len) !=3D &path[path_len -=
 1]) {
> +			dtc_err("Invalid property (%d)\n", path_len);
>  			return -FDT_ERR_BADVALUE;
> +		}
> =20
>  		/* keep end marker to avoid strlen() */
>  		e =3D path + path_len;
> =20
> -		if (*path !=3D '/')
> +		if (*path !=3D '/') {
> +			dtc_err("Path should start with '/' (%s : %s)\n", path,
> +				name);
>  			return -FDT_ERR_BADVALUE;
> +		}
> =20
>  		/* get fragment name first */
>  		s =3D strchr(path + 1, '/');
> @@ -769,26 +840,38 @@ static int overlay_symbol_update(void *fdt, void *f=
dto)
>  		ret =3D fdt_subnode_offset_namelen(fdto, 0, frag_name,
>  					       frag_name_len);
>  		/* not found? */
> -		if (ret < 0)
> +		if (ret < 0) {
> +			dtc_err("Failed to find fragment index (%s: %s: %d)\n",
> +				path, frag_name, ret);
>  			return -FDT_ERR_BADOVERLAY;
> +		}
>  		fragment =3D ret;
> =20
>  		/* an __overlay__ subnode must exist */
>  		ret =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
> -		if (ret < 0)
> +		if (ret < 0) {
> +			dtc_err("Failed to find __overlay__ subnode (%s: %s: %d)\n",
> +				path, frag_name, ret);
>  			return -FDT_ERR_BADOVERLAY;
> +		}
> =20
>  		/* get the target of the fragment */
>  		ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			dtc_err("Failed to get target for the fragment (%s: %s: %d)\n",
> +				path, frag_name, ret);
>  			return ret;
> +		}
>  		target =3D ret;
> =20
>  		/* if we have a target path use */
>  		if (!target_path) {
>  			ret =3D get_path_len(fdt, target);
> -			if (ret < 0)
> +			if (ret < 0) {
> +				dtc_err("Failed to get path length (%s: %s: %d)\n",
> +					path, name, ret);
>  				return ret;
> +			}
>  			len =3D ret;
>  		} else {
>  			len =3D strlen(target_path);
> @@ -796,14 +879,20 @@ static int overlay_symbol_update(void *fdt, void *f=
dto)
> =20
>  		ret =3D fdt_setprop_placeholder(fdt, root_sym, name,
>  				len + (len > 1) + rel_path_len + 1, &p);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			dtc_err("Failed to set prop placeholder (%s: %s: %d)\n",
> +				path, name, ret);
>  			return ret;
> +		}
> =20
>  		if (!target_path) {
>  			/* again in case setprop_placeholder changed it */
>  			ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);
> -			if (ret < 0)
> +			if (ret < 0) {
> +				dtc_err("Failed to get target (%s: %s: %d)\n",
> +					path, name, ret);
>  				return ret;
> +			}
>  			target =3D ret;
>  		}
> =20
> @@ -811,8 +900,11 @@ static int overlay_symbol_update(void *fdt, void *fd=
to)
>  		if (len > 1) { /* target is not root */
>  			if (!target_path) {
>  				ret =3D fdt_get_path(fdt, target, buf, len + 1);
> -				if (ret < 0)
> +				if (ret < 0) {
> +					dtc_err("Failed to get target path (%s: %s: %d)\n",
> +						path, name, ret);
>  					return ret;
> +				}
>  			} else
>  				memcpy(buf, target_path, len + 1);
> =20
> @@ -836,8 +928,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
>  	FDT_RO_PROBE(fdto);
> =20
>  	ret =3D fdt_find_max_phandle(fdt, &delta);
> -	if (ret)
> +	if (ret) {
> +		dtc_err("Failed to find max phandle (%s)\n", fdt_strerror(ret));
>  		goto err;
> +	}
> =20
>  	ret =3D overlay_adjust_local_phandles(fdto, delta);
>  	if (ret)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XkJ2NX5rmQz4V+jo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAspJoACgkQbDjKyiDZ
s5IxYQ/+Nqassad6lcnuPbAxriVhxSvqiYEOsxTjWkSBc8sGYGzGAZytLOdZJdBU
oEunr8WUiG+5McPA2Zh2wSoiNIbRVIPoWd5zy8OrK6YARojhuSsYlKZV9ztaX/d0
3BcmYK1EzsywK8gybhGD+iFjuZhLVIUrOUF8DHNRLJbt31UOcY6PTpDbxSLYy4s+
YCqagzKuzDSjM7U1mlyuyWQ/Px7w6uj/48J66bFRbPjRSAXfR9O0gwmlKK1vpPVL
POpLxwqVUAIqivyHUOmivyvpp7mFMewpiWTF25GG9LO1vwCZXfaH7lL5Rq44OWwU
cFITLfTB+GRsedhv6H+ok/gSQP6ftaAWgQWrqvUrbOGI6SQVIeKOjG/jsMR3tH1I
xe7VZB/n+AsRlTtXVDvK79t8BV0nnuv3vP1UxehdPN8Vq9QBJpr7E5oIqoO3uY4M
wcthVbmkDE6EnU/9Wp0XYzel2IEiXKXoxFrqaooEMLH4Hk0Uu5256M1ujPQMrlXE
57Soa8f97ZxmCVvUnqz7ZK5uaox9s+1a1oHGPC4s8yBHLTnXltW3JvRFTYtgL+Bn
XS9fPJFqy94At5lhz0bFD+Rta0YUGZ9ykkXjiUdiYHpSZAlI+Y+ldx8/C0VDcCNb
pddGuUMY5NZRwjb0dyavJCn2JeLdYVD+G1r9V0vHuhn34NeFNo8=
=0SFU
-----END PGP SIGNATURE-----

--XkJ2NX5rmQz4V+jo--
