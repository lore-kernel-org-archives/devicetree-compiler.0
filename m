Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0473F29CE1
	for <devicetree-compiler@vger.kernel.org>; Thu, 30 Apr 2026 07:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533206; cv=none; b=Au50uyZ/E4OWZ6593EuZDfkSwMYHZ4OwCcAalRBfapM9l873ONyy62F0qJO1iQ1Xt7Re7zLfyGOB88EGp4ykOHvfwF7/Q0DfrlST2RZQ6arGL3rnTtLIj+9AtsYfTXAFLOZWJ2XUgNdkR5mk2paudr5eWht01QANDxMRVyOrxBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533206; c=relaxed/simple;
	bh=A+7ZzkbJ0hvpfXCCBwij0PU++/Ckhleq/ldMsxEZbtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMm/9caaYf3ZJdNYXF/jLvIoaZ2qzzQL8o88Hw22P9runsPfisOU4JLDZZlm5gYqWTMSu25D0AlPMYh2i9WeVnwq9zcxrpus9HAJB3TTWvlrgVG44rBQkPUr3le+gNQZtuD6O4eEKuy5jiHY4kDct99McadHdji/qb3YcgGYTBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=IleBVCXi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="IleBVCXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1777533195;
	bh=JTVP9KtMvQzai9OZOFxNQK96GAVm3bpAbWNcKJIeKGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IleBVCXi0ThLpUAdc5GLJTUtMSgNxUSYWEDGfgNedEOt/Kse0ghsPnkm6UhefgDRA
	 k6tKY/N8WAR2pja1uSup4/q6a3amXnCKfAiXMhfAVmATnD0pZvI1Q1hiyr9ubvdAsu
	 WzmXC03fmBa1ANgxCmZaXp6Sxj5L3QtcQv2LBISlBX8gXvvAWKeheseyCdU/EnDQm3
	 DVACmeTD8yW12BzBWuysXCn89lO9HEDPaq7T4LSaDtd2oNGWLLvywU5E8K0h2Qy0e/
	 ak22/LmuvU9xuiNvT4T6oAuDI0E/1BzvCiH2nSsBfmQs1UIPAMBDELrp3Mei4V+f/e
	 Uj9Rdo06peYDA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4g5lkg2vWrz4wT2; Thu, 30 Apr 2026 17:13:15 +1000 (AEST)
Date: Thu, 30 Apr 2026 16:52:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: yuanlinyu <yuanlinyu@honor.com>
Cc: "devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH] label: collect labels to __phandles__ node in interger
 format
Message-ID: <afL8OLcjZ4umn9uD@zatzit>
References: <20250901122258.2557912-1-yuanlinyu@honor.com>
 <f1dc6b4b445a4429aaf416b00926b162@honor.com>
 <aN9tNVi25NOxyJoW@zatzit>
 <93baad58256248278d57831a568414eb@honor.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GFjk9GvPX+jlLbdk"
Content-Disposition: inline
In-Reply-To: <93baad58256248278d57831a568414eb@honor.com>


--GFjk9GvPX+jlLbdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2026 at 02:38:56AM +0000, yuanlinyu wrote:
> > From: David Gibson <david@gibson.dropbear.id.au>
> > Sent: Friday, October 3, 2025 2:29 PM
> > To: yuanlinyu <yuanlinyu@honor.com>
> > Cc: devicetree-compiler@vger.kernel.org
> > Subject: Re: [PATCH] label: collect labels to __phandles__ node in inte=
rger
> > format
> >=20
> > On Mon, Sep 29, 2025 at 02:33:19AM +0000, yuanlinyu wrote:
> > > Hi David and other devicetree developer,
> > >
> > > Could you help review this change ?
> >=20
> > Sorry for the lack of reply.  I'm not going to apply this.  There's cur=
rently a big
> > discussion underway on this list (amongst others) about better ways of =
doing
> > runtime device tree modifications.  ("Re:
> > Device tree representation of (hotplug) connectors: discussion at ELCE"=
).
> >=20
> > My main point in that thread is that we need to reconsider the design o=
f this
> > end-to-end, and not add more hacks on top of the overlay mechanism whic=
h was
> > never really designed for this.
>=20
> Hi maintainer,
> Is it possible to reconsider to take this change ?

