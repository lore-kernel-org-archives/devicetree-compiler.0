Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B7D1F934
	for <devicetree-compiler@vger.kernel.org>; Sat,  3 Aug 2024 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722669022; cv=none; b=PtWydzdBL8hjetIdOUy3k9vmVG35sqqQs2FrjMNO8Uipb2BnVweNWD61/ZeTJ0ZdKF6BmUHE18zLjThG0/9MDfR80RWzy7wsTITHj5gMaVxv+mBqHpzxGKVaBq8Ld5W05gvDMgn2xye21+wCbiD8StbKbk+DC6yRbZsfjsn+ISw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722669022; c=relaxed/simple;
	bh=tmRYLgnaxLmS7hNnkSCEJYOTt9oYLUxq6h5tXeX74fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M40tbgS9bUVda/V9OhXxrcJkzyDaWAkaO5my4djOteLjRcE/2sLLrMW/dcmwHDMlX15IU3Ej3PdIcg+biV4PcHw2fXG5F2P9FzG63Aq2W2ztfBnvNQa3mSymwsTN9LHZG2lHkY9YnQ12l6iGQQwnrG8nxBR10YnQMlpaDeR70zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=b9REMHxl reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="b9REMHxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1722669006;
	bh=5TmFVtyGr0NObSt/QQAo5BDhcKJ30GQLO2nrnzNRCYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9REMHxlIKFIwcyzaSZBFCtvu/ZiYa6h49+6CMRlgNKP/6TdfXeCEnLwWKOMKmEGl
	 tujES5SpQOfQY1mqx0dDzr3kJ/qT8gTW60c9g7SEtQdB4BZ4izD5qkLTPxTDyuJTAc
	 YUtam9UvRLk+hF+78m/o03aotBNxeGT3y1H8Oqe+MPdInr04Gtwl3YVqxoLP6YV/vX
	 +aO1xb9ik6PR2e6arw4mZBFunC3iknUDVeCj8NyXCqxM0H95do4YCNnigpUn6+wcPk
	 P5nTgdCxvRjJMWFcuvncaXYB2ck81MSFGbeXJ+0MdhhigE8l9DyJbcy+9eQJT/umEE
	 8yMyXGKZ0oGRw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WbYk65SNgz4wx5; Sat,  3 Aug 2024 17:10:06 +1000 (AEST)
Date: Sat, 3 Aug 2024 16:37:21 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Hoover, Erich (Orion)" <erich.hoover@arcfield.com>
Cc: "devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Subject: Re: Array manipulation revisit
Message-ID: <Zq3QIVrmUTTc4gjC@zatzit>
References: <BN2P110MB1058FB69969C91282858C8ECF5B3A@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1lTETnYS7h1DvmZY"
Content-Disposition: inline
In-Reply-To: <BN2P110MB1058FB69969C91282858C8ECF5B3A@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>


--1lTETnYS7h1DvmZY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2024 at 03:36:43PM +0000, Hoover, Erich (Orion) wrote:
> I saw this old thread on array manipulation:
>     https://www.spinics.net/lists/devicetree-compiler/msg02575.html
> and was wondering if anything got implemented to handle arrays and I'm ju=
st not finding it.
>=20
> For most cases I've encountered there are workarounds for dealing with th=
e arrays, but I'd like to figure out a way to update GPIO line names from a=
n overlay.  Example:
>=20
> &gpio {
> 	gpio-line-names =3D
> 		"QSPI_CLK", /* GPIO0 (example, not always the same) */
> 		"QSPI_DQ1", /* GPIO1 (example, not always the same) */
> 		"QSPI_DQ2", /* GPIO2 (example, not always the same) */
> 		"QSPI_DQ3", /* GPIO3 (example, not always the same) */
> 		"QSPI_DQ0", /* GPIO4 (example, not always the same) */
> 		"QSPI_CS_B", /* GPIO5 (example, not always the same) */
> 		/* ... */
> 		"GPIO_MUX_SEL0", /* GPIO148 (thing to add) */
> 		"GPIO_MUX_SEL1", /* GPIO149 (thing to add) */
> 		/* ... */
> 	};
> };
>=20
> What I'm looking at is that I have several layers of device tree informat=
ion:
>     1) shared-based-device.dtb
>     2) fpga-overlay.dtbo (different for every device)
>     3) config-specific-overlay.dtbo
>=20
> When all of this information is integrated into a single tree I can use #=
defines to set names for all the pins and then write out the pin informatio=
n all at once (though this is a little painful, since it requires a #define=
 for each pin).  However, when this information is in an overlay I need to =
