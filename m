From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 0/8] libfdt: Allow more control of code size
Date: Mon, 24 Feb 2020 16:46:39 +1100
Message-ID: <20200224054639.GG1751@umbus.fritz.box>
References: <20200220214557.176528-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qftxBdZWiueWNAVY"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1582526631;
        bh=JeeCrNuuwr58gACwKZSts1DhOYVMeVaufokCQg9neKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jRTZ2nYR1jhLWRs0isYVKnXcqlhYVWGsNpZENsH9To7V6+tHJylXVun4o22mHLGw2
         IQ6BZvtoZIrNt93WQi0gDnIr4Ir9c12TAxNjRUk5ZkzjwP77gmoOFFyXEjU43w4dB4
         O6yKSk21KWMZt/b4mxviBMOog2QJWLjyPr76FNF8=
Content-Disposition: inline
In-Reply-To: <20200220214557.176528-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--qftxBdZWiueWNAVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 02:45:49PM -0700, Simon Glass wrote:
>=20
> Since v1.4.6 libfdt has gained a number of checks for incorrect
> device-tree input and incorrect parameters. These are valuable and should
> be enabled by default. Some are basic sanity checks and some are designed
> to avoid security risks with carefully crafted device-tree input.
>=20
> However the checks have added to code size to such an extent that many
> U-Boot boards can no-longer build/boot in SPL. This has prevented recent
> versions of libfdt from being used by U-Boot.
>=20
> U-Boot SPL generally reads a device tree which has been set up by the
> build system and is known to be correct (e.g. it may be cryptographically
> signed by the build system). Therefore sanity checks in SPL should never
> fail, and just contribute to longer run-time and larger code size.
>=20
> During review of those patches[1] the code-size impact was discussed and
> a possible solution was suggested.
>=20
> This series adds a new ASSUME_MASK option, which allows for some control
> over the checks used in libfdt. With all assumptions enabled, libfdt
> assumes that the input data and parameters are all correct and that
> internal errors cannot happen. This allows U-Boot SPL to continue to use
> later versions of libfdt.
>=20
> Within the code, preprocessor macros and an inline function are used which
> resolve to true or false to control the use of checks in the code. This
> seems better than using '#ifdefs' throughout the code. It also ensures
> that all code is compiled regardless of which checks are enabled (useful
> for build coverage).
>=20
> This series reduces the size of libfdt by about 3KB on 64-bit x86
> (about 6%) when all assumptions are enabled. Future work is planned to
> reduce this further, but this is a good start. It enables U-Boot to move
> to the latest libfdt.
>=20
> Note: libfdt includes a number of assignments in conditional statements.
> I have only changed these where necessary. It might be desirable to remove
> them all, to reduce the output from checkpatch.pl.
>=20
> Series available at https://github.com/sglass68/dtc/tree/small6

I've applied this series to my tree.

There are some things I'd still like polished - comments on the
individual patches - but those can be done as followups, they're not
fundamental enough for me to request another spin.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qftxBdZWiueWNAVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5TYz8ACgkQbDjKyiDZ
s5IPIQ/+LrzecWXLtEPiH4DAJW6ZwBSR6tCz/U8AbXoLQlBhNTwFSfRrSHckkMRt
6tQYkpHsSOzu5zreb270ZEbFwWYOCNZyS76WICbnBwYfRlfbpXZkmdxhatnmGMPy
xkWZ5eujbgQiRoua4SxtpIa7hemM7jKKmRB2gPWw+JRN7udGAdvsxTqjiPtNktmn
yU5fkFyp8Oa3BYQLhYP7IbsH2hWN3PaDTOiVZ3JDwITqSzzObEocROtT//qRB5nP
UioyyrkpPyXS8jtEA6hF6OdqI6pGT9iruIazKhpYi5uDoLI4R8gzn2ZjAywE0hGV
q3S6fSZkrR5WDOj2exVHG2ADZ6G27rrq01JWcA0agnRAraxocuREehiVDK9MDsuY
lLtNuwH2Kr4eZCjjnSLOGSBxJSKSl7QZW7UyE31LKF8O4YQWyKnPQ2ne5H5L2GK9
SksCzpKhbLBp7gm/OPphOdf4r1YXPxk3QaguWDK1HzgtbR6PZ56/kmBFvcNg2oVZ
3jd5krNn9py2vzqzBHL5mRTR+NH12Kif966OLnKSmqBmIdUm4l/bhDNGCwxWU5aO
KR6okz1KOjf0RnXzs77pWgWc4vtjAFYiOqtcQbdJ+ahtqZOwUMGkr7iPjuUGK+wg
ptR8yFNJKQVaTcAF5yT3RXM1bIOo34KklTUYQQZxMEklBXiRCP8=
=k0dZ
-----END PGP SIGNATURE-----

--qftxBdZWiueWNAVY--
