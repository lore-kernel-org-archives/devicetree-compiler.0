Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7B23D8E
	for <devicetree-compiler@vger.kernel.org>; Sun, 10 Mar 2024 08:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710059448; cv=none; b=kphnQ0FrmMoanlJKNhttdgz3wNCN3H9Bbh7rSv4GQRXJEw/QrsIa+oVZMgGfu6VK7xrVo7XK/WE3JVGSUrNiYJHT01fHIgDHdEXXh2Hy7HR8yH6ta9y3s0GZyhSSxzfyHIQKlB64p3paHGy2wJ/G85x77EN6GAGS8+uZWa8wLio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710059448; c=relaxed/simple;
	bh=CMwBU4BfQpzL8NGCI/zmJpbwH6RCaPNMzOpam5NR2Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdt99f9NkcjgkU6fqvIXMCPi17AmDXW5ivHpXoHgH9OZDgNfw0UszlPtY9we32Bz6LKDEQDwCtpAQyFCqV8mCNO0Q6GoR9cBtBL12i9ClOAya6lWK/F9AoaudRSnOE3KqLeXSOb+mONtUbcXbS7x8JK5whopEVl/YsI1d6hXTMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjEZk-0006Jw-QI; Sun, 10 Mar 2024 09:30:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjEZj-005U04-75; Sun, 10 Mar 2024 09:30:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjEZj-003KvF-0Q;
	Sun, 10 Mar 2024 09:30:31 +0100
Date: Sun, 10 Mar 2024 09:30:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Yves-Alexis Perez <corsac@debian.org>, 
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v3] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <mpmdkpzzfpw6vrgvpd3e324zouwd4u3oxq7rpmc2sktxjtojj7@gauowuw3mug5>
References: <20240225175422.156393-2-u.kleine-koenig@pengutronix.de>
 <ZdwncYaatDrRBkKU@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vqdletwqx442rjjp"
Content-Disposition: inline
In-Reply-To: <ZdwncYaatDrRBkKU@zatzit>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-compiler@vger.kernel.org


--vqdletwqx442rjjp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello David,

On Mon, Feb 26, 2024 at 04:53:53PM +1100, David Gibson wrote:
> On Sun, Feb 25, 2024 at 06:54:23PM +0100, Uwe Kleine-K=F6nig wrote:
> > A phandle in an overlay is not supposed to overwrite a phandle that
> > already exists in the base dtb as this breaks references to the
> > respective node in the base.
> >=20
> > So add another iteration over the fdto that checks for such overwrites
> > and fixes the fdto phandle's value to match the fdt's.
> >=20
> > A test is added that checks that newly added phandles and existing
> > phandles work as expected.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >=20
> > here comes the next iteration of the patch that fixes overlay
> > application to not overwrite existing phandles.
> >=20
> > It is rebased to current main branch. The changes since v2 are:
> >=20
> >  - Add documentation
> >  - Apply the simplification from 24f60011fd43 ("libfdt: Simplify
> >    adjustment of values for local fixups") in the functions added here.
> >  - Rename functions using shorter and better names
> >  - Changed the test device trees to yield a hole in the phandle space
> >  - Checked each phandle value not being overwritten separately
> >=20
> > Note I didn't switch the order of overlay_prevent_phandle_overwrite() a=
nd
> > overlay_fixup_phandles() because the overlay's phandles must be resolved
> > before I can do the recursion needed in
> > overlay_prevent_phandle_overwrite().
>=20
> I'm not following what you mean here.  IIUC, conflicts of the sort
> you're handling can only arise when the overlay describes a phandle
> for the target node of the reference - and therefore that target is in
> the overlay.  In that case all references to it in the overlay should
> be encoded in __local_fixups__ rather than __fixups__.  __fixups__, in
> contrast describes references to nodes that aren't in the overlay, and
> so can't be filled in - even with a tentative value - until the
> overlay is applied.
>=20
> So, I'm not seeing how fixing these conflicts depends on resolution of
> those "external" fixups, rather than just the "local" fixups.  Am I
> missing something?

yupp, look at the overlay dts I added in tests/. It has

	&node_a {
		value =3D <32>;
	};

which is translated to:

	fragment@1 {
	    target =3D <0xffffffff>;
	    __overlay__ {
	        value =3D <0x00000020>;
	    };
	};
	...
	__fixups__ {
	    node_a =3D ..., "/fragment@1:target:0"
	};

Before I can recurse over fragment@1 and the matching base dtb node to
check for phandle conflicts, I need /fragment@1:target resolved;
otherwise I don't know where to look in the base dtb.

So if I switch the order, fdtoverlay reports

	Failed to apply 'overlay_overlay_phandle.test.dtb': FDT_ERR_BADPHANDLE

in make check.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vqdletwqx442rjjp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXtb6YACgkQj4D7WH0S
/k4FZwf+IGonwE3AeyIWxRsNloOsUaUfX+Fllksuktte8p8a/dx0LxvSmRfY4cSr
ciW6qRIf3bbR0wbiEBo8ZrZ4evUGIpTlGUeaq3deF4jDnf5r6YWLHPsmGgOhGDMD
7h+kUKerHrMf7zCkJlMkr1Uc6lEJCo0ibHNol6l/Gvcyh1ZHCv0yW7l3+8Lq6Fx6
kS3kWMjxwPrzlDM7gN38V9w6dGAj9aA/K+tSTpBYaSgsZ6kY+fmvTobdmUhI7w1J
PJo1a87g7eChH5CJXoNOVeY6PDpS5f67jhkXZ+r5cfJUQH5+mkw8uy1uU1fhLKPZ
hTRRzfFkvukWSm1jCPJWsX1WeDBG5Q==
=946r
-----END PGP SIGNATURE-----

--vqdletwqx442rjjp--
