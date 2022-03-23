From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Fix usage string to not mention "<type>"
Date: Wed, 23 Mar 2022 08:46:52 +0100
Message-ID: <20220323074652.kbslenf73cyjaso6@pengutronix.de>
References: <20220322080859.230337-1-u.kleine-koenig@pengutronix.de>
 <Yjp9y6YdPbC/2QGs@yekko>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sxuqjx36aj35qrkt"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Yjp9y6YdPbC/2QGs@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--sxuqjx36aj35qrkt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello David,

On Wed, Mar 23, 2022 at 12:54:19PM +1100, David Gibson wrote:
> On Tue, Mar 22, 2022 at 09:08:59AM +0100, Uwe Kleine-K=F6nig wrote:
> > fdtoverlay doesn't have a -t option, so explaining the type formats and
> > modifier prefixes doesn't make much sense.
> > ---
> > Hello,
> >=20
> > I was unsure if I'm supposed to add a signed-off-by line. It's not
> > formalized in the git repo, so I assume it won't have any juristical
> > semantic anyhow and I didn't add it.
>=20
> It's true we've never formalized this, but I do generally prefer S-o-b
> lines to be present.
>=20
> The patch LGTM, so if you could resent with the signoff I'll apply.

Then I wonder about the semantic of the Signed-off-by for dtc. Do you
believe it has any juristical effect if you don't give it an explicit
meaning for the project? INAL, but it feels wrong to me to insist on a
formalism but not having formalized its meaning.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--sxuqjx36aj35qrkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmI60GgACgkQwfwUeK3K
7Anypwf/d+yJkY2J3kiZ+W0UUxbPPWX/Qlr84xwlDURoDSnC/ju4OxQeQUWzXu7S
+hUqjvo4PIQ/vAh2YTeJglgNr2YO+ulyc2MWnphVOiVUmTQ4xl8bfLVoHLYoBXsE
lcacQ24bpXWJawVrr0uyGMiGpk/W5e47rM9cFdaKHtMOGtyrFchwmys9EyABYiyO
sKd80UCJNKslD8zC7gfgm0j8YotPIxHSr+P4kvXkBPDmzXU+FApcw+If9FyANCNZ
8Kz6ZSW+0is2Do+cjnMcRgKVT6l7WNlZac96dRR8nT4D5P3YHGTpPWLu+W0HbjO4
Kkgg5wrLaflbXZvLMwXMXph3ySwjLA==
=HjJZ
-----END PGP SIGNATURE-----

--sxuqjx36aj35qrkt--
