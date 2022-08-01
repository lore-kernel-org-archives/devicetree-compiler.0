From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: ftdoverlay overwrites phandle
Date: Mon, 1 Aug 2022 14:22:37 +0200
Message-ID: <20220801122237.n2vaqncnl3h4dnsu@pengutronix.de>
References: <20220629205925.v56wxrvib33tgu65@pengutronix.de>
 <CAL_JsqJbU6vUhxRodTSFmPjPUAvw3-qcu=usdPp9Ym43CM+t9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z7lpodtrjuo5pwf7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJbU6vUhxRodTSFmPjPUAvw3-qcu=usdPp9Ym43CM+t9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yves-Alexis Perez <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Ahmad Fatoum <a.fatoum-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>


--z7lpodtrjuo5pwf7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Rob,

On Tue, Jul 12, 2022 at 09:53:57AM -0600, Rob Herring wrote:
> On Wed, Jun 29, 2022 at 3:20 PM Uwe Kleine-K=F6nig <ukleinek-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> =
wrote:
> >
> > Hello,
> >
> > I want to apply an overlay to a device tree that is compiled without -@
> > because that's how dtbs are shipped by the Debian kernel package.
>=20
> Does applying this overlay work as expected if -@ is used? I would
> imagine so as there is an assumption the base dtb was compiled with
> -@.

No it doesn't. I created a minimal (oh well, at least small) reproducer:

	uwe@taurus:~/gsrc/oftreemerge$ cat base.dts
	/dts-v1/;

	/ {
		#address-cells =3D <1>;
		#size-cells =3D <1>;

		node_a: a {
			prop =3D "blub";
		};

		node_b: b {
			a =3D <&node_a>;
		};
	};

	uwe@taurus:~/gsrc/oftreemerge$ cat overlay.dts
	/dts-v1/;
	/plugin/;

	/ {
		fragment@0 {
			target-path =3D "/";

			__overlay__ {
				node_a: a {
				};

				c {
					a =3D <&node_a>;
				};
			};
		};
	};

When compiling without -@ (as reported initially) I get:

	uwe@taurus:~/gsrc/oftreemerge$ dtc -I dts -O dtb -o base.dtb base.dts=20
	uwe@taurus:~/gsrc/oftreemerge$ dtc -I dts -O dtb -o overlay.dtbo overlay.d=
ts=20
	uwe@taurus:~/gsrc/oftreemerge$ fdtoverlay -i base.dtb -o patched.dtb overl=
ay.dtbo=20
	uwe@taurus:~/gsrc/oftreemerge$ fdtdump patched.dtb=20
	...
	/ {
	    #address-cells =3D <0x00000001>;
	    #size-cells =3D <0x00000001>;
	    c {
		a =3D <0x00000002>;
	    };
	    a {
		prop =3D "blub";
		phandle =3D <0x00000002>;
	    };
	    b {
		a =3D <0x00000001>;
	    };
	};

So b.a gets broken as the phandle for a got updated.

When doing the same with -@ the result is identical (apart from the
expected changes: more and different phandles, __symbols__ node etc):

	uwe@taurus:~/gsrc/oftreemerge$ dtc -@ -I dts -O dtb -o base.dtb base.dts
	uwe@taurus:~/gsrc/oftreemerge$ dtc -@ -I dts -O dtb -o overlay.dtbo overla=
y.dts
	uwe@taurus:~/gsrc/oftreemerge$ fdtoverlay -i base.dtb -o patched.dtb overl=
ay.dtbo
	uwe@taurus:~/gsrc/oftreemerge$ fdtdump patched.dtb
	...
	/ {
	    #address-cells =3D <0x00000001>;
	    #size-cells =3D <0x00000001>;
	    c {
		a =3D <0x00000003>;
	    };
	    a {
		prop =3D "blub";
		phandle =3D <0x00000003>;
	    };
	    b {
		a =3D <0x00000001>;
		phandle =3D <0x00000002>;
	    };
	    __symbols__ {
		node_a =3D "/a";
		node_b =3D "/b";
	    };
	};

b.a still points to a non-existing node.

> The fix is to fix Debian dtbs

One of the blockers for that is that adding -@ to the kernel default
rules was rejected more than once.
(https://lore.kernel.org/linux-arm-kernel/CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7p=
AGiFhcTtCRUAAjGLpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org/)

> (or don't use them as dtbs should come from firmware rather than
> distros).

In this case the distro provides the firmware, too. So well, you could
argue the dtbs should (in this case) be provided by the raspi-firmware
package and not the kernel image package, but that only makes things
harder to handle, because the kernel is effectively the upstream for the
device tree files.

> There might be sufficient information to make your case work because
> IIRC all the (resolved) overlay phandle values get adjusted when
> applied as they could collide with the base tree phandle values.
> However, doing so would mean users may start working around base DTs
> compiled without -@. That would remove labels being an ABI which I
> don't love, but it would also remove the abstraction that labels
> provide.

My point of view is a bit different. It would allow to practically apply
overlays to device trees without -@. It doesn't limit in any way the
semantic of labels in the case where -@ is used. I can accept we're
differing in that point and I don't think working on reaching an
agreement here is time spend well.

> Certainly, the base phandle value shouldn't just be silently overwritten.

We agree here, which is good enough for me.

Fixing that is a bit complicated, because currently fdtoverlay just
applies a fixed offset to the phandle values defined in the overlay. I
think it would need another pass over the device tree to determine
already existing phandles and maintaining a mapping for these.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--z7lpodtrjuo5pwf7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLnxYoACgkQwfwUeK3K
7Akh/Af/ZQ8I3/DYNqexKHYsHwEohIRnVFv9IsQHhh1t8SlhkbfZjNsGgkC53VkX
hkUFT02ZhY/Zxsgbs1YqLCGLznBugJveWADQxPl7G1FbSAEdmq3u0HMyYlw6prNj
K4SKLXmyM4uSlk9ECpfqx4XvFm4wc5Aqgf1Y53QdmFFuJbH//kLmoV4UooSC9EPl
4FTmBm3hCumNNJf+wzBkZnf6c8xNxOAkOrh7S77Sa3866+80P4DGegawAWB5kUEv
EZe2L9lDiIaCJD9i4SQqw03TRaQ6EDxkm1/a4vxNZlp6cm2+GO70K76WNtuFy7pO
0O920IAHe7KoFUSYwRvi0+hJar8Vcg==
=v2Qy
-----END PGP SIGNATURE-----

--z7lpodtrjuo5pwf7--
