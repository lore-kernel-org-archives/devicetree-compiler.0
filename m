From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/4] Add description of Signed-off-by lines
Date: Fri, 29 Jul 2022 12:57:15 +1000
Message-ID: <YuNMi9bi6Cuazi0a@yekko>
References: <20220728075348.174412-1-david@gibson.dropbear.id.au>
 <20220728075348.174412-5-david@gibson.dropbear.id.au>
 <20220728160800.xiexlk52grqxre3j@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ncH1DKp98KfnL8sA"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1659069528;
        bh=f49Vde6hQswjHAWzdwNl5iKqSBC0Hs8bEiNj4MUxV1o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FMgtECYe32SHXfUpZnOYaO3mwb1f16aDxeN/jgmm9RENdCyEYHL78exyb5lB1ICg+
         2srW8cAa04vnYSQJGQo6MHmXrNH7r/ZfkjXRnc+D5CqgbgqwTTdMDRatqolSLKQZMn
         dC2IVskZxDK0AOxs8garRFoGClV5xZhnqdrM4k4s=
Content-Disposition: inline
In-Reply-To: <20220728160800.xiexlk52grqxre3j-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


--ncH1DKp98KfnL8sA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 06:08:00PM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Jul 28, 2022 at 05:53:48PM +1000, David Gibson wrote:
> > dtc and libfdt have been using Signed-off-by lines (as used in the Linux
> > kernel) for some time, like a lot of open source projects.  However
> > Uwe Kleine-K=F6nig pointed out we never really stated what they mean in=
 our
> > context.
> >=20
> > Add information on what the S-o-b line means in CONTRIBUTING.md - this =
is
> > essentially a quote of the same information from the kernel documentati=
on,
> > with some tweaks to make sense in the new context.
> >=20
> > Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>=20
> Looks good, thanks.
>=20
> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>=20
> Will resend the patch that triggered that discussion with an S-o-b line
> soon.

Great, thanks.

I've merged this series into the main branch.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ncH1DKp98KfnL8sA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLjTHMACgkQgypY4gEw
YSKaVg/+LWgql0sDv9wq8drc32v0Go+aeTEEHHjBdGKnJpyYk9QdujaEpLMabm/p
q0qaDPywC7zpVxr+lq6KDsvWSmjspYraAnvdYIeREs1YFcAslNtQTHD938ech5R8
ilV2vLBRwGkAZrfU56045AWH3GGJ+ckhGHPnqTQKROd8MPMJ9jgRERKH3M7rgG5o
uzMoUY2b1e+73YtuXkX/prjjO91R/0o22YDUgh7ueAt/x6vwJAaqfRyoBE0+auAM
voi4pEFIciObBHJdAhalZmcApq4NenRB+f7kuXhvfzaqo1piOL6oy+OVT5t4ack1
9VlOUFVN4AeClR/khgI5qsNboJC4S+iUD9swomQ2n3svjD77dXNAdWVihlkL277k
YsqRZ9VEnxPhYDbX6IRNvvgSn8D7dOS86Cfv1r0febqwvEE1Pz+/Q0FzIFEWXe1E
jyVvxHiFG/W4oJXndXK8gU4Yu7qrxmoyJlZdL0VLI2p+uAJKmgVBvrsyiquryoWL
Ukv29L3tOJe8N7OVYFvTcBfCG/EfGhGuxC+F2NyX2WYGiA+XZj6Cu0Kv2BB1FtNo
r3rX35YerpSc57NP3zLok6LRt6VqYqLE8mKh63T2olBEkpxVeqrv+MV5yNdbkG1S
loEVqD7kwk+9bm7LcJb3sqYQMF+WQqxKxraxApDnxxgXTC2GfA8=
=f9rK
-----END PGP SIGNATURE-----

--ncH1DKp98KfnL8sA--
