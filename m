From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] checks: Update #{size,address}-cells check for
 'dma-ranges'
Date: Thu, 2 Feb 2023 17:49:06 +1100
Message-ID: <Y9tc4iAcs2UZDd+8@yekko>
References: <20230112125654.13390-1-qun-wei.lin@mediatek.com>
 <CAL_JsqKkE_Aytd_7WOV3iM+pipjnwDWR7yt=L+xE8+cyjL8b9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6FN6gqt57+A7i1eY"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1675320630;
        bh=ibDMfHOKa/gPtvLsD5mqUhSo1Gz66NYAGZ7ITnLX8Q0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RxdKcMhMNVLKSw/weoPKp4RU9YpS7KyHMis+rsfR4CNQy8cYruDaAaz4pbnKlP3VJ
         JI2SyBflUj2s/C2g+FniluLI4BZkKRwVdo53xdx0x9FrcWZ7vxi/Xnf76s5PyqogPh
         W8JjMROXHeSDaoAO6XvNmqUwo7a4pyT1vSNUU51M=
Content-Disposition: inline
In-Reply-To: <CAL_JsqKkE_Aytd_7WOV3iM+pipjnwDWR7yt=L+xE8+cyjL8b9w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, casper.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chinwen.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kuan-ying.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ivan.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ladon.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org


--6FN6gqt57+A7i1eY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 01:47:03PM -0600, Rob Herring wrote:
> On Thu, Jan 12, 2023 at 6:59 AM Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wr=
ote:
> >
> > The "dma-ranges" property value is a sequence of
> >         child-address  parent-address  child-size
> >
> > The size of each field is determined by taking the child's
> > "#address-cells" value, the parent's "#address-cells" value,
> > and the child's "#size-cells" value.
> >
> > However, in the following example, it gives a false alarm:
> > +-----------------------------------+----------------------------------=
-----+
> > | ranges.dts                        | dma-ranges.dts                   =
     |
> > +-----------------------------------+----------------------------------=
-----+
> > | /dts-v1/;                         | /dts-v1/;                        =
     |
> > |                                   |                                  =
     |
> > | /{                                | /{                               =
     |
> > |   #address-cells =3D <1>;           |   #address-cells =3D <1>;      =
         |
> > |                                   |                                  =
     |
> > |   parent {                        |   parent {                       =
     |
> > |     #address-cells =3D <1>;         |     #address-cells =3D <1>;    =
         |
> > |     #size-cells =3D <1>;            |     #size-cells =3D <1>;       =
         |
> > |     ranges =3D <0x0 0xe000 0x1000>; |     dma-ranges =3D <0x0 0xe000 =
0x1000>; |
> > |     child {                       |     child {                      =
     |
> > |       ...                         |       ...                        =
     |
> > |     };                            |     };                           =
     |
> > |   };                              |   };                             =
     |
> > | };                                | };                               =
     |
> > +-----------------------------------+----------------------------------=
-----+
> > | no warning                        | Warning (avoid_unnecessary_addr_s=
ize) |
> > +-----------------------------------+----------------------------------=
-----+
> >
> > Same as "ranges", it should not be reported in this check.
>=20
> Except that dma-ranges only makes sense if there is a ranges property.

Hm, does it?  It would certainly be an odd situation, but I can
imagine a sort of bus that can DMA, but which has no-addressable
registers on it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6FN6gqt57+A7i1eY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmPbXNAACgkQgypY4gEw
YSLJAA/3e0dOWNThAfvREUTybFa+/hDcTsPqpa/3hWulfFnXohdeQWAIZYzypD3n
RKtjup7bBoaeE0TAd/2A1musDCc39nK4nInI/MSP7fnTNv5K7yNMXprZUNi4gSAq
qap5pUH9G4E9O4JRMTbJiSjryYwHXeTE5FOIP5njmQiX3sKcAZrMsNFBJFOn+mil
h+4quCkQLTXVXOjR+5/ptggwQL2xRTqI5Ta0bjMvDYk3yLOhKX0WWDEANRvUUtCe
90fDZu1KGOqaZ9CyAk2OvihiJwGBT7sksWbm1zrR1Qs31dJNLD5ZDrpU7TISVJ8y
kdU3017pqo76PL2HL4e7LCY4Hpb6/EYmlDnF4reKaK6mhgE17sGogS2TpdLgRTU0
YrzQRqtYHcM9enrhaUEyffDuUIeWWuX/KWptWJrcgcxB+vIVdVa5a9nujdpR/Xol
chFgSQhhikKXj016ukeqAvB5v+kfPhbPW9nBb+yjDKkbu4D+DWMd9nVsK7CvP7aM
SoTgSUiIn248LYBORlqxfxz30AML33QcZfPoSeAiRNe7yyy2E+iM4Lp6/gT45+uv
JaH437/ghhd59O388Iq9mU1GfU4XknQPSMCgpBkliiQOz9NIKAOotHEg0X+Ws/aV
3/jRXCVrh9J/aRrJAUTMjQAmaBi0aqGWP9vu67I67n+/JqudMQ==
=xgKr
-----END PGP SIGNATURE-----

--6FN6gqt57+A7i1eY--
