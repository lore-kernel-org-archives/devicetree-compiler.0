From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] Overlay syntax sugar using <&label>
Date: Sat, 1 Jul 2017 18:01:44 +1000
Message-ID: <20170701080144.GM13989@umbus.fritz.box>
References: <1497451986-15515-1-git-send-email-pantelis.antoniou@konsulko.com>
 <594C3748.1030409@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cGfB/trNgB3WtPHu"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1498897092;
        bh=AdxJoW2axjCNYxz9Sj0unYssCCQw0kxFWREsBo6jfMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HdXimm3ycTFcKsqYmxW/BhHqaeh0ZtC3mQef+u08g5EW+66TcSBvlMkG+VdG8DBV3
         +f9x1RkPTR9hY4SJLIGoNMqBI3bO4qwzMyyW/6OUB4r3S7isfTM2DcGgyxG41HQe75
         JZhqSoRhtCyrDwFIWKDAH7uxev7kKRCe1e3bi7Nw=
Content-Disposition: inline
In-Reply-To: <594C3748.1030409-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--cGfB/trNgB3WtPHu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2017 at 02:31:52PM -0700, Frank Rowand wrote:
> On 06/14/17 07:53, Pantelis Antoniou wrote:
> > This patchset makes overlays simpler to write by utilizing
> > the standard &label { }; syntax instead of the manual
> > method which is more error prone.
> >=20
> > Pantelis Antoniou (3):
> >   overlay: Documentation for the overlay sugar syntax
> >   overlay: Add syntactic sugar version of overlays
> >   tests: Add a test for overlays syntactic sugar
> >=20
> >  Documentation/dt-object-internal.txt | 17 +++++++++++++++++
> >  dtc-parser.y                         | 20 +++++++++++++++++---
> >  dtc.h                                |  1 +
> >  livetree.c                           | 22 ++++++++++++++++++++++
> >  tests/run_tests.sh                   |  6 ++++++
> >  5 files changed, 63 insertions(+), 3 deletions(-)
> >=20
>=20
> Hi David,
>=20
> Any thoughts on this series?
>=20
> I have been hoping this new syntax would be accepted.

Sorry, I've been travelling and then sick, so I haven't had a chance
to look at this.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cGfB/trNgB3WtPHu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZV1boAAoJEGw4ysog2bOSIDsP/igzvRzasV99cUhbJ41ZmyLr
/8RBSak1p6440b8h6Vd4786EeH/MO1N1IWl4lcOPDW9WnZ7IXTl39kt12DYVnCaG
/GaQ3zCPu29UxVrCiFl8G5Ahtrruh+Aom1sYCFq7DYhfP5qzYUaqEz+TX64OVA48
TVKEr2BnwajIiaeXKjFBuY40cQkl1FCp00Y11lzP6DdFpG1B2WMga/xbjnCAMUw3
uOL/tFSR+IlYWv7CTxgJlpqTejzUYkZ4Hs3ok3wzk16zlhc3FBfHAWdWX/wpM/JT
kNHIPsYgKtHXxl70tTfe0dVklKtpy6QQLw3y1baLmABtfdK9Gj2lo/HogjljlQpj
WLTShgwc5BJJKEmaBrf3aYhE5nOHbQ5U5E8ySFwrZbV7xGr0GWIo1RX1FJPgHgTV
7DfcPTFV5Ekmb/jxX4unBW58ixF3hpAM2E1NuRN8bejJLHndM9uxOXx+UkDQcTR+
PbcLaY/OUlZeYNNinvtRZ7ONXj/CkDsoq3B/Msyow7YB+NcQiHkNR+0be2N/JfJU
Ln5dSdayjdFC3yQGfCS4IZgY3Tz1FO9+Zi9Tlg1JQf0sWtJEVQ7QlPW5570vUAwv
2e9lgQlZI+V2sSep14IZcgBFD9EKSttksPVZjzeRSCgAde0GzmryznbivXeD5q+v
4jLbVzfqR5gYCKXRih1a
=DZMh
-----END PGP SIGNATURE-----

--cGfB/trNgB3WtPHu--
