From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] pylibfdt: add FdtRo.get_path()
Date: Wed, 26 Jan 2022 17:35:11 +1100
Message-ID: <YfDrn0DT/IvQ4sGK@yekko>
References: <20220122105653.31219-1-luca@z3ntu.xyz>
 <Ye+BIkvoQF7/qy9N@yekko>
 <2266584.iZASKD2KPV@g550jk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z4RHlx0MgKd1HXzH"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1643178947;
        bh=eJcyg0yYS/NsoT3x4iAKH8ZYI8l2oSRdmSi3pW3xZNM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=omPTCqxLDf0dmZVTtBDE8fWFI7WDuvEin6/GHPtD/MpsS5XSgWsEIYIYkva2mx8sS
         M6psLvGssVJdZmI+GnMMdWX/MgEezrKdcxnjsR7Tbe/aWKDZoiTBYlZ63lKw9+V43r
         E59ZKKBe5AHML4oohUFYL2BvaEdHmcaJ0i+/e3ZA=
Content-Disposition: inline
In-Reply-To: <2266584.iZASKD2KPV@g550jk>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--z4RHlx0MgKd1HXzH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 07:36:17PM +0100, Luca Weiss wrote:
> Hi David,
>=20
> On Dienstag, 25. J=E4nner 2022 05:48:34 CET David Gibson wrote:
> > On Sat, Jan 22, 2022 at 11:56:54AM +0100, Luca Weiss wrote:
> > > Add a new Python method wrapping fdt_get_path() from the C API.
> > >=20
> > > Also add a test for the new method.
> > >=20
> > > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > > ---
> > > Changes in v2:
> > > - dynamically increase size of string buffer until it fits.
> > >=20
> > >   The values are chosen relatively arbitrary, and terminates at lengt=
hs
> > >   over than 4096 as I don't expect paths to be longer and there should
> > >   be an exit condition to not eat up RAM in case of some bug.
> > > =20
> > >  pylibfdt/libfdt.i       | 27 +++++++++++++++++++++++++++
> > >  tests/pylibfdt_tests.py |  7 +++++++
> > >  2 files changed, 34 insertions(+)
> > >=20
> > > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > > index ac70762..d103bb6 100644
> > > --- a/pylibfdt/libfdt.i
> > > +++ b/pylibfdt/libfdt.i
> > >=20
> > > @@ -443,6 +443,28 @@ class FdtRo(object):
> > >          """
> > >          return fdt_get_alias(self._fdt, name)
> > >=20
> > > +    def get_path(self, nodeoffset):
> > > +        """Get the full path of a node
> > > +
> > > +        Args:
> > > +            nodeoffset: Node offset to check
> > > +
> > > +        Returns:
> > > +            Full path to the node
> > > +
> > > +        Raises:
> > > +            FdtException if the path is longer than 'size' or other =
error
> > > occurs +        """
> > > +        size =3D 64
> > > +        while size < 4096:
> > > +            ret, path =3D fdt_get_path(self._fdt, nodeoffset, size)
> > > +            if ret =3D=3D -NOSPACE:
> > > +                size +=3D 64
> > > +                continue
> > > +            check_err(ret)
> > > +            return path
> > > +        raise ValueError('Node path is unexpectedly long')
> >=20
> > Ah... sorry, this isn't quite what I had in mind.  The idea of
> > resizing the buffer is to avoid having an arbitrary limit, but you
> > still have the 4096 byte arbitrary limit here.  As Simon suggests, 4k
> > would probably be a good *starting* point, rather than an ending
> > point.  Not only are repeated calls expensive in Python, but
> > fdt_get_path() itself is also quite expensive, since it needs to scan
> > the dtb from the start.  I'd also suggest doubling the buffer size on
> > each attempt, rather than increasing linearly.
>=20
> I do think that there should be a limit *somewhere* instead of hitting OO=
M if=20
> there would be some bug in the underlying implementation or the file prov=
ided?=20
> I'm fine with limiting it at 100MB or whatever but I would rather have a =
limit=20
> there than not have it.

Well, it can never exceed the size of the whole dtb, structurally, so
I don't think it's really a problem.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z4RHlx0MgKd1HXzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHw64AACgkQgypY4gEw
YSLV7w/+NMTY5r533yYDwIOFpkAHaKk5WO236usLG/1Q50LTKuaN4TYf7mOap6s2
LgdQWXncZpw04vpwJDRC6y0AVpmFtNLmuxIWTmxcDgfRqcxTfUynPnOUmWP5uyAR
MXkSEYxngs1bEDWk3uCtDUhKvKqT39MwH1f4BbnwFfZ2Xivr8CIC7iU6CX8LrrP4
3nERMapF+0pi7u5vkTWdcigF/JGp7TN20k17k6Pkz06iO+md7ine4GY+ZHwtlMra
PiFFdOIJ1xvI4VWRYxaglbPYPtSU9tROIUyvjylgkwFEAQjIihZTTSe97XTluqLs
nsBHZ0OGANHseePX97QDBjptwhlT3rTUv4LI9JKE1pE3BWe8ss2f3HOXdhKtez1m
9KMmaMiB6E4QHd+cu4iSG6txNBCEvG/sb5D1T0e2nKOviQbJcPic879f+khQV8D5
PVISwQEJe4VYxrogrnvVcaarlq9/Eqd0xUiJjczlJ/euYgS0v4FedYAC0wFJUqoa
tah13XQa+hC6O3l+BkDJDGQmGdtQZovuY+1hOISfVbEPOGjb6PFjPo1JrWZWUqbW
TjawgbmdpB05Gp5wjqK6viETHUBlykqFZ/N+El8oZbjxo+dJkFYwUZJQKoayIQrO
CGG5V3qCNOFQdsfZcXUKDFV6HeLRfZDDf2GemMdzHBt5Ps7hdIw=
=EOlz
-----END PGP SIGNATURE-----

--z4RHlx0MgKd1HXzH--
