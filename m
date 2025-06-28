Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE8833E7
	for <devicetree-compiler@vger.kernel.org>; Sun, 29 Jun 2025 02:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751163691; cv=none; b=phdOVrJtgf3/VcQPJkbd94j1EdGYX45GdjP6zvHhqvrT3kp3LccTzEzwWGu+yoQRP0IbYJDzTsigzF8A/jHB7G4kcneQBaPKd4Np3/HaGGKbxdN1FrSJ7gEUHb+qHOGrStoRYXnCUrfTtrwXN7XB3NeRzURhLJRd78hIQnVDbnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751163691; c=relaxed/simple;
	bh=kT5QbKoomzU38cbgQn2i0R7EViiKBT7SsyThBHgibek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2DcB7JOp/4Fo2TA3u5bWOKxAHa2GU9dwqbT6m+D8xv6xtei9xPtyHGvDulcU2wXZ8ESScMr3X/m93lLFMdTL14hRRcFXevwSXKKKr1T14RWsp2UaoHzXHOkGk/rAlN2PHV83tjoBuYihVfXPk3idDI/6Hna22xeuBynxy5qNmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=eXdq0oEf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="eXdq0oEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202506; t=1751163686;
	bh=rHx03suQKyagyJW1tzNWyGwVTbr5ah0Qm6UO10lZrqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eXdq0oEfDE0FRmK8ZXspUJ0zQli/NbY/iuBwaas53jNkHdPfrWyhF10xLJgoL7gZG
	 3d4zaqlgm/zdpIUMEpzHa8MED60JFMZzEsRCTD2Bd5f/8qxIBQCiF3A5h3zcFpgi+B
	 n//t1ipzgaZCTc8tFl9dR80mm+ltaVxgnxEalXVujfy938NBTyApiETW8fEyLXnNR/
	 fkhIEn0HiaG9uhNAyS9vH1ysHRufOn/YTl7c3MkoKQ23B0YQjgs0pTPBbDiKLo4AjX
	 TpR7ANt1uEsIPEHRHkW4qlkOPkeTdV+Qm7srEYOAGYSomZ6Wg0izrxtxgWZ20/LcY5
	 96TtpThseFREQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4bVChk5DlQz4wnp; Sun, 29 Jun 2025 12:21:26 +1000 (AEST)
Date: Sat, 28 Jun 2025 21:02:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: devicetree-compiler@vger.kernel.org, kernel@quicinc.com,
	kernel@oss.qualcomm.com, Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [PATCH v3 1/4] libfdt: overlay_merge: Introduce
 fdt_overlay_merge()
Message-ID: <aF_Luosqutkq6CVo@zatzit>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <20250519091043.621316-2-quic_wasimn@quicinc.com>
 <aC1VQfD3F1v_1rem@zatzit>
 <aDmkipTfwXqyz1Mm@hu-wasimn-hyd.qualcomm.com>
 <aD7X2MMB5x0WWkLU@zatzit>
 <aF5y5vqcndKUQPuH@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BYoLE7+Rz+svWgwm"
Content-Disposition: inline
In-Reply-To: <aF5y5vqcndKUQPuH@hu-wasimn-hyd.qualcomm.com>


