From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Fix usage string to not mention "<type>"
Date: Mon, 20 Jun 2022 09:29:18 +0200
Message-ID: <20220620072918.uxqg3w2wzjdagx2o@pengutronix.de>
References: <20220322080859.230337-1-u.kleine-koenig@pengutronix.de>
 <Yjp9y6YdPbC/2QGs@yekko>
 <20220323074652.kbslenf73cyjaso6@pengutronix.de>
 <Yju/1jKsqAj3W6Qs@yekko>
 <20220324080451.za5eukns7ptisztx@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dcb3ft3gkviemw7w"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20220324080451.za5eukns7ptisztx-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--dcb3ft3gkviemw7w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Mar 24, 2022 at 09:35:18AM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Mar 24, 2022 at 11:48:22AM +1100, David Gibson wrote:
> > On Wed, Mar 23, 2022 at 08:46:52AM +0100, Uwe Kleine-K=F6nig wrote:
> > > Hello David,
> > >=20
> > > On Wed, Mar 23, 2022 at 12:54:19PM +1100, David Gibson wrote:
> > > > On Tue, Mar 22, 2022 at 09:08:59AM +0100, Uwe Kleine-K=F6nig wrote:
> > > > > fdtoverlay doesn't have a -t option, so explaining the type forma=
ts and
> > > > > modifier prefixes doesn't make much sense.
> > > > > ---
> > > > > Hello,
> > > > >=20
> > > > > I was unsure if I'm supposed to add a signed-off-by line. It's not
> > > > > formalized in the git repo, so I assume it won't have any juristi=
cal
> > > > > semantic anyhow and I didn't add it.
> > > >=20
> > > > It's true we've never formalized this, but I do generally prefer S-=
o-b
> > > > lines to be present.
> > > >=20
> > > > The patch LGTM, so if you could resent with the signoff I'll apply.
> > >=20
> > > Then I wonder about the semantic of the Signed-off-by for dtc. Do you
> > > believe it has any juristical effect if you don't give it an explicit
> > > meaning for the project? INAL, but it feels wrong to me to insist on a
> > > formalism but not having formalized its meaning.
> >=20
> > Well, I'm not really sure what you mean by "juristical effect".=20
>=20
> For kernel patches (and quite a few other projects that adopted the
> "Developer's Certificate of Origin", I'd expect that as a maintainer or
> user of the project you can assume that there are no license problems
> with the contribution.
>=20
> > AFAIK the S-o-b lines never have any legal force, as such - they're
> > just a form of documentation that helps to locate the right people to
> > contact if legal questions show up in future.
>=20
> Even without S-o-b I'm listed in the Author line, isn't that enough for
> providing a point of contact?

This patch wasn't applied and the S-o-b discussion just died.

In my eyes the options here are:

 a) just apply the patch as is
 b) formalize the meaning of S-o-b and then I can resend with my
    signature (assuming I agree to the formalization).

I don't have a strong opinion here, but my favourite would be a) as it's
less work for me.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dcb3ft3gkviemw7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKwIcsACgkQwfwUeK3K
7Alt1gf+KuqsTy8XQrYSE9UqqnFKEHHOifaofU53KyKxD1Cyg4h0EHegmCwXZEXg
DFch0RFQGit5CcYm/QNzNNMr65+cIN5xRp8DoM3YRNqL6NRltxJZ67Shgfs7sXa9
3ky+xgsUpeZey11ZHShJFDTyH2vGtUTHqmqXQ8hZTzqtwT/+T+9o58KeqL0/+J2x
AQP70/DkHJaoxFy6N9hR5nXr3x1TcDA7bqoKDkulkwA23Rc6tamBj+9zV2y2h6XB
5/COptARjdnU1Nh0jTdLHrSZ2K15YnJQ8EoE1NxD7gAM5DW/aVqXNztU6H5pyrU7
32+et1NDiMViZPccfIy7onfZxeVktA==
=2Vhd
-----END PGP SIGNATURE-----

--dcb3ft3gkviemw7w--
