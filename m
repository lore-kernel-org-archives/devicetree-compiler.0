From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Testsuite failures on sparc64 due to unaligned access since 1.5.0
Date: Fri, 11 Dec 2020 09:41:58 -0500
Message-ID: <20201211144158.GX32272@bill-the-cat>
References: <10d4dbcb-506c-df88-cd71-f3ad27254341@physik.fu-berlin.de>
 <4e3cdb1c-87c4-810b-513d-eaae64456d36@physik.fu-berlin.de>
 <20201211010739.GB4874@yekko.fritz.box>
 <3b237853-dd8c-99b7-e258-7c51e9970560@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9OC2iooDHtHJ1Xen"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=d7jIkTA53ONtVp84vYhVQU2rrFVELCGZFTTrNdjDGLk=;
        b=NG4+OOYgOGxUn1JwTlvj7S06CT+a1JWtw6I3CB6eszAbEuYzq6V09Y/ZJ8uttBPgsA
         kPM9l4fLPBnMrLb5ViHY8y2J/KtUKi/S7AeStx1zPGJ9xJ77oYc+wxuKkE7/a1W2k5s7
         0q5m/GBmIzs1jCEnHmKTDwZsAjADOTNhXFcnw=
Content-Disposition: inline
In-Reply-To: <3b237853-dd8c-99b7-e258-7c51e9970560-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--9OC2iooDHtHJ1Xen
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 03:14:26PM +0100, John Paul Adrian Glaubitz wrote:
> Hi!
>=20
> On 12/11/20 2:07 AM, David Gibson wrote:
> > Right, alignment issues have been a perennial problem.  We find some
> > platform that has alignment constraints that break, fix that, then
> > someone finds the alignment fixups cause horrible performance
> > problems, repeat ad nauseum.
>=20
> From my discussions with GCC developers I have learnt that it shouldn't
> be a problem to use memcpy() in such cases to avoid aliasing problems
> resulting in unaligned access.
>=20
> GCC will just optimize memcpy() in cases where an unaligned access is
> faster.
>=20
> > There's been another round of this pretty recently, which is probably
> > the cause of the fixup.  I just hope the re-optimizations that Tom
> > Rini has in his pipeline don't break things again for you.
>=20
> The GCC compile farm has two fast SPARC servers [1] running Debian unstab=
le,
> so I suggest testing such changes there before merging them.

It's just restoring the historical behavior, and Rob was just saying
this was a change in dtc and not libfdt, so should be fine.  I sent out
v3 last night, but I don't see it in the archives yet, if I sent it to
you directly would you be able to give it a quick spin?  Thanks!

--=20
Tom

--9OC2iooDHtHJ1Xen
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl/ThSsACgkQFHw5/5Y0
tyyUVwwAoFz7c6yo0qfT+52vYVud9GeoS/ytrCnVXAzalCi5pJGhanTtQX9+ooYl
RF8dLrjciOhdOFv84BvsTKcHk1Srgs4RcJ/11wTT4YnWYPLc6qFmGkDKhyZ9dm23
mehXuK5oqZONQJ2efPWyv541lXXvBYJa7zBpOrSpGRvxhuI59vX2jFnwcDEOWwsG
43E7XBTrRyBmwsAg8OyhJ67IVHNUNUqr82d9RRhTuIJszKDDzR4L2Shjm/UC7Vk5
NrvT6WaRJjM9fDoahi+JwFoGy4i7Kp5Hh/NbbDx6o8J7r8tdYTBYt3HDD2sYQmlA
2QxOyge+4l3ejwnF9hS0G/IfC2g3J3FkIIAw2hRIHn3vfYhM+tviNNTnt6nN33lt
HZy8YHzklFB0h70+hrpfWu12f4RIRv9KP/d1bs16FHNQ8gOHZ4CWYnK2h2kQ6m4i
wLT5/9WCan3OIkdsuT27i9U785LMT5x7qzRJK0D2nupf5UgCulLWoVPsy33rjeph
m4x8L/uC
=2nAk
-----END PGP SIGNATURE-----

--9OC2iooDHtHJ1Xen--
