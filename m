From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: Fix NULL pointer use in dtlabel + dtref case
Date: Mon, 30 Jan 2017 15:48:46 +1100
Message-ID: <20170130044846.GE14757@umbus>
References: <20170125192724.11989-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1485754055;
        bh=wUM1/iy/LKZemUqD7jy36xve4nGQMyJoxMIMKTYya5o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ndnB7eFRi71irhq68ivumkI+l2PTy7bZcOaVvRHxw2B82Xdl5rZbIB3n2DkIqV2SN
         adCgMpVzrdQdX3N/yNd3M3FvQ/bcvKe1NsWrX4AbEr7becfBcZpzMyxgC/70sIHakB
         D3zDcrFDEifd5Vfkl6fofRKhMEJhCvPTSyBQgzR4=
Content-Disposition: inline
In-Reply-To: <20170125192724.11989-1-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2017 at 11:27:24AM -0800, Stephen Boyd wrote:
> If we have a construct like this:
>=20
> 	label: &handle {
> 		...
> 	};
>=20
> Running dtc on it will cause a segfault, because we use 'target'
> when it could be NULL. Move the add_label() call into the if
> statement to fix this potentially bad use of a NULL pointer.
>=20
> Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Looks good, but could you please add a testcase, so we don't make the
same mistake in future.

> ---
>  dtc-parser.y | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index b2fd4d155839..ca3f5003427c 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -171,10 +171,10 @@ devicetree:
>  		{
>  			struct node *target =3D get_node_by_ref($1, $3);
> =20
> -			add_label(&target->labels, $2);
> -			if (target)
> +			if (target) {
> +				add_label(&target->labels, $2);
>  				merge_nodes(target, $4);
> -			else
> +			} else
>  				ERROR(&@3, "Label or path %s not found", $3);
>  			$$ =3D $1;
>  		}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYjsWrAAoJEGw4ysog2bOSFzEP/0FwwIuFo7F+RKetg3rivo4O
5E/LaHksH+Hmneb5vktmWNZxEUDPb4zYIl5PoQ9rTYwIbGf7HqkWZj/Cg7dXv+cl
4nb2g1dGqm4/nUmk/y3Ynr6gpAqwpxqamw1xcdFNdR+fZbXU5Tv43FFLhnviJ14/
IwukEbHhtzMZTqxr+9YoEMs326sQ9sbK7f36jFlHOPajE65NTAixgsx6Qqxp4wQg
TRKUEI99PttVkc/7VOFN43ir97vVDGuwobecnI0eAnbhIjLltPUa/JXy2ME4D/xq
N7fTemQs99DmtFC/Lb3vKnXfOpw5UlTPVlIIgBO82xacaVI6PA1oCU+Ido6W5Om0
9nN22I3R47C+CYGRA0fvForZD7iEMgeqjL2zHakEHdr02WfhgG/qLgfaZ1/tqlIj
B5mgauEBR2M5606oRzdMucMHt0H5wnIO5j2LoJ1UeFl7WqMLWdiX+iiJr33FXrjQ
9Qj8mi2BmckvmD9eVk8TSmx1zjSFato6M9Xcg6xN5TVeqbtlTT5dQGFW9T4Mi/sL
7WwDD9JgFoyubscAa+LaXqbHSptUw8wWXRNTyMUd7rWl/HzhATSULl8cdLiPRYlM
OAnpBZgNi9CEspzvd4Ute46ihxFX9t5vvF8ujHbWalJ1SS6b0m4u1gT/by4rr1Ts
rUTWJWNl69Eco8gKgkm4
=XqUi
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
