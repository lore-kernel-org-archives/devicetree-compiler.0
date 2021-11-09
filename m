From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 1/4] pylibfdt: allow build out of tree
Date: Tue, 9 Nov 2021 12:48:46 +1100
Message-ID: <YYnTfsRXIpqz6upj@yekko>
References: <20201104194527.986901-1-marcandre.lureau@redhat.com>
 <20201104194527.986901-2-marcandre.lureau@redhat.com>
 <CAL_JsqL=panX9EW+41vTwsaWLtJbsY=opPPbwH+nnEGZSVnYsQ@mail.gmail.com>
 <YYiyGZme2j3qGrbt@yekko>
 <CAPnjgZ3zndvzBoAdqsW+n7Ao33nEiRr2CXGcBnm_=XDzGmM1_Q@mail.gmail.com>
 <CAL_Jsq+LDmauXEookk4DFiVcEWaGfC_7pxH=B-=N=ear6MzhvA@mail.gmail.com>
 <CAPnjgZ1wEb25Ow2v9K7Jp=1+Q2_6ufQGm+e8TjidPCNH5eNY2w@mail.gmail.com>
 <CAL_Jsq+gtg2md6h3PycEZdXqyqkvYyZ1x1MmShhvPMxV0idZgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WtxX/ZNrAqUQNkc8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1636426481;
        bh=wQEfN+ZRxm7D4gPZqVdJuqlCx69NBSP//sJjdLxaFUE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XosLMzxn7iWzTU6G8hdjpn6tBiEWRAGfbjAWkdR8AOAQ9Rt0AOdhmL/o7iPx/S6Ro
         nG5iImvr0QeI/DvtoC1DpF7ovAMlNg1qQBtKsO5VDJ1u81TtNvSGYn2kvqk2OxjvlX
         eQIRcq7UpWv1m65eoJGA8MJMr4z2EwetmIoX9aY0=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+gtg2md6h3PycEZdXqyqkvYyZ1x1MmShhvPMxV0idZgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--WtxX/ZNrAqUQNkc8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 08, 2021 at 07:07:56PM -0600, Rob Herring wrote:
> On Mon, Nov 8, 2021 at 6:09 PM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >
> > Hi Rob,
> >
> > On Mon, 8 Nov 2021 at 09:59, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > >
> > > On Mon, Nov 8, 2021 at 9:58 AM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Sun, 7 Nov 2021 at 22:14, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6ryscVyMRj84@public.gmane.org=
=2Eau> wrote:
> > > > >
> > > > > On Fri, Nov 05, 2021 at 04:01:38PM -0500, Rob Herring wrote:
> > > > > > On Wed, Nov 4, 2020 at 1:45 PM <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wr=
ote:
> > > > > > >
> > > > > > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > > > >
> > > > > > > With meson, we have to support out-of-tree build.
> > > > > >
> > > > > > I noticed that meson still builds pylibfdt/libfdt.py and
> > > > > > pylibfdt/libfdt_wrap.c in tree. And it makes the result unusable
> > > > > > without installing. For example the README instructions don't w=
ork:
> > > > > >
> > > > > >     $ cd pylibfdt
> > > > > >     $ python3 -c "import libfdt; help(libfdt)"
> > > > > >
> > > > > > I tried to fix the in tree part with swig option '-outdir', but=
 that
> > > > > > didn't work.
> > > > >
> > > > > Urgh.  This has always fit poorly with the rest of the build syst=
em.
> > > > > In addition, I've discovered that with Fedora 35, I now get this =
scary warning:
> > > > >
> > > > >          PYMOD pylibfdt/_libfdt.so
> > > > > /usr/lib/python3.10/site-packages/setuptools/dist.py:498: UserWar=
ning: The version specified ('1.6.1-g4eda2590-dirty') is an invalid version=
, this may not work as expected with newer versions of setuptools, pip, and=
 PyPI. Please see PEP 440 for more details.
