From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: DTC 1.4.5 Released
Date: Wed, 27 Sep 2017 21:01:15 +1000
Message-ID: <20170927110115.GS12504@umbus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Pa4xkLBhPDIhDLv1"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1506510079;
        bh=K850z509F6k4V8dfKn5YdVeyMEWx9e4DGCzbezd5MzQ=;
        h=Date:From:To:Subject:From;
        b=RpvdL7kMpWQ/ruD8WrFZUG0XMFapfBMDnmuy90l6/BT+3pJoh4y/KtjM8MszB/aL4
         I1owL8t77PK++kaEPGSTUspSAr9r0gHlAFXu8IS0k2w0FSN55KXnPL88nbs7aYq1oF
         NrZoFddoFUiDuMcQUy/U45unfQR93KUn5iw6ZqQ4=
Content-Disposition: inline
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Pa4xkLBhPDIhDLv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I've just tagged and uploaded v1.4.5 of the Device Tree Compiler.
This contains assorted enhancements:
  - A number of extra checks for sane device tree content
  - Added pylibfdt a set of Python bindings for libfdt
  - Add a command line utility for applying fdt overlays
  - Assorted other minor enhancements and fixes

The git tree can be clone from:
    git://git.kernel.org/pub/scm/utils/dtc/dtc.git

The pre-built tarballs can be downloaded from:
     https://www.kernel.org/pub/software/utils/dtc/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Pa4xkLBhPDIhDLv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnLhPkACgkQbDjKyiDZ
s5Lrpw/9EOQoyKZxS1jgzYPkRdx2SNkv+KVNX7k8XAf+HG+QN4pCJAahwZp+1UMJ
aWXgVIKerTtpUnbqx16aAxNnFRERCVVSGkTAJshptxcDMDrn33afbDcResO5NWDU
/nbJnCn85nk3GA1+ihCw/MYIavRzhRPJE19UeUj+dDHMtEIGMRs2A4+jGdpJpsjh
l/QAW2/mOhRj95M/uqzDkHiSeMUwCfu+iSgAv1jrfXO1YhjOM8SD0+5MO6TQo9SV
Du1yq0AMuPJUfiOjOAqRkZaSRfCDtIauls7EwH64rO4k7gA+5H+n5Rs2gnbOvq2i
/NFD1AxgG1noeCK4Qdt5cdcRpWfFVgfNMjZPcXc+HPn0S5X1HC6JzuYiqhOnRFWA
7M9m7iFRKMdDIxHwYrrplMn1AO6FeR9YZpkpoLVeUrerYCyQJELhO4yySRw3ECUf
18EhPLJlTjafsy1E5twaUIldpETFsqH3nn9LSs1RDrAhplzspv+CrRu/Ertdf8ur
YKP0NttUyxoQtfnoE210sVsLCXrugg0cgY7jpjWE5pP7y50+Uo6Tq4VhC5E0bn0a
UDU1La5oAsFDgkX3z3gEl7tDQB3AlDbh+umxzE/v4uZpL7pxEJHlpc2hUhT59td8
mo8QL/fd+nmNfTMWgB7FDVOY4jVA+S11sNvAfcNzw2kY6CVxyko=
=vDL6
-----END PGP SIGNATURE-----

--Pa4xkLBhPDIhDLv1--
