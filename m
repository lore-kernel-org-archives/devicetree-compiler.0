From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] checks: Remove warning for I2C_OWN_SLAVE_ADDRESS
Date: Fri, 22 May 2020 17:48:15 +1000
Message-ID: <20200522074815.GA395888@umbus.fritz.box>
References: <20200520075134.1048589-1-joel@jms.id.au>
 <20200521050914.GE63349@umbus.fritz.box>
 <20200521165009.5668082b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1590133714;
        bh=IJhi0rXQP6IccjJ2EkDM5ut/5qwj5VKRqFlMp1275/M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nkeHS7QqBOQ99cp1mS9v13yFB5Ammxy2HbXymbnNRxvyK/ROcfHp8c5KMFd4GAwmW
         VpckiamzcPFh9N9kgiCNrgCV8W9kOGdSPaA2B1W37poVNsZCavKSfx94uDTPpGubMu
         +4EdjFbWwYWXUKK8F/GNtiJU2HYgGQjWxxqzdnpg=
Content-Disposition: inline
In-Reply-To: <20200521165009.5668082b-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2020 at 04:50:09PM +1000, Stephen Rothwell wrote:
> Hi David,
>=20
> On Thu, 21 May 2020 15:09:14 +1000 David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6ryscVyMRj84@public.gmane.org=
=2Eau> wrote:
> >
> > On Wed, May 20, 2020 at 05:21:34PM +0930, Joel Stanley wrote:
> > > dtc does a sanity check on reg properties that they are within the 10
> > > bit address range for i2c slave addresses. In the case of multi-master
> > > buses the binding may describe an address that the bus will listen on=
 as
> > > a device. Do not warn when this flag is set.
> > >=20
> > > This fixes the following build warnings reported by Stephen:
> > >=20
> > > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:126.11-130.4:
> > >   Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:
> > >     I2C bus unit address format error, expected "40000010"
> > > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:128.3-30:
> > >   Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:re=
g:
> > >     I2C address must be less than 10-bits, got "0x40000010"
> > >=20
> > > Reported-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
> > > Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> =20
> >=20
> > Any document you can give a pointer two explaining the special meaning
> > of this bit?
> include/dt-bindings/i2c/i2c.h
> Is Documentation/devicetree/bindings/i2c/i2c.txt in the kernel tree
> sufficient?

Good enough.

> I2C_OWN_SLAVE_ADDRESS has been in there since the file was
> introduced in August 2015.  The actual value has been in
> include/dt-bindings/i2c/i2c.h since the same time.

Looking at that, though, it seems like we should also ignore the
I2C_TEN_BIT_ADDRESS flag.  Or better yet, not ignore it but validate
the base addres is under 7 bits unless its set.

Can we refine that a bit, and fix the spelling errors?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7Hg70ACgkQbDjKyiDZ
s5JrHg//ZIwxbviN1BBpji5wnSzIaeg961OD6FGQ+p/n/D2jGG+2qeD1hpqSUIMY
1cUBi4Cs5tw1aFB+Y8S+gFuj2efwSeQ5XTWvLyfyEtUbn+kj4wahObpq68HxOE4Z
6oi2HajeSELMnsjyjGRrWxzeitxoVj2ud0Rr90x9P/k3SI5RnwzGljoKAJtronRH
9NxZESfq1vDEYU87ZAnsKfBFTsk2L+pg8OOJ4kjSbM3ictVuFaC5TlT2ixO2j2BJ
r6jAwyJqwyI0NY8qXNLZ45TbUB7+w663K4Xlw2Bg4MKYnpQFZck6G+wbE0CQw2gW
oQTrFSKM2tpFxxavwKZpStbudPap2xKQ4Hbrz7zOgv8Qf+Y0wSRMwItd9nSb99NF
zr/GcyZsUvex3zvPEgHi0v1fPBQAnvNB+rmo/oSNCXVc0iOeFvZ/59DLz722ibUZ
gtXhHF+msFZwELFb0qteJbJt6xWujgWkpVdRrhHpNmh43oZd2oCz06XpTTMpBfo5
asHN1qgBAdxKlDjqzpjrttfquwgkIyvo7Mlk/HkPdsFI6XgVQTaS1Qw6TeJhu1Ss
eOXCUDakA+3dXfRv1CtnSdIF+McHN7O7JZ9UPBWHtc+/RnTMBj/pmyMpo75kBTC/
aPc0RtEDxdR7AMnD6cubLrHO/x4FsprJt/v1EreI7gaMGXAtI7w=
=FVvX
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
