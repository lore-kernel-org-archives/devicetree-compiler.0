From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Fix usage string to not mention "<type>"
Date: Thu, 24 Mar 2022 11:48:22 +1100
Message-ID: <Yju/1jKsqAj3W6Qs@yekko>
References: <20220322080859.230337-1-u.kleine-koenig@pengutronix.de>
 <Yjp9y6YdPbC/2QGs@yekko>
 <20220323074652.kbslenf73cyjaso6@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1KKdoGxg4/XJKHhW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1648088484;
        bh=TeYzgVstu3jI3w+4Xzc8JEMunfWHU8PrcqKubfd8c60=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hyQ4T/dYswzzGJIZzNRvyVhPKlFdIXVjt55o6byqjQL9yX9OctNThx9DsGYNPIFq2
         IBIWJQ61Wsl6Lb64UPCUlA7KJJ4HCe+T0N/IqXl4FeDRxBJCCfkzLHWlHgnlO3V7r2
         4jN0lUuHpYf+ZgM9MH3IIJFXn2g0Bq5YEef/dHvM=
Content-Disposition: inline
In-Reply-To: <20220323074652.kbslenf73cyjaso6-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--1KKdoGxg4/XJKHhW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 08:46:52AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello David,
>=20
> On Wed, Mar 23, 2022 at 12:54:19PM +1100, David Gibson wrote:
> > On Tue, Mar 22, 2022 at 09:08:59AM +0100, Uwe Kleine-K=F6nig wrote:
> > > fdtoverlay doesn't have a -t option, so explaining the type formats a=
nd
> > > modifier prefixes doesn't make much sense.
> > > ---
> > > Hello,
> > >=20
> > > I was unsure if I'm supposed to add a signed-off-by line. It's not
> > > formalized in the git repo, so I assume it won't have any juristical
> > > semantic anyhow and I didn't add it.
> >=20
> > It's true we've never formalized this, but I do generally prefer S-o-b
> > lines to be present.
> >=20
> > The patch LGTM, so if you could resent with the signoff I'll apply.
>=20
> Then I wonder about the semantic of the Signed-off-by for dtc. Do you
> believe it has any juristical effect if you don't give it an explicit
> meaning for the project? INAL, but it feels wrong to me to insist on a
> formalism but not having formalized its meaning.

Well, I'm not really sure what you mean by "juristical effect".  AFAIK
the S-o-b lines never have any legal force, as such - they're just a
form of documentation that helps to locate the right people to contact
if legal questions show up in future.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1KKdoGxg4/XJKHhW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmI7v80ACgkQgypY4gEw
YSKKBBAAoo2lcWvVY+/F3zZtzYUGbRk/tafKotUNTuR7PVepybq3cBWQrsUkSQ2q
ggHs2KkuL6y4yDfxQ5Q3of28Beq/xM5Rq58wIDIpk9yYRDQsBNV3V7vpfeF/sfGf
7penStZmBCyrjf8orzialmiTQTvaZF/JTzpHW0SxalD/n0/oxwVYXXVXLJXp1XZq
YdfZtu7lZVFQQbzwbLdtJgu/EHo86/YDBL4SzNox4AmNjAER2QVTONB/gUoO0uoF
6Xd8jzBNwDGiiBB2tl1bkww6AwIEfKfongHXWyKbPF1IHI8CLTp9aHGm7W4K6JnZ
Y5xnD0X3D0bu462kO5/F5qQGWIksmYYpR5pNvTD8793+QpyP2yl9J6yt0SFACdOS
rkO/3uR2TYzr+vYS0RQiBzlbsqBdladbhOvYeIToRXG3eKMwMK4DsucZmGnbB0X1
k7fIV3zDEi4SbCKdQjZK5UTMWnOJcj5TXL3/YB2qwmGjjCkR/CIK3BZoPUksMBpq
a6QMnaw/2eDawsm9qKs4PL53KHL7/Iw9EXKnQiOZRNSgX8cJy4OPWAMTDgRVKu6y
lnft1ufqcwsLaYQaV+fvkamSIEbqZCdpOsN2rpv2ZQoXzDoIwxteSfEmMd0lfSrz
zE7njTyBAmDidc01Ts+vA5odMcBuo7pAk7QluyoxJFJ+14TTJMY=
=HOOa
-----END PGP SIGNATURE-----

--1KKdoGxg4/XJKHhW--
