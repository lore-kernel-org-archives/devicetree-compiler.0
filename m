From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Overlay syntactic sugar clarification
Date: Wed, 10 Jan 2018 19:43:49 +1100
Message-ID: <20180110084349.GH19773@umbus.fritz.box>
References: <CACNAnaFASS-1dC4Vp7JbwEjtF0vbAxOP248AtPabPLhZ_MHVoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7SAgGoIHugoKhRwh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515573874;
        bh=v1NOD3Yi8Qt/r6qKcWYwwGris5pE/x71ty2Fom1rjnY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gqKVnGJDNQKI7WIhLCwneFRYRD1kL4/+75zudGp9EQD9q0xpGYIzkuLlyouLy4l+o
         BEWnumUjg1JKuAgD7mwy5Uj7KPYBqn111IsivfKVK3WLISpxcD0ps3T0uK8rF0uCJ6
         yx7NU2sZ2X9i3Q61ih9C6UzH1X0RxpA5vsppU2B0=
Content-Disposition: inline
In-Reply-To: <CACNAnaFASS-1dC4Vp7JbwEjtF0vbAxOP248AtPabPLhZ_MHVoQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--7SAgGoIHugoKhRwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2018 at 11:36:57PM -0600, Kyle Evans wrote:
> Hello!
>=20
> I see the syntactic sugar patch was merged in late September this
> year. I have some resulting questions:
>=20
> 1.) Are there plans to deprecate the handcrafted fragment syntax? I
> find it somewhat useful for hacking things into /soc (via target-path)
> for development since this node is often not labelled, so it's
> probably a good idea to ask this up front. =3D)

Hrm, I'd say we plan to "deprecate" in the sense of it not being the
encouraged method.  It's not really possible to actually remove
support, since the overlay format is just a special form of a dtb.

> 2.) Is it expected and/or OK that the output/behavior of this dtc(1)
> gets kind of funky when combining handcrafted fragments with these
> generated fragments?
>=20
> "funky" ranges from outright errors to silently merging a handcrafted
> fragment into a generated fragment in a way that yields an overlay
> that you're definitely not expecting. If this isn't a supported
> use-case, then I suppose this is OK.

Hm. So, I don't think we need to particularly accomodate mixed forms.

But then, making it possible for the user to reason about what's going
to happen even it odd circumstances is always better as much as
possible.

> I ask because I recently implemented this syntax into our BSDL dtc,
> and naturally in my work I had it generate fragments for these nodes,
> merge them all into one /, and renumber any handcrafted fragments
> based on their position and the "fragment delta" (highest generated
> auto-fragment at that point).

The only reason I can see to use handcrafted fragments is to have
great control over what's there.  Renumbering hand written fragments
seems to go against that.

Allocating generated fragments to avoid handcrafted ones, or simply
erroring sounds like a better idea.

> The reasoning being that there's likely no good way to merge a manual
> fragment with one of these auto-fragments, and with our implementation
> is was almost easier to do this than it is to just discard the
> handcrafted if we start out with the sugary versions.
>=20
> Thanks,
>=20
> Kyle Evans

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7SAgGoIHugoKhRwh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpV0kMACgkQbDjKyiDZ
s5JexxAAvo23V32jPDxNHfaxSYga71TI55CGCDi1+LcagpaJceLJbynS7GUISY5R
Te5IgxW/KMuHCIjyeFSWQafis9TZk8v2YrYjtGNizB9o4IbFQEWfSSy0bqzMUFCp
+1FyWh7riJqeDtBTZYAaJs+LOH0nccBl2SEtyl5y6CxvQ5mlbZDpUEgCrncgNKW+
z1ft40qRf1n6LRK73K38qUIS5QTHGxoh1SD+sE0E1p96HIfM484uD/sc4D7WsDHz
kst4gbBEqYuiPSileWqVsvGcD/Bke16d21tvnD/joKGi4D5peZ/C9HgPbIl76MkW
r/h8JxXwKhRAUti+KESTciQmBoFSiGlqTvifNb6wCjueANmw0dimYAWCcVbd4YNK
Dq/LK2lPzwOPK0+5PxSQmSjpI25OX6WNpJBnaOsL2VXPiDa0zsjowVQfI6HNgM+f
sJ/q4flVVc1NoZAXdseFdq504JHVUWjfJY9ZgBoZf0WBalTYgJjCrwSGLbcQYwYy
FNbcBMqFZyPejIInViTfDEINkR8N+cFhjMtLrj9csgfKeuvxxdQ3U5Qj0o6nqKoP
sWEWaZSDzJohYeDVSWzSKxp3SGRKeWCyjwRMBf5bsHFtj/wifTu5aT3hE5dpn2FN
POHQzhY2pktHbsXFat2of7vpqv0Nl778kuFTaLtK8XWIwf+nda4=
=lSpt
-----END PGP SIGNATURE-----

--7SAgGoIHugoKhRwh--
