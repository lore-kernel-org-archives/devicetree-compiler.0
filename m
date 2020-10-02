From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 2/4] pylibfdt: fix build lib location
Date: Fri, 2 Oct 2020 13:41:17 +1000
Message-ID: <20201002034117.GN1844@yekko.fritz.box>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
 <20200915192705.1716282-3-marcandre.lureau@redhat.com>
 <20200921063325.GC17169@yekko.fritz.box>
 <CAMxuvaxfb0gj285VfrozQp9KJT2XcN7yqyJWFE42tRZM9e1hig@mail.gmail.com>
 <20200925101647.GB2298@yekko.fritz.box>
 <CAMxuvawhzBSv84KhVWy=R7UMAsq6eo-yCJFSSuxhGa7n2PwK=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="McpcKDxJRrEJVmOH"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601615083;
        bh=UCai8LnboVfbLHuP2iAXRHPAmgRdJ6qCX+7eq6SAk0I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CrQ+kksPKBohEQFA+W3YPzTjWHQZ7jmFUM4pZ9CCyziyyCv0TitlJWgORwAJ45+KV
         eu6e17GBMM1oSNEemggwxnHYRfBAar7Ucn7KO7GX9tWSCnJ/GUR+CydX+IQB9N0thO
         RAsLddt/3Dhz4KZdu2fA5n7imkkP+UiWZDPNvKB4=
Content-Disposition: inline
In-Reply-To: <CAMxuvawhzBSv84KhVWy=R7UMAsq6eo-yCJFSSuxhGa7n2PwK=g@mail.gmail.com>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--McpcKDxJRrEJVmOH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2020 at 05:21:54PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Fri, Sep 25, 2020 at 2:40 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Mon, Sep 21, 2020 at 12:09:16PM +0400, Marc-Andr=E9 Lureau wrote:
> > > Hi
> > >
> > > On Mon, Sep 21, 2020 at 10:46 AM David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >
> > > > On Tue, Sep 15, 2020 at 11:27:03PM +0400, marcandre.lureau@redhat.c=
om wrote:
> > > > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > >
> > > > > setup.py build_ext is run from top_srcdir with Makefile.
> > > > >
> > > > > ../pylibfdt will produce output files in parent directory.
> > > >
> > > > Uh.. can you elaborate a bit on what exactly ends up where, and why
> > > > the new behaviour you're setting up is better.
> > >
> > >
> > >  ~/src/dtc $  make
> > > ...
> > > ~/src/dtc $  ls ../pylibfdt
> > > _libfdt.cpython-38-x86_64-linux-gnu.so
> > >
> > >
> > > It "escapes" the source directory
> >
> > Sorry, still not clear to me.  Is that the old behaviour or the new?
>=20
> It's the current/old behaviour.
>=20
> > How does it differ from the other one?
>=20
> What I propose will put it again under $(curdir)/pylibfdt instead.
>=20
> Apparently this was a regression from commit
> 1e4a0928f3b3b827824222572e551a60935607e3.
>=20
> Since setup.py is invoked from top-level Makefile location, you
> shouldn't have added ../ I guess.

Ah!  Now I get it.  Can you expand the commit message bit to make that
clearer.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--McpcKDxJRrEJVmOH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92oV0ACgkQbDjKyiDZ
s5IgYBAAr61YBp58bQiCihrWWMXqas7RN8KOCNiF6F7bIJwRIdFOIq6ZKikiCddE
yMyPID53imliMqK1xUlbznO7uzDjJ7XnR6yCN015fhIGVJDj4+Cdeqp3PlhWovqC
TLzUwbchKIu3cUa6/38FjHeA5piud5tOuDjKazZdd4b0G3YnUzzfTPznIUcON3hJ
Q1CfWs20qot56BsNkCJTpAD5zQo7fCpaB9ZMgsDKOb+WMbGYXg9gbAts1vFcnNhF
AdShhknGaew8EwRLlrSMIT0uZyiIjrpHyjksy8dw63ScdBFrJgcn30ZEhW5iI2LN
MwjgBrlhgWdQRZvTyDNd5yTHKPP8Q4iICTh+cQjEChUpDOn5uWeLP9yAaTBinFdR
qy7hszBAVedeyjCSgIxvF5jdOJocxSqyBEoKVwtmoMw9kn5Tgdp4g1xKp8nqkqRe
YNW+9FGX8CGbTzkY5AhWsc4Ub5XPF1EE+KD9c2au0zWOUBpTr9pc53nKVMe/FxVX
wAOwzBo4QSJDTMv+kdeErQRcICOd2jXLhNfPng6041viu5cYCkonm+Kq9DI3ou47
7jRC7mmwAVsE+OpiLQrPgr294jELhyOMa5mY67Wavcave32OuDKYZO7BEOrvZQcD
U2X+y3fbdzLSVOzJ2w+JKyt3JEkD2hY+KDAhwTTqepvhWgkFdvk=
=qFTV
-----END PGP SIGNATURE-----

--McpcKDxJRrEJVmOH--
