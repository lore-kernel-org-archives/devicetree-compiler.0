From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: add size_hint parameter for get_path
Date: Sun, 5 Feb 2023 17:32:26 +1100
Message-ID: <Y99NetGSF76cW50C@yekko>
References: <20230201181112.1644842-1-luca@z3ntu.xyz>
 <CAPnjgZ1hHkTuAiUwxPuTeWTeJX1Sju2tnZz-pCyBY0BeW6cYhg@mail.gmail.com>
 <Y9taTeDc9Nro2F43@yekko>
 <2060136.KlZ2vcFHjT@z3ntu.xyz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ubbdJxLCfmxdzIs8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1675580751;
        bh=RoA0XasGNRLagrCaQsEE19E6/zUBkY5iOUhkxvmJWcQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BgggTasLnSMZMY9GcUQFkQzX4ZUYaO4C6PGvtdWGttwayEpMOwfLqYTmwHrOnPPyN
         0vJRvzwWyL2BexpvHdwMpUcb19SQB8X7877+5/jOYUGGfSSQurtJH8Wp6f/sS/zYFb
         c8U4GxyXTFI3Xsp/jTmkQFnt2iBV/7s+93LQBkmo=
Content-Disposition: inline
In-Reply-To: <2060136.KlZ2vcFHjT-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ubbdJxLCfmxdzIs8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 06:08:20PM +0100, Luca Weiss wrote:
> On Donnerstag, 2. Februar 2023 07:38:05 CET David Gibson wrote:
> > On Wed, Feb 01, 2023 at 01:20:51PM -0700, Simon Glass wrote:
> > > Hi Luca,
> > >=20
> > > On Wed, 1 Feb 2023 at 11:16, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > > This also enables us to test the -NOSPACE condition by adding a test
> > > > setting size_hint=3D1 so this path is taken.
> > > > ---
> > > > Follow-up from "pylibfdt: add FdtRo.get_path()" from April 2022
> > > >=20
> > > >  pylibfdt/libfdt.i       | 8 ++++----
> > > >  tests/pylibfdt_tests.py | 1 +
> > > >  2 files changed, 5 insertions(+), 4 deletions(-)
> > >=20
> > > Can you add a motivation for this? Why are the paths so long?
> >=20
> > I'm also curious about that.
>=20
> Please see this for context:
> https://www.spinics.net/lists/devicetree-compiler/msg03922.html
>=20
> Basically just for the new test.

Ah, ok, I'd forgotten that discussion, sorry.

> > > Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >=20
> > Code looks sane, so
> >=20
> > Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> >=20
> > Unfortunately, I have no way to test this until
> > https://github.com/dgibson/dtc/issues/78 is fixed.

So, turns out this was triggered by something bogus in my git state.
I'm not sure what went wrong in the first place, but I've gotten
around it by making myself a new clone.

> > Also, I'll need a Signed-off-by line in order to apply this change
> > (see CONTRIBUTING.md for details).
>=20
> Right.
>=20
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
>=20
> If I should resend with it, please let me know.

That will do, thanks.

Applied.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ubbdJxLCfmxdzIs8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmPfTWsACgkQzQJF27ox
2GeXJg/9GoWHmytQmYwwsR7C88Azu2tJaKmMQcFo+J2KC/11ZwwZcONM8mUlncl5
lfQ/kwgGXrYFMTkfllAm06vOhhsqGT/B/Xsv3P977F0OyL7p917YYmW5O7YLgbx3
monIzpGPbsO/E9qGrHWrMl996OULesgUzuhl0b2GJkMZatdGlH6aiRoylGa0s43K
NuUhjVBmGpSwyOGSKKwlx5tQLVbLeaEp34/u9LA5iedl50UWOQnT9aokeokC4WUE
SBMcMDoXknhE2m/G1+mF1DE2Tfg8UnhA7I+9jEh+a2P6Wg5NcOxhRZAv+DDxl2fC
y2n8enWXudqwue7KOaUaHFpWsIiihPzm9TRv7Hyu6sSW+DgAqHLM64iC2Ae8+vox
puWZOdCbvLsm2MyM0P0v5ek8gNXEHLqj1UG9F50A7tBABTz1Kokm9EMnZS8HPLxF
UC+gIu8iYlyR3d8miLSxq/VUCUaThci5KHsiATV4SLbb6oWH377lm6v8CKMEwzR+
eugx20eYZFCxpF5gbuMQb2f4WjZMeUnGYiTk20u7EFAYOGJZ83bS3iaOtxUbcY7l
OBxQs5fEL3g9DDrdDve2M2R91utHtG2ySIVlmbm58vJTc0ZC98l8zPybQLZZ3zMp
HFZkpOKIzFhifTHEG9wPWm0ONaCYkxIfyrHOcWN58e39iKA8B5I=
=r1Oa
-----END PGP SIGNATURE-----

--ubbdJxLCfmxdzIs8--
