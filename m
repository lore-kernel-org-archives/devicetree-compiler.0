Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370603;
	b=XtX0ivdZG5l+XuvhguXtZ/fOfXJSHSnWjv0VKMkOQLwjkPys5SvorJ5qTqIeg+m9+zeW
	 pkvU8CJ4U73AU9epbXQxm7m+q5+sjqdPhu7PH6h8sTgdqB/MUvloFL7iwBEhoSNA2c4+G
	 G3W6xgxdGZTyfzzCEhW/V0Ye0PEsfTGBS9U5W3u7CgA7LMl/22xzd0P9ZGwSfnuvlipRg
	 4syLesS1fBCzdub2yOsdOMJIkCVSvGk9J+yNBkNCXhVnBr8BtshUSyOd+uZSMtv7sS3ms
	 S6nwlD8ehzMiG7M1kDwrg3dU9OR9smGlzH6m4IKzNT1sxMViP0qowKn6/A/3ZNLltcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370603;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=rtFsrjgkYcfmP9LvCR3cXpmil5zo6g1CrMlF4jza/TA=;
	b=4qMSpi85ilL17iMmz4C3dsf9TWt15rDVPQOy8xYOT2AEyvIvhNDZFc1+QW6rgirtjs+z
	 SkkDjE8+aDT5BRGoa8d3KmPzfI72poEPdMpBC+d6n3lbpHCJNug13Vg0ae+rS9LVQdBDc
	 ykD8w19pYFCYIHb5dkgENtDZ6c0/c/fpXv3XMtF5e2D0LTsV+0AGxOLi33nB57zusiFNa
	 f4Cv6mNXRKi5ag2rh7rFIbIFkKp352Ylds6nAepDIKYsqetbm1tM9xkxppySz25tb7Ymd
	 gjQ8B+FHKRpigwgspkRwV7v1B82VLHLXukPnUJuE3Mk48rhlx2bgL7Xh0hpiqkLMoyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=kJr4HhMX;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B121960A2600;
	Wed, 11 Nov 2026 04:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B121960A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=kJr4HhMX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794370599;
	bh=rtFsrjgkYcfmP9LvCR3cXpmil5zo6g1CrMlF4jza/TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJr4HhMX/Vt2evTDFBq5xkPTx2JfTX/c+lgHPEDy6519+/EPLF/tGWhslFp3iEoPs
	 DVSUt6Wsw5wIoYLukGNWd7zijQoc34JsygSUH8xeTsmTd5Nh+m3CSNFR5v2aL8FVr5
	 2HZ5q+VzGh714IXHm53l59yd+fU0EGHWdpm6BWdfsX+dG7cnpk5BqAc6aKOSXdGkMq
	 u8HCzBxLFMP6qlSUzcRuEY871JaaWks2lzW1jUAzCcAlDKZsziwMIum/kSVblv2Q9q
	 AyM6/t96dwVpx6qiP1vFrlWrFEiVhp/uBZdkk60CBZEW1+5l/+m3Ef5T/5GTLPHqA6
	 mmJeNDSTnvq8g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jPVZv5PZPz4wTH; Wed, 11 Nov 2026 15:16:39 +1100 (AEDT)
Date: Wed, 11 Nov 2026 13:56:58 +1100
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
Message-ID: <avPZeSgU8ABix34f@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org>
 <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
 <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="6Mm6FXVMHsP3rOC6"
Content-Disposition: inline
In-Reply-To: <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>

--6Mm6FXVMHsP3rOC6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 06:43:18PM -0800, Doug Anderson wrote:
> Hi Simon,
>=20
> On Wed, Nov 4, 2026 at 6:08 AM Simon Glass <sjg@chromium.org> wrote:
> >
> > Hi Doug,
> >
> > On Sun, Nov 1, 2026 at 4:02 PM Douglas Anderson <dianders@chromium.org>=
 wrote:
