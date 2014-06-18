From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc crash when compiling a test file
Date: Wed, 18 Jun 2014 22:50:54 +1000
Message-ID: <20140618125054.GJ29264@voom.redhat.com>
References: <CAPnjgZ3pdOGOAO6ktY7gd696wUtA0zHgpcg-GZZxA8yfvHkHyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KjX7LgAomYr70Ka9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3pdOGOAO6ktY7gd696wUtA0zHgpcg-GZZxA8yfvHkHyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


--KjX7LgAomYr70Ka9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2014 at 05:28:35PM -0700, Simon Glass wrote:
> Hi,
>=20
> I noticed the following crash. I'm not offering a patch sorry, but
> thought I would report it.

Found it; off-by-2 error in treesource.c.  Fix pushed as commit
fa928fba7e1ce94aef58798e77a9261192fdbb01

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KjX7LgAomYr70Ka9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJToYsuAAoJEGw4ysog2bOSgjMP/3Ct0WEIxzqQa5ns87Vqcnvd
vPQOjFQAtXZWk2pfOJcPHLx0MhKutGvmlTflUP0zwakFIqmERJL5jQ+NywGVwH9x
4s0RzL9a7Ic3lWzOxRhs/9ZsAV10p8KNChVPMGl6sRDvQBDoiQ8xKmzPLb8TC7Bx
IKD0r3ZAMPtl+twZuxwpyT5AB9EsdOk7jh0aQ7HKLEqVXncXX7U9fpaU1LkrncLW
uc6MPeIAo4Zejdz91kt300eKPTCP7b9KOCLvV61BTyr9zafRDINfQctoSZFqhT7R
u4TLxJ4sUGSBQxPVBqAuhryb48nnyozmhFIQzjbI92jA9KeEr6BfK6sGB9hoV7Sh
2Tn8tPq5IAn0yIGqgFj3IXXPMq/yzpKVED+Nol3hEJ96RZwV33dZh/VqX9s/PylK
qQKLvzjTe0ET6D9EbM2PalF6539HlMPbjl8KU0Ze7U+4DMPW5qqh8DzUS4Gfb0Wq
sRntdBsggNXRrtAxXS3oQGgk2hTasbx3VX3w6ULJJRKsrO+JE0HaAViCBi2dBJlN
kgtNrDcDCqjHGQb5GnemQZru7RK+3jRAy3yx4/akN+ZugfNDu+OnQeVWi+fw9p9L
p4Ij8Bo7u2ngMcJibGtOccfpz/qxZjJ/HUt7WFVIakTu12C2lGX+O2r2oaOP5tLQ
C/qOMafiSCcF+e8e4gIm
=na00
-----END PGP SIGNATURE-----

--KjX7LgAomYr70Ka9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
