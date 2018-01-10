From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 5/5] annotations: add --annotate-full option
Date: Wed, 10 Jan 2018 19:50:04 +1100
Message-ID: <20180110085004.GI19773@umbus.fritz.box>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
 <1515418607-26764-6-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FK65GREB+Evh/hTL"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515574225;
        bh=kNaa709urEZYJcpvDmh83aEAM9m/NuChmRUZO9VgUnE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nol++gcbtHA849+ToLhE1ewKeEUktVWewY0fizTjOpQuCNJPrOtpNNtJhdVDFiN+n
         6CZPnx2pD6bR4w/LUlyg2XcC/jpX5Z8+QeW5o3h1ADVgxOzCK+47hy55Rrd6t+rWXQ
         FZBUjSJKhv1vHuuWWpmYaWQwreMlpLB7kmJc+DPI=
Content-Disposition: inline
In-Reply-To: <1515418607-26764-6-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--FK65GREB+Evh/hTL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2018 at 02:36:47PM +0100, Julia Lawall wrote:
> With --annotate, one gets only short file names and line numbers.
>=20
> With --annotate-full, one gets complete paths, starting and ending line
> numbers and starting and ending columns.
>=20
> --annotate-full indicates no-file and no-line for things that are not
> connected to the source code (fixups, symbols, aliases, etc.).
> --annotate simply has nothing in those cases.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>

Looks fine, except that it will obviously need a little rework to go
on top of the revised earlier patches.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FK65GREB+Evh/hTL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpV07wACgkQbDjKyiDZ
s5JfZw/+KwXOkhTBGOWYeqXx/oQNh+XYDQGnZ4DvzgTVhu1nBcZdMv4UDqFA/HKs
A25mSr4ad+yZrpncFjPFji5UuLRfAdAC9iivWi/4R2FcBGdewsG9CCK7iM+ubSI+
wU6nuJr4Qge+CT9gDmTfK+rWeekDuiB77sR2NJerkRg9wYpHZ3gxwmqVh7fo1NBT
qSF9ENLL3Dib8J2G+nRxeLiTQGL6z0ObTgjES8lBFm6bZImkRhhjbJ+cfnjEronM
7LgTk0M8iA0oRrciVQBoAdxXubFXKIOFmAlkb5Th7gFEt+RCNHHe+c2xQ66auzQ+
LgLgit0SVKN7Yxky0vVURe1o6CW/x/7mFCJS0Eob3e56jNJEMuc/8EQyqZ4BCO32
lod6ehIcPCZFgTCfVCipFawIuzmBd2sBV5204RQXi5fE2Mh2BOp8tb4Wza342mv/
lkprgWkeoVfltY1Od8uY5XRf3Gt8Rr2IieaxM0lnLNrkbFNG8ZEGWQ2ozzJKTQL6
RiRw4Xk5obQAwq4BC704X4UptnaM+f/I2I/Cu+HibL8Wbg0YPPmDwCcYjSKE+Cpo
dqaSVRuutes409PEhVjofgXEI7nndDQk13gIC91hMB5ana6qlrLfVvS+qJCNw5/7
5iF7zfrvKPfEdnBcCDUbv4959PhNG1wuwiRLqVMKcqBgVj2wRZY=
=GXY0
-----END PGP SIGNATURE-----

--FK65GREB+Evh/hTL--
