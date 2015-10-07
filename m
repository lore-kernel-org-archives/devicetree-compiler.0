From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v6 2/3] dtc: dts source location annotation
Date: Wed, 7 Oct 2015 16:27:19 +1100
Message-ID: <20151007052719.GR3861@voom.fritz.box>
References: <560F5D15.9060606@gmail.com>
 <560F5F20.30709@gmail.com>
 <20151006045607.GK3861@voom.fritz.box>
 <56137A6B.6080805@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OiITrshLgfui8fEl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56137A6B.6080805-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--OiITrshLgfui8fEl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2015 at 12:38:19AM -0700, Frank Rowand wrote:
> On 10/5/2015 9:56 PM, David Gibson wrote:
> > On Fri, Oct 02, 2015 at 09:52:48PM -0700, Frank Rowand wrote:
> >> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> >>
> >> Proof of concept patch.
> >>
> >> Annotates input source file and line number of nodes and properties
> >> as comments in output .dts file when --annotate flag is supplied.
>=20
> < snip >
>=20
> > The two branches here aren't quite consistent - the first doesn't
> > include the '/', the second does.  You could either change the second
> > to just &@3, or use &@$ for the first.
>=20
> < snip >
>=20
> > This one doesn't include the name/label again
>=20
> < snip>
>=20
> >=20
> > .. and this one does.
> >=20
> > Looking at all of these it's probably going to be simplest not to
> > include the label/name (i.e. just use the srcpos from the nodedef).
>=20
> This also shows how much I need to create a better "make check" test
> suite to exercise all of the relevant paths (as is on my todo list).
>=20
> I've been trying to capture the line that the name is on, since it
> might be different than the line that the "{" is on, but maybe I'm
> just trying too hard and should accept the simpler solution.  The
> result will be obvious to the person using the output.

Hm, yes I see your point, it probably is slightly better to include
the name.  I'm fine with that, as long as it's done consistently.

> I'll fix this all up after I get back from the conference.
>=20
> Thanks for checking the patch over at that level of detail!
>=20
> -frank

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OiITrshLgfui8fEl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWFK03AAoJEGw4ysog2bOSSM8P/23F03MOKnqb1KmRXzW/dMjT
pkvnSUuUyhawXSeXyFmOjpOrNzfodJ+7PaVktkdSuKEa7LForf6bQiZqxuhOqEde
fDJsorhlQtL+H3daiQycXA/3afspRWCxt2jUChkPR0ckIBntXn5Lk5xFAdyy4H90
0f67cvN9vHdVS2UBLD2NDPdiXHFhezUfWJ6wNjGphNE3cV0UMidr745K7XNgw7pS
lPwINjoINBMHGK2hvubiiqthZhj/QU/aFWRL9l5eTgWOXYRP60YgFAIpB1iza6dz
E1sTOC6jhtL2dL2W/vAjIKlpQMrrjN8g66fMG8rJTcbaokW/ifxfcpytrr6PKMGm
JEKJE4eGIrjq2kcP+c9hSXLhgYqIb508045Ef2IfEj63DaFpQsiKwSz+V3+5zt08
FuQ+E8ce5L2c6KHGz2B8Zf+qphFV6VXnPQtX+W8dwF/EAyLhlR2ZBFVW91QwdBX8
ka+wUe94XKvtH8MHrjgFBhe5yyq1lBOyKodOs+1LLS3rOr+fB/XqKpUAPcEz2BNJ
iNqdvpRQQbouZF7wLsrZkzh2AixIvFYJ3DkGfcbFf+X27A1OSBNA4qflzsfSf7UH
KABXGZ4T10dP1098oWXwayH0EqHxK/CiObHL+jZn7JnD2XMqak08M6vOhRnQZex6
JgJhVRgXAwLQFpzjnluM
=XYfQ
-----END PGP SIGNATURE-----

--OiITrshLgfui8fEl--
