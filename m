From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 0/8] dtc: Fix signed/unsigned comparison warnings
Date: Tue, 15 Jun 2021 12:56:14 +1000
Message-ID: <YMgWzreTlQPyXaEE@yekko>
References: <20210611171040.25524-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hvURL2ievAf1BtMf"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623729378;
        bh=l8gpxNYiSvxjTNc8HWAw59tdgJuCLdQSqz7HvLBO4Gw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AIfpo1kxuI8QABwmbfLyZMuIe1YxTqoJJ/37Z3vc26dT1M7vP2ugLjMw10A0ziXQ6
         VOQArkD5BE+MQxN3Z4iwIGJOcJDt7Ic/qEdaglT2sywAkPIS0OIjGSWnW4/YAn+gFq
         tNGKK6G2xi24ZkWo9azY5/LLwK0E6LK/U+VyxXQY=
Content-Disposition: inline
In-Reply-To: <20210611171040.25524-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--hvURL2ievAf1BtMf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 06:10:32PM +0100, Andre Przywara wrote:
> Hi,
>=20
> sorry for dropping the ball on this, but here in an update for the half
> finished series from last year to fix signedness comparison warnings in
> the tools (dtc/tests) - the libfdt fixes were already merged.
> I addressed all (but one) of David's comments back from October, hopefully
> this is good to go now.

Thanks for doing this.  LGTM overall, there are a few little nits in
implementation which I've commented on.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hvURL2ievAf1BtMf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIFs4ACgkQbDjKyiDZ
s5LUjxAAyNUJ35ihuh7PJjAt5yXFTrf0XnrEEAzaoahCLw2/mlt2nPhAotNevY+c
O9OAbtGU/vtEw5s0I9/+K0DashkneWs49H4uCSSGRJGyqEYofj1SAt7dBhTW3Z95
kRAbnB1W9cEsVk/k8OsdE5+bql261n+GED2zqF8SS7I5FEgmPxMC4GRJ1oDSztlZ
tztgO96f6R3RqdaNVawH56N3GFoleU99K3fhs5hhXylxSQFvbr/tiYtCQzq9f5nY
CLeH1mQ/rsqQxoLCnVfKUdGASNFR+YQZ6lKfg0EZh31Rvy0PaD61jfdKeOmi2eE0
/+8bOX4U9zKC33Rleu1I+V3bMK6AExjuJrMQIJsMYDSYhC4j8fjllJjHnQyhpwfM
AaJ9UGaNaluDP3+ZiVKACQt/0vAd6DQ+11LXAHFuewVBHz+N8x5oR08gCM5ze9Jr
KVDViGoy/HDSvrnoHsqD7vL6KjbuQCddZ3ncVmk2LEjQBwdlaN+jj1Xmra6PoCuN
3TE6HQ+tcla6qDXluYAtMFQB3vFgVYVrFMtFvhPnL+Z+quc188K5Bajgs8LErS7K
EzxwJwPkd01IVtLaO6X01Bqu1/ql3+s+PLaiSYwCmcAmzLl3/vZZwZ0SNKYemwKG
w1LLKiqxlROQbMUJBoYEIOfc3MMc6RA6BmQlzBFbGfRrnKrUX8s=
=OIDO
-----END PGP SIGNATURE-----

--hvURL2ievAf1BtMf--
