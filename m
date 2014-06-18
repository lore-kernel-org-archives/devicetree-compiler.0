From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/3] Add a basic test for fdtdump
Date: Wed, 18 Jun 2014 21:26:03 +1000
Message-ID: <20140618112603.GI29264@voom.redhat.com>
References: <1403074825-5069-1-git-send-email-sjg@chromium.org>
 <1403074825-5069-3-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PMULwz+zIGJzpDN9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403074825-5069-3-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>


--PMULwz+zIGJzpDN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2014 at 01:00:24AM -0600, Simon Glass wrote:
> We can test fdtdump by comparing its output with the source file that was
> compiled by dtc. Add a simple test that should at least catch regressions
> in basic functionality.

Never really bothered, since fdtdump is basically a hack tool.

Applied with a few changes:
  * Added fdtdump to TESTS_BIN, so it gets made for a "make check"
  * Added the fdtdump test to the default set of tests run by
    run_tests.sh
  * Changed to a unified diff in fdtdump-runtest.sh

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PMULwz+zIGJzpDN9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJToXdLAAoJEGw4ysog2bOSR2kP/j1ILF5oTcDY2EMGkWbBHBuU
ug1WyQiNnU6sDhdQ8KbxnIiToU6qb6aK4uCIXvW78a66IMwV/98ckeml3D1WI34i
/EkFQQvj4gLZVH2v+RmGhvDYYOjlO+bX7M1j9g1ixHSZHPypXXfz/X3WQtQ8tbNK
cPfdrK4I9Q5dkIqoOa/9j4ObrKUfvOMAIagMS4BDL9tJEjVD50gBuYJTNacQyDCM
19eD/aVWpJZ9f0BmwqWos+5HREv/Jk/RyHxX5pQL14QQhlYrGdU/t7Z/PjVZcJBE
tZe2T7PSVmFvrXNH2uMm1LINVfllmHGFajtPF6tevvgbeee7fssYbnOjhKVjAfBd
ZXW1A8jeARU1rNf5K8NJer3iAF2EQnm99muaAJSomBV9L7eSDmzmeILRYoFBGjpI
RD0bqA160oCDdnWSYDsVast096fCQ75IxHiR5Oj7oDNT+rNNtr/S8RsV3Io4dwbs
5i1JkCN1SM3th/Si36rnS8e3WshnVheONXFcvzkC75A6JqBshzUGy7jzmamWot9V
LmcjSyoWsTqI1dJOW33IxzsYLr6xdkz+AGWb24m1CCP2AMwcVfRPgmAzuTVXRwN/
M7we7Ob4hYbYayiEGDiMHMbq/c/myMv9b3/1hRoMjkKFrwoHb95MqMtIFWbQ/E7w
Z1oYQD4AypM0b/GxX3vs
=n7LF
-----END PGP SIGNATURE-----

--PMULwz+zIGJzpDN9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
