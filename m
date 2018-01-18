From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] srcpos: correct column numbers
Date: Thu, 18 Jan 2018 15:22:02 +1100
Message-ID: <20180118042202.GI30352@umbus.fritz.box>
References: <alpine.DEB.2.20.1801151932100.25462@hadrien>
 <4eec9dbb-c047-86ae-e4b2-08de9f0499fe@gmail.com>
 <alpine.DEB.2.20.1801160707350.2617@hadrien>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mu9njEoJVcULXJK5"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516250133;
        bh=d+O7L/ZlgaKbNgIscT6CJkfQNUakrMJF+KjCjXNyuac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jAv1X7E6YPOFXAdr3HoV1dQgqQ499nrBiLgKQCDeUN5pekTi7PpNOq5vPexX46CJf
         bsPgEby44XvvYsw4gmNYR1LJhvyHHJuRcTxCGKj+DPpGjexLjhe3kYrohbBkH4Bajs
         gc+DGYX8QfI4jPbVwpeMfnJXuDKfOJvjYKu06JI4=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1801160707350.2617@hadrien>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--mu9njEoJVcULXJK5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2018 at 07:10:23AM +0100, Julia Lawall wrote:
>=20
>=20
> On Mon, 15 Jan 2018, Frank Rowand wrote:
>=20
> > On 01/15/18 10:33, Julia Lawall wrote:
> > > The start of a line is column 0, at least according to emacs.
> >
> > According to vim, the first character of a line is column 1.  I don't k=
now
> > if it has a concept of column 0, to the left of that character.
> >
> > $ vim --version
> > VIM - Vi IMproved 7.4
> >
> > Let the editor wars begin.... :-)
> >
> > Personally, I use vim, but if the dtc column numbers match emac's world=
 view
> > instead of vim's, that is fine with me.
>=20
> At the start of a line, ie just after a \n, there has been no character.
> This change made the column numbers work for me in the annotations.
>=20
> There is also the issue of tabs.  David wanted tabs to count as 8
> characters, but actually cpp converts tabs to spaces.  So if a dts file
> has been through cpp, the numbers will be smaller.  So it could be better
> to consider tabs to be 1 character, to not have to think about what kind
> of include was used.

Urgh.. debating which editor to match sounds like it's going to be a
rathole.

Let's try a different approach: does gcc ever report column numbers?
If so, what's its interpretation?

>=20
> julia
>=20
> >
> > -Frank
> >
> > >
> > > Every character counts, so need to increment by 1 before adjusting fo=
r tab.
> > >
> > > Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> > > ---
> > >  srcpos.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/srcpos.c b/srcpos.c
> > > index 9d38459..e8fced9 100644
> > > --- a/srcpos.c
> > > +++ b/srcpos.c
> > > @@ -154,7 +154,7 @@ void srcfile_push(const char *fname)
> > >  	srcfile->prev =3D current_srcfile;
> > >
> > >  	srcfile->lineno =3D 1;
> > > -	srcfile->colno =3D 1;
> > > +	srcfile->colno =3D 0;
> > >
> > >  	current_srcfile =3D srcfile;
> > >  }
> > > @@ -223,8 +223,9 @@ void srcpos_update(struct srcpos *pos, const char=
 *text, int len)
> > >  	for (i =3D 0; i < len; i++)
> > >  		if (text[i] =3D=3D '\n') {
> > >  			current_srcfile->lineno++;
> > > -			current_srcfile->colno =3D 1;
> > > +			current_srcfile->colno =3D 0;
> > >  		} else if (text[i] =3D=3D '\t') {
> > > +			current_srcfile->colno++;
> > >  			current_srcfile->colno =3D
> > >  				ALIGN(current_srcfile->colno, TAB_SIZE);
> > >  		} else {
> > >
> >
> >

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mu9njEoJVcULXJK5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpgIOoACgkQbDjKyiDZ
s5IA6w//XZVhXHIpni3rZzeFynpCS6Fc8RqLGvKDfN8KPXMRtUymudxMOh7aUkM4
ivy9X5eX1wV/GgHZiUmDlkkCgbp8ZQ57XrosearCNxaCCR1TGd8DKP3ritkUNFhy
1/O7jqjMJGvCWx6Ua2TgGlJA5eDhRm0ulEEcVXtyGTZpu35OVNyuGBEk56CA2WAk
hdrlUo4373iFATS+rYVDrwsDD9SeY0iH9BdcvSlBMRQagI4GQzsw2lsu9iQHnvkC
Ftc8t02cPxEhV5wXmQXS7UtOtu4KgHKx15c52xxEPwpnwahoezF2XQSaJ9AHvqI0
wAOpses41iSkL9PlgWJnBvyGLfmfmgm1B01x3wWy/k1d9RkaPowEzqUOAZ4k7XkO
PZFKRQ008Z5pqqGcheekqNd4rC9+shpmYxDDdNvbzLSxouVetBaKn/gUA53Q+3Kv
q4e6EbxwoS3UAERMFUcgt4gzMkRGulTVVs4RAaWVh9tugz3aXDyTMbEbLjSYKjLf
JzwYA2c32DKBH6I6Kl/8pYjENkyGZUWJ3hO4ubLFC6T5KJTuoHUMSKCJN53hJjHI
FhKMxL8C/qqnXHa3iXzVpA35/T2X+si2TvUJ2cOikZTtUtg1HnLJ5ahA1fmR2MtI
CcEaKbtkyGCTFGig//V1qm7kZ7PWC8DxIaQ9/OamDYRxJuLK7Sc=
=x/aX
-----END PGP SIGNATURE-----

--mu9njEoJVcULXJK5--
