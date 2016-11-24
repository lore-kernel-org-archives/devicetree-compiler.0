From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/4] Add an initial Python library for libfdt
Date: Fri, 25 Nov 2016 09:03:09 +1100
Message-ID: <20161124220309.GD23872@umbus.fritz.box>
References: <1479423205-9817-1-git-send-email-sjg@chromium.org>
 <1479423205-9817-2-git-send-email-sjg@chromium.org>
 <20161118003645.GC31640@umbus.fritz.box>
 <CAPnjgZ1=QTBNZa4G_uFpka3acr91ywH2P1QF8FJkfS-7Wpd5OQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PHCdUe6m4AxPMzOu"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1480027991;
        bh=yxocKPtZokkW0c32OSfEPT84MGtZUeOJ8yVw3waB+tw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=msQh4Ub0yL7ir31T/Islz6DsVxf7+QBhGTwVBpBo1tAN/ym9DF3Wre3LEMVstp97i
         aU8Du5FkyfIkim0iUejHp3slBEBKr0LbI2malvjyrwIy6ImWmj4OcR8Gho3DzoC3mN
         PKTKSU733me4nhBscoyGUmmRN/5N+DrPfneWjRgs=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1=QTBNZa4G_uFpka3acr91ywH2P1QF8FJkfS-7Wpd5OQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--PHCdUe6m4AxPMzOu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2016 at 11:08:00AM -0700, Simon Glass wrote:
> Hi David,
>=20
> On 17 November 2016 at 17:36, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> > On Thu, Nov 17, 2016 at 03:53:22PM -0700, Simon Glass wrote:
> >> Add Python bindings for a bare-bones set of libfdt functions. These al=
low
> >> navigating the tree and reading node names and properties.
> >
> > Nice idea.  Some nits in the details..
> >
> >>
> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> ---
> >>
> >>  pylibfdt/.gitignore        |   3 +
> >>  pylibfdt/Makefile.pylibfdt |  21 ++++++
> >>  pylibfdt/libfdt.swig       | 157 ++++++++++++++++++++++++++++++++++++=
+++++++++
> >>  pylibfdt/setup.py          |  34 ++++++++++
> >>  4 files changed, 215 insertions(+)
> >>  create mode 100644 pylibfdt/.gitignore
> >>  create mode 100644 pylibfdt/Makefile.pylibfdt
> >>  create mode 100644 pylibfdt/libfdt.swig
> >>  create mode 100644 pylibfdt/setup.py
> >>
> >> diff --git a/pylibfdt/.gitignore b/pylibfdt/.gitignore
> >> new file mode 100644
> >> index 0000000..5e8c5e3
> >> --- /dev/null
> >> +++ b/pylibfdt/.gitignore
> >> @@ -0,0 +1,3 @@
> >> +libfdt.py
> >> +libfdt.pyc
> >> +libfdt_wrap.c
> >> diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> >> new file mode 100644
> >> index 0000000..fbdbca5
> >> --- /dev/null
> >> +++ b/pylibfdt/Makefile.pylibfdt
> >> @@ -0,0 +1,21 @@
> >> +# Makefile.pylibfdt
> >> +#
> >> +# This is not a complete Makefile of itself.  Instead, it is designed=
 to
> >> +# be easily embeddable into other systems of Makefiles.
> >
> > So, Makefile.libfdt is explicitly designed for easily embedding libfdt
> > in other projecs - even ones with weird build environments, like
> > bootloaders.  It's less clear that that's valuable for Python
> > wrappers.
>=20
> OK, but what should i do instead?

Sorry, I just meant that that copied comment doesn't really make sense
in its entirity here.  Otherwise the makefile is fine.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PHCdUe6m4AxPMzOu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYN2OdAAoJEGw4ysog2bOS3G0P/2Goo3DS1GG4gVWBTd+iJDVo
SyAfE3c8ZAE6JVnRhQGGCHnAjg2dqDhnqUmxkLrJXlgJGtzoBeIw2e0Bw0RCWUlw
Ldtr3KD56YnikO+U2pdc/3zgV/YFVzpwG1o8eVDBCeFtq3o+G1gkpapPB93fxWP6
wkQAtnNzUCqV7B0zYGLdqSc+ASIE/lu7GiEVCkldw3t6UJHth8a/YTmAIRb0TwPW
K/QiuOxgECyWlSLrrJXmgLb2oUJkNaqqjrc0vTh9J02GQBhL38xXN5uxj5PZ1yHZ
iKZ3bAsoonD0rp5mzkiS9dHUpTNG7nK/WZZ4/ohy56nualEwoB2HGlPaqkOM/5u+
vM20m0YEdbNFxWik7jWDuxgASfnwuINwNSZqNZFzkGQLbtJIH6qRZoGcztySRPYq
jCkuTJwH3HziSJtad0Fw79EUaRC6UudbMb76pCeYbjPQmvR30BAY8yUPMF9zSHJP
mok0QlxuEOBW5Ku2UXUKODjKvAcp5XJCGqHbKqRK7x5X8+3IBiTF22G8K0jZ9Xo/
DgEIyEswgCRNRK/zXs0WD8wmCFrXp91NXnEVN1jhF9C0+EqEk96GlxiEbBOw7qTJ
mnQW9Gtt8wrYD0NzCzlVm4JUxM1Ru7zPrzcWtVnSlRjXhkPHP4f9nrjfc8oU9hp8
CUySLcW8JgsR20YmBXbD
=wodR
-----END PGP SIGNATURE-----

--PHCdUe6m4AxPMzOu--
