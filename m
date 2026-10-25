Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792895569;
	b=D64XB+Oxj8+HZ5clwxvSdClvP6bh+/psN9zl3D2I6gnBx0wo5S15x4ucf/F2XdhBHEOV
	 mv/bIUB+7JYT7BKxrpt5qhEHdqn10pxDHsMt5Xn/xtGZjvuVfROiF8OLlj97nvCkzgG+a
	 /nXcbaba3foEwe/2KFF5QHwg7PvsPl9n05WskQV/1jA6i9+JR4ABRyFHnxBAGWMK8tipE
	 hM2Hx5LC3UY6mA3nbzy9ilY/St5svaGZQtHyAb2KSrP2LxTE+24PFsoAxEDToVYOIm82W
	 V5NZSLUGffFFJL8zXFdwOC+j6Sg9E36+uLnYQawB5O7JuB56a4KFmnZpp6NO+nCR8Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792895569;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=uHgs6Tm7C66Qlctbe5wyn2x3N2vz9NhVDH/uP4NfMcE=;
	b=TfbLMM2Oh2tFL7VHv9Gt6DxpjrVN4RVhV46+YO6JiEtHeXQ5vYjrlWJL+JW9S03U1Ytx
	 /tw9EuMOYOR/oSG3hnZ09BtoLW8BVc3NHB6BroNwwUjJse6tC9VOTCcYbFiI0hcxr1cDl
	 xlqUOALItbwEgiCLMu06h/GoAgdGgLkItgcaRVhGmEQhcB/VzVvwZUOhlapQsT8q5F5Js
	 4xFgS4QbTZ4ap7CZfxnSuXCyRNV/v2y+e4YZOfNPAqFSyliXOK4wQ+7Tt7u2Ra4LECNK0
	 KSu/iymALMk0FE31QfKe12773uPpo3aWM7Jz5pYHfWnMC8q1uSfH7yFDvfQg0+e+Nig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Qm7sfx5X;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5BF606A31B;
	Sun, 25 Oct 2026 02:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B5BF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Qm7sfx5X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792895566;
	bh=uHgs6Tm7C66Qlctbe5wyn2x3N2vz9NhVDH/uP4NfMcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qm7sfx5X7L9rLa7n64h9jbSJeqQqxPdWiWocA4h4T8y6VL/5jKU8NRScIuOQE29+Z
	 eXZMw3b2Gf21gwXvMzAKY7LWTVenPuDdtjWhyoPaiKO+iYcCxIKxNhWLJR5pCtFX69
	 8D7L56zJgVikgNm+go/NY2ML3YVhAmK85xPRVLHqyLXH9hFLZzx9+jzJZKOxSYG+Wu
	 NjaVgqMmXqoOTFuwfe/vv40/67jf0Z/it9u3F/jtrOzaOSdwONM+9QOHiSMln0KCl8
	 dV7Yo1ujKPsh4kDoy1++yYF5S+3FnME6aX8lBQ3JoeiO0/hl9atCE5+ReL0fXgjegM
	 aY1cofI9rHMYQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jC14t0Nllz4wJS; Sun, 25 Oct 2026 13:32:46 +1100 (AEDT)
Date: Sun, 25 Oct 2026 13:32:41 +1100
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
Subject: Re: [PATCH v3 12/15] libfdt: Introduce fdt_getprop_offset_namelen()
Message-ID: <at1qO7oEdCyhX6k8@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-13-herve.codina@bootlin.com>
 <arDJmHPwgvwwmITG@gractus.seuss>
 <20260922182547.6cc7475c@bootlin.com>
 <20261023092559.7608ff25@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="XENMgbyF3t/NKs0Y"
Content-Disposition: inline
In-Reply-To: <20261023092559.7608ff25@bootlin.com>

--XENMgbyF3t/NKs0Y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 09:25:59AM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Tue, 22 Sep 2026 18:25:47 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
>=20
> > On Mon, 21 Sep 2026 16:07:21 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >=20
> > > On Wed, Aug 26, 2026 at 10:31:43AM +0200, Herve Codina wrote: =20
> > > > Future operations, such as handling unknown tags on dtb modificatio=
ns,
> > > > need to get an offset to a property based on the node offset and the
> > > > property name.
> > > >=20
> > > > Several function exists to get a property based on the node offset
> > > > and the property name but none of them allows to get the property
> > > > offset.
> > > >=20
> > > > Fill the lack and introduce fdt_getprop_offset_namelen() and its
> > > > simple variant fdt_getprop_offset().
> > > >=20
> > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>   =20
> > >=20
> > > This seems redundant with fdt_ptr_offset_(), which can trivially get
> > > this information when combined with fdt_get_property(). =20
> >=20
> > Indeed, It should be ok using both functions you pointed out.
> >=20
> > I will remove fdt_getprop_offset_namelen() introduced here and use dire=
ctly=20
> > functions mentionned in the next iteration without wrapping those calls=
 in
