From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] srcpos: correct column numbers
Date: Thu, 18 Jan 2018 18:01:23 +1100
Message-ID: <20180118070123.GV30352@umbus.fritz.box>
References: <alpine.DEB.2.20.1801151932100.25462@hadrien>
 <4eec9dbb-c047-86ae-e4b2-08de9f0499fe@gmail.com>
 <alpine.DEB.2.20.1801160707350.2617@hadrien>
 <20180118042202.GI30352@umbus.fritz.box>
 <alpine.DEB.2.20.1801180556230.2995@hadrien>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Jp4gq2voFtVFKZdE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516270200;
        bh=9mrPmNqRAPr/McSlrKMfCtCB6tYPK3Cjzay1sRxz2V8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X5LScyOlVrWcuXrG2IkQtYoAvMgEZBnvrtdj8A9zLiUfeuX4qrGCCDqGByqfg28Lc
         201TxtX+VGVBUFJNLuks9rD9EdU9h9dqe/FN/uqRm9lHU+qoX87zI3/ghv0bnUEKxd
         WO1dhfolmr1tleEv9mEXnZu+d8CZ9jBStBzQ/7/4=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1801180556230.2995@hadrien>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Jp4gq2voFtVFKZdE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2018 at 06:15:47AM +0100, Julia Lawall wrote:
>=20
>=20
> On Thu, 18 Jan 2018, David Gibson wrote:
>=20
> > On Tue, Jan 16, 2018 at 07:10:23AM +0100, Julia Lawall wrote:
> > >
> > >
> > > On Mon, 15 Jan 2018, Frank Rowand wrote:
> > >
> > > > On 01/15/18 10:33, Julia Lawall wrote:
> > > > > The start of a line is column 0, at least according to emacs.
> > > >
> > > > According to vim, the first character of a line is column 1.  I don=
't know
> > > > if it has a concept of column 0, to the left of that character.
> > > >
> > > > $ vim --version
> > > > VIM - Vi IMproved 7.4
> > > >
> > > > Let the editor wars begin.... :-)
> > > >
> > > > Personally, I use vim, but if the dtc column numbers match emac's w=
orld view
> > > > instead of vim's, that is fine with me.
> > >
> > > At the start of a line, ie just after a \n, there has been no charact=
er.
> > > This change made the column numbers work for me in the annotations.
> > >
> > > There is also the issue of tabs.  David wanted tabs to count as 8
> > > characters, but actually cpp converts tabs to spaces.  So if a dts fi=
le
> > > has been through cpp, the numbers will be smaller.  So it could be be=
tter
> > > to consider tabs to be 1 character, to not have to think about what k=
ind
> > > of include was used.
> >
> > Urgh.. debating which editor to match sounds like it's going to be a
> > rathole.
> >
> > Let's try a different approach: does gcc ever report column numbers?
> > If so, what's its interpretation?
>=20
> Chosen at random, I have the following error:
>=20
> drivers/thermal/kirkwood_thermal.c:88:15: warning: assignment makes
> pointer from
>  integer without a cast [enabled by default]
>   priv->sensor =3D devm_request_and_ioremap(&pdev->dev, res);
>=20
> and the following code:
>=20
> 	priv->sensor =3D devm_request_and_ioremap(&pdev->dev, res);
>=20
> In emacs, the go to the line and type control f 15 times solution puts the
> cursor right afher after the =3D.  The column numbers of emacs report 22 =
for
> that position.  I guess in vim, putting the cursor right on the =3D would
> report 15.
>=20
> When I run the dts compiler on tests/test_tree1.dts, for line 39:
>=20
>=20
>                         compatible =3D "subsubnode2", "subsubnode";
>=20
> I get the start and end as 24 and 65.  24 is what emacs shows as the
> column number when I put the cursor right on the c.  65 is what the column
> number shows when I put the cursor right past the semicolon.
>=20
> I tried to move around in vim, but I don't know how it works.  It seems to
> report the position of the c as 4 or 25.  It seems to report the position
> of the final semicolon as 44 or 65.  I am not sure how it work though,
> because it gives the impression that there is a single blank character
> before c, which is not the case.

Ok, let's go with the gcc definition, which appears to be "# of bytes
past the last \n".

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Jp4gq2voFtVFKZdE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpgRkEACgkQbDjKyiDZ
s5KruA/7BAu5IsIT64A7zCaxBBtKWrG7y2l9MPIV7s//RQUvgSPUmfueY0NxigZw
N3kQK5U/k3qZ0FZJBOZwfXbrFthrfWQUzJPPf+87za+GiiJDbwunhVwK7YCDDnC4
JQCEbSEaO4xaoNiTzJg96hOOyxBF0U5hXqjrLJZ4rOgFqnx9y0rEvxxbXU5rtAet
0XVuvnVTvCy76WXkJFxL3d0rGZbYpPGH+FLA/Z+bWw1OHf/0iRT2Y8z1n9h7FPSO
JvN4BJCHaFZReqRx+G6RIN2pTLHWijVvvHqxOGy5WMnx9u8Kk8aPNQRCUWtYsfEd
nDSKlnfcucRY6OaLAu8UeLh+ur0yuK3SElVJMXrm+5c/P9vVXAxzX9ny5c9xDr8S
M+jx421Ji5cnmQwffABMiy2jeMTDbZenxAbOOi3+k+3fu8oUbxp0r+mAXjlBfpje
aiGvpegUHoTVI/q4qvKAgwh+i6jX8uwN7UZmVPz3pBGZyQ6Aj1+CF7pWk2QqRdV7
a/fhg6YNyIJhVZbkrdEpvK4oXA+4UhHJ2Sni3w7G9LMGGu61euHADZppCyWjfJcL
D2fJIBlC8CTZKZqPcHS6VtgQARwnVl8taAs/HUud+LOb2RLM7eRmr4WVWbtByGOr
KMkugbYr4syzwclIu9l3qHJ4ZyIp/u0nhpaycONHEFzB19+AOXE=
=RCQa
-----END PGP SIGNATURE-----

--Jp4gq2voFtVFKZdE--
