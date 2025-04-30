Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794582DC797
	for <devicetree-compiler@vger.kernel.org>; Wed, 30 Apr 2025 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026447; cv=none; b=RkGmN+eC0FBtuYBkhoHe8RedbHDaxmMzgQC6Gheh6yT7hSRT9HggDhw++qS4zCbvvU5ifOXgpaI8Bd5M3wbsFuM+QaPjDltPuLdPasRQi0Yz/41mJf8SqCH5MkqSpAVpzSVzeLvKSNwcjkh3mQDIKgNgsD+AH+ReNAFObuWnSbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026447; c=relaxed/simple;
	bh=gC8JzL8QMs5wVQeyjaDu4ulIUVJLMFMtODgunO7GuL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmI2SvUrpoENGUfil8pgN/SiqZcxZ8d+5StNqThUXOPs7k14luXLatH5VyR7JoQcxe4Xc7tGTfsuW7z61j9ILhPUtIOC2J6kBri0ugAlz6e5OY7bbyKlm3OEqr471zjhPHWSvivg3llPGIZboF1Zv19dmsjbERrFB7dFZ+dQBJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=TYgn04r7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="TYgn04r7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1746026441;
	bh=/z5RAMd6dHpWPwAOq2gJNI2sJweV1V7wQmWfMnlhFfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYgn04r751ekMnIFppnuPpj3fIyaj0edHupFr9AiTHfqeY4C90Cfg7riHETKwJAZe
	 vjUIXqGPmX0jdH5a6LMID80SUysg/M4hwf5S55KJ+e3G79rBCLCUB657scdpxulfc2
	 xlA69jC55fs9HQUCt6M+12L18sfyd8Z+jifYvXkitbPZ9gfW6NfOnTqPZ6H6CKRDHD
	 EjiOa5h+755uUi+JpGwnSakVg2divnuRJTe7qJLOa8pMB7Fnu+haPibSplUnfQN2uz
	 2bUnUvaP+8RS6e5+HC1OM/CzrVS6N74Bhlcyz3ahrinveCkcu/HKaXohdzN13xj2f4
	 8LpAU+tuxMCbg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ZngqY6lMMz4wcQ; Thu,  1 May 2025 01:20:41 +1000 (AEST)
Date: Wed, 30 Apr 2025 22:20:33 +0700
From: David Gibson <david@gibson.dropbear.id.au>
To: Eli Schwartz <eschwartz93@gmail.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Makefile: deprecate in favor of Meson
Message-ID: <aBI_wad4TnNRCTWA@zatzit>
References: <3a024c31-bdeb-442a-9eab-305c0d8fec41@gentoo.org>
 <20250429014241.90681-1-eschwartz@gentoo.org>
 <20250429014241.90681-2-eschwartz@gentoo.org>
 <aBI6EOjA6OYOz8oA@zatzit>
 <4abaf886-440f-48ec-b133-899111f3aec2@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j3oJAqJ0JZKtrHzD"
Content-Disposition: inline
In-Reply-To: <4abaf886-440f-48ec-b133-899111f3aec2@gmail.com>


--j3oJAqJ0JZKtrHzD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 11:10:20AM -0400, Eli Schwartz wrote:
> On 4/30/25 10:56 AM, David Gibson wrote:
> >> +$(warning WARNING: Building dtc using the Makefile is deprecated, in =
favor of using the Meson build system instead.)
> >> +$(warning )
> >> +$(warning https://mesonbuild.com)
> >=20
> > For succinctness, I suggest:
> >=20
> > WARNING: Building dtc using make is deprecated in favour of using Meson=
 (https://mesonbuild.com)
> >=20
> > Note that British/Australian spelling is preferred for this project, he=
nce "favour".
>=20
>=20
> Yup, sounds reasonable. :)
>=20
>=20
> >> +$(warning )
> >> +$(warning Use `meson setup builddir/ && ninja -C builddir/` to build,=
 or `meson configure` to see build options.)
> >=20
> > I'd prefer to suggest "meson compile -C builddir" here, rather than
> > directly invoking ninja, and I'd also like to list "meson test -C
> > builddir" as the replacement for "make check".
>=20
>=20
> As you wish, of course. But note that "meson compile" is a dispatching
> command that first checks whether the build has been setup using a
> non-default --backend option instead of the default ninja:
>=20
> - Microsoft msbuild
> - Apple xcode
>=20
> and then determines which of the three to run. So if you decide to run
> "meson compile -C builddir/" it will just in turn run, on your behalf,
> "ninja -C builddir/".

I'm aware.

> It also has the side effect of, if your compiler is MSVC cl.exe, loading
> vcvarsall.bat before dispatching to ninja, as a workaround for
>=20
> https://github.com/ninja-build/ninja/issues/1610
>=20
> None of that matters for dtc, I guess. :)

Well.. maybe.  Since it's not tested, it probably doesn't work, but
AFAIK there's no inherent reason dtc couldn't be built on MSVC or
xcode.  That's why I'd prefer to list the more broadly correct
command.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--j3oJAqJ0JZKtrHzD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmgSP8AACgkQzQJF27ox
2Gfl5Q/+PgkeQ2n5I+kY7u0EFrZbtzPGCHzj+ahUMH+ix9eizc7TgoJvS3iBTiQF
/uwsrJKpGOypQlpTIa5mScdpbBWiZhSZoGZBEE5fN18zFdPDCa/X1NIsxdrXvHxk
Fq0ExBGBDSvZw2SOKZu/khAnmArsWkmUNSJKCxDLnuDqO004Eg6pyKMdiSHQk9df
bWRC45U8ucw1xZQ4ArSx1OADV6uQtebuCY1o01W/5vRk2CcdleZbXaM90PROUC1t
OiJdGyc1Onea9RKH/M/poEyFNNUmSEdUwrDPQBr40CbNBZekJDlUYueyYR51yM0W
nCxRhSqmPVPkMrargsxrMCWNqNH1TzQ5OX8yZqQiXXVG0cpa51h3KvMrSiUwnWnI
mv1PKJ6c+W06fywSwsIonT9I7+ynz78go6SAy1Q+RwpHLN+Y49JmdNUsr5sejIXE
tEW/9eNxYLrrEIjkem8ZbVBNYNAdc6uQFmmEyZ8DCKN8b4VyV7v91Rpvkw5gJrNt
wyvN/1wOT2o7+UYBJhGyR+WOtDk1/uqtEiZM9IhDjP52QS/Tywwi4hpR6xP0u71I
+GRW0VysOYhOgD3zMZFFDzxjYvuco4NyEDgCfDZtC2P5l6Q+1ah1oATNT78QSG8q
2T39miKsC/hjX2lR2ARUObvd83t9iRk4gme5U2f4gPuRQwX8pZM=
=dYq5
-----END PGP SIGNATURE-----

--j3oJAqJ0JZKtrHzD--
