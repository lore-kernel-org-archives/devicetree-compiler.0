From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Testsuite failures on sparc64 due to unaligned access since 1.5.0
Date: Fri, 11 Dec 2020 12:07:39 +1100
Message-ID: <20201211010739.GB4874@yekko.fritz.box>
References: <10d4dbcb-506c-df88-cd71-f3ad27254341@physik.fu-berlin.de>
 <4e3cdb1c-87c4-810b-513d-eaae64456d36@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1607648866;
        bh=9ZMY0qv1g0s/pc2EnhiJ/LzZ2pEkYqGJ5KG1gr7BYn8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=naFeTxoD7gym9EGKe8T5ZcHsxGRIcvIJz904JTVBn6VxKl/ptYqJ7ga6ZWHsKev71
         Y012Q2B4PjfRvJalGLQFG94NnCWdjhDcDTcdPGy5BtkTLjShtqCgcu9ObK7AFXAS1e
         +8SIYPhWAkauxHf7owesgQjjZsPcW4hD56V51wLc=
Content-Disposition: inline
In-Reply-To: <4e3cdb1c-87c4-810b-513d-eaae64456d36-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 10:04:47AM +0100, John Paul Adrian Glaubitz wrote:
> On 12/10/20 10:01 AM, John Paul Adrian Glaubitz wrote:
> > I have not done any bisecting yet, but this is most likely a result of =
someone casting
> > a pointer of type A into a pointer of type B which is normally not allo=
wed but unfortunately
> > also not something that gcc complains about.
>=20
> Hmm, it seems someone fixed the issue on git master already:

Right, alignment issues have been a perennial problem.  We find some
platform that has alignment constraints that break, fix that, then
someone finds the alignment fixups cause horrible performance
problems, repeat ad nauseum.

There's been another round of this pretty recently, which is probably
the cause of the fixup.  I just hope the re-optimizations that Tom
Rini has in his pipeline don't break things again for you.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/SxlgACgkQbDjKyiDZ
s5IILBAAtPlMsUcm4X2PxjSbjcaz1NFKyyLHHOgghJS9lL6qo7qGAzp+kxnkDLz5
pW/dCM1IsDYdqUsdgc9iKQvy6LenWSwrYV5zTAkRY6mEx+02zgFUlMI20H+VFnQY
ju6ttDe30WSZJIMPQxwj6JoEdQe7H2YIDmQ0w+YhWRBxl4QehqF6WmvVLM34NqSu
+Aj+1uBLIp1ZrvOJlNHB8iqqvU0f0oU+BwudyB9qJP9yikg5kQzUeFeFu05GJ9Cl
L78YEZ1MKwpQrd6DsrlBv/hH7H4nt8jAt3i38Olc20pcWhSdvw8MbzZXTb/Ly2Re
zWo2SrRgbB16cyUzjUvDeqGC6iuR9Ujqq5c58+dVQ25s6ZcJ4MbwhCb8/WrjSlDl
rgtpm9fXCmC5koBSp/+FthTwfkLVxR4gZUFpBbmHkdMtIeoPTUjt5MAi549K1R9Z
OmcRQUf+lhbnIWffo5Bck3A/wQ1SJDN+Tc8ANTsG7MwhRGKQ8M7PnttUwrK754FQ
ak21yP4gsXbExeoiZjCVkmPHO6Co5vnSFTPPPyjerpDsUxgJqAVQCHwla7Z78xZL
SHuua4W/CbwypaiYTds2CPcvR4ZLRITnb026ZqI0AykJuJ7H5SJcVedvrPDFq1Ed
JHT4L9YfrTpgpAaxinv9rLtO5jJ/T7pdqhF3asNfOX3p9XUpJ9w=
=DWxF
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
