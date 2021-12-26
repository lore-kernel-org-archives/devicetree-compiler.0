From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix Python crash on getprop deallocation
Date: Sun, 26 Dec 2021 15:46:13 +1100
Message-ID: <YcfzlVfFMqJtGFzK@yekko>
References: <20211224102811.70695-1-luca@z3ntu.xyz>
 <Yca6ZoKpCjLsFFfo@yekko>
 <5777466.lOV4Wx5bFT@g550jk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3WmfxElHl359DOq6"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1640493978;
        bh=5ov0f5IupAs3FFewPbu92USmjj2rF//1ev1i4tLlLJY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aN0LqPonzm4fxLABGNoc0v3c8aGYi/RojvfEn4N3COCUFcbmws+qUmoS0aOD+SU+L
         PMoDdutCAvkUh8rqpnplajVCwyjO/q0Gt/ChCIWKVPhWMJYxJH0Lc3tuF8mKlqSeH3
         3GKIOOJkyBmMVvPIc1ao+MBOT4796BQMuNjaNiz4=
Content-Disposition: inline
In-Reply-To: <5777466.lOV4Wx5bFT@g550jk>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--3WmfxElHl359DOq6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 25, 2021 at 11:25:51AM +0100, Luca Weiss wrote:
> Hi David,
>=20
> On Samstag, 25. Dezember 2021 07:29:58 CET David Gibson wrote:
> > On Fri, Dec 24, 2021 at 11:28:12AM +0100, Luca Weiss wrote:
> > > Fatal Python error: none_dealloc: deallocating None
> > > Python runtime state: finalizing (tstate=3D0x000055c9bac70920)
> > >=20
> > > Current thread 0x00007fbe34e47740 (most recent call first):
> > >   <no Python frame>
> > >=20
> > > Aborted (core dumped)
> > >=20
> > > This is caused by a missing Py_INCREF on the returned Py_None, as
> > > demonstrated e.g. in https://github.com/mythosil/swig-python-incref or
> > > described at https://edcjones.tripod.com/refcount.html ("Remember to
> > > INCREF Py_None!")
> > >=20
> > > A PoC for triggering this crash is uploaded to
> > > https://github.com/z3ntu/pylibfdt-crash .
> > > With this patch applied to pylibfdt the crash does not happen.
> >=20
> > Any chance you could rework your testcase into the libfdt testsuite
> > (make check)?
> >=20
>=20
> To be completely honest I don't exactly understand why this crash is=20
> happening. If you reduce the iteration count in my PoC from the "10" I us=
ed to=20
> just 1 or 2, then the crash doesn't happen. But I don't have any insights=
 into=20
> how Python actually allocates and deallocates things internally, as this =
crash=20
> happens during dellocation when Python exits and after the supplied code =
is=20
> already run.

Ok, fair enough.  Applied to main branch.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3WmfxElHl359DOq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHH85UACgkQbDjKyiDZ
s5IksA/3SIhbAEE3HoRuSEA/Mn3QjMjc72qxipuW5NSIHLjnazyVx8e0cw+nzHvP
haQNeauqzOV5pYFwC/aVcA3ULTNhcifnSlpLxYFrz7HgAU0nv36VQfELlRmIib9w
2vrB6iDL4cgIgdhPI1KInFvFXi8ncIIOxXFxnsBOKX4CPuHB54Z1LSHyArY5UWON
8BGuiglDT+MvYybqYTJiAWOLkMbgGIpXtZfu3LTrZ+aTEJ5uFUUYO/zkZuIivrH6
kvZl8LdCFGR8PoEauF6rumnGkew3Aa3Gz2zzr1u+7FZeCucuQUQK2+OGngaKaAw2
1F2iurDWJmCB4k28pTg5uXV3J6Zu8QeP7X7ibK+uqZhGp8R8L7xtfe/atOlcO/Ql
5xg+NJdfiLg7vCBRkMmOMtwSHYsKJWz5oWl6pI/D1bJtxdFvtTjhN7Rp2qrXCTcP
hjQUsrxgj/wg+6YPQonCJmwpz4wJvWG/gkaXylux7CVV/oadGT6qEFs4WAPCxlGy
G7UylsAosm/J0BjhaI1DQyMRuDvxsYwwj7ZtM2ASiEeR5FikmhbUtRDHIls7M6J0
vXYZngSGC1RLkQHMF3hazeXAZNa+g5pbFI/KCxrz3WWbn2+6xijeqjP/yE9OQDNx
/44PS6iGFbzn7udjVfUCtbq4sbXM0sSuSeZkM5DeTcPslQiwNw==
=VIaT
-----END PGP SIGNATURE-----

--3WmfxElHl359DOq6--
