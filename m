Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B05D39A07D
	for <devicetree-compiler@vger.kernel.org>; Wed, 17 Jun 2026 05:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781674714; cv=none; b=iLCQfFzhALje8xxlub1No0Wl9UFNICgoxUhGXuwK70SWVf6rLX5iG0OXWhfzxQuGYxcypSbvAklncRLl+8RRmBQyqcVQNyDadIHSb8QfH7t/OrWNNayZZ28FuSdccriWDIpjPJ0AuOJFk8eHNiSN9xLPbf6lccim/5ztX9Do8qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781674714; c=relaxed/simple;
	bh=zHQy/lUTrtFzCfCar/3cpVcwdCxb9qizZ5cC+GPJSM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2lQdPJQh+AmrKGjxcr76qKSYoBlgD8Ly35OOi0mPNjgTV2LKefX3yKI5PbLBvhlgqUWaAkM/YLVIc2d1YTHg2hA6Ej112kIzv9pK6Co2mR+ug13EOmKPQHTOg3cC0IhjLqjCfgV2a/QgrTR79zPPYw8VNciXHe3Te6g0hCV20A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Bm9Booaa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Bm9Booaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202606; t=1781674705;
	bh=hqKK3HwT+ZH9lKHmap2K11CmtqUjALJr1DOFxjuVtwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bm9BooaaBR1gLN3gIeJL+Cb9Kc7vpS+64kt0SMIZzRHEJSeCgVun6JywFAvyqN4pH
	 JhL0jE//SAUJ075iiJ8dY9oN2zPBj+w+A7qQylPgzRQTOc9QRpvt5MYww1UIJFVhOD
	 ILPNK9tRnS+nK1cokww6FZImiJf4ZjjUnTrZqiCsdlAr06kSUsAFZeA42m+cFKBtWR
	 fJXiGS/TJi7P33y0alllHbypPXkrcCWbAWZ27iaTnXc/zg63/TAkVzUjyWRLU5kz+c
	 Kg1z2q+Yl8TIsl9BXmaCdUrTbbY1fEqIwxMYH0X/cqw/fp+yDJ2crZjyuZJFMA7SZ1
	 cjMFybtGY8Jag==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ggCM53Hnfz58pd; Wed, 17 Jun 2026 15:38:25 +1000 (AEST)
Date: Wed, 17 Jun 2026 15:38:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Tom Rini <trini@konsulko.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: fdt_check_full: Add can_assume(PERFECT) check
Message-ID: <ajIyy7hesDaTlvc5@zatzit>
References: <20260526203022.4006434-1-trini@konsulko.com>
 <ahZxuCONf2JfMXU8@zatzit>
 <20260527043859.GC1858239@bill-the-cat>
 <20260605222054.GC382693@bill-the-cat>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qEWYAeTfPpI/WGA0"
Content-Disposition: inline
In-Reply-To: <20260605222054.GC382693@bill-the-cat>


--qEWYAeTfPpI/WGA0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 04:20:54PM -0600, Tom Rini wrote:
> On Tue, May 26, 2026 at 10:38:59PM -0600, Tom Rini wrote:
> > On Wed, May 27, 2026 at 02:23:20PM +1000, David Gibson wrote:
> > > On Tue, May 26, 2026 at 02:30:22PM -0600, Tom Rini wrote:
> > > > In this function from fdt_check.c we have (reasonably and as the na=
me
> > > > implies) a number of checks on the DTB. However, there are cases wh=
ere
> > > > we may wish to assume that we have been given a perfect DTB already=
 and
> > > > do nothing here. Add a test for can_assume(PERFECT) as the first ch=
eck
> > > > in this function and if true, perform no checks.
> > > >=20
> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > ---
> > > > Along the lines of the patches I posted back in December, in U-Boot=
 SPL
> > > > we just don't have the space for this check much of the time and so=
 have
