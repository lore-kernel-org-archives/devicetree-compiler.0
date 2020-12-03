From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/1] libfdt: Change last_comp_version to fit spec
Date: Thu, 3 Dec 2020 17:16:11 +1100
Message-ID: <20201203061611.GI7801@yekko.fritz.box>
References: <20201124174945.5399-1-jujugoboom@gmail.com>
 <20201124174945.5399-2-jujugoboom@gmail.com>
 <CAL_Jsq+CZA8weCYPcJYOdY3-z8fnwibsKhfGwO8nuy+7RH=pvg@mail.gmail.com>
 <20201202074627.GA87@DESKTOP-F375L8M.localdomain>
 <CAL_Jsq+aio50a18QrwA6VbxZmOYyzcC+tRkkxPkBPyLNcfh-5w@mail.gmail.com>
 <20201203012147.GA87@DESKTOP-F375L8M.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kH8JNVvasRCCW1Oz"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1606976178;
        bh=ki/zb1mEWGA8L4kaPIzWdEN9iuzvByDzzBQRZ3jOH9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G/9tQAMObdVHGmRVhTyLmaJ27vKikCT3UbER/4mDIFOkYDjMtHVelqBu+C3DELLuU
         th4pWX29W0pQpnQarBg9Y484BcoA15PjIkhGxABBRxCgdMzBspDM4OuYUbDZhnq/6V
         wMDEC1Cxvm+Fa9ntEMdvVgKVxr6wCWWlnDi1nE2c=
Content-Disposition: inline
In-Reply-To: <20201203012147.GA87-cyTpl0DnfLBQ0J4zD59KJAH0AcctZ4a01BehtkLrGTY@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--kH8JNVvasRCCW1Oz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 05:21:47PM -0800, Justin Covell wrote:
> On Wed, Dec 02, 2020 at 08:25:04AM -0700, Rob Herring wrote:
> > On Wed, Dec 2, 2020 at 12:46 AM Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> > >
> > > On Mon, Nov 30, 2020 at 10:22:09AM -0700, Rob Herring wrote:
> > > > On Tue, Nov 24, 2020 at 10:50 AM Justin Covell <jujugoboom-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> > > > >
> > > >
> > > > Needs a commit message. For a single patch, you don't need a cover
> > > > letter. The explanation should be here.
> > > >
> > > > Besides matching the spec, what problem are you trying to solve?
> > > >
> > >
> > > Sorry about that, first time contributing. I'm trying to help with
> > > interoperability with other libraries that are made to read/write DTBs
> > > by matching the spec.
> >=20
> > What library? Why does libfdt not work?
> >=20
>=20
> I was attempting to use a DTB library for Rust, and it will fail if the
> set last_comp_version doesn't match what is expected.

Hmm.  Although there's definitely a bug in libfdt here, depending on
exactly what "expected" means, that doesn't necessarily sound like
correct behaviour on the part of the Rust library.

> > > > > ---
> > > > >  libfdt/fdt_sw.c | 2 +-
> > > > >  libfdt/libfdt.h | 1 +
> > > > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> > > > > index 68b543c..4c569ee 100644
> > > > > --- a/libfdt/fdt_sw.c
> > > > > +++ b/libfdt/fdt_sw.c
> > > > > @@ -377,7 +377,7 @@ int fdt_finish(void *fdt)
> > > > >         fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings=
(fdt));
> > > > >
> > > > >         /* And fix up fields that were keeping intermediate state=
=2E */
> > > > > -       fdt_set_last_comp_version(fdt, FDT_FIRST_SUPPORTED_VERSIO=
N);
> > > > > +       fdt_set_last_comp_version(fdt, FDT_LAST_COMPATIBLE_VERSIO=
N);
> > > > >         fdt_set_magic(fdt, FDT_MAGIC);
> > > > >
> > > > >         return 0;
> > > > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > > > index 89adee3..abad93b 100644
> > > > > --- a/libfdt/libfdt.h
> > > > > +++ b/libfdt/libfdt.h
> > > > > @@ -14,6 +14,7 @@ extern "C" {
> > > > >  #endif
> > > > >
> > > > >  #define FDT_FIRST_SUPPORTED_VERSION    0x02
> > > > > +#define FDT_LAST_COMPATIBLE_VERSION 0x10
> > > >
> > > > If the above change is correct (I'm not sure it is offhand), why not
> > > > just bump up FDT_FIRST_SUPPORTED_VERSION value?
> > > >
> > >
> > > I didn't want to bump the FDT_FIRST_SUPPORTED_VERSION to maintin
> > > backwards compatability, and assumed that libfdt actually does support
> > > working with DTBs down to version 2.
> >=20
> > Looking at this more closely, I think your change is correct. It's
> > actually fixing a regression. Prior to commit f1879e1a50eb ("Add
> > limited read-only support for older (V2 and V3) device tree to
> > libfdt."), libfdt would set last_comp_version to 16. Now it sets it to
> > 2, but really 2 is what libfdt can read, not what should be in
> > last_comp_version.
> >=20
> > Also, I'm not certain what happens if you tried to modify a version 2
> > dtb. It doesn't look like we do anything to fail gracefully.
> >=20
> > Rob
>=20
> I'm happy to test modifying a version 2 dtb and see what happens, but I
> don't have one around, and feel that might be a little out of the scope
> of this patch.

AFAICT, dtc still supports generating old dtb versions, using the -V
flag.  So you could convert a dtb into v2 with:
	dtc -I dtb -O dtb -V 2 input.dtb -o output.dtb

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kH8JNVvasRCCW1Oz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/IgqsACgkQbDjKyiDZ
s5JD3hAA3M8ZndDoJ6WGA6EtQR3aV2m0yDMOdDaNOfGjmuUwJh+GIPsZtkf6HzaB
epJdxVNcsj4FRQIMk80FafVcoXwVAutJJzMxCZp1Y8PExcHtP9lzRwWZDUWiFHs/
pNuyPLNOnxrRQRHjFWgUpl41cbwfos445AKgUlrwb6q8Tca2UBoKpDgG8lcZJeg1
AqSOsnH0QKBW5A95zLjOKnTzCoElYGzORJDOgyHft9s/SxF7uuGNGXJ3UaYPAcLE
gdmRpCUH9X1mJQ6LDUuLJYRCGuxbWp1FO1DPVOfB1UykIfQkCv0zkqEqP+kdKRX/
OStu4NEEFXGKZ4VQQKylC/Yo2H8iKEOK6X/MLzinak6aXyK5uAm4QWYv0nko4i/Y
YbT/WjAU5UHU5yA7FFcg3vCAzJpp47+9yVImYZRiiaTuqf6+WePChXSfmZXcAaf6
n10IlHnTJceOn3cm2zPutPrWISy/SNOgAzHM7+n743+0B05j3+K4r4ei+jfP9UGT
QJi48Iuim9ZI9K/ykAua9zTBaR+msH/CDnbQol2QgHl6GC6dvRo5h8MoW3x0AJ0I
wKJudWVpGi2m2HPAP+xGyS1fDoz1A6XYs0PX3Itf/omHBfADMPzqNrOvnJn8H9DL
Qxm0EGlXbh5qxDEm0KXmC904+i+XXp8Ouc7tjySU+sI/S4rlXL4=
=VDrs
-----END PGP SIGNATURE-----

--kH8JNVvasRCCW1Oz--
