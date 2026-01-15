Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C40155C87;
	Thu, 15 Jan 2026 00:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438269; cv=none; b=SfV5RwMCBUrCJTeOaHQoiDqmmvW04+t4MpYARswB+IhkR9f/Ma0MjFhDPGL55o8xaMXoxhh8V6A5FwiCDA3/FCEMQNO/WlfwcjB23LuOwzJyc/9h/UiMrOHZcRVARbbBT+BOB7RLxUHhJFX/etMEH7be3GBofy87yOaCN+dkOos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438269; c=relaxed/simple;
	bh=+k66OeL/wK0FhxrWulQRJj6qlzmfc+G81FPDe++2pLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mq7GbZ45clB4OPUAWch7PO6Cm4QBOppfgC8OT67/xYyRb3bbRmhF67yiY2PmetQnMY15fX6wa3nxSiCEBQPFGoi2HTCNmXR6u8BM5We8KsBMiZKpIdbNI4ELL6L0yc+V/CMcFnhV2AX9cEMy81/grcmy9lDbYCBWOPWYj5LvSW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=JTHyh1ci; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="JTHyh1ci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768438265;
	bh=1RTo+OjW3tKsFG8ed9hY300rzhMALTnRdleSzjxIidU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JTHyh1ciFVq7hKOELkjGASnqk8L4+5p6Zv9txD9Vu7beFPPToMzZ3a7ejK/Lr1iDH
	 iuC9/UMbK1Qve6rMoBAKHMUdGAHCjb3LFKx9xbsGUK9z3Z8wuAGMYNTnBsnlXEPFXC
	 PwVzT4l79kDGdrPADN8TY2swPChYbuufl7c9VAx5bjBGCjmegFPyEkI8KDUtFczUuY
	 D6SzEtn3A9w5juDxYpd6FCghJoVFt2ydFA7IeqYfRaErvUruMwfM7l13drv4xntlxi
	 M3brrNm+0RE31XEQ9Z7oYbbkwm4wDFAF1mzVLSe9Sg18YSG/zIf7YzF73eRrMLdYMz
	 i9zMRjoSRL81Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds4D95vjSz4wGs; Thu, 15 Jan 2026 11:51:05 +1100 (AEDT)
Date: Thu, 15 Jan 2026 11:28:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 05/77] fdtdump: Change FDT_PROP prob handling to ease
 future addition
Message-ID: <aWg0va98pwR6KhQA@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-6-herve.codina@bootlin.com>
 <ceaa0a9a-8d72-44c0-943d-dc212f1aa5db@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lxHh1gslvIch6C9O"
Content-Disposition: inline
In-Reply-To: <ceaa0a9a-8d72-44c0-943d-dc212f1aa5db@beagleboard.org>


--lxHh1gslvIch6C9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 09:11:52PM +0530, Ayush Singh wrote:
> On 1/12/26 7:48 PM, Herve Codina wrote:
>=20
> > In order to ease future tags addition, perform operation related to
> > FDT_PROP when the tag is explicitly FDT_PROP instead of relying to a
> > kind of default value case.
> >=20
> > Handle the FDT_PROP tag exactly in the same way as it is done for
> > other tags.
> >=20
> > No functional modification.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >   fdtdump.c | 34 ++++++++++++++++++----------------
> >   1 file changed, 18 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/fdtdump.c b/fdtdump.c
> > index ec25edf..95a2274 100644
> > --- a/fdtdump.c
> > +++ b/fdtdump.c
> > @@ -129,23 +129,25 @@ static void dump_blob(void *blob, bool debug)
> >   			continue;
> >   		}
> > -		if (tag !=3D FDT_PROP) {
> > -			fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift=
, "", tag);
> > -			break;
> > +		if (tag =3D=3D FDT_PROP) {
> > +			sz =3D fdt32_to_cpu(GET_CELL(p));
> > +			s =3D p_strings + fdt32_to_cpu(GET_CELL(p));
> > +			if (version < 16 && sz >=3D 8)
> > +				p =3D PALIGN(p, 8);
> > +			t =3D p;
> > +
> > +			p =3D PALIGN(p + sz, 4);
> > +
> > +			dumpf("%04"PRIxPTR": string: %s\n", (uintptr_t)s - blob_off, s);
> > +			dumpf("%04"PRIxPTR": value\n", (uintptr_t)t - blob_off);
> > +			printf("%*s%s", depth * shift, "", s);
> > +			utilfdt_print_data(t, sz);
> > +			printf(";\n");
> > +			continue;
> >   		}
> > -		sz =3D fdt32_to_cpu(GET_CELL(p));
> > -		s =3D p_strings + fdt32_to_cpu(GET_CELL(p));
> > -		if (version < 16 && sz >=3D 8)
> > -			p =3D PALIGN(p, 8);
> > -		t =3D p;
> > -
> > -		p =3D PALIGN(p + sz, 4);
> > -
> > -		dumpf("%04"PRIxPTR": string: %s\n", (uintptr_t)s - blob_off, s);
> > -		dumpf("%04"PRIxPTR": value\n", (uintptr_t)t - blob_off);
> > -		printf("%*s%s", depth * shift, "", s);
> > -		utilfdt_print_data(t, sz);
> > -		printf(";\n");
> > +
> > +		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift,=
 "", tag);
> > +		break;
> >   	}
> >   }
>=20
>=20
> This seems reasonable refactor independently from the rest of the patch
> series.

Agreed.  Merged.

> Reviewed-by: Ayush Singh <ayush@beagleboard.org>

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--lxHh1gslvIch6C9O
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloNLwACgkQzQJF27ox
2GesXg/6A2u9+eXXCLzcoh7BsHhdoVXMNcMOQN2Je+xCd7wPdGeF1ZKpRJg6MgRY
y6x/fdT/qbtjKhAefuIrLy4pmaEeka6XjXBRg4HHKQz6xXuI9UYvdVsc3ILnaiRd
oi7kE+pJhLpEmnQManA1Sr258MJmVjmFk/ZiJSQn/dF+Kzcgv8v7X2WHuLmClOhf
KTPltv8BADmSLxYoCCUwKQRRoNl3LOEGvKglb6zr9NfTABaGcyikokbn59A2MVkQ
2dl3Po6LJ/BusLph+xPVCU/2T2ZLhUkB/Iqz1CQXk5CxvaB9fLwj09S8pM5GucK9
g/hD7kSQdMIKB5wVzD2FwtbRpM4PjNwc4ajRMgFPC4Kg0fkY/EKjSTirQxmQJcBK
u4B8xAVby/oMdrOMNYGrpk0GZfz7w3Kuh74Gee8DwzboQ0oZdrj5noBawc7zxo+d
xQLkiXTNlVTmTI7l8p8oDy58LCQYpPmQJa7k9xACVpTENFC1Ry8wsbv0C7UE7Y9N
QYklYw6AZ3MpxLYgq3KNfyH3Z2XYS+RnmztFmvfo1ass/rrtAheDEYcjyAqfHq8/
14Y6DQ77KjijKtrWaCdU4h8vgpiPVJJj10mzmJk1wky99OTFZjcL2Gj3SMfrU8mz
lTP/+YaWW0C72rq9walTMGAtclgiZMaQTiAnqDjhEXLfJwnwzoc=
=l+2V
-----END PGP SIGNATURE-----

--lxHh1gslvIch6C9O--
