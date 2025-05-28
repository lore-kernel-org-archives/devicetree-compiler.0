Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B979143C61
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 May 2025 05:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748410545; cv=none; b=M8OxRnq2d/XX/KqjC2hQy87GFQXfe/mq1wfN/oHTPxoiMM4vTQC4rC9mku4L5X8vdNyDaYRJhhnYPn28ubc0bJ7bSj3c2zgtPnDvumVacnMiZtHXwIDA76tciaqGTVWdaWNu3ghJDGf0/YKdFXlKe5h4ERBrK5l7QVS0u3/mR1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748410545; c=relaxed/simple;
	bh=/8NVLHHf/iq0HT/WI7qGhVujCaPV9tcgJ5kEqnp3G/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMEvJ3ZVBKBHRbeyqHNjfBdHNfDfiNzsoCT/URrBrWSFyx7FufSMkpP/OBo9p86RYArH/Icjjj6e8NVRwahamEo7L7jLFJcOG+rFZxL+Ow9Ux8r2A4QXPqCsx5PZxaxEb48GLBDBrH58Uoe7tlUOwS70hB/oI0t0HwWwNT9e9SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=DAKTTaNU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="DAKTTaNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1748410540;
	bh=MwC1yB4ur23qusGWp9nh6NTv8xMl5rG06PThqItBjAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAKTTaNURYSdJvL5HQ//ZfHtPlDXBAvuhe758WfzkKYGqtY0saiEmnhiQyf2bzChc
	 c0gzGqacexDXonhfAA3j+kVn9V0evpZRZEjzsU/m70fgZurZR10m4OvPjryl1jU6u0
	 uhXwQhs6cg4FMu0t+8PGt9Wih2wnplkmKRf0h7ThXVCeAqZeC1R6OxXboY8frR89vu
	 Vi0EAr3gs3aGM2cIw57mLMiwadUPdRRanlrO46lmhJKYbPZsIQN05ZPpGevUYF/sCM
	 aUDJdtTP0sjabTgyxNEfTIVcjDPdVmRKivT2pj00AVoBo7F+OYmcFJkD65aTCJqhpQ
	 lTL2mfzZQ6lLw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4b6dWc5QbVz4wcD; Wed, 28 May 2025 15:35:40 +1000 (AEST)
Date: Wed, 28 May 2025 15:16:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Glass <sjg@chromium.org>, devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 2/4] srcpos: Define srcpos_free
Message-ID: <aDacGNbvxcxI8SrS@zatzit>
References: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
 <20250311-previous-value-v2-2-e4a8611e956f@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2Tu62UAPiVBNhYyH"
Content-Disposition: inline
In-Reply-To: <20250311-previous-value-v2-2-e4a8611e956f@beagleboard.org>


--2Tu62UAPiVBNhYyH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 09:05:38PM +0530, Ayush Singh wrote:
> srcpos can be chained together using srcpos_extend. However, in such
> cases, we need to free all the chained nodes.
>=20
> srcpos_free is a helper to recursively free all the linked srcpos.
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

This should also _use_ the new function in any existing places it make
sense.  On a quick glance I can only see one such place, in
merge_nodes() where we use a plain free() on the srcpos info of an
overwritten property.

> ---
>  srcpos.c | 11 +++++++++++
>  srcpos.h |  1 +
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/srcpos.c b/srcpos.c
> index 5e2f7dd299184ff86b00b280dc31498cb9830e28..5bb57bf6856c6ff6b8eb993af=
f5d216c63bf5ecb 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -287,6 +287,17 @@ struct srcpos *srcpos_extend(struct srcpos *pos, str=
uct srcpos *newtail)
>  	return pos;
>  }
> =20
> +void srcpos_free(struct srcpos *pos)
> +{
> +	struct srcpos *p_next;
> +
> +	while (pos) {
> +		p_next =3D pos->next;
> +		free(pos);
> +		pos =3D p_next;
> +	}
> +}
> +
>  char *
>  srcpos_string(struct srcpos *pos)
>  {
> diff --git a/srcpos.h b/srcpos.h
> index 4318d7ad34d91d2ada1a5d7f92d2c84148fec366..4d60b50e31197c2da6a7fa885=
1c5e5a6717d78a6 100644
> --- a/srcpos.h
> +++ b/srcpos.h
> @@ -88,6 +88,7 @@ extern void srcpos_update(struct srcpos *pos, const cha=
r *text, int len);
>  extern struct srcpos *srcpos_copy(struct srcpos *pos);
>  extern struct srcpos *srcpos_extend(struct srcpos *new_srcpos,
>  				    struct srcpos *old_srcpos);
> +extern void srcpos_free(struct srcpos *pos);
>  extern char *srcpos_string(struct srcpos *pos);
>  extern char *srcpos_string_first(struct srcpos *pos, int level);
>  extern char *srcpos_string_last(struct srcpos *pos, int level);
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--2Tu62UAPiVBNhYyH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmg2nBgACgkQzQJF27ox
2Gclww//Xm3O8mO3IlPlbn+tpWEDMM9z2UWFiAcl7gIxJvShHJUTyY91nxQ13KR6
xXI/UJPwf1uKeJPCNNFQWozVn9yp7PbGr4SpJNN46abG0fby8aAQzCjmnS+uQeZo
X+/UbKs0y7yg5M3f/wlxhlvMVN3VkghHrD2sPWA34XCVfJBBzSx1+fDlp2Mzo/kt
6EXO1Y8x2nS4+McYhyuYXh4EFrEMaysOn7tjrD0fsrOvEa2kOpY0ZjQ9NoGjzo6Q
RbYAdi4QZ8rWjv3HXP3YoL9V9R7EwSYLlyJpAZi1hMOZh97WlpSoqCtpXMBj1uwT
YsL6kvHAcTCXDWNWv/pmwrCUlGa689bdZPsXLLo7DQ9G1YpB5zvrze3/8yq/R/iY
FTEvllJ0M6z2VWwvUB7FAF3zcoeeEXrpWhiZnl2AHXumMftccR4StdgySSrVrje2
o3qtLAEPGejhq64iSU3XlrjrXporciKkqTcV7Olb+hizSz6WjFPM9Zkgyo30JLPX
dfas0vWw+bpD/msWrdKzCT8g5u2Eg2UFP/a+lJeq+EMu+qigk0perdWs8ElzZUo3
CvAk3fhLXIH998TaxlyrwvSAl/gczNjuVkOPW2A1Wn/U2EVJt135igjOMLMmFpl0
2afMdI2TAUH8ivCtEvxVTXpCEG5yUfnbsq4YUYIiPPjBapUme78=
=sUiU
-----END PGP SIGNATURE-----

--2Tu62UAPiVBNhYyH--
