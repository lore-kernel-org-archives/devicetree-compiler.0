From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Testsuite failures on sparc64 due to unaligned access since 1.5.0
Date: Wed, 16 Dec 2020 16:46:45 +1100
Message-ID: <20201216054645.GB310465@yekko.fritz.box>
References: <10d4dbcb-506c-df88-cd71-f3ad27254341@physik.fu-berlin.de>
 <4e3cdb1c-87c4-810b-513d-eaae64456d36@physik.fu-berlin.de>
 <20201211010739.GB4874@yekko.fritz.box>
 <CAL_Jsq+N69AdhS+fa5VR_Y86_Sq5_sSNiKc14fW6B1fHRbYBEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1608100187;
        bh=I9LUI/HDR7tnyONOERoi0ttnMqH3lKWEuMPaewXlgpQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tg5x8uRWerKWc4trt2H5XVFgLwyu3NhaM2pGMgyFk1M8s6PfKLO/WOT1wXfaSGn2H
         NBuDldAKT11Bv0GPpcMkAjpEsmtVMom4DWQwFhaSv8TpbjnQQ1iL4ZsKoKlthV5ZAp
         vedatupA9UkyOmellalaXBMF20UUseffQ869+5xs=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+N69AdhS+fa5VR_Y86_Sq5_sSNiKc14fW6B1fHRbYBEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 08:03:42AM -0600, Rob Herring wrote:
> On Thu, Dec 10, 2020 at 7:09 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Thu, Dec 10, 2020 at 10:04:47AM +0100, John Paul Adrian Glaubitz wro=
te:
> > > On 12/10/20 10:01 AM, John Paul Adrian Glaubitz wrote:
> > > > I have not done any bisecting yet, but this is most likely a result=
 of someone casting
> > > > a pointer of type A into a pointer of type B which is normally not =
allowed but unfortunately
> > > > also not something that gcc complains about.
> > >
> > > Hmm, it seems someone fixed the issue on git master already:
> >
> > Right, alignment issues have been a perennial problem.  We find some
> > platform that has alignment constraints that break, fix that, then
> > someone finds the alignment fixups cause horrible performance
> > problems, repeat ad nauseum.
> >
> > There's been another round of this pretty recently, which is probably
> > the cause of the fixup.  I just hope the re-optimizations that Tom
> > Rini has in his pipeline don't break things again for you.
>=20
> I think the case here is dtc, not libfdt. My guess is something to do
> with marker handling writing out dts.

Ah, sorry, I wasn't paying sufficiently close attention.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/Zn0UACgkQbDjKyiDZ
s5KaVg//RSxj5satuWoCQhUOOLF9KaC7xDOG82VwCWEeL0dnsw0g+++s2rlnKeuC
jTf69JHy0mDvlULI1WRgKCvIqJW3XrtHEZkyNLKswGnWBHDEV8XhC8DkYsT88lGM
hEjKIeC9HSyFb69dGWu+0yaMh8JFDP49EiBdwF53LQVYFrMJi09EUnMyzv8tGdMw
dqOnZOM7Tvt36Lx3V1zYquGPmaqNBRktQuDXQRM9NAo3WDec1I6HG/+Z7OSouVx9
Ixrw+D51gRDntOfprP7TlRhL4XPjdx7Q0lhJ3vPrTZISqkMp7axK1QbKnTnt8zqj
yQYJ+vK+uVtdxV9cPtoapaKa9i9ChsADnvygNupcil1ig3/Ka50uQfaaYgYkH5iu
HYtg5mmApXU72FZRG8NqX2Bds+xfJbV6BzO8BzTKECVASfg3e8pViHFm1gZq+gt+
yQXofQwpG1zKTVvRO8g8/YzBK8ftJVgEdmD597LOnRIzfQ4gAiIkT/iC4v9mqpq/
deVTKE3YLJgTM8TV3UeaysDtNMFhC2asByylfsno1cI+GE8jFbs125BM6SWFRFGw
f0PVkGU7Fr+4nJ8AS6/JD7DXrRG4APm5vmQ3boOFo0jhKSqaT+IwHgkr0iRS5iOv
lSd95NV6Xf1DcHV6PxC+NbK4zrtlc7vhzO4VXzZgLHi3pSmfFaM=
=ezAf
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
