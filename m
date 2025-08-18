Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0394E8632B
	for <devicetree-compiler@vger.kernel.org>; Mon, 18 Aug 2025 03:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755486401; cv=none; b=N2uNLGMx3bBXI8XgbvsBJqGVORFfYZV5lnRWMnoSQK8ws5/sScoJjeMx0lw1IsH6Hmn2v4hA2YUPRbt0eqzVmdunMJmUIPPKakm+y3BX0cTxvE2MgEMVlc/Xm7W4mD48STnuY1TWg3Iqb3zjvow0U9yo9/IAfVOHuUelxQ5jESI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755486401; c=relaxed/simple;
	bh=k34Ixe0TS2KB2AXAz7+mqgP+eKf0d/Vs3pVQ/vwTzYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3cJwQla2RVk6Ff7/KGh5joG1Vzteuvgs5XN9x+oqPvRNBWGGi51s7ltNTqFAic2yDzkPkr+gv1May7vRx8cOqEhA+hA2obrvvYEsce8OZcdwadEMSkw/aIa7mALeKq0UppM3sWl1G1Q8EMQsL+p/+yqG6TiP+D2/teSxKXuAEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=TQEhKC6t; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="TQEhKC6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755486394;
	bh=o78lzZ4fpfatv6BPO6wj3pqdYsITSqnHWAuuVjJ0FD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQEhKC6tICyQQGbuHYYvPfv1Ac8s/eWTeoKj/Hdv5mHG+vitbPqdj3+FOCNi5in7V
	 rhWRR7QqxcqV/msKl3kFHSTf3XBDf7xtIaX+Rm4ZZ22nG4V/NF4hhBb5BE+I7o+V9u
	 t7K53szY7tZT4lQzWG+0z2QzSl54HPJQKWGYn0fCW5jfJULr0lQZ2UXno45F2NlNdk
	 DQFo3Y6JfeyjUpo/3ye+moTXIIdQNxNGz/uvqO6+6SAoqj9FxUthDxnCtA7z9kVj7Z
	 gkwURMT5Za/S16cTw1x5ZfX1DSO6WSrT9K9sImSirljZNOW7lP9Azdju3FIn+i7lTI
	 FyKghLXX+epxg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c4yKk255vz4wd0; Mon, 18 Aug 2025 13:06:34 +1000 (AEST)
Date: Mon, 18 Aug 2025 13:06:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 2/2] livetree: Add only new data to fixup nodes
 instead of complete regeneration
Message-ID: <aKKYtbra546AQLlz@zatzit>
References: <cover.1755264521.git.u.kleine-koenig@baylibre.com>
 <68b0f2845c5b7b439c3d5decb518ec3e236c426c.1755264521.git.u.kleine-koenig@baylibre.com>
 <aKAPA4EAI_RAm64c@zatzit>
 <2jywkljpilxb654diunhguk7apu5st2cotkgjjvyn25cpq6slx@e5ufgjcipzez>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yb4KCq2iHOoPlJMu"
Content-Disposition: inline
In-Reply-To: <2jywkljpilxb654diunhguk7apu5st2cotkgjjvyn25cpq6slx@e5ufgjcipzez>


