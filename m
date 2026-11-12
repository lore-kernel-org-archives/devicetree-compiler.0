Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450711;
	b=gLcFaXssVBmFXo+Skj8a/eGSxERZJv4b0T2PwST4mr/0dhzLGDt24euHr70d0S0lqr4T
	 wxTm1P/BDiCAyl/LjRFly6aclwiNlkORQTEAomwCeJaOWPC12dUX71ej6kQ9SPfXMl2ex
	 2D5CSA63vgLJEFOBmVkbZho7bepu7nk5ZmMWE4ZKiZRHHkA0tb6DLUPRG2hcormLxTo1S
	 ER7mFdHs0nkfWo6GxdOTrfemwQWSv7CPc1bIGaqHLteNc8sKGOP2WuYtapYYT2s/4sHAM
	 TY5N7Hj9+nrBEw/EEx1jQXfPtTqLoXPLcSxSGCwVhSHGjZIy7bBVjPene5m3vmWhw1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450711;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=oW9LBVkT640ce0ePnpl977J2xg0Su5DYXjUCivzDXK0=;
	b=avS9K4S6gsOyGexXgUhObhUkWsQ4Xwuk8NqP4Cj0H81aq4wlIKa2R/iBW57xuUtVsdEj
	 cMH0jKAfbuoLmI2XNp/wx5l6jVP5URQUctrmRkyNals4y6zhjQuc4xOx12mlO2wJA430o
	 A5EFkeFxtaqj+65KM2EboNRTPXQxVuhE+/rBderggPIx3zvJ3+ZFp/zQLhbme9A/+Hg1+
	 QC657MZXQmfq58sJz5ANsJgOg26H++FEs+aZ1Vyw1Pl7zUXnP4z2xT8C3FcRGhGhHu+1V
	 jGwj/v6TOb9fkfKP0JebK+uupAn3Ot6HNPOzdAMJESI74qxxXJ10GlTOZVDmbZDvZ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=lxQxAWEH;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D455606A32E;
	Thu, 12 Nov 2026 02:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D455606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=lxQxAWEH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794450707;
	bh=oW9LBVkT640ce0ePnpl977J2xg0Su5DYXjUCivzDXK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lxQxAWEHg9RM5Dlk0JUdbgcBUqGvtK49bO8hQaxltLgeDuXbEj5bIZvpils1txTHH
	 6d9eq3LGvchsnLS/NNk1VC9AcUl5h8t5DSQbhRcXvdl/ZA12MqGSobmNqOxQsmQHj5
	 RZmF+fHG2P+ZDp426o9gaOkYWTow+65NUlSgzwvq6Z2aOeYfGKbvfO66JuPH+JhPVM
	 0CfxJ4LdsDt9pfe7iDE5/rgS4mzM5COSftIbY2apGnSBKGtkbzGjZ1hOU0XcGGYb4M
	 SpvvA3aU7aJMJjHlY7ndp6gAagkMYOZMcgKgPQpHH8K+aNedYmoB0amQNNSBLBBqgF
	 dWVMm1eYwb9YQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQ4CR2QqFz4wGx; Thu, 12 Nov 2026 13:31:47 +1100 (AEDT)
Date: Thu, 12 Nov 2026 12:44:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>,
	Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
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
Message-ID: <avUZ-uqxLAu2ICyJ@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org>
 <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
 <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
 <avPZeSgU8ABix34f@gractus.seuss>
 <CAFLszTiUYv2rx2OzvLR6UyO-uoya0WthPsr+oohQtCa+_itZsw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="5IRHMQ0nbuFKtWRc"
Content-Disposition: inline
In-Reply-To: <CAFLszTiUYv2rx2OzvLR6UyO-uoya0WthPsr+oohQtCa+_itZsw@mail.gmail.com>

