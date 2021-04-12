From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3] checks: tigthen up nr-gpios prop exception
Date: Mon, 12 Apr 2021 14:30:25 +1000
Message-ID: <YHPM4Rg9bqbXTp0W@yekko.fritz.box>
References: <20210405052617.2471954-1-ilya.lipnitskiy@gmail.com>
 <20210405232855.51816-1-ilya.lipnitskiy@gmail.com>
 <YG5vgwadkwHBoTsQ@yekko.fritz.box>
 <CALCv0x0ra=UYRQi9XPabs=aCCC==Cdt2-NoPMqY6YkbHX+8yCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pEL2JIRM3WI8w2TE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1618205093;
        bh=rtJ+xGlIMxWPd8gBPrw+5NOnUzopk3p60fIWZoFijtw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hZXnlYwRKbbyMwXhdmCUkodY7UsoOEcRMGLFmTfxb27xrDK6JlwhiZN6FeLWP89Q2
         uZ44Wb3JKjijXL3kPXuuAmTvN71k4lwgT6QqgAMMtL5OIPMtTJVI4qlgGWihtuuqE6
         jj7PfBmNGS9VC5sSeRgjYwtWJ8T7XiUKHCFbmDc8=
Content-Disposition: inline
In-Reply-To: <CALCv0x0ra=UYRQi9XPabs=aCCC==Cdt2-NoPMqY6YkbHX+8yCA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


--pEL2JIRM3WI8w2TE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 10, 2021 at 11:20:54AM -0700, Ilya Lipnitskiy wrote:
> On Wed, Apr 7, 2021 at 7:59 PM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>=
 wrote:
> >
> > On Mon, Apr 05, 2021 at 04:28:55PM -0700, Ilya Lipnitskiy wrote:
> > > There are no instances of nr-gpio in the Linux kernel tree, only
> > > "[<vendor>,]nr-gpios", so make the check stricter.
> > >
> > > nr-gpios without a "vendor," prefix is also invalid, according to the=
 DT
> > > spec[0], and there are no DT files in the Linux kernel tree with
> > > non-vendor nr-gpios. There are some drivers, but they are not DT spec
> > > compliant, so don't suppress the check for them.
> > >
> > > [0]:
> > > Link: https://github.com/devicetree-org/dt-schema/blob/cb53a16a1eb3e2=
169ce170c071e47940845ec26e/schemas/gpio/gpio-consumer.yaml#L20
> > >
> > > Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Applied, since it looks like it definitely improves the current
> > situation.
> >
> > The use of strstr() at all seems kind of bogus to me.  Shouldn't we
> > explicitly be checking that ",nr-gpios" forms the *end* of the
> > property name?
> Yeah, I noticed that too. We could replace strstr with something
> similar to strcmp_suffix in drivers/of/property.c:
>=20
> static int strcmp_suffix(const char *str, const char *suffix)
> {
>         unsigned int len, suffix_len;
>=20
>         len =3D strlen(str);
>         suffix_len =3D strlen(suffix);
>         if (len <=3D suffix_len)
>                 return -1;
>         return strcmp(str + len - suffix_len, suffix);
> }

Right.  If you add something like this, you should reverse the sense
and call it 'strends' to match 'strstarts' which we already define in
dtc.h.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pEL2JIRM3WI8w2TE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBzzOEACgkQbDjKyiDZ
s5Ilew//fHhj5a7oneBI1Dh83+lx1R5JHsxQDDtu8pAqoCaSL3asRxHy1+TNW+vu
ePcAJDbybNoHYkwpYAG70WjhX3To3TcIPPMNTb6xpVwxM4FWuUH661alN8hBPaIv
Dt2l5vIIxUy7Hbtk8Hb9uQ7YJoZRsxxutNjdHHqXILbdar7cEq/ybKP4kr+2JSWj
jru/BVyo/Ai0PHaSZhb2wbqpRJ1NbAPy392LnCG+4w928zna3TByzUJ+SgOrZmj8
g/APYnPcjp4ILupt4T0EndaAW6AAdW6UrPhZACUgDgIdp7IT1jiVbliy7iO42iwf
RSX5bSzRjXsnhyth+uFanqbbLw40oQPeclfoQwlpc7F3u9UES5O0BbacgbvQpDrc
urYJz5CSgBVu+TPu0MQ+GxAs1t342jeURyRsS7b7AgKfgAadlnUg31z3dRGn8Dcv
14Hq5Uo6Yc2J2Du0a2YzpDMIpqp80oLRBia3CNdS7yzeGKomuNBHAKZH79jSb211
sYgbHy5apv+EJIYnP3/QLO3Z4XYQmp5NRPs3RYSeWjbMgogp8JoZdwKDjWnKZV9s
oIalujM/bCZFk5wFY/VGziILp1QZ/eHJLtvxsbb4XtAXGa7aPZe/MDzs1j/5SYML
0hqS3RcvvdB5L0PPi5169F7XC7CfD8usZgg4alkM9QOpXmY4uu0=
=xtlJ
-----END PGP SIGNATURE-----

--pEL2JIRM3WI8w2TE--
