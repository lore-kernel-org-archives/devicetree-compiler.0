From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] tests: convert `echo -n` to `printf`
Date: Mon, 25 May 2015 13:33:25 +1000
Message-ID: <20150525033325.GJ6255@voom.redhat.com>
References: <20150525011429.GF6255@voom.redhat.com>
 <1432519052-3777-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hk6Zb6cduJ+I0Tmj"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432519052-3777-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--hk6Zb6cduJ+I0Tmj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2015 at 09:57:32PM -0400, Mike Frysinger wrote:
> From: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> The -n option is not standard in POSIX, so convert to printf which should
> work the same in every shell.
>=20
> Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> v2
> 	- output should match before & after now

Much better, thanks.

Applied.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hk6Zb6cduJ+I0Tmj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVYpgFAAoJEGw4ysog2bOSAZMQAM7rOPgTNHaq0cmOsiouMvcF
J3a5SH9/9QkiqBvnjkI59T5QNIN7/jNJjFw5cUyGd2S9WQdhjaBedyOH+q4PevA5
4iaqTOnzn49mrzHPdrqYAu73mRheOKGLhYqg0Z845qz6trGSMOZLv9uPNDIL1q36
riQ8rdvheebH8bQctdTGaTq3LDHYP4j1UTV6fWbjpBLL2BEsbu94BuW2kb/b5DFm
utuTpPq97oBiTE9RWT200qtfY5uoq/mXVBdWs0/xxn+D2jIyHSupQo+dbWBo147F
FYJ9zMw5PWL0dRYT78f41Kt3k+XaP5Ir/HCYrpRYcJw3ncp35uO7EKfhXtuEE4VE
pQOOYgddVFlkrjFB917H4+peVYb2uqgxAdgvSNQbvOy3i3+4FbZaArpBE/C8bVQG
8xg531pConCkEJdA6yAO7oSsBw22CIvuWDQbD1lcyvsF6z9sbNe4y3n6IR3FUcSe
i+ChFjODayXv6OSvlPyFovnk8S3lEsajTMXT4hIvP4zCCMXZ80RXORihGztcTn7A
pNjH4E73/lQF/v5tB6THDRkg5L9ADiF2qhADN+lko7Nx5m9/bZ2DX/77iebDq/Fr
nYIv2FlqUA3Z9wQ9Up6acqZqce2J69ywY0tWFR0w5kTKEc3c1croQDMtJOsdxpv3
9iHbW7nVM+gGJZApMLsM
=O8ES
-----END PGP SIGNATURE-----

--hk6Zb6cduJ+I0Tmj--
