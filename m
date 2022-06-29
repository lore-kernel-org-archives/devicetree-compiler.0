From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: ftdoverlay overwrites phandle
Date: Wed, 29 Jun 2022 22:59:25 +0200
Message-ID: <20220629205925.v56wxrvib33tgu65@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n5ouqxfhdtbu5i6q"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
         s=smtpauto.master; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From
        :Date:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
        In-Reply-To:References; bh=mQlW4NdZG9QZIt/YCyv9tByztUkMpRREYeRmxFW0TK0=; b=0E
        mEus+/gED9+d94nPX04K9Wrfr+N03uw0Jvi+roZ02AF4u7nYlEo6VjVPxiXUqpqSeHJTcmbnsZm8T
        Wk/Y5Zy1wYezOoMP8HoWSwG8obRwQmO7Ri2OP+VSPMY1QF/Pz923CjZrnIySb57QLY/Q3Qc6Yp5Ev
        VE3TSbD9huMBnkR+mqjNFmgYuicAOrAq6raS2WwySlkmJIXQuxezL1z10e/W5r9YaGPLxGyQ47AIZ
        MnuJIj0gWl2oi8pjUFSOTrVvXw1VKlDKFnGKxbThSk2ETmYkqkJC0zX6+vxO4xijvUE+kvMt/BWYD
        kOGKY9ouPNVcIr1H90AuOY+xQo6bKfAg==;
Content-Disposition: inline
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yves-Alexis Perez <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>


--n5ouqxfhdtbu5i6q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I want to apply an overlay to a device tree that is compiled without -@
because that's how dtbs are shipped by the Debian kernel package.
I'm using dtc 1.6.1-1 as provided by Debian.

The machine dtb is bcm2836-rpi-2-b.dtb[1]. The source for the dtbo looks
as follows:

	uwe@taurus:~/tmp$ cat dht11-overlay.dts=20
	/*
	 * Overlay for the DHT11/21/22 humidity/temperature sensor modules.
	 */
	/dts-v1/;
	/plugin/;

	/ {
		compatible =3D "brcm,bcm2708";

		fragment@0 {
			target-path =3D "/";

			__overlay__ {
				dht11: dht11@0 {
					compatible =3D "dht11";
					pinctrl-names =3D "default";
					pinctrl-0 =3D <&dht11_pins>;
					gpios =3D <&gpio 4 0>;
					status =3D "okay";
				};
			};
		};

		fragment@1 {
			target-path =3D "/soc/";
			__overlay__ {
				gpio: gpio@7e200000 {
					dht11_pins: dht11_pins {
						brcm,pins =3D <4>;
						brcm,function =3D <0>; // in
						brcm,pull =3D <0>; // off
					};
				};
			};
		};

		__overrides__ {
			gpiopin =3D <&dht11_pins>,"brcm,pins:0",
				<&dht11>,"gpios:4";
		};
	};

which is more or less the overlay with the same name provided by the
RaspberryPi Foundation[2].

I can compile and apply the overlay just fine (well there are warnings,
but ...):

	uwe@taurus:~/tmp$ dtc -I dts -O dtb dht11-overlay.dts > dht11-overlay.dtbo
	dht11-overlay.dts:14.19-20.6: Warning (unit_address_vs_reg): /fragment@0/_=
_overlay__/dht11@0: node has a unit name, but no reg or ranges property
	dht11-overlay.dts:27.24-33.6: Warning (unit_address_vs_reg): /fragment@1/_=
_overlay__/gpio@7e200000: node has a unit name, but no reg or ranges proper=
ty
	dht11-overlay.dts:14.19-20.6: Warning (gpios_property): /fragment@0/__over=
lay__/dht11@0: Missing property '#gpio-cells' in node /fragment@1/__overlay=
__/gpio@7e200000 or bad phandle (referred from gpios[0])
	uwe@taurus:~/tmp$ fdtoverlay -i bcm2836-rpi-2-b.dtb -o bcm2836-rpi-2-b+dht=
11.dtb dht11-overlay.dtbo

However there is a problem: The original bcm2836-rpi-2-b.dtb has:

	uwe@taurus:~/tmp$ fdtdump bcm2836-rpi-2-b.dtb=20
	...
	        gpio@7e200000 {
	            ....
	            phandle =3D <0x00000006>;
	        ....
	        hdmi@7e902000 {
	            ...
	            hpd-gpios =3D <0x00000006 0x0000002e 0x00000001>;
	            ...

the patched dtb has:

	...
	    dht11@0 {
	        phandle =3D <0x0000001d>;
	        status =3D "okay";
	        gpios =3D <0x0000001c 0x00000004 0x00000000>;
	        pinctrl-0 =3D <0x0000001b>;
	        pinctrl-names =3D "default";
	        compatible =3D "dht11";
	    };
	    ...
	        gpio@7e200000 {
	            phandle =3D <0x0000001c>;
	        ....
	        hdmi@7e902000 {
	            ...
	            hpd-gpios =3D <0x00000006 0x0000002e 0x00000001>;
	            ...

So the gpios property of the dht11 node points to the gpio node as
expected, however the hpd-gpios property of the hdmi node is broken
because the phandle of gpio@7e200000 changed.

I think it should be possible to not overwrite the phandle of
gpio@7e200000 and just reuse the value 6.

Is this a bug, or did I miss a feature that allows me to create a dtbo
that does the right thing?

@Corsac: Maybe it's worth to test if the rpi firmware does a better job
at applying the dtbo? If you test this, please report here.

Best regards
Uwe

[1] https://www.kleine-koenig.org/tmp/bcm2836-rpi-2-b.dtb
[2] https://raw.githubusercontent.com/raspberrypi/linux/5cc390759ed0461bd35=
744e817470869e99e0484/arch/arm/boot/dts/overlays/dht11-overlay.dts

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--n5ouqxfhdtbu5i6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmK8vSoACgkQwfwUeK3K
7AmJbAf+IL40P/Mduom/jUWX6UYjXMW4tmR5jbnxHGTGusucV+askmGBjjW1oeYb
g4Pj5Ev9kJZya/10pcl+DwndQNp4NVPHFmZlcnjKIelirfk3irvoQ+vuAQFKpNGU
D05PdE2M3VOMN6tNawREnAY//7Uq56c1MIYB1yg9RDk4gOiiJc4SOSyKVOUfaR7L
7RYVOVWFLkQlZBmVR3eGOmqkqCLs9KDgwuj2lEyPzQyBGtR88RQCWBDolotVJYG8
ksFvmf2LgPAI1FAwVoXZXJixPwUz9am2PaBeMDaXt9XVyzHtLA9ME1rFdvEFI1j9
EJG+pbu5T55mtilA7lh3DJRm6kw6Yg==
=9FqX
-----END PGP SIGNATURE-----

--n5ouqxfhdtbu5i6q--
