From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix get_node_by_path string equality check
Date: Tue, 18 Apr 2017 12:05:40 +1000
Message-ID: <20170418020540.GA12235@umbus.fritz.box>
References: <f5424c7ce8334730a64873b9912132d3@exsvr1.ghs.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1492481148;
        bh=HmWyeRXG/ARrzDOx0sphpRNvtFUujUeQdRlMY4stp9M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YwOpgCiMHinMDqVaiJ80M5dQ5xmF9Hex7w9R1Ms+wbNfRPJXHTPLF2Jpg5jKBbPAU
         YeGeU61R6Dql9MORwN5iKxX6dPxMRBoRRMppcEiaB07EM0uc5Y6kmcowe9wJkezM3X
         996mgak+rfpZO6uxeL4Na2nGVmKhaM8Lyot98ZHg=
Content-Disposition: inline
In-Reply-To: <f5424c7ce8334730a64873b9912132d3-xbOadlNgr96L7B8feK0ILA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tim Montague <tmontague-5j0BnJlmnLM@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2017 at 12:08:18AM +0000, Tim Montague wrote:
> When determining if to recurse into a node, get_node_by_path does not
> check if the length of each node name is equal.  If searching for
> /foo/baz, this can result in recursing into /food because
> strneq("foo", "food", 3) is true.
>=20
> Signed-off-by: Tim Montague <tmontague-5j0BnJlmnLM@public.gmane.org>

Looks like I made the classic strncmp() blunder, how embarrassing.

Fix looks good, but I could trouble you to add a testcase exercising
this?


> ---
>  livetree.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
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

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY9XRxAAoJEGw4ysog2bOSq8gQAOKDDYp6Rn5+a85x3JW4xKk1
iRY0ETt8rF4ePU3XRnBIFd7kqQZzl1AojcmeaeS0YAeXnYxd9ul+cjYGzrpilZtp
MsTYOl7XO77xRaFueeYB1Eu5vR+/Q1fkb6VKcpzC33hcF562KQMpBAsmq0OPqREg
zKYm404csOwSSfJoxrRT+vZyLnQggbVGKDH6AgQxJcNzTA890HxWF7BTaYsZfIV6
ZeW6IHH+CqIsxluaY1Q9aDL42TW/22qi7OXtENwdZhg49c7ENJogydMcCqZgJOLg
2ib4zWae/rPkmCdNRR9ismcioMECc2dOAf/It72h3m1HqK/MEeTJl9Bi/NOdyw1f
AYsG13GIMJWvIJoxHtCaZvAmxvftTScZ6IGKAZjXl20WDKbxO60m/t+6vtnwf7bx
e9PH67tKXf04du2AqTuia41kQxrvvhZUyWQGiLCtHYw2Vm0/2MZGssjCbE/QpNd/
3fvwEIasA4gwB12CGFTAMb40mn7zj+mlLfcv+DEG5H+Vr7V+9d5QkkW1jgTUyZLw
6JwdZf84uzotvSLrrXscPSyEFxSWazjrUmx8LvhHqjnqOzQ2wuMan0l9MdPfZkJ1
965t8PbJQuK1S9JhcRWmAPFxfVPmciW53PlPkl2usFWSyjULF6gP6t0Z6fo6Glhi
U+7aMUPBtAy2aySwGaei
=4Fiu
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
