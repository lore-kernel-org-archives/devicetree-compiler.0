From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtget.c: Fix memory leak
Date: Sun, 24 Jul 2016 01:04:30 +1000
Message-ID: <20160723150430.GD24621@voom.fritz.box>
References: <1468362968-32090-1-git-send-email-jcd@tribudubois.net>
 <20160713025005.GD14615@voom.fritz.box>
 <5785DA1C.7030601@tribudubois.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1469286648;
	bh=SlWujfZLlXYQg6l21aEv818Y6mQtWtzHECTuo2wHVW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lUukjmJBZxX9051WEq3IZh+7yHLy1N8CjCWVtAy4gCrHXxcsVkuMBiHBlccrnpeJo
	 yJjMDjNdDNthDYEQ9arZ3A2zPEuijQw194A7whlkAebtzY96pqK3Kr0gUABswXFhLE
	 KluLR9jIFXfAOPP+QqtO5h/1QVG2u/dsnXu7whX8=
Content-Disposition: inline
In-Reply-To: <5785DA1C.7030601-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jean-Christophe DUBOIS <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org


--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 08:05:16AM +0200, Jean-Christophe DUBOIS wrote:
> Le 13/07/2016 04:50, David Gibson a =E9crit :
> > On Wed, Jul 13, 2016 at 12:36:08AM +0200, Jean-Christophe Dubois wrote:
> > > CID 132823 (#1 of 1): Resource leak (RESOURCE_LEAK)
> > > 5. leaked_storage: Variable blob going out of scope leaks the storage=
 it points to.
> > >=20
> > > Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
> > Since the program exits immediately after this free(), there's really
> > no point.
> This is usually a good practice to free explicitly the memory we are
> allocating rather than relying on some kind of (final) garbage collector
> (like in java).

Well... it's important to have a consistent model for memory
management and stick to it.  For little programs like this, never
freeing - essentially using the process lifetime as a really simple
pool allocator - is a pretty valid option.

That said, I guess there are existing free()s so it's not really using
that model consistently.  So, yeah, ok, we might as well shut the
checker up by applying these.

>=20
> It seems cheap to fix but this is your call.
> >=20
> > > ---
> > >   fdtget.c | 8 +++++++-
> > >   1 file changed, 7 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/fdtget.c b/fdtget.c
> > > index 4377419..fb9d0e1 100644
> > > --- a/fdtget.c
> > > +++ b/fdtget.c
> > > @@ -266,14 +266,20 @@ static int do_fdtget(struct display_info *disp,=
 const char *filename,
> > >   				continue;
> > >   			} else {
> > >   				report_error(arg[i], node);
> > > +				free(blob);
> > >   				return -1;
> > >   			}
> > >   		}
> > >   		prop =3D args_per_step =3D=3D 1 ? NULL : arg[i + 1];
> > > -		if (show_data_for_item(blob, disp, node, prop))
> > > +		if (show_data_for_item(blob, disp, node, prop)) {
> > > +			free(blob);
> > >   			return -1;
> > > +		}
> > >   	}
> > > +
> > > +	free(blob);
> > > +
> > >   	return 0;
> > >   }
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXk4d+AAoJEGw4ysog2bOS1MUQANOdvYMXVgVWGFrinIrtLZIf
BwWKknCvGQ2kkC1K7FYlMLMFwcZTQkplAh2TpCDIVJ98gODg21t0AV1VYGmuZlNE
AhHqdwPfM/Pjnw4T2zyG5T405Sr5xyO2mpE8MGCCcoZKLWFBNuB0uyGVdf+PmMci
lJCmBuc/h7B6b5CUCLNBNiCmshFBtiIGOXrfxH8tdWb4IPxoIplcU/gmWfwCv4kf
kGXRQWNt/g65bWdIksAd/+JiGpCAuWmfdaO/ldTccOk9KWpLrMZlLcomcuKJK1u5
gopprx6eQiENtjwLV8EZ8cArF3RxbldTkTWHuv0ahO8xQySUL3/71kjFygeUpwDD
FQ0ex33tmRd4uWJIHUs54FX3seB3F01auwjUfsexEMMw+CTWWSH0QGwpFScI07+j
MJmE6UUkTdNqhRkxz+mbQQfksLlsdhfacG7hKeRrIFu6pzjKlfVgJbinD8rvhaT9
tHpvaVVAU4J9JQafVtOnvZ2O/R6sucs403yexlW1W95nlrxVIQ4q8NBNHxySyxxQ
MgbyyNycQKfIaP67+HcEvkNIoNqzKJ5g3/9bM0fPV5TtJ/plt7tpkaVKQ7pMfBaZ
53oZ+xY5XIBpazmAcYL4p2U0aMkjAuqY+t1Y46lyzXcwWNu2Z3UrdKufwpZl8o6j
jjB0VwUNsrYGW5nDLXqf
=F5Tk
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--
