From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 5/6] pylibfdt: Rename libfdt.swig to libfdt.i
Date: Wed, 5 Apr 2017 15:10:02 +1000
Message-ID: <20170405051002.GB13614@umbus.fritz.box>
References: <20170329181541.28856-1-sjg@chromium.org>
 <20170329181541.28856-6-sjg@chromium.org>
 <20170403043721.GD10997@umbus.fritz.box>
 <CAPnjgZ3Bj5AY2nburGFmxScH7-Ws4R6sxWZQkqNW3NxNt5-5aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1491371482;
        bh=BsRBTXuqak7tasPv8uqXkKJKk3seGn4QwniLKbKCMf0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VB3f9ZBRbMa1lU4YF0W2tfw4ScyWP8lp0nbjVPgxSoZAIQ3lRpXek65CGRaB3dJvl
         dyhcSOCWJUwofZeWwIaNj3VeIlLtRRom2WaqEIZoPxdJowxh+1ZzjvVNprrSGiJHLT
         0j8G4BkVHvXTY2GGAHSGcowGfSCklKTaiQKFOQ3k=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3Bj5AY2nburGFmxScH7-Ws4R6sxWZQkqNW3NxNt5-5aQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2017 at 09:18:18PM -0600, Simon Glass wrote:
> Hi David,
>=20
> On 2 April 2017 at 22:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrot=
e:
> > On Wed, Mar 29, 2017 at 12:15:40PM -0600, Simon Glass wrote:
> >> The .i extension allows Python distutils to automatically handle the s=
wig
> >> file. Rename it.
> >>
> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >
> > Uh.. please don't.  The existing Makefiles use %.i as a target for
> > preprocessed-but-not-compiled sources (occasionally useful for
> > debugging).
>=20
> If I don't do this I can't make the setup.py thing work. There might
> be a workaround but I don't know of it.
>=20
> Since it is in a separate directory, do you think we could live with
> this?

Ah, I misread your description as implying the default could be
overridden.

Ok, I guess we can live with it, if the setuptools stuff really
doesn't like it otherwise.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY5HwkAAoJEGw4ysog2bOSfaMP/Ru5LrlB2+XPvmVYTsVfSpWZ
l3fv/WWIhu4z+05uKjwOGbVmZbFkCop3sZe/fdGwMbBrOPxedIT6C6qm3CzdIIqo
mBY393BwxZ4LC+cGa2J7MeriD/30s9zj1f06VuvwlVX9u+MYH/8TxjmB9tNt72Zy
vMrOu8fZZUzjAl28bjXL/bPCTGpowue9yfWXxUDyZnqB7aI5KYHG/eBXPUi8QpLN
JhQmhHXK7/tTLjTsQTFWrxehOsTTVd8/eYCngGM4GteXfVU/dGD2Y/T7zkdVosr+
eo85pJOvC+tpTEEkNstM0MG88WsBb6iTpE1z+NRV33l07NjUne89GypSLFJ3TN4q
4EVqLixX7ksw5Pk3rfdgY3Mc/DaIhf9RbGzji2IAFCesFPNPZzhHQ8WDw+AAaRPk
rAWjYzJWkA/rxjhfrih/8ImLDJOa3x5BvVxpdCoyUZS0UCm5L7x+VmqJEY78KJeZ
6W7NUeCAFjmI7Fzq7isS9FwbXFBLePOsc5mtPR+NscdZrCHlwclsvSyYOaLELpjZ
h4+mIRc16L0mGVFs+0Fy1WRF7Rike8pYic6JEq3b26Ddf+S1cjd2ijASaxO9FO05
SgLLgg8k1jTUimVVj27nWhcwVFDNLDvshCMSaBk7FiB55gjgNokInKg3m7M5IlgG
yLIrwI+9oA+D+j5HEq+h
=GLcV
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
