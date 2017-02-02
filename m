From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: DTB file appears to have corrupted node property according to
 fdtdump and kernel?
Date: Fri, 3 Feb 2017 09:56:02 +1100
Message-ID: <20170202225602.GB7754@umbus.fritz.box>
References: <CAPBAm7QSB_-LrAwouztLYLaC0mWF2V4QQ_Yz98p6jVw07SfT6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486076746;
        bh=zUjOZOkJqsLRF2p9bq49b+JlEtNk0Keez4foz+RdTUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E1N9bJPwWST0j/a/CZDMYhQOrzYghnpYrfVvcFn86ohRVVoeX0AifKNsvVoYjDoyz
         Dv/G2Naot9b8Ll+vszKIl6aGRuJcSTQO4ue365EZRkCyzpbOKj0FUfPaaVOg/zVjW7
         EVi1sc6Vi3v3OkQy/Lx0UB8EqPPgqvB0egjnKpPA=
Content-Disposition: inline
In-Reply-To: <CAPBAm7QSB_-LrAwouztLYLaC0mWF2V4QQ_Yz98p6jVw07SfT6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frederik Lotter <frederik.lotter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2017 at 07:53:11PM +0200, Frederik Lotter wrote:
> Hi,
>=20
> I have a particular device tree node property which refuses to reach
> the Linux kernel without corruption:
>=20
>  interrupts =3D <0xc 0x1>;
>=20
> >From the extract below from the preprocessed file:
>=20
>    i2c1: i2c@f0018000 {
>     compatible =3D "atmel,at91sam9x5-i2c";
>     reg =3D <0xf0018000 0x4000>;
>     interrupts =3D <0x13 0x4 0x6>;
>     dmas =3D <0x2 0x2 0x9 0x2 0x2 0xa>;
>     dma-names =3D "tx", "rx";
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <0x12>;
>     #address-cells =3D <0x1>;
>     #size-cells =3D <0x0>;
>     clocks =3D <0x13>;
>     status =3D "okay";
>     clock-frequency =3D <0x61a80>;
>     atmel,recover-scl =3D <0x14 0x1b 0x0>;
>     atmel,recover-sda =3D <0x14 0x1a 0x0>;
>=20
>     lsm6ds3@6b {
>      compatible =3D "st,lsm6ds3";
>      reg =3D <0x6b>;
>      pinctrl-names =3D "default";
>      pinctrl-0 =3D <0x15>;
>      interrupt-parent =3D <0x16>;
>      interrupts =3D <0xc 0x1>;
>      interrupt-names =3D "lsm6ds_int1";
>      st,drdy-int-pin =3D <0x1>;
>     };
>    };
>=20
> Version: DTC 1.4.0 (ubuntu package) for manual testing.
>=20
> (1)  fdtdump mix6000.dtb | grep interrupts
>=20
> Thsi returns the interrupt line as:
>=20
> interrupts =3D <0x0000000c 0x000001d0>;
>=20
> (2) In the linux kernel the of_platform_populate() reads the same propert=
y as:
>=20
> 0x0000000c 0x00000000 with lenth=3D8
>=20
> (3) If I take the DTS file and manually compile the DTB with the dtc
> compiler, and convert it back to the DTS the correct values are shown
>=20
> (4) If I change the interrupt value:
>=20
> interrupts =3D <0xc 0x0>;
>=20
> and I do:
>=20
> cat <file-old.dtb> | od -t x1 > file1.txt
> cat <file-mod.dtb> | od -t x1 > file2.txt
> kdiff3 file1.txt file2.txt
>=20
> I actually see a single hex byte change from 0x1 to 0x0.
>=20
> If it was not for the faulty fdtdump output (in conjuection with the
> Linux kernel zero at the same place) I would have said its definately
> a kernel issue.
>=20
> Any ideas?

Well that's certainly weird.  Is it possible for you to attach the
whole dts and dtb so I can experiment?

What output does decompiling with dtc -I dtb -O dts give you?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYk7kAAAoJEGw4ysog2bOSwsUQAMFW1KZFn77eqoMg4JOnR4Jy
8RcmBjrghvLFRp7EeSivVyjo8EdOLsSXAxXgTVnd/Uvmp73FInssykk8HBJziphU
F5DZ4js3t+07irBzsZE69Azk9SHrVxCh0kzRVzm2RBItnB/0gGPoCx1HWJy/wySV
d621BwvCmu3k/m3O+iGy91VhoIYPLoQ7vkr3LBuzlek5+QKOJX1sJHClxDUpOWh7
kUtUbWAWb24KiPFyvBnFqnGvbkMWHNiUCxS4MNGQKYk4/OWZOYCr73h0AFQShjvh
l+/RwDKOdpwGm/pJoe/ElE2dB5L6tCnFydtIhE3beuOXfyT02KYOTXbNOT0nR8Ol
nXdgbH8NvvlULsIIBFA03j1tAegyAWiPwx0cfM4vzvSp5TzTI9Cs1qgH46SrNX6u
xPI7Iq5XvnDO0f7pfhq4zKAUefIIfWA0bykcSWUid+GpmcH/PgEamvnjlnqZcLgc
Zw3bCkFtYwg5NmUbYhc78ysxjMUMSIIT/IB7neFP8nEEoCpBPpywu7UHMl+0+P1c
BfBqMlev79YAWZHYUqawWb5Hd2YxI2O+vgSxY3wEnLHXp73lpRh8REw8h9VHucXC
WwX4uf6ap4CUNp7AgoXhtthuIS06Of+JOw2ozSkvoHZ7R56Y9MvOLBwhjqysc3QL
si1RxVt1YrTGe6cqQU8U
=tAwb
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
