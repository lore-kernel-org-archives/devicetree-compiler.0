From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/4] Microsoft Visual C patches
Date: Thu, 19 Jun 2014 21:14:59 +1000
Message-ID: <20140619111459.GM29264@voom.redhat.com>
References: <539DBFC8.4050204@errapartengineering.com>
 <20140616104628.GB29264@voom.redhat.com>
 <53A1C5FC.9040105@errapartengineering.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tpyx7gKuSYt+mjHM"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53A1C5FC.9040105-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--tpyx7gKuSYt+mjHM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2014 at 08:01:48PM +0300, Andrei Errapart wrote:
>=20

> commit b8ad167d89d7f5ba6398ffeab6a7f9ece954f208
> Author: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
> Date:   Wed Jun 18 18:43:17 2014 +0200
>=20
>     * MSVC doesn't support 0-sized arrays.

Ugh, this is by far the ugliest of these workarounds, and the reason
for it in the code is really non-obvious.  I'll have to think about
this some more.

>     * Initialize check->inprogress, too.

Why..?

>     Signed-off-by: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>

I've applied patches 2, 3, and 4.  But for future reference, please remembe=
r:

  * Patches should be inline, not attachments
  * Commit message and signed-off-by lines should not be indented
  * Commit messages need more details on the reason for the patch (see
    the changes I've made for examples).
  * Commit messages need a 1 line summary at the top (2, 3, and 4 have
    this, but 1 doesn't)
  * There should be a blank line between the 1-lite summary and the
    remainder of the commit message

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tpyx7gKuSYt+mjHM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTosYzAAoJEGw4ysog2bOSqoMQAMlq2GTuKqMt6bz+KNxx1Fum
b97YmdgfOWCIKIjou+K6DDu/wHIINw/zPJflup5M04Jv21X9gWE4NVY6Jqc3X3WY
qeVjJQgjogeGrENGcMORCdhKyf8rwUCife157gt4EurloToi5Pz6F9UFNJbr9XJX
L0Mxu2r6+Qve4RhOCFvR+e80wxbsmdB3qgitDFQWuhHumqA8J3zulO6Su4yE8ubi
aCi1N+4E1+7aPteV78rfOstXtJL8EQ8v0qdVGaUEFQcSNscMVozY+r43D6FzTI//
UNORUmGPrLdqY9l+7kXiSOmeY73at0LgFTz5zObXiNWOaCPtlwTnm+Rr7izJ9MD5
+eTIyy7J12cc/MJ0znH9+67TSS3ap0mwYIHzgWcESWFl45cgkqqXIWnKRqnzytrh
DuV9PsjqxDIEf06dTntbXZDix0lta29LKNRstkZTMi8bT4PsdODzc344ouPTV3K2
H6gdOdoO07qVSZgObskpSWD3Xr/1dXpy1ONBOb6BsywLE9aZLcWKbRqgpFB171Av
bg29QHjkKUTO2msYDzEp0VPrOtKmQiKAf/TEPUa6bYO5ztNq2+yzUVoJyIjFWBvs
u5i0iy+sVfEr6UBkLUbHYbYQZjQrXZFLlhVcNMp+sBxRKiIG+oFrstOBchm2ZK2K
yK10DEDGYhthx46UDwy7
=0Swh
-----END PGP SIGNATURE-----

--tpyx7gKuSYt+mjHM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
