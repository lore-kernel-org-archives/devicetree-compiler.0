From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4] fdtput: add delete node and property function
Date: Tue, 27 Jan 2015 19:32:16 +1100
Message-ID: <20150127083216.GA27199@voom.fritz.box>
References: <1421976320-239149-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421976320-239149-1-git-send-email-long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2015 at 01:25:20AM +0000, Wang Long wrote:
> add the delete node and property function for fdtput.
>=20
> usage:
> 1) delete nodes
>    fdtput -r <options> <dt file> [<node>...]
> 2) delete properties
>    fdtput -d <options> <dt file> <node> [<property>...]
>=20
> Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

Applied, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUx00QAAoJEGw4ysog2bOSaDgQANqSbizOgvO2x2659GOhlUB5
ic+C7hsZ7oh1iStvPSZdxLMaxTFudicNXsk1u/fH1hICuWXnLACNqHRif4r0V+l+
vxLIJXra8Ui7YA3uC9ts/dj9GG85scczMF+5d8E8q4q/kCUGJelUPqBB6fIyonRs
6SYFXE/2UyjTA8ogf/+y3mFYIfTR//DZ4uLKC+ngbD24LteIqPiKAoQNerloab00
f3N+H69F7A4vZciG4V3AirMVLOPlMs4903rgbFTZE5m1uBQrXtj0yFvlJ8WhA8gl
Mha0L7DC2pRp7Ak5h9/43zfyjte2rug5E8Hiqfz/2jr6gZ0x/GWoWGnLybWFEjTo
0NY8Lo+LwArbsZxTHSSof1flmNaX13s91GdMu3FESd/qeY/kjgJogF42gEeJ29QN
FCGn23GzNxNIMP+w7/kIegQRjE/ulFn0hcRxaMWzT4Oxq+NXx7Zg4QUe0p57QZv9
D8rSm01ARx3WdDryDSU2CHbO2ETRK3r4yO9Ji5cnRaXH65OE/2rrUXN77kMPibMA
fKvUDwFem5M5p+QCxkt53G/q988JqU7NRYUeL/oQe7iNCUB+FhHN7x7WMvauwzoS
OKpunE4qU0x7Zb7UN3h6NNt0PpMkjmkATHyBo429AWdN36HmsOK07p3XAEBuVsq6
FvKV1tk/NWylGEyLLa7N
=xSlp
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