--yb4KCq2iHOoPlJMu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 12:40:59PM +0200, Uwe Kleine-K=F6nig wrote:
> On Sat, Aug 16, 2025 at 02:54:27PM +1000, David Gibson wrote:
> > On Fri, Aug 15, 2025 at 03:34:54PM +0200, Uwe Kleine-K=F6nig wrote:
> > > Removing the complete __fixups__ and __local_fixups__ tree might dele=
te
> > > data that should better be retained. See the added test for a situati=
on
> > > that was broken before.
> > >=20
> > > Note that without removing /__fixups__ and /__local_fixups__ in
> > > generate_fixups_tree() and generate_local_fixups_tree() respectively
> > > calling build_and_name_child_node() isn't safe as the nodes might
> > > already exist and then a duplicate would be added. So build_root_node=
()
> > > has to be used which copes correctly here.
> > >=20
> > > Fixes: 915daadbb62d ("Start with empty __local_fixups__ and __fixups_=
_ nodes")
> > > Closes: https://github.com/dgibson/dtc/issues/170
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > > ---
> > >  livetree.c              | 75 +++++++++++++++++++++++++++++++--------=
--
> > >  tests/retain-fixups.dts | 29 ++++++++++++++++
> > >  tests/run_tests.sh      |  5 +++
> > >  3 files changed, 92 insertions(+), 17 deletions(-)
> > >  create mode 100644 tests/retain-fixups.dts
> > >=20
> > > diff --git a/livetree.c b/livetree.c
> > > index 6127d604d528..f23988483b01 100644
> > > --- a/livetree.c
> > > +++ b/livetree.c
> > > @@ -352,6 +352,60 @@ void append_to_property(struct node *node,
> > >  	p->val =3D data_append_data(p->val, data, len);
> > >  }
> > > =20
> > > +static void append_unique_str_to_property(struct node *node,
> > > +					  char *name, const char *data, int len)
> > > +{
> > > +	struct property *p;
> > > +
> > > +	p =3D get_property(node, name);
> > > +	if (p) {
> > > +		if (p->val.val[p->val.len - 1] =3D=3D '\0') {
> > > +			const char *s;
> > > +
> > > +			for (s =3D p->val.val; s < p->val.val + p->val.len; s =3D strchr(=
s, '\0') + 1) {
> > > +				if (strcmp(data, s) =3D=3D 0)
> > > +					/* data already contained in node.name */
> > > +					return;
> > > +			}
> > > +		} else {
> > > +			fprintf(stderr, "Warning: appending string to non-string property=
 %s/%s\n",
> > > +				node->fullpath, name);
> >=20
> > I don't think carrying on with the operation when the original
> > property is malformed is a good idea.  This message will also be
> > pretty confusing in the one place it will occur.  I think it would be
> > preferable to return an error code here.  The caller, which knows what
> > the purpose is can then report that the relevant property is malformed
> > - if that's the case, I think we can just give up on updating
> > __fixups__ / __local_fixups__.
>=20
> I picked that option to somewhat keep the behaviour of dtc as it was
> before (which appended irrespective of the pre-existing content).

The rationale make sense, but I think just giving an error is a more
useful behaviour over all.

> But I don't feel strong and can rework it accordingly to your comments.
>=20
> Best regards
> Uwe



--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--yb4KCq2iHOoPlJMu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmiimLQACgkQzQJF27ox
2GfImw/9GNOK3WeRaIx3fCR2O8xjr+LB+eCVYEB9X4BWy7J1TVTX1fdmeEYvXevu
z+7MV5UVsHWFtvudAi1Rh/R304GohQfeBCW5rGpmExqbVqPMIHyy6WzYcIO7pDvZ
jkfwPj8nE8Pld3k9a0NrLggnLbS8OTdICUuPp37Ih5+f1+wjjfwBwMJKcx87p5QD
YXealbg0F2cmC2QRlIaXyhqTrK5JP4mivAr8sgZtJ9eVNRmvEcPFIU0s4jSU0/Aw
xnqZ/O5HDnxix3TARA1PMPL62MyhN//prf96MfxNKb87/SoxsAcGY1/bnkbleDGT
hPTtSKVmYdAXgMfAJQKQGTnF+WbYRw0aLSXKA2KjAFLrNO9dGNp5ERvWJt6ju2HK
ShtiSYXKv5AKTbzj7XMYPpC/1zSAzkeMhdxvK0SfPxXyD60Nt3h/ibdd2TQB4nh+
WBaYMe1R+mlXHCB6MlagMImD8ZWZ6NO1SYVfBXeF42SwOpyAPh8i4T1EIkLGC7YM
tWKrylXGRorBP7sGa24Q8sEs5CEizG5V5lPNeSOE8WOQMApIULskcAfJFP8ZAg6H
pTvOoHTOQsDWXIyOCz/pGpjkqLvGTjvU3E6X+y8h0SK1EHn7j9HUnKsAmrsR/BSv
/N7UkHw4X3qAiAPb+gO14TQ71r0BOfMQZTlN+E1Yy0Q4Z6rTuyc=
=AjQ/
-----END PGP SIGNATURE-----

--yb4KCq2iHOoPlJMu--
