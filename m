From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 7/8] libfdt: Add support for disabling ordering
 check/fixup
Date: Wed, 12 Feb 2020 16:39:47 +1100
Message-ID: <20200212053947.GX22584@umbus.fritz.box>
References: <20200211200945.46606-1-sjg@chromium.org>
 <20200211200945.46606-8-sjg@chromium.org>
 <20200212045759.GV22584@umbus.fritz.box>
 <CAPnjgZ2BtNuFX0TG_7G0ydJ5jbBOQxUHgf0Khrs0snOkpkb-Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+9WMDU/RdULAIC7Q"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581485993;
        bh=mA+uo3hE91XWdwL2cQfKNquykEHzQdwtPQGpnzbd5+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XgH92IZzO7ZRkR5DfMYW8c66H/OlKectq3LefPR/i/xBslO7KsOcFGBIU3+iWYglH
         YlBA13Y5KIoegaua8giucFH+uCh3Xb83yTwedl4K+IckvRiW7cCWGWpTuiXuPZ25vQ
         EG+QOfwhGtFpV7Yln7gJ9C62QT56uIikKZVID3o0=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2BtNuFX0TG_7G0ydJ5jbBOQxUHgf0Khrs0snOkpkb-Wg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--+9WMDU/RdULAIC7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 10:26:21PM -0700, Simon Glass wrote:
> On Tue, Feb 11, 2020, 21:58 David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> wrote:
>=20
> > On Tue, Feb 11, 2020 at 01:09:44PM -0700, Simon Glass wrote:
> > > Add a way to remove this check and the reordering code, which is
> > > unnecessary if the dtb is known to be correctly ordered.
> > >
> > > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >
> > Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> >
> > .. except for not liking the name.
>=20
> NORMAL_ORDER?
> LIBFDT_ORDERING?
> EXPECTED_ORDER?

Oh, yes, I should have suggested something.  Ummm.....

let's go with LIBFDT_ORDER.

>=20
>=20
> > > ---
> > >
> > > Changes in v6:
> > > - Add a new patch to disable the ordering check and fixup
> > >
> > > Changes in v5: None
> > > Changes in v4: None
> > > Changes in v3: None
> > > Changes in v2: None
> > >
> > >  libfdt/fdt_rw.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> > > index fe13671..0d9d1b2 100644
> > > --- a/libfdt/fdt_rw.c
> > > +++ b/libfdt/fdt_rw.c
> > > @@ -435,7 +435,8 @@ int fdt_open_into(const void *fdt, void *buf, int
> > bufsize)
> > >                       return struct_size;
> > >       }
> > >
> > > -     if (!fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
> > > +     if (can_assume(CORRECT_ORDER) |
> > > +         !fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
> > >               /* no further work necessary */
> > >               err =3D fdt_move(fdt, buf, bufsize);
> > >               if (err)
> >
> >

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+9WMDU/RdULAIC7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5Dj6MACgkQbDjKyiDZ
s5JPEA/7Bpu61MjD7QMcqUO7Bhnj4Cx7rL9GA2l+WQbXwSCN+VDr3Ny0TyIlk+St
RW7N5z1MHt7CwX+Ikjog3VqhgKWTQFg+AYQDHTkojEYDTgOQXpINgnwwgpttKsIp
z7Z29QUwg2W0czBMDva9VjOQP8fRLUrmdqj257iBSEIt9e/mErBIp1v4FQvQaLp5
mB8JS8d4PIk0SWyEIT6NkSKrLmI+oiN7PUne9qn4Ie2yPLboeCFL2KUMkT8FczNf
wzhwYSpEbW8HGWhjFofQrgAeo/6xaR/mVWl46Z6EUS99ZsawgWQQYxG3A0AKLBLU
V7Rro9tSqAFCUM0paMgdQA2Bg11rwuX7cu9vlnAtZWT97iCpKc8sR+06+PDJWWa0
jkInC5ow/wD2cKmGP/iXix5Lehjdgn0h1AoWEWVsxy7UiAAO9Q4x+SINb2C79BwA
IBFQ3TSO4nQ6rArEwmyhC9FpLEYIn7lH4cqPx3QJrYKHV2GjW5oT6lB64EHy0t/G
f/gZtN4K61X4Ko+O/T/I78iSUK7MkgPmFOjYp+JM6+7d3PSkXPR/qVqv5KURtSiM
ePjD9skzYmS0onmhjsJrxZZOVPZtq0SEiXsQfPMcsSOUISCAuCObtW+f96W+GxNB
xRQsw5RgAYyrLaeg5rkcoLIUQE9IPz9p+XRU9gVm+Gst6CDMLnw=
=GUVP
-----END PGP SIGNATURE-----

--+9WMDU/RdULAIC7Q--
