From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Properly handle \0 delimited string lists
Date: Wed, 11 Jun 2014 23:10:39 +1000
Message-ID: <20140611131039.GA29130@voom>
References: <1402430256-8359-1-git-send-email-jack@codezen.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402430256-8359-1-git-send-email-jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jack,

Long time no see :).

On Tue, Jun 10, 2014 at 02:57:36PM -0500, Jack Miller wrote:
> reserved-names=3D"res1\0res2\0res3";
>=20
> Is valid DTS. This one-liner expands data based on the len given by the l=
exer
> instead of strlen.
>=20
> Without this patch, realloc gets confused and hangs. For example:
>=20
> *** Error in `./dtc': realloc(): invalid next size: 0x0000000001961670
> ***

So.. the patch certainly isn't wrong, and is arguably safer than the
current version.

But.. I haven't been able to reproduce the problem, and I don't really
see how it would occur in the first place.

The thing we're taking a strlen of is the input with it's escapes, so
it won't have NULs, just backslashes and 0 digits.

Or am I missing something?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTmFVPAAoJEGw4ysog2bOSfwoP/3QhfJgvwxhWnYs0qAuWq8nn
0dYLXo/8JlfNt3yj8LYh98QQa9OEYD3raTHsguxBAzmCcrStxNt/ujchMLLNwBdM
M1wctV1U5scCdZdeh9TsiUJpfl7I91XshhxgHDGD6HXkaU+BRCwGFzd/YpSQA4TY
XtWT3reGy/IW9/vpuji0YbNR14HTr4fVeIkkrz4LRo75yxwPT2tFA+bXmsnSalUq
yIpY5cRU/mkzDNcm2YNlQp+sjWVnrXKKvHYUUtktFy6ukkxdlaAHHlZvE5DSlqGn
89D/ILnQOzFr2wmRvBdlWcO8drlPouPtNa0IbI0yu1IWpRodMz2KnEAPF737dWBo
OquUA9GpM6RD/xwe8pJ4ahrGOVxk7AKvxO9rdc+os0PuSTVEYUDN6NQp8sV0g7T/
l3Iu5zEJoSX86cP9900jaxj4HqV2fbnibxoF2UleZcOeJMupseBt9v5b0ArVOFPn
yzDTf2hqaPu/jQRRLglk8rCH3UwghzhRsI+7HxOHqLihx8nRYaw25xjlqTuB7Mag
VqV+VTnAALwNjhMTgCrx9YJRRfhZ+HboY82PBLt/qVeUtrKPc8gV9wctXB4i6tP3
MRVxn9mzBkT7oyGspyc0UCOmA4oIcb32vXgwQJMGrVcwiF0YY0o3/jgwNSpa1l9B
2229R9r84kJm3i3JgvbC
=CSk/
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
