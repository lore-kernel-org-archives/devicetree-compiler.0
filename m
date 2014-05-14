From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] libfdt: Add address translation functions
Date: Wed, 14 May 2014 14:22:56 +1000
Message-ID: <20140514042256.GF28789@voom>
References: <1399874771-23089-1-git-send-email-david@gibson.dropbear.id.au>
 <1399874771-23089-2-git-send-email-david@gibson.dropbear.id.au>
 <CAL_Jsq+Lppxf7OHO1ekqpc7E+P8cMJcTOftZSd2TrN8kb4PQuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A9z/3b/E4MkkD+7G"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+Lppxf7OHO1ekqpc7E+P8cMJcTOftZSd2TrN8kb4PQuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-ClAdetSTwOo@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>


--A9z/3b/E4MkkD+7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2014 at 02:01:14PM -0500, Rob Herring wrote:
> On Mon, May 12, 2014 at 1:06 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > Add the fdt_address_translate() function to process 'ranges' properties
> > to translate addresses from one bus to another.
>=20
> Some trailing whitespace errors:
>=20
> Applying: libfdt: Add address translation functions
> dtc/.git/rebase-apply/patch:87: trailing whitespace.
>=20
> dtc/.git/rebase-apply/patch:208: trailing whitespace.
>  * @inbusoffset: offset of node which defines the address space of the in=
put
> dtc/.git/rebase-apply/patch:342: trailing whitespace.
>=20
> warning: 3 lines add whitespace errors.

Oops.  Not sure how I missed those.

> [...]
>=20
>=20
> > +int fdt_address_translate(const void *fdt,
> > +                         int inbusoffset, const fdt32_t *inaddr,
> > +                         int outbusoffset, fdt32_t *outaddr)
>=20
> The translated address in native endian would be more useful, but more
> importantly how does one determine the translated address size needed
> to convert it? I don't see any reason for the caller to have the
> outaddr in be32. While in theory you could need something larger than
> a uint64_t, the reality is any >2 cell case is broken anyway.

The output isn't necessarily representable in any simple type
(e.g. translating from an ISA bus to a parent PCI bus - output is 3
cells).

I'm certainly thinking helper functions to translate simple 1 and 2
cell addresses to native integers, but this function is intended to
strictly translate between one device tree address representation and
another device tree address representation.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--A9z/3b/E4MkkD+7G
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTcu+gAAoJEGw4ysog2bOSoJAP/1RigIpAAjCdomUrMKhscIZw
qVlMMbW8sJQWtRvObu7ThdU7ezjBqNUiORTaMqyflvJvA3/mK9+mRRgyoDoDPdvu
H9xTpvBx86xgd3wkPNHshB9w6srhhfPofohOzpRQTMmgl3ZcXA7syDvebWNNjtv1
SFHfJWv5HajQOPR2XiasNk/8gVe5YYzAJ5My2kyRt1Bj/343KCYrIxsiLxv6wD1h
G9tDDdhJbPBBDpY8PtXoVw0V30o1gRT7mjZmxdLUubGy8HqBKJtRTU7MiB/4SqnM
hdhT2caN0stQmcs/m9wjAPzAv0xNA2Vc77J1P9KT0MP0bvwCC3ZczCUng0QMRnVo
1La27Smjty404H4JAZMRrdKNruP+09we3Hspk55DArmdBvdplw4Pil3PpaT7uiOE
BtFpu4ylMa8Zv17qY5NmYFl/FzrxCyhICjEaSUKVV94WC21EAYKW1lj5pGMdB8GV
0wgzuqCBMOZjnkmj9ceEplSr1mfqkVblknADDfVBbZ5eHqebEpy5bD2AfuoVzZBf
qdWtw1Rz40BZ3E2proxwCChCn47RS4wXGsMEQy9c+zEgyxvngzFOzFhUrAcC4gJF
tsUIG+yf1DxTjC8fw1rmpguk38isCnqte2WDe0K1+SjULDuRgYwyIgnspmPhM1ju
GxJWcnaYwPOnptQAE1pG
=g+s4
-----END PGP SIGNATURE-----

--A9z/3b/E4MkkD+7G--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
