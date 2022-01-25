From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] pylibfdt: add FdtRo.get_path()
Date: Tue, 25 Jan 2022 15:48:34 +1100
Message-ID: <Ye+BIkvoQF7/qy9N@yekko>
References: <20220122105653.31219-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="78syoN7gKLXESWku"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1643086269;
        bh=pfDDaiu4jmZY6nYthHb8CfP++E9TZgPljItg9Yd0CzU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gPjr67BLnCBdWUGyumMpaEeInb3IwRjBlTxzzPg8WKJ0S7s3vpZf8ZyF3Vix0SB5z
         gQRdiPvO54OyXKVJspjmQ1W5FCYO2B88Iv8T+Tgvb7Q3xx8Kz7jkLoZsh15F/sPm8V
         LmRLHn7kAVH1R7VQ9V28fHdWYRXQFXuzD+KQi9mQ=
Content-Disposition: inline
In-Reply-To: <20220122105653.31219-1-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--78syoN7gKLXESWku
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 22, 2022 at 11:56:54AM +0100, Luca Weiss wrote:
> Add a new Python method wrapping fdt_get_path() from the C API.
>=20
> Also add a test for the new method.
>=20
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> ---
> Changes in v2:
> - dynamically increase size of string buffer until it fits.
>   The values are chosen relatively arbitrary, and terminates at lengths
>   over than 4096 as I don't expect paths to be longer and there should
>   be an exit condition to not eat up RAM in case of some bug.
>=20
>  pylibfdt/libfdt.i       | 27 +++++++++++++++++++++++++++
>  tests/pylibfdt_tests.py |  7 +++++++
>  2 files changed, 34 insertions(+)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index ac70762..d103bb6 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -443,6 +443,28 @@ class FdtRo(object):
>          """
>          return fdt_get_alias(self._fdt, name)
> =20
> +    def get_path(self, nodeoffset):
> +        """Get the full path of a node
> +
> +        Args:
> +            nodeoffset: Node offset to check
> +
> +        Returns:
> +            Full path to the node
> +
> +        Raises:
> +            FdtException if the path is longer than 'size' or other erro=
r occurs
> +        """
> +        size =3D 64
> +        while size < 4096:
> +            ret, path =3D fdt_get_path(self._fdt, nodeoffset, size)
> +            if ret =3D=3D -NOSPACE:
> +                size +=3D 64
> +                continue
> +            check_err(ret)
> +            return path
> +        raise ValueError('Node path is unexpectedly long')

Ah... sorry, this isn't quite what I had in mind.  The idea of
resizing the buffer is to avoid having an arbitrary limit, but you
still have the 4096 byte arbitrary limit here.  As Simon suggests, 4k
would probably be a good *starting* point, rather than an ending
point.  Not only are repeated calls expensive in Python, but
fdt_get_path() itself is also quite expensive, since it needs to scan
the dtb from the start.  I'd also suggest doubling the buffer size on
each attempt, rather than increasing linearly.


>      def parent_offset(self, nodeoffset, quiet=3D()):
>          """Get the offset of a node's parent
> =20
> @@ -1115,6 +1137,11 @@ typedef uint32_t fdt32_t;
>          }
>  }
> =20
> +%include "cstring.i"
> +
> +%cstring_output_maxsize(char *buf, int buflen);
> +int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen);
> +
>  /* We have both struct fdt_property and a function fdt_property() */
>  %warnfilter(302) fdt_property;
> =20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 5479363..2335a73 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -348,6 +348,13 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          self.assertEqual("/subnode@1/subsubnode", self.fdt3.get_alias('s=
s1'))
>          self.assertEqual("/subnode@1/subsubnode/subsubsubnode", self.fdt=
3.get_alias('sss1'))
> =20
> +    def testGetPath(self):
> +        """Test for the get_path() method"""
> +        node =3D self.fdt.path_offset('/subnode@1')
> +        node2 =3D self.fdt.path_offset('/subnode@1/subsubnode')
> +        self.assertEqual("/subnode@1", self.fdt.get_path(node))
> +        self.assertEqual("/subnode@1/subsubnode", self.fdt.get_path(node=
2))
> +
>      def testParentOffset(self):
>          """Test for the parent_offset() method"""
>          self.assertEqual(-libfdt.NOTFOUND,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--78syoN7gKLXESWku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHvgO4ACgkQgypY4gEw
YSLiOhAAv79uocvAdYN9wCt8RSz3o2533oBxS/U5bsgGoiNz4hn1LJA++XtQRLWo
QOzOpUDGtwWwSr+D72vMPVa6WNPboZEgG8kTPsikM1XTuGqhAKY+TZaGxQYbzUdB
JJXI40qMMxaF9qI9xxF7ypeNv3JE4Vj5tRLzcszXLqRl8nNfuAwJUJQBzv/cqVzO
dGwjm5oK0s/MjuOsSL0p8Upzlu9xDWWuDd+zVGXt0bjgclopj7/oYJU87de59Jm8
aMcPpwIDjCpc9G2bcFJHyC6vq+w67SwXn4i0Bj3XKSZvV9HShGq2hVZqihs/cIAL
AIWifi4WA7oKc183+Hamlbp7ih+FzSa3eJJwUSo1GAR9vV/etFQazjkH45+b0Ahz
bUzGdVsF15Y9xuFv5L3rVmguO/Esxsl9trYdRqGsWsBHVoYcDNty9vCv66Pyb4MP
bp2v/kLmnkeTFn4Y+QxL/m1u20tWq1Oe1MiSrzwhAK/BQfcD60RnaRhQ0w2z9lU3
sBrUrvP6yLHF03oYeObWcsh2P8A24+/WXwXjsWiK9o5a9/qN0ZoUVrlJ/BEz2D4+
/GxYHA6VpEm0V3QvAPyXFCn23cID+rWM9pocv5RLHwoHKewuuFw1AFfkH1J4Cb+C
gPlFLjmamHo7fdOOkv0gEl9629xLYTkgcf4GeegO8kW1mUYm4gQ=
=AE1q
-----END PGP SIGNATURE-----

--78syoN7gKLXESWku--
