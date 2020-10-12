From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Document sequential write mechanism
Date: Tue, 13 Oct 2020 10:06:49 +1100
Message-ID: <20201012230649.GD71119@yekko.fritz.box>
References: <20201012163801.24730-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602549906;
        bh=hhDqAXHDkIqvhC83CukhU5hwWEIrKeoLkXdmuuUfnIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nnAptxppAxw3cmRqdOw3GDR/N0XWggZkMAU+xRqF9t02vuxb9UxOkGoeoKkCNZcPD
         wEa0zqFw0Swe3mq3HT3HUONpZF552eEdfcxpRX9MXalOQd+3uijL/1BPWo2AAh+bhO
         a3CRUYrNuN7n7l8yLk7KH9VFKBppxZL0kfkEXrkY=
Content-Disposition: inline
In-Reply-To: <20201012163801.24730-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 05:38:01PM +0100, Andre Przywara wrote:
> When generating a flattened devicetree on the fly, we employ some clever
> techniques to avoid excessive copying and adjustments of offset values.
>=20
> To avoid people scratching their heads over all those negative string
> offsets and weird magic values, let's document the nifty tricks we
> pull here.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
> Hi,
>=20
> this is at least my understanding of how it works, by reading the code.
> Please correct me (and the comment), should I have got something wrong.
>=20
> Cheers,
> Andre
>=20
>  libfdt/fdt_sw.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 68b543c..1f08a92 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -3,6 +3,32 @@
>   * libfdt - Flat Device Tree manipulation
>   * Copyright (C) 2006 David Gibson, IBM Corporation.
>   */
> +/**
> + * DOC: libfdt sequential write support
> + *
> + * When creating a flattened device tree on the fly, the fixed structure
> + * of a DTB would require constant adjustment of memory offsets, also co=
pying
> + * of whole regions like the string table.
> + * To avoid this, we use an intermediate representation of a flattened t=
ree,
> + * which needs to be finalised explicitly to create a spec-conformant DT=
B.
> + *
> + * This is achieved by the following means:
> + * - The magic in the header differs (FDT_SW_MAGIC), to identify such an
> + *   unfinished tree and to avoid it to be mistaken for a proper DTB, sh=
ould
> + *   the fdt_finish() call have been missed.
> + * - The string table is located at the end of the allocated buffer, and
> + *   is growing *downwards*,  as new strings are *prepended*.
> + * - The string offsets in the dt_struct are expressed as negative offse=
ts,
> + *   measured from the *end* of the string table. This allows offsets to
> + *   stay fixed, even when new strings are added (before the old ones).

This is possibly misleading, since it depends how you define "start"
and "end".  During SW mode, the string table offset also points to the
end of the string table, rather than the start, so string offsets,
while negative, are still relative to the header string table offset.
So, in normal mode the string table occupies (absolute) offsets
[fdt_off_dt_strings .. (fdt_off_dt_strings+fdt_size_dt_strings)], but in
sw mode it occupies offsets [(fdt_off_dt_strings-fdt_size_dt_strings)
=2E. fdt_off_dt_strings].

> + * - The dt_struct is located at its usual place, but leaves room behind=
 it,
> + *   to grow *upwards* towards the string table.
> + * - Upon finalising the DTB, all negative string offsets in dt_struct w=
ill
> + *   be adjusted, by adding the offset of the new end of the string tabl=
e.
> + * - Eventually the final offset of all structures is written into the
> + *   header, and the magic will be changed to be the spec defined one.
> + */

It's probably worth mentioning that in SW mode, only the "ro" and "sw"
functions can be used.  "rw" functions will fail with
FDT_ERR_BADSTATE.  In fact some "sw" functions may also fail with
BADSTATE depending on where you're up to (e.g. trying to create a node
before finishing the memreserve block).

> +
>  #include "libfdt_env.h"
> =20
>  #include <fdt.h>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+E4YYACgkQbDjKyiDZ
s5LPlA//Q96iJeK6fe5qdHhKCW8NxFtwXTcjZ/c02tGqG71xsG/O7MyNsHu2OqV3
XalLPMuwKFx78AbDswATylJv5Ggv/PG7LlmtMdvKNVkSUCKmLe6JD8tWjn+yge5n
irG/eddzwjfOsZiRzMrJjS3AFU36U7AhfojT3DbJ3y9Cc3szqjg9t2zUk7R5Wz4H
niHwOIdBOukFBt+hwCIIILAWm8OzpU4KEtYGUx5o8nVZe4KLoXAz8awsyj+WhZeO
ABIcq6CQYYSQUpYlCuiWfHziwI7mHUwa/OFjyRxJSg4oYIZ+dG+nh7X2L7ifeC6u
lu8yNpbvrxkUUVrso++vS5Gv44yCaDnocdyfg6mQUj3RszJXNLcUmJ5Ezau6lTLj
gHgjvAoO4bqP9bvRJ2jRZDGNEmnHJNNadXi4QQcnupypa6U1Ro/XUarINJAbWBSp
wWem4WtGb+xMoTK+gw9RDF5hr7QPoa0MajUZRVittfBpSPEeVHMwHkLEhrCkxNF/
D5F3MjG4BE5vbLyH8HTqvRDgkFhW6bDBlMhXDlZp5YNPAirD+0yG+9oYBioeEVbz
Tv7avqg+EhTrk/RHMExHPcz4Za6ZBytklhWAKG3jNTqdHq1sJ/ws2MnIlhWbZrQ7
8EVjiiHihhHyKi7wLUtxsdvg1BARAib/ki1/KIOuAaGRUkPDXdw=
=Wzzi
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
