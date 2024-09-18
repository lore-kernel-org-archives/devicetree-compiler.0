Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88183291E
	for <devicetree-compiler@vger.kernel.org>; Wed, 18 Sep 2024 03:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726630575; cv=none; b=DscftALvmNYi9EqarOIxonS3jrRLTdJOfXcOYsL1qM82vODuP+8RyBOY0UQUTzHQRZrlxy33ttoS3n1seZmui90wecqj+J0QlucxG21SpUYjDCLvf7xuCG2h6U9lchCqt/Ib/mKUfl/FWZYi5mtUCARsUbBUv3lz1C8dTEZdVZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726630575; c=relaxed/simple;
	bh=Zv1WC4PLlMfPYsMjFvUg0lxu8FZEX/pSsf+QSUL1EFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0X3yl/e59MrptNGl842gbJFN5huK2b/0V2e/aiVFF6RCoAlExTFa1hUud41Y4Q6XQzEiXi+Mr9WgkmRSVzcDbXiG9pr2QAHrnBHHwn79HGaBghQ1uMl+RwVNcvNgAkDYSdG5I1wY38V058e7r7gkA1TXEiyopI4ZrnZ5y1WtEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=J9sRpwiq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="J9sRpwiq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1726630570;
	bh=PLSq9XryujN+TSjlH0ZUu4ki5NDSpvb/YiMt7op8TEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9sRpwiqCbnnf+RZp+0+tE/+IU5jZlPF3xbOBbD2Otrkw4nKCiKGonnFf43GYiXlY
	 5/19kohBZWUfD0B1J2Db4BL39rD1nWEzc83YyKXibvoU5XXL8AL1v9s0lmvGhBm+dZ
	 ea3jkLRoVSKtn/QoXQAjH4A4LWx7M6LVUriej65xWUHh2+92zh15qImQWihOnWlIGG
	 lNIlpAOpqHOvFk1i+v17sRiRLWkiJQJpt3sdgO6hKvTFh66qxCtQkpdW+eiDLcsTwP
	 yhJyY0Q34DNNF2vlUfK4NSerLHJWzoNtIIu/mDEPCXdvCM2wy3AV9NnijV5cHrNVET
	 h1AGFI67CqScQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4X7kp25QVkz4xM2; Wed, 18 Sep 2024 13:36:10 +1000 (AEST)
Date: Wed, 18 Sep 2024 12:48:55 +1000
From: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
To: Anthony Ortega <anthony.ortega@terranorbital.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: DTC Version and Reproducible Builds
Message-ID: <Zuo_l-DJDQ38SAtA@zatzit.fritz.box>
References: <PH1P110MB15070467257B855EE1B1BB008B60A@PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yK6TTokMp4Fbcl9v"
Content-Disposition: inline
In-Reply-To: <PH1P110MB15070467257B855EE1B1BB008B60A@PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM>


--yK6TTokMp4Fbcl9v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 07:51:31PM +0000, Anthony Ortega wrote:
> Hi David,
>=20
> I had a question behind the intent of the versioning information
> that gets compiled into the DTC programs. Apologies if a thread
> exists on this already, but I had trouble finding one.

I don't believe there's an existing discussion, but there is a mailing
list it would be appropriate for: <devicetree-compiler@vger.kernel.org>.
I've added it to the CC.

> I am trying to generate reproducible builds for a Linux environment
> using Buildroot. One of the last packages that is giving me trouble
> is the DTC programs.

By "the DTC programs" I'm guessing you mean fdtget, fdtput and
fdtoverlay primarily?  Or do you mean the actual dtc binary itself
too?

> They all seem to intend to encode the git
> version of the package they were pulled from. However, in a build
> system such as Buildroot the DTC source is staged in such a way that
> the git information is stripped away. While that in of itself is not
> a problem, the problem is that it may be getting built in an output
> directory that is within a larger git repository. Therefore, when
> the setlocalversion script runs, it ends up pulling the version of
> this larger git repository.

Huh.

> Is there any way that you recommend being able to override this
> behavior in the DTC project? At the moment it appears to be the only
> project with this unique issue.

Which is a bit weird, since I'm pretty sure we copied that
setlocalversion gunk from somewhere else (thuogh I forget where).

> This is resulting in a different
> binary executable for each commit of the build system. For
> reference, I am referring to the following section of the Makefile:
>=20
> https://github.com/dgibson/dtc/blob/main/Makefile#L118-L119

I don't off hand know of a workaround for this.. but let's try a
possible easy approach first.  What happens if you build using meson
instead of make?  They're supposed to give the same results, but don't
always, and I think meson has its own version logic which might be
more sensible.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--yK6TTokMp4Fbcl9v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbqP5YACgkQzQJF27ox
2GeZXw//c1lvFIjym/unlWlpRvYkPtMko4XSEQe3Cukl7lPZ0jzRhYdhiPl/QDvE
2q94DN8ziSJaG4efX9GlieUYNwctBhp9P1l6Nil6KnnngVH7hI+dhNjup4ecbmZY
GxMIz/guUwomtGJclTzIuoy7NQSMN0tp84jbJvXUn5g3pgcyt4fxKj9w/jONOH07
+lhcZvVGxLH4lr9qQdYBJY9+JDstH1BysxoMlqGRmCsB50Cja8sDsgn1/YhUlrZF
0eL0lD7vAG1lRSzrcPpPsjM5jNtCTo4vzQppXz2+/PWOhH6U3fQcPF38B0AqXb0z
mjxpltsYbpEVuQvGelVNRETAeruZa2YznUu62d7ZxeZ7dAg7Sn27u8FxFwcVo2MZ
E0h22AtECdQOF6xs1ArJZZnQETSRhmRCMBprGaXzCdH3wRGfvcJiEyzVI72yA18z
DIEZ8cKM38IlpzFfldefVmD/M6owm/U80mPuliuS62/RL8D1N45CPTm7VyZrG7P2
lmi/rQu+Dy/iYTuy3gRxys9BTr/+7Ny9NiLnaxYla1pa4WauX9ptAmkto/K/pL9k
GTDEd89knXk4aD9SRKDrKfpGPtdeLsRe0nkpiHLPUsyAPcutU0ZNrFLWuBqd7AQY
COdFdKT/G/DHBXLwoG0BY5aLMadVQJqX/s+A81wj2OFEcyNARpk=
=i+BC
-----END PGP SIGNATURE-----

--yK6TTokMp4Fbcl9v--
