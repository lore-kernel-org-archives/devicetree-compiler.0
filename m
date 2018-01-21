From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: DTC v1.4.6 released
Date: Mon, 22 Jan 2018 10:44:27 +1100
Message-ID: <20180121234427.GA11419@umbus>
References: <87k1wauaxd.fsf@aikidev.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516578272;
        bh=d/TSfTXiqMPDd5c3SLNNlrFnVpGQAwPLHwQDesO5rrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NjFROKWx8lXFkb5rXZ7wCfYneii8zXFGMwvQZHmpIbzHg9tTk3NWvOh+5urM6hDe5
         RQHEo0MsA3oU4KEkmzei1cGFWdocgcgvhRwGGveOwRYdSnMHzwkA3boCwR9Vp4+RSu
         NwJhh/DFN9d1aJDeQ2h+nAmibZpKcT99ux2alsjE=
Content-Disposition: inline
In-Reply-To: <87k1wauaxd.fsf-LkDtOWtB3X7R7s880joybQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 21, 2018 at 02:03:26PM -0800, Vagrant Cascadian wrote:
> On 2018-01-04, David Gibson wrote:
> > Hi everyone.  There have been a number of useful bugfixes added to the
> > dtc tree since v1.4.5, so I decided to tag another release.
>=20
> Thanks for all the work on dtc!
>=20
>=20
> > The signed tag is in the master git tree at:
> >
> >     git://git.kernel.org/pub/scm/utils/dtc/dtc.git
>=20
> I'm not seeing a signed tag for v1.4.6, and it doesn't appear in the web
> interface either:
>=20
>   https://git.kernel.org/pub/scm/utils/dtc/dtc.git/refs/tags

Oops, I forgot to push the tag up to the main repo.  Should be fixed
now.

> > Or you can download tarballs from:
> >
> >     https://www.kernel.org/pub/software/utils/dtc/
>=20
> Fortunately, commit:e54388015af1fb4bf04d0bca99caba1074d9cc42 appears to
> be consistent with the contents of the 1.4.6 tarballs.
>=20
>=20
> On a related note, I was wondering if it would be possible to have the
> compressed tarballs have their own signature:
>=20
>   https://www.kernel.org/pub/software/utils/dtc/dtc-1.4.6.tar.sign
>=20
> Only validates against the uncompressed tarball, which makes
> verification of the signature a bit more complicated, having to
> decompresss the tarball before verification.

So, that's not under my control AFAIK - it's handed by the kup scripts
that I use to upload blobs.  It handles the compression for me.

> It also means I can not include the signature file in the Debian
> archive, as the signature needs to verify against the compressed tarball
> in the Debian archive. For this reason especially, it would be nice to
> have dtc-X.Y.Z.tar.xz.sign available as well.
>=20
> Thanks for considering!
>=20
> Please CC me in replies; I'm not subscribed to the list.
>=20
> live well,
>   vagrant



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlplJdgACgkQbDjKyiDZ
s5KfcBAAowZYrDukDALKKAUVwnr9kvm0I0Rd4Zv5/+6Th80bHEkD36XNCVeyXoe0
Vo10BV+EyNGWGOc3EHhXV+G/UCPFRLq0tz1eRdxqUSVwJ4PWHv1KNsGM8uqQrmsE
ovhOsylf14sNEdvsEofvZIbiUrjvzfho3FalHI0JFk+COsQ+71QPSyonuhRAkAlX
H3SdACAS2juQ2MIzWpNvOtg0yKzrAINg9NRkPVCeARTb/78zxGhChHpglHlbDF8u
cdP/XZY4TotW00wk4WTbZiR1ZBKWkwpPzk8pQloWfaXRBg96dJI8BxJySiCtIwIP
dE9SMp5ftXs0+Z7X+knic5JbZjlE5Nh89xM0AMsvV9V91/uGbRv/911E7p0pV4qV
prbn/UWQyRjDEJIklnkuf/ppZdLrnhP3v+xSjMtUrykmqhhXIzSdsQ7+Lopr+wWL
Pqw1NF2uTr2rcq+H9yQkk4QRbWdVVSE6PsDV177dliPrcVQIf1cB4xTuZvAEj39N
pGADeWMcbP+5oyjSSVm+B7Q+Zo0gUrbY29/jdW6iV8W538p2LQG7SzPXwSgEQ1iG
U2EdDwMCmLkKVuXf8cH7YF4A1ZrtsZxWe57G8gnHWDgeyLFGOPli5Bg2fDWNWhHQ
qLlhV5Iz0n6ImsgIu32nQmvr1bgiZW9X4TCBZ4TuwNIyvDwcw5g=
=Nt5J
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
