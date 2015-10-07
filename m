From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v6 2/3] dtc: dts source location annotation
Date: Wed, 7 Oct 2015 16:32:46 +1100
Message-ID: <20151007053246.GS3861@voom.fritz.box>
References: <560F5D15.9060606@gmail.com>
 <560F5F20.30709@gmail.com>
 <20151006045607.GK3861@voom.fritz.box>
 <56137C1E.8060005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WVXkb2QE2eH0aWe4"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56137C1E.8060005-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--WVXkb2QE2eH0aWe4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2015 at 12:45:34AM -0700, Frank Rowand wrote:
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
>=20
> >> Index: b/srcpos.c
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> --- a/srcpos.c
> >> +++ b/srcpos.c
> >> @@ -246,6 +246,41 @@ srcpos_copy(struct srcpos *pos)
> >>  	return pos_new;
> >>  }
> >> =20
> >> +struct srcpos *
> >> +srcpos_copy_all(struct srcpos *pos)
> >> +{
> >> +	struct srcpos *pos_new;
> >> +	struct srcfile_state *srcfile_state;
> >> +
> >> +	if (!pos)
> >> +		return NULL;
> >> +
> >> +	pos_new =3D srcpos_copy(pos);
> >> +
> >> +	if (pos_new) {
> >> +		/* allocate without free */
> >> +		srcfile_state =3D xmalloc(sizeof(struct srcfile_state));
> >> +		memcpy(srcfile_state, pos->file, sizeof(struct srcfile_state));
> >> +
> >> +		pos_new->file =3D srcfile_state;
> >> +	}
> >> +
> >> +	return pos_new;
> >> +}
> >=20
> > You still don't need this function.  srcfile_states have unlimited
> > lifetime.
>=20
> My observation about this is buried in a late reply to v5, so
> copying here:
>=20
>    If I don't allocate a new copy of pos->file, then the file names are
>    incorrect.  I'm not sure why.  I can dig into this deeper to try to
>    understand what is going on if you want me to.
>=20
> It sounds like I do need to debug this.

That's weird.  Yeah, we need to debug this.

Btw, I was thinking about the filenames - in particular the way the
current draft will give you very unwield full paths.  I was thinking
about a different approach which should shorten those without
requiring different invocation or hand hacking:
   * For the "base" dts file (the one passed on the command line),
     always use just the basename (i.e. final piece of the file path)
   * For all other files, print the relative path from the directory
     of the base file

/include/ directives already open files relative to the directory of
the file including the /include/ so we have some of the mechanisms for
this already.

I think this will require a moderate amount of extra work, so I
wouldn't suggest it for the first cut, but does it sound like a good
approach in principle to you?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WVXkb2QE2eH0aWe4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWFK5+AAoJEGw4ysog2bOSyaQP/1pT+HK0K3hn9lyFIVMD95a+
g5PvCfAnVVy1K2z2D+QSzcVerKHfNAqwlNIPk4rTxFhDNeKgvLn4IGyTmOcay4Zo
tUX6gXQB4Q6U2DFtAVatnyy9uwNV8f4vUzZ0Swq9qoUzxGLvAVvEmb5QliYDz5Vu
2JvvE6kKCYKvr9OWk4AO4yM3X8G+D6veLeqQYVe2rDAXzwB79OgLS4UMNyKdM9Yf
ffm4Cq3Yp+lXw27Lz58z9NmxaV22OByRTjyuMPWHo+sbOxn6S8ruT+miM0GVwhhW
Na21v1K4OAaMPpmXrifPcivNwgOCPs23umVIEOkTLa4i2f6zyZhLfKyje+RHpFut
NDCMNPlU7bGW2N+tlr9Ldz46JpML9Ig1bb+GxCRl14RIQUtCBH62d1sYXjwTKYKN
LE8ZlqA/xc2qw+luMywkWKoZBdOgaHvvlyIC/17d/KljmfMdFAtvG6jMXxaTMiQw
CJW6pETirSX/gluXPDvxi6XUOUNrRBy5in1MP8qJDeJYUYrsufAPEREoCKVJuVvf
GKgjN80PDh3MK/137LHLqLf5zIiKShXBETUUTPL/eKtItU67b9mcCFgxSg+8vXuj
Ggvpg0NF8w8/B80EVMj4nEfT/wDYTLjbvKxh7hhvXrQ7i9P31wFZcRVGMklG2VB0
XXldTTlJYPgB6x9p0DrA
=R+mq
-----END PGP SIGNATURE-----

--WVXkb2QE2eH0aWe4--
