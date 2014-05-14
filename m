From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Wed, 14 May 2014 14:18:49 +1000
Message-ID: <20140514041849.GC28789@voom>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
 <CACxGe6uPerPT_cT+p1zvL20ERwuguDJWDHasxz5gAUe5kPQHNg@mail.gmail.com>
 <20140512060000.GA28789@voom>
 <1399875002.17624.89.camel@pasglop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399875002.17624.89.camel@pasglop>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>


--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2014 at 04:10:02PM +1000, Benjamin Herrenschmidt wrote:
> On Mon, 2014-05-12 at 16:00 +1000, David Gibson wrote:
> > I'm not all that impressed by this translation code - in particular
> > the per-bus-type hooks don't make sense to me.  AFAIK the
> > interpretation of ranges is not bus specific. I think it will also
> > fail in some cases with #address-cells > 2, which is unfortunate.
> >=20
> > I'm about to post my own implementation of address translation.
>=20
> Well, I came up with the original code which did per-bus type hooks.
> There are cases where it is needed.
>=20
> Take PCI. The top word can contain completely unrelated stuff such
> as the "prefetchable" attribute.
>=20
> It's perfectly legal to put a prefetchable BAR under a non-prefetchable
> bridge window.
>=20
> However a translation scheme that doesn't know to know that bit
> will fail.
>=20
> It's not far fetched, it happens on our machines today.
>=20
> And that's just one of the problems I had back then...

Ah.  Bother.

I supposed it's arguable that a PCI ranges property really should have
windows for both prefetchable and non-prefetchable areas, but since
that's not done in practice, it's pretty much moot.

Ok, I'll need to rethink.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTcu6pAAoJEGw4ysog2bOSloIP/Rzf5BKujlQjHAH2XEHJGxSg
u93qoZxFtljh47QQnkLaY8+z91MHEOmSv3MHbBB8RoSRLRBgKL811NwvyRuANzJu
PQN6QpUQUHAc6A+1CS/5XYwvKFlo+3DLYvfx2hz4Ss0mYqR8KzeC8lRXU3TawFXm
pi0o5pt944lp12sZQzBWK7Gk1KYVj3YtqM7a6FDJzqrzEOWEcBaLFTwzlgWnEEdz
4FrxIhZsi4lZuK8eEZ2xbFU09SELf3cfSlLhPHRBfDXTsjCnZ1ef3+leSqxF6ynV
7gwGUCHXsy+w6ECDrhHSQJb7PW9xsCikPjmHI/MUjf+YM3GODeligdNQ/TwdU4YX
rnTSLqb8vHrloZ3XoFCZrOluFa4Q0BKJYTP63iX9kI8+DFBMPaYEZInbYNKySebG
87vI95rmbO5QiWmwMGQ3O8jUe+bOeg0kE5S7PfuMqfQ1aUdghe1q9fdcpy1OVIH0
cu/ND4I9ep8jypIxmwfAHr6CNSn1FSZPKkrRXh+dLpTpfR6FCnfx2jrX/rvr+HXC
Juoe9+mOcWDGa2rZBFeB/0EkFJfnnq4bX3fCXztYy6xb3gpEe+rZtzqcAMtASvUE
45tO0+k5WBZldoo1+gxlDxFqwsbd46pwbYrdA/m3RE6c3aY5i0QrSnBvTHO/CXop
0q3yHLRRg5DKBAEgyuHS
=nIJ9
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
