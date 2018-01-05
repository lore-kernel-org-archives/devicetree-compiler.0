From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in
 base fdt
Date: Fri, 5 Jan 2018 14:39:05 +1100
Message-ID: <20180105033905.GG24581@umbus.fritz.box>
References: <20180101065945.65451-1-kevans@FreeBSD.org>
 <20180101065945.65451-2-kevans@FreeBSD.org>
 <20180103054220.GP24581@umbus.fritz.box>
 <CACNAnaHW19kCE24KUpi2LFNUS94H2xajq6WWpi0NgY53FAymzw@mail.gmail.com>
 <20180104032600.GA24581@umbus.fritz.box>
 <CACNAnaHf6bQcJCkStCWy56cUYeXjZcO6TQfT2pCq=oBviDMckg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QwEQbjBJrdBSvIbq"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515124175;
        bh=uZz3A/PT+nXpZbh3/4pu5n/7OPcprcWDHA1xoPR/+48=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R6h/fTc1KQJXkgNcW0vPD8OEKc4GOcPPGVEMr9IdQtWLHioGJh6MJwNRIoYq7CbfS
         GmeDsBPTb/1U7BKptyyUcmqh3t8C5R0UNJPyNc2tfBIAnniVLp+Ez/6GG28GdEyfsI
         7hujGbmKePjoIWpMmJwcXRBaaZw3ls8q9oiB8SII=
Content-Disposition: inline
In-Reply-To: <CACNAnaHf6bQcJCkStCWy56cUYeXjZcO6TQfT2pCq=oBviDMckg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--QwEQbjBJrdBSvIbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2018 at 08:21:34AM -0600, Kyle Evans wrote:
> On Wed, Jan 3, 2018 at 9:26 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Jan 03, 2018 at 08:04:52AM -0600, Kyle Evans wrote:
> >> [... snip ...]
> >> The problem is that these overlays aren't necessarily curated by a
> >> single authority, so conflicts with multiple overlays trying to
> >> reference a node is scary. Ideally, we'd like these things to be as
> >> usable as possible for average Joe Blow.
> >
> > Yeah, fair enough.  I'll re-evaluate your patches with that in mind.
>=20
> I appreciate your consideration, thank you. =3D) I'm not necessarily too
> keen on requiring our users to likely have to disassemble every
> overlay they receive or consider which order they apply in if they're
> not functionally related.
>=20
> It also helps me out as I work on hardware that doesn't have complete
> DTS in mainline Linux yet, so I'm frequently adding nodes via overlay
> that reference base nodes not yet with phandles. Adding phandles to
> everything as I go gets kind of messy in my overlays and makes it that
> much more difficult to assemble an upstreamable patch.
>=20
> I've also had fleeting thoughts of writing a tool like dtdiff, but
> will actually generate an overlay of the difference between the two
> dts being compared. The main use case here being that we follow Linux
> releases (not -rc) for our dts, so automatically generating a DTBO
> from where we're at to the next stable release (perhaps in the later
> -rc stage) would be really really helpful to evaluate if we still work
> and what we need to fix.

That's a cool idea.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QwEQbjBJrdBSvIbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpO81kACgkQbDjKyiDZ
s5Iwsw/9G23ew2jOP5uaJh69zuoI8q07lyjotmLbPGb60ZoYw1HhIQAK5vT5krBx
EupdcpVhoItuwbWGhsrGPulBI238TB8vNq2IiWLhyfYheRxaTT1qISfetPy+4zu+
Vx/efuKj+jvTUUnD6so/CEaQICvy9uTFpDF53E/I90UwoinA/j4UOV/kgfcFT8Lu
5dI5QLa3AHEtskF5B/wxRNhXHlfsVi+66BJvPaWcjx/60A5HlPWMr242bsYxLUFl
M2M4mxyoGJFMdsrSasFpZZX9u1+UPSJ3B2xXwxt+tWKONk+kvO06YA7Lcucd8vpY
kFROL1I2zKYlRo4SOM6196B05pyNth15EUR/Y2m8ZuH7ubLzg9treiq5dLy9xG3w
pJS/nIX8F654tzevDS662aCF8Hwpje0ZqKcHuRjstNOdAYsQdH/c1FXwu54t/wxm
4HNLql2i0EaWVFCIT1kS4+8xwOMUun0er2/uY3m3O+wxzFEMF9mn60X3HJQS1/Dy
KJu61kqG1W0d0u9NiV5TZHFKkY/yrFGcAIQL+i8ruXO1s3YQg3/6CZFVUd4KAz42
5nTwQir16hSxb+MdJADZNw5MoYXrL/QvHvlwIQlWUrI0ScwelD4CzkqoCuTyPmiX
eHgY37DOxpXvrtQzprrt145L6/StGtfFPJuHoqPop9GLUe2w/9g=
=8aqS
-----END PGP SIGNATURE-----

--QwEQbjBJrdBSvIbq--
