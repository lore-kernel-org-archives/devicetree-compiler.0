From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Correct signed/unsigned comparisons
Date: Fri, 17 Jan 2020 19:23:32 +1000
Message-ID: <20200117092332.GW54439@umbus>
References: <20200112185209.75847-1-sjg@chromium.org>
 <20200116064955.GR54439@umbus>
 <CAPnjgZ2vbphSbvohBD3YTswX2WtKdVxgs9Ltg9vFfrEQyr2LGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="B8YbZbqleQryf2nq"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1579264007;
        bh=oLIM3qF6+V+RwqUF9zsDBDvcy/LGSn+QUyr326UovI0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bap3tEx6keUy24fMik2OIbNsTxKGah3oslAAioN9/gskdJUaYmNc/KnNmbnNnQNHI
         tg5r905WRz9ZCq5FWQ4nWsJRAjFdLe5FkFO+SoafN80aJ2OkWWYFzAfD53KTYxADUF
         UQarUMYQLA3cnmxbkkNj51atXR2xyZFHfqpfgQvg=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2vbphSbvohBD3YTswX2WtKdVxgs9Ltg9vFfrEQyr2LGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--B8YbZbqleQryf2nq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2020 at 08:58:12PM +1300, Simon Glass wrote:
> Hi David,
>=20
> On Thu, 16 Jan 2020 at 19:50, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >
> > On Sun, Jan 12, 2020 at 11:52:08AM -0700, Simon Glass wrote:
> > > These warnings appear when building U-Boot on x86 and some other targ=
ets.
> > > Correct them by adding casts.
> > >
> > > Example:
> > >
> > > scripts/dtc/libfdt/fdt.c: In function =E2=80=98fdt_offset_ptr=E2=80=
=99:
> > > scripts/dtc/libfdt/fdt.c:137:18: warning: comparison of integer expre=
ssions of different signedness: =E2=80=98unsigned int=E2=80=99 and =E2=80=
=98int=E2=80=99 [-Wsign-compare]
> > >    if ((absoffset < offset)
> > >
> > > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >
> > Hmm.  So squashing warnings is certainly a good thing in general.
> >
> > Unfortunately, I'm really uncomfortable with most of these changes.
> > In a number of cases they are outright wrong.  In most of the others,
> > the code was already correct.  I dislike adding casts to suppress
> > spurious warnings on correct code because that can end up hiding real
> > problems which might be introduced by future changes.
> >
> > Case by case details below.
>=20
> Thanks for the review. I agree this is all really horrible,
> particularly in light of the fact that it doesn't fix bugs and perhaps
> introduces some.
>=20
> This was just a quick patch to silence the warnings. If we do make
> fixes here we should really make sure that there are test cases to
> trigger each check. I suspect we have some but not all.

Yeah, adding some safety test cases for egregiously bad input like
negative buffer sizes is probably a good idea.

> What do you think we should do? The warnings are going to be very
> annoying for people. I could perhaps split the patch up and work
> through things one by one.

Yeah, we want to find some way to remove the warnings, and I think
splitting up and working piece by piece will be necessary.

I think the very first step, is to find definitive info on what
exactly the defined behaviour of C is with a signed vs. unsigned
comparison.

The help text of -Wsign-compare seems to imply that assuming:

	signed int a;
	unsigned int b;

then=20
	if (a < b) ...

is equivalent to
	if ((unsigned int)a < b) ...

But I thought that this was not the case.  Rather, I thought it was
supposed to always evaluate to true if b > INT_MAX.  We need to know
which is the case as a starting point.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--B8YbZbqleQryf2nq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4hfRQACgkQbDjKyiDZ
s5KmNhAAxdW8VfKupnW4IvPkM0dTbpDNycOXKDP1MTUMdeEnCQj/zGHzfUluaghF
D0hBb1wc863AWOvDet2HRsC7+Ni3qoh+qhBQTXLOsqQN+1SJLMOVH+afiB3FsHWJ
XLCC+baNt3thktZu+L7JFvPcFbjLpwdnxJZxVC1Q1j/4V039sNNM5lu5cNoP1FcF
fOBso62/O7Tdvrg2f6dzwNpNN7cBkVp9CDC16ihBWxBoAM31rvSz20LyZHUNh1zc
/hzFT21AJokcQoSIVRHpG4xwP9p4Y+T/h/qhJNOCgalVLXrYvZy3IqIWI14C75m9
T9jJXc++vom1TyJjWFxsuhdpeL5bJJbXLBR77VkcerMT+gOe/q8znEDyZz5i3Dhs
vzlC6pD8pzLcOd0SyN93bxOsqUQLhdVqGH/+V73WZGIC224Bb/5Ps991DS8M/h9Z
McD1UoANJo2YFRVvn6QgBKpc/2BmU3vDWtrH4IFE1Kx5WDlSLrWVGgZPyQv5A7ww
mri73s9/HX/OwcXYeZFh0/HE4qIm2KDAupvtqT0+dDknVuLR6FzkZCUu9ryYt0yW
dZeCRhByLyjU803ixoJ0nClt4jHZrxfhL999fmIvtZcQRu3Ic4LfW6gLqWL57AQ4
RlOp/WsNi1TiosQ6kiFAauScDLBkgEPQ58rgsiFcC3BdDyPWtXg=
=JyNy
-----END PGP SIGNATURE-----

--B8YbZbqleQryf2nq--
