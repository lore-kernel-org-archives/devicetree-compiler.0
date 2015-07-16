From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] Add a couple of string-related functions
Date: Fri, 17 Jul 2015 09:40:07 +1000
Message-ID: <20150716234007.GE25179@voom.redhat.com>
References: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com>
 <E1ZFMkd-0002ir-O5@mylo.jdl.com>
 <CAPnjgZ12VVSDkALDDg31Sgwo1PpFPfE10GFtrseHWpRX1re-HQ@mail.gmail.com>
 <20150716052716.GB25179@voom.redhat.com>
 <CAPnjgZ0FQvjkC=LUWeCgeDw+x+DePyaNQ=CiC+ht86U2KY_BMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="65ImJOski3p8EhYV"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0FQvjkC=LUWeCgeDw+x+DePyaNQ=CiC+ht86U2KY_BMA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--65ImJOski3p8EhYV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 10:56:23AM -0600, Simon Glass wrote:
> Hi David,
>=20
> On 15 July 2015 at 23:27, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrot=
e:
> > On Wed, Jul 15, 2015 at 03:45:07PM -0600, Simon Glass wrote:
> >> Hi Jon,
> >>
> >> On 15 July 2015 at 07:29, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:
> >> >
> >> > So, like, Thierry Reding said:
> >> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> > >
> >> > > These three patches add a couple of string functions that have pro=
ven
> >> > > useful in U-Boot's copy of libfdt, so they are likely to be useful=
 for
> >> > > other users as well.
> >> > >
> >> > > Patch 1 adds a function to count the number of strings in a proper=
ty's
> >> > > value. This also adds a new DTS sample along with a small test pro=
gram
> >> > > to validate the implemented functions.
> >> > >
> >> > > Patch 2 adds a function to retrieve the index of a given string in=
 any
> >> > > given property's value. This adds code to the test program introdu=
ced in
> >> > > the previous patch to exercise the new functionality.
> >> > >
> >> > > Patch 3 adds a function to retrieve a string by index from a prope=
rty's
> >> > > value along with a shortcut for index 0. This extends the test pro=
gram
> >> > > introduced in patch 1 to validate the new functionality.
> >> > >
> >> > > Thierry
> >> >
> >> >
> >> > Hi Thierry,
> >> >
> >> > While I am generally fine with this patch set, I have
> >> > a large-scope question.  Is there a larger plan to
> >> > consolidate or unify the U-Boot and DTC libfdts?
> >>
> >> I maintain the fdt tree for U-Boot at present. About once a quarter I
> >> check what has changed and do a bit of a sync. But there are things
> >> that libfdt upstream has not accepted - e.g. the grep functionality
> >> used by verified boot hashing stuff. I wish we could figure that out.
> >> Perhaps a cut-down fdtgrep tool would meet with favour. We're using it
> >> even more now since SPL (the minimal U-Boot loader) wants to run with
> >> a subset of the full board FDT for SRAM space reasons.
> >
> > So, short-term: there's no reason your fdtgrep stuff needs to be
> > considered as part of your version of libfdt - it could just as easily
> > be an add-on sitting alongside libfdt - then you could share the core
> > libfdt code at least.
>=20
> That's how it is today, yes.
>=20
> >
> > Longer term, my main sticking point on the fdtgrep stuff was entry
> > points whose semantics don't make me go cross-eyed (includes these
> > nodes, but not those nodes, and might include children if this flag is
> > set, but not that one and the operator's shoe size matches some other
> > property...).  I'm not sure if that's a question of redesigning the
> > interface, or just of describing it better.
>=20
> Neither am I, but perhaps if I cut down the fdtgrep options so that it
> only does a few basic things that would help? The full feature set
> would still be in the implementation, but it would reduce confusion on
> that side.

It's not really the fdtgrep tool which bothers me, I'm much more
concerned with the semantics of the libfdt function it uses to do its
work.

> >> I do ask people to send things upstream, and if rejected we then have
> >> to work out what to do...there are recent U-Boot mailing list threads
> >> on this.
> >>
> >> Regards,
> >> Simon
> >
>=20
> Regards,
> Simon

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--65ImJOski3p8EhYV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVqEDXAAoJEGw4ysog2bOSl2wQAOTFUaBMo5bTA2yHVIcpRf2w
H3065Sg7YToxucHd3Fok40lENle7VjVDyVLMU70Nc43A0jsnloL6jc/LCM+Tf+jH
kLZ4xUt2DAS6TCYeG63IEr9djeiqDCAls2h1ETsz7wZefUEone/oR3VZdWQIvp7O
wPbS04bVsLDB2zjGbfxy7z+viQ8/tiPyUoxjQui8/pFnIEnNme52NZsys7COjmbT
xXemRZ97Rl8qUQudwkaOxC+b0aW0jAnJ9KDEJhNZETfhwRbCahxNru9vXml9ZOda
lsKUkzhIl4sNyO+YZwbtL7QqmExte6IJukPzMcquRc7U2TFboXfSRBLtNRSEgB40
cg71TntcczKIA9b36dZa56QxogR7iZHIXFzpjEu9seVkd8jJO/uKyNehCygc1dt1
itc+q2xUGla3Y76KZrJzT4mJQ04QCGAMaX6qg/A2W9N42F0/YCgsPEuq5ovsWVe7
eGDoy7uhUZCOyWBjSv63ArdEoAEEhsw8DXipTRKy4UOu2QU1OlGFVzfTIZmhqDBa
UOjSU0wNqQCKDSlyfUDVi5UL1HHV2Jh98JSTAMD9WMc27HLi5q449xgfFLVZGzNI
Kp+BzSmWQvNsLN4stnPQheNjApVOMAarZOzt6yQH2EgxK+9wke51ZoEYZ1aJAUuk
7moQn77zp0cegV+sMX6C
=+Msm
-----END PGP SIGNATURE-----

--65ImJOski3p8EhYV--
