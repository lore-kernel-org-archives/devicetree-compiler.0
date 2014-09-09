From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Use cases for fdt_nop_* functions
Date: Wed, 10 Sep 2014 09:12:54 +1000
Message-ID: <20140909231254.GA19190@voom.redhat.com>
References: <CAB8QsTBno6L2MFE_JWbkpAH=iBhNzcEQroe0_yyBfYWRG8eCiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAB8QsTBno6L2MFE_JWbkpAH=iBhNzcEQroe0_yyBfYWRG8eCiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jay Bhukhanwala <jaybhukhanwala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 09, 2014 at 03:52:51PM -0700, Jay Bhukhanwala wrote:
> What are the use cases for the below functions?
> fdt_nop_property
> fdt_nop_node
>=20
> How would the fdt_nop_node be any different from setting the status
> property to "disabled" ?
>=20
> I am suspecting the fdt_nop_node, basically makes the node
> undiscoverable in DT, but I need someone to please confirm the
> assumption.

That's correct.  fdt_nop_node and fdt_nop_property are functionally
equivalent to deleting the node or property entirely, however unlike
fdt_del_node() or fdt_del_property() they don't move any other
existing nodes or properties around in the blob.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUD4l2AAoJEGw4ysog2bOSEJwP/RAdsqHSbFVjiOK1/eDzzELt
K+/36RYhA4ayY76k7UB1BZCeZxqzBNTus7D43FnJXNrfxJa0O0hqgMGVepJUeCx0
hptRGXQc+yQnAONZpr9VBZpkRIpUfBAjpgNKpWG/qMqpBiAlIYiuRplZkKoktc8l
FqTK6fcaygBIzZMRXYWBDMqdsqfClyLCJ4bO7wTCrXUtuLV/XdlFwE+D2AaxRh/Z
cjkSG9ZFKqu1qlCeU7f+lFjtoM33LREmgQROxKTGF/wStt2v0wxTjhWZlHqJ80nM
hiKCafY8HzeggPnCydh85YVZAM7N+VkVfcV0GII83WCyhOzammcW+ok1w6SPMe4S
3audyRmo5sHtHBLNJIXi0ThO7owZRzL2QRdSDNgz82WdFYPeWUjuRmc3xsXUqPVJ
xgccR0GjCRm0msx5XA6U49jIZw6pv6rp+X1zTZp6gL2I7H1gdQJUYjBrt32J5ZPm
gzDzGJOLTo+zQXBCVw01YZsHcEpBej1yDq1SQ7ml1M5qC1dVo6amLU3BvekBsoA8
uIJj8s04bN6YzwssKs5WCq2PWVLixsjl5tMKKSn4qBpmrYzxdTJCiWRCVunx5gdY
gcW7oGMzqwW3rSNfoG/ov6UVmeGEZCzwUcI/gT1RA0YUUNhjjcrPCMQexzFWu1wf
x7r7dur1jaWdz73/XAfS
=dzm5
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
