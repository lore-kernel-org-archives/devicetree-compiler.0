From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix get_node_by_path string equality check
Date: Tue, 18 Apr 2017 13:43:32 +1000
Message-ID: <20170418034332.GH12235@umbus.fritz.box>
References: <f5424c7ce8334730a64873b9912132d3@exsvr1.ghs.com>
 <20170418020540.GA12235@umbus.fritz.box>
 <77edbc7797e144cd9a635e5b1d0b2dfe@exsvr1.ghs.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Yia77v5a8fyVHJSl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1492487070;
        bh=4my1120ezoPg8JHDsKwf4Hn7tWXy8HJUxw2yZSxFZFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ROYSuH9e/pYTRSabY+V0AEAdfvVIIY88jePA54S/7wJfbVFS18DxlK22F9R7itydR
         G21BzwqzDlYYaY59SLLE+1KJ+lNyv81RGp+ZBg2vOsPCS4IgH2oTfNJGBbtqlBJjvq
         7lFWOtLJD5EM757nk6HwDCi+jBjhoLpZaRf35KU4=
Content-Disposition: inline
In-Reply-To: <77edbc7797e144cd9a635e5b1d0b2dfe-xbOadlNgr96L7B8feK0ILA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tim Montague <tmontague-5j0BnJlmnLM@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--Yia77v5a8fyVHJSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2017 at 03:18:55AM +0000, Tim Montague wrote:
> When determining if to recurse into a node, get_node_by_path does not
> check if the length of each node name is equal.  If searching for
> /foo/baz, this can result in recursing into /foobar because
> strneq("foo", "foobar", 3) is true.
>=20
> This can result in a reference to /foo/baz to be incorrectly set to
> /foobar/baz.  A test for this was added.
>=20
> Signed-off-by: Tim Montague <tmontague-5j0BnJlmnLM@public.gmane.org>

Ah.. it looks like your mailer has mangled the patch, I'm afraid:

$ git am -s ~/foobox/
Applying: Fix get_node_by_path string equality check
=2Egit/rebase-apply/patch:16: trailing whitespace.
		if (p && (strlen(child->name) =3D=3D p-path) &&
=2Egit/rebase-apply/patch:17: trailing whitespace.
				strneq(path, child->name, p-path))
=2Egit/rebase-apply/patch:30: trailing whitespace.
	int n1, n2, n3, n4;
=2Egit/rebase-apply/patch:38: trailing whitespace.
	/* Check reference to nested nodes with common prefix */
=2Egit/rebase-apply/patch:39: trailing whitespace.
	n3 =3D fdt_path_offset(fdt, "/foo/baz");
error: patch failed: livetree.c:478
error: livetree.c: patch does not apply
error: patch failed: tests/path-references.c:66
error: tests/path-references.c: patch does not apply
error: patch failed: tests/path-references.dts:12
error: tests/path-references.dts: patch does not apply
Patch failed at 0001 Fix get_node_by_path string equality check
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Can you check your mailer settings.  If it's not clear how to stop it
doing that, it's probably safe to attach the patch instead.

