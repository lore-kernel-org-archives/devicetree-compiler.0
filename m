Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E721A4F0C
	for <devicetree-compiler@vger.kernel.org>; Tue, 24 Sep 2024 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727176233; cv=none; b=DwB4q89StCbUnm3DOTXF0Ujhs7LQfeWC8o9V1MUW0hU8Nw1bBYxisXjTXW5idVsBJoSupB7Tpe0qaX0Q3Z6slb28CFEc9NzruRlmaekMLsTqgqFmu2puenAUqgdWw9xviB91Ym+h5VpP5ZMpN0zrl9AU7w4cjSjccMzsBPvpN1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727176233; c=relaxed/simple;
	bh=T/ff/CYddkgTo7Dear4kPF0txN15KOlRiTeeHMk8TQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9AkAzbAhGzUUge9+7rNLJ6kWyJfx0muwG1vIbbE0LzFt8lP8v+LXDurg+ZFy3JfWwOcs24X9MsCIxI1uBu1amUx4WjdYC2FR8VVwNaQZfIDNMbIeoRiJqra0nPY78Xj4B+wuNnnDSHdK1lmXi8Lng295zJlgxMCnx+KWSOKGQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=GSbOEG51; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="GSbOEG51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1727176225;
	bh=T0NfQxwO1tnknQ9jUq9VooELv2RGQR77+gPOedVMM+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSbOEG518bcNSLw5s7fodkV1XNmK9R3jF8zBTTSWeoPlvvFgvRE7qFJ76BW/YBTB2
	 LhbsjfzCQ7N8chVa84aUDBDwKL9gxx2ansZ6WZq5fdet7R2z9D5/7fymYqJy/QkUAn
	 pAncjBVISqsS8fXvQ55D7BVugiut5yCdWj+AS3Uz4jsllKS40R+dBE2MSemadd/ege
	 1LibSSkZMSdTTWh+l6aoPDi4TUWPndRShD4ZYxIfGjvuctQJeRQfn3jMOLQrk92PW6
	 rn3KAP7T9J4ExtGQGdWCIKtMCNPrClpuXb2UFGk2kKOBCTS8roOWVQq6g0VD91E06h
	 UgtxBBr6O9I6A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XCcbP5YM3z4x8f; Tue, 24 Sep 2024 21:10:25 +1000 (AEST)
Date: Tue, 24 Sep 2024 21:10:02 +1000
From: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
To: Andreas Gnau <andreas.gnau@iopsys.eu>
Cc: Anthony Ortega <anthony.ortega@terranorbital.com>,
	"devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Subject: Re: DTC Version and Reproducible Builds
Message-ID: <ZvKeCgsI-Qthz9A1@zatzit.fritz.box>
References: <PH1P110MB15070467257B855EE1B1BB008B60A@PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM>
 <Zuo_l-DJDQ38SAtA@zatzit.fritz.box>
 <PH1P110MB1507084A3C88BC2CBFAC984C8B63A@PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM>
 <Zu1XAFqbtWnDcOmR@zatzit.fritz.box>
 <58d4594d-ef04-4b3f-9a4e-f97fa37c1827@iopsys.eu>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="34DuI/cDCmVtk2pr"
Content-Disposition: inline
In-Reply-To: <58d4594d-ef04-4b3f-9a4e-f97fa37c1827@iopsys.eu>


--34DuI/cDCmVtk2pr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 12:46:20PM +0200, Andreas Gnau wrote:
> On Mon, Sep 16, 2024 at 07:51:31PM +0000, Anthony Ortega wrote:
> > I am trying to generate reproducible builds for a Linux environment
> > using Buildroot. One of the last packages that is giving me trouble
> > is the DTC programs.
> > [...]
> > They all seem to intend to encode the git
> > version of the package they were pulled from. However, in a build
> > system such as Buildroot the DTC source is staged in such a way that
> > the git information is stripped away. While that in of itself is not
> > a problem, the problem is that it may be getting built in an output
> > directory that is within a larger git repository. Therefore, when
> > the setlocalversion script runs, it ends up pulling the version of
> > this larger git repository.
>=20
> Yocto/OpenEmbedded[1] and OpenWrt[2] avoid such issues by setting
> GIT_CEILING_DIRECTORIES. Maybe buildroot could do the same and fix it for
> all packages, not just dtc tools?

Oh, I didn't know about GIT_CEILING_DIRECTORIES.  That does indeed
sound look a good idea.

> [1] https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake=
=2Econf?id=3Dbb3101fffceacfa4c021c33affb7c785da8d859f#n788
>=20
> [2] https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob;f=3Dinclude=
/package.mk;h=3D7fbecf98dc7c9a5b11ce1958e254578f7e4d9c73;hb=3D7850e197670af=
ff38426075953ba6a71f0f431c8#l202
>=20
> On 2024-09-20 13:05, david@gibson.dropbear.id.au wrote:
> > Unfortunately, I don't think our system can be configured to use
> > meson without a massive overhaul. In the short term I've applied a
> > patch in our build that removes the line that grabs the commit tag
> > during build.
>=20
> On Thu, Sep 19, 2024 at 09:45:04PM +0000, Anthony Ortega wrote:
> > But, in any case, I wasn't suggesting this as a practical workaround,
> > but more as a diagnostic.  If it works with meson we can look closer
> > at what it's doing and maybe duplicate it with make.
>=20
> I do not know what other projects do, but most likely those that do not
> exhibit this issue, set the git-dir explicitly (or use GIT_CEILING_DIRS) =
to
> avoid git taking some repository above the source directory.
>=20
> I still think as a first thing, buildroot should implement a generic
> solution and then we can look into fixing dtc and tools.
>=20
> Regards, Andreas
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--34DuI/cDCmVtk2pr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbynfgACgkQzQJF27ox
2GdeSg//ZgBirwZE1ZuF+7QNcOAG9fBB3BdxAGd16LrOSnLJmZozvVv2LtTURJT7
IJIEVk6uISA+grC52sopMWCXqvQRe25jVvqAywQU0MdycWuaJqXjoXn6o19bAABj
Od+t7Yoz9cRSAE4IaaHNjIST0aA4Ajq5d+txfSrtTheuS+o3rUHjuMZLDXhjFwE/
gYCx4Ie7HHqovZZJSU/JeeUjzupBzPQ1f3mQ6yxwMStC+8GqriCjw059KzGebe1t
WMf2EAIXKIGaasUUVoS3P+daSmSRjTM4WM7pc+Vwpjgu2fwn17yKzvZFNucj2Che
bdf0t2OleoW6xu9x3OzZ9dirX7Ggwv5gB2zRiq5XHaBJvKKfa0MdQP3Ls15BvcL7
A8tThAGFBJEo9oNNO1xZtP4GTKMXXaTVip0BgSj2EkUPHtdJZXKwvaZaJxUdlAw7
g92s85Qkg+/P/guxd+9UydSrKhH20tSG78Pz31OozHY3zi+jDEitO+vpqfl/bH5l
jszPzUiMsLqKR2UxflxEi0iuP/ylAqPJCMo76kfWgiEGKB7YuA1O55Lp0fc5RvI/
YdXSHBL52hMo1+1U4kghNmj+mRNUBs2LzExQxP3mi8BYw18TYvjCBhivCQhKBNL0
2zIZxmKvxGY/P0ZTjK1kzx8pD5Tbw0AkfazIyrzORbY7sKiaEPM=
=hR1F
-----END PGP SIGNATURE-----

--34DuI/cDCmVtk2pr--
