From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: ftdoverlay overwrites phandle
Date: Mon, 4 Jul 2022 22:04:50 +0200
Message-ID: <20220704200450.kd2oipq6lhnokabv@pengutronix.de>
References: <20220629205925.v56wxrvib33tgu65@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g2t4rekzzi6diupx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20220629205925.v56wxrvib33tgu65-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yves-Alexis Perez <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


--g2t4rekzzi6diupx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[Cc +=3D Maxime who seems to have done some overlay work in dtc]

On Wed, Jun 29, 2022 at 10:59:27PM +0200, Uwe Kleine-K=F6nig wrote:
> I want to apply an overlay to a device tree that is compiled without -@
> because that's how dtbs are shipped by the Debian kernel package.
> I'm using dtc 1.6.1-1 as provided by Debian.
>=20
> The machine dtb is bcm2836-rpi-2-b.dtb[1]. The source for the dtbo looks
> as follows:
>=20
> 	uwe@taurus:~/tmp$ cat dht11-overlay.dts=20
> 	/*
> 	 * Overlay for the DHT11/21/22 humidity/temperature sensor modules.
> 	 */
> 	/dts-v1/;
> 	/plugin/;
>=20
> 	/ {
> 		compatible =3D "brcm,bcm2708";
>=20
> 		fragment@0 {
> 			target-path =3D "/";
>=20
> 			__overlay__ {
> 				dht11: dht11@0 {
> 					compatible =3D "dht11";
> 					pinctrl-names =3D "default";
> 					pinctrl-0 =3D <&dht11_pins>;
> 					gpios =3D <&gpio 4 0>;
> 					status =3D "okay";
> 				};
> 			};
> 		};
>=20
> 		fragment@1 {
> 			target-path =3D "/soc/";
> 			__overlay__ {
> 				gpio: gpio@7e200000 {
> 					dht11_pins: dht11_pins {
> 						brcm,pins =3D <4>;
> 						brcm,function =3D <0>; // in
> 						brcm,pull =3D <0>; // off
> 					};
> 				};
> 			};
> 		};
>=20
> 		__overrides__ {
> 			gpiopin =3D <&dht11_pins>,"brcm,pins:0",
> 				<&dht11>,"gpios:4";
> 		};
> 	};
>=20
> which is more or less the overlay with the same name provided by the
> RaspberryPi Foundation[2].
>=20
> I can compile and apply the overlay just fine (well there are warnings,
> but ...):
>=20
> 	uwe@taurus:~/tmp$ dtc -I dts -O dtb dht11-overlay.dts > dht11-overlay.dt=
bo
> 	dht11-overlay.dts:14.19-20.6: Warning (unit_address_vs_reg): /fragment@0=
/__overlay__/dht11@0: node has a unit name, but no reg or ranges property
> 	dht11-overlay.dts:27.24-33.6: Warning (unit_address_vs_reg): /fragment@1=
/__overlay__/gpio@7e200000: node has a unit name, but no reg or ranges prop=
erty
> 	dht11-overlay.dts:14.19-20.6: Warning (gpios_property): /fragment@0/__ov=
erlay__/dht11@0: Missing property '#gpio-cells' in node /fragment@1/__overl=
ay__/gpio@7e200000 or bad phandle (referred from gpios[0])
> 	uwe@taurus:~/tmp$ fdtoverlay -i bcm2836-rpi-2-b.dtb -o bcm2836-rpi-2-b+d=
ht11.dtb dht11-overlay.dtbo
>=20
> However there is a problem: The original bcm2836-rpi-2-b.dtb has:
>=20
> 	uwe@taurus:~/tmp$ fdtdump bcm2836-rpi-2-b.dtb=20
> 	...
> 	        gpio@7e200000 {
> 	            ....
> 	            phandle =3D <0x00000006>;
> 	        ....
> 	        hdmi@7e902000 {
> 	            ...
> 	            hpd-gpios =3D <0x00000006 0x0000002e 0x00000001>;
> 	            ...
>=20
> the patched dtb has:
>=20
> 	...
> 	    dht11@0 {
> 	        phandle =3D <0x0000001d>;
> 	        status =3D "okay";
> 	        gpios =3D <0x0000001c 0x00000004 0x00000000>;
> 	        pinctrl-0 =3D <0x0000001b>;
> 	        pinctrl-names =3D "default";
> 	        compatible =3D "dht11";
> 	    };
> 	    ...
> 	        gpio@7e200000 {
> 	            phandle =3D <0x0000001c>;
> 	        ....
> 	        hdmi@7e902000 {
> 	            ...
> 	            hpd-gpios =3D <0x00000006 0x0000002e 0x00000001>;
> 	            ...
>=20
> So the gpios property of the dht11 node points to the gpio node as
> expected, however the hpd-gpios property of the hdmi node is broken
> because the phandle of gpio@7e200000 changed.
>=20
> I think it should be possible to not overwrite the phandle of
> gpio@7e200000 and just reuse the value 6.

I thought a bit more about that and with the given design of fdtoverlay
this is hard because there are two types of (local) references: One
where you just have to add $delta (which is the only case that is
currently supported) and the other where the already existing number
=66rom the dtb is reused.

An alternative would be to use a new node (say) __base_symbols__ that is
used to lookup symbols in the base dtb. E.g.:

	/ {
	    compatible =3D "brcm,bcm2708";
	    fragment@0 {
		target-path =3D "/";
		__overlay__ {
		    dht11 {
			compatible =3D "dht11";
			pinctrl-names =3D "default";
			pinctrl-0 =3D <0x00000001>;
			gpios =3D <0xffffffff 0x00000004 0x00000000>;
			status =3D "okay";
			phandle =3D <0x00000002>;
		    };
		};
	    };
	    __fixups__ {
		gpio =3D "/fragment@0/__overlay__/dht11:gpios:0";
	    };
	    __base_symbols__ {
	        gpio =3D "/soc/gpio@7e200000";
	    };
	};

then if the dtb that is supposed to be patched doesn't have gpio in its
__symbols__ node, this is looked up using __base_symbols__ in the dtbo.

Does this sound sensible? The downside compared to the first possibility
is that we have to extend the overlay device tree format.

A workaround I just noticed is: I could create two overlays and apply
them im a row. The first adds a __symbols__ node to the dtb and the
second uses the newly created node to properly fixup the local
reference.

What do you think?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--g2t4rekzzi6diupx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLDR98ACgkQwfwUeK3K
7AmO/Qf+IBMHheti3BeQGH4Mh2EWKo7fGpcwp4j2oDJpp3tdNMYgRHfQEx9laMkX
NqXfKEo8BW9G7TgRGL6tkJYX1YAb+g/dCfLk9yV0V584WYGRm2aPmWFQpfh/BNG/
aWHAQpCMcenB4JhmqYIQy8+IBntXubPHTEXV+QcjSeObgNh2S5tp7LWLLT4QMpw7
WDtYTZOn+x/aASPVBbh/Qhu8sjDAo4Bclk51dlW0DyJdqv9NBGQ+3EWJQvf9EBCL
TVKcFsxy/dEaODQQnqa5rmk/4dJsR/KNuoBSIg4lX8RCUZKVldYQCdWaMfam930M
H7E1TLbroT2Wf6PeJ3UNAela4SMT4g==
=oFpG
-----END PGP SIGNATURE-----

--g2t4rekzzi6diupx--
