From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] checks: Add an interrupt-map check
Date: Wed, 13 Oct 2021 14:43:39 +1100
Message-ID: <YWZV67jAjwgo4rLm@yekko>
References: <20210928212335.2061125-1-robh@kernel.org>
 <YWPEEyJn1o0ikYEL@yekko>
 <CAL_JsqKrRAOiuY=71xsZ0RRojsOraXmSaLpDYSXx1E84SF_qDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JNa2r984Zgg5Pobh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1634106389;
        bh=v3cP2El1kq7kckeR5qqIb4Lk2Sh3OCAf30wUkuMRk/Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pLZoMLYdRlqYnfDvgrKY6c3UNO/jweGg6G/BJxPooN2QY1+Yvk+/Q1ljeBrTsIdGT
         crHeL57DLIsnAs7QanaWMmYoMwwmwOdBErcTTd6aLpKt3qN4nSRSiVm+ljqFhh/mqz
         032vITDWrariNRv+l5YwNsr8Ycop96hE+bF8rSpI=
Content-Disposition: inline
In-Reply-To: <CAL_JsqKrRAOiuY=71xsZ0RRojsOraXmSaLpDYSXx1E84SF_qDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>


--JNa2r984Zgg5Pobh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 11:56:19AM -0500, Rob Herring wrote:
> On Sun, Oct 10, 2021 at 11:58 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Tue, Sep 28, 2021 at 04:23:33PM -0500, Rob Herring wrote:
[snip]
> > > diff --git a/tests/bad-interrupt-map-parent.dts b/tests/bad-interrupt=
-map-parent.dts
> > > new file mode 100644
> > > index 000000000000..fe88ce2fe76f
> > > --- /dev/null
> > > +++ b/tests/bad-interrupt-map-parent.dts
> > > @@ -0,0 +1,17 @@
> > > +/dts-v1/;
> > > +
> > > +/ {
> > > +     interrupt-parent =3D <&intc>;
> > > +     intc: interrupt-controller {
> > > +     };
> > > +
> > > +     node {
> > > +             #address-cells =3D <0>;
> > > +             #interrupt-cells =3D <1>;
> > > +             interrupt-map =3D <1 &intc 1 2 3>;
> >
> > If you just want to verify the check on the bad parent, shouldn't you
> > have an interrupt-map-mask here?
>=20
> No, a missing interrupt-map-mask is not an error. Only the wrong
> number of cells is an error. It's treated as all 1s mask if not
> present. So, in interest of having a minimal test, I omitted it.

Ah, sorry, my mistake.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JNa2r984Zgg5Pobh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFmVekACgkQbDjKyiDZ
s5JCEg//Y9DQ4E9PPSS8Q7RtdT8w+jYkwNfeII749G5BNLMT62E0DiuJEJAs8sj8
a9/xGYM8+IlDOlAcf9NCnxLCv/8glcXXOFnf3O/7A/VLNuxuhfdVEMuLfxqmKgEJ
yVwQcjTyh43LkDKqKmISNmSS88pSqnATh3wHiWUOQv/qK277xHRxR6QnZp9mRQkb
NXzmT32k4OnxQ3IdLID1E+60x5F3l7bLNKezbhV0E9NTaqmqFewjzu6NUL3jVRS+
4ijwXI6oCfdZvOOCIQFVxx1SDroziv7w37hhhe8O7WTcr6jfudoPAItVC+eqZeot
Ho0Sf8kH0aZV0DHXA4rq1pqQWwLZarOXDeoxHSs3gW93bgmk3qUJMJTisI1B6gX7
O2KTajKhGKwvIe7YtEbmbZPjkp8t1shb0IKIKTSS4/FcdBZZQyYfLaoHZzeDnz4i
lU0DX0y6sXDu7qs3LyfR9CE+J8W5W70pg3Ds9D9UX0eTagNgMfBoZTdTtDKm/egH
hu6N9Ey9mdCP3loUcWJPYU4KGpJ38Lxjs0WZ77ZgLAoGT8MgpHvYe2qrpp+pReS2
iLcvwVYdADULuLSGfTqeTY95weazBZVBnSGdD5RCD/yBcFygyQDzRyhs1JwxfjNp
Z65cx+e4DX8AeVUfexxwcXUfIkoT9Qr/SOK5HY2P+tQrbc7odpw=
=/NqP
-----END PGP SIGNATURE-----

--JNa2r984Zgg5Pobh--
