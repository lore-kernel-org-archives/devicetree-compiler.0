Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E97441A
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 04:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="A5Z5YEtN"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED2F9E
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Oct 2023 21:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1696910661;
	bh=1yVtYjzt9BNC2HWU3H0tDroTPhF9iAKCMJaaDhgZNnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5Z5YEtNmhdE67PRo4qNRl8tfjtedNrWmM5LHbNlcN7oJAfeqqJgCJqRjR9kfd1wR
	 uFEtpC25S0M8S2+cD7HCQmUMH1Ufu5pKjuVzNH6ckNeCNWydAynuyMR8mtsuevClV1
	 qT4QZH1wy8FTviIDi5+Z9VKb5QQKE+50mtq7iCjw=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4S4MjK1xQtz4xQm; Tue, 10 Oct 2023 15:04:21 +1100 (AEDT)
Date: Tue, 10 Oct 2023 15:04:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: devicetree-compiler@vger.kernel.org,
	Mike McTernan <mikemcternan@google.com>,
	Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] libfdt: fdt_get_alias_namelen: Validate aliases
Message-ID: <ZSTNPUv+dxfnXBZ5@zatzit>
References: <20231007110710.i2oj24oirdtyt5m4@google.com>
 <ZSJWkT3Kr3u5JWdy@zatzit>
 <20231009140923.xxhi2cdkemqod7j7@google.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gt+TjM3NnDyHKqnM"
Content-Disposition: inline
In-Reply-To: <20231009140923.xxhi2cdkemqod7j7@google.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--Gt+TjM3NnDyHKqnM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 03:09:23PM +0100, Pierre-Cl=E9ment Tosi wrote:
> Hi David,
>=20
> On Sun, Oct 08, 2023 at 06:13:21PM +1100, David Gibson wrote:
> > On Sat, Oct 07, 2023 at 12:07:10PM +0100, Pierre-Cl=E9ment Tosi wrote:
> > > Ensure that the alias found is valid i.e.
> > >=20
> > >     An alias value is a device path and is encoded as a string.
> > >     The value represents the full path to a node, ...
> >=20
> > Where's that quote from?  That is typically the case, but I think that
>=20
> See the DT specification (v0.4, 3.3 /aliases node):
>=20
>     Each property of the /aliases node defines an alias.
>     The property name specifies the alias name.
>     The property value specifies the full path to a node in the devicetre=
e.
>     [...]
>     An alias value is a device path and is encoded as a string.
>     The value represents the full path to a node, [...]
>=20
> > at least back in the old OF days, aliases referring to other aliases
> > was allowed.  Even if it's not strictly correct in modern usage, I'd
> > prefer to allow that usage if it's not too difficult to accomplish.
>=20
> Compatibility with OF is great but checking that the result is a full pat=
h is
> key to preventing recursion.

Ah, that's a fair point.

> Otherwise any DT with "circular" aliases can cause
> the stack overflow I mention below. For example, calling

>     fdt_path_offset(fdt, "loop")
>=20
> on
>=20
>     /{
>         aliases {
>             loop =3D "loop";
>         };
>     };

Right.  I think I got thrown off by the unnecessarily specific
description of the loop occurring with an empty alias name, which as
you show above doesn't need to be part of the issue.

