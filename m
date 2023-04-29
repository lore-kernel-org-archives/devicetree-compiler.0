From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Bug or feature? /somenode overwrites /somenode@17 in fdt-overlay
Date: Sat, 29 Apr 2023 16:22:11 +1000
Message-ID: <ZEy3k++MQmQ++hbu@yekko>
References: <20230425145504.tswuitufzikuhmnz@pengutronix.de>
 <ZEtvOVy3eZwgubMr@yekko>
 <20230428180441.hn34wlwevuj75zml@pengutronix.de>
 <20230428184007.56cwbzk5fe5trb4z@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wl4T9gWxHQK9L1zy"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1682751134;
        bh=HGqUmEdZE63CeyrYWSdyDRYMhGhuJKGzN0tPhAdn50g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BxWm6mAzwvS9ccl0DW6TAU+4EnDY86uanmnEBBkQq47CJrc74JVpteQMPKGVfFdD2
         Qhpww5aHqQRsWOX8qk4jWv7NLJyJX4VeXxMqO/xOrXQg0pA8GAB/n5ihQNrDT4ErBB
         OaXbDNKv4KkTmtHSZcW7NVDxq0JPOgpsfQUIxnCM=
Content-Disposition: inline
In-Reply-To: <20230428184007.56cwbzk5fe5trb4z-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--wl4T9gWxHQK9L1zy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 08:40:07PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello David,
>=20
> On Fri, Apr 28, 2023 at 08:04:49PM +0200, Uwe Kleine-K=F6nig wrote:
> > Still adding the strict flavour variants of the affected functions is a
> > good idea. Then future usages can consciously choose which semantic is
> > intended.
>=20
> Another surprising instance is fdt_get_alias() which might behave in
> strange ways if there is a node at /aliases@12345.

Technically true, but having /aliases@anything is something that
should never happen anyway.  We should probably add a check for that,
if we don't have one yet.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wl4T9gWxHQK9L1zy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRMt40ACgkQzQJF27ox
2GfQ4A/446RncIvJmz9NO68FzlvFuC+siPwdQRt6HAT985Gu7L5aiClXrVP1KxGk
eDx43thFdQBToRhFNhg/T75FUsFRcj5MFY5lyEpsF7HvGDKDR6cUQMLewpJsJNUQ
aCZu/4VyBRdLjLcC1NZQHqJQJ7O3oGSjZ4xjKt5HuvMDFQj5y8ZWR2cJsDxTfJgC
4rh7WhGkRVmrk/qBV0rlj9oGvV4H25hvlmVCtpID74vNcU2YiUryAWYUiHuAu2Wy
nRCuKi1uxutuCgFK39DJhw0BMekNxPuKcTnaomj0O1sj4SH6e0eHNzs9lAHRQ3I7
gwSjwDP7XgMtIQU5z3aoix/U4ed5PuWU6SFze7aSBjzQKca4+SIdrBi0jvHtXT5a
RY4245ucUHwvB4DAFR9bM/Z5ZWNQQ428JnxBf2DmONjivnkbOLl+X7n/NVEt124V
qzBkq2YqLSvJBTopkLc4nXcaCTOX/o15p3w6IKkYmeo78Eddj0i4olD/JqwOBMlb
xD/RpHaXUmvXoZjFqOpMyJz4upR+y+XjPN7kiaQX0q+8BbQmtWwTRyefIOKNRJYr
2LRR/TtT2nBJ+Er/5l8wzuebANvOTN+z05NhaR6nLfQ6O45qfFPnCi5JC8qh1+OM
FPfNsGPo2TYQrBxewJWuXHZm+6cYNuq4BVum6GW7yZRCFxs6zQ==
=1r96
-----END PGP SIGNATURE-----

--wl4T9gWxHQK9L1zy--
