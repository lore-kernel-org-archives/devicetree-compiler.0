From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: add helpers to read address and size from reg
Date: Tue, 22 Nov 2016 14:39:15 +1100
Message-ID: <20161122033915.GC28479@umbus.fritz.box>
References: <1478710712-25010-1-git-send-email-b-fair@ti.com>
 <99dd8a63-19bb-0d06-8bc2-f2ad575ca2cb@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hYooF8G/hrfVAmum"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1479789164;
        bh=q0U46fN99TicBCuQxdQwIZ/appaDbSZFIllA5cS64uY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b8YBaPBEMwPsYu/JWmu1i515UYIXQQxEr482gs73hCp5clh3TUOUpbpWxVFsy+xA3
         KkeKWWW52Wn5ZJCuDcf2Xw88D9GvR7Cegi0luzg+e6IfxVZ7nRd8qYA5WDHFshp2Fz
         oefB0S+y+0EUT9yufgeH4Xtw8jAjFtfUKqwlk2nA=
Content-Disposition: inline
In-Reply-To: <99dd8a63-19bb-0d06-8bc2-f2ad575ca2cb-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--hYooF8G/hrfVAmum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 11:37:41AM -0600, Benjamin Fair wrote:
> On 11/09/2016 10:58 AM, Benjamin Fair wrote:
> > This patch extends the capability of libfdt to parse the contents of de=
vice
> > trees in a similar manner to fdt_address_cells and fdt_size_cells.
> >=20
> > It adds a helper function which reads the address and size of a device =
=66rom
> > the reg property and performs basic sanity checks.
> >=20
> > It does not perform translation to a physical address using the ranges
> > properties of parents, but this enhancement may be added as a separate
> > function in the future.
> >=20
> > Signed-off-by: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
> > ---
> >=20
> > The intent of this patch is similar to the commit "libfdt: Add helpers =
to read
> > #address-cells and #size-cells" [1].
> >=20
> > It is related to "libfdt: add address translation support" [2] but does=
 not
> > attempt to perform address translation and was written from scratch rat=
her than
> > reusing GPL code. If the issues with that patch are resolved, that
> > functionality will complement what is added in this patch.
> >=20
> > [1] http://www.spinics.net/lists/devicetree-compiler/msg00113.html
> > [2] http://www.spinics.net/lists/devicetree-compiler/msg00093.html
> >=20
> >  libfdt/fdt_addresses.c | 62 ++++++++++++++++++++++++++++++++++++++++++
> >  libfdt/libfdt.h        | 29 ++++++++++++++++++++
> >  libfdt/version.lds     |  1 +
> >  tests/.gitignore       |  1 +
> >  tests/Makefile.tests   |  2 +-
> >  tests/addr_size.c      | 74 ++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  tests/addresses.dts    | 11 ++++++++
> >  tests/run_tests.sh     |  1 +
> >  8 files changed, 180 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/addr_size.c
>=20
> Hi David,
>=20
> Did you see this patch?

Yes, I saw it, I've just been busy with other things.=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hYooF8G/hrfVAmum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYM73hAAoJEGw4ysog2bOS5A4P/357tciA0GO+4wDbArlqakrR
BPZvAUz4twUWPgVRZoSFS+/8UNmWrct5MXKZ9s4iccMEoididIcFBmo8tIGF9lEx
vi64rRLTTl8V8ZfRlPkVVXFT0M+SY8wGoIhUjrXCStpvPsKpf8kO7cq1MWOZr8Sr
KcO3Z0RBmLZDH2/QTZ+dq94mKAXnWRvPJsmq96a/0gUVE/HUtbTvOH9xLtWGbbPU
m+05P1g8YciA+/PLDF+Hj8awrlfp0CzvMVV9T866sVoJrJ1eD7WAU5JbUIm+/XFu
AeAaEbF0qsuwHkLwLqLhtMLTJoXxzhUSddrB5JeKKQXsT/EFEtPG1CT2+Aaf1KKo
l70bNDHwFu77vQ5JB4dQRIB0QFWeo/78zMsaF9uL99vqaAmZUV5rLtaBx4KBdi0a
oCR57ytWSIxS8sH+9oJLR4M7TYiBn/3BBX/b/l4+uJE1Sp1J2Ga1kBVQGZOiZovY
tQwEW9qCN0CkaVObJ4LRngHKxVEyoMhrKm84r46pyNNyj43Q8L9ieKiwOotiQ9a4
gG+QitM7uPQ+Ep9IM77V9P3nx4knkVrhh/mbJGLkO+M8H75vhFyDCtJ3zfXHdsl1
SwfJ3+voKbfCYY49eo8EVIJoNv/3PKqVT5a2bmhtGM3bCkxCLtrkpOORcYe8SWGY
V9Y3A8GQ0t1BRBnNxalr
=WBIo
-----END PGP SIGNATURE-----

--hYooF8G/hrfVAmum--