know what the current contents are to replace things properly.  So, what I =
would _like_ to be able to do is something like this:
>=20
> &gpio {
> 	gpio-line-names[148] =3D "GPIO_MUX_SEL0";
> 	gpio-line-names[149] =3D "GPIO_MUX_SEL1";
> };
>=20
> Then when the overlay is applied what I would expect to happen would
> be for libfdt to read the existing value, find and replace the
> specified indices, and then set the full property with the new
> value.  Is this totally crazy?  Is there already a better way to do
> this?

Well, it's not crazy to want, but it's basically infeasible to
implement (within something resembling the current formats).

The heart of the problem is that "arrays" aren't actually a thing in
the dtb format: each property is simply a bytestring.  You can
structure things as lists in the dts for convenience, but it's all
just flattened into a bytestring in the output - the user of the dtb
has to know the expected format (specified in the binding) in order to
decipher it again.  For example:

	foo =3D "a", b";
	foo =3D "a\0b";
	foo =3D [61006200];
	foo =3D <0x61006200>;

Will all produce byte-for-byte identical output in the dtb.

In the case of an "array" of strings it's even worse: all the strings
(each with a terminating \0) are just appended together to form the
property bytestring, so the "entries" aren't of consistent length, you
have to scan the whole thing to find an entry of a given number.

dtb overlays are kind of a hack layered on top of dtb, and don't have
a way to represent things at a granularity less than a whole property
(except for special handling of phandles).

Introducing new syntax to dts always requires care to not break
compatibility, but that's really the least of the problems here.  To
implement this you'd need to invent a way of encoding partial property
updates into dtb, which would be an incompatible extension.  It would
need to cover ways of describing the part of the property to be
replaced more complex than fixed byte offsets to handle the string
list case here.  Finally you'd need to update libfdt (and any other
overlay implementation out there) to process this new fixup
information.

So, yeah, it's not going to happen.

However.  If you're able to have an actual program on the target
processing things, rather than just applying an overlay, then there
are more options.  You can then do whatever logic you need in your
program, using libfdt to read update the dtb.  I'm open to adding
additional helper functions if they're useful for things here.

Aside: you could argue that using a huge list of strings like this is
a poor design choice in the gpio binding, instead of, say, having each
gpio line as a different subnode using 'reg' to index them explicitly.
But, spec design tradeoffs are always tricky, and we're pretty much
stuck with it now, anyway.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--1lTETnYS7h1DvmZY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmat0BwACgkQzQJF27ox
2GfW3g//Xr1jwvB1gonUkI1Qh/gm5d7Pgj2iPGvKso79hTjLlgEOu44lthmxZcnY
O1SZGwviAfXrjZ2+A3NVqBE5pHI1dkpO7wEEDdY5tw/hv+cCwuOdi+cwF0EM8neU
dqzmo20jetef+KjyWOwdXQ6mikLmPw7ZsEEAgXkb1h67DvEgYwVwN8CwskSjk2Ll
m814i7feWDJyPpeGEmgQqssCvqqiY7bicQ5KkGd7PgaTMYr/OoXRoUCHP54X0cB9
9iUvdqIla2mO1o6T3sgyVCm7S7kSPQyDj2UIg+3zlMEO4VSIFchp7arlBx/OX+XM
qfzBMulTUB3h9BlnWn9+4yFcrIRE6AVEhqlv2FPsM0zkftYDTHZsaIwLZnN5euN5
hAedljOo3HqI2P9Ri5qatscocFgxFIOjc0vhNiJc2lFND05+LJsl1DSGz60clwmQ
Myr8E0Xa5+GXRARqqjdp8H7QRfeiWj75hvYIQa1uc5Nir5xxsWU2es3BCznMJkiw
arS/88K4fVGf4mmels0bI0/gQRI5t/yV/EdUrphYG8/YzG8xU/eCvOm1YHlZu4BG
PsNTu2JdFiVf5S03jZyJzkn4d+VB9uLNhkGeNYTTab+Z2HIr2XnS3wqzrphDhP2H
iWclEyEn3sEkZk7FNRfyKvCJ1RCIQ+C9EfnqljcbM8qss1O5dh8=
=dGeZ
-----END PGP SIGNATURE-----

--1lTETnYS7h1DvmZY--
