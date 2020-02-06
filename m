From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 1/6] libfdt: De-inline fdt_header_size()
Date: Thu, 6 Feb 2020 16:32:01 +1100
Message-ID: <20200206053201.GO60221@umbus.fritz.box>
References: <20191113015422.67210-1-sjg@chromium.org>
 <20191113015422.67210-2-sjg@chromium.org>
 <20191120035121.GD5582@umbus.fritz.box>
 <CAPnjgZ0bP3Hmk7daknD275J0SxJR6XoxNXPustqKJ4k3POPqiw@mail.gmail.com>
 <20200128082402.GG42099@umbus.fritz.box>
 <CAPnjgZ2MUorvc1+MY2mBozQn+kYA1Q=SLFhPPGXixoSZshUGsg@mail.gmail.com>
 <20200202031201.GB20412@umbus.fritz.box>
 <CAPnjgZ2r9wNFpcGJ47pk4mj4sGP_t+eDki7_stqwn0-tE1dATQ@mail.gmail.com>
 <20200206044424.GL60221@umbus.fritz.box>
 <CAPnjgZ1_UwW_5OYY-r-2OCoYKXpMHn0QuvVEwVNECqcYvc3CBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+nG9yj4eE4W6Oba0"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580967131;
        bh=K5IGjSZs739kmbHDCwYsXpTAH98xnh3kMG6aBA6V5uc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BccoeX3Mc16mYdr7DhmM8QpgwLfPtr7zgY77EJFida02tVQtkmWi8adFPXmDJxED9
         Kf4N4NDQYIIddySizZbqIKNpQ+WNeTJihVQcOBvHm/kQyz9fwZCzTuc8h2yhZAWLm2
         Qdku4jsbxYPzm+f4P6G6szKggp8/D2xoZrz6qsyw=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1_UwW_5OYY-r-2OCoYKXpMHn0QuvVEwVNECqcYvc3CBg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--+nG9yj4eE4W6Oba0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2020 at 10:03:37PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Wed, 5 Feb 2020 at 21:53, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> w=
rote:
> >
> > On Wed, Feb 05, 2020 at 01:57:01PM -0700, Simon Glass wrote:
> > > Hi David,
> > >
> > > On Sat, 1 Feb 2020 at 21:38, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6iEOx6SR5NKn@public.gmane.org=
u> wrote:
> > > >
> > > > On Fri, Jan 31, 2020 at 11:14:25AM -0700, Simon Glass wrote:
> > > > > Hi David,
> > > > >
> > > > > On Tue, 28 Jan 2020 at 01:37, David Gibson <david-xT8FGy+AXnQMXKaNCjofrA@public.gmane.org=
=2Eid.au> wrote:
> > > > > >
> > > > > > On Mon, Dec 02, 2019 at 06:07:16PM -0700, Simon Glass wrote:
> > > > > > > Hi David,
> > > > > > >
> > > > > > > On Tue, 19 Nov 2019 at 21:01, David Gibson <david-xT8FGy+AXnR4Cd2VRjVQmg@public.gmane.org=
bear.id.au> wrote:
> > > > > > > >
> > > > > > > > On Tue, Nov 12, 2019 at 06:54:17PM -0700, Simon Glass wrote:
> > > > > > > > > There does not seem to be a strong reason to inline this =
function.
> > > > > > > >
> > > > > > > > Well.. I think my rationale was just that this function sho=
uld be a
> > > > > > > > single load, followed by the call to fdt_header_size_().  I=
 suspect
> > > > > > > > it's not called enough for removing that to balance out the=
 code
