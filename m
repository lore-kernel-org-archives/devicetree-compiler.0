From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] DTC: Fix memory leak on flatname.
Date: Mon, 11 Jul 2016 11:29:10 +1000
Message-ID: <20160711012910.GB16355@voom.fritz.box>
References: <1468189012-1584-1-git-send-email-jcd@tribudubois.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1468200546;
	bh=QywnpG39nzfuoL/WfZgMcCZ7VRBIuMODkbPu5RPSDpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YG2AYg+gA2nfntK8BSDTexuT6bIAfEfUHedrgOlEzxEmEJJjEOU82aOcNbxuFAI1I
	 gj+oNh4yVFxK4aunuHMPKawB9dVVaAPsPCXAO6TM0fpGjP4il1TbTE4esZ08MDWIxg
	 PYgxokZ62VZbtk7K0dudi1BZHU1q1yhUvr41b3lY=
Content-Disposition: inline
In-Reply-To: <1468189012-1584-1-git-send-email-jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 12:16:52AM +0200, Jean-Christophe Dubois wrote:
> If flatname was not referenced by the "node" structure, the reference to =
the
> allocated string is lost at function exit.
>=20
> We need to free it if is not used by "node".
>=20
> Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

TBH, I'm not generally particularly fussed by memory leaks in dtc,
since it only has a short runtime.  Still, I've applied this fix
because, why not.

> ---
>  flattree.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/flattree.c b/flattree.c
> index ec14954..089b976 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -797,6 +797,10 @@ static struct node *unflatten_tree(struct inbuf *dtb=
uf,
>  		}
>  	} while (val !=3D FDT_END_NODE);
> =20
> +	if (node->name !=3D flatname) {
> +		free(flatname);
> +	}
> +
>  	return node;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXgvZmAAoJEGw4ysog2bOSbyEP/jyc9jdBxq7v99kjudBhoBUB
lrMaqATel5bl/4Y/4Ngu13ezZeUW3FiI9eA+sp7ncmy5dr2Bk5p9E6D7pxsfGByO
J1vvsF55Q3hRrgtz2BiA/SDcc9Nd2v47+7JrpuLImaXFOn/4jBSGRjQkheRFrLxt
E4LIKvilewpkWCwYMgCvyvtrfJ6z+rOvSty1i92tTKhJZvegKftMS7BuoYiHe1ve
ffcpd2hMQ7k9F/4hYGRYuDOkKPZ3Hmt7nMKXDZPP8LYgGXZtSzSooG0AR6iIRKa0
McdKsds4y1zMK33YH2595Wz/OsoDdBBYZalKX52/FEGkwJ4DuIpZbk1VmEErk2SL
qo0R9UAiEE3Asb/EMecQl9mxTQuFoxT5aJUn4/NgbyGBh6XOwM9+bCwykHS/yYL3
abXJv2uGRv/HAEzo3CRrScIIHGmd0fn1YDxkXcmhJ4JFSHrWKI+xAaQXBgvoQRvP
yJWcSCtDOcZ9l6qPeoJHHUv2EwbAqktOxwWUilgOPHUjzZ3KuWrd3yDVNpc2E8dQ
4MME8IXa18J7DD2O+VM0OR2vTykZGLkDIbZ5EoBANZeB5xzztYWrpBPFr4iGPbA0
PNZX5zfGia2QAyHYd/FmfSwrQsXw3K5eg4VLwm58j5nz46AUb1JnwaMO2NFty6OG
Ga2MEGArc7HUbaPb2fhI
=06xY
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
