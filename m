Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540406;
	b=SVQWSudPMHKYBqmSlAT8eZepuNriYOfGqqH/kDIMURS1wHVcgXOifntgm2sgGUjzIDJN
	 kHv8O9iGBWuryR51J6VB0/yPZTcbKtgaNIrUtIJ/1WTFum1FjP+cH4t3tmL9UIL8lKSUk
	 EOtlYQnKgbbHB2aprntmDgA7UUXD1Vf6UdRqcwS/DRMoBo1vWQ0gNdZWbWg+l4ub50vLp
	 n8gSHGBK4o17+FAtiw2q+sYHQq58n9vttYXBM0tr5s+XGSocKXIHz86SRMrM8N+7inJyO
	 92/eMkj99kZWdh4oEmPyosoJQQbgqIkLb2Qvu8aUCdmr2K81qRQzkByO09Gi/H9pV6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540406;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=0rd52q5aA6YVY8BTP6pBl/2Q3VL5JP4UbnPWvO7dQN4=;
	b=Dv24jrSdOBaLUqpZJRChB75Mw7bDqIuu5rSxOnPLAA5Kp62oxQFGiFrwtU9VPu1Mo91q
	 Y9APndLT8kwz5Rh+wXXF6dBW/Uv0g2Spb+5Dhj6R0X5XTiF6wMQsZPkJ4mP38SXHZQWsv
	 +ntHGwX9FIGCxx5Gcsh18T81iweu8r6yCHHS+vm49qpsgXvLpktzFMGP0emIaNfV7XPwu
	 8DzZWdXui21zE2qOrFIhGLCXtmIShuR+24MNy8yUcG+gbQRTyvXbqcI/0sXgtvvC01fBp
	 vrVInHrcsjcDsHe3eWIG81uCr5amB4FYng/k3o7iMhvc78wwdsRi3dd/UQlY8vcqafg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=IwD7dnnH;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A510606A32D;
	Fri, 13 Nov 2026 03:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A510606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=IwD7dnnH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794540403;
	bh=0rd52q5aA6YVY8BTP6pBl/2Q3VL5JP4UbnPWvO7dQN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IwD7dnnHOF8RDnwpL7rhh7WF/he7Tr5PGDjl1k1iesa37VD9+lNDVnDI8S5Hk2APt
	 DEPfg45N6qxHjZqx9mie1oCeha6UIR5EbU671B8bZnp7PlXO7L5tbP0GRaDR7k+90h
	 0ZWHIGIs9zahN5ylfPwQQoyBVmU3Q14neY2QVmjswa+FT5I93zPx1IO+/YdBmfVvin
	 aphdSOFYBTb401tet4LBEBTn1KvZmqlWFhKRZXmLRGfCXXugRUG+VQO3LwHSCOnka/
	 mePCj/kWRXYDFtkWfYbKLIRW+8MG/ZHV08ctQAiJHxLIxcYMeKns2o7NVeurgb6FvS
	 lCv+e9py/3CbQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQjNM3BVNz4wSw; Fri, 13 Nov 2026 14:26:43 +1100 (AEDT)
Date: Fri, 13 Nov 2026 14:26:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Doug Anderson <dianders@chromium.org>
Cc: Simon Glass <sjg@chromium.org>, Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree
 representation
Message-ID: <avaDbTmhq1NuTKJr@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org>
 <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
 <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
 <avPZeSgU8ABix34f@gractus.seuss>
 <CAFLszTiUYv2rx2OzvLR6UyO-uoya0WthPsr+oohQtCa+_itZsw@mail.gmail.com>
 <avUZ-uqxLAu2ICyJ@gractus.seuss>
 <CAD=FV=WAAk7ddDM3Uq8fRVYF4fCEDnufDbCiVgHfH2cwLqrT7g@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="GddDciS6Gew0rjnV"
