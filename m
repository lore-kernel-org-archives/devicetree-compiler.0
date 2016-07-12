From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] DTC: Fix unprotected file name member access.
Date: Wed, 13 Jul 2016 00:45:52 +1000
Message-ID: <20160712144552.GF16355@voom.fritz.box>
References: <1468189028-1641-1-git-send-email-jcd@tribudubois.net>
 <20160711013053.GC16355@voom.fritz.box>
 <57833B0E.8040508@tribudubois.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Jch8HTrQBXCJArxs"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1468334739;
	bh=qF7C0ZGekGqjIeip2czU7FyYBacwckFKVDb/dMicm1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YaqdHlNcR6XteaoY2GJptXfai9QDzDpUMb0c/kYZzTTSSFGTfbbVEseccWOjtoI1U
	 aeXXhlarEzL7RosrRFCSDWfM1XjY1UfS2l0nWlc4Pyhht2uuBckDFovrzIatiC9ISq
	 Mlj1tWdvV6pNlCEFbuTkvQ+t5C/IC+Rn6LB9Qn1c=
Content-Disposition: inline
In-Reply-To: <57833B0E.8040508-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jean-Christophe DUBOIS <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org


--Jch8HTrQBXCJArxs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 08:22:06AM +0200, Jean-Christophe DUBOIS wrote:
> Hello David,
>=20
> Le 11/07/2016 03:30, David Gibson a =E9crit :
> > On Mon, Jul 11, 2016 at 12:17:08AM +0200, Jean-Christophe Dubois wrote:
> > > Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
> > A patch like this really needs a commit message describing when the
> > situation it's guarding against can occur.  In this case when can
> > pos->file be non-NULL, but pos->file->name =3D=3D NULL.
> I stumbled on these issues while running some code checkers on previous
> versions of the DTC compiler.
>=20
> In general it's seems like a good idea for a function to protect itself
> against bad use.

Not necessarily.  Such checks can mask the effects of a bug elsewhere,
meaning you get subtler and worse (or at least harder to debug)
problems down the track.

If you must check, use an assert() rather than silently carrying on as
if the arguments were valid.  I detest silently hiding error
conditions or bugs.

> I have not looked at  the DTC source tree to check if such
> bad use could happen at present (and I don't know about future) but I do
> feel safer with these kinds of checks in place.

I absolutely do not like putting checks for the sake of them without
understanding the context in which they could (or could not) occur.

> > It's not exactly high priority, since srcpos_dump() has no current
> > users AFAICT.
> srcpos_dump() doesn't seem to be used for now but the forced cast of the
> "file" member as a (char *) is a bit disturbing in the source code. The
> first user might be surprised of the output.

Well, no, we shold just get rid of it, since there are no current or
intending users.  <...> I've now done that.

> srcpos_string() seems to be used mainly in error case (srcpos_verror,
> srcpos_error, ...) which might be considered as unimportant (?) but still=
, I
> feel safer with the check (a more meaningful output?).

There's a huge difference between used in error cases and not used at all.

> Now it is certainly not high priority (everything is working OK in the
> normal case) but it is cheap to fix.
>=20
> Regards
>=20
> JC
>=20
> >=20
> > > ---
> > >   srcpos.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/srcpos.c b/srcpos.c
> > > index af7fb3c..927ac54 100644
> > > --- a/srcpos.c
> > > +++ b/srcpos.c
> > > @@ -252,7 +252,7 @@ void
> > >   srcpos_dump(struct srcpos *pos)
> > >   {
> > >   	printf("file        : \"%s\"\n",
> > > -	       pos->file ? (char *) pos->file : "<no file>");
> > > +	       (pos->file && pos->file->name) ? pos->file->name : "<no file=
>");
> > >   	printf("first_line  : %d\n", pos->first_line);
> > >   	printf("first_column: %d\n", pos->first_column);
> > >   	printf("last_line   : %d\n", pos->last_line);
> > > @@ -267,7 +267,7 @@ srcpos_string(struct srcpos *pos)
> > >   	const char *fname =3D "<no-file>";
> > >   	char *pos_str;
> > > -	if (pos)
> > > +	if (pos->file && pos->file->name)
> > >   		fname =3D pos->file->name;
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Jch8HTrQBXCJArxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhQKgAAoJEGw4ysog2bOSs+AQAKHq97cZxwRdZ7JTAT01S1vu
aUehF8Hivy/stRo4+1S4yHhudG61x4qV/ylznBnG1fuq3RxVHBWVC8sacz+88ijc
weFs4w2YpEqIZ/mt/rI01vRk0An8T/4R5bUsIAC+ObnZhrfvb/1ollFZWsUuAbCV
rASlMW8t6n3K4GPAGyqh8KR3eQSedzVY6VSU0SCzb8JZThb//s2PEbEJLiQVbfu4
ba10hx5tigOHHaUhPBPAlxU5bV8qHou0Y3+zxZa589g30krkTz81J/h3XfOvlWH5
j0IFOpLcsQJPc2LjiSHaPTSyebICFIUfpMSnpGxC+IBAOuoE0XWpOP917vk/0Fcy
1JtsKLl8V0rCUPGgeLMJArU8YlbuL/y1/31q/QNA/8Ls1G3P4ZQyRO7TMU1WwPWA
qXb275a4zUZbRIJ0Xf2MLpi2+WvCoB7cIueHQP81BLbBvQ1WDXy5Jdwi4SxzgZye
UGefM/wKw1iiTnAxuCS0xxh4LZG6ryougM++eOqzRMs3LHMZqfEBN6ThdVb0AOvW
5rMv9a4jkmirJMoiUMuzJDi6A1ogUa8ZGCAVDc5dzBTfLNADFkhbby4xhthzfFHV
Lj9A4vgpooyAwvkMPgVMRtRGIsdd5F++p/DWl8NvniEvHLpKTcjkaEQGhzYcij6p
UbOjlFb9UW/Ulvp7ec/c
=8UkL
-----END PGP SIGNATURE-----

--Jch8HTrQBXCJArxs--
