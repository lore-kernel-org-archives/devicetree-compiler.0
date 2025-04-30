Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10AF1547D2
	for <devicetree-compiler@vger.kernel.org>; Wed, 30 Apr 2025 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025212; cv=none; b=PnKOJDBbIcyFzgXV/2VTNVzSnOTXNaSBl4zIo0b9NJFptfp0cAolwbqvfxdrNjLoV9QIfh0b7d1FKT2/12KEMssRo+NILEsUfE3b+I5fk9ZoxFFoa2pFYzZzoLOhlKU72jO7h4KvdIh/g2ljiKxa0lFVH8I1rESXMHAzcLgq+xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025212; c=relaxed/simple;
	bh=YzW8UJzWW4K4bakpEq4ndSVx53H+em3Dy8OnMGyTuDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWNs/jhdCaCBwNocOZVW2VRQyct7irVB+GDhBMaRbJmZbBJXL+G6DMUaIzPExo+3qRwPg74s9FgUoXlrJPcd3wrXk8oaAFgHn2me4yFY7BB5EsRA5pxDMbnqxIsSWm1rhLTirPVmupnc4e1muBgJbg3l2YFXgiL70tnmhDyktdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=BNXwVhfN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="BNXwVhfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1746025208;
	bh=FsxjJF0PwKqF67gHFS8wi/KRPnIAlL3kGTfbOCj0UBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNXwVhfNpyEAUn5BnTPWTQHNWckZlW1k/dZjvpcQQDRiKz0+lWEFUh2U4EvDe3qQC
	 BCZRhoLeNN9jYbn2ls+er5ervK0icbsO/uEvMqcLuDe57iOpdDlaNEx6E3yrO2JQBz
	 DG7o+d86PcNQmiDqqIhICJuTtJ3K1JRmSxBIrdAwI68Q1WbPHwHwYozwcuNbou4aJX
	 K34S07gPqprA82LWDD+SJSNbzjLR63+K9vpmYGMZnC9DrFMh6L878yk+n4qLeDjcwe
	 alb2ZV5XOMrbvQUQA1JjiJLMhBobmZXOrXzN2/yO81h2RgCBnwjhc5F40NM1ViRuVM
	 2RoQv/A7jWmPw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ZngMr06Hxz4xQ1; Thu,  1 May 2025 01:00:08 +1000 (AEST)
Date: Wed, 30 Apr 2025 21:56:16 +0700
From: David Gibson <david@gibson.dropbear.id.au>
To: Eli Schwartz <eschwartz93@gmail.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Makefile: deprecate in favor of Meson
Message-ID: <aBI6EOjA6OYOz8oA@zatzit>
References: <3a024c31-bdeb-442a-9eab-305c0d8fec41@gentoo.org>
 <20250429014241.90681-1-eschwartz@gentoo.org>
 <20250429014241.90681-2-eschwartz@gentoo.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="StkeopuN5NVJ8fAG"
Content-Disposition: inline
In-Reply-To: <20250429014241.90681-2-eschwartz@gentoo.org>


--StkeopuN5NVJ8fAG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 09:41:42PM -0400, Eli Schwartz wrote:
> Building the python bindings is complicated and not very practical to do
> in a Makefile. The setuptools invocations previously used are confusing
> and don't work very well compared to Meson. Having two build systems
> that do different things is also confusing though.
>=20
> Since Meson can do everything that Make can do, but the reverse is not
> true, we deprecate the latter and warn when you use it.
>=20
> GNU Make can emit a $(warning) on every Makefile run, which is a bit
> noisly but means we don't need to have every target depend on a PHONY
> target (preventing built targets from being seen as up to date).

s/noisly/noisy/

I'm pretty ok with it being noisy.  Some minor nits in wording noted below.

> Signed-off-by: Eli Schwartz <eschwartz@gentoo.org>
> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Makefile b/Makefile
> index a00123d..000dd85 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -3,6 +3,12 @@
>  # Device Tree Compiler
>  #
> =20
> +$(warning WARNING: Building dtc using the Makefile is deprecated, in fav=
or of using the Meson build system instead.)
> +$(warning )
> +$(warning https://mesonbuild.com)

For succinctness, I suggest:

WARNING: Building dtc using make is deprecated in favour of using Meson (ht=
tps://mesonbuild.com)

Note that British/Australian spelling is preferred for this project, hence =
"favour".

> +$(warning )
> +$(warning Use `meson setup builddir/ && ninja -C builddir/` to build, or=
 `meson configure` to see build options.)

I'd prefer to suggest "meson compile -C builddir" here, rather than
directly invoking ninja, and I'd also like to list "meson test -C
builddir" as the replacement for "make check".

> +
>  #
>  # Version information will be constructed in this order:
>  # DTC_VERSION release version as MAJOR.MINOR.PATCH

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--StkeopuN5NVJ8fAG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmgSOgAACgkQzQJF27ox
2GdeYA/8DmzwP5g12snQh0rIEv1UAC2jbm3PjMZUWpbf7FVZwNHMPqX0rvpRXQDa
f4KfYa7RejpOP8CDPCrUv+PT1OpC1lSymtdXlA6cbPWlMZbMWGyP81tiDmx9cknE
zggoml4idBRDfjIAnyu/sFcKZRRF5m77kjfvtgwUECjUvQpWofp6gwB+EpZpyzNq
kAPeiZMKBsxjPuLWjYMa/vXnznKJ7pLhxiKLFFhgLt/Vzox94pzkuo9wrLMW74iq
wiP/YdNvxNBZb81nrUp5mYwF3p5gQQwARkVgYJsg8o63QmTBG+RG+iU0lEoBTA1h
CKQEwzO0Xl9AYO2ad70s0+iiTOSHJ0R8r3yOHlxzFLjxZ3r2SWVWrdhdtp+Rac9j
2AQkW7DX9Weee1M0G4PcSKpYlyvMuKa4lz4yGZ27UC/lT/g+OWTcIalLN66vwNos
nvFSQ0jgj0iY0o+6khoueOA3MCcdy2uGk+70BlSN7zUj/JVO5aC1kH6DCfozKo1d
GONYIZbFL7tAz+FtWFpjOuIaLQNiLuCOhYcQPSMqO+3LwqBOjclib/BzR3W3IRdU
ElmO95qOc3+3tsEt7lDfTXmHHh2hoANvrUq+xvyi201GgAoMrTRbw7gZPjO5KOLK
pxUUedi5T8ux7b2Ttp3Px4BuiBk7lr0vn01CYjJcJCwMeS9/hHs=
=OD5c
-----END PGP SIGNATURE-----

--StkeopuN5NVJ8fAG--