Not unless I'm given concrete reasons I should reconsider it.

> Or could you share the idea to improve it ?

I barely have time to give feedback to much better considered
proposals than this, so not really, no.  Look at that thread and
others on the lists and join the discussion there.


>=20
> >=20
> > >
> > > thanks
> > > -----Original Message-----
> > > From: yuanlinyu <yuanlinyu@honor.com>
> > > Sent: Monday, September 1, 2025 8:23 PM
> > > To: David Gibson <david@gibson.dropbear.id.au>
> > > Cc: devicetree-compiler@vger.kernel.org; yuanlinyu
> > > <yuanlinyu@honor.com>
> > > Subject: [PATCH] label: collect labels to __phandles__ node in
> > > interger format
> > >
> > > Currently labels are collect to __symbols__ node in path string
> > > format, the libufdt have no support of it when do overlay.
> > >
> > > Add a new method which collect labels in __phandles__ node which each
> > > entry is an interger format, it will allow libufdt to keep labels when
> > > do (stack) overlay.
> > >
> > > The new method including below points, 1. add an option -P for dtc
> > > tool, it will create __phandles__ node and labels in interger foramt
> > > 2. add new function in fdt_overlay.c to support merge __phandles__
> > > node 3. add overlay test which test -P option
> > > ---
> > >  dtc.c                |  18 +++-
> > >  dtc.h                |   4 +-
> > >  libfdt/fdt_overlay.c | 250 ++++++++++++++++++++++++++++++++++++++---=
--
> > >  livetree.c           |  76 +++++++++++--
> > >  tests/run_tests.sh   |  84 +++++++++++++++
> > >  5 files changed, 392 insertions(+), 40 deletions(-)
> >=20
> > --
> > David Gibson (he or they)	| I'll have my music baroque, and my code
> > david AT gibson.dropbear.id.au	| minimalist, thank you, not the other w=
ay
> > 				| around.
> > http://www.ozlabs.org/~dgibson

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--GFjk9GvPX+jlLbdk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmny/C0ACgkQzQJF27ox
2GcfLw/6Auy60HT+WlXcy2/rDYnwog5SYKaMC0O5z1xqjr1qqv6wHF48BxptL9ee
3O/n9M5S7VAuAXVmoBoCtqynlMZE3cVuOBW6YeKOcXhLJHj7bfE4fmziFSH5JUii
BdflEFX2uLf0IgMtofRBlQYUsBXRQdKe42JwDYTy2wlIcKJC8wyr2Q9w1Ic497QJ
AGdXg6A4RYaVYV88fcsVohiWpRhE7weokbv65+yLYh1T7vDSZeldO2VHMhwMgzhr
lNq1USC5uB3u2cb92WqnOQ0rpTL8lCxHBT3E4u+ID6wHA8vpnYx5xCG3TfUXSEHA
FMDhOpj3kLvYCxSyxztqLVnzJl57mF42pRRX0B3BdImCuoKEBqXWt76pf2oqXzLH
yBG6v3lzQUD3pw9QohD3YnBEHPKX8VBcfeO+DO+T4tX+Dzd8JRHVZzGzuks3tNEL
1C6FLnhccmaQo7lxCegtMhvFaa2sXNDJLnu+mz4gvY4hOCLjCH8mlHRMnRQyGHWE
BuJrZPkhjGhytO3YEpJzVkRHnSUyjryj+QR5PpNbF8viI9EhVO7a1mn3l06NfRKd
BrBmy+MCvZKj+BBws8oCy8ViqbqBICiAfXxXcksFR/OF+JCG3YZmYixBdxWTujfB
Hg7edqQGVNsDEl2SPQH8ygkPNMmwsQRBNQC8AzbHUdh+gBGlKh8=
=wP87
-----END PGP SIGNATURE-----

--GFjk9GvPX+jlLbdk--