--BYoLE7+Rz+svWgwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 04:01:02PM +0530, Wasim Nazir wrote:
> On Tue, Jun 03, 2025 at 09:09:12PM +1000, David Gibson wrote:
> > On Fri, May 30, 2025 at 05:58:58PM +0530, Wasim Nazir wrote:
> > > On Wed, May 21, 2025 at 02:23:29PM +1000, David Gibson wrote:
> > > > On Mon, May 19, 2025 at 02:40:40PM +0530, Wasim Nazir wrote:
> > > > > From: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> > > > >=20
> > > > > fdt_overlay_merge() merges two overlay blobs. It is largely expec=
ted to be
> > > > > used offline on a build machine to combine two or more overlay bl=
obs into one.
> > > > >=20
> > > > > It is intended to help maintain device-tree overlay code in
> > > > > multiple source repositories, but merge their binary forms (overl=
ay blobs)
> > > > > into one so that bootloader's task of searching for all relevant =
overlay blobs
> > > > > is simplified.
> > > > >=20
> > > > > Introduce fdt_overlay_merge() which is identical to fdt_overlay_a=
pply().
> > > > > Subsequent patches will introduce required changes to merge overl=
ay blobs.
> > > > >=20
> > > > > Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> > > > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > > > ---
> > > > >  libfdt/fdt_overlay.c | 59 ++++++++++++++++++++++++++++++++++++++=
++++++
> > > > >  libfdt/libfdt.h      | 18 ++++++++++++++
> > > > >  2 files changed, 77 insertions(+)
> > > > >=20
> > > > > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > > > > index e6b9eb643958..8690ed55c8f6 100644
> > > > > --- a/libfdt/fdt_overlay.c
> > > > > +++ b/libfdt/fdt_overlay.c
> > > > > @@ -1098,3 +1098,62 @@ err:
> > > > >=20
> > > > >  	return ret;
> > > > >  }
> > > > > +
> > > > > +int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
> > > >=20
> > > > The parameters should be renamed to reflect the new semantics.
> > >=20
> > > Sure will change to proper name.
> > >=20
> > > >=20
> > > > The 'fdto_nospace' parameter seems weird.  Why not just return
> > > > -FDT_ERR_NOSPACE from the function?
> > >=20
> > > fdto_nospace variable is used to know cases when 2nd fdto (overlaying=
 fdto)
> > > needs more space while -FDT_ERR_NOSPACE is used for cases when
> > > 1st fdto (base fdto) needs more space.
> >=20
> > Ah, I see.  I can see the reason now, but it's still a deeply ugly
> > interface.
> >=20
> > Hmm... why do you need to ever expand the applied size?  It's obvious
> > you'd need to expand the based dtbo, but not why you'd ever need to
> > expand the one you're applying on top.
>=20
> Since, we are updating phandle references of fragments & __local_fixups__=
 of
> 2nd dtbo so we need to check that.

Updating phandle references doesn't usually require expanding the
tree, since phandles have a fixed size.  Have you actually hit running
out of space for the dtb in practice, or are you just assuming you
need this because you're making modifications to the dtbo.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--BYoLE7+Rz+svWgwm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmhfy7oACgkQzQJF27ox
2Gf5eBAAkPXNZH8S/zYsSwldcNF7jbKxmw/Iiu3lTaJsctdf6ewI+RB+yLfxMoWA
PSkA3IKHOjQc4ALY5OZAmeJWSLY5/zmLQD80XZtXT1ek+1DKrHo/23sGT+kILbf7
Kk2t6Quw0kTiVp58bgi1zJCbCHHdZ+1iQPmY9t6/j8w/eL6f+elpLxjQeUFyEZpB
cmcEbjFNY7Mhjf/cGXkc/suSgaFAHHeAXuWXP1OyfoyY/bBD7vq0AITUoresIyH+
kV8Ei4+qV4n+56TaLtZCxoewPGcX/qUmhEpbiwvccUYAckixfWLqN+PjU+b+bZ61
kBR3KnD1RHZd6Kq3+HCGEJbqdN2AQLXKgSX/IIlUCzFpQ3w/J70jlryugIk1I0UI
9f30NgtKWU7Y8AZaysklLK5LYS4mHyp917odNoutnEYzp/JoXdWam0B1f3Cq6Dhe
D1XkH6ShPA+R1Mg+I/R8feLMPv42fyQ4KONsxl6c4NPg1I4Bay6D5c49otwrtBNL
D8XD5qLVNGU8zGqgDjiaCHjD6QIhIdPpjeTaVkdgUqWiQ8+Fw041ac0ppFkhaAEm
IIWx/KjLJ4Gyb5ki0N2SJsUPe59jzDCdlvmCPhqwLIsirSgil0vMsQFDE6hh2IY7
WU2uK2Mhe1mTITj0TiMDp5qrS9OZjC1M11t88SOKey4eP2L/zDw=
=Wgcw
-----END PGP SIGNATURE-----

--BYoLE7+Rz+svWgwm--
