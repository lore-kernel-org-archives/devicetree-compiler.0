From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: check.c fix compile error
Date: Thu, 8 Jun 2017 14:37:30 +1000
Message-ID: <20170608043730.GA25805@umbus.fritz.box>
References: <20170516160808.8075-1-shuahkh@osg.samsung.com>
 <20170517021218.GC15596@umbus.fritz.box>
 <db3a0ff9-bea2-4f6f-a1d6-34e8bc7ff44c@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1496896655;
        bh=W0gjGB8QPyqZCir2iForNmTMaEaV14zecrLDhSMn4+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UCBKnP8qek9SxB82P9fluox3QymIYfMNxOmmYX05oM/sF2ctq/DRkAGr4g7Cn8coQ
         RsZkbyII56Gb/qMYMV/DuBYWdf8nkAy40U3TqLThqhyAeLeOhKgToSB2uz1Vv7aphm
         tp2FlANg207FksKjDFYk2ooE8gYaavtGOB37Y+gA=
Content-Disposition: inline
In-Reply-To: <db3a0ff9-bea2-4f6f-a1d6-34e8bc7ff44c-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2017 at 12:46:52PM -0600, Shuah Khan wrote:
> Hi David,
>=20
> On 05/16/2017 08:12 PM, David Gibson wrote:
> > On Tue, May 16, 2017 at 10:08:08AM -0600, Shuah Khan wrote:
> >> Fix the following compile error found on odroid-xu4:
> >>
> >> checks.c: In function =E2=80=98check_simple_bus_reg=E2=80=99:
> >> checks.c:876:41: error: format =E2=80=98%lx=E2=80=99 expects argument =
of type
> >> =E2=80=98long unsigned int=E2=80=99, but argument 4 has type
> >> =E2=80=98uint64_t{aka long long unsigned int}=E2=80=99 [-Werror=3Dform=
at=3D]
> >>   snprintf(unit_addr, sizeof(unit_addr), "%lx", reg);
> >>                                          ^
> >> checks.c:876:41: error: format =E2=80=98%lx=E2=80=99 expects argument =
of type
> >> =E2=80=98long unsigned int=E2=80=99, but argument 4 has type
> >> =E2=80=98uint64_t {aka long long unsigned int}=E2=80=99 [-Werror=3Dfor=
mat=3D]
> >> cc1: all warnings being treated as errors
> >> Makefile:304: recipe for target 'checks.o' failed
> >> make: *** [checks.o] Error 1
> >>
> >> Signed-off-by: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> >=20
> > The bug is real, but the fix is only correct for some platforms (just
> > as the original would only compile for some platforms).  I've adjusted
> > to %zx which should be right for all platforms and applied.
> This patch with %zx made it into Linux 4.12-rc4 and I am seeing these
> warnings:
>=20
>   HOSTCC  scripts/dtc/checks.o
> scripts/dtc/checks.c: In function =E2=80=98check_simple_bus_reg=E2=80=99:
> scripts/dtc/checks.c:876:41: warning: format =E2=80=98%zx=E2=80=99 expect=
s argument of type =E2=80=98size_t=E2=80=99, but argument 4 has type =E2=80=
=98uint64_t {aka long long unsigned int}=E2=80=99 [-Wformat=3D]
>   snprintf(unit_addr, sizeof(unit_addr), "%zx", reg);
>                                          ^
> scripts/dtc/checks.c:876:41: warning: format =E2=80=98%zx=E2=80=99 expect=
s argument of type =E2=80=98size_t=E2=80=99, but argument 4 has type =E2=80=
=98uint64_t {aka long long unsigned int}=E2=80=99 [-Wformat=3D]
>   HOSTLD  scripts/dtc/dtc
>   CHK     scripts/mod/devicetable-offsets.h
>=20
>=20
> build doesn't fail, which is good. This probably needs fixing,
> but since my fix using %llx fails on some platforms, I am just
> reporting the problem, instead of attempting to fix.

*facepalm*

Sorry.  I "corrected" your patch from one wrong thing to a different
wrong thing.  Apparently I thought the parameter was of type size_t,
rather than uint64_t.

I've now fixed this in my master branch.  This time for sure.  I hope.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZONSKAAoJEGw4ysog2bOSt8gQAOcDf7uTiYmCfhKWt8eAvf5+
Hqb07AxWN726p9Rf2+udbqCaM0AvghcpmXs9f7JUpoHHqFZPi5ceTyQT93AvD4PL
PN4ucFEVe+GbisXKr6ZtIlsJeKyOsA6sCpRxDJPZBM5Ix0Q2UfZG1D5SjI5BA5g5
B5Ic0oE7lg8ciBdZ3eT5jENDH2wfLutZFrt1jHtA63koqtJsqKR6DS7T5IqvYFIW
fj05QVGxcC9niGWWEiix/2kzQ+Hxk3i6T3ie9wdEN/c77ACEHq7u2s3gUgqipIeg
/IKMM+/jlBHZmING3RW95S53ganFDt2RgHBA6oa/T9W35iutvyS5f8HkX65G1iNo
I5utRGcfbRuE7i1W7iYLm4DRI1YHiqiOCYmJ3H7iIh7N8okfMvVLCJ5nlgBF6rGl
2fX6rQI5cYdmui7ET/QZKm6jZ9iJMs1PCIyIuNFdOSGxS0cojOW/WEngC6JsnAJo
0jLeUS3/qfMPEsZkzXKIzkTluDenfEgnD3C0f8PbsuJTmAH44XtS76y5fRdM9R+r
mMAI4e5pFflzQIzyL6tRbJhPX+2GMDNICV7VyYW7eKaPoRuwPdBUuWfVxUawS3Q/
fJKGnXIoGOpg82qp4IkldVkxuEx5hgTauetDLdTVUtfSYWL8JL3XvIUtbXq5QMvg
KufPh9tSHSc5moKEwm7f
=Jdv/
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
