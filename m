From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Fix usage string to not mention "<type>"
Date: Mon, 20 Jun 2022 19:45:19 +1000
Message-ID: <YrBBrzP0Xmd0B29Z@yekko>
References: <20220322080859.230337-1-u.kleine-koenig@pengutronix.de>
 <Yjp9y6YdPbC/2QGs@yekko>
 <20220323074652.kbslenf73cyjaso6@pengutronix.de>
 <Yju/1jKsqAj3W6Qs@yekko>
 <20220324080451.za5eukns7ptisztx@pengutronix.de>
 <20220620072918.uxqg3w2wzjdagx2o@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4ahp9aJwhF+/fFfa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1655768628;
        bh=tgipOpkfWvrzyHcQnAY7pmP01gDSeodJqBZYAn2QBBk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RDQabP6yY90zttaMpIV19hNoMasxDXndxG76pJNHSC0brtOp5Jn7dYWRmyylm7Zhj
         KjkK/nxf4dho+QdBvyuxiLbKtuIbae3M3jwmiQObUzU629TqZVsYCCvOdoCApHnzck
         fuzapuxw4GHGTEflcBF7LYivH4sOpa5Zv2q3Ox+Q=
Content-Disposition: inline
In-Reply-To: <20220620072918.uxqg3w2wzjdagx2o-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--4ahp9aJwhF+/fFfa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 09:29:18AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Thu, Mar 24, 2022 at 09:35:18AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Thu, Mar 24, 2022 at 11:48:22AM +1100, David Gibson wrote:
> > > On Wed, Mar 23, 2022 at 08:46:52AM +0100, Uwe Kleine-K=F6nig wrote:
> > > > Hello David,
> > > >=20
> > > > On Wed, Mar 23, 2022 at 12:54:19PM +1100, David Gibson wrote:
> > > > > On Tue, Mar 22, 2022 at 09:08:59AM +0100, Uwe Kleine-K=F6nig wrot=
e:
> > > > > > fdtoverlay doesn't have a -t option, so explaining the type for=
mats and
> > > > > > modifier prefixes doesn't make much sense.
> > > > > > ---
> > > > > > Hello,
> > > > > >=20
> > > > > > I was unsure if I'm supposed to add a signed-off-by line. It's =
not
> > > > > > formalized in the git repo, so I assume it won't have any juris=
tical
> > > > > > semantic anyhow and I didn't add it.
> > > > >=20
> > > > > It's true we've never formalized this, but I do generally prefer =
S-o-b
> > > > > lines to be present.
> > > > >=20
> > > > > The patch LGTM, so if you could resent with the signoff I'll appl=
y.
> > > >=20
> > > > Then I wonder about the semantic of the Signed-off-by for dtc. Do y=
ou
> > > > believe it has any juristical effect if you don't give it an explic=
it
> > > > meaning for the project? INAL, but it feels wrong to me to insist o=
n a
> > > > formalism but not having formalized its meaning.
> > >=20
> > > Well, I'm not really sure what you mean by "juristical effect".=20
> >=20
> > For kernel patches (and quite a few other projects that adopted the
> > "Developer's Certificate of Origin", I'd expect that as a maintainer or
> > user of the project you can assume that there are no license problems
> > with the contribution.
> >=20
> > > AFAIK the S-o-b lines never have any legal force, as such - they're
> > > just a form of documentation that helps to locate the right people to
> > > contact if legal questions show up in future.
> >=20
> > Even without S-o-b I'm listed in the Author line, isn't that enough for
> > providing a point of contact?
>=20
> This patch wasn't applied and the S-o-b discussion just died.
>=20
> In my eyes the options here are:
>=20
>  a) just apply the patch as is
>  b) formalize the meaning of S-o-b and then I can resend with my
>     signature (assuming I agree to the formalization).
>=20
> I don't have a strong opinion here, but my favourite would be a) as it's
> less work for me.

I've been meaning to do (b), but I just haven't gotten around to it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4ahp9aJwhF+/fFfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmKwQZMACgkQgypY4gEw
YSLU1A//Q7m1FJr6LfZRwmG7mxuaQ2OxbAeJkxc8O9nHxMces4UDxKnPqbzibHYc
KtkFaPQhnxmMhxYthEVgO6bmzFOvyDQrnnxdul+pLBlQZ8R4TJD2E7Kbh5h3TeMK
D7vFD5GXDkSwZgukusY9dP9sjiStmECRm0BJgDxbR2nDXv3IKfzde9KaRKZRaoPn
sa7vzyRA4z4y6pKC11gmCi6ECNQ0t0B9W9vtq9y18l2E/jLuTOnkXu19iTJobhI/
rnkTo215NmTNA+PYGLDRxGg1q2QbDnn55g4tW8aYp4ga2K6QRBCrRn9o1atXylLX
eOTWPxKy3FFbc31rgHntyys4RhweTr8GYAxizAFzJa5ZlYBwZWSU+0+eNEZtM8J3
ixwMLtr726HteaBB/y6UZJ/3HyDrh4C9DFvAXng+eGyR/SmjpGI6FCbMuVrYarem
rEXpAr7lbzI25GX0Be71oBZmtaSDKZ4o8TcQHNfoi8kO/rqZZWq0D7FMBFPvTajD
8SagqqO7c5X9PDXPDolnd+NJ4gsukuFkuDYtJkZBB7yGc8FfZj2e1o3pHg781MGA
Lz4KUSQHse0nbk440XdAMDv+PN0eqVE5q7cp1b04TlKsGMivkm0K6GqrMN3jUQoM
ZquIrAZcXzpdV0Je31ov0PLsMKE2mRqESmUIa73SevDIjZ2G8ck=
=7R/C
-----END PGP SIGNATURE-----

--4ahp9aJwhF+/fFfa--
