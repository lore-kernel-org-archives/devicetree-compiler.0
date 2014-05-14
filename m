From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Wed, 14 May 2014 14:19:53 +1000
Message-ID: <20140514041953.GD28789@voom>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
 <CACxGe6uPerPT_cT+p1zvL20ERwuguDJWDHasxz5gAUe5kPQHNg@mail.gmail.com>
 <20140512060000.GA28789@voom>
 <1399875002.17624.89.camel@pasglop>
 <1399875252.17624.93.camel@pasglop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399875252.17624.93.camel@pasglop>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>


--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2014 at 04:14:12PM +1000, Benjamin Herrenschmidt wrote:
> On Mon, 2014-05-12 at 16:10 +1000, Benjamin Herrenschmidt wrote:
> > On Mon, 2014-05-12 at 16:00 +1000, David Gibson wrote:
> > > I'm not all that impressed by this translation code - in particular
> > > the per-bus-type hooks don't make sense to me.  AFAIK the
> > > interpretation of ranges is not bus specific. I think it will also
> > > fail in some cases with #address-cells > 2, which is unfortunate.
> > >=20
> > > I'm about to post my own implementation of address translation.
> >=20
> > Well, I came up with the original code which did per-bus type hooks.
> > There are cases where it is needed.
> >=20
> > Take PCI. The top word can contain completely unrelated stuff such
> > as the "prefetchable" attribute.
> >=20
> > It's perfectly legal to put a prefetchable BAR under a non-prefetchable
> > bridge window.
> >=20
> > However a translation scheme that doesn't know to know that bit
> > will fail.
>=20
> Oh and the other way around with IO vs. memory btw.
>=20
> > It's not far fetched, it happens on our machines today.
> >=20
> > And that's just one of the problems I had back then...
>=20
> Note that I'm just stating the problem :-) There may be a better way to
> address it. For example, for the one above specifically, well, we could
> have a per-bus-type list of masks to apply before translation (bits to
> ignore).
>=20
> I wish in fact OF had done that to begin with like we have
> interrupt-map-mask, maybe we should introduce that concept to limit the
> damage to existing well known cases like PCI and have anything new just
> tell us what to use for the compare.
>=20
> In fact, thinking more, the above mask trick might not fully work for
> PCI, we have to check the exact values, because I think the same field
> somewhat use an enumeration for 32-bit MEM, 64-bit MEM and IO ... oh
> well.

Hm, yeah.  At this point I'm thinking a per-bus "quirks" mechanism
around the basic universal translation logic.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTcu7pAAoJEGw4ysog2bOSil0QANKmcIfXAohmCy5yA5TIGdj1
GRaP9Wb11iSAJ+iKth7ZWCWcnI9EMm8UtXM0Er2VGFNhr/vi2jRkxU61NCu5CHag
k+meuX2dDI7G4LNSc8LO93r95bEm02iv444+R01ZbVxuWnIa5MGzVG8MCmaUrb6V
iQxlUg36o7GtAVOWlF6KqjgxyBRNMNoRCjwPaRUPHyLuM8kZuaRRN7SKxhJ6WuLj
IMZBZvMnDqyV3jNGMjea9T/7KlWDLXVNE9fwNsASaYWtIxtXq5L4rOthosczSpFQ
JuvJCvOVPmKZDtikqL/ZxYkse3tNrfWos7dqUwZ2opSe87AAWuOKIKm3xkuGxV1V
u8fjE37o1OvnORYC295OgBq+Meag8/2bXsIDpIJeXqL6BSYgrZAezgGdZBNMk9rl
ncUxVat7ZVX6trgCIyPOdipSaEx95JVLkPxJKWVAiy2l/RPugZrmso29hOwu9g26
+oL8mqiq0gakLXjmQqJthaM1I5FgK84X3zSFeR1E83Awdio04smwLfFZD7JlDl2R
za8Ez1fpEzbXYpVWH7K7vQm7DHzrgR9/yfLCtqnRPsRtIwZ5zk4WnEGMc/ENN6zi
y+eeNFIowuvtH9qgqnywvTOtOWeZmoeMxVfYEhPcSelFMYoDrBWyqRsi0PzdEcEZ
f+kksjDoU2yotZ9OFNJL
=kY8r
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
