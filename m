From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Windows host support
Date: Thu, 13 Aug 2020 20:12:54 +1000
Message-ID: <20200813101254.GE181791@yekko.fritz.box>
References: <67d79f82568f0486315c969d6e41f6a8@codeaurora.org>
 <CAL_Jsq+fPPi8zNBo3wHm2rYmvfvWfzvyqiY3bkPa=dw682RNOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1597315509;
        bh=o6f2Nw34rOzJeFzRbvyyEUNMAjjUrJtR8BdbVNUj66E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D09gl+svyjQb0Hnr45GvWZRPht28JXPEwZdmr5ITYGUgHDloJe/fyhtFrJFsPHHVE
         wa9bMQ/sKvzbljhjZV79DvgbZOAd2XGf1e686ytwbI38kxlk4THP/2RUPLVplABq+E
         EAse2/bjdmghGQLiddLDN5AtwjQogGS9K5+gr88c=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+fPPi8zNBo3wHm2rYmvfvWfzvyqiY3bkPa=dw682RNOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mturney-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2020 at 09:17:55AM -0600, Rob Herring wrote:
> On Mon, Aug 10, 2020 at 12:22 PM <mturney-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> >
> >
> > Folks,
> > Is there a separate list that contains information on building dtc for
> > use on a Windows host?
>=20
> No.

I wouldn't suggest creating such a list either - the list volume is
very small, so I don't think splitting it any further would be
worthwhile.

> > I didn't see any reference to windows on the archive for this list.
>=20
> Probably because it's not an itch anyone has had. It shouldn't be too
> hard given folks get more complex projects to build.
>=20
> Rob
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl81EiYACgkQbDjKyiDZ
s5L6lg/+NMi5S1wNqkOqqje8W7QFdhLTSnY9S5iSrXBIdbj3mwYKXYzX5CzHDHBY
RnHS0ITQ7SjTu0gERBMkuu1jhZbv59pHsVpbvC6Asof3t0wHBMannsgB/d5z5FZO
Rj4+E1jLLeSwo7lYTWdsEjQd5cmDee4pl/yruWDvk15xzvvqiyeEbkdCAFNeQ9BC
I0n975x3mUVUTDOww5+hqDgOeiKe9JpHRYFG55nrNHcEuCfH7T+vpS0BtvfgCHQ+
Pd+R/jsKTtMr4OByoos8V6m9bRpA3gMKjvMZiEWxGodJ4NEIw93DNnCi2CvS1R4U
cqRkzTKrHrEsXsoX6tQwSSORwVxvZhKhE5sUxqKwG2aSZp7+fEVyZ9HpvTpPH7fE
Zkx3tGOwMljQi5WSZ3tk9ZWE764uVbB2C95HrAXydox6T5twSbxve1PJQRHhDzeh
L+DpJ1BnLGkDGchbPbmkVW7tYvvy1obaZUqKELubHK4Lmqszn0qLOmhqTzh9BL1P
m69eizzaafkjtWqPXNouRHDiXAg7AuuhCPxDQqLqRY62XimiIrRqOlQ7nDBeQiM5
B/FCtMeqM1Hebtyu31Ge0FTdVVLnRHieVB/k0M67UBidp967SAfpdyQ8PFseP4LU
IJjWB4ya/sQHxRB4/h7itoUZYCjlLksZkHLilXP1a23m8EGTfDY=
=VI9p
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--
