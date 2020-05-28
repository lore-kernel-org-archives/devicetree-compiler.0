From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2 2/2] checks: Improve i2c reg property checking
Date: Thu, 28 May 2020 18:31:15 +1000
Message-ID: <20200528183115.05b2519a@canb.auug.org.au>
References: <20200528072037.1402346-1-joel@jms.id.au>
        <20200528072037.1402346-3-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B8RJ8yx8LlQ3KMb_xSLNXNQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590654678;
        bh=TcuCLidhBGrqpz8f7Da8lwxBBe2IKefCUZaDVklYjzI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kBEm+Lar6Bl/Z6Qt/i+uKgN9/IbMKnOmLm5z1NixPDFdj4opJO/LcirQIPQqiaVFP
         kOhC9Hns2QHxvWVAB6BO/pTqUmbuOWfudtHfEBr09kmBCYD3ZVA3i1bkubKbn8wrKx
         zXmoNKXKUqvWDpE5PKX4NBS85UetwOmCEDNZHC3JRx2cf9i9pdmgkwfMyPbYTzWYc9
         fqgqHJLQPWL4Hj0iQ3ZNsEeGGNcBVAYWAG1p3OHx+8QnLEzlekEXyWsGDEtWzp9Bco
         wvGiWPVwRT3cGk/35tCT/jGXaYp4KOfiaZyJUTBRKQaoTQW3a7/BgQf4Q53ZTdc52i
         x499tyFYoFneg==
In-Reply-To: <20200528072037.1402346-3-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: devicetree-compiler@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

--Sig_/B8RJ8yx8LlQ3KMb_xSLNXNQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joel,

On Thu, 28 May 2020 16:50:37 +0930 Joel Stanley <joel@jms.id.au> wrote:
>
> =20
>  #define I2C_OWN_SLAVE_ADDRESS	(1 << 30)
> +#define I2C_TEN_BIT_ADDRESS	(1 << 31)
> =20
>  static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, stru=
ct node *node)
>  {
> @@ -1057,10 +1058,13 @@ static void check_i2c_bus_reg(struct check *c, st=
ruct dt_info *dti, struct node
>  		reg =3D fdt32_to_cpu(*(cells++));
>  		/* Ignore I2C_OWN_SLAVE_ADDRESS */
>  		reg &=3D ~I2C_OWN_SLAVE_ADDRESS;
> -		if (reg > 0x3ff)
> +
> +		if ((reg & I2C_TEN_BIT_ADDRESS) && reg > 0x3ff)

Shouldn't this be

		if ((reg & I2C_TEN_BIT_ADDRESS) && ((reg & ~I2C_TEN_BIT_ADDRESS) > 0x3ff))

--=20
Cheers,
Stephen Rothwell

--Sig_/B8RJ8yx8LlQ3KMb_xSLNXNQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7PdtQACgkQAVBC80lX
0GyV8Af9F1S4vT1OP+5Ba9ZY+iXYNXYFe8vwj3rPqVNTfFjtinquTwP6Z+NhWyfP
rsRE/HeOAqyD1Pjt6KNrg+guz2GRFZ69DMMeKwidf9KNVxQbf1IHr0TP9Dhk9kiI
fbTYi5mpE/DNgfOC4HQa04kryp9Jrz/e1xNxNyi2NKQtU+h7K4AaFoayonUBxuXt
4FqIxa7i3QuRYyBuwmM+mIOf06RJJSGz18f/gLGO6Db3xQNqEY0jaEoC7c7p1Hyn
SO2DcIZpv411HXmgpCip6e8u4Lv/lCZf12mPX9t8pDkoppZuxVnl5/bmDYDMgtks
Y24XQYMY50Q5d1QG7ifIETNVwWc+Og==
=qhJ5
-----END PGP SIGNATURE-----

--Sig_/B8RJ8yx8LlQ3KMb_xSLNXNQ--
