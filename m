From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: Show the usage text if no parameter is passed
Date: Thu, 19 Oct 2017 13:02:23 +1100
Message-ID: <20171019020223.GW2776@umbus.fritz.box>
References: <1508369307-22307-1-git-send-email-festevam@gmail.com>
 <CAL_JsqLi5Jte+7_d1kq-Uka=7nV9foKudQ9w31noA++bvUJWjA@mail.gmail.com>
 <CAOMZO5A3ettpwGVATUL3PF6Hj-3087E93QVLZ0tNgD-BG53MYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LvlcLv3JjFtLV6y2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1508378548;
        bh=s787UXEYD4BUHxOweKoOjDHToQ9d1du8WSN3FsVSSS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kzqzETa9GPKgIP8DtktIPbW3VzuKVXZmoTMWItDy/nkXKgU5l+NEQ5tG7GmMKDQcq
         kzeYnlLoVgkSZFnfk9Cg2TqevnPq8B+35By0vKpk+Z7GOIWPfU7eQYAY4VzmW6iiU7
         0/lej55HZax2TV6IwTLRj0px2oq9X4oGGALyhcVE=
Content-Disposition: inline
In-Reply-To: <CAOMZO5A3ettpwGVATUL3PF6Hj-3087E93QVLZ0tNgD-BG53MYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>


--LvlcLv3JjFtLV6y2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2017 at 10:38:41PM -0200, Fabio Estevam wrote:
> On Wed, Oct 18, 2017 at 10:02 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, Oct 18, 2017 at 6:28 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> >> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> >>
> >> When dtc is called without any argument the application hangs forever.
> >>
> >> Instead of hanging, print the usage and exit.
> >
> > I think it is valid to do:
> > dtc < in > out
> >
> > This doesn't hang:
> > $ dtc < /dev/null
> > Error: <stdin>:0.0 syntax error
> > FATAL ERROR: Unable to parse input tree
>=20
> These examples do not have argc =3D=3D 1.

Yes they do.  Everything after the < is processed by the shell and
doesn't appear to dtc as a parameter.

> If 'dtc' is called with no arguments than the application never
> exits.

If dtc is called with no arguments it attempts to read a dts from
standard input and send a dtb to standard output.  It exits when input
finishes.  So, if you press ^D after starting it, it will exit (with
an error, because you haven't put in a valid dts).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LvlcLv3JjFtLV6y2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnoB68ACgkQbDjKyiDZ
s5K0jhAAlBdXwlwJ+58nYq/qf+M8v6oYHG/KC7uw0QqdHeCEoqTrZ1ecL9HqT8no
nTXRamYRVNQw7y2xaG08wiz2uVrlPckiNNhDLE/y6vV4tgivdB/a0vDdo6CH5bLM
Hz/kj93A06fv4s2PMEgDGNV6ayuSDq9+HjdYxxKnCbkhUM6HcEHrThvzO7TbOFca
3k5v+KKywpbPpoTxw5gj0O7A68nq2g920qEYGjuau+wuMrXPLF8p51pF1CJk1izc
oyL5EjgYynaiykogPx6Ch8uWchm53o5l/Py0TtTy5zK7thECOjCsN0oqRou3+HBG
FkICOqol0dDVRQKZFhnr9uKmpBFXxAhOL/9iXqh+6rNGIXTTOBtDAsCCS/UbHGqW
EZpL6QcowR0DLY4FZ44DmiJveZr4SorR33q/XoWXUi25KPcmmLsZX8JRLUIvQLnw
CYXPkDxQnohaJ3sTn2leXWnT+qiZlZqrqHY19q/7dauUhalbcoh1gz/do/NPVtkG
0z7/8GlfS7aiVX63xyLFcoviRryglq6SzFxwOaaeHTlZbWFoYVJecWZkaiin7V2n
7hgMsCUexGwFfbG4u27g7z0+DzI+K35GxC4cvL/wH+gx4OKXX/ncJGBjEPV+SZvJ
98l3rlD2mLztexQ8HPijkFiSFKQRwDc0dw9z2pHkK4VQhMUyhbc=
=FfMk
-----END PGP SIGNATURE-----

--LvlcLv3JjFtLV6y2--
