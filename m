From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt/tests: Add fdt_path_offset_namelen() test
Date: Tue, 7 Apr 2015 14:49:42 +1000
Message-ID: <20150407044942.GC3476@voom.fritz.box>
References: <1428206756-27160-1-git-send-email-peter@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1428206756-27160-1-git-send-email-peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 05, 2015 at 12:05:56AM -0400, Peter Hurley wrote:
> Add unit test for fdt_path_offset_namelen(). Verify partial path-
> descending retrieves the same node offset as fdt_subnode_offset().
> Verify parsing correctness with multiple path separators, both
> mid-path and trailing.

Thanks for writing this.  However, looking at it, I find the way it's
doing the path splitting a bit impenetrable, and overly tied to the
expected usecase of fdt_path_offset_namelen() rather than just its
defined semantics.

Instead of merging this, I've merged your original
fdt_path_offset_namelen() patch, plus several patches which extend the
existing path_offset testcase to exercise fdt_path_offset_namelen()
and cover some other edge cases.

I did spot a case where the existing code is arguably incorrect: using
fdt_path_offset_namelen(fdt, "/somenode\0foo", 13) will return the
same as fdt_path_offset(fdt, "/somenode"), although I think ideally it
should always return -FDT_ERR_NOTFOUND, or some other error, since
node names can never include \0.

That's not an important enough problem to delay the patch though.  So,
fdt_path_offset_namelen() is merged and pushed up to the usual git
tree on kernel.org.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVI2HmAAoJEGw4ysog2bOSXyIQANLErzZxDtw6fxeYkOz2ZI4/
xuOkYSx9i0oo2fvJXG1r0rgiPt18ypGPoKpJ/Zq4vDU5zh3P3gNfzJb+mKDURoiW
8fYsB6taDNxt2vINfLjDChdLEgp0edWfsNgS9QabjQsqeme+1kF/DX+togpMYBLh
NXXJpp45cfN+DkC1xs9awkaCZ8V4vuyDU+PzJHJIUu2Ar5pXXR2deUDAGE7ozE3E
QKzhZajyOWHOunBoWvqcziav0llqVrdvccI6y1UIzYHndTFYDiDEG4wlUn/k6e/R
E6mUSrAwUbuaEY3jZHLFnMYBpFWeWT2OXBWgu31POlhFMw7DkX47ZNlifVF8wlkP
l8IUvM71Jp7NMcBRdv670YMKGNunIvWUgamXktnuNEuZefXGcGFvLD8IcVafuU05
hJFpnQ2hndRNu658zgNxp7yn1ddCqRQXbAJNCjkfaAmtqdbLhldYuXnFsS2bEv98
WTqQnUV22DdzSua+0vwS+uMqMCvAiXNeR5SKT6J2LrSD2BMhq1bbQ9L3Rz+B9drW
t8kLmgsDXHDgNPTC04CGMXXqBeAmFrrT84R2fep5wQ1+FSkjt3R1US0UVgD9pfvg
qU8JWicg0I1IxjIAmJs2l0rKvCPm10t7O/2BR62PEJcNE2j0cvJxPeCd/KSWtrf8
nRz0/qHLm2luIokDs0iH
=fRzy
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
