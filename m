From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] checks: Remove warning for I2C_OWN_SLAVE_ADDRESS
Date: Thu, 21 May 2020 15:09:14 +1000
Message-ID: <20200521050914.GE63349@umbus.fritz.box>
References: <20200520075134.1048589-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WK3l2KTTmXPVedZ6"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1590037763;
        bh=QLPsRk3HGk4ebkOOP4gxssMhSvEkH0QQCdl7nN4rgVw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jvn03Df09cPmL1+PbC86AtQsuDZyALyfCrwus5xMCpqO2r29veVAvLi5Z57gQEsk5
         EdcdAnbPzm4/GjAjiavHF6dQadLPFn2YgIhpwXhdwOpxk0mFXkmfgK0Ph5OzWnLnqR
         knTrGXUma1/Q05guu6Kfiw6UygJTPQ8Tv8Olen2o=
Content-Disposition: inline
In-Reply-To: <20200520075134.1048589-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>


--WK3l2KTTmXPVedZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 05:21:34PM +0930, Joel Stanley wrote:
> dtc does a sanity check on reg properties that they are within the 10
> bit address range for i2c slave addresses. In the case of multi-master
> buses the binding may describe an address that the bus will listen on as
> a device. Do not warn when this flag is set.
>=20
> This fixes the following build warnings reported by Stephen:
>=20
> arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:126.11-130.4:
>   Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:
>     I2C bus unit address format error, expected "40000010"
> arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:128.3-30:
>   Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:reg:
>     I2C address must be less than 10-bits, got "0x40000010"
>=20
> Reported-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

Any document you can give a pointer two explaining the special meaning
of this bit?

> ---
>  checks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index a8213c0e13a8..2c23dd4f7778 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1022,6 +1022,8 @@ static void check_i2c_bus_bridge(struct check *c, s=
truct dt_info *dti, struct no
>  }
>  WARNING(i2c_bus_bridge, check_i2c_bus_bridge, NULL, &addr_size_cells);
> =20
> +#define I2C_OWN_SLAVE_ADDRESS	(1 << 30)
> +
>  static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, stru=
ct node *node)
>  {
>  	struct property *prop;
> @@ -1044,6 +1046,8 @@ static void check_i2c_bus_reg(struct check *c, stru=
ct dt_info *dti, struct node
>  	}
> =20
>  	reg =3D fdt32_to_cpu(*cells);
> +	/* Ingore I2C_OWN_SLAVE_ADDRESS */

Also, s/Ingore/Ignore/g

> +	reg &=3D ~I2C_OWN_SLAVE_ADDRESS;
>  	snprintf(unit_addr, sizeof(unit_addr), "%x", reg);
>  	if (!streq(unitname, unit_addr))
>  		FAIL(c, dti, node, "I2C bus unit address format error, expected \"%s\"=
",
> @@ -1051,6 +1055,8 @@ static void check_i2c_bus_reg(struct check *c, stru=
ct dt_info *dti, struct node
> =20
>  	for (len =3D prop->val.len; len > 0; len -=3D 4) {
>  		reg =3D fdt32_to_cpu(*(cells++));
> +		/* Ingore I2C_OWN_SLAVE_ADDRESS */
> +		reg &=3D ~I2C_OWN_SLAVE_ADDRESS;
>  		if (reg > 0x3ff)
>  			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 10-bits,=
 got \"0x%x\"",
>  				  reg);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WK3l2KTTmXPVedZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7GDPgACgkQbDjKyiDZ
s5IXlBAAtiy2jjFSBhNADRtwsTkbXOwI/pFl1G43LSwJrQrG9c1R+YO+nr70M/pi
XHEAS0CaSq9KIwylESQYX0Pwv8UgY8a8IrCmlGy/o/1BQF7zXlsbw8BBy5Gsv91C
60FpZO1FkKSRMYC/1+hqKZgGOO35WDF3VnqflyfCF6kluux5QRgASDM8W8s6Qdoq
6kN+g7f0WHVH+j4yXGfvS56wwfM247QH+gMjApOm2FDWmImqeIJC8TL7jIqibHmQ
hSWK8xEUDA6hYB9tj9uXuBFs3b0vrvfS6i3Wq26h0EmlQMBW6taZgknuSbK0rYcA
r91K2w3zJ9NCwDmZcwbIEb2d/2360akaLFbnKRGw86JRJF1WtZ2cP5xSW5UF77ks
X05sLcubx5DG4ir7+Dzac4zDkULrLH0POXETofDWLwKpBEghwyL96sVeH4Tx3pEW
zJGuDHxQMVA4KD6BEJpEWuvmBEZ9hgC6k84df7ue9VngWJhnplTv1sRs3AM44KVJ
8MazUn/60hUHs2+Edj6+02QCdJPcNxyOuf1XhmmKCEsMsFe0S6DHgEz+l2Anhsns
zAAi8kHwAQh6XJwRK6SZId2EzmnRsIAL3g1X7OhXDSYvGGKJMMUG2rLBy2UAKdJ3
XOmhV1oKBTwTuzOcGpaIpfyPrixMDSTnvrwGgjuOrUUTYQmgkJQ=
=8z1d
-----END PGP SIGNATURE-----

--WK3l2KTTmXPVedZ6--
