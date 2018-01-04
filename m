From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in
 base fdt
Date: Thu, 4 Jan 2018 14:26:00 +1100
Message-ID: <20180104032600.GA24581@umbus.fritz.box>
References: <20180101065945.65451-1-kevans@FreeBSD.org>
 <20180101065945.65451-2-kevans@FreeBSD.org>
 <20180103054220.GP24581@umbus.fritz.box>
 <CACNAnaHW19kCE24KUpi2LFNUS94H2xajq6WWpi0NgY53FAymzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="P6d3k5Edf9pZm0D3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515036592;
        bh=dbUrpy+cNZBqEEMe9zoL7JKCz5qkI02wptDlhtxdcuU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lyEBsnDhpVtp4xVD7WRjS7LUEs1h6Lnb3nIqeHzZQDz8Y8Aur56jt1hq7fVcicVIL
         eyHUudXfI7qTH2n0jQ9Abfd/dBHIhE7BnpK8ixEVZGdC+w8L6FN2RNLvXG6Ni0LKM0
         rIExhiBBMKRXW6I+59to0Bvpbcz9gfO/mrQdSEkQ=
Content-Disposition: inline
In-Reply-To: <CACNAnaHW19kCE24KUpi2LFNUS94H2xajq6WWpi0NgY53FAymzw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--P6d3k5Edf9pZm0D3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2018 at 08:04:52AM -0600, Kyle Evans wrote:
> [Resending with a proper mail client, because it didn't go to the lists]
>=20
> On Tue, Jan 2, 2018 at 11:42 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > Regardless of anything else, these two patches need different one-line
> > summaries.
> >
> > On Mon, Jan 01, 2018 at 12:59:44AM -0600, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
> >> Currently, references cannot be made to nodes in the base that do not =
already
> >> have phandles, limiting us to nodes that have been referenced in the b=
ase fdt.
> >> Lift that restriction by allocating them on an as-needed basis.
> >
> > Hmm.  I'm a bit dubious about this.
> >
> > - My feeling is that one of the problems with the overlay format is
> >   that it's already too free, allowing the overlay to change
> >   essentially anything in the base tree.  So I'm not that keen on
> >   making it even more free.
> >
> > - An overlay can already add a 'phandle' property to a node in the
> >   base tree.  Can you use that directly instead of adding a new
> >   mechanism?
> >
>=20
> That feels like it might be a bit difficult to work with, for a couple
> of reasons that might be logically wrong, so forgive me if I'm
> thinking wrong:
>=20
>  - A phandle is just a number, so it won't get adjusted as overlays
> get applied. All of the overlays that one of my boards needs to apply
> would need to choose sufficiently high phandles that they hopefully
> won't conflict with other overlays, especially as new nodes get
> introduced with their own phandles.

So, I think that could be handled by applying a local fixup to it in
the overlay which would offset it correctly.  I'd have to work through
the details, but I won't bother because..

>  - If more than one overlay needs to reference a specific node, we
> have other conflicts. These overlays aren't necessarily related, but
> they would need to agree with each other on the phandle of the node OR
> make sure they apply in a specific order so one can add the phandle
> and subsequent overlays can reference them symbolically only as
> intended.

=2E.that's a good point.  Adding the phandle in the overlay effectively
*requires* that the phandle be missing in the base, which gets really
messy if you have a bunch of overlays to juggle.

You could maybe handle it by handling "base tree fixes" as a separate
overlay which must be applied first before the "real" overlays, but at
that point your solution is probably a better one.

> The problem is that these overlays aren't necessarily curated by a
> single authority, so conflicts with multiple overlays trying to
> reference a node is scary. Ideally, we'd like these things to be as
> usable as possible for average Joe Blow.

Yeah, fair enough.  I'll re-evaluate your patches with that in mind.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--P6d3k5Edf9pZm0D3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpNnsgACgkQbDjKyiDZ
s5LqmBAArY6zKnmNWJ31Scg/ASsAuCDdjXPX7uDnC++2cXQBo36Pj2NhmpYt5Eq0
WNHbVX0q/7SKlJLTII+jx0V2ZMuiNMOIXYopwNt1hoSKom0Us3RsJ4lPfp8S+Tyh
F013nKIUQyEv4jvWQPOILOSO+z9YfQxgXx6UWGvVWgVxS63drstEZ1mGO2mgN8ml
6pbmTTrJJ3NHpPjBd+X8eCY2JVVU1vq/yEMHq7wbkp74jH+t6mvaHCGSpKGowoXZ
YVgpS2GjWfGmQ3TSETJ4+VdIOxx+8mf/KsOt4mkTyuxJJa4ZcAlPm+vTKMno42VG
w5cNjje5BxtrMUYtDwl1uUhMVR+sHQs6MdjkON9jSawpvC2VPA6gp1MYQsB1uH38
X818XDqy3zQoxyiRqoZ1Qyq4K4gY/uqzbweQRrRkMAIbZDaR7duaIbSDsoQt8eYU
v/pj0n0RpiE3fbh360OE5D5VsSw0R/wG5xsT5L/hdVx2Z4Or/G3Da9VzeYq43NzW
XOQC+wd/J4gn5XSAPLLsHxLmgkmTrQM+A9a6zNw1IyLR3nDC+j90I74ucnoLrm8/
kBM8SC+Gs1+mX22i2pBmq1CD4b+i0rzqdtW2i2AatB6MXWfB9pggW+CDxFcGSyUU
jVI4blwyY3W8js/+2DX0e+uDMQj1GtvK5NqJpipM6+8IPq9AIGo=
=Ywis
-----END PGP SIGNATURE-----

--P6d3k5Edf9pZm0D3--
