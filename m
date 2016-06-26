From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 00/12] cmd: fdt: Add device tree overlays support
Date: Mon, 27 Jun 2016 01:37:19 +1000
Message-ID: <20160626153719.GP15625@voom.fritz.box>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lx6+J6gHrzwEpYNy"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1466956117;
	bh=8UkpEgzZGxeCzMt7aKoEGmnNcyqih4+MNgpurOffyWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ad+mB0t8xglO8Z30BKbo3d9h2lDcjVtnCsajtuYjlPqfmB+CdABNEabOvSbDKLuHa
	 X9F9onZHf4hdKnl9rjzVKSZ0hcPUrrLQ/Y5kUmXtGyuQhzycNpfgLfJ/63Cq+GG3c8
	 Egbdj+KcCmmIDIuMaz6NXDSiHWC00EX2ObWBKPB0=
Content-Disposition: inline
In-Reply-To: <20160624142757.32735-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--lx6+J6gHrzwEpYNy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 04:27:45PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> The device tree overlays are a great solution to the issue raised by
> the bunch expandable boards we find everywhere these days, like the
> Beaglebone, Raspberry Pi or CHIP.
>=20
> However, most of the time, the overlays are applied through a
> mechanism involving the firmware request interface in Linux, that is
> only fully functional once the userspace has been mounted and is
> running.
>=20
> Some expansion boards might need to be enabled before that, because
> they simply need to patch the DT early on, or need to be initialized
> early in order to be fully functional, or because they provide access
> to the root filesystem.
>=20
> In these cases, having the bootloader applying the overlay before
> Linux starts seems like the easiest solution.
>=20
> This implementation doesn't provide all the Linux fancyness though,
> there's no transactional application, which means that if the overlay
> cannot be applied for a reason while you're still halfway through the
> application, you're probably screwed. It also cannot remove an
> overlay, but I don't think that it is currently a use-case.
>=20
> There's still a bunch of work to extend the libfdt unit tests to test
> the new functions introduced, but these patches will be submitted
> in a near future.

Are you planning to send a new version of (the relevant portions of)
these against upstream libfdt?

>=20
> Let me know what you think,
> Maxime
>=20
> Changes from v2:
>   - Add Kconfig option for the libfdt overlay support
>   - Reworked the code to deal with Pantelis and David numerous
>     comments, among which:
>     * Remove the need for malloc in the overlay code, and added some
>       libfdt functions to do that
>     * Remove the DT magic in case of an error to not be able to use it
>       anymore
>     * Removed the fdt_ and _ function prefix for the static functions
>     * Plus the usual bunch of rework, error checking and optimizations.
>=20
>   - Added new tests to deal with bugs reported by David (the overlay
>     was not applying when you add a subnode declared that was already
>     in the base device tree, and using a local phandle was only
>     working if the property storing it only had a length of 4).
>=20
> Changes from v1:
>   - Moved the overlay code to libfdt
>   - Added unit tests
>   - Refactored the code to reduce the amount of memory allocation
>   - No longer modify the overlay itself, but create a copy to operate
>     on instead.
>   - Removed the limitations on the fixups path, names and properties
>     length
>   - Fixed a few things here and there according to comments		   =20
>=20
> Maxime Ripard (12):
>   cmd: fdt: Narrow the check for fdt addr
>   scripts: Makefile.lib: Sanitize DTB names
>   vsprintf: Include stdarg for va_list
>   libfdt: Add new headers and defines
>   libfdt: Add iterator over properties
>   libfdt: Add max phandle retrieval function
>   libfdt: Add fdt_setprop_inplace_by_index
>   libfdt: Add fdt_path_offset_namelen
>   libfdt: Add fdt_getprop_namelen_w
>   libfdt: Add overlay application function
>   cmd: fdt: add fdt overlay application subcommand
>   tests: Introduce DT overlay tests
>=20
>  Makefile                          |   1 +
>  cmd/fdt.c                         |  26 ++-
>  include/libfdt.h                  | 124 ++++++++++++-
>  include/libfdt_env.h              |   6 +
>  include/test/overlay.h            |  16 ++
>  include/test/suites.h             |   1 +
>  include/vsprintf.h                |   2 +
>  lib/Kconfig                       |   5 +
>  lib/libfdt/Makefile               |   2 +
>  lib/libfdt/fdt_overlay.c          | 381 ++++++++++++++++++++++++++++++++=
++++++
>  lib/libfdt/fdt_ro.c               |  44 ++++-
>  lib/libfdt/fdt_wip.c              |  13 +-
>  scripts/Makefile.lib              |   8 +-
>  test/Kconfig                      |   1 +
>  test/cmd_ut.c                     |   6 +
>  test/overlay/Kconfig              |  11 ++
>  test/overlay/Makefile             |  15 ++
>  test/overlay/cmd_ut_overlay.c     | 243 ++++++++++++++++++++++++
>  test/overlay/test-fdt-base.dts    |  21 +++
>  test/overlay/test-fdt-overlay.dts |  88 +++++++++
>  20 files changed, 992 insertions(+), 22 deletions(-)
>  create mode 100644 include/test/overlay.h
>  create mode 100644 lib/libfdt/fdt_overlay.c
>  create mode 100644 test/overlay/Kconfig
>  create mode 100644 test/overlay/Makefile
>  create mode 100644 test/overlay/cmd_ut_overlay.c
>  create mode 100644 test/overlay/test-fdt-base.dts
>  create mode 100644 test/overlay/test-fdt-overlay.dts
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lx6+J6gHrzwEpYNy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXb/avAAoJEGw4ysog2bOSv7wP/RCQ+qGEypMT+TpFlLsFzPtI
w9vWVlkSnFlYeW/sYUlov23TFr+Y0nAjb5yPo8PKERLMyfc/yyMFC2cH93y7hl2P
GFAKcuY1xlugo1i6zdC3bLdBnK3lYbVo7Qy79cifB7/JZcw7gnSO2jg/qnL6Szm5
2JSxhdPY79K8huqZW5/vx4Pg3JgIC/21faGJrsfzXQEgyhEwBxl0nrHTybZ4UyYz
Gf0PNsYrNXgU/rjTu90gfDiKmlj59UnL+c+ywO3671a6pH84dW3UkfPWlLWb6aDZ
PS6Yw0YTWGrANqgs87EMoJn2gAhQHDYH9lvs85Yqjox2xpnLOrvKellZlItJSzVz
qnJnVrnuHrWD3oX2sRGfZq4sS99iGZWQfHKGxUsXh+lfnYrlB8BlwYjXr1OQSJFg
NGNMHkkwFJSATrrG3hXYl3XbQWJZqw+dqrhuTobnJYcFPPnP8tvjX7tPK5XQiYF6
MaBzBy6iA2k6B4+sPBwG7Ixh7tYLPwtHRw1bpdFxvD7ZTDNc8zZu9BrXY/MuCDH4
oBn0NUKSHYfclXqzRDtnZU7s8bemajS4vYULj0/Zi6syladvdJQPj9I55J+pve80
qJfxsJEZmb+Arq9xAfL2DhJ6urZ2hah9bnJSUARNzUU4fh0oeRSeRJl+b2565MYw
zxplbpYwimMKF5/fvBw5
=V3h2
-----END PGP SIGNATURE-----

--lx6+J6gHrzwEpYNy--
