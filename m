From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/4] libfdt: A few overlay fixes
Date: Tue, 11 Oct 2016 10:16:06 +0200
Message-ID: <20161011081606.GN3462@lukather>
References: <20161006113959.30865-1-maxime.ripard@free-electrons.com>
 <20161007040835.GA29155@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="H7cT1SUwsqXggVRO"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161007040835.GA29155-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--H7cT1SUwsqXggVRO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 07, 2016 at 03:08:35PM +1100, David Gibson wrote:
>   - The testcases re-use the same file name for the intermediate
>     dtbs.  That's not a terrible problem, but it can make sorting out
>     what's going on when there are multiple errors in a test run
>     harder

I'm not sure how exactly you want me to fix that. All the overlays
have a different name already. Or do you want me to rename the base
device tree as well?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--H7cT1SUwsqXggVRO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX/J/GAAoJEBx+YmzsjxAgELAP/j2MWEqjD3bB6TnOf679ZAVI
M3EP8WlFzYOBgV7T/81MLYn07JUVZ4C6l3YCVAKbtcu3zujqu6RT9KSmQGVZvg4j
4SM9leldZSgBFks6RBpPOK3s5aHgzUFFJxR68u592CiMMslyTgM+wrfcWGC5ych8
y2lW5LipvL264Xe3HdBzslSQedr89UU1I19I9R47P3ys6MpiyQBF+YZi9QVg5u6k
3efY9WxIk6sZ607DVq67MS40gLrNaEgsUUeKu8Q/RCN1P/cGYe/wCdfJru+mdHFG
gNvXCDr5DgVvC51Q9U7yPbDWwrPTH2l/iALl1fiaOvavtF3UEbZpC+WllCdbZ36x
Mwxa2mEhK3uBMfAy1xsk9hewsP+r1YP5dcG/M0QhYeMl/kRlv9T01A6gQv6kl7rX
RR0Ha+WyURLY3B4XVk4Ul6neb3bxo7+86CzVCaE4Nw0dQ71yLqJjxO6SjiaC2l/a
I7zSjG7l/8Def/r0hxmhwiRIrKRXrvvwyTu139jTwDmXsBEz4u1X2O+PQjc3W1QO
f2VKnmwEknLM59umqFgPNYOyexjN885wi3sVpalNynm5xwF1j7/DPwClZ4yW9jP3
6acfc6znJL3/7L1otTmSAZqhnUPK47Tr8z26VYDPdDzLs95e/AtXXFpx/ELku5V1
31FomOoEadTerFJhYn1T
=r7mj
-----END PGP SIGNATURE-----

--H7cT1SUwsqXggVRO--
