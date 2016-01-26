From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Fwd: [robh:dt/next 2/2] fdt_ro.c:undefined reference to `strnlen'
Date: Wed, 27 Jan 2016 09:38:05 +1100
Message-ID: <20160126223805.GE16692@voom.fritz.box>
References: <201601270337.wm7hjDwR%fengguang.wu@intel.com>
 <CAL_JsqJ2C=OQa5ntYH3MLQ87+=ELHAtgFpg5QNQpQ0-RgzQeiw@mail.gmail.com>
 <alpine.LFD.2.20.1601261636510.19789@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mR8QP4gmHujQHb1c"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1601261636510.19789-fMhRO7WWcppj+hNMo8g0rg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--mR8QP4gmHujQHb1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2016 at 04:52:18PM -0500, Nicolas Pitre wrote:
> On Tue, 26 Jan 2016, Rob Herring wrote:
>=20
> > With the latest dtc I've imported to the kernel, there is a new
> > dependency on strnlen. This is giving the ARM decompressor an error. I
> > have a couple of ideas on how to fix it:
> >=20
> > - Move string related functions in dtc to separate file
> > - Add lib/string.c to the decompressor build
> > - Build the decompressor with function-sections to discard the string
> > related functions and avoid the linker error. Also, there's probably a
> > bit of other unused code that would get dropped. function-sections
> > doesn't work for the kernel in general, but may for the decompressor.
> > Nico may know.
>=20
> Use of function-sections turns out to be more involved than I wish. And=
=20
> we've put many special restrictions on the decompressor already. And=20
> linking dtc (only part of it actually) into the decompressor is only for=
=20
> legacy stuff and I'd prefer we don't spend too much time on legacy=20
> stuff.  Yadda yadda.
>=20
> So instead I'd simply paste a simple implementation of strnlen into=20
> arch/arm/boot/compressed/string.c and be done with it.  The one in=20
> lib/string.c looks dead simple for what it's worth.

I think that would be my preferred option too.

>=20
> > - Don't update dtc and take the rest of the day off.
>=20
> That is always an option.  Does it really need to be updated?  ;-)
>=20
>=20
> Nicolas

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mR8QP4gmHujQHb1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWp/VNAAoJEGw4ysog2bOSm5AP/0JR7/OaPAXp1m7u81l8dpYd
rl4mutCR6o4jtyHIbaXv0H45vJFC3WEw7cpAlDCp+4rTkTQ7wzlanXYGL5rMQDXt
2mTQwfZtvq4CZUcdHEWLIqrJa85TKuKjUEzy3abbX+xw1hNDS7N5IAeFJfMnGj4W
Rwve/5qbty3LTtP6KiBma+3ngMLN7mVCkiXrdlzScehwN3EezolEuNW8RVUFXTdC
A1YjG0sL1TMV4UdvJ+raSjBbUw4XBwl9xTEaotGFLxSGTMWzjJVpkgteMaBw9eBY
W8TVHAjsGMVJkawbe0SF3fW5rwx+ZpWRwUjtTK7U7WsXs3Vir1ycVRG2ABisWiaH
QJFmu7g/pH96GPTXYWWZXrjvyCftXii+3UZvs74asRGn8xaBFf/n+nwjQAeE1Hiz
1tWeDtq7yYlq18+qWIzk+VdifxOUSUV6wCDO6DnMkxbWQMPTkfON564+as4NbLCM
6cwBJ4YCV0pvSpTKq2cyw8NrrhUOGuthwAYNSWBIYvg/rX/o21nVdcV0fGQ5mpyP
pZe2dyirIMYxStlA5YwCubpd+66q+Y/cN2TZ0F/2UCnDV5mFP6V+1iRqidQmW/8U
pJ/nGxUIwUeGP7hDKvk7/WCIkSvvlqaHyoVJ32OAOPT2PeaKQe6c7eS5p0ipGkOY
VvyL81W5QVPPuWH9IEAA
=pf64
-----END PGP SIGNATURE-----

--mR8QP4gmHujQHb1c--
