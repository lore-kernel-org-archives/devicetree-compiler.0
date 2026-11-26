Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661554;
	b=b7nCPOGphoqIRvb66+Fso+VbOw5hvnc1jnioRh5xzY2Zt3VGAwx8CGjJO0SW0dIsNZ4v
	 Vw7bAQVQ7JeAdEcKC133D6w+bYYCQO6KEMuKjWDpVhPWxHtO7GmShkSjdBJqlUdAsy/pd
	 U90I3/bMc+X9erGgt4e4AVWCt+KHXA38KBwh780Gy5Mo5SLXXPhpZHHtV8UxKtijTE0J0
	 e3Z6SkQpDXKkeJCjmv8RcdJs0LnnZPTcWVjqN+//0VPewjIX+wS7Lvx4duHfxlebU/ZSX
	 G3Jpwe7mvME6PLA7eE8uxJvRbu582rj9wDaGi54l/GDo3/jTAvwADBuJ/ouvPJc6eMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661554;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=y38aCOrdnSNqtkhQ3bYVQSQEytyK68gWZGtURBVFos0=;
	b=jVbYAHRBNAPjjl1ajteroHgTsN5qjQvfg0iTYWmGzCng9TisrShX7gpj6ZQFGuxMuNgf
	 WafQL7SNgB7s4D8dMCMZp2LyOojguun4Y/uSMkGxKp6JnWVbU0mcXoWyhPk9AQvaC++9v
	 YVTAIUV1xuRMav6FXRKn7I0ztofJVfmDVJKGNR+x+iGbzK3PjzgeYsWZGHr7FI6MRiQl9
	 J104wjeR0XuWomV3BAVcR8kO2XY6g7WJ7p0n3XNB5OTP6f3Il8e9oTeXoV2haSJyQAjWN
	 S9AW8LPZmDoZtO7tmOhOuPo1epSB0v6JJWt9Zzckyf9nMFN+xa/D2A1jclVvzqIsn+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=uYZ0Zi7F;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE16F606A31E;
	Thu, 26 Nov 2026 02:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE16F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=uYZ0Zi7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795661550;
	bh=y38aCOrdnSNqtkhQ3bYVQSQEytyK68gWZGtURBVFos0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYZ0Zi7FEmkQeLep0kpOnb4JflNvFIpset4nldd3CYPxgZjAg+a5XaesuOhw3MrLJ
	 GcmbMjp7/pqmDITvoMKhAR7UnpQwA65oIcX6O4Ii53+XsyXqADVlz8jiVycCTt3/MY
	 I8t1ZJqrMW0OYdYTwJAWhTLuE93QLiM/OYCpHKui1dVZOdiWvzTgDxKGmmv75duSSc
	 eOUV3S/kQXcL+c/pp1pZlL/nbSq8uXOv+EfNhBks/U2e6dYx48Wb2R7DADDGFSnrKw
	 b3GM2AGbhSloI8nJ6XmFZoeQ2A+j+M5euEBo1IsV+XSW9U3iw2ss8TJ461thUHOy0H
	 7LqVBxVsJRK3g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZh0t4q6vz4whd; Thu, 26 Nov 2026 13:52:30 +1100 (AEDT)
Date: Thu, 26 Nov 2026 13:52:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 35/74] checks: Get 'chosen' node using
 get_subnode()
Message-ID: <awee2VKhTF0bpPYa@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-36-herve.codina@bootlin.com>
 <awan_SrUGC7OEMIL@gractus.seuss>
 <20261125132129.4f4695ac@bootlin.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QAC8C0zioRHVFZzG"
Content-Disposition: inline
In-Reply-To: <20261125132129.4f4695ac@bootlin.com>

