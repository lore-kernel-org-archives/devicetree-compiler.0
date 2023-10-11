Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FE839A
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Oct 2023 00:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ls59liYu"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5100F98
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 17:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1696984679;
	bh=lIdTNyl0snc55NpBvMH6/NWBnUH9zDaYDFSni8/s5DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ls59liYu5psflItYi/HaCvJsApW/EbOVm1JNPdfe7xD7HU+UtKsIj5Twz6GHcz/nc
	 fXd7h6TcuDl1bvVrFNtf60rbd4CHavudg4ANOHhqt3jnqMcEIcYo6q6jgXugZ5idxX
	 Vcias9EKOW+wabo6B+k2EPhpgaGw6qWrI03d+1m8=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4S4v4l4MBfz4xWS; Wed, 11 Oct 2023 11:37:59 +1100 (AEDT)
Date: Wed, 11 Oct 2023 11:36:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Mike McTernan <mikemcternan@google.com>
Cc: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>,
	devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] libfdt: fdt_get_alias_namelen: Validate aliases
Message-ID: <ZSXuAC/oRhHAKPDl@zatzit>
References: <20231007110710.i2oj24oirdtyt5m4@google.com>
 <CA+QomtZPEAOC0AFgoDx93AoKe-mUgBW4GM3CyxVaEpp1p1pjfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7D9H4UskG6vpoKAL"
Content-Disposition: inline
In-Reply-To: <CA+QomtZPEAOC0AFgoDx93AoKe-mUgBW4GM3CyxVaEpp1p1pjfQ@mail.gmail.com>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--7D9H4UskG6vpoKAL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 03:18:04PM +0100, Mike McTernan wrote:
> On Sat, 7 Oct 2023 at 12:07, Pierre-Cl=E9ment Tosi <ptosi@google.com> wro=
te:
> >
> > Ensure that the alias found is valid i.e.
> >
> >     An alias value is a device path and is encoded as a string.
> >     The value represents the full path to a node, ...
> >
> > This protects against a stack overflow (fdt_path_offset_namelen() calls
> > fdt_get_alias_namelen() then fdt_path_offset(alias), ...) when /aliases
> > has an empty property with an empty name.
> >
> > Co-developed-by: Mike McTernan <mikemcternan@google.com>
> > Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi@google.com>
>=20
> Acked-by: Mike McTernan <mikemcternan@google.com>

Thanks, I've added this to the patch on merge.