> (I've added this as a test case in v2)
>=20
> >=20
> > > This protects against a stack overflow (fdt_path_offset_namelen() cal=
ls
> > > fdt_get_alias_namelen() then fdt_path_offset(alias), ...) when /alias=
es
> > > has an empty property with an empty name.
> >=20
> > It would be helpful to spell out that bad situation a bit more
> > precisely.  AFAICT the way we discover an alias at the beginning of a
> > path, it would have to have at least one character, which means I'm
> > confused as to how something with an empty name gets in here.
>=20
> I've rephrased the recursion in a more concrete way in v2.
>=20
> AFAICT, nothing currently checks that the "alias has at least one charact=
er"

Well.. not explicitly.  And, yes, there are the cases of zero or
negative length path addressed by [1].  Apart from those cases,
however, we only enter the alias case if path[0] !=3D '/' and the alias
name is from the start of the path to the first '/' - therefore the
alias must have at least one character.

> and merging [1] will only cover the special "circular" alias of the empty=
 string
> being aliased to itself.
>=20
> [1]: https://lore.kernel.org/devicetree-compiler/20231006124839.z7auhc3mk=
37gxios@google.com/
>=20
> >=20
> > > Co-developed-by: Mike McTernan <mikemcternan@google.com>
> >=20
> > I've never seen a "Co-developed-by" tag before, I'd suggest just
> > putting that in the text.  However all developers of the patch should
> > sign off on it, so I'd expect an S-o-b from both people.
> >=20
>=20
> Okay, I now have a link to the original fix in the Android Open Source Pr=
oject.
>=20
> > > Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi@google.com>
> > > ---
> > >  libfdt/fdt_ro.c   | 11 ++++++++++-
> > >  tests/aliases.dts |  3 +++
> > >  tests/get_alias.c | 12 +++++++++++-
> > >  3 files changed, 24 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > index c4c520c..bda5c0d 100644
> > > --- a/libfdt/fdt_ro.c
> > > +++ b/libfdt/fdt_ro.c
> > > @@ -537,7 +537,16 @@ static const void *fdt_path_getprop_namelen(cons=
t void *fdt, const char *path,
> > >  const char *fdt_get_alias_namelen(const void *fdt,
> > >  				  const char *name, int namelen)
> > >  {
> > > -	return fdt_path_getprop_namelen(fdt, "/aliases", name, namelen, NUL=
L);
> > > +	int len;
> > > +	const char *alias;
> > > +
> > > +	alias =3D fdt_path_getprop_namelen(fdt, "/aliases", name, namelen, =
&len);
> > > +
> > > +	if (!can_assume(VALID_DTB) &&
> > > +	    !(len > 0 && alias && memchr(alias, '\0', len) && *alias =3D=3D=
 '/'))
> >=20
> > The first three conditions here look good to me.  You could even check
> > alias[len - 1] =3D=3D '\0' to avoid scanning the entire string - an ali=
as
> > should be one single string.
> >=20
> > I'd prefer not to enforce that the alias in an absolute path (the last
> > check), if we can avoid it, since, as above, I think historically
> > aliases to aliases has been an allowed thing.
>=20
> I've replaced the memchr() call in v2 but kept the absolute path check fo=
r the
> reason mentioned above.
>=20
> >=20
> > > +		return NULL;
> >=20
> > Pity we can't return a more specific error here.  Oh well.
>=20
> Want me to introduce fdt_find_alias{,_namelen}() wrapped as
>=20
>     const char *fdt_get_alias_namelen(...)
>     {
>         const char *alias;
>         int err =3D fdt_find_alias_namelen(fdt, name, namelen, &alias);
>         return err ? NULL : alias;
>     }
>=20
> ? :)
>=20
> This would allow callers to handle FDT_ERR_NOTFOUND differently from other
> (probably more serious) errors currently hidden behind a NULL return valu=
e and
> would allow our check to be reported as FDT_ERR_BADVALUE.

No.  It's a minor nit that we can't return an error, but I don't think
it's worth the conceptual complexity cost of adding an additional
entry point to allow for it.

> >=20
> > > +
> > > +	return alias;
> > >  }
> > > =20
> > >  const char *fdt_get_alias(const void *fdt, const char *name)
> > > diff --git a/tests/aliases.dts b/tests/aliases.dts
> > > index 853479a..8820974 100644
> > > --- a/tests/aliases.dts
> > > +++ b/tests/aliases.dts
> > > @@ -8,6 +8,9 @@
> > >  		s1 =3D &sub1;
> > >  		ss1 =3D &subsub1;
> > >  		sss1 =3D &subsubsub1;
> > > +		badpath =3D "wrong";
> > > +		badpathlong =3D "wrong/with/parts";
> >=20
> > As well as exercising the absolute path test, which I'd prefer to
> > avoid, there doesn't seem to me that these two cases exercise anything
> > much different from each other.
>=20
> Yes, the idea was that libfdt could get confused by the presence of separ=
ators
> and consider 'badpathlong' valid even if it isn't absolute, hopefully inc=
reasing
> coverage. I have instead merged these cases into a single "relative" test=
 case.
