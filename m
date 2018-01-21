From: Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: DTC v1.4.6 released
Date: Sun, 21 Jan 2018 14:03:26 -0800
Message-ID: <87k1wauaxd.fsf@aikidev.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

--=-=-=
Content-Type: text/plain

On 2018-01-04, David Gibson wrote:
> Hi everyone.  There have been a number of useful bugfixes added to the
> dtc tree since v1.4.5, so I decided to tag another release.

Thanks for all the work on dtc!


> The signed tag is in the master git tree at:
>
>     git://git.kernel.org/pub/scm/utils/dtc/dtc.git

I'm not seeing a signed tag for v1.4.6, and it doesn't appear in the web
interface either:

  https://git.kernel.org/pub/scm/utils/dtc/dtc.git/refs/tags


> Or you can download tarballs from:
>
>     https://www.kernel.org/pub/software/utils/dtc/

Fortunately, commit:e54388015af1fb4bf04d0bca99caba1074d9cc42 appears to
be consistent with the contents of the 1.4.6 tarballs.


On a related note, I was wondering if it would be possible to have the
compressed tarballs have their own signature:

  https://www.kernel.org/pub/software/utils/dtc/dtc-1.4.6.tar.sign

Only validates against the uncompressed tarball, which makes
verification of the signature a bit more complicated, having to
decompresss the tarball before verification.

It also means I can not include the signature file in the Debian
archive, as the signature needs to verify against the compressed tarball
in the Debian archive. For this reason especially, it would be nice to
have dtc-X.Y.Z.tar.xz.sign available as well.

Thanks for considering!

Please CC me in replies; I'm not subscribed to the list.

live well,
  vagrant

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEcDardHbDotegGFCHt4uC1IFLkbYFAlplDi4ACgkQt4uC1IFL
kbZ6+hAAp//WOPvjHxAVB8QmKG/d5IW6YKt63+p0GvCsD1WZMcKhqC4dx8nVf+Fh
o1zmggdP+NnneeszWIZDL49n99F3M2642Qe4G9RAh7VKUxlIl76a2G9g3xX8nj43
hjSpKzb1KRe2O9AkE2lIQTWABYcJLucSc3rKVHIOSALMYPLhWPEMGxzVHpoOqzKL
bZ8SrgxsUv/nUKabk0PBuwyWqTDaAVWysDzE4RViq8HH3ieXn602zh/3VYdyjN28
VkeVPS42gCxR1u2FP2GNqRV0UDhLAB/55doDgG8a71lGKopw3kxNLwunYkYOIQ6a
ccdJ4ikZQqJ44ZWLphklEc4aWxqCdOI/xSC2sLRMZH4mOQYovAk4UCYCe12zE8lW
MUaLi64YKmA3OCugHW/cjNdcn9KfUskaW+4ojMBFiQOX2HMjiAqGk8tYtldT+OlG
UhWaBH4szwJddjlzWY7fSwR/pTi/OvcF6tcR7SrEcBIfkbe+H+LdYktuz8BwfZAy
fwsc+0HCbwp/78/trT49kqXMhqZW0LVeXKBPJFjzFgwYvLQJW16kUsmezHsRbaXn
15RhAllu3AmOj8CEuaV7xKXf8motyhHnwgXkvJ9QtoYroqRMTkMCDl2AmWMEV+2M
hz7zHXOvFG7h4zbuHYZvGCjOqQsNWjUzyEHViOQbpldpnFgavO0=
=Zhux
-----END PGP SIGNATURE-----
--=-=-=--
