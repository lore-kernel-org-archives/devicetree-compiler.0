From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] livetree.c: Fix memory leak
Date: Wed, 8 Feb 2017 17:40:57 +1100
Message-ID: <20170208064057.GJ17644@umbus.fritz.box>
References: <20170207212625.20538-1-jcd@tribudubois.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="enLffk0M6cffIOOh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486536072;
        bh=XiPOSUsItGNtpgZDXj8lL9t6FgffYhre1rGAiQ8TBS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lH+WYgh/5Q7XAHskaLdtpEmWI946HsyTRdkFObsYbaS61QyUkXy+QAb4b9uBMuq2H
         WnBfjRhClXgnHaOKGYx2ya7oW2n4jRSgCtjS/XD/SiO0NAU+Zr2FHU5pW8v+55OPcG
         zGouIG0awu/fz6Npqf3RyN1egwMfET/xfjP0eCXc=
Content-Disposition: inline
In-Reply-To: <20170207212625.20538-1-jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--enLffk0M6cffIOOh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2017 at 10:26:25PM +0100, Jean-Christophe Dubois wrote:
> When running coverity on dtc source code the following error is reported.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> *** CID 1370967:  Resource leaks  (RESOURCE_LEAK)
> /tools/dtc/livetree.c: 850 in add_fixup_entry()
> 844		if (strchr(node->fullpath, ':') || strchr(prop->name, ':'))
> 845			die("arguments should not contain ':'\n");
> 846
> 847		xasprintf(&entry, "%s:%s:%u",
> 848			  node->fullpath, prop->name, m->offset);
> 849		append_to_property(fn, m->ref, entry, strlen(entry) + 1);
> >>>     CID 1370967:  Resource leaks  (RESOURCE_LEAK)
> >>>     Variable "entry" going out of scope leaks the storage it points t=
o.
> 850     }
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Fix the leak.
>=20
> Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

Applied, thanks.

> ---
>  livetree.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/livetree.c b/livetree.c
> index afa2f67..994b6c2 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -847,6 +847,8 @@ static void add_fixup_entry(struct dt_info *dti, stru=
ct node *fn,
>  	xasprintf(&entry, "%s:%s:%u",
>  			node->fullpath, prop->name, m->offset);
>  	append_to_property(fn, m->ref, entry, strlen(entry) + 1);
> +
> +	free(entry);
>  }
> =20
>  static void generate_fixups_tree_internal(struct dt_info *dti,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--enLffk0M6cffIOOh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYmr15AAoJEGw4ysog2bOSkJ0P/2/SC1Gdpz7ReAgiK3bRRJgS
4fbnVoyetx2dpf4EyDvWpPngp6xZCj9kcK6DfT3cQRY60A/6uxWZHKcWLgFRT3Cu
LvG6FLrFl+m/N1v3M3qt8YOQL4F7WCoZ+7OPuz0XpDmfnJz6/7omH83YJabSlm00
uxbsboIYo+gNzCH9wuZD+soCDFTkOPeIZbKP+QsMjeo+/3Tu8xO/E5nPOwUbfSEO
LX9lWEdkccbFPPC9eqwbcgOBW7w51XhgbHqQ3VwWE417e8gqCXlXaYMRH+yAwT0v
8EEnMAahHQVIvm/gURrKOXrnLk3rXe9/h2DRWvowBPsTXSp7E0Yqd6aOLvEq1+I0
1UYdGdH1RpDHSbAVHqg1sw7h5gOcxvJE5jCw2Ql7je1puRdfeusPny8UNgNJCiR0
DWhetGX7YsIq9MCqivP/yIsgukEa1wRMZd8rzKJ2pmvjqTT9NLII+ByhwORxuMXq
Yu+cPdVTYzHEiXaWBwPlqO75EFOBqOiER82iwbszoocpnUSnGkCth6r05+aN9EIo
BS4wKl5KidgTXgoZ9Ylc0jqZ3XxVg3NCdJ8ZhfJDjys7YyVeeo2FQY0V30BK3DLr
L6BgNxULPfzByJS70fiQKFRSh6E3J/W4Nc3PAd7sWTSmK7YO2qQdclnLIsVmDLD1
twy+CqvlirtzHUIv8O26
=+oib
-----END PGP SIGNATURE-----

--enLffk0M6cffIOOh--
