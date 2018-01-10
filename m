From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/5] annotations: shorten file names
Date: Wed, 10 Jan 2018 16:44:10 +1100
Message-ID: <20180110054410.GF19773@umbus.fritz.box>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
 <1515418607-26764-5-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5Mfx4RzfBqgnTE/w"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515563070;
        bh=Krnax9QVJX3JVDdGobV0yw9q2cLsxGfUc0Q7z9VpkJ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mfQKyhX39Y1GbCejZXZGkjq31LlbA3aORKDfUd/c3xVyyjvTC55NKp18iKIxtMZLm
         oFO7Kz6MY22e/zqeQ9VRcXMf26Bii2H3RRppJyPXYnFzRBHHjUEiEO2KxnFx1Y0ltL
         vOw/YKHzMTCC+YQVJbokBccoFShZNHD3BA1w9Y2s=
Content-Disposition: inline
In-Reply-To: <1515418607-26764-5-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--5Mfx4RzfBqgnTE/w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2018 at 02:36:46PM +0100, Julia Lawall wrote:
1;5002;0c> The file name provided on the command line is represented by its
> basename only.  Other names are represented as relative offsets from the
> directory of the starting one.
>=20
> This has to be adapted in the case of files on which cpp has been run
> first.  In that case, at least when using scripts/dtc/dtx_diff from the
> Linux kernel, the command line file name is -, representing standard
> input.  The starting file name is then taken from the first line
> beginning with #, as detected by a call to srcpos_set_line.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> ---
>  srcpos.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++++---=
--
>  1 file changed, 55 insertions(+), 5 deletions(-)
>=20
> diff --git a/srcpos.c b/srcpos.c
> index 85657c6..fe756a7 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -33,6 +33,9 @@ struct search_path {
>  /* This is the list of directories that we search for source files */
>  static struct search_path *search_path_head, **search_path_tail;
> =20
> +/* Detect infinite include recursion. */
> +#define MAX_SRCFILE_DEPTH     (100)
> +static int srcfile_depth; /* =3D 0 */
> =20
>  static char *get_dirname(const char *path)
>  {
> @@ -51,11 +54,50 @@ static char *get_dirname(const char *path)
> =20
>  FILE *depfile; /* =3D NULL */
>  struct srcfile_state *current_srcfile; /* =3D NULL */
> +static char *initial_path; /* =3D NULL */
> +static int initial_pathlen; /* =3D NULL */
> +static bool initial_cpp =3D true;
> +
> +static void set_initial_path(char *fname) {
> +	int i, len =3D strlen(fname);
> +
> +	initial_path =3D fname;

This is setting an indefinite lifetime global to a pointer, which
AFAICT is dynamically allocated elswhere.  That doesn't seem very
safe.

> +	initial_pathlen =3D 0;
> +	for (i =3D 0; i !=3D len; i++)
> +		if (initial_path[i] =3D=3D '/')
> +			initial_pathlen++;
> +}
> =20
> -/* Detect infinite include recursion. */
> -#define MAX_SRCFILE_DEPTH     (100)
> -static int srcfile_depth; /* =3D 0 */
> -
> +static char *
> +shorten_to_initial_path(char *fname) {

Return type on same line, { on separate line, please (for function
definitions only; Linux coding style).

> +	char *p1, *p2, *prevslash1 =3D NULL;
> +	int slashes =3D 0;
> +
> +	for (p1 =3D fname, p2 =3D initial_path; *p1 && *p2; p1++, p2++) {
> +		if (*p1 !=3D *p2)
> +			break;
> +		if (*p1 =3D=3D '/') {
> +			prevslash1 =3D p1;
> +			slashes++;
> +		}
> +	}
> +	p1 =3D prevslash1 + 1;
> +	if (prevslash1) {
> +		int diff =3D initial_pathlen - slashes, i, j;
> +		int restlen =3D strlen(fname) - (p1 - fname);
> +		char *res;
> +
> +		res =3D xmalloc((3 * diff) + restlen + 1);
> +		for (i =3D 0, j =3D 0; i !=3D diff; i++) {
> +			res[j++] =3D '.';
> +			res[j++] =3D '.';
> +			res[j++] =3D '/';
> +		}
> +		strcpy(res + j, p1);
> +		return res;
> +	}
> +	return fname;
> +}
> =20
>  /**
>   * Try to open a file in a given directory.
> @@ -157,6 +199,9 @@ void srcfile_push(const char *fname)
>  	srcfile->colno =3D 1;
> =20
>  	current_srcfile =3D srcfile;
> +
> +	if (srcfile_depth =3D=3D 1)
> +		set_initial_path(srcfile->name);
>  }
> =20
>  bool srcfile_pop(void)
> @@ -325,7 +370,7 @@ srcpos_string_short(struct srcpos *pos, bool first_li=
ne)
>  	int rc;
> =20
>  	if (pos) {
> -		fname =3D pos->file->name;
> +		fname =3D shorten_to_initial_path(pos->file->name);
>  		rc =3D asprintf(&pos_str, "%s:%d", fname,
>  			      (first_line) ? pos->first_line: pos->last_line);
>  	}
> @@ -379,4 +424,9 @@ void srcpos_set_line(char *f, int l)
>  {
>  	current_srcfile->name =3D f;
>  	current_srcfile->lineno =3D l;
> +
> +	if (initial_cpp) {
> +		initial_cpp =3D false;
> +		set_initial_path(f);
> +	}
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5Mfx4RzfBqgnTE/w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpVqCgACgkQbDjKyiDZ
s5Kk0A/9GHtHwRMj8PgnkB49V6jckBCOvuRtDFEQZ+vXBa9jINAdZoIszXbKfV8m
5hhbYOU3lWDmy3RvEMzVIlwfu2bwAlcvwsRvhPassTPhLGcb7yKOmLQeILQC7d7D
UW7CMuJbbR/M64j5HEhD1fv208E+9xgd0l1ZBNROYN5g9FUoj8XvWdbXvnWIZe+z
mnBGuxw+v/NQEzOLmKbarLDSCH/fOto+wuTVezn1XNQOeq2/YAhFKWwEZHcmvDj4
QzYUWm+hggTi9Gb4vCP8KrvaWHeQD3jIr/CvGrus9YIctppRqI9w3sHpA2MiqE/U
Wpf0KBOXJYBuzgOSYYD7aG3bj86r5M3Y62C+dVx+pWdrd+N+3stskNrRTO4aqFpJ
gknaFFnXrVmfNi8i/RbMKXyGjdveCu77tQ5wUMLDF2AH5pZbTvWkzFiYQsRrYAUs
PS4Syw1h2oZTTwRZbUxXxfAfBrlvizc1IF8Xbx5N8nvwM8MVwVmpRLI4R4POF1QF
HIEPcvHj9jcK1dyd5PaE7cLAcE3HvXbXzS7asdNVSK2jcb0w8Dt1J4O+89BpFqKg
fXZ5mkywrC+KDwX2nRyjKe9gRVhoSkiZ/ISKtqLOzbWPd8bmU9yR34dYwXajL1KW
eRrfJVwZwAHgRRDGvpy6s/dPwul8wCaMcCKvozntcL9B01jGycA=
=cgYM
-----END PGP SIGNATURE-----

--5Mfx4RzfBqgnTE/w--
