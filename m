From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: Add an option to generate __local_fixups__
Date: Fri, 28 Apr 2023 17:03:05 +1000
Message-ID: <ZEtvqfbhw7tasNbp@yekko>
References: <20230424161007.104212-1-u.kleine-koenig@pengutronix.de>
 <20230425102120.5yprd2vv5vmvtmos@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fpbahzTenZBL0GLr"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1682665444;
        bh=pOJ9FZ9ZcqeNIuaGNSsVApsWzghmGrRUvC0MJaDZDVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WumSiHqfS4zzmG6xQFh36eLv7lVJ8q5dV1sLWBnXM1Q2XSo/EfU045tXmBapkAhs5
         j8UjRj/0BiOZi2bEm6ZvEbFG805WgR+FAaNqydiHDqJDA/+nALKzGqLOXqZJW2Z7eZ
         VLTLoe9LoK9jWcIHVNIHt7n8uB/SF7UE4D7ZML6Q=
Content-Disposition: inline
In-Reply-To: <20230425102120.5yprd2vv5vmvtmos-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--fpbahzTenZBL0GLr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 12:21:20PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Apr 24, 2023 at 06:10:07PM +0200, Uwe Kleine-K=F6nig wrote:
> > This happens implicitly for dts files with a /plugin/ tag.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  Documentation/manual.txt | 5 +++++
> >  dtc.c                    | 8 +++++++-
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> > index 15a7837d3cef..94dafb8ace6b 100644
> > --- a/Documentation/manual.txt
> > +++ b/Documentation/manual.txt
> > @@ -126,6 +126,11 @@ Options:
> >  	property for each label. The property's name is the label name and the
> >  	value is the path of the labeled node.
> > =20
> > +    -L
> > +	Generates a __local_fixups__ node at the root node. For each property
> > +	that contains a phandle, the __local_fixups__ node contains a property
> > +	(at path __local_fixups__/$a if $a is the path of the node). It's val=
ue
>=20
> I noticed before sending that I need s/It's/Its/, but only did the
> change in my working copy and failed to add it to the commit.
>=20
> Feel free to fixup when applying this fix, otherwise I can also send a
> v2.

I have some comments on this one in the github PR.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fpbahzTenZBL0GLr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRLb6MACgkQzQJF27ox
2Gfaww/+Py/Q8NWt8nJOEAmFgVWA77i6C+eTkcKv9mFm26JEGbAfAAhgZ3NlcGsJ
r63wKTPL0eip8ylGXF+BBv84iGK79Qex4iQssdE38+pPNrZWK/XnB47H9yhiKJ1M
ZuS/Ae0+Xj6q2O2s1b+Ru/xZdpWtIM7lNBxKW8hf0Pg0i3wVkP2CQGNQBKRsGpeE
+BvmXVa62JcDNPu6LwHvsvp9RYIMNwSRE0rbJ7spXH0/NlZ9zvr8l+9htZNFq8rn
YFFrf+hks4fxT58+OJqSQsw0suxJcYzjAGcrVSKGeNYxbKRERubwO4AQH3WcNPOv
u7dbax0RiewOtUo4t70RBOkrTMCj9xIEwKqeQTSjcqvjUSR7cJSCq/I5JyqWnpNt
amMSlgHE3HS+n0WTLM8/gGFzVi5hgJLtM8IZv0Wy40zeYFtK+DEcWHSdPdr8LgaN
HqSK70vtaEgkuHvd+cHRjKm8gJJRoWRsNCVfZnsVI2xVMr//QwLN7tabdYQvSOtJ
E5D1ox/dkH80tE/DGyuewmdNhcziD4XBT5XE2r+iAavN6bKgfsdHkTVue8cbYjb8
oC5IhGNMNrFSVGpQQxhxQQAgVzqoG0Jy8+yS83054S/42DL4cGxQCGVafo/PKm1Y
qR8LT2dkScdViAM29x2ATUK/qUq5M23vZaawWECufxgpSM9BUIM=
=+NeB
-----END PGP SIGNATURE-----

--fpbahzTenZBL0GLr--
