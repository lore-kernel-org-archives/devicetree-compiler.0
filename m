From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: valgrind tests don't test anything
Date: Mon, 9 Mar 2020 19:29:20 +1100
Message-ID: <20200309082920.GF617846@umbus.fritz.box>
References: <20200308183221.GA10025@comp.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1583742731;
        bh=o6bZqyTDqW26OgNms8rjVlNBs7mpp+yVwmBVxLik4tY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HhLRJaHwSu/6XkmWUjECpr4E1B87aG7becaHbCvhD5I4ysPVmqaAn62+LF48xzcew
         iOHQ48A/LRtoBLdQyna3VijnNsDWkWX+20AFDJWmreduvdGShjYOFGqqz81AWO4YcN
         f08yQsdLb/NgG3WUG/Ca2R7fhoUjsrDoEXSWNd00=
Content-Disposition: inline
In-Reply-To: <20200308183221.GA10025-Zrdc6muVEXg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 08, 2020 at 07:32:21PM +0100, Arkadiusz Drabczyk wrote:
> I'm not sure this is what David Gibson meant in
> 67b6b33b9b413a450a72135b5dc59c0a1e33e647 when he said:
>=20
> "At present the valgrinding won't do anything useful for testcases
> invoked via a shell script - which includes all the dtc testcases.  I
> plan to fix that later."
>=20
> but if valgrind is called without --leak-check=3Dfull as in line 1038 in
> tests/run_tests.sh it always returns 0 to the parent process and it
> looks like there are no errors but in fact dtc suffers from memory
> leaks:
>=20
> $ valgrind ~/dtc/dtc -O dts t2080qds.dts
> (...)
> =3D=3D9428=3D=3D
> =3D=3D9428=3D=3D HEAP SUMMARY:
> =3D=3D9428=3D=3D     in use at exit: 286,968 bytes in 8,355 blocks
> =3D=3D9428=3D=3D   total heap usage: 11,162 allocs, 2,807 frees, 1,157,17=
8 bytes allocated
> =3D=3D9428=3D=3D
> =3D=3D9428=3D=3D LEAK SUMMARY:
> =3D=3D9428=3D=3D    definitely lost: 5,619 bytes in 174 blocks
> =3D=3D9428=3D=3D    indirectly lost: 106 bytes in 6 blocks
> =3D=3D9428=3D=3D      possibly lost: 0 bytes in 0 blocks
> =3D=3D9428=3D=3D    still reachable: 281,243 bytes in 8,175 blocks
> =3D=3D9428=3D=3D         suppressed: 0 bytes in 0 blocks
> =3D=3D9428=3D=3D Rerun with --leak-check=3Dfull to see details of leaked =
memory
> =3D=3D9428=3D=3D
> =3D=3D9428=3D=3D For lists of detected and suppressed errors, rerun with:=
 -s
> =3D=3D9428=3D=3D ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 f=
rom 0)
>=20
> If valgrind invocation in tests/run_tests is changed to something like
> this:
>=20
> VALGRIND=3D"valgrind --leak-check=3Dfull --tool=3Dmemcheck -q --error-exi=
tcode=3D$VGCODE"
>=20
> then `make checkm' fails:
>=20
> ********** TEST SUMMARY
> *     Total testcases:  2067
> *                PASS:  1552
> *                FAIL:  1
> *   Bad configuration:  0
> *    valgrind errors:   514
> * Strange test result:  0
> **********
> tests/Makefile.tests:92: recipe for target 'checkm' failed
> make: *** [checkm] Error 1

Uhh... I don't think it's accurate to say the valgrind tests don't
test *anything*.  They're not checking for leaks, but they're still
checking for use after free, use of uninitialized data and so forth.

I'm actually not particularly concerned about leaks in dtc, because
it's a strictly short runtime transient process.  You can think if it
as using the OS process as a rudimentary pool allocator.  Leaks in
libfdt would be a problem... but libfdt doesn't use the allocator at
all, so they're essentially impossible.  Between those two is probably
why I never enabled the valgrind leak detector.

If you want to submit patches which remove leaks from dtc, I'll apply
them, but as noted, I don't really care enough to track them down
myself.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5l/l4ACgkQbDjKyiDZ
s5LeFhAAgk13RQ1kO5tolrWtv4GaqYdb1zG1tRLVp8PQ8QL8tEWnMqqhNhqSlO6O
a6zDDWxQIfmy8s03W/ZrhJbA8m9mWG2TgXX4lHM21aL3f0FrBK0dFc/UtUZiKTyg
v/HvZ3h33zF+8HLqWnJHjo5ESsjdWx+MCm2GTYvlV910pBRuvePX/h3Gka7PtbzZ
W2l/MVBj+CRbq5fTc2YlsB+H1nyDF6wnDsaCM9J2KRJMLN3ayQvvbiyR/MIuSiCc
vOh5VRm+R/0oStEuru1J2TRCqmYCM/EXYmWCgCFWrzH/kVYHMwewRTbDRS6JjEUR
bAxC+M8e96CywZbuIHw/h80PXGNgVlN/XAvEALSYLALHMc2MlaoMWnaxvEiebmVo
YiNKzr/Vi+Vkp1sqOoOuHDTxNXj5tUlt19rg83KKIRpeVzjlK0GSD2yXqRtetbve
Owlh37pnJQgouVDN2iTPIk8Jb0nUQT+lXEjQsLQznf9scRCphfrDOH8hfb8ws8yK
fj0fbCjNq73KfFuQdohs5uaa2Vtrl9Spkfv/J0JuwycHNiF8LlJX/UFICaHgq917
WXZmDh8NmR2JuiLGjSNj/gyt9zoZ2JYzekrCE1KP4+W+qhsBAT1tlB5yOrxSZucD
NdT/rw4AplkCHbEmp3HhCCok0NeaFhFBwlBpLBoj101+3GYC8Ts=
=5Hsb
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
