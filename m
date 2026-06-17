Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FAE397B05
	for <devicetree-compiler@vger.kernel.org>; Wed, 17 Jun 2026 05:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781674714; cv=none; b=ZKmm/7MGNYf3+GacxYOV5giK5zoG0kJX/4iQBH2dbMn/EYJ+sMBw9nbWSpJ+RuUCcqHcdCqmVoDNtC7JeBhIohsZBs5ZVMpGpUpJOavx9whDJSiqq8RNGgCHhByF3AqBdoPoU8tt28DWRlFmSlDeCN22D+KrPVbeuSIFsPxIczw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781674714; c=relaxed/simple;
	bh=GJZRhBe9+ZbR7IgqjExTiYC0lGNI5xkMB5nn0iIhdVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdMJ6Xw2Lfq5bfdaxmqKJH5ERHSL7hG1bshC7BGYZ6jeynZI07RL5bxJhasEHuL36W6yL0b695dGD2DGctGOA4wFC9J8pZOuRgMvsvfrpOzgoUWfA+/HEiqU5qRDx+a38LxGnDNK/5GNzNNmW7MKtwDBe0mYqj2PTQz3XWclEFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=cnm95y3z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="cnm95y3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202606; t=1781674705;
	bh=38urtEuWv26TMUF1V0+n28fv0nlyJxpaN4Pye7n0NbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cnm95y3zzrSmbVXo+X0zxiYdrpXa7EPI6xIw8ccO15uHr6PSefsbfWsO51Nkw3L8R
	 oWRDkvaFpuh0YKI/Si+uUy5l8DE2xrIcRqM4QXDKJvflzGfiYif+e+azZzQHBl/tG3
	 dkYOZL6rvF81z+aROt3AjleApxJRGZ16IaLaucWR2tANEWR9PfS+jarFgtLypB9pNj
	 GK51BlOpHmTOOqVJcivnYAvAaC344DRyiGbyw5dJl6dkN/GpQpn8+f4K3fu7KBkjAM
	 NEMnX9PcS26IB8uW7uVQaBSse6tqIM99gJmuZQVpDTJkfVnLv4I0wd93MQDIjbv/63
	 6/dnWCCD3PlnQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ggCM536s4z58pc; Wed, 17 Jun 2026 15:38:25 +1000 (AEST)
Date: Wed, 17 Jun 2026 15:37:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Tom Rini <trini@konsulko.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: fdt_check_full: Add can_assume(PERFECT) check
Message-ID: <ajIymRc7MuR6krgg@zatzit>
References: <20260526203022.4006434-1-trini@konsulko.com>
 <ahZxuCONf2JfMXU8@zatzit>
 <20260527043859.GC1858239@bill-the-cat>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p2+YznaeSOZSzEzW"
Content-Disposition: inline
In-Reply-To: <20260527043859.GC1858239@bill-the-cat>


