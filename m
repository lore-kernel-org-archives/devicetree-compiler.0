From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4] Add limited read-only support for older (V2 and V3)
 device tree to libfdt.
Date: Sat, 27 Jan 2018 18:46:38 +1100
Message-ID: <20180127074638.GG2099@umbus>
References: <20171208063149.76523-1-nwhitehorn@freebsd.org>
 <20180125051340.22391-1-nwhitehorn@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Sw7tCqrGA+HQ0/zt"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1517039213;
        bh=c815SOagqkrKDUU1uIjsM1mZ8vDLy/WfAJIVlQBch6Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C77w4VwQZYtJrfuTlt6QWQST3mOclgfI0u2ePjv0imZIwydQ0dKxhVolsceC0vx2g
         MYxJzyDGoFbh1F66ebxWfsTh/tctbgl9Cxvg8Akz5Daw51t5vFn5dQyLpHOoUZHZxb
         MRYAgTv3EsN+UGTYqUziDboTGbAfyIlX3ZZ2Z+UI=
Content-Disposition: inline
In-Reply-To: <20180125051340.22391-1-nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Sw7tCqrGA+HQ0/zt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2018 at 05:13:40AM +0000, nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org wrote:
> From: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
>=20
> This can be useful in particular in the kernel when booting on systems
> with FDT-emitting firmware that is out of date. Releases of kexec-tools
> on ppc64 prior to the end of 2014 are notable examples of such.
>=20
> Signed-off-by: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

Applied, thanks.

I have fixed up the whitespace in a couple of places that git am
pointed out to me.

Testcases for reading the old format trees would be a nice follow up.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Sw7tCqrGA+HQ0/zt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpsLlwACgkQbDjKyiDZ
s5KfDhAA4Jn6Bvw2mM7Q3Zm9NGJFTUG/yhYrKnqxl25IvsNoyt2mcyLUZogpc7Cu
2yiOwa12BZq2RF8oppSeJ75Z9OBucnvxJXjilbCiUdrpPVtQP2G+ptsZ5dZURPib
v2840VOyCHu0zj0lknsTpBErpsQkqqxU7B1x6nxcTf8P+Vs2/EIoG3UW1t4AszQQ
PUDjDuH97wiG25BcbBFUmzVQUc02s6fvx7mxoSujEK6gS6CAgjENstdqAKqHDlrp
C/IKVcjUYdeUN0g0BMpeV2F2vAVsCUS+OYoqrc1Y5qbS2TuIBphNW59CAj/v+fcj
0Na6McWw5sxEeQJNksoJsI61gMbsoyLyRicrjTKm3wVkr/oVDGY15WNC6qpuz7TY
QQ6RChAyDxUKim28B7a0Wga8TiXCTBo6J6l0LXegLfoxOcOJXBjSpdmbvEe18K4D
uG/UwwEDpOssqFPFXx4n8ofwe+t8Tj5Ci9LxPuWnYQRDj0FXLI0+84T9Zv9jspra
bFlGeBuSJCgz2TouK7NkdwQUXIc0edP3hVaoqQJkpWZLpqQdGe2ctPb9kKEMzrTs
Xqta6LabijFn//XugePYTe2Z3mHLf2GavAm2pcIYtTtI7gayW1idrWi8k4WPy3Ci
p2mG8gVPGMiNkOecerN0IO2oUf2FrOgPthwontUXNkI+OqFxiXo=
=wi+l
-----END PGP SIGNATURE-----

--Sw7tCqrGA+HQ0/zt--
