From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] Fix some code nits
Date: Mon, 7 Mar 2016 15:38:34 +1100
Message-ID: <20160307043834.GI22546@voom.fritz.box>
References: <1457320368-27248-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J+eNKFoVC4T1DV3f"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1457325519;
	bh=mheXGcNVAINe3y9gMl+1LjVqVfa8wGYCtnMI4pFedEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYaaWB9H9nWQPSaE5d4MV6AQw2M45zX/jyNRph2tHsVLSvjqVoNj53H75PsoEOLrX
	 aDD25+RhjkdTVCd/VMRMeOjokkHwlPclbwoASFlQdUNgfIWhvcOhT5iaAsK23oT67f
	 Wrs0PvMrLd3tuq9gqa+ZYDqWxe+kIsiwjMPr8XPU=
Content-Disposition: inline
In-Reply-To: <1457320368-27248-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--J+eNKFoVC4T1DV3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 06, 2016 at 08:12:45PM -0700, Simon Glass wrote:
> I notice these when I sync with U-Boot's copy of libfdt.h. I'm not sure if
> they are considered incorrect in dtc, but here's a little series anyway.
>=20
> There are still lots of places that use eight spaces instead of a tab. I'=
ve
> assumed that is intentional and left it alone.

Applied, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J+eNKFoVC4T1DV3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW3QXKAAoJEGw4ysog2bOSKs4QAIOkLu1XKyuk2aIE3C4fc/Ip
Ree45ClNjl+vlMVcb3anMYTJ11dLPG5xBu1EH4yPutFkG5f3KyvwSJu5Yb3UaV3M
4PG4d4PodvRwb01qLfVxm3daDKo2Hu3jU+OEB2aVsFsPEzRcWDYmN1es0yWoMH0E
rW1eQWXBkbpSInJBvYjI1oxrKnhl9xw+qXOh44+wjOlMtt0v2p3S8Jpbvv+plkob
WaDwyxiLjl5f63Zy0CFDtl3BL8TqWzynJqqj+TP2HuMX8BFM7Vk1mInTLwbBbhbi
G1gwcYRTj+PYJxBNAFurOsqBm8ZU1XLI+8p50GCAnjAHfvDpaIN+s7OYTKJFny3N
XGQ/aeAX5y6IUpkK3wSd5VYh+yogzzxEYjuY0Czc5qX4HUgXGJrHBhlYhg0sfsxl
pZLYmVPitSg2ejypfF9MQmEyvkSAJC4BFtw3cUgNqQcPbnjAgkdFMJiiAunlCtLo
VdQufAYrEfaxBq85LGPAmVifZQhzbdZYTBnLyaOhNInKsvlVX9jPiGoaXdUU9hGz
nJ1wjvwBMfz4V/+cyl3yEYBAfqV4b+aEsqBG1hBGdMY1dvFzATgxc9N39MRMuX8+
4Gc91fjWzSGovlkYfKC7xTy24eQMThuVoJRfXqw6owBH5qE92swDxRxpeEy2WYo2
xUR+jI/ZUQaccVVQN1jA
=t7HR
-----END PGP SIGNATURE-----

--J+eNKFoVC4T1DV3f--