> > > > >   warnings.warn(
> > > > > make[1]: Leaving directory '/home/dwg/src/dtc'
> > > > >
> > > > > Merely replacing 'distutils' with 'setuptools' in the code does n=
ot
> > > > > fix this.
> > > >
> > > > I don't know much about this. Python seems to want to use .' 'inste=
ad
> > > > of '-' but I'm not sure why they decided this so recently.
> > >
> > > I'm working on patches for both of these issues.
> > >
> > > > > > Really what I'm after is what uses need to be supported? I'm lo=
oking
> > > > > > at getting pip and pypi packaging to work. I'm actually wonderi=
ng if
> > > > > > pylibfdt needs to be so tightly coupled to the build system(s!)=
 and
> > > > > > source tree. The dependencies are really just libfdt headers and
> > > > > > library which are easily installed either from source or a dist=
ro pkg.
> > > > > > The '..libfdt/' references are problematic with the packaging t=
ools.
> > > > > > The easier route may be a standalone repo with a copy of libfdt=
=2Ei and
> > > > > > a different setup.py.
> > > > >
> > > > > Unfortunately, I don't know enough about either Meson or Python
> > > > > packaging to fix this.  Simon?
> > > >
> > > > I'm not quite sure what the problem is with pip3, etc. I am not an
> > > > expert on any of these but can probably find some help if we have a
> > > > clear problem. Rob, do you have a patch that causes the problem?
> > >
> > > Python has certain thoughts on what the directory structure looks like
> > > and building an sdist can't include something outside of pylibfdt/
> > > (the headers specifically). Basically, this is what needs to work
> > > locally for an install from PyPI to work:
> > >
> > > ./setup.py sdist
> > > pip install -f ./dist/ libfdt
> > >
> > > We also need to statically link if we want to create a wheel (python
> > > binary) for PyPI. (setuptools has to be used for a wheel)
> > >
> > > > I am not keen on splitting the repos as pylibfdt has a source
> > > > dependency on libfdt.h
> > >
> > > Yes, but libfdt.h is part of the ABI and should only change in an ABI
> > > compatible way, right? If you really want the version of libfdt you
> > > built, you do have to install it AFAICT. I don't think the wrapper
> > > will load ../libfdt/libfdt.so.
> > >
> > > I think the easiest way to solve these problems is moving setup.py up
> > > to the project root and perhaps dropping the pylibfdt parts from
> > > make/meson. Then working with the python bits all works 'the Python
> > > way'.
> >
> > That seems OK to me, but can we have the Makefile invoke the Python
> > stuff? How does having a meson option (who uses it?) affect all this?
>=20
> Everyone. The goal is meson will replace at least the bulk of the
> makefiles and they just become wrappers. The issue is getting setup.py
> to do out of tree builds that I mentioned at the start of this thread.

I'm ok with that, but could you please update the README to include
"meson native" build instructions.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WtxX/ZNrAqUQNkc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGJ03oACgkQbDjKyiDZ
s5L2PhAAusEc06FLka8BIGEG8zYtLlOo4bIcJt3Ugue8VwJyPDUVjH2SoqM1xH/G
l35ptTpGPJMO/yp4+wxq6mTO/avLR49IZkplJgT/wa1OeRdJWvEcwE9p5cMhUi6F
qu+M3Vq6NOZ//tZqXp2wu2jYgtuGbDNM6lISTm6lvV5nIlfcs2y/gOw3UdbkJrZZ
DRtMLaNsPOWRBC9TR7orxYzonnLGXKONjcctHoVIiriPDWeBAWCUzWiw+Xf4jAsQ
Fnm2ssBtevrVNce649niIbnuZUJbHRSHUigaZLhQPRGNTWzCTWfXG13JCkYmuPUG
Lmn9QaADPJdOCRh8qSCUKGHMNDelyMv2L8bVcb0fZ06j5TE4JVPQqu7CzrjB51Tq
mAbfimfjYY4e4COIYGYJBHj42E9rTr4DzSWE9NQjMsnSRAYK8/ehztUh5Kp9VzTk
R3YGUiRy0Nq8dNkdVifICyrjCBONzUdZrS1KFlPgnBWhZMgnnFTeoZtOejNZW8p3
upxten0TV5n4rWME8RRJ1wDjIgIty3olqmwTphY2yXKnMiFfB9m+7qQ71ALJSoJi
i3vFAdwOjUSjaSIR2bSSj2mrAqSjHrFNV5HgxYh2ai4caI7Yao1lb2P867dBEv1u
az2El2bz3zuYCG2O0qSc/T9tSZxM20LT6019k9kV6Oy/bil1s3E=
=CnlL
-----END PGP SIGNATURE-----

--WtxX/ZNrAqUQNkc8--
