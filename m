From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Introduce fdtgrep for subsetting and hashing FDTs
Date: Thu, 17 Feb 2022 16:44:59 +1100
Message-ID: <Yg3g29VZnXHA4ban@yekko>
References: <20211107224346.3181320-1-sjg@chromium.org>
 <YgCblAa5Hxw33OXV@yekko>
 <CAPnjgZ2HZCtfhF2BhUYk0a-UOVrMf0i_uQrbGPhWJoaq1ZtW1w@mail.gmail.com>
 <YgM9hujN+PTXdi3d@yekko>
 <CAPnjgZ2-tgy-L15S=p4dajpF+hSwX-McPSU3Fez2=cXOqXypZQ@mail.gmail.com>
 <CAL_JsqJkG84jnn3OiC+aYOdqRvYcMWzfEg4r-74bbFsGC-4img@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HtKBbomyata6d0rl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1645076703;
        bh=xWHLMHZ1gSAHscEZjQb7O4Qxoy1AjEV5LY3c61YgXC0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Srb5uZfIN76qUNL5xIEF4cZwWeH4ZNajXJs+xS2KFtAL5QMJMt/rI1gBEpo6ez2zX
         KrDzfn9u1FqEimH/Rm8xs1jx1+IeYPd6mP16nghy7Da7FeZWiI5U/owQSQGRweS/9Q
         ex25Umq2aIZ5SLNP2GRg3QMkRJllWdsA+mELrGGY=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJkG84jnn3OiC+aYOdqRvYcMWzfEg4r-74bbFsGC-4img-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--HtKBbomyata6d0rl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 06:19:01PM -0600, Rob Herring wrote:
> On Wed, Feb 9, 2022 at 10:04 AM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >
> > +Rob Herring
> >
> > Hi David and Rob,
> >
> > On Tue, 8 Feb 2022 at 23:31, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>=
 wrote:
> > >
> > > On Tue, Feb 08, 2022 at 02:43:44PM -0700, Simon Glass wrote:
> > > > Hi David,
> > > >
> > > > On Sun, 6 Feb 2022 at 21:10, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6ryscVyMRj84@public.gmane.org=
=2Eau> wrote:
> > > > >
> > > > > On Sun, Nov 07, 2021 at 03:43:42PM -0700, Simon Glass wrote:
> > > > > > Note: This was last sent 6 years ago. It really belongs upstrea=
m and I
> > > > > > believe it is useful functionality for libfdt, so I am trying a=
gain.
> > > > > > Please take a fresh look at this. It is cut back from the previ=
ous series.
> > > > > > If accepted we can expand the feature set piece by piece from h=
ere.
> > > > >
> > > > > Sorry it's taken me so long to look at this.  Again.  I can't dis=
pute
> > > > > that it's useful for certain use cases.  But as for belonging
> > > > > upstream...
> > > > >
> > > > > This series adds quite a lot of conceptual complexity.  It introd=
uces
> > > > > a new data structure, new state structures, a entirely new mode of
> > > > > working with a tree and a bunch of configuration parameter types =
on
> > > > > top of the new entry points and new tool.  I still find the seman=
tics
> > > > > of the different criteria for inclusion/exclusion from a region p=
retty
> > > > > bewildering.
> > > >
> > > > It is sufficient to achieve its purpose, but I don't think it is any
> > > > more complex than that.
> > >
> > > I don't disagree, but that still ends up being quite complex.
> > >
> > > > > That makes me pretty disinclined to add this to the scope of
> > > > > maintenance for libfdt.  As you've probably noticed, I'm already
> > > > > struggling to keep on top of maintenance for the existing libfdt
> > > > > interfaces.  AFAICT everything here can be implemented fairly
> > > > > naturally in terms of libfdt's existing public interface. so I'm =
not
> > > > > really seeing a compelling reason for this to be merged into libf=
dt,
> > > > > rather than being its own separate library that depends on libfdt.
> > > >
> > > > Are you suggesting:
> > > >
> > > > 1. that libfdt should move to a new maintainer
> > > > 2. that you would accept these patches if someone else maintained t=
hem
> > > > within the libfdt tree
> > > > 3. that we set up a separate tree to fork libfdt, with these change=
s in
> > > > 4. that we put these changes in a separate tree?
> > >
> > > Right now (4) is what I'm suggesting.  Or to be more precise, creating
> > > a new repo with "libfdtrange" or whatever, that depends on libfdt.
> > >
> > > (1) and/or (2) are potentially worthy of further discussion.  (3) is
> > > just a bad idea, IMO.
> >
> > Where are things going with device tree validation in terms of
> > source-code location?
>=20
> Right now it doesn't use libfdt at all, but that's what I'm working on
> if we can get pieces in place to package pylibfdt sorted out. If not,
> I may be doing 3 just for packaging.

It doesn't seem to me that the validation should be using libfdt,
except in a limited capacity for an initial read.  Schema checking is
likely to do lots of random access to various nodes and properties, so
pre-reading the dtb into a "live" tree format seems like it would be a
good idea.

> > Is it likely there might be a separate tree for
> > that, which could perhaps hold other libfdt dependent things?
>=20
> It is a separate tree[1], but it's a pure python project and I don't
> think it's the right place for a C library. But we can setup a new
> project in the GH devicetree.org group[2] if you want.
>=20
> Rob
>=20
> [1] https://github.com/devicetree-org/dt-schema/
> [2] https://github.com/devicetree-org/
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HtKBbomyata6d0rl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIN4NMACgkQgypY4gEw
YSJkbQ//Ztrl31J8l3SfCE4xoKd/1K240OkcO4TumVYkbefuvDOcZKv7k80D/4IP
eRVUz4C4yvvcowt0vvGG4J5jbWUFKmC9QDvGJ443wAg1jgYGCiRJ8/HMxBbn5eU8
pvfWHv3qDV8nMspaKS9OZu+JmRtRUbXOcY2lMzZOdrMjxkxpBSd/z3Cf53eATpSy
T9keq7G0A2sRyrPRfvxG31pjk1tIANGynyemHPfK40FiZ2c7WMOSJeGU+WwksPZX
YYHAlB91SsME6g5xEap+VZmQAsS+khrx+kqZrynEkvSWHxipeJ54KINt31Fa+wSi
bfG+iylQsvTBXSVoGedBmDUJiOUantyCF5n23MskvyAZyFcHLWZ6HSzQpU6roIHS
w3BHoNu3IELdbwr3zkcYBNnXfhtspeeh77WeLtf7ozNJeQ8kVAqEGpFCldSybiIJ
coODV7Ty9Ej5uduJbj2YN46we2NSHbpx2oyP7aDugSOfYJ6+O+4VSprfymLnQn+n
Hnf7cPdWKeLBT4bTBzaCq/91dIm4If7GbZes1Yt+4irPAtLUC1iDI2/HabmDeub9
zOdDTWitogAbIgTWULuXz5+KvnB7gqvYEE6U4WnA0EiqmD7HzmuHkPnaSUZhlZPQ
fnHsadOD6nyNe+lXJLsDL9foLPih7fzpF7Utu2QcRFHA4CJsOKY=
=Whyc
-----END PGP SIGNATURE-----

--HtKBbomyata6d0rl--