>=20
> >=20
> > > +		empty =3D "";
> >=20
> > This one's a good test.  It would be good to test a non-terminated
> > string too (e.g. nonull =3D [626164];
>=20
> Done; do you know of a way to express a property with an empty name in DT=
S? Or
> would covering that use-case require a handcrafted DTB?

I don't believe it's possible to express that in dts.  At one point I
was considering an "escaped" syntax to allow construction of node or
property names breaking the usual rules (largely for the purposes of
decompiling bad dtbs), but it doesn't look like I ever implemented it.

I'd also consider it a bug if dtc emitted a dtb with an empty node or
property name (other than the root node, which has an empty name by
convention).  Although it would be acceptable for that to be a "check"
rather than syntactic level check, which means we could still emit
such a thing with the -f option, or if the relevant check were
explicitly disabled.

> >=20
> >=20
> > >  	};
> > > =20
> > >  	sub1: subnode@1 {
> > > diff --git a/tests/get_alias.c b/tests/get_alias.c
> > > index fb2c38c..4f3f6fd 100644
> > > --- a/tests/get_alias.c
> > > +++ b/tests/get_alias.c
> > > @@ -21,9 +21,16 @@ static void check_alias(void *fdt, const char *pat=
h, const char *alias)
> > > =20
> > >  	aliaspath =3D fdt_get_alias(fdt, alias);
> > > =20
> > > -	if (path && !aliaspath)
> > > +	if (!path && !aliaspath)
> > > +		return;
> >=20
> > Not sure what this case is for - we never call this with both values
> > NULL, right?  If we did seems like we shouldn't silently ignore it.
>=20
> This returns early if fdt_get_alias() was expected to return NULL and did=
 so.
> Perhaps, are you confusing 'aliaspath' with 'alias'?

Oh, yes, sorry.  I was misreading it as (!path && !alias).

> >=20
> > > +	if (!aliaspath)
> > >  		FAIL("fdt_get_alias(%s) failed\n", alias);
> >=20
> > Isn't aliaspath =3D=3D NULL correct for some of these new test cases?
>=20
> Only if 'path' was NULL; see above.
>=20
> > You're failing unconditionally here.
> >=20
> > > +	if (!path)
> > > +		FAIL("fdt_get_alias(%s) returned %s instead of NULL",
> > > +		     alias, aliaspath);
> > > +
> > >  	if (strcmp(aliaspath, path) !=3D 0)
> > >  		FAIL("fdt_get_alias(%s) returned %s instead of %s\n",
> > >  		     alias, aliaspath, path);
> > > @@ -36,6 +43,9 @@ int main(int argc, char *argv[])
> > >  	test_init(argc, argv);
> > >  	fdt =3D load_blob_arg(argc, argv);
> > > =20
> > > +	check_alias(fdt, NULL, "badpath");
> > > +	check_alias(fdt, NULL, "badpathlong");
> > > +	check_alias(fdt, NULL, "empty");
> > >  	check_alias(fdt, "/subnode@1", "s1");
> > >  	check_alias(fdt, "/subnode@1/subsubnode", "ss1");
> > >  	check_alias(fdt, "/subnode@1/subsubnode/subsubsubnode", "sss1");
> >=20
>=20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Gt+TjM3NnDyHKqnM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUkzTYACgkQzQJF27ox
2GchxA/+IBRyM2buHDRHXOqPiUS3OStZkrlTeTPvQDJxahZzm4s++gdeZI3cAVVC
ultadOv6xSsPE8j1hGHWVNd852fZ5SdON7TPi/xRyOl9fKjy8/qfz6yCU+WW21IM
1ho4dqzzx0Yr8BwCWwfYlK9PsDW6l0lP7o8T2T9ek0dzSCSdqnS8dC7iTGjZbjcf
jQ7etN8b1YBT/QhLBOGgbGBkr++u4ZeROEHcglIjUPrW4WJ/I0Jmrd13BFABN6df
cFkJceiFyO9Xs8Gl53yFQmwpY5e+PceNtdQ0YqDZyBN2K725js/lgttPNxMQPjBF
X/n1Rub9XhvLRUUzLkRTheWAV1GMJJkgjqKeR2Z1PsOKmHu/KEgLyTmYxnMOe7pf
z7ztjGCfu4aUAWXP1ShixXhAmu+F1M33Bpj/oUdrQrhTzLIJqJe6r1kl0jTEXqWe
YyZmSMBQcvUuGAUuXuJ3TSiu557Xny2gwIf8Ga0UN1g2hrQA0zZok9wJNX83tVJT
ep3DyDCx21V9NeOY/duEml/hqxVOLKkJkXS0NJnecswH09O+CpuMwhDhE6ijDXD6
ZJ5uYvt6W8XvD03DwxeDXfY5qUxSeJr+4zYwNYXUwi3dmIoIT+CuX5yYM2poJ8KC
BRym6Kh8W2TKbq1/Pou0cPX9umDtNW/D9lJadudY44YxGCDzvYk=
=sLQF
-----END PGP SIGNATURE-----

--Gt+TjM3NnDyHKqnM--
