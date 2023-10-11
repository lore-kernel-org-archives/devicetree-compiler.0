Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE4379
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Oct 2023 00:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="GL6b7zTf"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C0F8F
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 17:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1696984679;
	bh=HTGMFzftgBO2CxULfg2qNkFd9yU6DFtvc+W90JjVCX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GL6b7zTfWW2zJGkd+hK9humoj+JyU3le7Wpo6OrloeaXQupla6yR/YlzbszpH8zdj
	 71LlchYS+F6Gujb4wj4eeVqX0q6KV7EnnloTSpX49YXDvtEglNQ9EI0xd396dEaJlG
	 FMNMKWPTmmRBLHUUKkpYEylsKhqQ88gJGf2R0+60=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4S4v4l45dlz4xWV; Wed, 11 Oct 2023 11:37:59 +1100 (AEDT)
Date: Wed, 11 Oct 2023 11:33:06 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: devicetree-compiler@vger.kernel.org,
	Mike McTernan <mikemcternan@google.com>,
	Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2] libfdt: fdt_get_alias_namelen: Validate aliases
Message-ID: <ZSXtQhlDN29ziHF9@zatzit>
References: <20231009142004.m4af5c2utpzoll2e@google.com>
 <ZSTZc6exEXIaVf3X@zatzit>
 <20231010092643.z6okcdpvoj35gs2t@google.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FIqNke9V2uwqQOPp"
Content-Disposition: inline
In-Reply-To: <20231010092643.z6okcdpvoj35gs2t@google.com>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--FIqNke9V2uwqQOPp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 10:26:43AM +0100, Pierre-Cl=E9ment Tosi wrote:
> On Tue, Oct 10, 2023 at 03:56:19PM +1100, David Gibson wrote:
> > On Mon, Oct 09, 2023 at 03:20:04PM +0100, Pierre-Cl=E9ment Tosi wrote:
> > > Ensure that the alias found matches the device tree specification v0.=
4:
> > >=20
> > >     Each property of the /aliases node defines an alias. The property
> > >     name specifies the alias name. The property value specifies the f=
ull
> > >     path to a node in the devicetree.
> > >=20
> > > This protects against a stack overflow caused by
> > >=20
> > >     fdt_path_offset_namelen(fdt, path, namelen)
> > >=20
> > > calling (if 'path' contains no '/')
> >=20
> > Uh.. this still seems confusing, or at least misleadingly specific.
> > Having a self-referential alias doesn't really have anything to do
> > with whether the path has any '/' or not.
>=20
> Because, even if fdt_path_offset() is called with a path containing one o=
r more
> '/', the recursion will result in a fdt_path_offset() call with a path th=
at
> doesn't have one, right?

Well, not necessarily, but you can get a loop even without that.  Most
trivially with:
	aliases {
		loop =3D "loop/some/path/or/other"
	};

As long as the first call to fdt_path_offset() has a '/' in it, so
will every subsequent one, but you'll still get infinite recursion
trying to resolve 'loop'.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FIqNke9V2uwqQOPp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUl7TkACgkQzQJF27ox
2GfqbA/+LqV6m0sjE6QHwJhZ8/DogOBC99aHCL36NxbaAX6pcVmikV+ZuSXB0KYk
aPSBgg6A/GRZEpqtBV0S++mriGRKZqUFECQsMwjU287PgPLdqc+dgMd1l0Veouqh
uR18BIVebC77CHYlh1RPjaPm5+3+QgIFua6XkxBZ/polTdqBPMrA6k+dQ3XK/lF1
6Zn8sQoc+EWBDCq/MpIQw4XUKH7sE/0zsmoKt6tnJhH7AXi4HOFM08nTHtZOO3nH
U3z6CiJbyPCzH5HsAbY+ReCd3sZItcWLQazpWGoOyoTwdSp/wvFhUOf6lQjEVrTH
IMnw8bnUhIuoMPLwABdlGeBVl6vLexdCY4A1K92Ch4k8Zm/bH+DfeaZZkAHZ278g
4KRV2BR2BZohMXBh5v3qfmIH1cAHor+SqZiFWzL1P4incEfsN5SOdifiU2Ux0HE4
YuGtUyGuXh6+1Ra4w1S2W4k5QsZCJcyjEJ3/1l0giBPmHS2yxroliYJWVDq39SKg
LsupGO9aCJ2g3X/enmhxzGU0NbnnnqjOk/wILMYRDC5Kqn3VYl67S1VQtmGgrCoi
cXZlC6WrOC19rPX8wQxllIEQFMoQRj3u8DaC7WQ7HQXRjsfc5doq7ISZTB0Z1cGz
gg7wffwnI/LMW2Gp4vozKvNhJFnrmXObF/VQSWbH8+MjszOaEp8=
=GUwN
-----END PGP SIGNATURE-----

--FIqNke9V2uwqQOPp--
