Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644786BFA0
	for <devicetree-compiler@vger.kernel.org>; Thu, 14 Mar 2024 09:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710407182; cv=none; b=iu66qXYfeeLnnMrCed341TF4p5NpoCvr8s+KIj0qxaNxm6AuQKTLc5ceoiw4rgcNf67SJho4tsxVXmZ1rndwdOCQR1pPYQW+OrcsaSCB4tmHI3bF+9nOtwze5YlHwoMwyBGTehOghulAlICzsWLOxHuQw2u2X7kyukJanJNSUlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710407182; c=relaxed/simple;
	bh=UWQUUhE7jjDMqLbeCcn9xCBTcqQ0Tdvq7DfJQg1Qw+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXBOw6FW974VYmmQmJWPunov3W1A1fWzBrcvXau+5UNfSVb3CoLKhitWcTJ7M5bp8z0f61EY0LHXUZaCpxemYrvAvIpKS6apWLs9hO3JNm3WB/Uaxy3E9sjwr5DLee/r3rMM3KGgtbHUF0N7vmcozmcclbu1OXK+wc4JYSN3nj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rkh2N-00046b-Kv; Thu, 14 Mar 2024 10:06:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rkh2M-006HZn-RF; Thu, 14 Mar 2024 10:06:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rkh2M-005x14-2T;
	Thu, 14 Mar 2024 10:06:06 +0100
Date: Thu, 14 Mar 2024 10:06:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Yves-Alexis Perez <corsac@debian.org>, 
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v3] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <bioyelwyl444zzgosee3avihxlqypybkyzpnuxmfv5d4wjbph4@fhbfyjap64dq>
References: <20240225175422.156393-2-u.kleine-koenig@pengutronix.de>
 <ZdwncYaatDrRBkKU@zatzit>
 <mpmdkpzzfpw6vrgvpd3e324zouwd4u3oxq7rpmc2sktxjtojj7@gauowuw3mug5>
 <ZfKAYQ7sNYLpJOps@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cu6frbu5kk4xp4pv"
Content-Disposition: inline
In-Reply-To: <ZfKAYQ7sNYLpJOps@zatzit>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-compiler@vger.kernel.org


--cu6frbu5kk4xp4pv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello David,

On Thu, Mar 14, 2024 at 03:43:13PM +1100, David Gibson wrote:
> On Sun, Mar 10, 2024 at 09:30:31AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Mon, Feb 26, 2024 at 04:53:53PM +1100, David Gibson wrote:
> > > On Sun, Feb 25, 2024 at 06:54:23PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > A phandle in an overlay is not supposed to overwrite a phandle that
> > > > already exists in the base dtb as this breaks references to the
> > > > respective node in the base.
> > > >=20
> > > > So add another iteration over the fdto that checks for such overwri=
tes
> > > > and fixes the fdto phandle's value to match the fdt's.
> > > >=20
> > > > A test is added that checks that newly added phandles and existing
> > > > phandles work as expected.
> > > >=20
> > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > ---
> > > > Hello,
> > > >=20
> > > > here comes the next iteration of the patch that fixes overlay
> > > > application to not overwrite existing phandles.
> > > >=20
> > > > It is rebased to current main branch. The changes since v2 are:
> > > >=20
> > > >  - Add documentation
> > > >  - Apply the simplification from 24f60011fd43 ("libfdt: Simplify
> > > >    adjustment of values for local fixups") in the functions added h=
ere.
> > > >  - Rename functions using shorter and better names
> > > >  - Changed the test device trees to yield a hole in the phandle spa=
ce
> > > >  - Checked each phandle value not being overwritten separately
> > > >=20
> > > > Note I didn't switch the order of overlay_prevent_phandle_overwrite=
() and
> > > > overlay_fixup_phandles() because the overlay's phandles must be res=
olved
> > > > before I can do the recursion needed in
> > > > overlay_prevent_phandle_overwrite().
> > >=20
> > > I'm not following what you mean here.  IIUC, conflicts of the sort
> > > you're handling can only arise when the overlay describes a phandle
> > > for the target node of the reference - and therefore that target is in
> > > the overlay.  In that case all references to it in the overlay should
> > > be encoded in __local_fixups__ rather than __fixups__.  __fixups__, in
> > > contrast describes references to nodes that aren't in the overlay, and
> > > so can't be filled in - even with a tentative value - until the
> > > overlay is applied.
> > >=20
> > > So, I'm not seeing how fixing these conflicts depends on resolution of
> > > those "external" fixups, rather than just the "local" fixups.  Am I
> > > missing something?
> >=20
> > yupp, look at the overlay dts I added in tests/. It has
> >=20
> > 	&node_a {
> > 		value =3D <32>;
> > 	};
> >=20
> > which is translated to:
> >=20
> > 	fragment@1 {
> > 	    target =3D <0xffffffff>;
> > 	    __overlay__ {
> > 	        value =3D <0x00000020>;
> > 	    };
> > 	};
> > 	...
> > 	__fixups__ {
> > 	    node_a =3D ..., "/fragment@1:target:0"
> > 	};
> >=20
> > Before I can recurse over fragment@1 and the matching base dtb node to
> > check for phandle conflicts, I need /fragment@1:target resolved;
> > otherwise I don't know where to look in the base dtb.
> >=20
> > So if I switch the order, fdtoverlay reports
> >=20
> > 	Failed to apply 'overlay_overlay_phandle.test.dtb': FDT_ERR_BADPHANDLE
> >=20
> > in make check.
>=20
> Ah, right.  It's specifically that we need to resolve the fragment
> targets (including via external symbols) before we can resolve this.
> Do you have a test case for this specific problem?  If not, I'd be
> worried, that I or someone else might forget the subtletey and try to
> re-order at some point in the future.

The test I added fails if you swap the two operations. That's how I
noticed.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cu6frbu5kk4xp4pv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXyvf0ACgkQj4D7WH0S
/k4bfwf+It9izHWK70EZi+/NLT36mOyeM3HPBgcKEW8N0V0TQs1Cpl9nes4LajgJ
cjWEoWgRAFlvYOy1GTH/jn3UzdqPyAWoHfQLWys3PLcAtk2pluheRvvNqcWoJ4hN
gLElhrLvDgPvZ07uu+fxDwmvMvd8aDUGwB38kdt4LhtOJDUmc/br6lehc9q7lekL
5NQLvsLkZB+i6XpAoqYqperHgsEFKxt8AUbI4XrxNouvbtDaVwQZTU7VTr0p5LZh
TM4SKcG4WUzufbjqGWmkFCNHB1Tt9Z1gUjMZI9B3dyQsIzlLxck4nwAlzwmbAYW9
n9XW7JQOGjM10IQmhrUQxcQqsxYX5g==
=+Vl6
-----END PGP SIGNATURE-----

--cu6frbu5kk4xp4pv--