Content-Disposition: inline
In-Reply-To: <CAD=FV=WAAk7ddDM3Uq8fRVYF4fCEDnufDbCiVgHfH2cwLqrT7g@mail.gmail.com>

--GddDciS6Gew0rjnV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 11:28:29AM -0800, Doug Anderson wrote:
> Hi,
>=20
> On Wed, Nov 11, 2026 at 6:31=E2=80=AFPM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > > > > > > +++ b/devicetree.py
> > > > > > > @@ -0,0 +1,226 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> > > > > > > +"""devicetree - Non-flattened in-memory device tree represen=
tation in Python."""
> > > > > >
> > > > > > I'd forgotten about this but PyPI has Zephyr's python-devicetree
> > > > > > [1][2], which installs a top-level 'devicetree' package.
> > > > > >
> > > > > > I'm not sure what to suggest. Would libfdt_devicetree be too aw=
ful?
> > > > >
> > > > > Right. I'm OK with libfdt_devicetree. David: do you have any
> > > > > objections?
> > > >
> > > > Don't love it, but can't quickly think of a better option.
> > >
> > > Would libfdt_tree be better?
> >
> > Not really.  The problem with all of the above is that they're making
> > this library which is about managing a non-flattened device tree a
> > part of the library/project/namespace that's explicitly about
> > flattened device trees.
>=20
> Personally, I kinda liked "libfdt.devicetree" that Simon suggested
> (though my analysis says accomplishing that would be difficult).
> ...but I can also see David's objections to namespacing this under
> "libfdt". Does this mean "libfdt_devicetree" is out, too?

I wouldn't say it's "out".  Both options are adequate if we can't come
up with something better, I'm just not enthused.

> One other option is "dt_livetree". That matches the "livetree.c" that

Again, adequate but clunky.

> already exists in the source base. What do folks think about that? If
> we switch to this, should I move the ".py" file? In my draft v4 I
> still have it under "pylibfdt/", but I could move it to a
> "pylivetree/" directory...

How about "libpydt"?  I'd prefer to reserve "libdt" for a hypothetical
future cross-language live tree library.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--GddDciS6Gew0rjnV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2g20ACgkQzQJF27ox
2GeN8xAAhZp2qvfN5rSASTpuguejNjFSVye4z6ehUTIP7dqPgJ3lc0J4EUS+wupM
F+g6Gp4+NZEZJaTJvLrDCmI3EQk9CmlTd3UeZ1kgqEMo4OM5JuA+O1/Kely2ND/M
Kmo62FLhmISAZM5gKYQgFkatEzxMcgXsoScJlYJX/X9aFfk2nCaDQwAOk3RA6Blv
YXJ+a4nHzbBrq6uZypL+GH1UpxQmpy0Yfqdd+SiO/ne/PrJOC1MDPtuNrE/PN6Vr
lLOVKldJumLpWWmBlFkhUvuC0HXIQg2mAZW7fM8wAUUWKmXOgOrOMINNBpwrQGEH
h95PDFja5NokMMBZuaWbyIO/G/0dbzB2kMO0tXFOACB4q59mIXHS7b2tM1+Sm/M9
paXY5xsyQ824jAFGRPTdgFMh5Fx1rH4MCKiA5ZeLKXlLOvlxbJJ41sH+hGXFVN4O
TT4Oud8yO9tXxxBl7to5rmHjmG2ltoMM/U3buct4xMVCeptsxZ3haa5GwWijseab
eHVWAuQiPz0GeHRp/eIbpcXEBS3iAd4b7KsgCBJ0yMMujaxy9uLwfJWMGJ9OSKbU
iKhxC/OBHC+qR3xOzPiKW3fkmHZI37A1n9Ji4l3VreoCQJ3VWvjtmO5V3Z6QGU0f
IrTZ4Xyb/+ZPf06tNuQyl4urOVHG2JZvE3f9vdwZI3wLvQThXn4=
=xUIq
-----END PGP SIGNATURE-----

--GddDciS6Gew0rjnV--
