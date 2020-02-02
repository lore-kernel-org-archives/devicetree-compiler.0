From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 1/6] libfdt: De-inline fdt_header_size()
Date: Sun, 2 Feb 2020 14:12:01 +1100
Message-ID: <20200202031201.GB20412@umbus.fritz.box>
References: <20191113015422.67210-1-sjg@chromium.org>
 <20191113015422.67210-2-sjg@chromium.org>
 <20191120035121.GD5582@umbus.fritz.box>
 <CAPnjgZ0bP3Hmk7daknD275J0SxJR6XoxNXPustqKJ4k3POPqiw@mail.gmail.com>
 <20200128082402.GG42099@umbus.fritz.box>
 <CAPnjgZ2MUorvc1+MY2mBozQn+kYA1Q=SLFhPPGXixoSZshUGsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580618282;
        bh=LNZrRsHrQdlEZt4abQaGFZ7RS4z/AQuEMGtTFfOt6nY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tt5HVRoCXuIq80GJE4XWAeBukDsHEQsdvm5Up4SgH1zS7DTB4lrb5szoCoukb0C//
         KLCCaehoHROzN5FxzWrK8xn7VTnVOgi6wlrFWyL5L6/7DhBO2iZdBITMkiVt0JtjPc
         mk7reP9a/xg1hdnaJwTljDhzAsWUu4jAWIMMcYiw=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2MUorvc1+MY2mBozQn+kYA1Q=SLFhPPGXixoSZshUGsg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2020 at 11:14:25AM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Tue, 28 Jan 2020 at 01:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >
> > On Mon, Dec 02, 2019 at 06:07:16PM -0700, Simon Glass wrote:
> > > Hi David,
> > >
> > > On Tue, 19 Nov 2019 at 21:01, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6rL0yjEaa7Ru@public.gmane.org=
au> wrote:
> > > >
> > > > On Tue, Nov 12, 2019 at 06:54:17PM -0700, Simon Glass wrote:
> > > > > There does not seem to be a strong reason to inline this function.
> > > >
> > > > Well.. I think my rationale was just that this function should be a
> > > > single load, followed by the call to fdt_header_size_().  I suspect
> > > > it's not called enough for removing that to balance out the code
> > > > overhead of an extra function.  Or have you made measurements which
> > > > show I'm wrong about that?
> > >
> > > Well it isn't called in U-Boot at all, other than via
> > > fdt_check_header(). The inlined version saves 16 bytes of code space
> > > on Thumb2.
> > >
> > > But even better would be to drop fdt_check_header_(). something like:
> > >
> > > size_t fdt_header_size(uint32_t version)
> > >    {
> > >    if (fdt_chk_version()) {
> > >       if (version <=3D 1)
> > >          return FDT_V1_SIZE;
> > >       else if (version <=3D 2)
> > >          return FDT_V2_SIZE;
> > >       else if (version <=3D 3)
> > >          return FDT_V3_SIZE;
> > >       else if (version <=3D 16)
> > >          return FDT_V16_SIZE;
> > >       }
> > >
> > > return FDT_V17_SIZE;
> > > }
> > >
> > > That saves an additional 8 bytes.
> >
> > Uh.. I'm a little lost here.  Is what you're suggesting moving all of
> > fdt_check_header_() to the .h file, so it can be inlined (and
> > therefore constant folded)?
> >
> > That could be a reasonable plan, though we'll need to make sure to
> > include an out-of-line version as well, for ABI compatibility.
>=20
> OK that sounds like a pain with little gain. Let's leave it as it is
> then.

Actually, I suspect it's not that bad, I think "extern inline" does
what we'd need.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl42PfsACgkQbDjKyiDZ
s5L+fw//Snw6eeJfaz9iZE9RlMx1fREOPGNJ948DEeA0hnDRmUUH8/WS+/lenHN1
DgV1LfFiOQXzTIiFnGaATAVuPFQ2/vKnMwVwnt2ympnAsq/ChbEGChvfYLHV23ta
sU7QSwDovi3dEWu8tJcsgXYiZHH6rsI14rZyjDu3O+shcgUwsU3t5uY77khpwtgI
/g9rB0DD75wgkGRZtyJJBzwypTifmHp4HLmBPJySf3IeVfM3qsOIG8HD4wM65NaO
3NSZ12VHVsUri3r2/6jkHKdbWZEWGOu9usBAwbWWThcQxDZSIEzpe1ksEuW3zNzH
femozveYQ8Jkfwbx/lf40VQbeYo008snrnlc308nyWc6Nxy/hyktOxez3m6knuQH
3t/6WjK0Fn5JBAG/LzG1kSqszfnfJ8Um3uhCi/ey7qRl/S88Npgq0r+LdGvXKB2V
R81YXni0UN+KW2UOrBtIKXprMBu2RjZxVyj2vhcoEiLtnvKip1chVw34hsft866J
xLI9Ptv4bdOH8CGkrONpDOxxOsGr+Qx8ro4bDFcCuI4dt05ZECUk0z0ycP0zWzn6
7uwu+M+EYcqQh8NNcO7NDlinMW+vsQrxkAUCNpScD/5I05hOvX68xex2o69RgVpy
c+uApbUAtFR4Vy3QD9Vthq8crnVdAI0/ToFwtiO09m7B3pC2JlE=
=yeGx
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--
