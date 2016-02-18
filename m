From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Catch unsigned 32bit overflow when parsing flattened
 device tree offsets
Date: Fri, 19 Feb 2016 01:10:49 +1100
Message-ID: <20160218141049.GM15224@voom.fritz.box>
References: <20160103084335.0b411e1c@kryten>
 <20160103093249.GF9329@voom.BigPond>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8m/hfNLtAhX2NvnO"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1455804730;
	bh=J1mM7NMw2wFXbIObAdfC7AHomdjxeRFv5/8/qwqrjpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lvmgAopGtfjE/UaFOldmwZP9ToV5K+d/RN3Z+e2UKM3ksu25e4ftA3fx9H/LOpW7u
	 /Y6SkkAerCuwXJFgilaJDujziRi43wkdp0NaLz2j3uigqnNh/uEZ0a0177X9aGIl5c
	 ainOedp0KkWI0GrvC3nCtO9YHN4my1k8l2chmnw4=
Content-Disposition: inline
In-Reply-To: <20160103093249.GF9329-JFWYtBTiNpwvqAi9XkHEEA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--8m/hfNLtAhX2NvnO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2016 at 08:32:49PM +1100, David Gibson wrote:
> On Sun, Jan 03, 2016 at 08:43:35AM +1100, Anton Blanchard wrote:
> > We have a couple of checks of the form:
> >=20
> >     if (offset+size > totalsize)
> >         die();
> >=20
> > We need to check that offset+size doesn't overflow, otherwise the check
> > will pass, and we may access past totalsize.
> >=20
> > Found with AFL.
> >=20
> > Signed-off-by: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> > ---
> >=20
> > I've attached an example device tree, do we want to add binary blobs
> > to the test suite?
>=20
> I've generally avoided it, but I forget exactly why.  Usually I try to
> generate the testcases as dts and compile them, but I'm guessing this dtb=
 is
> something that shouldn't be possible as good output from dtc.
>=20
> It would be possible to construct it from test/trees.S, but just
> including the binary blob might be simpler.
>=20
> Certainly I would like to include this testcase into the testsuite,
> one way or another.

I finally sorted this out and added this fix, plus a testcase to the
tree.

Btw, do you have the scripts you used to run AFL on dtc?  I'd love to
try it myself.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8m/hfNLtAhX2NvnO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWxdDpAAoJEGw4ysog2bOSzU8P/i6KqX/Sf+QSLkbMcVe/4JL1
z/K+rEGwLxXyU2uprZuI+EXFpLaRFYFeUdNtRK47KG0qiJpxCNl/ccJTHkittJqi
PjykqNUVMhxLLIvz/tY52b0YzpNuDe3OjOSJMzJpyT1Ed2hs7HBn9QiAVWgaWK7X
o7Ypa8SLik7oZcJGsC+9cwaDMAJw/jBbbo5pkyGQIEDaP2GeR5UdumcW6JaoZ9A8
zyMXC544PyFPYtdoSl4rDzJzF1Ti1+2SrK0nQmXdzzFD5eK8lnb0smPjZpOrTfgG
O61MLj2xijWEnZf8ZqkthAuEzS4K4rSevV3EBO8rQ5rgEBESNxv9ZaosUGt7IGew
u78o+TDKROOBqnUmjJT1uzofNKuJMWhH1csppxI+cfq/qE0K6a1vkb8qUteSH3y5
sMSZMmP0GnO1Etl90J93P7jgArGqGAA7VMMBlS3SGZZ5OHMZN+EQrxmdWsjNvlXD
XjJmjYkHEw4cODplId+TH/c545hnfY7L5a7WlOZHbDYrwu3A3oJB5mlnkLdhlpcI
Q8DQ4VgM0UIu2WmxMXB45qo7mrKIa7qvgce/rkugKD5jwYgAk44ZrQzEDJmFNx1C
KE2cZ+108fizoXh5ahw3jf25BCq3fl1GDYNDEyjdb4rHoA8dFhApWTJrITi8y+38
g237AmHASNHBm19sgJ7E
=S/E3
-----END PGP SIGNATURE-----

--8m/hfNLtAhX2NvnO--
