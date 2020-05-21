From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH] checks: Remove warning for I2C_OWN_SLAVE_ADDRESS
Date: Thu, 21 May 2020 16:50:09 +1000
Message-ID: <20200521165009.5668082b@canb.auug.org.au>
References: <20200520075134.1048589-1-joel@jms.id.au>
        <20200521050914.GE63349@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wx.MCIDYTKZLFG860KZj2FX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590043810;
        bh=zaKes4jHPAxeMHmWwsNgbs7OSdZq2M8L2q6GzbW4xOQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=feJiehshZMSVePeJ3dpevLoZqYD8b2EuYmGjbglznWMhztX1RZ6KBxnCrdXOedOn3
         iFu7H1YEFul7jm8Vqwaw4hf9l7HAzgphBDfM1OH/rBKqy9qZ1XZ2UFbLydMSh+MFb1
         A6+eUnoeGM3ciAolbrxvvTb/lJV2Q7F6nc93VxSa9S1s1D0nBz41vqb27Vo3o/MP3o
         E+TokP3Y/a+r06VFN1U9LMeMlcZr9DyF6IoqXm2EdK6GfM+ZvJALYchK1ho6FWGCoz
         bkveIL7jO4yVHKE6MvpeRry2eMlIgGAdzEvNe96b4mBTK1cf5Q44VvSpygaT2jQPMX
         ubeg0zPdLTK6Q==
In-Reply-To: <20200521050914.GE63349-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

--Sig_/wx.MCIDYTKZLFG860KZj2FX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, 21 May 2020 15:09:14 +1000 David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6iEOx6SR5NKn@public.gmane.org=
u> wrote:
>
> On Wed, May 20, 2020 at 05:21:34PM +0930, Joel Stanley wrote:
> > dtc does a sanity check on reg properties that they are within the 10
> > bit address range for i2c slave addresses. In the case of multi-master
> > buses the binding may describe an address that the bus will listen on as
> > a device. Do not warn when this flag is set.
> >=20
> > This fixes the following build warnings reported by Stephen:
> >=20
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:126.11-130.4:
> >   Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:
> >     I2C bus unit address format error, expected "40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:128.3-30:
> >   Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:reg:
> >     I2C address must be less than 10-bits, got "0x40000010"
> >=20
> > Reported-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
> > Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> =20
>=20
> Any document you can give a pointer two explaining the special meaning
> of this bit?
include/dt-bindings/i2c/i2c.h
Is Documentation/devicetree/bindings/i2c/i2c.txt in the kernel tree
sufficient? I2C_OWN_SLAVE_ADDRESS has been in there since the file was
introduced in August 2015.  The actual value has been in
include/dt-bindings/i2c/i2c.h since the same time.

--=20
Cheers,
Stephen Rothwell

--Sig_/wx.MCIDYTKZLFG860KZj2FX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7GJKEACgkQAVBC80lX
0GyGQQf/RyghZnzjcqpSLp+UmrtVn88geaFVytvpR7ImsotkWKsx1UaU/6vXDBKu
SaqIhBGVgRfUfxuWkywGoKDl8mKkQLTaxInO3EVJ04uHMhjJZeZKYiqzUo4+Pk24
SjvlVzHb1hLT3vUABidh1l70zI3nyT38FwjrRwKUg6+1I1Y6m4IVchmEDi+O0hME
fKc8I1VSkH+dLGGV6hdw5SJm7janluS6iu7aC8sbdLHlidauADZRTq7x4LKguVTr
0YAPqscwkcaluID9TYLs9RYfBflxsfsJi1FFjVT8wImGbYtQ690rbKcfZS162EO8
dfWs0y+xE8YPKfTvKXTRE5Y3Yxw5DA==
=xaYp
-----END PGP SIGNATURE-----

--Sig_/wx.MCIDYTKZLFG860KZj2FX--
