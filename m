From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Warnings do include offending filename
Date: Fri, 10 Feb 2017 15:11:22 +1100
Message-ID: <20170210041122.GA25381@umbus>
References: <1485767585.7612.23.camel@hellion.org.uk>
 <20170130234932.GB14879@umbus.fritz.box>
 <1485851088.7612.32.camel@hellion.org.uk>
 <20170201001654.GB30639@umbus.fritz.box>
 <20170201010004.GG30639@umbus.fritz.box>
 <1485934446.7612.36.camel@hellion.org.uk>
 <20170202050553.GF13219@umbus.fritz.box>
 <1486151046.7612.44.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486701659;
        bh=Tz8jRW2gh8EkAB9c9bf7UPzlwTiE+6JJa/s36DTqaOw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LbfR7qy3Y7bzfNwn4MlRezrgr01HpjbiLaFy2MIYs2QpM0EsdXx4YKi5aaysiYd9D
         ukYRr4eFKF9Lazhre8DLvY+0qNKdPZEKfXHOJ5eR/Z8KsXkCsUep9Un9J4Cq7nWoQm
         NDxDnM1OXWTEXNaHnlGxwS4lHORFSqLBWuhju2qQ=
Content-Disposition: inline
In-Reply-To: <1486151046.7612.44.camel-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2017 at 07:44:06PM +0000, Ian Campbell wrote:
> On Thu, 2017-02-02 at 16:05 +1100, David Gibson wrote:
> > Feel free to send a patch and I'll think about it.
>=20
> Please see below.
>=20
> The diffstat is a rather large due to the need to plumb `outname`
> through to all the check functions. That could perhaps be avoided by
> adding it to `struct dt_info *dti` instead since that is already
> available in most places, but there would still be the churn relating
> to adding a parameter to `check_msg` and the various wrapper macros.
> Happy to rework along those lines if you prefer it though.

I think putting the output name into dt_info would be nicer, yes.
Make sure you allow for the case of output to stdout (which is default
for -I dtb -O dts).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYnT1qAAoJEGw4ysog2bOSV6QP/1vVwdaNfz5M6VFQbdCaLblV
07oYBRQHjC7sI56zGOp8dwE56JB+oxwICoL3hgI5PkRV2/F/ZUMVc5bJHCF+vP6V
ZaDgk00kfw/wyxvfxQjprzNOWFtVI/RV+4tSkVhdDCcZS9EzqnxIV3+TagPpCnYk
5B/RhyYxFg/najt+aefFxGZ0vdweuj5dULv+jqsRkcdYud7NgA2qxWSg+twnyH30
RNljPxLIgYm3HZ7zOUDw6Vo2nvqGT78KwhY8dn5dl8hXrQfeU8UfajZhfmkgu/kr
TuSnAZ70egoY/5d45wAlILmVFVIE74x2bQug2zgrHNlfv3/P4EG/Bl26MmOvwfcK
oT5FkX5T1ZlVcgAkB4Epy0EEfvxjRxkGKZ3v5cJBZLK9M86GwQMjnMSyrRC9Dp/0
c7CzWbF41Ee+q1fpH7nuOnvpL1yunnWhtAIrPjwoaFGF+fr+qGa0I+4Unv9EPySE
74LdmUIEF9rtsWxL4gYdrcnebbwpGG+NGEAM+rTz9iTn3SaK3Fsaz1zipqCEwfWx
zoSi/6TAEEsXNwCHVrAkm+usJ/te3FVpyl7qBJpn5rYy0fp/PydttGzEd5lHLFpT
rMuAmXmxWuRYXg9vVdhrllNU3SJ/tPUNCxeaY0e3k9W6fJ75RsJDe8tzSL1MEjFk
KYs8JEw8QnpFGfR0O9UK
=+wLR
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
