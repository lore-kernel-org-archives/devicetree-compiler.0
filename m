Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7371D5170;
	Tue, 24 Feb 2026 05:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771912695; cv=none; b=JI2m7fPCTgBs/f35RzXUaQ9W7jmqzx9DbmGNYr3ufOF6a9tmD672R1v2IxpwUQB289eSzkLFW/2QOX0XeZGdaYl48YlnznYFMWLQxK8qPnOl6tgl6OiVSO+kQTrFV5qGBtZErOR/xugz+CeGITWr7DsIqJv6r6M71LxW78g6g+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771912695; c=relaxed/simple;
	bh=Jd+XYupNe6Fu0v6x3dnQHJcxXnnAcylBJz9uUkTGcFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9DHYSVBXJpCYe8MQuVbnjcMszIKcvegicRzRv2NMLcCgw4YIio5iOTZV2LlWQFeythZyXXAu5HoufFPbhAZPMHuwLW43R1j2xfsuXwOMvzDzcYf2Thjv19Km2CwZudTT8s5Tjb3akOQ3uV9zFe/sMwkvuLjVVFd60/zl+ew28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=aStgNg9p; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="aStgNg9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1771912683;
	bh=h2a9a7CPqsaa9/UpktudXjX9xNfG33qbSVETDCSdqQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aStgNg9pbJQFWhCSGfATsfPJELQfHZ4DSIY4iz10M31UjJFoWJJk98hmSEN0prunA
	 Rd6A2W80R2DEraU0qKMWAFI6uzPsJdREl4RrIFk/dgnom9FJeWMGisauXKiafMcdP/
	 KGC0ARLh98L1Ugf2DVISK818zP+RJqdypXNVs5uarPzjg3t+aIqsF5cBNWFXo2iFKC
	 8CgzG/1ERC68RF8tFXhhH44Oyw7St4Wb73jeaKJU6CEBKLPhMLOCfpMN4ubeg8xyoO
	 UR+WXd9IyOZyznw/Exb0i6LaBDMutxW0nkSGwLmmOcPUZzOg7X/RkCvKwVViVVeFsK
	 OA31xXUVJGZCw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fKn7v5Vx0z4wCB; Tue, 24 Feb 2026 16:58:03 +1100 (AEDT)
Date: Tue, 24 Feb 2026 16:57:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 03/15] fdtdump: Return an error code on wrong tag
 value
Message-ID: <aZ094BpPg4r_xBng@zatzit>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-4-herve.codina@bootlin.com>
 <aZvnwbRVoX73DyLJ@zatzit>
 <20260223093950.7c44b540@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+1Q0sZ7XDKS8rVEz"
Content-Disposition: inline
In-Reply-To: <20260223093950.7c44b540@bootlin.com>


--+1Q0sZ7XDKS8rVEz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 09:39:50AM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Mon, 23 Feb 2026 16:38:09 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Tue, Feb 10, 2026 at 06:33:31PM +0100, Herve Codina wrote:
> > > fdtdump prints a message on stderr when it encounters a wrong tag and
> > > stop its processing without returning an error code.
> > >=20
> > > Having a wrong tag is really a failure. Indeed, the processing cannot
> > > continue.
> > >=20
> > > Be more strict. Stop the processing, print a message and return an
> > > error code. In other words, call die().
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com> =20
> >=20
> > The intention of fdtdump is that it's a fairly crude debugging tool -
> > it will generally attempt to produce at least partial output even on a
> > bad dtb file.  If you want a polished tool for use on good dtbs, use
> > :dtc -I dtb -O dts".
>=20
> fdtdump is also interesting for tests purpose.
> I use it to check dtb outputs during tests. Those outputs are either
> generated by dtc or by libfdt.

dtc -I dts should still be usable for that purpose, no?  It seems like
the better tool for this job.

> Having an error code returned by fdtdump when it cannot parse the given d=
tb
> allows to have this test (patch 10):
> --- 8< ---
> +
> +    base_run_test wrap_fdtdump unknown_tags_can_skip.dtb unknown_tags_ca=
n_skip.dtb.out
> +    # Remove unneeded comments
> +    sed -i '/^\/\/ /d' unknown_tags_can_skip.dtb.out
> +    base_run_test check_diff unknown_tags_can_skip.dtb.out "$SRCDIR/unkn=
own_tags_can_skip.dtb.expect"
> +
> +    run_wrap_error_test $FDTDUMP unknown_tags_no_skip.dtb
> --- 8< ---
>=20
> >=20
> > That's why this didn't die() initially - the idea is if there's some
> > bogus stuff in the dtb, it might print a bunch of these warnings, but
> > eventually resynchronize on another valid tag.
>=20
> Current implementation cannot resynchronize. The parsing loop is exited
>   https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/fdtdump.c#n150
> and the program just returns 0.

Oh, good point.  In that case this change is unequivocally an
improvement.  Applied.

> Instead of just print and exit the loop, the idea was to have a program
> error code set. Calling die() allows to print, exit the loop and exit
> the program with an error code.
>=20
> With that in mind, I can do what you prefer. Either:
>   - keep the die() call
> or
>   - discard this patch and update the test in patch 10 (i.e. remove the
>     'run_wrap_error_test $FDTDUMP unknown_tags_no_skip.dtb' line)

So, I've applied the patch, so I guess option (1).  However, I think
the test should be altered to use dtc instead of fdtdump.  I don't
really encourage fdtdump to be used for anything except ad-hoc
experimentation.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--+1Q0sZ7XDKS8rVEz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmmdPdUACgkQzQJF27ox
2Gf1pQ/+JVlt9Rv4xLWlHmVh+c/lB9wf3rXhxOv+OHyfEE4sHYzs1e4DwKMmAsxN
p8A2q/iLVAjk1qDlaYnXckhRSFXnw5W6P5aHoJmJyzi8+rfNjOM3QHk6AxGjtjnE
jfy7ou6ZEESb09myqyEax/YxkXl5sNbqfQRp/CuCeSkvUpcbk7YEOJ3CgaUxzyeO
d18cQft83qIlqHtoC1z8ldwtTFZTa3yXsCor9locANTtdQhSyZSMXMgx6uPLyFH9
lS8caGiOyn1X0hYFzc42wKrj2bAeR0Rpd8OKjokI6qumAEPGYsm/4qzIEPgflZV6
a/x5eVeWZEABywsb0YYt3DaGZdcBpEKuGxukq2x9GjCNrXJSlutj3HzGGOyCzIu6
1jsMsROCgNNEKwHcVWto8DerEbEAxSV/0/nx7zxPO8WiJk1ldgmnmUaZVYsTEMas
EmKefrrpll7fuxdlDC+JQP7/04VfXvsSj/WtGHT7yZ8G0e6yK36N/afU1i3J+MhN
M95CnpIV/mOnC0TrLSqkIs/m2JsiME6vSHoBaRPEYrjBIuqviMEAaz1LC8myI9C4
zLyHEIBeB4XP9xwoy/oa5q/aOiybiCUmVJoz804CgGqjUKwcGEn1bv4pc/gKvW57
yGy/KOA+Xm6tWA7iCOFmlzeCsL6EI8ZvyyOwJPSb9lEP3wp6ex0=
=ifY4
-----END PGP SIGNATURE-----

--+1Q0sZ7XDKS8rVEz--
