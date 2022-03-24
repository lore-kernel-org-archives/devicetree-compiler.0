From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Fix usage string to not mention "<type>"
Date: Thu, 24 Mar 2022 09:35:18 +0100
Message-ID: <20220324080451.za5eukns7ptisztx@pengutronix.de>
References: <20220322080859.230337-1-u.kleine-koenig@pengutronix.de>
 <Yjp9y6YdPbC/2QGs@yekko>
 <20220323074652.kbslenf73cyjaso6@pengutronix.de>
 <Yju/1jKsqAj3W6Qs@yekko>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xb6iqqlctmy24l5r"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Yju/1jKsqAj3W6Qs@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org


--xb6iqqlctmy24l5r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2022 at 11:48:22AM +1100, David Gibson wrote:
> On Wed, Mar 23, 2022 at 08:46:52AM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello David,
> >=20
> > On Wed, Mar 23, 2022 at 12:54:19PM +1100, David Gibson wrote:
> > > On Tue, Mar 22, 2022 at 09:08:59AM +0100, Uwe Kleine-K=F6nig wrote:
> > > > fdtoverlay doesn't have a -t option, so explaining the type formats=
 and
> > > > modifier prefixes doesn't make much sense.
> > > > ---
> > > > Hello,
> > > >=20
> > > > I was unsure if I'm supposed to add a signed-off-by line. It's not
> > > > formalized in the git repo, so I assume it won't have any juristical
> > > > semantic anyhow and I didn't add it.
> > >=20
> > > It's true we've never formalized this, but I do generally prefer S-o-b
> > > lines to be present.
> > >=20
> > > The patch LGTM, so if you could resent with the signoff I'll apply.
> >=20
> > Then I wonder about the semantic of the Signed-off-by for dtc. Do you
> > believe it has any juristical effect if you don't give it an explicit
> > meaning for the project? INAL, but it feels wrong to me to insist on a
> > formalism but not having formalized its meaning.
>=20
> Well, I'm not really sure what you mean by "juristical effect".=20

For kernel patches (and quite a few other projects that adopted the
"Developer's Certificate of Origin", I'd expect that as a maintainer or
user of the project you can assume that there are no license problems
with the contribution.

> AFAIK the S-o-b lines never have any legal force, as such - they're
> just a form of documentation that helps to locate the right people to
> contact if legal questions show up in future.

Even without S-o-b I'm listed in the Author line, isn't that enough for
providing a point of contact?

Best regards
Uwe

--xb6iqqlctmy24l5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmI8LUMACgkQwfwUeK3K
7AnFzAf+IPM4mKVQSy2iFEDzFl7qGTmTrGbQ+tfu5sxr40QyAcVTSCs5FPd0WTwk
z96LVCRaaSUoOULJsRWyQk3NV6kDOTtfMk0IzBFOX9RMY1gvlbni0nRVtGRVl06Y
tv/MkAqa5jYuZ2fjkHSEWlscF079OTYDYmPXdk/GPrln5/ZpJIdyhXtoa+DsK+Mp
TNIsIUUAAuKl+TN0JP/IwECElczSxn4A+eJ23yaS11WhyKMJDO5YdWzwKryb5yms
uT2FDqMVoKiXYeNio88a9FwEYcO6GDpSZw4UxDnFPQ57eTg3QkqOgj/1s/pIsI1c
cxFl/MH/zUi9AJu4A+2HuOWvqodZ+w==
=NHvv
-----END PGP SIGNATURE-----

--xb6iqqlctmy24l5r--
