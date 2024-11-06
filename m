Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31EA18FDCE
	for <devicetree-compiler@vger.kernel.org>; Wed,  6 Nov 2024 03:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730863705; cv=none; b=MN8v/hfrRjox/vIr6JRJnPJ6wqocJlTuPiFYeJIxAr1YGiVhWhzby5YUpzAkevWxmWYjtf16dZ6dUyIc3GjSnvqxPlePklz7AFNnye5mwD68i1OFszbMVEM6LEekaPv9oDZfYARkU+owzeF/UGThUtBwfqo0ZtkTV0+2lHkIJHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730863705; c=relaxed/simple;
	bh=rhPKfVeUdmUWSQjI+JRmb+H7tEVSnWje7oDKEJF0DKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNhkdILN5t56HYfxwtyF0WARQWRp17eUFbwsOLZT7aN9hyGc7WwRwwPkj4mmVHjGlz8xXRVGbhr2f8BjKrGTSkC6xYMMQavRiEm3RN0ikCzGOfqo1CiSShAUUJKY6XMOezK/RFTHtmgVcwlPgxgOhf+eNaCindm1RkAiRvaMlL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=nxnoJ4Mk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="nxnoJ4Mk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1730863698;
	bh=TTn72elX3esZJgD7ryh4AwbkLHk6vu1rd8d460Nil9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxnoJ4MkaU8wlU+Stirmqd2CxS7ypW/Q0PsMpRtzrtn+qBwimG/o3ZH52QYH7HwTn
	 Y3AMfVNHlTITp3LlLWX1zZO/ru8PfH30ECSXq/IvU2axd28kGgRgpOJLmnQPb8iQEr
	 o5fzAgGYb6hNQxQOiXXZLceX+OhADNtGQ/mjGhDw7Br9DntbF8wD52LMq4xtABFBVD
	 w9a7NZxm/7l3EuPNZeIUUDM64KrAJI+t5hZIVmTmJJ7lKmDBNAost85i2k0Yh8dqL/
	 aNpDVBsnlcUDSrV4/tZPXHsLuLeuRpoFpRCEvrtY5zICttQYMd8glrj0p6sHCXzbZb
	 x676nEmwB6Y9A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XjrJL65bmz4xFt; Wed,  6 Nov 2024 14:28:18 +1100 (AEDT)
Date: Wed, 6 Nov 2024 14:24:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, Rudi Heitbaum <rudi@heitbaum.com>,
	u-boot@lists.denx.de, devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: Fix build with swig 4.3.0
Message-ID: <Zyrhis5MkSnN8kSZ@zatzit>
References: <Zxzh0ODFyZnav5JE@74d70d9af7e3>
 <fc3dcef2676252484cfa427ad0197cd9aa697420.camel@xry111.site>
 <ZyGHKJZe4q3ZP5oc@zatzit>
 <CAL_JsqJDYwX7jAShFboGv6Bw8zd_UeW+ArVwtv+U8oVJgCkRKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gqZ6jfCOagcGrA6U"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJDYwX7jAShFboGv6Bw8zd_UeW+ArVwtv+U8oVJgCkRKg@mail.gmail.com>


--gqZ6jfCOagcGrA6U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 07:36:15AM -0500, Rob Herring wrote:
> On Tue, Oct 29, 2024 at 8:10=E2=80=AFPM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Tue, Oct 29, 2024 at 08:52:52PM +0800, Xi Ruoyao wrote:
> > > On Sat, 2024-10-26 at 12:34 +0000, Rudi Heitbaum wrote:
> > > > Call SWIG_AppendOutput instead of SWIG_Python_AppendOutput so that
> > > > is_void is handled within swig.
> > > >
> > > > Link: https://github.com/swig/swig/commit/cd39cf132c96a0887be07c826=
b80804d7677a701
> > > >
> > > > Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> > >
> > > Dtc is a separate project at
> > > https://git.kernel.org/pub/scm/utils/dtc/dtc.git, so the patch should=
 be
> > > rebased against it and sent to devicetree-compiler@vger.kernel.org.
> >
> > Looks like someone independently fixed it upstream:
> >     https://github.com/dgibson/dtc/pull/154
> >
> > I'm doing final tests now and expect to merge shortly.
>=20
> Would be good to tag a release too, so that distros have something to
> pick up when they update swig.

Done.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--gqZ6jfCOagcGrA6U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmcq4YkACgkQzQJF27ox
2GcnCg//V6N5u6WkzwPP/Sx8n5U/Rw48X7BaO4+IiKnoX3onGYEnVByQpSxr+TAA
9kInNQakuLVKGTycCwwn4UX8euHMGzIrOXyjD5PxPWTDeFQnBmeNHqQ7Grr2xOgi
U37lqw7aH4W5Xdp0CBFhz5x712lr98vzGXQwQogHWdu90T5Vu/tFZZw+utO3nnQ1
SDCcKnWYKK1AEpaJCj9wa9rP0mvBkdo27yPJKgrnNA5Aj/OuQpeVA8d8g4inuMe4
pUP5q+Lsgf+5pd/YUlADv7VVvoBqPC7cQWWKaPSpOHJ+Cam1GZeqiQZZNqYVkMYv
y4zRlsGTZKxZ6RimbTwROuGq+6MmXYMKf8oMpLGxnz+Pcda9zxXVRLuZ97tZd1MV
eHJVQA9q7u06wwcKkgQN5M3Vs44kb4oSDx9gm+PbnotGU+VdDTa/pzpWUhAXiqRe
s+xuERoWQ7JYELCqLKtIR4dlOOnY2W5AJiYzVZdaD81HFFsSpzLXswPq4ucTTnFd
IfmjZXUYqmv7R3RsH3eQPsNvX+yYpiPih3+ccqKjjWFEG09IrQql/OCr/e13LeaZ
p0sPikzB/GbW2r9X2PT/LrnUiD4TjSANUFfNtYRlwVSFbH36RMoLjAg8YSnJcIlh
RDYiRcwJwei4PT/gpZg6Fsv8lV4hjJRCgv5tOVXuLAHglgFduHM=
=L4Yu
-----END PGP SIGNATURE-----

--gqZ6jfCOagcGrA6U--
