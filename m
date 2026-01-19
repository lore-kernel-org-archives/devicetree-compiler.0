Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05E3321420;
	Mon, 19 Jan 2026 05:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768801220; cv=none; b=jR1aIaKnU64Wffkjo/sKuWJHhlyGigbLE8kUa9ymBpjtXY+Ed78jPOMIakggQKyxJX5HYdQf6tuF4bu2NV2hdDJxUcycOmZ/lJk7rJl+/MUgV+u4hqY02iCDxWPvXXnjQNEKiPCvIvaV0IaGpuKmJPyGH0d/dK0MmPTKjYc0Ojw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768801220; c=relaxed/simple;
	bh=Hd3pGutpLLpx8xui/YfgoLqLl/pxjQBbF56jQnFL2Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bI2o5M/yfQroEMkahQSNjJMim1JrNmYbRBOiLSLBoBkel49p3hEKEed6BPQHtOJ0MVc9e6kyHofwgMZ9W0HFzxZTeIWRPrrY86ipidEzn4rRMgr/sIy4ZaTw7MieN+wmfvEuhV272XPiWtXECU8RB4ibXUwZhTxZkfkxM7v9N5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=A5l4c26b; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="A5l4c26b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768801217;
	bh=KvB/F8cZmaK3Jkg9q15McFSg3bMC0Y5TyoeIYyEcMkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5l4c26blwbL9ADBZaPyc45vxmrcRvWgG3hi0sCfsxtpRtnvWJkZajVXn6RGc7B6b
	 n9jYZW2kmMaiLlBM1leAusVhdbDl4Svg5KepI3+nmZsJElO9aVdP3kdieyDkeBbARY
	 IjsjfdndFxON/v+P7YhgUBBDcDLal5/uuBeAYD7uR/gzYskoZOiKX1g8PRYxdF7pEJ
	 AKxQwHWMJHg4T2ytibNWdo7iNa7xMXJ2R+K+TjS6UCMHN7MCV0VqlnZsgR8eYeC10i
	 81VnJHpM9TrevfCbsYfn7vAQIkpHrgNt5z6vT8rc2WlNjvn19jlwtMMwobrcnDwcDn
	 7Vgfcq6g9P3Cw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dvfS11qBYz4wC8; Mon, 19 Jan 2026 16:40:17 +1100 (AEDT)
Date: Mon, 19 Jan 2026 16:32:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 10/77] tests: Add basic metadata tests
Message-ID: <aW3B0GHnMgwF73oK@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-11-herve.codina@bootlin.com>
 <aWg58Gfb1KnMvQoG@zatzit>
 <20260116143600.5aacf12b@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7Sf6ZOkcoawOpf7i"
Content-Disposition: inline
In-Reply-To: <20260116143600.5aacf12b@bootlin.com>


--7Sf6ZOkcoawOpf7i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 02:36:00PM +0100, Herve Codina wrote:
> On Thu, 15 Jan 2026 11:50:56 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:19:00PM +0100, Herve Codina wrote:
> > > This first test is related to local phandle references (FDT_REF_LOCAL
> > > dtb tag).
> > >=20
> > > The test pattern used is
> > >   - Generate a dts (xxx.dts.dts) from an input dts
> > >   - Check this generated dts against expected contents
> > >   - Generate a dtb (xxx.dtb) from the same input dts
> > >   - Check this generated dtb against expected contents
> > >   - Generate a dts (xxx.dtb.dts) from the generated dtb
> > >   - Check this generated dts against expected contents
> > >   - Generate a dtb (xxx.dtb.dts.dtb) from the generated dts
> > >   - Check this generated dtb, expect the same contents as for xxx.dtb
> > >=20
> > > Even if only one meta-data feature is currently tested in this tests
> > > introduction, use a loop in order to ease future addition consisting =
in
> > > adding new input dts as soon as new meta-data feature are supported. =
=20
> >=20
> > As a rule of tumb, I prefer tests to be introduced in the same patch
> > that introduces the feature tested.  Usually, I don't care that much,
> > but in a giant series like this, it would really help review (the
> > tests help to document the feature being added without switching
> > between patches).
>=20
> Hum ok but it is worth noting that a feature needs several patches to be
> fully supported.

