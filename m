From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] Add a couple of string-related functions
Date: Thu, 16 Jul 2015 15:27:16 +1000
Message-ID: <20150716052716.GB25179@voom.redhat.com>
References: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com>
 <E1ZFMkd-0002ir-O5@mylo.jdl.com>
 <CAPnjgZ12VVSDkALDDg31Sgwo1PpFPfE10GFtrseHWpRX1re-HQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ12VVSDkALDDg31Sgwo1PpFPfE10GFtrseHWpRX1re-HQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2015 at 03:45:07PM -0600, Simon Glass wrote:
> Hi Jon,
>=20
> On 15 July 2015 at 07:29, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:
> >
> > So, like, Thierry Reding said:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >
> > > These three patches add a couple of string functions that have proven
> > > useful in U-Boot's copy of libfdt, so they are likely to be useful for
> > > other users as well.
> > >
> > > Patch 1 adds a function to count the number of strings in a property's
> > > value. This also adds a new DTS sample along with a small test program
> > > to validate the implemented functions.
> > >
> > > Patch 2 adds a function to retrieve the index of a given string in any
> > > given property's value. This adds code to the test program introduced=
 in
> > > the previous patch to exercise the new functionality.
> > >
> > > Patch 3 adds a function to retrieve a string by index from a property=
's
> > > value along with a shortcut for index 0. This extends the test program
> > > introduced in patch 1 to validate the new functionality.
> > >
> > > Thierry
> >
> >
> > Hi Thierry,
> >
> > While I am generally fine with this patch set, I have
> > a large-scope question.  Is there a larger plan to
> > consolidate or unify the U-Boot and DTC libfdts?
>=20
> I maintain the fdt tree for U-Boot at present. About once a quarter I
> check what has changed and do a bit of a sync. But there are things
> that libfdt upstream has not accepted - e.g. the grep functionality
> used by verified boot hashing stuff. I wish we could figure that out.
> Perhaps a cut-down fdtgrep tool would meet with favour. We're using it
> even more now since SPL (the minimal U-Boot loader) wants to run with
> a subset of the full board FDT for SRAM space reasons.

So, short-term: there's no reason your fdtgrep stuff needs to be
considered as part of your version of libfdt - it could just as easily
be an add-on sitting alongside libfdt - then you could share the core
libfdt code at least.

Longer term, my main sticking point on the fdtgrep stuff was entry
points whose semantics don't make me go cross-eyed (includes these
nodes, but not those nodes, and might include children if this flag is
set, but not that one and the operator's shoe size matches some other
property...).  I'm not sure if that's a question of redesigning the
interface, or just of describing it better.

> I do ask people to send things upstream, and if rejected we then have
> to work out what to do...there are recent U-Boot mailing list threads
> on this.
>=20
> Regards,
> Simon

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVp0C0AAoJEGw4ysog2bOScLgP/2H9M6Z0yjLlE0qv9715hBps
n+VmguhLCRAUkQBArhguUFYEH6dV7nzhW4o8Bt1Qmk5CcaZmYicQm6yhR+1JnTdB
PWF/6S53cQKLKGMmTnq7EheJVHqFOvrndigfSSY6y/F+N4xyRrG0yU7FhOPeH6pO
5OoJIS9rE990vk0+iTIqBEiE/KwgR1idkG5pnC0UiMmD8SThSf08uU36Y9oGhIou
BMjOuJxJddgzL3SnUQr+kTbSeqV4WktdMkAB4YM6oRV9v39wb5Wzbvz2WS9GoLcW
fgTN0WhKX19Ug+ZumVnxxN8ByVSzJI4H+qfoDktQvk36xjZvQLAB9kuwNVlVY71D
IFSh2PPDQQUw17f0mV6rV+aCf6LNBdAU57ZPAhePsf1e/omBmisuztQNF/nuIX5j
/71VbdQK9afr7pZ2jf3DSPsNhEY1Up0QVcQXD2iWp+TdgdY/cuv7HDod3EOOX9mK
G8a8ds1L2HqAwHn5QiM/b8dQ/wsiEympSL+H/7qOsfkWs7zNdCquifGPveXwUTs3
0KIlLEoEKyv96qC0OS2VbbMBO4zBdFa+mPQZxUKUOY0haLjgLko22+HLkxaK72zE
Q0vmA941mg/kAPHoun2tUWOXPNboXWueUiDDnx5vsXokSK/D0HkM9jIodAL6TmnN
IlZE4PHSS/8vOdOTNXFi
=dhdy
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
