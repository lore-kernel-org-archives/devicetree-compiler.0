Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B74E1C695
	for <devicetree-compiler@vger.kernel.org>; Wed, 27 May 2026 04:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779855844; cv=none; b=jdLYvkLYPNkS/rERbICQVAwIuftj6jaB1UvHzrUiA4bAvikdSlRN5cLCED5cNaI2VUxC0nOlqx0p2SXDa/KWxdErYLAi2oQ7pdIqpZnzKdovLnUvpT5GaNW59KTtZUb3XmtBdhB1ZvZTMXqknqUpVFApegU7Nhd59sLTZGm27Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779855844; c=relaxed/simple;
	bh=XZ93LFm11zT306/mW92AknPsFp2mzck1f4Iyy9OuKWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M55MrOFlJ5K+sYRN/2HgTUK1b0TP/c1G9FfvU3scM+Sbos4lnxsIk51WsFedppTpsY6UvYPKZoQ3otKE5/xUr0IlbHCYRK22wiNM5v3rtq8sL/0g88cWHiaYEOvCIdSR5RMYhf5FKIVCRSujW7V8BcglFdANLLGoy3x6+sG1gk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=DFG1mCrI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="DFG1mCrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1779855839;
	bh=aKv+zVlBEzzBgNTeDFaemG3OFoc6/qd1crN2voC5+D0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFG1mCrIceE3XeGJdtHHO075y/eOfkbWra6Q4ArYoqQcoNi+iWbcPTKmsMLCS9I5D
	 MNwaIwuj0W6dSClAXlk3IXqlat3rfLiujRxxpRWvPTqwzz84MzGEW3PFYHgQBJJort
	 jGAfAAId/hl+puh9OzG2kz7poS4PMVjEMrqzED/ceoVoBRSdo/zQr3kaTj97QOU8qe
	 Rrfa2954ABww69Mm/3SznqOt9kkJDnEBMHbE3eW1bIBOYd5+VrnnbY71dN+BTPaWIJ
	 fQtIaC9Uc4j/iD6WwZf8BEuMvK5Z7GqoQP1JaHZDmICMReGtzWt7ZbG6Vl7hwMrTfU
	 YAl7f8KQZpEDQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4gQGhv0bH9z4wB4; Wed, 27 May 2026 14:23:59 +1000 (AEST)
Date: Wed, 27 May 2026 14:23:20 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Tom Rini <trini@konsulko.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: fdt_check_full: Add can_assume(PERFECT) check
Message-ID: <ahZxuCONf2JfMXU8@zatzit>
References: <20260526203022.4006434-1-trini@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sjf9qHOugQSVtDi0"
Content-Disposition: inline
In-Reply-To: <20260526203022.4006434-1-trini@konsulko.com>


--sjf9qHOugQSVtDi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 02:30:22PM -0600, Tom Rini wrote:
> In this function from fdt_check.c we have (reasonably and as the name
> implies) a number of checks on the DTB. However, there are cases where
> we may wish to assume that we have been given a perfect DTB already and
> do nothing here. Add a test for can_assume(PERFECT) as the first check
> in this function and if true, perform no checks.
>=20
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> Along the lines of the patches I posted back in December, in U-Boot SPL
> we just don't have the space for this check much of the time and so have
> always omitted it (going back to at least when Simon posted the initial
> patch to make libfdt/fdt_check.c here). This is another case where it's
> a noticeable size win for us. I had missed this change in particular
> because we had in turn missed catching up on fdt_check_full being moved
> out of fdt_ro.c and in to fdt_check.c.

I'm not necessarily against this, but I have some misgivings.

fdt_check_full() is (deliberately) not called from anywhere else in
libfdt - it's intended to allow the user to explicitly do a full
validity check on the tree.  Given that meaning, I'm not sure it's
wise to turn it into a no-op based on the assume flags.

Your comment seems to imply that the issue here is size - simply
having this function compiled - rather than being too expensive when
(explicitly) called.  That's a little surprising to me - it's in its
own compilation unit, specifically so that the linker can omit it if
it's not used.  Is there something unusual about your build
environment that's not letting that happen?

> ---
>  libfdt/fdt_check.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> index cca052353213..2fd5b61d016a 100644
> --- a/libfdt/fdt_check.c
> +++ b/libfdt/fdt_check.c
> @@ -21,6 +21,8 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  	const char *propname;
>  	bool expect_end =3D false;
> =20
> +	if (can_assume(PERFECT))
> +		return 0;
>  	if (bufsize < FDT_V1_SIZE)
>  		return -FDT_ERR_TRUNCATED;
>  	if (bufsize < fdt_header_size(fdt))
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--sjf9qHOugQSVtDi0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmoWcbcACgkQzQJF27ox
2GdW3A//bbggvFXzCFduBfz1RdLt6pNjZJS7SoFqjJiQsWaGopi83gVGtnJCyGV0
9jMkGr27ieMKYAYLrq+5Gl6tuLRwrJ7dvHTVg5R0w/eN+sW75ZIQNvl8sVyNnkDx
5QcAaJAtLwg5d28Jve/ZlFkXubzuHImp0Y/I1pdIBImv2mE/1AiSP5oJZV/h1qjf
Zhc+VDVraCXR/4Sn/WADeWdLTxw8TNWBhY61JgtBd2rSGOydJyb7MaF/MGFA73of
2kdml63aKHzSCnWjDRfomeIa2tZ4s2gjUnhBJISTbQWVrHWczroL71ALPq87eCBa
iahgc8l8p4jawuFQ6peYsR40ipPrwKHDRmI17WjcH29U6kc6uEhgzZm4VjNW4O7r
eHZPdw2rt5S54gDUVXxipMAC/l73irDnmN5Ne9WvxIUDzrEV8NI1+VvGS0sb9aX3
qNKlf4aXj5mG+ifKg4wI1hR3sRYXsQJTg3v8prLQTxkXT3ukbvMKwFy9AHSA9DTi
1Y1JZXFjpbNfSI1hi8izVvT3lxLhp18Xg2danpoX5FgF+ICddae6EkOJVD4IznWe
vJiHxncqOOu4qbVSLTdOz6RFu8gQGq+3AUob6bb9g3j/3sCpaZEFVkprEnfXWe79
+ZjWXdjJ8Lz/LN5ImoEqO8mYcWS3ZBGK/wx3NB7L4rHAuK+K3m0=
=Aqgr
-----END PGP SIGNATURE-----

--sjf9qHOugQSVtDi0--
