From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: add helpers to read address and size from reg
Date: Tue, 22 Nov 2016 14:40:26 +1100
Message-ID: <20161122034026.GD28479@umbus.fritz.box>
References: <1478710712-25010-1-git-send-email-b-fair@ti.com>
 <99dd8a63-19bb-0d06-8bc2-f2ad575ca2cb@ti.com>
 <8730ced3-41c1-e515-ff93-6f719abb5800@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1479789165;
        bh=YpKEG9yfTYJiWq63Ogr2g6Yuj05rMlEdjQh1xOcGBqY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BoqfHsy96Pubcih6F3hJG91uNsiU00tzZQqigtjT6qmqVEmaQ6x8ASDSpGGlPOrFY
         8hHwU/+eKdhXCt4zz6fCF1mrMP8fTA9bjDtRoud1DJt3UpYNVFy24njpDfQJdVBrtV
         vUcaf+MMXDg46phwQTolYbKi32qe/4XE4OlqWb7Y=
Content-Disposition: inline
In-Reply-To: <8730ced3-41c1-e515-ff93-6f719abb5800-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Cc: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, danh-arm <dan.handley-5wv7dgnIgG8@public.gmane.org>


--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 12:05:48PM -0600, Nishanth Menon wrote:
> On 11/18/2016 11:37 AM, Benjamin Fair wrote:
> > On 11/09/2016 10:58 AM, Benjamin Fair wrote:
> > > This patch extends the capability of libfdt to parse the contents of =
device
> > > trees in a similar manner to fdt_address_cells and fdt_size_cells.
> > >=20
> > > It adds a helper function which reads the address and size of a devic=
e from
> > > the reg property and performs basic sanity checks.
> > >=20
> > > It does not perform translation to a physical address using the ranges
> > > properties of parents, but this enhancement may be added as a separate
> > > function in the future.
> > >=20
> > > Signed-off-by: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
> > > ---
> > >=20
> > > The intent of this patch is similar to the commit "libfdt: Add helper=
s to read
> > > #address-cells and #size-cells" [1].
> > >=20
> > > It is related to "libfdt: add address translation support" [2] but do=
es not
> > > attempt to perform address translation and was written from scratch r=
ather than
> > > reusing GPL code. If the issues with that patch are resolved, that
> > > functionality will complement what is added in this patch.
> > >=20
> > >=20
> > >  libfdt/fdt_addresses.c | 62 ++++++++++++++++++++++++++++++++++++++++=
++
> > >  libfdt/libfdt.h        | 29 ++++++++++++++++++++
> > >  libfdt/version.lds     |  1 +
> > >  tests/.gitignore       |  1 +
> > >  tests/Makefile.tests   |  2 +-
> > >  tests/addr_size.c      | 74 ++++++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  tests/addresses.dts    | 11 ++++++++
> > >  tests/run_tests.sh     |  1 +
> > >  8 files changed, 180 insertions(+), 1 deletion(-)
> > >  create mode 100644 tests/addr_size.c
>=20
> I think in a lot of places this simple translation of DT can easily be
> benefiting.
>=20
> [1] http://www.spinics.net/lists/devicetree-compiler/msg00113.html
> [2] http://www.spinics.net/lists/devicetree-compiler/msg00093.html
>=20
> Rob, David,
>=20
> The motivation started off by wanting to have a better integration of lib=
fdt
> and dt support in ATF[2] - and basic stuff is to be able to read address
> from a node - not that we could'nt do something similar as a ATF specific
> library... but common might be better for all of libfdt users, no?
>=20
> Do you folks have a suggestion as to what might be a better direction to
> take here?

Sorry, I don't really follow what the question is.

>=20
> Original patch for reference (since my google-fu failed to be able to fin=
d a
> devicetree-compiler patchworks)[1]:
>=20
> [1] http://www.spinics.net/lists/devicetree-compiler/msg00844.html
> [2] https://github.com/ARM-software/arm-trusted-firmware/pull/747#issueco=
mment-259727132

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYM74qAAoJEGw4ysog2bOSa24P/jr+gT3Lta2VfUuVv0rV73xd
bgRP3Sj2O6IsA7UcxWv6LIzxZ0wet97pXgROPfEUZfH9aUIXDTDxvni/bUzfKZAG
kPNR5RxEqjrECo0nLTH7H4/tYuu7mo6AEPJwQc0GwnzK7lDu2mG1RPFA93pK4d+a
iYhQiTHieeLCYtIri015vKvJi/3aGNBO3VxKkU1kKuQ9nujhazscSnWGR8zcUgZx
R0fhlLqK6exBVYMoJxjT2Fm4E3tJF2FRFKZlIzrDtVlULv1v2oNw3DzDSFXgh7TG
OPtA3GX6Z8BVz/q/T7OeV46gvTYHAkksfgx7enJ1+F27rbLyOFNJ2lzwVxru0ucP
a+WwaraXGFSVEfIT5tMigZWMHn5NkFuMEno1b3v/BtP4AvPMPU4EHEh/vEsitQZ7
Ucbv2q6wO7/BU5T+qKOjp6C+u5Bf8zist5prFztsBUc1ZbVmxqzVeuEFx2dKgqGm
NlXIhOMPEL2fGYsSro131em05Q7rljKlXvj71nl/vfJcv17kHz4TLr8nC6oNFnLo
JzWHDNPZ+CFFKRxZtWPUiCoghELi46nes3j+DGC3KLD1dIi1suQ85Q5kuBDD3vJA
v33vwkf0kVF04JVRVS2yL2gbjywewF3UOkfTUvTEfO7HOX/uuyr2XznDNn+TqYP0
sk1lA4Fdu+yyiMRrMMO6
=QLdK
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
