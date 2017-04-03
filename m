From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 0/6] pylibfdt: Add installation support
Date: Mon, 3 Apr 2017 14:37:52 +1000
Message-ID: <20170403043752.GE10997@umbus.fritz.box>
References: <20170329181541.28856-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bi5JUZtvcfApsciF"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1491194282;
        bh=qRc/YYpuk2cnNLPu3CiXyhLNPj0L1GKWDwn4JUbDuD0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dl7Dl0vVxiiWyzAfvYBQIpylZS+Lj7h/vBMu300b6xALUvxvQlgUxGZyGqqZq/AO6
         hOxsT7B4obaDeVLy8Ig1hEZc23drzk5jM6zsZFi9X1dZo/jK7mbwkprOnfdUGCU4UF
         CXTvfBtSTuYm69fG0W97P7/Gu/WdEldu2jUJD6Xs=
Content-Disposition: inline
In-Reply-To: <20170329181541.28856-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>


--bi5JUZtvcfApsciF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2017 at 12:15:35PM -0600, Simon Glass wrote:
> This series adds support for installation of the Pylib module. It adjusts
> the setup.py file to provide this functionality and the Makefile rules
> to call it correctly.
>=20
> It also adds a way to disable building the Python module. This is useful
> since some build systems want to use setup.py to do both the build and
> the install step. In this case the correct build commands would be:
>=20
>    make NO_PYTHON=3D1
>    make install_pylibfdt SETUP_PREFIX=3D/path/to/install_prefix
>=20
> Version 2 adds support for running setup.py stand-alone.

Sorry, I already applied several of your patches from the last round,
but forgot to push out the tree.  Can you rebase the series.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bi5JUZtvcfApsciF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY4dGgAAoJEGw4ysog2bOSlyEP/Am/5hrGwz6Xse1ejqFQ0UPC
d0LQxQ313q5SsiS1PUhJNIW42+JyivfOI+icCRE9+H6nFZfTX3L/m5S9WNu1Z5l0
iddmCfTHRxXmRM1dsEJep12FWReKiiZWsCeTKBFotSStUHXkpG22yMzNDf7oYOgY
H3bKFCYMWeCeDJ3pEerEIyCsHsXRdTUjE1CXU4QwC5ZKTOwuSOUfw8z4QBF+0k7/
UwQ0moFYRDMBk5UeANZRxd0WMIy53N3sTXzuVLMpEsUWdhlThpYQX+P9L3Co8meb
sy/hQbOBAT/Z4tKs2PfKugIxRDVn5vlcsBJZE0k4+J0Mk0OJj/09Mguvkgs2JCfl
gL00NaMf1pquLWQ4LWZDzJ1rN1Ph+ppPASNw7flV7biUYOhotzigUFxszcyfEIQp
EWX4trum87SBrC9qY+soIh+CSq6BswCQw52308BvqS5iawYZd6ybe2JqCm3TW1Gg
Cu9IG8jxWUg3IiATOdnklszJrL7Ire9BbVLAEh8puAUp7JBwrV6cW7Ncx6dqP2UQ
xCJ2HO146ABWt4MNgJuwNibe46XtxZEBgGzskBkYkPBmhCp5Isy8U5UcktA+YftZ
wqu8DBBR9LeUjVK+bPVE15O1XAKTrwJSrmFFYvLLvisxUoHjJVCgEvN8eOFt4hel
nNmcNqO9YWSjAnIiZabA
=45qN
-----END PGP SIGNATURE-----

--bi5JUZtvcfApsciF--