> > a new function.=20
>=20
> I've started to replace fdt_getprop_offset_namelen() by the combination
> of fdt_ptr_offset_() and fdt_get_property_namelen().
>=20
> As a reminder fdt_getprop_offset_namelen() I proposed was the following:
> --- 8< ---
> > +int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
> > +			       const char *name, int namelen)
> > +{
> > +	const struct fdt_property *prop;
> > +	int lenp, offset;
> > +
> > +	prop =3D fdt_get_property_namelen_(fdt, nodeoffset, name, namelen,
> > +					 &lenp, &offset);
> > +	if (!prop)
> > +		return lenp;
> > +	return offset;
> > +}
> --- 8< ---
>=20
> fdt_get_property_namelen_() was called.
>=20
> Switching to fdt_get_property_namelen() introduces a regression.
>=20
> fdt_get_property_namelen() calls fdt_get_property_namelen() and this func=
tion
> (without the '_' suffix) performs a check on fdt_version() returning an e=
rror
> on version < 16.
>=20
> Using it to replace my fdt_getprop_offset_namelen() function will break
> write-in-place setprop() for dtb version < 16. Indeed, it is used in [1]
>=20
> [1]: https://lore.kernel.org/devicetree-compiler/20260826083146.304291-15=
-herve.codina@bootlin.com/#Z31libfdt:fdt_wip.c
>=20
> Now, several options:
>=20
> a) No problem if we break dtb version < 16
>    Ok, I will use directly fdt_get_property_namelen() + fdt_ptr_offset_()=
 to
>    get an offset and remove my fdt_getprop_offset_namelen() wrapper.

So, practically speaking this is probably true.  Version before 16 are
truly ancient, and versions 1..3 were all before dtbs really caught
on.

> b) Keep my fdt_getprop_offset_namelen() function without any modification
>    We support version < 16, problem solved.

Still don't like it.

> c) Keep my fdt_getprop_offset_namelen() but static inline in libfdt_inter=
nal.h
>    Export fdt_get_property_namelen_() in libfdt_internal.h and use it in =
the
>    static inline fdt_getprop_offset_namelen().
>    This implies that fdt_get_property_namelen_() will be no more static a=
nd
>    usable internally out of fdt_ro.c but only the fdt_getprop_offset_name=
len()
>    wrapper should be used.

Eh.

> d) Use directly fdt_get_property_namelen_()
>    Export fdt_get_property_namelen_() in libfdt_internal.h and use it
>    directly to get the offset.
>    I don't really like this solution. I would prefer to have a wrapper to
>    explicitly return the offset instead of exposing and using directly
>    fdt_get_property_namelen_().

Hm, I think this is my preferred option.  libfdt_internal.h exists
precisely to "expose" things across modules internally, but without
exposing them to external users.  Maybe I'm missing something, I don't
really see why that's objectionable.

> On my side, I would prefer b) as it support version < 16 without the need
> to expose fdt_get_property_namelen_() out of fdt_ro.c.
>=20
> I would like to have your opinion on this point.
> Is also option b) ok on your side ?
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--XENMgbyF3t/NKs0Y
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrdajsACgkQzQJF27ox
2GckPRAApwUBVCrf4MP1zOaPXcDxtCZVe10c/lLhf/TDUvTNDCukEVieyg0lHNV+
rHgizSNqjsouULzjRw7VEHyRwwlwnU4npX+Kq0CQdBk3nk8vFeBMSBMl+XoQBiYJ
Kg0p8DzU49XVxGVJD75bIJTx23hc9pAlywL1aS0yMJycfd9cCh4NYLVXNRKxsVYW
h8+uZZPDHhkBaljFzTxY7zFpQ9W9l7bq/aeSQvLJSq1ql8RpQrIqKw42mxWvEX8d
VIl6vTxCTnO7YSW8f/5SA2OTQT7AXiBK1Br6pTj4J0Q6zDz0dVj11HdNWxGIpS5R
vzHCPOOeO78wNo5rjQciGPXNQsfH+odZQaGm0WuXgOTlfLB+8S8yLcJoWKNkiRo0
IGb6uMuCOelorSNvgjFTGZqMmM1dpQzd7vfqRirjUAg7msK5DW9gyOGcepLbgXbN
cvkF2dFUMre3Zudz9cID3ujU1ZlW2WNVlm7E5d3zYrifQVjzmRckGXBy5xLVyWu0
numzMIjtlep+Bq16ITeh1gEPQ6+yOM41wgh+DUPjZe3EVJOYPJLUImN9rkCO9Ehv
n3qUDUQa9mppKY5jpd+XS9rLhcQQvxWnBBJUH9ui7QoOFX0OLsdiGmj9LDHsT6wG
RXLhAmjfdEryCC0VBNh5PD/2MrqQIyhcoRlhgwCQBgNXjT+A0tI=
=ve+b
-----END PGP SIGNATURE-----

--XENMgbyF3t/NKs0Y--