Right, it's a general guideline, not a hard and fast rule.

In most cases I'd suggest putting the tests in with the patch that
adds the piece they need to work.  That does mean that if some of the
simpler tests can operate with only some of the patches, moving those
tests earlier.

Again, only a guideline, but it helps review because the tests act as
documentation for the functionality the patch is adding.

> In order to ease the review (maybe I was wrong), I chose to have distinct
> patches for modification related to new dts keywords and for modification
> related to new dtb tag and tried to have patches as small as
> possible.

Small is usually good.  However, if it's so small that the patch
doesn't express a complete idea so you have to keep referencing
surrounding patches to make sense of it, then it's no longer good.
Fwiw, think these patches are mostly well divided, but as above,
folding tests in with code changes is usually better because the tests
help show what the new code is expected to do.

[I will note that having the tests as a separate patch, usuallly
*before* the code changes is very useful during development.  But git
makes it pretty easy to re-order and fold things together when you're
ready to post]

> The last patch of a new feature was a patch adding test.
>=20
> I am open to remove patches that just add tests. In that case tests will =
be
> added in the last patch related to a new feature. You still need to switch
> between patches in that case.

Yes, but not quite as much.  And even less if those tests which can be
moved earlier are moved earlier.

> Further more, during iteration, the last patch of a new feature could be
> modified just because the test part is present in this patch even if other
> part of the patch itself is not impacted.
>=20
> I mean:
>   - patch 1: related to dts keyword
>   - patch 2: related to dtb + test
>=20
> Update patch 1 will imply an update to patch 2.
> I am not sure that this will ease the review.

Point taken.  For tests that intrinsically require things from
multiple earlier patches, having them separate probably makes sense.
Often at least some of the tests can be more closely related to a
single patch though.  When possible, that's generally preferable.

> To avoid that, I can merge all patches related to feature into only one
> patch. This patch can be quite huge and I am not sure that it will be easy
> to review it.

No, definitely don't do that.

> Once again, I am open to merging patches. Let me know what do you prefer
> in terms of patch granularity.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--7Sf6ZOkcoawOpf7i
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmltwc8ACgkQzQJF27ox
2Gfn+w//feXmx+CSx8kylGwQ4phaFUj4r1J9eEvJJq34JEKegen+2LWBPzxJ6DW/
dbJpwm9xfRkEjvR2mRYQmhlSMuw0LU12uzq9k0dEE5ZmM9LI1xS/nmVBATkoamw0
0eO+vtQHq+9RLQhWUsyP1O6j1X+mYOj/llvTxonVqBlsI8ptSZi231cZ31OwwlnG
+giSv5pfLBD4PeH9b637XCJ3AfKAxQjUmWBV22DNPWBnLu6qAO8ryIRADXGEOmEp
24x+iUGGonoHgG1Y9gvM+hsgqxtbMDwtIQT2/308wcrq6iNK0ZpMb0pGkjraJmvy
2AsYhjNIHWNANEQuyy8sMxs9vVxtvL6vgIfDvfjRMuI2bXgQnN2Mq/+T3JEkoX28
5lYdNZvnFGpefN9cIDcKdzB732UCupwTGO+6hMsVeTK5FDSeBbkz3OUYerHLckzz
5ytXdxJZPeEXnuhqKdMEV9CLYwesZQKpDT6qQpFzuDYAprk0M4WTf1BNFTW0b0h5
UFWSeqiRufbf1pIdTr2sUUDftgqa0TOdIuNZgIJQdzv8WtxhU3jdzZLPKrziJ0m+
BfnNyItpFPAXD/e3r2+B98qGcFI3h7Ce9sPGK08unfN4BpJP04MiUW7Qza0afdXD
4eJRWkmPjdQsiZI6THfwuK2RsQ38qssEzfcM68AjnK5LWu/ze+c=
=3Ply
-----END PGP SIGNATURE-----

--7Sf6ZOkcoawOpf7i--
