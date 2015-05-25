From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] tests: convert `echo -n` to `printf`
Date: Mon, 25 May 2015 11:14:29 +1000
Message-ID: <20150525011429.GF6255@voom.redhat.com>
References: <1430891746-30267-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aPdhxNJGSeOG9wFI"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430891746-30267-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--aPdhxNJGSeOG9wFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2015 at 01:55:46AM -0400, Mike Frysinger wrote:
> From: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> The -n option is not standard in POSIX, so convert to printf which should
> work the same in every shell.
>=20
> Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Sorry it's taken so long for me to look at this.

I'm not sure exactly why, but applying this causes the output from
"make check" to be garbled in a lot of places:

[...]
dtbs_equal_unorderedPASS
dtbs_equal_unorderedPASS
dtbs_equal_unorderedPASS
dtbs_equal_unorderedPASS
dtbs_equal_unorderedPASS
dtbs_equal_unorderedPASS
dtbs_equal_unorderedPASS
dtbs_equal_unorderedPASS
dtbs_equal_unorderedPASS
dtbs_equal_unorderedPASS
dtbs_equal_unorderedPASS
dtbs_equal_unorderedPASS
dtc -IPASS
dtbs_equal_unorderedPASS
dtc -IPASS
dtbs_equal_unorderedPASS
dtbs_equal_orderedPASS
dtc -OPASS
fdtget-runtest.sh MyBoardName label01.dts.fdtget.test.dtbPASS
fdtget-runtest.sh MyBoardNamePASS
fdtget-runtest.sh 77PASS
fdtget-runtest.sh MyBoardNamePASS
fdtget-runtest.sh 32768 label01.dts.fdtget.test.dtbPASS
fdtget-runtest.sh 8000 -txPASS
fdtget-runtest.sh 61PASS
fdtget-runtest.sh aPASS
[...]

So, NACK for now, I'm afraid.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aPdhxNJGSeOG9wFI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVYnd1AAoJEGw4ysog2bOSIsYQAKNNFKwOVLwzZwDrkSEVeAhB
a+7WfoiNcUQCJce2Xz4iPPUmNKl6yQGyJtSYK3CtcPM/347ApkZwitVOiCvoqLmz
hwYyn+UXMnKvyRt2C+PfEiYhhjHKK8KCsD949NoL2FRaeZrefp2j3OSCQoPwC8KP
iCE+jdi9T1CuVhEYHZE3hfcJdJFZ5Kx9AmQdepH/M3n/lVmlK8jik7yhhqJ4g33U
cNZgRu7ju2c2CVRuJscpMTV4Sx49YxrxM5W5P3YQmvTyUJCqtHodLu1M5Dqp5OlA
ZdB0ZavHOdxAqWOYy36vv5xfooISTa2ibkYyAEwcXYtA9ZidwfVcstBFK3SKk89q
QZvLj9RQ/XGdsENAJiPmV0SgJHD/XRv26eOqJlW1hPdQgP4eRmWDNTClTpwSEXjJ
DTsv7ku6xalsj4MW+RCTnYDjqinNKwvTOkTHR+WT6BY0ThXyOLhbR369SFs3yq2v
4Z6MkfKjizaz68nICGZpAEawszz7KvUCM2C2NIu6w0/a1fMHj8NEiT1h6db5egoB
pZvVrUTbsfdXX2dbRTbI2TyMVInJC7L1UflH2mXdDGuAF2hi0Vt774nNx8tBemry
oKu2UsiynN5/ocqygMUR1sQ+v22i9G7WC8qHrweCOtRH6vQ6CLQVzRTvdihJGyzj
cZbfKM8/L0fmYQACzWhn
=usOu
-----END PGP SIGNATURE-----

--aPdhxNJGSeOG9wFI--
