From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: fdtdump.c: Compile error with GCC 11
Date: Wed, 6 Jan 2021 14:54:31 +1100
Message-ID: <20210106035431.GB3209@yekko.fritz.box>
References: <db5d86de-fa1b-9d44-1188-edb81578bc00@embedded-brains.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1609905279;
        bh=JREPkwGqvKj6BRVadIF0GJM09e5+cm5elIV8AvE4NRQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=duX3El6PCt0zCQ9hMO9VxdaH++gN2xPIjxJe3PiaaYWB9UmKaZfdNAiN4HMWTtr8A
         yhNm8obNL11naTMHUc/hbDg5BYk+B/S11g50KvFS0/GMHYh7mUChI3n9K8DU15y87K
         rfIARWnrQDUq8c24hF1cE3wGAGMpVAWNu/qZsR60=
Content-Disposition: inline
In-Reply-To: <db5d86de-fa1b-9d44-1188-edb81578bc00-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Sebastian Huber <sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2021 at 09:39:00AM +0100, Sebastian Huber wrote:
> Hello,
>=20
> I get a compile error with GCC 11 in fdtdump.c:
>=20
> In file included from fdtdump.c:14:
> fdtdump.c: In function =E2=80=98main=E2=80=99:
> libfdt/libfdt.h:256:28: error: array subscript =E2=80=98struct fdt_header=
[0]=E2=80=99 is
> partly outside array bounds of =E2=80=98unsigned char[4]=E2=80=99 [-Werro=
r=3Darray-bounds]
> =C2=A0 256 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fdth->name =3D cpu_to_fdt32(val); \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~~~~~~~~~~~^~~~~~=
~~~~~~~~~~~~~
> libfdt/libfdt.h:258:1: note: in expansion of macro =E2=80=98fdt_set_hdr_=
=E2=80=99
> =C2=A0 258 | fdt_set_hdr_(magic);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~
> fdtdump.c:216:31: note: while referencing =E2=80=98smagic=E2=80=99
> =C2=A0 216 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned char smagic[FDT_MAGIC_SIZE];
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~
> cc1: all warnings being treated as errors

Ah, I think I see what's going wrong here.  I don't have easy access
to gcc 11 to test with, so can you give this draft patch a test:

=46rom 6307635b052b55cba6970ae3fb70f33259c572a4 Mon Sep 17 00:00:00 2001
=46rom: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Date: Wed, 6 Jan 2021 14:52:26 +1100
Subject: [PATCH] fdtdump: Fix gcc11 warning

In one place, fdtdump abuses fdt_set_magic(), passing it just a small char
array instead of the full fdt header it expects.  That's relying on the
fact that in fact fdt_set_magic() will only actually access the first 4
bytes of the buffer.

This trips a new warning in GCC 11 - and it's entirely possible it was
always UB.  So, don't do that.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 fdtdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fdtdump.c b/fdtdump.c
index 9613bef..d9fb374 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -217,7 +217,7 @@ int main(int argc, char *argv[])
 		char *p =3D buf;
 		char *endp =3D buf + len;
=20
-		fdt_set_magic(smagic, FDT_MAGIC);
+		fdt32_st(smagic, FDT_MAGIC);
=20
 		/* poor man's memmem */
 		while ((endp - p) >=3D FDT_MAGIC_SIZE) {
--=20
2.29.2




--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/1NHUACgkQbDjKyiDZ
s5Lyrw//bsyIQb5Ko0CYftjcojh2/jbMqCv/OjBYMqfXQV/1KObllKFJPNfsQMhy
8uwgA/4wW+0swztMapV/kJ9P7yRxzIAnIVr4GhwbXRTNJABzlP/SM6qk8xv/XDpN
0q7MJKdwIoqEAMbmgN4DXC6pUb+LHlW6qB8PRF8maQW9p32QWsiy3qjyFsD7me0/
SOJDctK6kk9v8sB9wJ/Yhgmk/IDvJUmZ5sKEi80IlGbpQgPApRGKmtQv13Hqzmd9
xKqg3FBgBnW6u5BG2cpi5qrEUGnflcS4mGbYImCI1iipWqJCD1eEGWRM4Cuj+rLx
G0StakALD/d39phYKZkwi06bN8wd4B+UZl8n8Wc/Wdy2ZKI5yvpkxOwxsFNa0ImT
juqLqQulLUWkacqVf/rzZhxe/i7HzMmtx4tNoKppOMA2o+++bmDWeeh8sVq505ZM
3bfil76rWI5Kv0xX01Zkyno+WgG7wESSoTchCQJw2aK2XweTh+Pl06jwCGQETF6s
25qGJrSnELplTLtw8OU1IbgzWFADuPTUclyCmnGA5OuCtwS027IoO4V6LCFGAgHk
BZnZYnyFI1wypwSIxQ5OhjhYb0I6CEUR0uFRFSMP3COj8sUs8Khd398ZgzNJOHC9
UxpJs309wSW4FyzZAAjFQDhrOtspgEImgMJdkzpenl4gk3s1wtY=
=KEsp
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
