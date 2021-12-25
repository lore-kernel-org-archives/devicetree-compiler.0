From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix Python crash on getprop deallocation
Date: Sat, 25 Dec 2021 17:30:54 +1100
Message-ID: <Yca6ngoVNP5ZDAHR@yekko>
References: <20211224102811.70695-1-luca@z3ntu.xyz>
 <CAPnjgZ227FLO_UYqsq44dQwOYqa+vXuu5BGgmjoCThHnTGS5FA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bRG0C5JcRPdgo5xg"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1640413860;
        bh=VmNga/+j6/caf571uxsxCLt7dV00UWADtHshDyZRJTc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WhEHqlyUUErw5KFhe3xlvBJhUoG3LLjARB92i+jg9lXz9HhH3KnbpzKi23DCM2kew
         p8fJI11f73miJipFKU0hpkUuPeP8hgfkSCeIPleUdWTZzzYvPWetIjzHL6K0Dg1qD6
         r3CKsUcVn8VmgBtQUS3vg6Xw7xdtQhUhQL5T5jDQ=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ227FLO_UYqsq44dQwOYqa+vXuu5BGgmjoCThHnTGS5FA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--bRG0C5JcRPdgo5xg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 24, 2021 at 06:17:25AM -0700, Simon Glass wrote:
> Hi Luca,
>=20
> On Fri, 24 Dec 2021 at 03:38, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> >
> > Fatal Python error: none_dealloc: deallocating None
> > Python runtime state: finalizing (tstate=3D0x000055c9bac70920)
> >
> > Current thread 0x00007fbe34e47740 (most recent call first):
> >   <no Python frame>
> > Aborted (core dumped)
> >
> > This is caused by a missing Py_INCREF on the returned Py_None, as
> > demonstrated e.g. in https://github.com/mythosil/swig-python-incref or
> > described at https://edcjones.tripod.com/refcount.html ("Remember to
> > INCREF Py_None!")
> >
> > A PoC for triggering this crash is uploaded to
> > https://github.com/z3ntu/pylibfdt-crash .
> > With this patch applied to pylibfdt the crash does not happen.
> >
> > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > ---
> > Unrelated but I've noticed that in this file the indentation is quite
> > mixed between spaces and tabs. This patch tries to keep to the style in
> > the lines around.
> >
> >  pylibfdt/libfdt.i | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> My original idea was to use tabs for the C code (to match the libfdt
> style) and spaces for the Python code (for PEP8). Looking at it now,
> that idea has not continued and I'm not even sure it was a good idea.

Sounds like a good rationale, but probably not practical when combined
into a single file.  I'd suggest making it all spaces.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bRG0C5JcRPdgo5xg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHGup4ACgkQbDjKyiDZ
s5KrVRAAonIeWyvbYdD23TcOo6eLzTSVOHpLQBIlAR34afTTC+M/8nw/8v7P2jJT
IOP/7zwqzOW1z8IfOmfLMDrWZ9qB4Er/QCdVsbFNN5ecQ/R97ECQFT5tAKqYUzVI
hjVwZnJqoSDaqmf7AqgKC2xcsNIVTYKMJKagTiAFaHGF3Dkjn/YBhS9N+Ik4jT2f
k+iIjebMFEF+5oTm9aaMyQ5ubB0uIOl/n5fcJOngyZrozf/gShBYJZxTssZ2DZwu
cIg/BWRrbP7urZJRBiGLJsS1y7qgyEcfpPQa1Stm8Ri5uR7UATW/zAY1v+jZyndy
PyIXpSLVw0w98gzjo9mvw37ziofBRgFoBtahN8Heusa4MCKK4M95My1KRoqyelGG
509d+Ffh3MuiCgI92KgXf0iY7y71jZQEWdfkrUYj4U3R3Ifv9h6hqLSMZM9yLedo
5oV3lSFVg4/r28wbpJtg1t+Rp0lzXr3qhxjnBozoDNgSAPWCltIj7jazSVZDmK6c
IeCy47IoOJfLgd+uOlbv19ObT/VLGo/Ug5mskRzCFoTfitXQNGOK7kFrmDz87YoJ
lNRRDl0XjnNyDLbw4l2Zu1lvylc74nEMq5ng/qtUNNgFHP7zqZ21wFRtvJYC73Ct
TxyZPGjDy/kyvrmeJ7I8ByXi5/rnEgfiXxQCoAfTy0tptYgsT30=
=QfLY
-----END PGP SIGNATURE-----

--bRG0C5JcRPdgo5xg--
