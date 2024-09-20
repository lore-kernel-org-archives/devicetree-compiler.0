Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72517DA76
	for <devicetree-compiler@vger.kernel.org>; Fri, 20 Sep 2024 11:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726830353; cv=none; b=FS+YI7RTSyrZ60gMnRPekH0h34s3w+V/m5T5NcG5cZgtPfK++vKSio+rHMrzH8N0dmTteb+4JE7HafLzBlQu2NUaHkgN26jnRMsPvTsBYWFn/u75EQr/f42VSkFwcLjsofr2nP7ewkKXj8rWEy9Z5MdpQELjT49wNMLSZp+OxrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726830353; c=relaxed/simple;
	bh=Sje2rtg0KLb/j/11HcJNRAMxK5TkmogjiIQ9Ct4dfo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUXG+AFzLZkoeLNuJNGonXIP42ohH3WDB47SVAy4alt6wYh9Xxn3TW2bxgaVCIeU5RKhM+hsVt22QfDBG2gbVxan9irwN54G3IxeGTC4CM4/A5WYFXqGbnqr35UEhUGhLiqAfl9/jYnOyAj+xACIMB/nHuNbrKkrQuwTCuxActk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=NUPbxmah; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="NUPbxmah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1726830342;
	bh=oVZjQyWCS8OXFGwKCsH13DiJOmPLGyDbv4+DasBQN3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUPbxmahRIktlXzwjaEsjJkn1WFqAJRAzODKjtMmQVItCRygOT9HlkcHnJWkQX52w
	 pozDORya0uXV5iemgoTIPifpOUVafNl4aqKdk6VFQyCREEVlhVBI5R1LhJh2jOqPhm
	 eaov2d+glzHDRxCEOOZYh3kWMW5CxEUX8o3wgWSGZ4l97TkXeAbqldb2SZN75OyTSz
	 DMSgjJYqGAEzDp/QQ9TXNC0YmSP/3jCsD9L4F2yN25ZK+8OXHsas4+1DgFgoi3Na9w
	 RMd8AA1jG8VjFopK4+nMCsects4dOeQRYZzm3n0FiWjUPlPXK67rw3oMHwSAnZ7WrI
	 S4Ht4tqIDcaww==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4X98gp1cHmz4x8D; Fri, 20 Sep 2024 21:05:42 +1000 (AEST)
Date: Fri, 20 Sep 2024 21:05:36 +1000
From: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
To: Anthony Ortega <anthony.ortega@terranorbital.com>
Cc: "devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Subject: Re: DTC Version and Reproducible Builds
Message-ID: <Zu1XAFqbtWnDcOmR@zatzit.fritz.box>
References: <PH1P110MB15070467257B855EE1B1BB008B60A@PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM>
 <Zuo_l-DJDQ38SAtA@zatzit.fritz.box>
 <PH1P110MB1507084A3C88BC2CBFAC984C8B63A@PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lxbaL8Gc4tEpn9Ei"
Content-Disposition: inline
In-Reply-To: <PH1P110MB1507084A3C88BC2CBFAC984C8B63A@PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM>


--lxbaL8Gc4tEpn9Ei
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 09:45:04PM +0000, Anthony Ortega wrote:
> David,
>=20
> When I say DTC programs, I am referring to: convert-dtsv0, dtc,
> fdtdump, fdtget, fdtoverlay, fdtput

Ok.

> One other thing that wasn't immediately clear to me is if those
> tools are needed on the Linux side or just for U-Boot. In Buildroot
> it seems that U-Boot requires it when using Linux, which puts them
> in the Linux image. That could be another potential path forward.

I don't really understand the question.  They're userspace tools, so
whether you need them in any particular context depends on what you're
doing there.

> I'd be interested in seeing where the versioning logic was copied
> from. Since this seems to be the only package we are using that is
> doing this sort of versioning.

According to commit a657ce8f ("Add DTC release version information.")
it came from the Linux kernel... circa 2007.  The kernel's probably
doing something entirely different nowadays.

> Unfortunately, I don't think our system can be configured to use
> meson without a massive overhaul. In the short term I've applied a
> patch in our build that removes the line that grabs the commit tag
> during build.

That.. seems like a pretty serious limitation, given that more and
more packages are moving away from make.

But, in any case, I wasn't suggesting this as a practical workaround,
but more as a diagnostic.  If it works with meson we can look closer
at what it's doing and maybe duplicate it with make.

>=20
> -Anthony
>=20
> -----Original Message-----
> From: david@gibson.dropbear.id.au <david@gibson.dropbear.id.au>
> Sent: Tuesday, September 17, 2024 7:49 PM
> To: Anthony Ortega <anthony.ortega@terranorbital.com>
> Cc: devicetree-compiler@vger.kernel.org
> Subject: Re: DTC Version and Reproducible Builds
>=20
> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open attachments unless you recognize the sender and know the=
 content is safe.
>=20
>=20
> This e-mail message and any attachments are intended solely for the speci=
fied addressee(s) and may be confidential, proprietary, privileged, and/or =
U.S. export controlled. If you are not the intended recipient, you are here=
by notified that any use, disclosure, distribution, copying, or storage of =
this message or its attachments is strictly prohibited. Please immediately =
notify the sender by return e-mail and delete this message and any attachme=
nts.
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--lxbaL8Gc4tEpn9Ei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbtVukACgkQzQJF27ox
2GcgMxAAiBO88rfIgsSQ5Q+W9+zzg350E3ZrcBiNWVvwRZD+C6KuhGM2eq1oSuwt
LvaUIGOpezl2I6jgcPKY015690fEp4J1wrKkRcOJFbzUtrAnMb0Bepd+2tArwOUk
22x7tNY0LspyYE9/M25v59aJK04hKWtfK0vpb2/bil2rkVEJRtqk0hdkITVgoRhy
MLZ9HBmBwHp2S44ZBgSCjCZp87momH0hSIzthbFDmMr/ERap+APZzT9d2VFLn2BJ
EUysAwnoAXYs8/gczM1s9zWcqQ+aZUvigs8vqek/JtNRIwR0m7yQUFx8e1pkiP+T
rXmUDf7Wn/CI0MStXtoJFWbI9i75Avmu1+SM9Cwh2oZsAs6pNWTwwodM389II1bC
+GugH48HRqZSN/9rHERdaPeKma/6sPxEju47vjXVm9jx0rALjw8a6BkdVj0HZbZD
xTyB/ccA7ZaWmefF5dOZqZ7oFpK/CgmuCJqQTq/x5Kdf9rQ9tE7xr/jztTOn/zNw
i8TC9sFcme4iBwS0kUJTTHdwiENPO5wrxbuBZRjI2De4Ypfi+wz2pFkmwveZzdkU
/B9UAWbhGzNVht7ytK0tIhhSvecTJdcUuWwpfRmJw+7prtpqhOYCOzkyEy0Atdvx
gJts7FkmkDy7cEINbWPPAQJiz4eeP9MKe/i1LrytbWMB0LG0nFM=
=fq5C
-----END PGP SIGNATURE-----

--lxbaL8Gc4tEpn9Ei--