> ---
>  livetree.c                |  3 ++-
>  tests/path-references.c   | 12 +++++++++++-
>  tests/path-references.dts | 13 +++++++++++++
>  3 files changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/livetree.c b/livetree.c
> index 3673de0..aecd278 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -478,7 +478,8 @@ struct node *get_node_by_path(struct node *tree, cons=
t char *path)
>  	p =3D strchr(path, '/');
> =20
>  	for_each_child(tree, child) {
> -		if (p && strneq(path, child->name, p-path))
> +		if (p && (strlen(child->name) =3D=3D p-path) &&
> +				strneq(path, child->name, p-path))
>  			return get_node_by_path(child, p+1);
>  		else if (!p && streq(path, child->name))
>  			return child;
> diff --git a/tests/path-references.c b/tests/path-references.c
> index c8d25fb..5e332e8 100644
> --- a/tests/path-references.c
> +++ b/tests/path-references.c
> @@ -66,7 +66,7 @@ int main(int argc, char *argv[])
>  	void *fdt;
>  	const char *p;
>  	int len, multilen;
> -	int n1, n2;
> +	int n1, n2, n3, n4;
> =20
>  	test_init(argc, argv);
>  	fdt =3D load_blob_arg(argc, argv);
> @@ -92,6 +92,16 @@ int main(int argc, char *argv[])
>  	if ((!streq(p, "/node1") || !streq(p + strlen("/node1") + 1, "/node2")))
>  		FAIL("multiref has wrong value");
> =20
> +	/* Check reference to nested nodes with common prefix */
> +	n3 =3D fdt_path_offset(fdt, "/foo/baz");
> +	if (n3 < 0)
> +		FAIL("fdt_path_offset(/foo/baz): %s", fdt_strerror(n3));
> +	n4 =3D fdt_path_offset(fdt, "/foobar/baz");
> +	if (n4 < 0)
> +		FAIL("fdt_path_offset(/foobar/baz): %s", fdt_strerror(n4));
> +	check_ref(fdt, n3, "/foobar/baz");
> +	check_ref(fdt, n4, "/foo/baz");
> +
>  	check_rref(fdt);
> =20
>  	PASS();
> diff --git a/tests/path-references.dts b/tests/path-references.dts
> index b00fd79..3808aa6 100644
> --- a/tests/path-references.dts
> +++ b/tests/path-references.dts
> @@ -12,4 +12,17 @@
>  		ref =3D &{/node1}; /* reference after target */
>  		lref =3D &n1;
>  	};
> +	/* Check references to nested nodes with common prefix */
> +	foobar {
> +		n3: baz {
> +		    ref =3D &{/foo/baz};
> +		    lref =3D &n4;
> +		};
> +	};
> +	foo {
> +		n4: baz {
> +		    ref =3D &{/foobar/baz};
> +		    lref =3D &n3;
> +		};
> +	};
>  };

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Yia77v5a8fyVHJSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY9YthAAoJEGw4ysog2bOSI6kQALOkJkcJ3Tsznr9dLre3X7Gs
FNa/5hBt3VhCTkJEK7FqAV5zGFUSuVywp191FypElr3+wISOxWBrjvjWYLR4Gqm0
RxNXsJWSm/r6j9ZOTUMw2ByTgbH0YZ1UYSopWkdkfWB19J5LYLTUntPcuLNf16GL
63HVn7va9/XfNG7m2KpQq0Tlc1aKggBU8FK3n+141NqwDCW+3sEAdax6LzzlvF0P
+u4tDjzwQzGzZj+hW/wttufGIZm9t4cEtGhrrKsh6mZlMZbrPVbBW1MoSnMX+rE/
+gxFETdeDiNSiUXcpaMsXQbcWjT9xYjC2uikmXwGjR6D81kOewCEkEUusGDSnDTH
5X992H4Od3h3+mvYZgaTgVNT8J8LEajvNfCfOSr6n1L8ZyBC/96AQ9dbuWTu1/HK
Odj9ZDvFRy2Jni/6Fu69mbEdlb1azoksD9ZvYmrRfs/5oDo3xgid6/K3zA9dvzIZ
6uEQBS1ajgFk1U9BoebMnOywxoziL6rxG0fj2nbxFS7HpmOx8EmWFxyuvyZNVLil
RXCMgi+bU7h+OxecpwO/QVjhvh1tOOdoiggBNxiKezcWmQNGlZeUqQweel/Ht6kP
N3PtomjBqC36DqKueg/+iegTgWFmTNOcu8XFmOYkyZlQXtl3OXwL5uNgEADC7pU6
CvGyLiEtdECtTVQdGmZL
=yCsw
-----END PGP SIGNATURE-----

--Yia77v5a8fyVHJSl--
