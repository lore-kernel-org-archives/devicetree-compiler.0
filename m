From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Microsoft Visual C patches
Date: Mon, 16 Jun 2014 20:46:28 +1000
Message-ID: <20140616104628.GB29264@voom.redhat.com>
References: <539DBFC8.4050204@errapartengineering.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <539DBFC8.4050204-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2014 at 06:46:16PM +0300, Andrei Errapart wrote:
> Hallo,
>=20
>=20
> The attached patches are the result of compiling the dtc with the Microso=
ft
> Visual C (MSVC) in order to be able to run the dtc under Microsoft
> Windows.

Ok, so, in order to apply these, I'll need them one by one, with their
own commit messages and Signed-off-by lines.

>=20
> Short descriptions of the patches:
> checks:		MSVC is unable to handle 0-sized array literals.
> fopen:		Binary files should be opened in binary mode.
> signed-char:	For MSVC, char defaults to signed char.
> dtc-header:
>   1) Variadic macro in the form "args..." is a GCC extension.
>   2) MSVC requires 0 to be present in a struct literal.
>=20
> On a Linux, all tests pass when these patches have been applied.
>=20
> We have been using the dtc on Windows computers for a few days and haven't
> had any problems so far. In the case people are interested in having the
> MSVC project file(s) and the few lightweight compatibility functions
> required for compilation, let me know and I can clean them up for public
> use.
>=20
>=20
> best regards,
> Andrei

> diff --git a/checks.c b/checks.c
> index 47eda65..cf07864 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -61,17 +61,19 @@ struct check {
>  #define CHECK_ENTRY(nm, tfn, nfn, pfn, d, w, e, ...)	       \
>  	static struct check *nm##_prereqs[] =3D { __VA_ARGS__ }; \
>  	static struct check nm =3D { \
> -		.name =3D #nm, \
> -		.tree_fn =3D (tfn), \
> -		.node_fn =3D (nfn), \
> -		.prop_fn =3D (pfn), \
> -		.data =3D (d), \
> -		.warn =3D (w), \
> -		.error =3D (e), \
> -		.status =3D UNCHECKED, \
> -		.num_prereqs =3D ARRAY_SIZE(nm##_prereqs), \
> -		.prereq =3D nm##_prereqs, \
> +		#nm, \
> +		(tfn), \
> +		(nfn), \
> +		(pfn), \
> +		(d), \
> +		(w), \
> +		(e), \
> +		UNCHECKED, \
> +		false, \
> +		ARRAY_SIZE(nm##_prereqs), \
> +		nm##_prereqs \

Um.. I don't see what removing the C99 initializers has to do with
MSVC not supporting 0 size arrays

>  	};
> +

Please don't include unrelated whitespace changes.

>  #define WARNING(nm, tfn, nfn, pfn, d, ...) \
>  	CHECK_ENTRY(nm, tfn, nfn, pfn, d, true, false, __VA_ARGS__)
>  #define ERROR(nm, tfn, nfn, pfn, d, ...) \
> @@ -153,7 +155,7 @@ static bool run_check(struct check *c, struct node *d=
t)
> =20
>  	c->inprogress =3D true;
> =20
> -	for (i =3D 0; i < c->num_prereqs; i++) {
> +	for (i =3D 0; i < c->num_prereqs && c->prereq[i]!=3DNULL; i++) {

Hrm.  I think I see what you're doing here, but it's kinda subtle.
Without a comment, I think someone's very likely to take it out again.

[snip]

> diff --git a/fstree.c b/fstree.c
> index 4d2791c..6d1beec 100644
> --- a/fstree.c
> +++ b/fstree.c
> @@ -52,7 +52,7 @@ static struct node *read_fstree(const char *dirname)
>  			struct property *prop;
>  			FILE *pfile;
> =20
> -			pfile =3D fopen(tmpname, "r");
> +			pfile =3D fopen(tmpname, "rb");
>  			if (! pfile) {
>  				fprintf(stderr,
>  					"WARNING: Cannot open %s: %s\n",
> diff --git a/srcpos.c b/srcpos.c
> index 4549773..f534c22 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -77,7 +77,7 @@ static char *try_open(const char *dirname, const char *=
fname, FILE **fp)
>  	else
>  		fullname =3D join_path(dirname, fname);
> =20
> -	*fp =3D fopen(fullname, "r");
> +	*fp =3D fopen(fullname, "rb");
>  	if (!*fp) {
>  		free(fullname);
>  		fullname =3D NULL;
> diff --git a/dtc.c b/dtc.c
> index d36ccdc..e3665b6 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -237,7 +237,7 @@ int main(int argc, char *argv[])
>  	if (streq(outname, "-")) {
>  		outf =3D stdout;
>  	} else {
> -		outf =3D fopen(outname, "w");
> +		outf =3D fopen(outname, "wb");
>  		if (! outf)
>  			die("Couldn't open output file %s: %s\n",
>  			    outname, strerror(errno));

The fopen() mode patch I'm happy to take once it's sent with its own
comment and signed-off-by lines.

> diff --git a/treesource.c b/treesource.c
> index bf7a626..2386b93 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -178,7 +178,7 @@ static void write_propval_bytes(FILE *f, struct data =
val)
>  			m =3D m->next;
>  		}
> =20
> -		fprintf(f, "%02hhx", *bp++);
> +		fprintf(f, "%02hhx", (unsigned char)(*bp++));
>  		if ((const void *)bp >=3D propend)
>  			break;
>  		fprintf(f, " ");

Likewise the unsigned char patch.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTnssEAAoJEGw4ysog2bOSYHUQAKDvpV5kAM5Yx4NIsl1aS+ey
d6rIgpI4ut5ICIyaqSqMiV/nHJWBL6bSEUtt0z6ayvaYT8c+24xp9MgCwl6d93vy
9Vu3IYYiNWSKSGAy5MRjnN5CP3cQzWFO0RaX2xYBeqxiQoZmb0RKnmpoYlByXFMg
rVSgMXhFDPBDnAXy4oVIs2Ir4gJ7Y39apYQEIpqHO6/VjVhYA0ZE8kGQHVAr80KV
WpIw8lY1wywXRzcgjbAP7mCxAo9Xpazap1UhwBsMRMAjjExinenkWl3UeXL2ML5S
7WbvX4D+o2xjRD7i+lUBKL68u2ad61/Itj2M+lR2ooTQDk/5/cM9JhduaJqdSEm5
QMHmuQnNFJfPirvbmHirtDIUxcayohtXQvr0j7iAUuCoCgFsSqMizgp4B4faBpcl
cpycFYLDGZz+ORclD+xnT7+P7KLtnepCNca9aJ0DBd5rbcBpGCOHMdT9UWf/1GAP
54EDHuRwpJ3uAPEbTtASeFS7nYcY82GHjPMqfPOY+KFZWMCcpG1bHTUFsARL87pc
Cuwl2UjKsakbnxsG2Qq91qUW812q6kgpti8ByKkvLu4o0mvOdb02tNpWrbHi72Lu
b5XkEMz6zqcp/64xNGFCzSHYxdMTbbl0ix+TPO7jElitylPT/UsrDcSnaEptgQV0
JbYsY3m3kiPwqj7nRjOk
=88ln
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
