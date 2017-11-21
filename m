From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] checks: add phandle with arg property checks
Date: Wed, 22 Nov 2017 09:58:44 +1100
Message-ID: <20171121225844.GA2380@umbus.fritz.box>
References: <20170814214807.338-1-robh@kernel.org>
 <20170818043502.GQ5509@umbus.fritz.box>
 <CAL_Jsq+yA2W=SD9zSkWxw-R16uNELeqPqJK3fVMvi0_jhEbooQ@mail.gmail.com>
 <20170819073333.GA12356@umbus.fritz.box>
 <CAL_JsqLEwYN9eto2PRiWG7aEzBOeNeADP0miOS_jgs5cifmvOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1511305131;
        bh=r+7a5qc0NAV/JDcWymhLzOS+RWQEIPJvmi1/ed6ANOs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZxiRTjFVhsI9eknx+szqLNOcqAp6Jz9JiyIFGGl3MyxXkSVdCC4cgXfSD88BAG6RL
         lzMbVqExkZWhq2NBObfy8ijdxqD3iGvYNBXqVV2ZCtqga/xNfOe0FwOlFxCG2zvGoT
         nKQspunoFifiJF3+O4GQuTWboUnqIGnbC7u73g1E=
Content-Disposition: inline
In-Reply-To: <CAL_JsqLEwYN9eto2PRiWG7aEzBOeNeADP0miOS_jgs5cifmvOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 03:06:46PM -0600, Rob Herring wrote:
> On Sat, Aug 19, 2017 at 2:33 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Fri, Aug 18, 2017 at 11:02:01AM -0500, Rob Herring wrote:
> >> On Thu, Aug 17, 2017 at 11:35 PM, David Gibson
> >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> > On Mon, Aug 14, 2017 at 04:48:06PM -0500, Rob Herring wrote:
> >> >
>=20
> [...]
>=20
> >> > It does mean listing everything in the check_table which is a pain. =
 I
> >> > would really like to change things so that a single macro can both
> >> > declare the check and add it to the master list, but I haven't thoug=
ht
> >> > of a portable way to do that so far.
> >>
> >> This is done in the kernel frequently using linker sections. Each
> >> check entry would get put into a specific section, then you just
> >> iterate through the entries. Would that work? I could imagine that
> >> linker magic may not be all the portable.
> >
> > Right.  Linker sections are the usual way to do this, but that
> > requires lower level knowledge of how the toolchain works than I
> > really want to put into dtc.  At heart dtc is really a very
> > straightforward standard C program, so I don't want to introduce
> > dependencies on a specific compiler.
>=20
> To follow up on this, what about using dlopen/dlsym and having
> libraries with checks? That should be fairly portable. dtc could load
> checks libs from some known or env path. Each checks library would
> provide some known entry point we can call for it to register its
> checks.

I don't immediately see how this addresses the problem.  Either we'd
have to have every check in a separate library, which would be pretty
painful, or each library would need a list of checks, and we'd have
the same issue generating it as we do already.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloUr6IACgkQbDjKyiDZ
s5Lddw/5AeXQLTn0a8r+8xRJhWGaHrFfSeL5FhabF3SH8aSyr0UFSRTLc+RdeC2I
KYVqv01bIHbLh9W21vzq9d5RsHg6YK9uGwYXRNVzWuFWByMLlXep74szsMWvreuS
sMzUj1RvTHh7Nqdr8oTdvmb6IgjdTvyDiAJ/rf4Xq+Uyv42x+jQhifGurSBs7uQ9
PH0ivNe9zXB2P8ErYR7hEl7JjKnqIvwL7I93kFCkAlksa1ejHIS77i3qyISNxyAt
X1wiJFDEH+GihgVEjpN8irPOcvaSVd2ZoK1xe6BnQq1/EiMvFsqYKoOgFec6VDDp
41QNAWqpsk7O9uETAgWBb6ZK1T2PIAlOTGnho/89+FlDsxwLsfqLRfSbSBOrB3+x
E13ckP/b+LW4S7zISxUvpY27brwYNxuDtbVyJAy9FdSne5Ub1Xrg3E+7tlWhwIna
GWaTg9UD4IbTzwEENZpuux3BBhEZ0IeCm78CGBaiLNLeQUC9Yc2vRWPmFBUFfSUs
bewCBUs88I5qxLeyy4uz9Sws5EDOMDMQaAwnUSLU6FVzZERFjsrvLQNp7KTsB0CK
mM8ChlzE5oMwazWc/wncpjnGvCtZv7mm65y4Mwp2cFkEDOwdJnnnpzK92ntgItpR
HjLbPaFvG6VrDR0dHTXHabDFKREoqZAqr6wUbzMNRj0kI8QwW9U=
=unUY
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