--p2+YznaeSOZSzEzW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 10:38:59PM -0600, Tom Rini wrote:
> On Wed, May 27, 2026 at 02:23:20PM +1000, David Gibson wrote:
> > On Tue, May 26, 2026 at 02:30:22PM -0600, Tom Rini wrote:
> > > In this function from fdt_check.c we have (reasonably and as the name
> > > implies) a number of checks on the DTB. However, there are cases where
> > > we may wish to assume that we have been given a perfect DTB already a=
nd
> > > do nothing here. Add a test for can_assume(PERFECT) as the first check
> > > in this function and if true, perform no checks.
> > >=20
> > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > ---
> > > Along the lines of the patches I posted back in December, in U-Boot S=
PL
> > > we just don't have the space for this check much of the time and so h=
ave
> > > always omitted it (going back to at least when Simon posted the initi=
al
> > > patch to make libfdt/fdt_check.c here). This is another case where it=
's
> > > a noticeable size win for us. I had missed this change in particular
> > > because we had in turn missed catching up on fdt_check_full being mov=
ed
> > > out of fdt_ro.c and in to fdt_check.c.
> >=20
> > I'm not necessarily against this, but I have some misgivings.
> >=20
> > fdt_check_full() is (deliberately) not called from anywhere else in
> > libfdt - it's intended to allow the user to explicitly do a full
> > validity check on the tree.  Given that meaning, I'm not sure it's
> > wise to turn it into a no-op based on the assume flags.
> >=20
> > Your comment seems to imply that the issue here is size - simply
> > having this function compiled - rather than being too expensive when
> > (explicitly) called.  That's a little surprising to me - it's in its
> > own compilation unit, specifically so that the linker can omit it if
> > it's not used.  Is there something unusual about your build
> > environment that's not letting that happen?
>=20
> So, we have code like this:
>         /* Get the total space reserved for FDT in blob */
>         live_fdt =3D bloblist_get_blob(BLOBLISTT_CONTROL_FDT, &blob_size);
>         if (live_fdt !=3D gd->fdt_blob)
>                 return -ENOENT;
>=20
>         ret =3D fdt_check_full(live_fdt, blob_size);
>         if (ret)
>                 return fdtdec_ret_to_errno(ret);
>=20
> And this is compiled on TPL, SPL and full U-Boot builds. On the first
> two, we're just too space constrained to do this check. So it's not the
> linker doing the right thing or not, it's avoiding having to #if the
> code directly (or rather, CONFIG_VAL(...)). My line of thinking was that
> since ASSUME_PERFECT is that everything is really perfect, this is the
> way to go. Yes, it's a little odd to have both "call the validation
> function" and "the validation function does not validate" but that's
> just because in the second case, we explicitly configured ourself to not
> validate anything.

Ok, convincing enough.  Merged.

> And FWIW, that's really how we use the assume mask in U-Boot, either
> 0xff or 0x0. It's a case where we're either passing along the tree we
> bundled with ourself (and so we can assume it's fine) or it's passed
> along (and we verify).

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--p2+YznaeSOZSzEzW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmoyMpAACgkQzQJF27ox
2Gc1cw//db15Us61tkj3PGojsp6haqEJDMqV52CxEojQ6t1i97HaPOWaT44zfluR
qC/Iu4T0fK4oMz2Qdy0Y3FgYNg5vwQj1O8mMiNBbVLSkYcHJVQquKXwN9I24Izx8
8oSIZ1dLUr405lmxcB6sFwFW9XhjP2eFnN3d3zTieUEaCkiVvE4SkdldRPi06lAq
0Va6gmvOMQn5wbUtUMdxrWHxvzxIkuqd4KG//0pxGJsrb4tOpNwuEza+EMOzWTCS
0/d0k4pcGxu3uxDguceXjZonNZQAKoi3d10M6SedTKWDhVkINMee58J2gDqO57VX
f3eObYzHkhkdWbV20m0U28R4PH4soMPG5C6I/Ux9vlv8U1cC3gXEqatu0VGhNSuK
SxTLzky6zcfLcwCP6+p6vqYVIiqdgYr4YDh8NQmr37UZIed+N/hp3QVAvHiERE8z
P9z/ixzLxQQBtv1Kcxxg7nnRrq4tmGu9qXyX+t/2SNPuXZJ//GWw11m34hEBKkVk
Q+2dbz2tEviwlTtFrjCzaPkKZs6T5ftGar8dMn5COUPdiMRQ8Ejm37sqiZx4UcGE
0ERwUDt7DlQoQhIRWvqG7HJ4RUqHrs6+nUH7OjreyDqAyPwe9cx9EkD5KYO2Sx2J
25WNwY6EWINc66J+5WOZB3KGB7ev2KU6YlXPU+vBXA/ZP+5yLTY=
=5ToU
-----END PGP SIGNATURE-----

--p2+YznaeSOZSzEzW--
