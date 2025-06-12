Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB0323AB81
	for <devicetree-compiler@vger.kernel.org>; Thu, 12 Jun 2025 10:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725561; cv=none; b=PBjH0fgtiEGugH/13S9yviTft6QOBpdhufZI7RLcciEmVntmukQPEeXNtshzTbCgQhCns4vDTH/G1XK5O9pv6n5RD1NbkorUQA5xQzY0luvqhMxlC5KZv1vEhfWeav2RxlL178KEs7wnV+CIieN5IzVI3I8MmiFt9LA/QbrQ+Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725561; c=relaxed/simple;
	bh=H6B+Vfc4EDzKCrJeXq7JmzJaJSMagYfaudfwxNkH+CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfE1cM5RbLaWIQ4UJQSKUadVDPBZXDyRpiWBpNjc67GPVXxLbp4vdKXK7h8QcVyuyGdFmjM9yHNR3CGNtXFT5wjuu9a8uU+r8usOeOhnxP1u10pq2PFv0eqPxmgzlm8RdhPPW+ElVh6u1xNp7ySJgiOHbwF6Ccz/9tIPsEbj8vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=RnYN4tSP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="RnYN4tSP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1749725548;
	bh=0X4+2lcFjkO/szGrZ53zETn7vlmpUaiPw22X/DGibWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RnYN4tSPQiNDyHjWgKoJUQdxH9eZWod3C6tYsciO92yxL2+D4Rtw+GhadyFowTq3G
	 MqcCazIiXrz0YnoXXnbjXVs5LBCC1vSkUcEFBieMGmMu9E/2NGn14eyp1/D2vXbfBD
	 4Q1A2uNrGQjo1mh9+feIBDv7PDUQoY78C7K2bImn9ETK9cryWISHX2Pq+lk41UK8lm
	 fVyc9neE0oMcaYDpk+naH+vkN8dL3HgEKG1jH8VfgJBDJNNnYnPBkdj+RQZSmj/My0
	 wJ1SKS9z0ZtANaLCI4k2ZWiFbQLV1qj887034R7ONCSncnEYPXvOPc7f6x+3/Y6nCO
	 Du3kRczrtlzdA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4bHzrD3BB9z4wcQ; Thu, 12 Jun 2025 20:52:28 +1000 (AEST)
Date: Thu, 12 Jun 2025 16:34:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] meson: use override_find_program/override_dependency
Message-ID: <aEp0_c6ctFQKmfYB@zatzit>
References: <20250612053829.1037412-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B+j+IcJX9dYr9tpI"
Content-Disposition: inline
In-Reply-To: <20250612053829.1037412-1-pbonzini@redhat.com>


--B+j+IcJX9dYr9tpI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 07:38:29AM +0200, Paolo Bonzini wrote:
> Allow projects that use dtc as a subproject to find the tools and
> library via find_program() and dependency().  This way, for those
> projects there is no different between system dtc and subproject dtc.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Applied, thanks.

> ---
>  libfdt/meson.build | 1 +
>  meson.build        | 4 ++++
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/libfdt/meson.build b/libfdt/meson.build
> index 9c6ef54..68d4c1d 100644
> --- a/libfdt/meson.build
> +++ b/libfdt/meson.build
> @@ -40,6 +40,7 @@ libfdt_dep =3D declare_dependency(
>    include_directories: libfdt_inc,
>    link_with: libfdt,
>  )
> +meson.override_dependency('libfdt', libfdt_dep)
> =20
>  if not wheel_only
>    install_headers(
> diff --git a/meson.build b/meson.build
> index ed4a39d..66b44e8 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -118,6 +118,10 @@ if get_option('tools') and not wheel_only
>    )
>  endif
> =20
> +foreach e: dtc_tools
> +  meson.override_find_program(e.name(), e)
> +endforeach
> +
>  if pylibfdt_enabled
>    subdir('pylibfdt')
>  endif

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--B+j+IcJX9dYr9tpI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmhKdPAACgkQzQJF27ox
2Gce9RAAkv8loS/BBKOTq6BPt/MbnIXFgZlQIYsS9NdqnEMRn2gg+XbbNu9Ob6Lz
cn6NB6H8AU7tsRg7VKn6NzsZsbNdOnSbhE6ErtEMIvKBB0RhFXm0078Qb4HMnxg6
9mYLzRvCRN9JSYOuAZbxLzHnCaCukLOWOn3axUBGr9p3frMsXIx/7skwYttmhQfk
kRgQG27mChxt3lVFFyHB6s1KY/kBwsrQ59pEfHBxZ82Ei2+T7O/eky28m8vjr68d
vQTKZ08LTK4olZWTaibkGB7N4KwU1BubLRtUCKGt1i9712LAIeVoLfy/SVzug/j+
0VkqgyAN2BPPCp8gmeCp2/udjDxwmdfGEqMyL8lDlzje7ezRavoq8k1+lte0/KFG
LWP0xj7oeVWC90zD4RrItop78XGJ6fcWZIwsmqv2BjXMg0T4PcgdT2kDNU8lVmpT
HLxy7yNmxYY3Xe643sH0pxACivHSTrugiIMLG6dQG9JOUJQjARYxc3lMAvGed4rJ
Dn5ZSwZRyyMsPF2LbXDcbt8M2IRWMGLoi4khuK5bepkZrxIfDyvqGq6okJINKRrb
eo/zpoLPdXzhn0cv1OnC7VF+TfAQvU4NB2qfzqt7DH/XfaUsc/xM6ifsC+rHUpnv
uTL0VgXeWrd9u4JoVS3rE7iNqv0CQ8sB1bi9TPIcLbOV8bjgOxg=
=IYH0
-----END PGP SIGNATURE-----

--B+j+IcJX9dYr9tpI--