--QAC8C0zioRHVFZzG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 01:21:29PM +0100, Herve Codina wrote:
> hi David,
>=20
> On Wed, 25 Nov 2026 20:19:04 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Aug 26, 2026 at 11:49:04AM +0200, Herve Codina wrote:
> > > get_node_by_path() is going to be updated in order to handle orphan n=
ode
> > > support for addon device-tree.
> > >=20
> > > The 'chosen' node is a subnode of the root node and can perfectly be
> > > retrieved using get_subnode(). =20
> >=20
> > The change certainly shouldn't break anything, but I don't really
> > understand the rationale for it.  AIUI, get_node_by_path() should
> > still work, even if it's (trivially) more expensive.
>=20
> Removing the get_node_by_path() call here avoid a later modification when
> get_node_by_path() is changed.

Ok, "an upcoming change will be made simpler by avoiding
get_node_by_path()" is a reasonable thing to put into the commit message.

> The code can use get_subnode() here. I thought that using it was more rel=
evant
> here (getting the 'choosen' sub-node from the root node) than using the m=
ore
> generic get_node_by_path() function.
>=20
> Well, if you prefer the get_node_by_path() call here, no problem, I can
> revert this change.
>=20
> Best regards,
> Herv=E9
>=20
> >=20
> >=20
> > > In preparation of the future change related to get_node_by_path(),
> > > replace its usage to get the 'chosen' node by a call to get_subnode().
> > >=20
> > > The modification doesn't introduce any functional changes.
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > >  checks.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >=20
> > > diff --git a/checks.c b/checks.c
> > > index 13e8b121..1332acc4 100644
> > > --- a/checks.c
> > > +++ b/checks.c
> > > @@ -1349,8 +1349,7 @@ static void check_obsolete_chosen_interrupt_con=
troller(struct check *c,
> > >  	if (node !=3D dt)
> > >  		return;
> > > =20
> > > -
> > > -	chosen =3D get_node_by_path(dt, "/chosen");
> > > +	chosen =3D get_subnode(dt, "chosen");
> > >  	if (!chosen)
> > >  		return;
> > > =20
> > > --=20
> > > 2.55.0
> > >=20
> > >  =20
> >=20
>=20
>=20
>=20
> --=20
> Herv=E9 Codina, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--QAC8C0zioRHVFZzG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsHntkACgkQzQJF27ox
2Gck4g/+JGpvHqRANIaQXFgTvlykIGciPaCaDaNoHHZriUjywNtZ+ynQkcPNOBFQ
ko2Iftt7UxqLaMePQoS8R5gNN2YQ3jUV8yLVTVtyohw+7Z8Mt9JjYGo0rYC3PgGj
UI810GUV4sSBxO+KWkkqedLjLfPUC37jWQVSIf5HNX0uZq32R2j9azh5532ffzuk
hKmgOb/U+Ys3ZF0/GOCVl50bAfVRKtoYJAhzij0Xa7oQ98u/+Sp9vLypTwPhl+Tp
rIHDu8PFtBumPTTex2goMHa5Smp/qVDRwjKOm9GnU99sisQKkSYXdaoJsgwhFiTJ
+TGw5GQFFcB1pDCOQ5Aqxpl6MZmz+3fKFbngz4KAXxtPO/RNVn4N+KRM2PdyNnGR
/dapZxxS/J7Tnrl6A1DRkhECLPz3bmppGDYZaTqNs18y8MXf7lOvm1/I1UE7g0U+
rgLJX0E8K9EuIMYg8vKqYweN/YkboxLD/kBoke5Xyh4EUj1Psd22FLpwLUmDo27a
ZYkqLCf5BIS/f789bLODtFJU9WTYdcXBYDteC0COuaGEXaE/w97RNibq1RERzG6a
VQy9wINBDgJmGGiYarC1BMFaHyhAlYX9vOTbK6bLMu4mNXRlfwDvMddnjeXsBHNk
b4xyfChSIjahzFpJLNmnVHtosIAJdOvd4qWfo/utvdN4PQF+Y5M=
=oMiV
-----END PGP SIGNATURE-----

--QAC8C0zioRHVFZzG--