--5IRHMQ0nbuFKtWRc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 08:15:06PM +0000, Simon Glass wrote:
> Hi,
>=20
> On Tue, 10 Nov 2026 at 21:16, David Gibson <david@gibson.dropbear.id.au> =
wrote:
> >
> > On Fri, Nov 06, 2026 at 06:43:18PM -0800, Doug Anderson wrote:
> > > Hi Simon,
> > >
> > > On Wed, Nov 4, 2026 at 6:08 AM Simon Glass <sjg@chromium.org> wrote:
> > > >
> > > > Hi Doug,
> > > >
> > > > On Sun, Nov 1, 2026 at 4:02 PM Douglas Anderson <dianders@chromium.=
org> wrote:
> > > > >
> > > > > Add `devicetree.py` providing `DeviceTree`, a non-flattened in-me=
mory
> > > > > representation of a devicetree node and its subtree:
> > > >
> > > > Please can you start with the motivation, i.e. why a live tree is
> > > > needed and what will use it? The list below mostly repeats the
> > > > docstrings.
> > >
> > > Makes sense. In my draft v4 I've updated the commit message to lead
> > > with the motivation and condensed the summary so it doesn't repeat the
> > > docstrings:
> > >
> > >     `pylibfdt`'s `Fdt` and `FdtRo` classes operate directly on flatte=
ned
> > >     device tree blobs, where inserting or deleting nodes and properti=
es
> > >     shifts subsequent node offsets. That works well for in-place quer=
ies and
> > >     localized edits, but makes multi-tree comparison, structural diff=
ing,
> > >     and bottom-up tree construction (as needed by the upcoming `fdtfa=
ctor`
> > >     tool) awkward and error-prone.
> > >
> > >     Add `pylibfdt/devicetree.py` providing `DeviceTree`, an in-memory=
 live
> > >     tree representation where each node holds `props` (a dict mapping
> > >     property name to `libfdt.Property`) and `children` (a dict mappin=
g child
> > >     node name to child `DeviceTree`), along with `unflatten()` and
> > >     `flatten()` to convert between `FdtRo`/`Fdt` blobs and live trees=
, and
> > >     helpers for path lookup, node creation, and pre-order traversal.
> > >
> > >     Add unit tests in `tests/devicetree_tests.py` covering `DeviceTre=
e`
> > >     round-tripping, subtree unflattening, duplicate-name and corrupt-=
tree
> > >     rejection, and navigation helpers.
> > >
> > > > > diff --git a/devicetree.py b/devicetree.py
> > > > > new file mode 100644
> > > > > index 0000000..f81b8fc
> > > > > --- /dev/null
> > > > > +++ b/devicetree.py
> > > > > @@ -0,0 +1,226 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> > > > > +"""devicetree - Non-flattened in-memory device tree representati=
on in Python."""
> > > >
> > > > I'd forgotten about this but PyPI has Zephyr's python-devicetree
> > > > [1][2], which installs a top-level 'devicetree' package.
> > > >
> > > > I'm not sure what to suggest. Would libfdt_devicetree be too awful?
> > >
> > > Right. I'm OK with libfdt_devicetree. David: do you have any
> > > objections?
> >
> > Don't love it, but can't quickly think of a better option.
>=20
> Would libfdt_tree be better?

Not really.  The problem with all of the above is that they're making
this library which is about managing a non-flattened device tree a
part of the library/project/namespace that's explicitly about
flattened device trees.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--5IRHMQ0nbuFKtWRc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr1GfoACgkQzQJF27ox
2GeXgxAAoKC6fcUEV2dhIvnIqdbOp2miRRKifOw0IYUSclRQ/wE7dMfNRjmk5KJc
AkoSJpUGEw+c1ToEkTBHxfmwlRVPhTBT+/0Exg9lvOHyyn+CVbpHkmOHcDCnE9Zt
QsWj1JWoHTzMeOSTrtyno4lL+KGdfBpvw1ZU4Tu/GLbVAczK68uu4arZehCCX1m/
x5jBUbQluZ4+OzQynK4KDnDV/wdBLp/yjeAUJkdp3TeWvWH9pyTUFWdKlv6pfU8u
3uR91vmYip4CEkASOZWtaAzEM6LnveIChrI27chlSNhTbD9+uZ/ndUsGxcd8405i
XwH+s8t+CTC25e1teB8Q6NHPfv4jPB+w9yMVTjYUkuGgmXiz7/InbQgNjEzc3v//
3VuxSdMVg09EZ+XrvsqsG1UO4VYiHRybtHadnhf+u/weR9yDWCSnqBLycTXdZKe3
vScWN86HwzyrR0XP2l2UwqghlaWDcCu0pjlDL/rlqs/EmeH5MACrm8i8iwTfGg4j
bjUOZkhc4W8EsoCqd90bdpPhZJwhL+Fcld+CP6Kh5v2LE+5dXRFmluf9a1AQUaOP
eR93LSCg3YhIV6o+AIiVtfNWg7w+4xvSf3bG/E5pzKw1ucaXqu56s+6VflF0x7Xk
0K4aoY3ST14t0ZsBGg5NAvA60BBC0i5EBsf3PArF8JjTOXtk16A=
=7oZ2
-----END PGP SIGNATURE-----

--5IRHMQ0nbuFKtWRc--
