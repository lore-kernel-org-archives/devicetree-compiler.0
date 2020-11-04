From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Default to assuming aligned reads are OK
Date: Wed, 4 Nov 2020 13:44:45 +1100
Message-ID: <20201104024445.GA5389@yekko.fritz.box>
References: <20201030185658.4655-1-trini@konsulko.com>
 <20201102005607.GA143651@yekko.fritz.box>
 <20201102160347.GJ5340@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1604479344;
        bh=dDjBaOlQC1Wzgo3wVFdA8n/Jf5gkLN3o3RibO/Dw0tY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BwhfeS1lGBHzDU6UaX4HoHexFpCuG5l37kz3ruxkAu63vCDqzNWXy+mh+Oh0fW9bw
         rrXWgVL7i5pwEgTiqLy0fWAyqjycyoI1wSV9gV/5rBsqZTvzjqYn+7H6hIPq8QbI6c
         A5zMs7S7JNUkplx+sA6GXiHW+1LjLQHlG9C3P/o8=
Content-Disposition: inline
In-Reply-To: <20201102160347.GJ5340@bill-the-cat>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2020 at 11:03:47AM -0500, Tom Rini wrote:
> On Mon, Nov 02, 2020 at 11:56:07AM +1100, David Gibson wrote:
> > On Fri, Oct 30, 2020 at 02:56:58PM -0400, Tom Rini wrote:
> > > Start with commit 6dcb8ba4 "libfdt: Add helpers for accessing unalign=
ed
> > > words" which introduced changes to support unaligned reads for ARM
> > > platforms and 11738cf01f15 "libfdt: Don't use memcpy to handle unalig=
ned
> > > reads on ARM" to improve the performance of these helpers, libfdt has
> > > defaulted to assuming that unaligned memory access could be a fatal
> > > problem.
> > >=20
> > > Upon further discussion on the mailing list, we leave the improved
> > > unaligned-safe memory load functions available if needed, but go back=
 to
> > > using fdt{32,64}_to_cpu() for access as generally platforms handle
> > > unaligned access safely and there is still a sizable performance and
> > > size impact of using the always-safe helpers in all cases.
> >=20
> > I think the basic change is ok, but there's some details I'd like to
> > see changed.
> >=20
> > First, I'd like to see an alignment check added to fdt_probe_ro_().
>=20
> OK, that's not hard.  Do you want a new error code or FDT_ERR_INTERNAL
> or something else?

It definitely shouldn't be FDT_ERR_INTERNAL - that's always supposed
to indicate a bug within libfdt itself (basicaly anything that returns
FDT_ERR_INTERNAL wants to be an assert(), but actually using assert()
would pull in complex dependencies we don't want).

/me looks through the error list

Yeah, nothing there really suits, so we'll need to add a new one for
this.

> > > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  fdtget.c        |  2 +-
> > >  libfdt/fdt_ro.c | 20 ++++++++++----------
> > >  libfdt/libfdt.h |  2 +-
> > >  3 files changed, 12 insertions(+), 12 deletions(-)
> > >=20
> > > diff --git a/fdtget.c b/fdtget.c
> > > index 777582e2d45f..7cee28718cbc 100644
> > > --- a/fdtget.c
> > > +++ b/fdtget.c
> > > @@ -62,7 +62,7 @@ static int show_cell_list(struct display_info *disp=
, const char *data, int len,
> > >  	for (i =3D 0; i < len; i +=3D size, p +=3D size) {
> > >  		if (i)
> > >  			printf(" ");
> > > -		value =3D size =3D=3D 4 ? fdt32_ld((const fdt32_t *)p) :
> > > +		value =3D size =3D=3D 4 ? fdt32_to_cpu(*(const fdt32_t *)p) :
> >=20
> > Second, getting rid of these ugly open-coded constructions was an
> > additional reason I went to using fdt32_ld() everywhere.  So I'd like
> > to see both an assume-aligned and an unaligned-safe helper, rather
> > than open-coding the load-and-byteswap everywhere.
>=20
> OK, I think I've got an idea.
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+iFZ0ACgkQbDjKyiDZ
s5IPtw//QiBl4Qvw+nYQoK6gCAQAAzKI7W3uhGMqhxOuOwte4NaNqjDq1eVcmLKP
I3PqmHEXFxfFvsz8clbQpza2l04a12W72CGD71F9LaxI4NgmvnAqag0HXraDHY/Q
R/IjKBO67MVgKXtfKqqpcsIWpN4Nku0RM/pcK6epqIJpyv3KM3kWoLW+UmsMY/wz
29HqjiylRSmzuCyB43HK/l5w17QRxWMgMhB5d5krDLD/mMh1hRse6W85NH0Qd/SM
wxhQgIFkNDXR0CR42RTZMomja3VpOzeKv9niLFuYdeJPWy5m3Hkbq9qUAWsGCjfb
4ae2WHLXa4cPxVm1DQBvwPlLcxPQQYsjh3XYsziGd0RikaDoxTFQTKLGnF9pVWeS
58wEa9R5ibufqCrN+uvks2rIAh7pbIZapxt5eLCHzJgdeR511DB0R7wm9bAiapeW
WI9Wsk6Y6S9Qmu/Y7zahWZW0c2ayGxb5aWK2i84g6ptOfY9OX0P3UvwMkzq1eKB/
J/vtczSa/VZ9yNjmoN+g0/nZCLc3KJGhArNUJZx5poqxe86qbOPql85dCxuHmgWw
auOMj8vhn6EXXde+my0dH9s7e4dcyjr8/XyOXxChWxEUZAnKYAV/ixICPyCbwEHQ
UpVdxJI9f8/xpNeEI5Tr8RIOKCzvW83UtIhg1gDy+a5+gUD0Ie8=
=rJNp
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
