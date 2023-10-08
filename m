Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37F2188
	for <devicetree-compiler@vger.kernel.org>; Sun,  8 Oct 2023 02:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="mikJZ+Df"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719CFBA
	for <devicetree-compiler@vger.kernel.org>; Sat,  7 Oct 2023 19:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1696732461;
	bh=hkbw85wjHl0zFKwf4e9ScxlFt3dfZ1zOGn9U8bkeZME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mikJZ+DfcWh/p7dTWUoT/7DaDJW90OfHUs3F8/UC2MzZA8L+4ueI5NwrFyXLEBTft
	 St3YAIrBmojFasqy3EBAOSai511lZz55ZzGYna4Gnnmr1KO7cryqqRilDd+zXYVRRf
	 MBXoFoxhV2aeyuBLPOSHPLjuJXauQywzOjF6vBVk=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4S35pP0nMQz4xM0; Sun,  8 Oct 2023 13:34:21 +1100 (AEDT)
Date: Sun, 8 Oct 2023 13:32:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: fdt_path_offset_namelen: Reject empty path
Message-ID: <ZSIU0HoOl72tPlqP@zatzit>
References: <20231006124839.z7auhc3mk37gxios@google.com>
 <CAPnjgZ0UfANCRmy2X5iptz0jZHu8Wfda4geJX4Ntzma2VVcWPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AmqmXlxaa2NTYkab"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0UfANCRmy2X5iptz0jZHu8Wfda4geJX4Ntzma2VVcWPg@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--AmqmXlxaa2NTYkab
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2023 at 07:22:14AM -0600, Simon Glass wrote:
> Hi Pierre-Cl=E9ment,
>=20
> On Fri, 6 Oct 2023 at 06:48, Pierre-Cl=E9ment Tosi <ptosi@google.com> wro=
te:
> >
> > Make empty paths result in FDT_ERR_BADPATH.
> >
> > Per the specification (v0.4-rc4):
> >
> > > The convention for specifying a device path is:
> > >     /node-name-1/node-name-2/node-name-N
> > >
> > > The path to the root node is /.
> > >
> > > A unit address may be omitted if the full path to the
> > > node is unambiguous.
> >
> > Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi@google.com>
> > ---
> >  libfdt/fdt_ro.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index c4c520c..46b4ef5 100644
> > --- a/libfdt/fdt_ro.c
> > +++ b/libfdt/fdt_ro.c
> > @@ -255,6 +255,9 @@ int fdt_path_offset_namelen(const void *fdt, const =
char *path, int namelen)
> >
> >         FDT_RO_PROBE(fdt);
> >
> > +       if (namelen < 1)
> > +               return -FDT_ERR_BADPATH;
> > +
>=20
> This would be end =3D=3D path, right? Would it be better to check that?

Not particularly, AFAICT.

> Are you worried about negative numbers?

If they're not, they probably should be..

>=20
> >         /* see if we have an alias */
> >         if (*path !=3D '/') {
> >                 const char *q =3D memchr(path, '/', end - p);
> >
> >
> >
>=20
> Regards,
> Simon
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AmqmXlxaa2NTYkab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUiFMkACgkQzQJF27ox
2GfN4w/9H7JlWDkzxFpQHmeqVhU201nwej+LZ49IVXgOdVz2eqjSa8VCJDshx3wJ
js2Znzfok6yumJ4UcMxwUc1ipn3QlWQycdtluzXVuc7C/Zm63LNXHoKhMS7hbXNW
LYW9n144iXiMnnHz1gMObyh1fS8qbYrqwtlyenboewvRr8gH0Zvynzh6gQDjH/YB
QncBfKchWMLqHICUdzZgkTX5wTlW8i+Ysu0LX91dNzZuYnxwnxp82oyElYwVx2/v
R9KwRvAa4cBrU3lI7l55Z5src8lxKqZVNhhSzkpImh2KtQCfMRggEGjnfgkzMNus
Z6HhjJFbW5mThODj6CCst6qUpXZpgVu/QSSbmpmCX6gTiUx5IS/MRcAG48iYRR9/
GU++4kKcXE6whUBF08VE+gwWBonkswBqGsm1yJKQioubUHsn+n/djBztrzF3VeQu
chlcPxyOSQV+lcck02yupPOb3EgNy/YobvdHGEmj9RbXbw4czz0BnlXInY6HoicY
jd2VSeyTFv+UFOGEfJCh5/CUjl+I0plhSQaJT4UO7dIoJrocTn287rCC+eO7ti6x
u0TyYCB1lpsPhS14PqK1HDRZVNcRK3Mn1ENAcG6NVJjroewE9FLjJ3BWr41ybYGC
rHkZ1YCEx6zdK2JfJwmRDkJHFzmfyruDIVJGGJ1/eD06YyeP6Hk=
=I4JI
-----END PGP SIGNATURE-----

--AmqmXlxaa2NTYkab--
