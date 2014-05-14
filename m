From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Wed, 14 May 2014 14:20:24 +1000
Message-ID: <20140514042024.GE28789@voom>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
 <CACxGe6uPerPT_cT+p1zvL20ERwuguDJWDHasxz5gAUe5kPQHNg@mail.gmail.com>
 <20140512060000.GA28789@voom>
 <1399875002.17624.89.camel@pasglop>
 <CAL_Jsq+zi72PAjQ+RGvUddLtHocgphPQQ9x2X0S0dYGOKz+Hgg@mail.gmail.com>
 <1399932065.17624.139.camel@pasglop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399932065.17624.139.camel@pasglop>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>


--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 08:01:05AM +1000, Benjamin Herrenschmidt wrote:
> On Mon, 2014-05-12 at 14:27 -0500, Rob Herring wrote:
> > But what you wrote was for unflattened tree. For early FDT uses, do we
> > really need to worry about PCI or other special cases? The current FDT
> > address translation code in arch/powerpc/boot/devtree.c (yes, now we
> > have 3 implementations) does not for example.
>=20
> This is specific to a bootloader case yes and it's ... fishy.
>=20
> PCI on ARM is here now. PCI is everywhere (well, pseudo-PCI but that's
> the basic issue here) on Intel embedded.
>=20
> Some embedded systems will probably want to enumerate from the firmware
> and Linux will need to translate. For example because the UART or some
> critical GPIO that needs to be handled early on is behind a pseudo-PCI
> interface of some sort.
>=20
> I think we need to handle these cases rather than fail in obscure ways.

Yeah, I think PCI is way to common to just ignore.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTcu8IAAoJEGw4ysog2bOSi58QALm42rUndJx4JfwUb1Bqrs8r
mH63ha0/bQcLFYxviY7xbeUiwRrOirlijvTUDYbegy4tZqdbTOqCkYMGrRrs4aQC
RG46bA1j1oYdGa8TpI2d+LtRkRBDX0pExnpEw4T9cHXyG1YgIydWNH5cJytunhOu
SEXAnRuQYt8UabPJnxMH4P44AUnGtp79DfNKiELAL2JHaWpFVbsi7/gTKf44LUj0
dPp3fBhUidGDsH2c0OK8pRVI1IfRMKcyysn1WE/63Eucx2+rQK2oDnP8HAAlClOn
mDYOYgkxvVH/oDpf8bLdn6vbMvseOYZ8j3fKMARgqSRSUPDNUZhB+GZkRVfbFN+S
brTCbCj5MEtWWltADBlQRK5g6mevo59Ad2++Z64wM7sk/wt461s6CTbEOGYbRnpg
hs52soRIfhgAnK+uiBfBkn+TR2CSzmYWD5PabfmZew/P+sP1jQAac/o18Pk1Eo4l
9zgbH+F3vLOzno2iZmBVvoF9T9OH1cZHk5utU/bIwYi3FWXN3BQev8OXXGeZOguC
1YTM/AKWHbZvRBG0Do79WMHGzUZ/XsHDy6JtBsWCFBJZDib2WCpFa+y7/7I9Ayto
25L2GpK8GNK3DI54Dy2nDaQz4qMY52aCLpPlYkBdhUSZj0/4YBUgD43zD3LW5VWH
Ov7D38Z8eAaOxhET9rYy
=kDCe
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