> > >
> > > Add `devicetree.py` providing `DeviceTree`, a non-flattened in-memory
> > > representation of a devicetree node and its subtree:
> >
> > Please can you start with the motivation, i.e. why a live tree is
> > needed and what will use it? The list below mostly repeats the
> > docstrings.
>=20
> Makes sense. In my draft v4 I've updated the commit message to lead
> with the motivation and condensed the summary so it doesn't repeat the
> docstrings:
>=20
>     `pylibfdt`'s `Fdt` and `FdtRo` classes operate directly on flattened
>     device tree blobs, where inserting or deleting nodes and properties
>     shifts subsequent node offsets. That works well for in-place queries =
and
>     localized edits, but makes multi-tree comparison, structural diffing,
>     and bottom-up tree construction (as needed by the upcoming `fdtfactor`
>     tool) awkward and error-prone.
>=20
>     Add `pylibfdt/devicetree.py` providing `DeviceTree`, an in-memory live
>     tree representation where each node holds `props` (a dict mapping
>     property name to `libfdt.Property`) and `children` (a dict mapping ch=
ild
>     node name to child `DeviceTree`), along with `unflatten()` and
>     `flatten()` to convert between `FdtRo`/`Fdt` blobs and live trees, and
>     helpers for path lookup, node creation, and pre-order traversal.
>=20
>     Add unit tests in `tests/devicetree_tests.py` covering `DeviceTree`
>     round-tripping, subtree unflattening, duplicate-name and corrupt-tree
>     rejection, and navigation helpers.
>=20
> > > diff --git a/devicetree.py b/devicetree.py
> > > new file mode 100644
> > > index 0000000..f81b8fc
> > > --- /dev/null
> > > +++ b/devicetree.py
> > > @@ -0,0 +1,226 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> > > +"""devicetree - Non-flattened in-memory device tree representation i=
n Python."""
> >
> > I'd forgotten about this but PyPI has Zephyr's python-devicetree
> > [1][2], which installs a top-level 'devicetree' package.
> >
> > I'm not sure what to suggest. Would libfdt_devicetree be too awful?
>=20
> Right. I'm OK with libfdt_devicetree. David: do you have any
> objections?

Don't love it, but can't quickly think of a better option.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--6Mm6FXVMHsP3rOC6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrz2XkACgkQzQJF27ox
2GduQA/5AajRkD3RVriPh0pZgBqI0EiIaWL5p/8liHesfnkAjWIcRgxFylEV1+/U
Q6AcLIjudTve0dp++4xv0SeCf5ns+sjfu/6/twRWTJXnAPm0+R4TU5LwVKmXtqxf
DcKcAGbwOnBt8V9ouQHr5r58VvrSn6qBqX7cE4SyryLKsQQ0uNQM5CHpmqM/pU7W
yKNLxYWHr4eMuFyG5DMUuFERkTFNYe3A2DKuL8ynQ4C8myCCXJTF20SNsAkOf08m
SFdhjehCFoZ2embzf3VqAbXULcMhImq2QfEjSjki2eiYC6QPt1liajiB8/5GeYM+
oDsJf8W17jsoI1L4c4ohtFEAoutYZCFDzSD1G4LEGuqeAOwd4QbNbPWMlOg2Jl4Z
G9xoxh52FwF+ECARRDmzlMZd7JZO4Ctkta1xMKzE5wUBByZXO69mkJYNUDsMzqqg
O0D+fSiu7Q9ZhREhirTyJH1AklCXd/EIPo3IutdCVFAvKkLTQpKnxZfpuoYgHbG/
xuhuMbdzjBJcN5Adl9yCej54FBqomDsXkMLNWJXXbdFX1rM3ByizHEq8SPpFxAkH
282ObXyUxnS0HwyF5rPkXRDiHpP8HdZBGl6pK+vULmZDdyT/sil2fiW3csiVjYk/
wgT3hiUVRIPtV3wvh9Oys0ohegoJdxeyZl09T9cwO+0GphLsjHM=
=pk7i
-----END PGP SIGNATURE-----

--6Mm6FXVMHsP3rOC6--
