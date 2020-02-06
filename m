From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 1/6] libfdt: De-inline fdt_header_size()
Date: Thu, 6 Feb 2020 15:44:24 +1100
Message-ID: <20200206044424.GL60221@umbus.fritz.box>
References: <20191113015422.67210-1-sjg@chromium.org>
 <20191113015422.67210-2-sjg@chromium.org>
 <20191120035121.GD5582@umbus.fritz.box>
 <CAPnjgZ0bP3Hmk7daknD275J0SxJR6XoxNXPustqKJ4k3POPqiw@mail.gmail.com>
 <20200128082402.GG42099@umbus.fritz.box>
 <CAPnjgZ2MUorvc1+MY2mBozQn+kYA1Q=SLFhPPGXixoSZshUGsg@mail.gmail.com>
 <20200202031201.GB20412@umbus.fritz.box>
 <CAPnjgZ2r9wNFpcGJ47pk4mj4sGP_t+eDki7_stqwn0-tE1dATQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PpocKf6TCvdC9BKE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580964800;
        bh=H2jR0ELQulGBlk5jOEui2QO/uVqqE2uJx9ShYpv1h98=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fu7hmayNT6q8/iq3jaUx41EjDB15b0xlCf1IVvXtGzV2ZzfevlU3o4t0/nMv88NRU
         vSjzxZB0du+1PLZZpBF/zcJRCtFfmk7X43EE4FPtJHMRn0YYEfmY0i4P+fbwsO8c2Y
         3BOv9Hf4TBZxO6w8tvNeoCpfgdQ0d3ejsQBQR8mw=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2r9wNFpcGJ47pk4mj4sGP_t+eDki7_stqwn0-tE1dATQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--PpocKf6TCvdC9BKE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2020 at 01:57:01PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Sat, 1 Feb 2020 at 21:38, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> w=
rote:
> >
> > On Fri, Jan 31, 2020 at 11:14:25AM -0700, Simon Glass wrote:
> > > Hi David,
> > >
> > > On Tue, 28 Jan 2020 at 01:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6rL0yjEaa7Ru@public.gmane.org=
au> wrote:
> > > >
> > > > On Mon, Dec 02, 2019 at 06:07:16PM -0700, Simon Glass wrote:
> > > > > Hi David,
> > > > >
> > > > > On Tue, 19 Nov 2019 at 21:01, David Gibson <david-xT8FGy+AXnQMXKaNCjofrA@public.gmane.org=
=2Eid.au> wrote:
> > > > > >
> > > > > > On Tue, Nov 12, 2019 at 06:54:17PM -0700, Simon Glass wrote:
> > > > > > > There does not seem to be a strong reason to inline this func=
tion.
> > > > > >
> > > > > > Well.. I think my rationale was just that this function should =
be a
> > > > > > single load, followed by the call to fdt_header_size_().  I sus=
pect
> > > > > > it's not called enough for removing that to balance out the code
> > > > > > overhead of an extra function.  Or have you made measurements w=
hich
> > > > > > show I'm wrong about that?
> > > > >
> > > > > Well it isn't called in U-Boot at all, other than via
> > > > > fdt_check_header(). The inlined version saves 16 bytes of code sp=
ace
> > > > > on Thumb2.
> > > > >
> > > > > But even better would be to drop fdt_check_header_(). something l=
ike:
> > > > >
> > > > > size_t fdt_header_size(uint32_t version)
> > > > >    {
> > > > >    if (fdt_chk_version()) {
> > > > >       if (version <=3D 1)
> > > > >          return FDT_V1_SIZE;
> > > > >       else if (version <=3D 2)
> > > > >          return FDT_V2_SIZE;
> > > > >       else if (version <=3D 3)
> > > > >          return FDT_V3_SIZE;
> > > > >       else if (version <=3D 16)
> > > > >          return FDT_V16_SIZE;
> > > > >       }
> > > > >
> > > > > return FDT_V17_SIZE;
> > > > > }
> > > > >
> > > > > That saves an additional 8 bytes.
> > > >
> > > > Uh.. I'm a little lost here.  Is what you're suggesting moving all =
of
> > > > fdt_check_header_() to the .h file, so it can be inlined (and
> > > > therefore constant folded)?
> > > >
> > > > That could be a reasonable plan, though we'll need to make sure to
> > > > include an out-of-line version as well, for ABI compatibility.
> > >
> > > OK that sounds like a pain with little gain. Let's leave it as it is
> > > then.
> >
> > Actually, I suspect it's not that bad, I think "extern inline" does
> > what we'd need.
>=20
> I get lots of 'multiple definition' errors when I add 'extern inline'
> to the header file for fdt_header_size().
>=20
> >From here:
>=20
> https://stackoverflow.com/questions/216510/what-does-extern-inline-do
>=20
>    extern inline: like GNU89 "inline": externally visible code is
> emitted, so at most one translation unit can use this.
>=20
> Can you explain a bit more about what you are thinking here? I am a
> bit lost. Remember that in my next patch I have to check the
> assumptions in libfdt_internl.h

Ah, I guess I was wrong.  Ok this will need a closer look.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PpocKf6TCvdC9BKE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl47maUACgkQbDjKyiDZ
s5JEZxAA4PfIGt1wkNpuTT7bCmkch2RcbM6c2O8sAzdSUgV6zGJs0LXHzhwvqixm
eqMucQLPeDmjhmhxcIJ7JX+hmWTs2UkrxN52jEyDRudtPWiTbBmUa+I3Ktv8iTA/
YakKzVLeHeuQiU2A+kXiFd1CiMaJPXLAbFWKAvuchD+zRl3KMeArz2TjHzbAIHYv
ZxJprW1UqE76YVGprOmwYJlTgk6vOq5JT1IX8xqOOgnBaCD+jrDUJIjL7VUZMdmP
97W/1JYMY2dvJHO9H7FFmKQNoML2R72M2p1Sei6KD+QRNLYv87UMMhVXm9A87P5m
OmmiwIYyMyo/UyyRkyGg129rhkXc88GU/Qgmp/oM+Z6ue091uAbywrVuJP7CQsbL
EEtNlPgKRoTuimhvODu9bCyT8YLnBf8BsNZB0WjsElziBp4/5fq1TLWTn22ntXwo
1/g9o9fphK7bJqmfUfAgE5Ac8XhtLqsJYam1A3vCzHWKcVd3GTGqTlALlUwdonN+
ePYWXA+yk2q3kpQsC+jXyVbAhzi4YCubE14B8FoAR1GHgHBTyd3/QdafWwV/lkr1
GyfLdEbJxHx2jjiYBCG17Ll+WZrKhVbcWlk3hzZLEjYhz6e81MtqaScNL4VuSqs4
NEpDmttKdPfcbc7EVVvxlKM7z9NuHkG+Uc26ItWC8K5wIyqIaDY=
=F+Oe
-----END PGP SIGNATURE-----

--PpocKf6TCvdC9BKE--
