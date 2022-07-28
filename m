From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Fix usage string to not mention "<type>"
Date: Thu, 28 Jul 2022 17:55:07 +1000
Message-ID: <YuJA27VhB+nGj4Fw@yekko>
References: <20220322080859.230337-1-u.kleine-koenig@pengutronix.de>
 <Yjp9y6YdPbC/2QGs@yekko>
 <20220323074652.kbslenf73cyjaso6@pengutronix.de>
 <Yju/1jKsqAj3W6Qs@yekko>
 <20220324080451.za5eukns7ptisztx@pengutronix.de>
 <20220620072918.uxqg3w2wzjdagx2o@pengutronix.de>
 <YrBBrzP0Xmd0B29Z@yekko>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ep5RKh9AosQ62Xqn"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1658994916;
        bh=jGfvAgAKJiNff7JyfxpgmlEDatFXMf4avWAV+4FnBB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VLjJj4c+38cAtQH59vJiRjz5P8ZZvj9aXOMVq6XPhe/c6gLvISGAE7kI5DjGIQjwR
         0mxYdtCchUyU22eO5tecnUaEqzeIHz4A7Icg5jjexD7plzWlSyO7+EHPErmLIGCESt
         y461ukuSA1Na7Kwq+OOkasdr9wZSutHekfG5h96U=
Content-Disposition: inline
In-Reply-To: <YrBBrzP0Xmd0B29Z@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ep5RKh9AosQ62Xqn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 07:45:19PM +1000, David Gibson wrote:
> On Mon, Jun 20, 2022 at 09:29:18AM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Thu, Mar 24, 2022 at 09:35:18AM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Thu, Mar 24, 2022 at 11:48:22AM +1100, David Gibson wrote:
> > > > On Wed, Mar 23, 2022 at 08:46:52AM +0100, Uwe Kleine-K=F6nig wrote:
> > > > > Hello David,
> > > > >=20
> > > > > On Wed, Mar 23, 2022 at 12:54:19PM +1100, David Gibson wrote:
> > > > > > On Tue, Mar 22, 2022 at 09:08:59AM +0100, Uwe Kleine-K=F6nig wr=
ote:
> > > > > > > fdtoverlay doesn't have a -t option, so explaining the type f=
ormats and
> > > > > > > modifier prefixes doesn't make much sense.
> > > > > > > ---
> > > > > > > Hello,
> > > > > > >=20
> > > > > > > I was unsure if I'm supposed to add a signed-off-by line. It'=
s not
> > > > > > > formalized in the git repo, so I assume it won't have any jur=
istical
> > > > > > > semantic anyhow and I didn't add it.
> > > > > >=20
> > > > > > It's true we've never formalized this, but I do generally prefe=
r S-o-b
> > > > > > lines to be present.
> > > > > >=20
> > > > > > The patch LGTM, so if you could resent with the signoff I'll ap=
ply.
> > > > >=20
> > > > > Then I wonder about the semantic of the Signed-off-by for dtc. Do=
 you
> > > > > believe it has any juristical effect if you don't give it an expl=
icit
> > > > > meaning for the project? INAL, but it feels wrong to me to insist=
 on a
> > > > > formalism but not having formalized its meaning.
> > > >=20
> > > > Well, I'm not really sure what you mean by "juristical effect".=20
> > >=20
> > > For kernel patches (and quite a few other projects that adopted the
> > > "Developer's Certificate of Origin", I'd expect that as a maintainer =
or
> > > user of the project you can assume that there are no license problems
> > > with the contribution.
> > >=20
> > > > AFAIK the S-o-b lines never have any legal force, as such - they're
> > > > just a form of documentation that helps to locate the right people =
to
> > > > contact if legal questions show up in future.
> > >=20
> > > Even without S-o-b I'm listed in the Author line, isn't that enough f=
or
> > > providing a point of contact?
> >=20
> > This patch wasn't applied and the S-o-b discussion just died.
> >=20
> > In my eyes the options here are:
> >=20
> >  a) just apply the patch as is
> >  b) formalize the meaning of S-o-b and then I can resend with my
> >     signature (assuming I agree to the formalization).
> >=20
> > I don't have a strong opinion here, but my favourite would be a) as it's
> > less work for me.
>=20
> I've been meaning to do (b), but I just haven't gotten around to it.

Sorry, it's taken me forever to follow up on this, but I've now posted
some patches formalizing the S-o-b process for dtc (along with some
other updates to the README.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ep5RKh9AosQ62Xqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLiQMIACgkQgypY4gEw
YSIM3Q/+IRg5ZBZ9zcV0HjwLBYsBYU74YjBmakHOkPAbRKpNPj/Op7+Z/NM1ZPXh
NQEUcImvS6JUJTNfDUl6ky3p9OqQORynmRmTNVh8wonX6wbLKbeCQzCSuDbkKQ6q
lsLFt3a86gfflDLRQbCQ9OJ4X/TsTp3xcCTYMz21Kr1h0QhFFYrzoBkgQTewp7TY
gqfVBdZRR3cJQ4xubuE1Chb53yfDU2tpO5eYi7IQtRYr99Yi4Rvw7GovktotYVDW
AjnJIIZTCQd01VRwtmSFiU/jNn4xpeiKc8hLKYCoVfI9/KUAZidt60yECDrNi3/Q
C9TNrZeXIjdercJi3+mILDdcX0oo2n52gwzOrKna0svMVGTJe1n7LTS96SwOc2U7
FS5Wppok/lh5//m3NwFsDqhTjRtP61X4MKF/Qv2L0tBHRXMGAL0UsEvFu/g5JspS
nplW/PMaFnhdpayc+gxLJ73rbBVAy5IFV0fHvCVgDkYvLvJqusUFlcuxhKv7hQ/b
XhFN6aLNepdKCJhL5B/3OhtmBf6CT1wCH0iZuCmbdz8s3nPgx9xRPTWicyMoHndy
HO4Yraw2rPOKqxJLU+gPo/HVyZZtD3+lhj4PKrvsX9o106NF5sO7LVSuoaeqkzrN
V/4WDWu0Pd6lEA2XLM8nyDMn7K850xZCdBI6kNhZqBrrAqgXSxw=
=It5x
-----END PGP SIGNATURE-----

--ep5RKh9AosQ62Xqn--
