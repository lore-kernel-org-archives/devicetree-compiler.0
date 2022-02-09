From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Introduce fdtgrep for subsetting and hashing FDTs
Date: Wed, 9 Feb 2022 15:05:26 +1100
Message-ID: <YgM9hujN+PTXdi3d@yekko>
References: <20211107224346.3181320-1-sjg@chromium.org>
 <YgCblAa5Hxw33OXV@yekko>
 <CAPnjgZ2HZCtfhF2BhUYk0a-UOVrMf0i_uQrbGPhWJoaq1ZtW1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u3r8JM49b8AqtDjn"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1644388298;
        bh=y6KUsvAlY8qujJEhgX5KMvFo4gRhx/ZNIBPyuaje1Kk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GMXZghmfCXcrpnD0CJKmJD4YfKpcfOor8X2Hgv8HbbAQkWzH2kbzUN320O8t93nWb
         6pkYsCp10+8huWuJseKy4We4L/YJuk+Fqj706BkHOmZZ0MefEJgi0Ts3vgoEiUZ3pj
         K2rweE66X78r2yR4OpiMhcHbiPxUTGxQlJslDCcg=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2HZCtfhF2BhUYk0a-UOVrMf0i_uQrbGPhWJoaq1ZtW1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--u3r8JM49b8AqtDjn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 02:43:44PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Sun, 6 Feb 2022 at 21:10, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> w=
rote:
> >
> > On Sun, Nov 07, 2021 at 03:43:42PM -0700, Simon Glass wrote:
> > > Note: This was last sent 6 years ago. It really belongs upstream and I
> > > believe it is useful functionality for libfdt, so I am trying again.
> > > Please take a fresh look at this. It is cut back from the previous se=
ries.
> > > If accepted we can expand the feature set piece by piece from here.
> >
> > Sorry it's taken me so long to look at this.  Again.  I can't dispute
> > that it's useful for certain use cases.  But as for belonging
> > upstream...
> >
> > This series adds quite a lot of conceptual complexity.  It introduces
> > a new data structure, new state structures, a entirely new mode of
> > working with a tree and a bunch of configuration parameter types on
> > top of the new entry points and new tool.  I still find the semantics
> > of the different criteria for inclusion/exclusion from a region pretty
> > bewildering.
>=20
> It is sufficient to achieve its purpose, but I don't think it is any
> more complex than that.

I don't disagree, but that still ends up being quite complex.

> > That makes me pretty disinclined to add this to the scope of
> > maintenance for libfdt.  As you've probably noticed, I'm already
> > struggling to keep on top of maintenance for the existing libfdt
> > interfaces.  AFAICT everything here can be implemented fairly
> > naturally in terms of libfdt's existing public interface. so I'm not
> > really seeing a compelling reason for this to be merged into libfdt,
> > rather than being its own separate library that depends on libfdt.
>=20
> Are you suggesting:
>=20
> 1. that libfdt should move to a new maintainer
> 2. that you would accept these patches if someone else maintained them
> within the libfdt tree
> 3. that we set up a separate tree to fork libfdt, with these changes in
> 4. that we put these changes in a separate tree?

Right now (4) is what I'm suggesting.  Or to be more precise, creating
a new repo with "libfdtrange" or whatever, that depends on libfdt.

(1) and/or (2) are potentially worthy of further discussion.  (3) is
just a bad idea, IMO.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--u3r8JM49b8AqtDjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIDPWIACgkQgypY4gEw
YSJRfg/+O0z1mEDH1KjjpPBlm/wL5uFIAuY263M6RV6g88Xu+RBnpzcj2cTGfsRt
Nvnc6zU9Zw8Te855CESDIaR3b2P7iK9wJrhYGA1EL4CUY3+VmuorQlxIQUz3V9+P
OIYECxNU1eWsKPt0rhzdBa179fJvbpJEX5j0MStS8Cbe7aizn+vpH+UxQsueLumk
lxXCesPc23Bhpmao+0JF2tSB5+Dz7kbV3a0hqlHK1H8HU7Emr2bnSxUXm+awFtfR
yq7KwdSGaWvXI4Nnr7nABFrKfU5YckoTzNo1fRig3S3vpoE1Cww38/9zjuj4B01L
O9i/uj2VfIaTOabhixpWaCd47y1KkQmoEq+ZLdWEjTgHAsfdwCwrn4jqpPYw2Kyw
/o3DiG01zE457NO6YyQXW+gD7gHJnQePMyOpXl1b8ncwlwAfSFbS0DhF1e5RGBPF
cmJQKh1uZGVuFbMavFGvwgn3ZEej9wdLZpLepgk/4YUHX378mDJTppXbzor7viLP
jIbO4k724GP6oPZc33EQST4RI2lclkveVIUM5Riy4nEalO6VFYHnPhBsmse0oA1X
VHbUVjiz6HcVyl8ExjxPh1kWEuEfQNOvUu/LUEtH2duBzmHn/EinmGXJIEI4xnNr
MUlIX0nBlpitmsfdclqZs+HbbmK74CxmIMJgP9Q6b5/7EDwY1YA=
=4FXq
-----END PGP SIGNATURE-----

--u3r8JM49b8AqtDjn--
