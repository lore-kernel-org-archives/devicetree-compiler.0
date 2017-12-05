From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] checks: fix sound-dai phandle with arg property check
Date: Tue, 5 Dec 2017 11:32:12 +1100
Message-ID: <20171205003212.GB3057@umbus.fritz.box>
References: <20171204090723.4810-1-peda@axentia.se>
 <CAL_JsqL06MGVJpUvMj_he09itK-k4XUDL-bn9jY-0PJ5Cacu=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1512435022;
        bh=TfwncD/eXb0cQ3rSR1KyfGmcmNg8yd55jZ5JLTz4O5A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nNtydhDXPNGMwENCIsaHPfpHL7Rl0MWAaSLhEDJH+CYF1p8Qpu/g99OGqKHImXPtn
         8s8sfpGwZBQwAMdub8d6GTO+KHEv6p1oeGHjSi9bmFjOlcmviVsVPVCrwxisWonQee
         B69N9VBmsP3rHdp3vY8kCDhNRlZyPMvTMCCo2RFI=
Content-Disposition: inline
In-Reply-To: <CAL_JsqL06MGVJpUvMj_he09itK-k4XUDL-bn9jY-0PJ5Cacu=A@mail.gmail.com>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2017 at 10:22:19AM -0600, Rob Herring wrote:
> On Mon, Dec 4, 2017 at 3:07 AM, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org> wrote:
> > The property is named "sound-dai", not "sound-dais".
>=20
> Indeed. Unfortunately, we've been inconsistent.
>=20
> >
> > Fixes: b3bbac02d5e3 ("checks: add phandle with arg property checks")
> > Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
>=20
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

>=20
> > ---
> >  checks.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Hi!
> >
> > I don't know if this needs more work? Maybe #sound-dai-cells is optiona=
l?
> > Maybe there's a lot of fall-out in the kernel? Anyway, "sound-dais" is
> > definitely not right...
>=20
> Some of the bindings treated #*-cells as optional with missing being
> treated as 0. IMO, we should fix all those cases because that's really
> the only way we can generically validate bindings.
>=20
> > BTW, I reviewed the other properties added by the fixed patch and found
> > no other similar spelling mistake.
>=20
> Thanks.
>=20
> Rob

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlol6QkACgkQbDjKyiDZ
s5Lb+A//XNb2A7H6fWVgFmgfraCsnpMm/vs1vtaA1Dm0/oX/3hJRpJB/qrppaW2q
EO+ot26TrZxK9IjHzUhZWQTFNYtVxwv3GPM1NG0Fv7W+lRLRlSQudd4YxBL8k4fZ
QtcAEeXunMjM0cs6hX55TGgMvL2F7XpinU1YmzvfkIkE4Sfe9QzDxOL4rUcxt63Y
ftCM1u2KGcD5lSpWYPjGFYTv6QtgimSsYvCcq3GphwgMRY7n0o2HMhBjLh6N8ALE
ZseVPpFxJONBo8Syv9Tzc2J4ZenjaaoB1RwARBAgleTdsokzoyrlP2aluWz8aPF/
95BBUbKjyig2K4k09WugkeYuha/U3zq0O2zYAX0Ek4KoCalDsxdEU8G7MVF3wl4g
l/HMUFhnT6SjC4PHSI/SNShy07hOi9cgUkjKJ1uiYKQzUHqwGhlvScz0iraELi0p
5SWOwHouBTVd/JYCNO4Z1j7lgNyVm7uEuxKRhNaAxNE9f/PUKU2WL5FCG8m9N4wM
cZC7EvPPaMTITLgCA1lgjtWzVU3pVathsWWgJ7+onMK9gse26hIECJ7+KWzgZGlh
8mbr2/l9KHcUIepSrZJz1uC7aXtYiT6VF9cN6Y9H6Bn1gdrulzljoD+GEpZ6dMzq
5fO9c+rNR66SxB3K76vHX6vF5Ad430g99DictOZiXtWBt2b0tLA=
=jbbI
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
