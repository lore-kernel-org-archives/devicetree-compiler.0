From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/4] libfdt: A few overlay fixes
Date: Tue, 11 Oct 2016 00:40:35 +1100
Message-ID: <20161010134035.GK22498@umbus.fritz.box>
References: <20161006113959.30865-1-maxime.ripard@free-electrons.com>
 <20161007040835.GA29155@umbus.fritz.box>
 <20161010100819.GE3462@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tBhgiDt8dP1efIIJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1476108459;
        bh=9Zz0s/B0P8YC5ImUqExpeR8k2hYY2aKuTW80J0EhhtU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d3Woqhu4tiYob30AUv+dcZ09MmInAdA3dt/8UOicR0wRHVSlv6XKtxGNLQkcE3sbv
         4lYYgpCIke2T18VAdR9X8glIkUSbf3OM8YUiDLg8fTUHVGCWaO1ECw81a/BIDW+3jS
         G5S4w3O8KbJ9zulGNBGFsi22Ecg+re+M57RbjOZI=
Content-Disposition: inline
In-Reply-To: <20161010100819.GE3462@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--tBhgiDt8dP1efIIJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2016 at 12:08:19PM +0200, Maxime Ripard wrote:
> Hi David,
>=20
> On Fri, Oct 07, 2016 at 03:08:35PM +1100, David Gibson wrote:
> > On Thu, Oct 06, 2016 at 01:39:55PM +0200, Maxime Ripard wrote:
> > > Hi David,
> > >=20
> > > Here are a few patches to fix the things you requested and a few bugs
> > > encountered while doing so.
> > >=20
> > > Let me know what you think,
> >=20
> > All applied, thanks.
>=20
> It doesn't look like it's on the repo, did you push it?

Oops, I did not.

Try now.

> > Couple of other little errors to correct if you have time:
> >=20
> >   - BADOVERLAY is listed twice in the error string table (a hangover
> >     from when there was both BADFIXUP and BADOVERLAY, I guess)
> >=20
> >   - The testcases re-use the same file name for the intermediate
> >     dtbs.  That's not a terrible problem, but it can make sorting out
> >     what's going on when there are multiple errors in a test run
> >     harder
> >=20
> >   - Generated dtb/dts files during the test should generally have a
> >    .test.dtb / .test.dts extension (makes gitignores and clean targets
> >    easier)
> >=20
> >   - In order for the apply_overlay function to be usable from the
> >     libfdt shared library, you'll need to add it to version.lds
>=20
> I'll deal with those this week. Thanks!
> Maxime
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tBhgiDt8dP1efIIJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX+5pTAAoJEGw4ysog2bOSBegP/0mS2Y7WQtrNYmftull0ERrC
NL2LwEJheyQhG3M7Z6GWw+bHefB9w89USdXC3H2s7uULa2ud6u6B4ZvsnUBd8rgH
HzBVyvXKyPmw5Xloyq/eSt/QcO4vJ4KHOiZ50xXnxuu9N0tHdgBtwf++vZv15VH7
UC732av9SeZybY1k9ka+AgjehedYTrbIMprJTIAmxGP0gB4+AEYcwAQTVw5IhXt+
hoHONZ854Yu+9m+ufJqQpT8eBuL1ZvKoqCaemmwgrxG4PRu6C20yaogOsciIEwba
91jy1W0gFD/IGJYOt0+P/3YPWYxyDp6/SgLa8tkemNWHxzFPgvk44/U2C97LPomJ
hyxWJzA48T46RzlnMbtqpuQCK3cCA8dZHbJhFr2PAff92m1T49+nu/Xo2wYalp+X
71enve9ehQS2QhBBr6H2zsHVKKjMqDsK7pXfxd9FANHEjPQuygOg+Gu2D0r6LPpA
5PwIyT6NsSBx9C9P/ams3dZ1uM4AVVLhWoJC5euSO+yJFjfg61zuR3r3Jr1JiKPU
GMWPBm2mwUP7le+/Kbscj5k+SJD/yWoJXbyNiiX9EyA0IWIcIoA/P5e3cSxNa6ul
5sqQScZiiizPb+zKQ1T0Jd8ujbVbKHKaY4VpMrC+XBXbU18bzbZrLVckjfrO5xRC
8Hh5OU0h/aj8Z5afAWgf
=UT9Y
-----END PGP SIGNATURE-----

--tBhgiDt8dP1efIIJ--