> > > > always omitted it (going back to at least when Simon posted the ini=
tial
> > > > patch to make libfdt/fdt_check.c here). This is another case where =
it's
> > > > a noticeable size win for us. I had missed this change in particular
> > > > because we had in turn missed catching up on fdt_check_full being m=
oved
> > > > out of fdt_ro.c and in to fdt_check.c.
> > >=20
> > > I'm not necessarily against this, but I have some misgivings.
> > >=20
> > > fdt_check_full() is (deliberately) not called from anywhere else in
> > > libfdt - it's intended to allow the user to explicitly do a full
> > > validity check on the tree.  Given that meaning, I'm not sure it's
> > > wise to turn it into a no-op based on the assume flags.
> > >=20
> > > Your comment seems to imply that the issue here is size - simply
> > > having this function compiled - rather than being too expensive when
> > > (explicitly) called.  That's a little surprising to me - it's in its
> > > own compilation unit, specifically so that the linker can omit it if
> > > it's not used.  Is there something unusual about your build
> > > environment that's not letting that happen?
> >=20
> > So, we have code like this:
> >         /* Get the total space reserved for FDT in blob */
> >         live_fdt =3D bloblist_get_blob(BLOBLISTT_CONTROL_FDT, &blob_siz=
e);
> >         if (live_fdt !=3D gd->fdt_blob)
> >                 return -ENOENT;
> >=20
> >         ret =3D fdt_check_full(live_fdt, blob_size);
> >         if (ret)
> >                 return fdtdec_ret_to_errno(ret);
> >=20
> > And this is compiled on TPL, SPL and full U-Boot builds. On the first
> > two, we're just too space constrained to do this check. So it's not the
> > linker doing the right thing or not, it's avoiding having to #if the
> > code directly (or rather, CONFIG_VAL(...)). My line of thinking was that
> > since ASSUME_PERFECT is that everything is really perfect, this is the
> > way to go. Yes, it's a little odd to have both "call the validation
> > function" and "the validation function does not validate" but that's
> > just because in the second case, we explicitly configured ourself to not
> > validate anything.
> >=20
> > And FWIW, that's really how we use the assume mask in U-Boot, either
> > 0xff or 0x0. It's a case where we're either passing along the tree we
> > bundled with ourself (and so we can assume it's fine) or it's passed
> > along (and we verify).
>=20
> Hey, just checking if there's any further discussion here? I want to try
> and get the delta between U-Boot and upstream down to zero if we can.

No further discussion, I just have approximately zero time for dtc
maintenance :(.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--qEWYAeTfPpI/WGA0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmoyMsoACgkQzQJF27ox
2GdfZw//eB2i+h5rPxF07cx20Dsz0dCunCUy3khpodGj/4l90C9tunWPY4pHt6yU
s3aUEZuDgo5dH1noytMPmsIsOenUELmpUOpfgGaw2+ItILuT7IPRto4V2162DCPo
4rQk7kSuHDmHLWeBNXka1yOrPSxgnNz7bXNdEwTUcxJEHuANPLKteH8z9krzgVEq
H+J1M7seKej05JW37PDm+/n1apq2q75XRCN9vDp0115/+CLXtimKvrlypnKrAXS0
T+/Wv4kDWVJpyYvHLh6YOHsftNKbzzOmU1KzWB8/8K94wyYyXY9yBcVy7bIZqStp
XLE0qVJ93uptFks2AyMlcGMqhL+gTg4wVRR44sDtMqJSoIsNSVXz3mLwjtOCHpHe
o9xVZRvo8sNOTZcsREXn83sCtJM52VyLwIcKxYmmDWKOXJTdikRAHCovM8BVwimD
TrT1J6yDZuaeSdGusF5nFRjqAkVqk5/WFXIpkTK4FVc/XzrJ9jzL2VgvUEA1AKgk
ZurUz9Vg+Z4/dx8IA1vhRqI+eGAMETHuh/d9khkVta+J9CXX8ZoXXVNzCAO1bWeb
/af3nCOJviu8pWxDAvfVeji/GngdcTwpDHBJSsLpaxDmQwMvVnbZyj5ehxDcpuIs
sV+UQYt8rx4GM+z+2xyN1NO5qw2uyeeKYVqGqUFUsqm6/wI5aSQ=
=tWeG
-----END PGP SIGNATURE-----

--qEWYAeTfPpI/WGA0--
