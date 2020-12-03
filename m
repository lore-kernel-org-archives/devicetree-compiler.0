From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/1] libfdt: Change last_comp_version to fit spec
Date: Thu, 3 Dec 2020 17:12:16 +1100
Message-ID: <20201203061216.GH7801@yekko.fritz.box>
References: <20201124174945.5399-1-jujugoboom@gmail.com>
 <20201124174945.5399-2-jujugoboom@gmail.com>
 <CAL_Jsq+CZA8weCYPcJYOdY3-z8fnwibsKhfGwO8nuy+7RH=pvg@mail.gmail.com>
 <20201202074627.GA87@DESKTOP-F375L8M.localdomain>
 <CAL_Jsq+aio50a18QrwA6VbxZmOYyzcC+tRkkxPkBPyLNcfh-5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5vjQsMS/9MbKYGLq"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1606976178;
        bh=x5WqCjV6igG7pjjs1iPTj7Ped7dGvYl+E+TYjp+pv2w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Si9ECBgkAwJjqtPbSrtl7wcW/iCi4OAJIs1VURTTf1AULgzmDgSn6EGumTPieQMhZ
         u639SBMjoQXg8ESmPIA+BGzMWPJQIVlVJcTupZWeaT0XqKCnaVkc+jJ5cbY+/Gjdco
         gY+Fipbvi80ZPaGwrzUDgBsHYJNGjY+VPB78o1mU=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+aio50a18QrwA6VbxZmOYyzcC+tRkkxPkBPyLNcfh-5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--5vjQsMS/9MbKYGLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 08:25:04AM -0700, Rob Herring wrote:
> On Wed, Dec 2, 2020 at 12:46 AM Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> >
> > On Mon, Nov 30, 2020 at 10:22:09AM -0700, Rob Herring wrote:
> > > On Tue, Nov 24, 2020 at 10:50 AM Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> > > >
> > >
> > > Needs a commit message. For a single patch, you don't need a cover
> > > letter. The explanation should be here.

Right.  This will need to be resent with a real commit message and a
Signed-off-by line.

> > > Besides matching the spec, what problem are you trying to solve?
> > >
> >
> > Sorry about that, first time contributing. I'm trying to help with
> > interoperability with other libraries that are made to read/write DTBs
> > by matching the spec.
>=20
> What library? Why does libfdt not work?
>=20
> > > > ---
> > > >  libfdt/fdt_sw.c | 2 +-
> > > >  libfdt/libfdt.h | 1 +
> > > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> > > > index 68b543c..4c569ee 100644
> > > > --- a/libfdt/fdt_sw.c
> > > > +++ b/libfdt/fdt_sw.c
> > > > @@ -377,7 +377,7 @@ int fdt_finish(void *fdt)
> > > >         fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings(f=
dt));
> > > >
> > > >         /* And fix up fields that were keeping intermediate state. =
*/
> > > > -       fdt_set_last_comp_version(fdt, FDT_FIRST_SUPPORTED_VERSION);
> > > > +       fdt_set_last_comp_version(fdt, FDT_LAST_COMPATIBLE_VERSION);
> > > >         fdt_set_magic(fdt, FDT_MAGIC);
> > > >
> > > >         return 0;
> > > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > > index 89adee3..abad93b 100644
> > > > --- a/libfdt/libfdt.h
> > > > +++ b/libfdt/libfdt.h
> > > > @@ -14,6 +14,7 @@ extern "C" {
> > > >  #endif
> > > >
> > > >  #define FDT_FIRST_SUPPORTED_VERSION    0x02
> > > > +#define FDT_LAST_COMPATIBLE_VERSION 0x10
> > >
> > > If the above change is correct (I'm not sure it is offhand), why not
> > > just bump up FDT_FIRST_SUPPORTED_VERSION value?
> > >
> >
> > I didn't want to bump the FDT_FIRST_SUPPORTED_VERSION to maintin
> > backwards compatability, and assumed that libfdt actually does support
> > working with DTBs down to version 2.
>=20
> Looking at this more closely, I think your change is correct. It's
> actually fixing a regression. Prior to commit f1879e1a50eb ("Add
> limited read-only support for older (V2 and V3) device tree to
> libfdt."), libfdt would set last_comp_version to 16. Now it sets it to
> 2, but really 2 is what libfdt can read, not what should be in
> last_comp_version.

Right, we can read version 2, but we can't write it, so yes that looks
like a regression (which the commit message should explain).  It
certainly looks like a correct fix - a version 0x11 tree can't
possibly be compatible with a version 0x2 tree.

> Also, I'm not certain what happens if you tried to modify a version 2
> dtb. It doesn't look like we do anything to fail gracefully.

Ah.. good point.  If you tried to use an rw function immediately, it
would fail correctly with BADVERSION in fdt_rw_probe_().  However
fdt_open_into() will incorrectly think it can handle it (when in
reality it can only handle 0x10 and later) then mark it as version
0x11 so now the rest of the functions will think they can handle it
and fail horribly.

Justin, if you can fix up some of those additional problems that would
be great.  Otherwise I'll try to look at it, but no promises when.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5vjQsMS/9MbKYGLq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/Igb4ACgkQbDjKyiDZ
s5JU0hAAig43OFBdWwzN4NvqrmTYAyKzktnLwTw+V3CC0TPivJRMxu3g6ewJ6/tO
isvxnVat/cx6GVRfD+i34bQBYilR9vMg+XGri2Klo2MtFLCvPTValZzRDwgjMHqE
+MGFO8v8CWsagNc7KRGv+uEtbtrf9SwDqh+EkFBidN17Qp6FZfV40+SYYYrOkOt3
nceXfPMot0UJ5ZcCQ9nN/y1swGqFZwzbPKypJ6QUaqjpmrk+fHIo2I2elmdBT3hO
EanlZ8YAivQ3MkiCYzaWT2wjVwr472Q9tPBJ6YETldc0NXSk8RiUQ/kFDbq5wJoe
vnMJNUDeTAQaAceO1fjFU4RBK+gMXPBiq1/pOywmcgoC39ekbIokM8p8UUquqdaP
/01bjoxWKe3TlF6+38o7md80eWAhyT02XJoVS1pZRm4RsceCVBubPHaiZBqBdYp9
dTAJGJLb1rwxbjVxXgC54kksjP7EW1i87JYAj6RWB+Zgg+LrQ6rlK8qihncbMifr
FN4jSBQq7mT5xhv5gfcF+pr38VDd5r2AMgrhnpKaSkETKAGipGOaKTG8qbzDJkP9
yeffZTBqE/th32w2JII94qW2oBD+f/C5LtOyNFiyX2P1OoCit2hzACii5Nr8W7nI
C3MpJ2OuRDDY++01sLNk8EYQROR+HIng6OaS1BpXpEtrAIFyAqg=
=qkyE
-----END PGP SIGNATURE-----

--5vjQsMS/9MbKYGLq--
