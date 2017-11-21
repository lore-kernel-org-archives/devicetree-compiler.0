From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix ambiguous grammar for devicetree rule
Date: Tue, 21 Nov 2017 15:06:30 +1100
Message-ID: <20171121040630.GQ19214@umbus.fritz.box>
References: <20171120171218.3320-1-grant@tiffany.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o0y1lerN6xYE2ROn"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1511242947;
        bh=GOAoNVkMwUOfZHhhohDxolT6yB3H6agbUgGhZGsaZjI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kJmbfLKuhyXwBdt0XvkRlLl15iJBTjZw8CUIMtiKF0oAPp33aKyyq43PAsGqz5iFX
         O1tHgGWspq5et88TMYnzcipKMPqsOBiICOvscpexKZLKTUM9wIMr/uwY+m3y/PFH/T
         xK6lLcvTpHEGLQKvPKpY0Q74JcozGFJl4w4DkPO0=
Content-Disposition: inline
In-Reply-To: <20171120171218.3320-1-grant-72MMKEujIeWzez9aqWk6I/IHrerwW8k1@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant-72MMKEujIeWYvcOBcYx38pOp/cRyR9/c930Pai70D+E@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>


--o0y1lerN6xYE2ROn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2017 at 05:12:18PM +0000, Grant Likely wrote:
> From: Grant Likely <grant-72MMKEujIeWYvcOBcYx38pOp/cRyR9/c930Pai70D+E@public.gmane.org>
>=20
> Commit 737b2df3, "overlay: Add syntactic sugar version of overlays"
> introduced an empty rule for "devicetree" that created ambiguities in
> the grammar and causes the following warning:
>=20
>          BISON dtc-parser.tab.c
>   dtc-parser.y: warning: 3 shift/reduce conflicts [-Wconflicts-sr]
>=20
> Fix the grammar by explicitly testing for the condition the
> new overlay grammar wants to use. This means duplicating a very small
> amount of grammar processing code, but the alternative seems to be a
> more invasive reorganization of the devicetree rule. Better to fix it
> this way now and save the reorg for a separate patch
>=20
> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
> Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Strictly speaking this makes a behavioural change, since an entirely
empty overlay is no longer allowed.  I think that's an acceptable
change, though.

Applied.

> ---
>  dtc-parser.y | 17 +++++++++++------
>  dtc.h        |  2 +-
>  livetree.c   |  3 ++-
>  3 files changed, 14 insertions(+), 8 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index affc81a..44af170 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -166,7 +166,17 @@ devicetree:
>  		{
>  			$$ =3D merge_nodes($1, $3);
>  		}
> -
> +	| DT_REF nodedef
> +		{
> +			/*
> +			 * We rely on the rule being always:
> +			 *   versioninfo plugindecl memreserves devicetree
> +			 * so $-1 is what we want (plugindecl)
> +			 */
> +			if (!($<flags>-1 & DTSF_PLUGIN))
> +				ERROR(&@2, "Label or path %s not found", $1);
> +			$$ =3D add_orphan_node(name_node(build_node(NULL, NULL), ""), $2, $1);
> +		}
>  	| devicetree DT_LABEL DT_REF nodedef
>  		{
>  			struct node *target =3D get_node_by_ref($1, $3);
> @@ -209,11 +219,6 @@ devicetree:
> =20
>  			$$ =3D $1;
>  		}
> -	| /* empty */
> -		{
> -			/* build empty node */
> -			$$ =3D name_node(build_node(NULL, NULL), "");
> -		}
>  	;
> =20
>  nodedef:
> diff --git a/dtc.h b/dtc.h
> index 35cf926..84187a1 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -203,7 +203,7 @@ struct node *build_node_delete(void);
>  struct node *name_node(struct node *node, char *name);
>  struct node *chain_node(struct node *first, struct node *list);
>  struct node *merge_nodes(struct node *old_node, struct node *new_node);
> -void add_orphan_node(struct node *old_node, struct node *new_node, char =
*ref);
> +struct node *add_orphan_node(struct node *old_node, struct node *new_nod=
e, char *ref);
> =20
>  void add_property(struct node *node, struct property *prop);
>  void delete_property_by_name(struct node *node, char *name);
> diff --git a/livetree.c b/livetree.c
> index 6846ad2..4a3d893 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -216,7 +216,7 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
>  	return old_node;
>  }
> =20
> -void add_orphan_node(struct node *dt, struct node *new_node, char *ref)
> +struct node * add_orphan_node(struct node *dt, struct node *new_node, ch=
ar *ref)
>  {
>  	static unsigned int next_orphan_fragment =3D 0;
>  	struct node *node;
> @@ -236,6 +236,7 @@ void add_orphan_node(struct node *dt, struct node *ne=
w_node, char *ref)
>  	name_node(node, name);
> =20
>  	add_child(dt, node);
> +	return dt;
>  }
> =20
>  struct node *chain_node(struct node *first, struct node *list)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--o0y1lerN6xYE2ROn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloTpkMACgkQbDjKyiDZ
s5L0pw/+JVJsNiYA1Tj8Y0kfWutw81mpPusq+VhghCVwdwnebVkZFGzxEFz6eos/
DPNBL44IvbZkgCbnNtXZm3XHvJrzFLo3I8R99EIgwBhB0B7QQsnLyD6jjJwnu5ld
pyBmV3Et4/5U5lFLOtDGTNTKklClduUBdsAR38l98VFi7Djkb17FLmLi+C2zxG0b
zz/2tMJz7gcH3PEjeu1DwoACdPpKTgdms2re7O1XO5mdS09QyzaZitbWKPFmByDP
szPidoj8GmWSgVZn8ER+qmgKoP9h3CM1miW4Db9vPjX+PUSeT/5gAjZ7tLBrt0BW
M9JyfBcLfZpDS083grOkEl/Mp2ywxtr2qNaq96QIoAWzb0n1RNLnnPzSdrqUhKpJ
c2m+g2d1ddY//3mdN2KuBkSpwgG7kuvHJY2GTXsjm7O2Nj3c3bzEdiZdY6GLsRga
5BpgEw8PRGynnQP3D0qljVHkmrCXMKfLFXQEP76nVfChRrc1Zx0FZtzlBnSgQbHW
9zg/H26eMsrcTKhzKdRpiGPp0/0I9uwhnaaF7ItOZ+p83r+vEl55PMbVyThN94ub
iX/mKzmnS6iO+DkfiMMN0TRPGENncZrIpNowNpQF7IHrdE3asla/sZh8ohwMicg+
fFASoBok2Nt+R9cZvLnUgoyvOyGcgAC4PguZeGfQ9VEDLpJ3Le0=
=WS7V
-----END PGP SIGNATURE-----

--o0y1lerN6xYE2ROn--
