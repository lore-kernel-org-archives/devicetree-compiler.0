Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3796120E0
	for <devicetree-compiler@vger.kernel.org>; Thu, 11 Jan 2024 05:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Sv1iARrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1704952129;
	bh=dqoCgFoHbkc193w2kUh3/FPr5bKJR0FgKcFhNwUe8hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sv1iARrrXY7mR7BYKYSgzyFbmTxQqNSfKAXvbUNWAzQEVRYniI9qumZYi00cXPkvz
	 ZEMnnnY+eWTjFF5zSMZSu6aupxnvRd8QIXt/19re3ZEhZqsIFAXBD7PH+tM5GjR5BL
	 Iq7ogK4r3TqyrxUNkrpfm/BNtT9BtImq6DqtRZavj5T/LuH9n57hU9SdsLToPqjX/0
	 m4qZXA+ITQlnup/KXWp72foSO/Fm4f6KK0lv/5C4J1tC6zLReAItM/UW8Frvvd3xsI
	 N7OneczmTuO2JTY+6tbENjAsWo9diK1Yzp3wBaOaSUUbfXSkpT4ISD+tQAI9M6thGp
	 7IvkBGvNNkBgg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4T9Ycx1Dnwz4x1v; Thu, 11 Jan 2024 16:48:49 +1100 (AEDT)
Date: Tue, 9 Jan 2024 21:51:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: Record of original components for fdtoverlay
Message-ID: <ZZ0lJMxKeD-TGyEr@zatzit>
References: <CAK7LNARV8Bo-tBXMdOu55Wg9uZRXvNiRdkDJ4LH8PwVMnMp4cA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pOeiqDfgL11AZ8TT"
Content-Disposition: inline
In-Reply-To: <CAK7LNARV8Bo-tBXMdOu55Wg9uZRXvNiRdkDJ4LH8PwVMnMp4cA@mail.gmail.com>


--pOeiqDfgL11AZ8TT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2024 at 03:20:12PM +0900, Masahiro Yamada wrote:
> Hi.
>=20
> Sorry for a stupid question.
>=20
>=20
> When you get a DTB by using fdtoverlay, there is no way to
> know how it was produced later. Correct?

More or less, yes.  Depending on the exact situation there might be
some clues that an overlay has been applied, but there's certainly no
easy or reliable way to tell.

> For instance, this case:
>=20
>  $ fdtoverlay --input base.dtb ovl.dtbo --output foo.dtb
>=20
> Once you get foo.dtb, you will never know whether it was
> assembled from base.dtb + ovl.dtbo, or it was directly
> generated from a single source, foo.dts.

Correct.

> In my understanding, there is no room in DTB to record
> such metadata, and it is impossible to disassemble foo.dtb
> into the original components, base.dtb and ovl.dtbo.

Yes and no.  It would certainly be possible to add special property
into the dtb to record a listing of the overlays applied.  However,
that would only be accurate if the tools used to apply updated it
correctly, and of course the current ones don't.

Even with that, it wouldn't be possible to "unapply" overlays -
overlays can overwrite data in the base tree so it's no longer
available.  There's not really any natural way of making that possible
within the dtb + overlay model.

> Please let me confirm that I did not miss anything.
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pOeiqDfgL11AZ8TT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmWdJRMACgkQzQJF27ox
2Gew/Q//T5YqeK2JfoKWPODuhqcQSJwCmfvZQkjdwkudMO1MSyQSt2N5sLd2iXWM
OspjghX0M5ywdRU6bSiEkt02ikKXXext1mOTOY2s0QOz4nmCvtctrfemK056v83R
mlhZwD40cdc4IQMk5shZlj8oCNQ6ZOHAZEo1Sa7AI7r2EeDYoxHHXWPVcaaLyyUy
gyGteF8Em0Ubr8aP15tUHkauCZLvAM6Ytysk8mIYsMhxo+CAIU3N+z2gH/C7x/uj
69ByqS5bxEzRwbYzFe+p9isqsRUpGL27SRh+j7rGCRiMdX4Fc3nUgsLv51fGz0Hm
M9pCkjzixCuGJQVRpfAh/tze4vFBR3dosLLCS0mcJuwERNe+VZzN7xfGp3X7IYY8
tRPdDIoZ8xVfEyAgA4mps2Qw4A38DEZsCPSM6WxanQ4riotulDSZA8KTxWTKaQbE
nLwiyn6DYYktuWOehI8lv/Ofq2zpbWttE9uxeVcxiNkKQum+6GPQ8Xj4u7PR7hrp
HwMxeBySPSNdT2HVlPrrsTMZHswXERQKt9tYBdC8c+pz1TF6wPANaLK0fJe/wYCx
pYlHULvkoH/FfX6pDSpXWPkOQTTVZxp3lKw0MGRjGxSMeORCXEDqV9CB992elu6v
LWuRIjn3ViyjZUxDP7nx4JRGp+5RoQytbsVQaXkHWc9YnXLnpOI=
=mXOE
-----END PGP SIGNATURE-----

--pOeiqDfgL11AZ8TT--
