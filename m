From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,01/13] cmd: fdt: Narrow the check for fdt addr
Date: Mon, 15 Aug 2016 21:55:18 -0400
Message-ID: <20160816015518.GT5342@bill-the-cat>
References: <20160705082646.25044-2-maxime.ripard@free-electrons.com>
 <cf8fe411-8503-78d3-1603-05f1bacd0eb1@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tRcR9GoWqjXrt11v"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/KQCBGcx/C+tkZA4ah1+5AIbZi3U7I/HEQyVAcJw184=;
        b=FEp0wfRIXGlWLTrOiyBBNaTbPbq97GPRuuYjTTuamarDWje5NYuylU9UhjsXdKO3zt
         yqCb4mot62nCIHyuIbUKDXwhK+QSlgYpxq/7g9nViwfFL2/145PqP7aZcBpbVi4ptOMO
         qXwaXU2OfqlkJIZJ2on7h1N0/30bD2XwgD9WE=
Content-Disposition: inline
In-Reply-To: <cf8fe411-8503-78d3-1603-05f1bacd0eb1-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--tRcR9GoWqjXrt11v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2016 at 10:52:04AM +0900, Jaehoon Chung wrote:
> Hi,
>=20
> On 07/05/2016 05:26 PM, Maxime Ripard wrote:
> > The current code only checks if the fdt subcommand is fdt addr by check=
ing
> > whether it starts with 'a'.
> >=20
> > Since this is a pretty widely used letter, narrow down that check a bit.
> >=20
> > Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> I don't know what these patchset were delegated to me..I think it's not m=
y scope.
> Simon is FDT maintainer..Could you check these patch-set?

Ah whoops, that would be me.  I assigned Pantelis some FDT stuff in
patchwork too, but I bulk changed it all over to you, sorry!

--=20
Tom

--tRcR9GoWqjXrt11v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXsnKGAAoJEIf59jXTHXZS/AsP/3F+mjhspwpDLzN0lqKNmj/4
rzT3+fjvZFXVcQuCg/Y3jrFBl9HjtVdlT2sltRHvdvI0Cu7kWUAuLFV0ZMTrTArW
B/rI/nsZIRyV3PRWzwR64kp6sgcaxsK7gjogijmULFaov1/UwqulIJoIIjZYP3v+
FXkcXG9VgK+F3O0wDSAHtLXmPSbMdo+JwlORj+XNFMSA36XUz6ioY2Nv3FepNFvA
DQSwkbp4tlAEyNSZ2IWkvO5155/W++C0TOF7Dn59HUuLidqKMzrnIM7goocSy1Ki
s5PmpWcAMa5RVuJmESiMn59yE0jeXkIFnLg/WPacso8ZbXpHrP7IP0OAUzzSGlCr
W6GBWG/0sCV7a0yfZyNxZnGFMS8dh40w/C3X7PxmwzFm1pR75lxNSdWK2Mw/5vYb
y5/kSepDLz3T100PKFmNcnV0nsbEcp7r742J9qRmmxqEbX2gmF9yp/bLFhP7F72h
mr8v5fMOqbgpqwJijWkd4NFZo5fF70BmAvLd/S4XBrct9iyK6Fg6JIEDJ2Fqm/Gh
vBBWW0zT0DGYoVTyq+Mz53W2lVk9lKlYRV0mLWqr6Vg9sSUi//04Mw3wox31ADwX
BliBggYZhKXBTwhBD4V6DHkHv+5X2v/oy43FQjIc4c1i42pl0BfFYgvG6BeBMmnK
yG8F9XfCD6Sfw/Z9JIZ9
=k0/0
-----END PGP SIGNATURE-----

--tRcR9GoWqjXrt11v--
