From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] convert-dtsv0-lexer.l: fix memory leak
Date: Sun, 24 Jul 2016 00:51:21 +1000
Message-ID: <20160723145121.GC24621@voom.fritz.box>
References: <1468362950-32027-1-git-send-email-jcd@tribudubois.net>
 <20160713020446.GC14615@voom.fritz.box>
 <5785D973.7090108@tribudubois.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1469286648;
	bh=fxUFw5FXlIN9hPnjhef89SNSCBNAWPFyMl7KKZIC1DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhcrBbrJOYfn5c68once2BPo46pNF5ZvRgZ8+1FRNnW8j6gTBQN3bWlAztavVyRSS
	 NgvInxnhVSVMtFAQS+3eVMRXnkqkfIuJTD/XRXCB0mMHftjcqEK8glgXAgCWwqVpNY
	 t3vS79NbhD21S0WycMF0Icn9J5mFFpZ4uploc7w4=
Content-Disposition: inline
In-Reply-To: <5785D973.7090108-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jean-Christophe DUBOIS <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org


--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 08:02:27AM +0200, Jean-Christophe DUBOIS wrote:
> Le 13/07/2016 04:04, David Gibson a =E9crit :
> > On Wed, Jul 13, 2016 at 12:35:50AM +0200, Jean-Christophe Dubois wrote:
> > > CID 132822 (#1 of 1): Resource leak (RESOURCE_LEAK)
> > > 9. leaked_storage: Variable newname going out of scope leaks the stor=
age it points to
> > >=20
> > > Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
> > > ---
> > >   convert-dtsv0-lexer.l | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/convert-dtsv0-lexer.l b/convert-dtsv0-lexer.l
> > > index 259e527..8d8289b 100644
> > > --- a/convert-dtsv0-lexer.l
> > > +++ b/convert-dtsv0-lexer.l
> > > @@ -208,6 +208,12 @@ static void convert_file(const char *fname)
> > >   	char *newname;
> > >   	newname =3D xmalloc(len + sizeof(suffix));
> > > +
> > > +	if (!newname) {
> > > +		die("failed to allocate memory for input file %s: %s\n",
> > > +		    fname, strerror(errno));
> > > +	}
> > > +
> > This hunk is unnecessary.  xmalloc() already die()s rather than failing.
> OK.
>=20
> On a correctness point of view there is still the "free" to be done (see
> below).

Yes.  That was a suggestion to respin.  Never mind now though, I've
removed the unnecessary hunk and applied.

> >=20
> > >   	memcpy(newname, fname, len);
> > >   	memcpy(newname + len, suffix, sizeof(suffix));
> > > @@ -223,6 +229,8 @@ static void convert_file(const char *fname)
> > >   	while(yylex())
> > >   		;
> > > +
> > > +	free(newname);
> > >   }
> > >   int main(int argc, char *argv[])
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXk4RpAAoJEGw4ysog2bOSP7oQAMjaTkP+5AjQobZ1FvoU+A68
qnIablDjg12PL/+3ahYCFjqoO+BcCGyDkedrJkL0y/+dz7DqpjYf16RQWaLh9tCp
2z9ClO/uiZv0ZWslceE3Ggo06bWk6CDows+vHqNaA1H7wvSaxR+gULSsPRq4sVoS
txmWfVeTBiZKLsL9fJl7mgou1CIZ5OaS0A1459pRqNhVuMLQRdEZYkkANVscDac5
ezrPgIeEbzrry1G6R7NChoRuZwirnbUjh9XWdN82RB3rqYD3p6nguby0SXLwUqU1
ABOgRtH7Dcd8Ni0RfmKZ2Ns8dSMsP67EYcRoWCRoTjSn1tQZDABUotnzpovhFZSi
6VrAm0jJOy1F2Nrpu6azZi/BXCbbNJeTV4GeMTXmVQgMhNOZBna18c5kRfm63jNR
uoZKoVlkPQSqWrcoZ8/Cj5TGqXVoExoZmTABToKRgGIBOHzEZLmzE3aakSBkQj10
mAB/qgV3Juvc4hKK7ZWUqCjZo4cJPcirZiA1WarNYAERXt2ffqlGRlQ9mHtFwARU
//R/dNoQ1VEhzj/CtwMQ9mSB/QbC8sSrWWE5J1L8f/lOgg9qcZPGE53F0ICa5ICW
SrAasKnazl9XwDMG3opZkBXGNiSWyPiCTs8xdzlpJX28f8qK4fZimlLISaghuyI2
aHPeEZDLJ8dezoKrveEY
=QdHR
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
