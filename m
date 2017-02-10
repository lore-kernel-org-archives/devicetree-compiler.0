From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] libfdt: add helpers to read address and size from reg
Date: Fri, 10 Feb 2017 14:24:37 +1100
Message-ID: <20170210032437.GI27610@umbus.fritz.box>
References: <1480979490-3745-1-git-send-email-b-fair@ti.com>
 <7c83a816-a5a8-3529-623d-52cc6b9d5ed7@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AAnJd2yLvu+tR7U7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486697880;
        bh=F7nuTWW4QJWIHU3mYRBvDqRpkrTVVABEofSl1fboqlI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c2HaGA9MLLtQ/4E1B+/aVcn5S53Fo3dmM8WI20x327HDNqb2jyaWxMPRBJv41/5px
         B4kP/dB5nPEcb0VRNeDGNgD4h82t77p+hV1sf3cfyQB0GhgWKckAE+9U2XcfdwN9wd
         p64LX8NtlZXX0z+OHC4yah/4o8n6YaDIq8JPWRuA=
Content-Disposition: inline
In-Reply-To: <7c83a816-a5a8-3529-623d-52cc6b9d5ed7-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>


--AAnJd2yLvu+tR7U7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 11:31:53PM -0600, Nishanth Menon wrote:
> On 12/05/2016 05:11 PM, Benjamin Fair wrote:
> > This patch extends the capability of libfdt to parse the contents of de=
vice
> > trees in a similar manner to fdt_address_cells and fdt_size_cells.
> >=20
> > It adds helper functions which read the address and size of a device fr=
om
> > the reg property and performs basic sanity checks. Some functions also
> > parse the values into integers in the host endianness.
> >=20
> > The functions do not perform translation to a physical address using the
> > ranges properties of parents, but this enhancement may be added as a
> > separate function in the future.
> >=20
> > Signed-off-by: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
> > ---
> >=20
> Hi David,
> Gentle ping.
> Benjamin is no longer with TI unfortunately(so dropped his mailid in repl=
y),
> I believe this version addresses the comments you had. is there any thing
> additional to be done?

Sorry, I've been a mix of away and flat out with my day job.  I'm
having a look now.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AAnJd2yLvu+tR7U7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYnTJ0AAoJEGw4ysog2bOS2s0QAKEKYRbCdA/gqU4QppMnXCqY
/8KEtYxjlILYz6Duo+laOHVTa/C4jHNMO51HrwKMXWmLTTTL2ipCjvVCbARe+J3f
ush6TDvpfpx7RX3OJPzWvqXM4q9oG+GAqhSOH864YD7KhmPZOnOTGCDZYpsrjDES
c9fcJEshNqR/ccErTsK1evtmHplHdayaTUFZh9L9R+mzX8bJilOG2dWVfuzgh19Z
w0Eqr34HxAVN/skCx+4xgFbcJ97DD3NdK5ur6CdaXyqHTVNCqGdQWxZAs47T5nYW
EZV4U5qxmVPsCdq41hUXGJDhja0XTUwRVYG9D3AAQHN015oRzBcVijTwWbNR9uii
Zb3Y4KYMU1T4Bc2qIH/yoLEpI2KmjaeDbbmD6+8XsUedA3mKCtJviVXmIkydAYGL
LH+ZAVdQLZnPDe23S2N5SETyCBxzgIXKNx0mqOGR8U0Ijqea0bjXqW2/EW6sHUf6
1i0UnxquZW2oc3YJ34SAgm/r1zDBoL6cyLK5eUmffXzkRp5GTeGCi7LI8/HSOcVk
2c+LU0/PLzMnyRXo81uaeWTv7ZMBDszyC3kyFwEofPsVqemr5QxFZtq8/fUeKaDn
nrmmjhd3mF6Jcg7f58hR2hLwmZyIn77V/A+Y2HbkyMoTbAxo7ylr6sG3eOlnaPWI
KIFyUlERwPCOgpc4o9/W
=aTPm
-----END PGP SIGNATURE-----

--AAnJd2yLvu+tR7U7--
