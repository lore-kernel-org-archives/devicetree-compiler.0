From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Properly handle \0 delimited string lists
Date: Fri, 13 Jun 2014 20:16:35 +1000
Message-ID: <20140613101635.GA5335@voom.fritz.box>
References: <1402430256-8359-1-git-send-email-jack@codezen.org>
 <20140611131039.GA29130@voom>
 <20140612224728.GA17938@toadite.austin.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140612224728.GA17938-O8SCTCEbm15XsEFxtoW7CMxtgHpCUUYS@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2014 at 05:47:28PM -0500, Jack Miller wrote:
> On Wed, Jun 11, 2014 at 11:10:39PM +1000, David Gibson wrote:
> > Hi Jack,
> >=20
> > Long time no see :).
>=20
> Yeah, I was pretty pleased to have an excuse to send something your way =
=3D)
>=20
> >=20
> > On Tue, Jun 10, 2014 at 02:57:36PM -0500, Jack Miller wrote:
> > > reserved-names=3D"res1\0res2\0res3";
> > >=20
> > > Is valid DTS. This one-liner expands data based on the len given by t=
he lexer
> > > instead of strlen.
> > >=20
> > > Without this patch, realloc gets confused and hangs. For example:
> > >=20
> > > *** Error in `./dtc': realloc(): invalid next size: 0x0000000001961670
> > > ***
> >=20
> > So.. the patch certainly isn't wrong, and is arguably safer than the
> > current version.
> >=20
> > But.. I haven't been able to reproduce the problem, and I don't really
> > see how it would occur in the first place.
> >=20
> > The thing we're taking a strlen of is the input with it's escapes, so
> > it won't have NULs, just backslashes and 0 digits.
> >=20
> > Or am I missing something?
>=20
> Sorry, I was unclear. The \0 was my short hand for a real embedded NULL
> character, which may be intentionally wrong-headed, but I don't think it's
> invalid (or if it is invalid, should at least not cause the compiler to do
> bad things).

Ah, I see.

Yes, NULs in the input is a bit perverse, but I don't see any reason
it should be invalid.

> In refining my testcase I realized that it doesn't fail on realloc with a=
ll
> bad input, but it does generate mangled output otherwise.
>=20
> I've uploaded two short .dts snippets just because pasting NULLs into an
> email seems like a bad idea:
>=20
> http://codezen.org/static/broken-dts.tar.gz
>=20
> One causes the realloc, the other causes the mangled output on git HEAD. =
Both
> are working properly with my patch.

Ok.  Could you make those into a testcase?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTms+DAAoJEGw4ysog2bOSRHcP/RqNZesoRdO6piEepYmLZE+l
QVvoWs9hTZIR6GhiA1LRxqKe36t8T6JLR0DzAwg1XHU/oJ87DooHtiucNTh08aWc
51vcI4BHxTz+NYY7zSMckHS4j15WpAsc7C0/a22frHRxJ/QfG2Q3yjRw+mUPnguu
1UHIOxzFhwEl1lKBOViy1w+RmHAxtgVekOn+oYJcDA7gbUOnApxY0O2ou8WeOwfz
YAD/2Rg9rUkU/FQ3A01D8DYtOmasuYaoNU3hPaEm51E5aQQ2X1Xb5fbQ+/u7nfAE
C6DVU/9O0NcIdq3JtjZi93Kw6l9lCP4HFtclLcBOOOghlS4qWYgoFpQIlBQb7Uo+
zEt5+jK7yL6juQPcKbyCuGYAvJd7fCk0u7YWYp1h8zcsB0XjgAKAdUxP+uCV/cA9
uYRlCHCcC+ALnzriYtC+EvF5uU9dbzqKjkStBu+q/ofNei0YJM+W6sJ/gV+qBPdC
UUx45EM949VYT3PWWzp+vyQI0L/58GelZIFF6yNG4uHvPQnTMWZjcp3dCWiwPu0C
QtaOs0jQmMyRSIaYQok//vTmiA9cdArXFpzwtz3b+4GWVzzdnaBjuATcAPcRU+cj
7QJbxrgovav31nvFA/BSr1YHH8m2OthIOCb0PfsMg2H+h6sps375yLVar/g7AJs7
o7hzuu+ptlM/T5fD5LXa
=otXe
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
