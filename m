Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16181197A8F
	for <devicetree-compiler@vger.kernel.org>; Thu, 19 Dec 2024 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734581274; cv=none; b=ihHlbUuxc/WWpYgDOU+WMQKRMWscAQrwC+BRVDHCbtvV6BUS+M7/x9Yrl2NLJVVJClfYdX6PlZtcl/7yzQSvvio24Nm4GpNwY/fQPVpwGQ8XrIxZNkBJ6qFdDAR22u519SvN5I88hqGi+qc0y4Hf/JhF0xCdnGwGrpoHL4Txw9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734581274; c=relaxed/simple;
	bh=DnnbTMmsYu3L100u+ConoQFQ9AE/ZfCcUnSWFZoVdFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHQnG4kB672vFY5NTZXpGSMO/o1e/6ujzyWSPLEsAWDKK16ZClxcNpwUtk94N8xtaMGydX3HAIWnXLysww4v2Wa3ZPqtMo5KmNsBgri+SHCkiMrgAln6cT9UHVbOdooHxMMNo9SPqMjpHurtMj0JHJifzeVoGd3fYK0L282Fu9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=X+GzkSPu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="X+GzkSPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202412; t=1734581263;
	bh=AlEN0PyG3wkalbBijOwUL7sa4srEfwLN8nrwXtoQNSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+GzkSPuXIJcm72Fh+GmWWlyeinI0PvuQGmfOhCVk3pwRGoWEaCuPrMDKO3CfetnU
	 xZO0/WPkgAvll3CnXZnMvb1w8FVmD+fE7eodi62f+DLwg+8WdkaMdjC6DAJadErHNP
	 awJ2iR/VGtLa1H/Hl8ISCsFbILsaXWBT1zR6AnjR0YqsjnUCy6SBt5JtXdBz8QYBwD
	 qshJtWTgMvJ1u0dZBX0rvlUPMaZ85utMFwDx7u/Lm4vUVsVh54FHcv/HJXW4smcluy
	 AtYZGq/Zcwl5a/iK+zHTQJ1lh/TujeoYmP5/6D+oV0fh0xt3QvgVi5jxtio5ERX6DU
	 6VZtVUGUnLAUA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4YDH7z01Z6z4wcy; Thu, 19 Dec 2024 15:07:42 +1100 (AEDT)
Date: Thu, 19 Dec 2024 15:07:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: Brad Griffis <bgriffis@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Warn about missing #address-cells for interrupt
 parents
Message-ID: <Z2OcEEz0IAPnQIf3@zatzit>
References: <20241213141438.3616902-1-thierry.reding@gmail.com>
 <59988586-f518-47ec-ae08-6b98b52b6f4c@nvidia.com>
 <CAL_JsqKRVNVHAd=U2GXv3VaCGguZbk6ZgCY0h-eMo_pvJxU+kQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oMUWxz4/PX8vhuOF"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKRVNVHAd=U2GXv3VaCGguZbk6ZgCY0h-eMo_pvJxU+kQ@mail.gmail.com>


--oMUWxz4/PX8vhuOF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 09:50:27AM -0600, Rob Herring wrote:
> On Tue, Dec 17, 2024 at 8:01=E2=80=AFPM Brad Griffis <bgriffis@nvidia.com=
> wrote:
> >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > The device tree specification (v0.4) suggests that #address-cells is
> > > mandatory for interrupt parent nodes. If this property is missing, Li=
nux
> > > will default to the value of 0.
> >
> > Just to clarify, this relates to interrupt-map specifically.
>=20
> Yes. That is the only case that really cares and needs it. We used to
> warn on all interrupt-controller nodes if #address-cells was missing.
> But that turns out to be way too many cases to fix, so we dropped that
> part.
>=20
> > In that
> > scenario the device tree spec requires that both the child node and
> > parent node specify #address-cells and #interrupt-cells. It further
> > specifies if a unit address component is not needed then it must be
> > explicitly defined as zero. In other words, this does not seem to be
> > just a suggestion, but more of a firm requirement.
>=20
> unit-address being 0 and #address-cells being 0 are 2 different
> things.

It's poorly phrased, but I think that was meaning to say that if the
unit address is not needed then #address-cells must be explicitlyzero,
which makes sense.

> > > A number of device tree files rely on Linux' fallback and don't speci=
fy
> > > an explicit #address-cells as suggested by the specification. This can
> > > cause issues when these device trees are passed to software with a mo=
re
> > > pedantic interpretation of the DT spec.
> >
> > The device tree spec also says that in the case where #address-cells is
> > not specified that a value of 2 should be assumed. So in this context, I
> > find the kernel's current practice of assuming #address-cells =3D <0> a=
lso
> > violates the spec.
>=20
> Relying on defaults is not good practice and deprecated for longer
> than we've had DT support on Arm. The default for the kernel on PPC is
> 1 which doesn't agree with dtc nor OpenFirmware. The kernel walking up
> all parents to find #address-cells/#size-cells is not behavior defined
> in any spec either.

Yes, although I believe that behaviour is *very* old, and copied from
/ made to work with old Apple Open Firmwares.

> 6.13 now warns if parent nodes or defaults are used, but not in the
> case of interrupt parsing.
>=20
> > > Add a warning when this case is detected so that device tree files can
> > > be fixed.
> >
> > I think a warning is reasonable, but perhaps we should consider making
> > it an outright error. Though given the number of impacted device trees,
> > perhaps that needs to be done in a couple of steps.
>=20
> I'm more inclined to change the spec if needed. We only need
> #address-cells if we have interrupt-map, so that's all we should
> check.
>=20
> If a given binding wants to be stricter, we can do that in its schema.
>=20
> Rob
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--oMUWxz4/PX8vhuOF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdjnA8ACgkQzQJF27ox
2GfT5hAAm7PiY2BLd0oXoIZV4Dghhjslb37m/Y343uY4iL8LAWKyFp8xTkMfkZRL
YRu0t+QF7tr/MPBcsf9N2bevqCuVqK9G0/ygNz4NKLzUXitAOZCmqTWi/VhzaN6T
ghq4ImycRWJdo0ij32TyoPYlDHV5sMJbZ0lrnsHh9DCyw9H6Fz7F9OiyM1z2LDtq
uUu7zw23aTDW/IWuBbCbROl4p3XLniQ18U412QxGYwp4ry3pUKRpKTFVmn8erNv/
BugW9cxJNKFmvaS5GmzsT8wDVPDlNIYoK0rUAqDhZ6jaqFOzSFUyuigyRVl/sV7D
N/UAchWaJI/R25k5SMaj6EE2CW0j+GV65OG57/QSO5cy85SeSavctGKJCh7qq71v
hftQr1xzJEGorKnEPuYCqYpnvyTfTqce7Vznt8hmcZBuid+cGtqwaZ1Q6gg/naB4
8oHvfzkrkhRrqehZ2+Kux+H8R18FRY+5dJvmjYAAnRXpsTxU2G6JttzJKw5yhOTZ
WuFo6oEjQZ5IBBDfXun07GC6+cbpy9nMYqdURm+SskfaTxBmAYGNkenFa3agyA/t
MnbMJv8HwOGcUjvoXDxmOlEZLKXi/wNsuv1WokeSKuMmXXtEusW3kLMX3cicU/gs
cnVNpbnSLVzMO4yVsbbk9oxl6F6BKqv2nZ4HqPFQMJY0OVykTwU=
=hDWW
-----END PGP SIGNATURE-----

--oMUWxz4/PX8vhuOF--