> > > > > > > > overhead of an extra function.  Or have you made measuremen=
ts which
> > > > > > > > show I'm wrong about that?
> > > > > > >
> > > > > > > Well it isn't called in U-Boot at all, other than via
> > > > > > > fdt_check_header(). The inlined version saves 16 bytes of cod=
e space
> > > > > > > on Thumb2.
> > > > > > >
> > > > > > > But even better would be to drop fdt_check_header_(). somethi=
ng like:
> > > > > > >
> > > > > > > size_t fdt_header_size(uint32_t version)
> > > > > > >    {
> > > > > > >    if (fdt_chk_version()) {
> > > > > > >       if (version <=3D 1)
> > > > > > >          return FDT_V1_SIZE;
> > > > > > >       else if (version <=3D 2)
> > > > > > >          return FDT_V2_SIZE;
> > > > > > >       else if (version <=3D 3)
> > > > > > >          return FDT_V3_SIZE;
> > > > > > >       else if (version <=3D 16)
> > > > > > >          return FDT_V16_SIZE;
> > > > > > >       }
> > > > > > >
> > > > > > > return FDT_V17_SIZE;
> > > > > > > }
> > > > > > >
> > > > > > > That saves an additional 8 bytes.
> > > > > >
> > > > > > Uh.. I'm a little lost here.  Is what you're suggesting moving =
all of
> > > > > > fdt_check_header_() to the .h file, so it can be inlined (and
> > > > > > therefore constant folded)?
> > > > > >
> > > > > > That could be a reasonable plan, though we'll need to make sure=
 to
> > > > > > include an out-of-line version as well, for ABI compatibility.
> > > > >
> > > > > OK that sounds like a pain with little gain. Let's leave it as it=
 is
> > > > > then.
> > > >
> > > > Actually, I suspect it's not that bad, I think "extern inline" does
> > > > what we'd need.
> > >
> > > I get lots of 'multiple definition' errors when I add 'extern inline'
> > > to the header file for fdt_header_size().
> > >
> > > >From here:
> > >
> > > https://stackoverflow.com/questions/216510/what-does-extern-inline-do
> > >
> > >    extern inline: like GNU89 "inline": externally visible code is
> > > emitted, so at most one translation unit can use this.
> > >
> > > Can you explain a bit more about what you are thinking here? I am a
> > > bit lost. Remember that in my next patch I have to check the
> > > assumptions in libfdt_internl.h
> >
> > Ah, I guess I was wrong.  Ok this will need a closer look.
>=20
> So how about we go with this patch as it?

Yeah, go with whatever is best for you in the next spin, and we'll see
how it looks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+nG9yj4eE4W6Oba0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl47pM8ACgkQbDjKyiDZ
s5KLbBAAzRmyDzoUTtYzVtMDYJ5ew91WjdCulrH56o5hB6mQTUSaNJyZyjkePUwj
64e/SbGJmo9CegP01x18GQZL6v65F5c0k6/UiQub2U+NZ4gbP7/G+yiLYvliR7aM
BtRxL2O5HAFqyx1kHk1fE1ZiTzPs4WkKAbTAaBD9UIgi82ZQDcFY3yu/g9J/u1WM
Mqkmb7eJDzaf2VLx75SyOQh1rwR7CrPmx6M/0VvdZbkNtpK5dTNTsxNTnlTbnOVi
Z6wGfeT+0zn9yZI9vGvVsIM9a+nW4yTmSd7Jp/9J2CtqFUOzh+Dx/cmgw4pej0Ur
pDavIFu1QqoGlf3hMLGNovoFLLjTILHy5FK4GQk1fENuMO3N+JyahRZQQYUQRM/O
+66Lpg9+Y7QyPkxctoRQPN2UE4iHt1/P6fHSpMRSY0LnjMh5r+Sx9rlVnG1PUGAs
CIMgZppKHF9SDLZRYgl89ITELE+qAq9DjB9FSv7B8NVDBcY923bC2AnFO9MXdnn+
6ssW/DOy4IDB5MkOp3dsu5/cDY/+Juj6aHYgEd2acyYugzXlb39Qx65+YK67uacu
8MJ1X5A3B2nlpvDBoOXIaqOVqYsuSMIUaPtuXEQCuLThJ2rm/sCpfvYDDAWLZSfK
CtejXLr22JXYhkhK4yrcbmYqd/NpNi8SzuEBYs+rEpKwZlFIWN4=
=eTsi
-----END PGP SIGNATURE-----

--+nG9yj4eE4W6Oba0--
