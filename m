From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] dtc: Add an option to generate __local_fixups__ and
 __fixups__
Date: Tue, 23 May 2023 13:09:03 +1000
Message-ID: <ZGwuT50YlXmtfylW@yekko>
References: <20230522081629.385489-1-u.kleine-koenig@pengutronix.de>
 <ZGswiPv/CAl/Z4EH@yekko>
 <20230522142032.5e4rqg7iokta5vkp@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X6AGD+UMEuj/jVq3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1684811351;
        bh=ena0EmMV8jm0vUYDLgx5MbwCd3R/s1CdR1S3q6l8gIc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UuMvaK3nAfES0PyTFbcU+uBhqwj+gercBGH7Pve34J4q0OZMXKLvup/EC85fQemeb
         SXOhQ1UtYLyCGhlYj4/laVL/msNb0m8C+80qb8awQnxXSqbPVzSAgxQ+Tv8FdHdzEr
         X/K638S6PMZ+AlD75hNWEu3hQEeFsjXtob/JkxpE=
Content-Disposition: inline
In-Reply-To: <20230522142032.5e4rqg7iokta5vkp-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org


--X6AGD+UMEuj/jVq3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 04:20:32PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, May 22, 2023 at 07:06:16PM +1000, David Gibson wrote:
> > On Mon, May 22, 2023 at 10:16:29AM +0200, Uwe Kleine-K=F6nig wrote:
> > > This happens implicitly for dts files with a /plugin/ tag.
> >=20
> > Remind me what the use case for this is?
>=20
> The idea is to have enough information in a dtb file to restore the tags
> and phandle-refs. Look for "[PATCH] dtc: When compiling to dts interpret
> /__symbols__ and /__local_fixups__" in your inbox.
>=20
> Is this a request to improve the commit log? If so, maybe:
>=20
> 	dtc: Add an option to generate __local_fixups__ and __fixups__
>=20
> 	This records detailed usage of labels in a dtb that can
> 	later be used to restore labels when compiling back to dts
> 	format.

Yes, having that extra context in the commit message would be good,
thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--X6AGD+UMEuj/jVq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRsLkkACgkQzQJF27ox
2GduXQ/+OltfzhlP9E6PIKZ7vKul4smGar8LVpUv/oN2lMHe7eYD3nJrBaiCBPgc
rsAsqEIjmAt6pSTZMGitMi8ngN1lVWwH3rquxLwbseVqmfUFAvIl0qBq3FuvwqrD
BiuVkvsKXR3EqsgdGHHCng3S3LhuT1+zd88dT3kgdSMYtNj7MHf9VkXYJ6DFDuAm
bBZOPWBs0pTGAFK7G6keUYrNEXeGAGPKm5LdgW80QCJgsDXDqjdvsG9mAOEG3rxj
6MMz3l6Aa3fsqLRMBBoR0OKOtY/3L8V0egxUYXUYPb90fkv2RVuEiOvo5SzYL54c
YTdyhH8QcJDMjKffau96FOMtxlfvK92Rbdmzav1/mESVOxF5YfgOwQD188CKNIAD
5YMBj04nHjnLBoDZXeqGyfRM3x1MTk6V6G+aVNpIraEXcBlmZrzAhUB/w5zFBa3p
ToTCJl1BzT4bQe2fXutBvT2L2+Lgk3jkRAHzJ9ttAOK6iXA252KdryP1WjwtJVfV
KNvRsRkuBcvZ5aIP6TnzjSNjlOAprrG+L3foaUtV31HL392uu8AkKEzT5QeCvzRE
rN7vI0/k6e31wiZBOX9g1cVvpgn93Nv+yxW894Vwak7h67LKm9An4VL6fzV8nuap
GljekGP1kDtorFbzHY0HhBwj3ECORudjWJFMMHLjFqpdtmxCKJw=
=wQ8F
-----END PGP SIGNATURE-----

--X6AGD+UMEuj/jVq3--
