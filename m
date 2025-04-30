Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C112A1C3C08
	for <devicetree-compiler@vger.kernel.org>; Wed, 30 Apr 2025 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025213; cv=none; b=OYZ1DRwexX6eaFeitsN7JUt82Ty18hiGXUliYOcywOY5XmaihStcmFcrPt18gIr7e00dqunzDX+kdyEdhuQbX2SazUYbIZsGGAVIqCi50PbCVvwyfbwlPKUifzk82VdS3Db32zfjTH9/AozJ1xkvux3qgCPzitA9xR3VNYYZ0Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025213; c=relaxed/simple;
	bh=Y9Yo9VT8HTvaHGgnSxRRE3DsQwmajJ+hzeHhZfexUks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpZLB8koGwa0dv92KnKFLTXEETf37JfjHhx6J0aAFOfb4VS5/sE93X0DJIrsg79VzHC91Hy+utWoa/Ph5xWDkbNg+sDnTf8sZFuL59sv8dndpJ/ONlaVwEFakTxJRyjyiuRuZGS39sKEZPu6bdpbj47iLDR0FXy0E3GZMNEbU9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=W4mq0QvG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="W4mq0QvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1746025208;
	bh=QpAiaN73tbHKBdDQFTXZzen53wWdP0SqVdxfZdueo/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4mq0QvGEDyrf+8hnRlHKhb9SLLGUcIV8Ifxo1Q5jSWCPGGSP++UHSaiiE4Tpflet
	 U8ogT6LfT70WYdiS2Fjgv5AG5qkXygTrUuXbIacufmxB7TpbXQvYCHxiHHgCcfe/XB
	 LUXUDI8KgADxl3VLR46HKBO1EHI+KSDxY+QAsWsuQ/yUkL2eRlT0j3lX+9Q2g5qTRb
	 tllUe3OfNJjg+oVaQ7BgLEQbLwQX3T3ywKIHVTGoV9qQrewaNJdPNsOg3xNrcJAGb0
	 RqGuATHQBAtkFUCuXJz9xtNtlFqshQFpFTjwtc0d62OrN4+uQq/5xW2FvKoFb/fZ/S
	 TJkh+Cq9ogcww==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ZngMr09hwz4wj2; Thu,  1 May 2025 01:00:08 +1000 (AEST)
Date: Wed, 30 Apr 2025 21:59:58 +0700
From: David Gibson <david@gibson.dropbear.id.au>
To: Eli Schwartz <eschwartz93@gmail.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 2/2] meson: port python bindings to build natively via
 meson and meson-python
Message-ID: <aBI67qC9Z6z3T-pu@zatzit>
References: <3a024c31-bdeb-442a-9eab-305c0d8fec41@gentoo.org>
 <20250429014241.90681-1-eschwartz@gentoo.org>
 <20250429014241.90681-3-eschwartz@gentoo.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M2a5LFZWDiwVpBNt"
Content-Disposition: inline
In-Reply-To: <20250429014241.90681-3-eschwartz@gentoo.org>


--M2a5LFZWDiwVpBNt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 09:41:43PM -0400, Eli Schwartz wrote:
> We get full build parallelism and fewer confusing ancient distutils
> paths. The python wheels build fully standalone, including linking
> libfdt as a static library.
>=20
> For convenience, when running pip install a meson option is passed that
> prevents building tools or installing headers/pkgconfig files.
> meson-python would otherwise include them in the wheel itself, in case
> they are needed, but this is essentially a bit useless so don't bother.
>=20
> The old setuptools-based build is now redundant and goes away.
>=20
> Signed-off-by: Eli Schwartz <eschwartz@gentoo.org>

LGTM, excepting one tiny typo

[snip]
> diff --git a/pyproject.toml b/pyproject.toml
> new file mode 100644
> index 0000000..8682026
> --- /dev/null
> +++ b/pyproject.toml
> @@ -0,0 +1,33 @@
> +[build-system]
> +build-backend =3D 'mesonpy'
> +requires =3D ['meson-python']
> +
> +[project]
> +name =3D 'libfdt'
> +authors =3D [
> +    {name =3D 'Simon Glass', email =3D 'sjg@chromium.org'},
> +]
> +classifiers =3D [
> +    'Programming Language :: Python :: 3',
> +    'License :: OSI Approved :: BSD License',
> +    'License :: OSI Approved :: GNU General Public License v2 or later (=
GPLv2+)',
> +    'Operating System :: OS Independent',
> +]
> +description =3D 'Pthon binding for libfdt'

"Pthon"

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--M2a5LFZWDiwVpBNt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmgSOu0ACgkQzQJF27ox
2GczmA//Vu03ZM0KvFKR3V4AR64DV3xlTR9I5e2P0C6Hk5OmouksyMSSUc0y+v4/
7hdW7z1SVFjMzPXT5b4nA33EktFDwhAhpsCBQ0Oq/bmKTnynVuMLSsD2ayretc5u
LH2t2JRmN3gwo7NuBSHxR1LmjVtzRm0/8X/EJLOfsiDlJD6U3+DRQkfMAAfj9rsh
0xxfsigljuvLP1h/Ms11c6ksw/0ZtdHj4fTrFH9fNnE5P7BqKxlIhlh4xs81j3+5
10EnRm24trbiJxPzy4jzYHyyl9Tkn6gY7X8qiBTUxVzeR3H6RegU6CandvA5cqPF
cwFmoAjj8ke/6+Pc9wWZdBkDnqIFDy2LXvbBFCWSoVpa2SUwB1nh/PxHRVI1BYiW
Z0Eltw+y2zQCbsjLBnBREo+CQKi+AhB3MkTsl/JtR8Mi3UMAJV8emH74pSwoqvXB
4r0g+afXfYlKC5yfBEID9Oz4nL9vOR97wcqTgfianDHIzbUiUxEZS0Fh74UESc2O
Pol/3UYFBl0V7Ynk8zf06WfVPnRuVX5i7aI8dAXN8DfHRb3eHnUK1bxMKhtVKr+8
SWfe9eIdvrc3WvqozhPkd4rovnvkmpNUC2YutzlYJMsCPocEY2W6JUZvezWdqaCG
KZL4TlYSTHswVgWLWbS0BWL5UoN1e5bDKA4SEA10ezNhJ+5FU1w=
=yJkp
-----END PGP SIGNATURE-----

--M2a5LFZWDiwVpBNt--
