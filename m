From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Wed, 14 May 2014 16:51:43 +1000
Message-ID: <20140514065143.GA10865@voom.redhat.com>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
 <CACxGe6uPerPT_cT+p1zvL20ERwuguDJWDHasxz5gAUe5kPQHNg@mail.gmail.com>
 <20140512060000.GA28789@voom>
 <1399875002.17624.89.camel@pasglop>
 <20140514041849.GC28789@voom>
 <1400045038.17624.239.camel@pasglop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1400045038.17624.239.camel@pasglop>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2014 at 03:23:58PM +1000, Benjamin Herrenschmidt wrote:
> On Wed, 2014-05-14 at 14:18 +1000, David Gibson wrote:
> > I supposed it's arguable that a PCI ranges property really should have
> > windows for both prefetchable and non-prefetchable areas, but since
> > that's not done in practice, it's pretty much moot.
>=20
> They don't have to, only if there's a relevant difference, ie it's
> perfectly legit for a firmware to assign prefetchable BARs in a
> non-prefetchable region.

In what sense is the window region non-prefetchable?  Isn't that a
property only of the final destination of the bus cycle?

> Now granted, those are somewhat special cases so maybe we should
> do just that ... special case PCI and try to not continue that mess
> with new bindings.

Yeah, I think that's the way to go.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTcxJ/AAoJEGw4ysog2bOSYPoQAOXBcF9Va9R2kFzw9VM5KWst
BhpCqdY2ITYokYIDAqGi20n/JaBkmlOLBBzhZGnX7vf/Sa5Y8UBAh13IVT4jrWXF
BJbdtpLKcuawt6m51ewQ96SIiljlddKU5OJaL31irvuNcvt9/RUvFiyi3L+L+C8b
KR3Tar1jMQmeEx9DxnFEcM+rGUZ7fXuY8mnSg2t0XgS6ZDAZW+qVp1famYfSLi2c
G4rMqjN1Jly8q1Wp0pbdOJhMOMBb/rlKwQU9QZWwBCgDtnyaqSviz1mBbMJ+NkKz
/6BvRqu9OfeFC3pwSMJRP6VBn44YV9ZxFp5Mb0NS2LEVnhsIa4KI4V5eapao+nZO
PyICFqaH9wkBtTT/0vcdCtTPjF1VhHmwjK0FjZJKcHxlVBm5p0c4J/LQ1TlNhEi4
e/YBP1osBFEZltW7EMz28e7u7Dvb3lnsP0V6EIivdnnYP9/bw/G/VCxFnwywXo2g
CN50L4xdjFMz1jyz/Le/8SK8BVmdEut9fVahbiwbeHv9n2GzT4fe2791Gi3ryd/i
cwtRx5kDhc1NFQMHbU54NKre/2ht19i9ZFDV08gp+RYZ02JLv2P1vcWYMse1hZ7H
ff6BVHjbs/jIbrpU6iEtlV0+3WsJ242ZNaiiuxnQ1NS3XCoBe3aqvmnDeK1N3pFv
W8bpqz6qMyWvsVgDQoKd
=2VrJ
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
