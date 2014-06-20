From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/4] Microsoft Visual C patches
Date: Fri, 20 Jun 2014 22:55:28 +1000
Message-ID: <20140620125528.GB16801@voom.redhat.com>
References: <539DBFC8.4050204@errapartengineering.com>
 <20140616104628.GB29264@voom.redhat.com>
 <53A1C5FC.9040105@errapartengineering.com>
 <20140619111459.GM29264@voom.redhat.com>
 <53A2F104.90701@errapartengineering.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53A2F104.90701-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 05:17:40PM +0300, Andrei Errapart wrote:
> First, thanks for accepting 3 of the patches!
>=20
> 19.06.2014 14:14, David Gibson kirjutas:
> >Ugh, this is by far the ugliest of these workarounds, and the reason
> >for it in the code is really non-obvious.  I'll have to think about
> >this some more.
>=20
> Good point. Kind of careless of me not to pay attention to that aspect.
>=20
> What about dropping the field "num_prereqs" altogether? It forces someone
> looping over the field "prereq" to think about the end condition and
> comparision with NULL (or nullptr) is an obvious answer. A diff is at the
> end of the letter.

Hm, that might work.  I'll think on it.

> >>     * Initialize check->inprogress, too.
> >
> >Why..?
>=20
> Stumbled over that one - the value of inprogress was in some cases
> initialized to "true" when compiled with MSVC.
>=20
> According to the C99 draft
> (http://www.open-std.org/jtc1/sc22/WG14/www/docs/n1256.pdf, pages 137,138=
),
> in static storage all fields are initialized to zero, null, 0.

Exactly..

> According to MSDN (http://msdn.microsoft.com/en-us/library/81k8cwsz.aspx),
> initilization is required: "If initializer-list has fewer values than an
> aggregate type, the remaining members or elements of the aggregate type a=
re
> initialized to 0. The initial value of an automatic identifier not
> explicitly initialized is undefined."

Right, an automatic identifier, which is to say a local variable, not
a global variable like this,

> >I've applied patches 2, 3, and 4.  But for future reference, please reme=
mber:
> >
> >   * Patches should be inline, not attachments
> >   * Commit message and signed-off-by lines should not be indented
> >   * Commit messages need more details on the reason for the patch (see
> >     the changes I've made for examples).
> >   * Commit messages need a 1 line summary at the top (2, 3, and 4 have
> >     this, but 1 doesn't)
> >   * There should be a blank line between the 1-lite summary and the
> >     remainder of the commit message
>=20
> Thanks again.
>=20
> Is there an automated command to format the commit message per the
> requirements?

git format-patch should do it, or git send-email will format and send
out the emails for you too.

> diff --git a/checks.c b/checks.c
> index 47eda65..fe90dfc 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -54,12 +54,11 @@ struct check {
>  	bool warn, error;
>  	enum checkstatus status;
>  	bool inprogress;
> -	int num_prereqs;
>  	struct check **prereq;
>  };
>=20
>  #define CHECK_ENTRY(nm, tfn, nfn, pfn, d, w, e, ...)	       \
> -	static struct check *nm##_prereqs[] =3D { __VA_ARGS__ }; \
> +	static struct check *nm##_prereqs[] =3D { __VA_ARGS__, NULL }; \
>  	static struct check nm =3D { \
>  		.name =3D #nm, \
>  		.tree_fn =3D (tfn), \
> @@ -69,7 +68,6 @@ struct check {
>  		.warn =3D (w), \
>  		.error =3D (e), \
>  		.status =3D UNCHECKED, \
> -		.num_prereqs =3D ARRAY_SIZE(nm##_prereqs), \
>  		.prereq =3D nm##_prereqs, \
>  	};
>  #define WARNING(nm, tfn, nfn, pfn, d, ...) \
> @@ -153,7 +151,7 @@ static bool run_check(struct check *c, struct node *d=
t)
>=20
>  	c->inprogress =3D true;
>=20
> -	for (i =3D 0; i < c->num_prereqs; i++) {
> +	for (i =3D 0; c->prereq[i] !=3D NULL; i++) {
>  		struct check *prq =3D c->prereq[i];
>  		error =3D error || run_check(prq, dt);
>  		if (prq->status !=3D PASSED) {
> @@ -192,7 +190,7 @@ static inline void check_always_fail(struct check *c,
> struct node *dt)
>  {
>  	FAIL(c, "always_fail check");
>  }
> -TREE_CHECK(always_fail, NULL);
> +TREE_CHECK(always_fail, NULL, NULL);

Why is the extra NULL necessary here (and similar places)?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTpC9AAAoJEGw4ysog2bOS2GYQAIGPjpFxXgfRZa89sXAzSuhj
chja2IPzGsHy3QkPBrLEpljbo9MzAh/W+JgIEavdnWxtH7Vbi9QWRvT/reesjBJh
JoT16OiVChB7rqhb+Aw9m5QDtTLPN7XBqtSje/SIlWZ8RwlO5eZJzTfn+Imp7oyD
alAWaSFoMTb+WMAN8PyxG/+5uKPC4jnDOZgB7wKTk9rzxE1l2t48RVxbi5O9m202
JWNFQZnRQp25exQnbiIBLTz5DFTfEYu/uNUmOBbnke7hAIn9VTvYu3cAe01Dg/YR
2Vo3dTSLuHDNJkVBBWgFNgZuGiCIQSOszMnFiQJA1UQvAh42lWDV0Jku3I93k3DW
oNvx+ukfgtUFM8aLBKmmGZfHnNve3uTNLF/aLXJlA+CJGb9pTGqo6OqCjeHnO1ax
Amr9+OWZczCs+tdgHeEUo/Zwx3JpPgkVWbonkN3Lfk/g6gpMY+AXvXscbSz4ahQF
6063Tt/ZPmpY6j7RHXkMlSbeW8rsLEnxifxD8nhM/SlLffDhJn04/3fut/+MKcJM
xKOHQMDmwygbHFySEtiCcTcqC1xPvg924/0snZGTdzutZpiADyVHHRvYKfeY5s8A
ZP/RKF1elsFK7WzDDdYMc0m+zZXJx9LYFqC5GKdqygXnIdBmM+/o90a47J4CIC3w
wcJXLE8U1YYSawEfqQHX
=JFGX
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
