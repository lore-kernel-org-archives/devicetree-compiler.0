From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 00/12] cmd: fdt: Add device tree overlays support
Date: Mon, 27 Jun 2016 08:29:12 +0200
Message-ID: <20160627062912.GM4000@lukather>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160626153719.GP15625@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JvUS8mwutKMHKosv"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160626153719.GP15625-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--JvUS8mwutKMHKosv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Jun 27, 2016 at 01:37:19AM +1000, David Gibson wrote:
> On Fri, Jun 24, 2016 at 04:27:45PM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > The device tree overlays are a great solution to the issue raised by
> > the bunch expandable boards we find everywhere these days, like the
> > Beaglebone, Raspberry Pi or CHIP.
> >=20
> > However, most of the time, the overlays are applied through a
> > mechanism involving the firmware request interface in Linux, that is
> > only fully functional once the userspace has been mounted and is
> > running.
> >=20
> > Some expansion boards might need to be enabled before that, because
> > they simply need to patch the DT early on, or need to be initialized
> > early in order to be fully functional, or because they provide access
> > to the root filesystem.
> >=20
> > In these cases, having the bootloader applying the overlay before
> > Linux starts seems like the easiest solution.
> >=20
> > This implementation doesn't provide all the Linux fancyness though,
> > there's no transactional application, which means that if the overlay
> > cannot be applied for a reason while you're still halfway through the
> > application, you're probably screwed. It also cannot remove an
> > overlay, but I don't think that it is currently a use-case.
> >=20
> > There's still a bunch of work to extend the libfdt unit tests to test
> > the new functions introduced, but these patches will be submitted
> > in a near future.
>=20
> Are you planning to send a new version of (the relevant portions of)
> these against upstream libfdt?

Of course, I just only have to work on the test cases now.

Simon wanted to merge this in U-Boot for the next merge window, and
then sync with libfdt when it would be merged, hence why I posted it
first.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--JvUS8mwutKMHKosv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcMe4AAoJEBx+YmzsjxAgTDEP/iv1QRMN6RQVfVJD4/kkYjBu
ccX7DUuDVAktu3u0ohA+XW3I2Wgt3xkpskXxojfgZX8zYhXH0xu+/zcalpax0GT4
7PDD1WcYra7giheryh7WI5fw5Q26olAaod2EpmsJzDVjCIlxzE5LeDFJdq93V+wj
gKxYW7hek1rU/35BB8f3vNeC7oDj1QTo8ftblO8jHOK/xes4WeQW8jnCFlfVEp4C
sJdlGDE7pXqFBG3XwshFISaqC0Tyi5Lh9WBYPkjxNMovkYsO0TLZqOenFHbZWCrJ
E3km0tefLGcSPNqg0N8/Welw3mk9KN7T5d/uehK0B074J9FRcM2fX1tZln7lHztx
DvfT4r/7Dmtmpv/Wl5wpc2WFRiec/NCgSLnVFN3xsTz26wEQQPtHcc3ig+h8Z/E8
H+6CLh1U6MJTPgqTnL2NyVYhtCq86F7Ui9npuTvZU4hA/Q5Sqx/jESOtqJm2DsYv
Jp1EToIcEXLbEONZd8sep2OkEdYt466z7owJ8xPgzzsRLkklKTNXCutA4EFWVyD8
MPig00rBL0ZhxVDRw8+SwviZHdzYdx/+O/i0KKBuK2rGYYD8LTIaXVolvn5QCx0z
lBBW92YXILnpk1eEsr70VsT1/8dbLFuHvKuPKcMLzMoDV9jHCBSWKQcemSruDDEA
P+DAlMDUZ7ufCYQ+kihF
=ShYd
-----END PGP SIGNATURE-----

--JvUS8mwutKMHKosv--