>=20
> > ---
> >  libfdt/fdt_ro.c   | 11 ++++++++++-
> >  tests/aliases.dts |  3 +++
> >  tests/get_alias.c | 12 +++++++++++-
> >  3 files changed, 24 insertions(+), 2 deletions(-)
> >
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index c4c520c..bda5c0d 100644
> > --- a/libfdt/fdt_ro.c
> > +++ b/libfdt/fdt_ro.c
> > @@ -537,7 +537,16 @@ static const void *fdt_path_getprop_namelen(const =
void *fdt, const char *path,
> >  const char *fdt_get_alias_namelen(const void *fdt,
> >                                   const char *name, int namelen)
> >  {
> > -       return fdt_path_getprop_namelen(fdt, "/aliases", name, namelen,=
 NULL);
> > +       int len;
> > +       const char *alias;
> > +
> > +       alias =3D fdt_path_getprop_namelen(fdt, "/aliases", name, namel=
en, &len);
> > +
> > +       if (!can_assume(VALID_DTB) &&
> > +           !(len > 0 && alias && memchr(alias, '\0', len) && *alias =
=3D=3D '/'))
> > +               return NULL;
> > +
> > +       return alias;
> >  }
> >
> >  const char *fdt_get_alias(const void *fdt, const char *name)
> > diff --git a/tests/aliases.dts b/tests/aliases.dts
> > index 853479a..8820974 100644
> > --- a/tests/aliases.dts
> > +++ b/tests/aliases.dts
> > @@ -8,6 +8,9 @@
> >                 s1 =3D &sub1;
> >                 ss1 =3D &subsub1;
> >                 sss1 =3D &subsubsub1;
> > +               badpath =3D "wrong";
> > +               badpathlong =3D "wrong/with/parts";
> > +               empty =3D "";
> >         };
> >
> >         sub1: subnode@1 {
> > diff --git a/tests/get_alias.c b/tests/get_alias.c
> > index fb2c38c..4f3f6fd 100644
> > --- a/tests/get_alias.c
> > +++ b/tests/get_alias.c
> > @@ -21,9 +21,16 @@ static void check_alias(void *fdt, const char *path,=
 const char *alias)
> >
> >         aliaspath =3D fdt_get_alias(fdt, alias);
> >
> > -       if (path && !aliaspath)
> > +       if (!path && !aliaspath)
> > +               return;
> > +
> > +       if (!aliaspath)
> >                 FAIL("fdt_get_alias(%s) failed\n", alias);
> >
> > +       if (!path)
> > +               FAIL("fdt_get_alias(%s) returned %s instead of NULL",
> > +                    alias, aliaspath);
> > +
> >         if (strcmp(aliaspath, path) !=3D 0)
> >                 FAIL("fdt_get_alias(%s) returned %s instead of %s\n",
> >                      alias, aliaspath, path);
> > @@ -36,6 +43,9 @@ int main(int argc, char *argv[])
> >         test_init(argc, argv);
> >         fdt =3D load_blob_arg(argc, argv);
> >
> > +       check_alias(fdt, NULL, "badpath");
> > +       check_alias(fdt, NULL, "badpathlong");
> > +       check_alias(fdt, NULL, "empty");
> >         check_alias(fdt, "/subnode@1", "s1");
> >         check_alias(fdt, "/subnode@1/subsubnode", "ss1");
> >         check_alias(fdt, "/subnode@1/subsubnode/subsubsubnode", "sss1");
> >
> >
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7D9H4UskG6vpoKAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUl7foACgkQzQJF27ox
2GeAcBAAnoFlelZ/nBsmywsiltAYvmfHbyUdQXhJ/rziFnFPGPWhlUDLnsVjqDm9
TCGQY3hvmyd9hA5Qubw+WeFGE4oJnIa61nUUDyAzEfUHKCkDDaWp8FdBk+02GtId
6zM1xGeuAam0EANw2F9m45rUR65cABoBltp4TbnzcdTOBJ4tLgz6niC6Y5Fjjhvr
7chkYz/hzPx8xdqWTice9JOqZDi/LF+9hVDhNSJsh+K/YH6L4Y1+KeS2N4GXQ4vt
rmYzhCXoNeoe6+1rM4a/n1O9Cv4Ji9ZT30J9F4qhKSGiyE7iyJFwSefR+WtFMd8P
2pa00IvC2eRTrEaX/BXGsFxdSrmtOlfohHc2K44eK+OXkaBEsoIzEdtV6MKhD7s1
tEOR7/QR5/Q0fnVntDzM/Kuu314DiSpxUUno0XqKfwEmn78HbZEmchD2gO7ePUds
06wJrD0WVQQCqC8rTlUl9ZKIfyvL4P4uqcZn3CpSsAk22hR3E/DYQhZhUV6zK47G
1rt0OUjgaMAlkqFtn/F8d/ZFGiQPzx/Dvv3myw2k2CGVvJI0PeJRTrK1OGP4NI8l
ZAAqrzU3qzUIyJVmUbPpjyREFMUZtNYXLVeM0nw0NZoC2J++YdLVbotTzN0sgGY0
nAXh2C6w++zG5f7AXUMEmPCJac1PEA3QO4E5QjjcikYkS6djZBs=
=msDm
-----END PGP SIGNATURE-----

--7D9H4UskG6vpoKAL--
