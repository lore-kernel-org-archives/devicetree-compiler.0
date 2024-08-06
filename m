Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C45AD2F
	for <devicetree-compiler@vger.kernel.org>; Tue,  6 Aug 2024 02:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722911469; cv=none; b=fEO96FME89JxvkRrnolUyumf7pGVcShoFMbOv6yk4kXlXQSCzC6vczYZd338Eqqiqk0PF/VT/86tn7mYfat2rK5f+npf5AQ3mDRALICeUcB1IOc315HKlHo8BYvxotpKeMYS+mdiyX4adiCiQlc1VFHGgOUdy5+n3XVnh/7KftE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722911469; c=relaxed/simple;
	bh=B9SFMdBykKMs2+063tFuZ6YJBjXPHtLT1oEFtePrpBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lODYNY8ee+MMcv46fZH63XDgZzRG9ilKpDrobxbIBYx67AXTi1INUItqqbLxD5CvQgl17jioCSFKOQSwU2JrcxB/ZvlCl0NdmR+J2kQt2y8sAHAkogBHW3qI8wLZFlJ7X4epFDhb9Z5NT1BVN/GVY1ARDCUrit0hsc8HfBj9mBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=dcqc/p6Z reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="dcqc/p6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1722911465;
	bh=l+CqYIWDVofflw3aTPZKVJW3OyeeGVlhvm4re4bWNq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcqc/p6ZECN/PIpQqNfvVmLzo20FVRMU3GjqEEMFFuZXzgmer7e+Q5h8incQSB4/Q
	 uJjKwwH+XRMtINZ2x513bj8ThSQpKEZwXhslEcbGy2bCIt/GTP4hAxt7h7HjMgJ3CI
	 r35nbpWA+KPvngOGBoN3sY+Z9FgJJZqgSfOQw8hBsZO09OBFy7h3qUPx9fSMLHAs2R
	 J5H2d8M6G7/2/Bh8Di07G657oDhwuWo7ZMkKpeXOnSV45VWoSu+OzShxdbmilXHNDz
	 WRBOiO2UXnBfB8bSxqwgCdyVahoL8Y1IwimigrtRWZpcYCCrkuDD4nJl4i3dRa7DB9
	 imRjRBIsWjbRA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WdHNn0zBhz4w2R; Tue,  6 Aug 2024 12:31:05 +1000 (AEST)
Date: Tue, 6 Aug 2024 12:30:59 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: "Hoover, Erich (Orion)" <erich.hoover@arcfield.com>,
	"devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Subject: Re: Array manipulation revisit
Message-ID: <ZrGK476NXZfmTo2N@zatzit.fritz.box>
References: <BN2P110MB1058FB69969C91282858C8ECF5B3A@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
 <Zq3QIVrmUTTc4gjC@zatzit>
 <BN2P110MB105818EC9B379BD63B261E20F5BEA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
 <20240805225935.GA3452523-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wlUe6no3JlVwCnC1"
Content-Disposition: inline
In-Reply-To: <20240805225935.GA3452523-robh@kernel.org>


--wlUe6no3JlVwCnC1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2024 at 04:59:35PM -0600, Rob Herring wrote:
> On Mon, Aug 05, 2024 at 04:35:14PM +0000, Hoover, Erich (Orion) wrote:
> > > From:=A0David Gibson
> > > Sent:=A0Saturday, August 3, 2024 12:37 AM
> > > ...
>=20
> Please wrap quoted lines...
>=20
> > > dtb overlays are kind of a hack layered on top of dtb, and don't=20
> > > have a way to represent things at a granularity less than a whole=20
> > > property (except for special handling of phandles).
> >=20
> > I'm going to say that they seem to be a _very_ useful hack.
> >=20
> > > Introducing new syntax to dts always requires care to not break=20
> > > compatibility, but that's really the least of the problems here. =20
> > > To implement this you'd need to invent a way of encoding partial=20
> > > property updates into dtb, which would be an incompatible=20
> > > extension.  It would need to cover ways of describing the part of=20
> > > the property to be replaced more complex than fixed byte offsets to=
=20
> > > handle the string list case here.
> >=20
> > Maybe I'm being naive, but I think that this syntax could be very=20
> > simple.  It looks to me like the current implementation disallows=20
> > properties with brackets in the name, so I would propose taking=20
> > advantage of that to create an invalid property name:
> >     PROPERTY[S*INDEX] =3D /bits/ BITS VALUE;
> > where S (single byte element size) is one of 1,2,4,8 or s (string=20
> > array).  I could see "S*" being filled in automatically from the RHS=20
> > data type (but override-able if you need to do something special). =20
> > So, in our string array case that means:
> >     PROPERTY[INDEX] =3D "string";
> > becomes a property named "PROPERTY[s*INDEX]" with the value "string"=20
> > when stored in the dtbo.
>=20
> The above doesn't work because existing software can't parse it if it=20
> is invalid.
>=20
> This just continues the hack that is overlays. The hack is putting=20
> information which should be in the format itself (DTB) into the contents=
=20
> instead. The lack of type information is a major root issue. That's why=
=20
> __fixups__ and __local_fixups__ nodes exist. They store phandle=20
> locations with properties.
>=20
> I think the major mistake we made with overlays was trying to preserve=20
> DTB format. That's ended up being pretty pointless because we have to=20
> update software applying overlays anyways. So why not just make the=20
> updated s/w understand a new DTB format. We could have required applying=
=20
> an overlay required a DTB in the new format (you need a rebuilt DTB=20
> anyways to add the symbols to it). Backwards compatibility could have=20
> been maintained by outputing the old format before passing to the OS.=20

I tend to agree.

> The other issue is when a new DTB format is proposed, it becomes a=20
> laundry list[1] of changes that goes nowhere.

Right.  Note there are also two layers even here: there's the abstract
format of the underlying device tree itself (a tree of nodes with
bytestring properties, as defined by IEEE1275), then there's the
linearized dtb format.

> What I think we should do is first rev the DTB format to allow for=20
> unknown tags so we can add additional, optional data which software can=
=20
> safely ignore. That would be an incompatible change. After that, we can=
=20
> add new tags in a backwards compatible way. Roughly what's needed is the=
=20
> same information stored in dtc's "marker" data: types and offsets.

You could do this, but it has its own difficulties.  It's adding
metadata in the dtb that's not present in the underlying device tree.
That's already a bit risky in terms of things relying on it at stages
they shouldn't - people already too often fail to realize that "a\0b"
and <0x61006200> are indistinguishable once you're in the kernel.
Making it so you _can_ distinguish them right up until the very last
stage seems likely to make that worse.

You could consider replacing the whole - admittendly pretty legacy -
OF1275 style information with something more modern and
self-describing.  But of course that's an even more widespread
overhaul.  And it's not obvious what you'd use: json (or one of the
various isomorphic formats) seems the obvious choice, except that json
can't naturally and safely encode 64-bit integers, which is a pretty
fatal flaw for this use case.

> > > It would need to cover ways of describing the part of the property=20
> > > to be replaced more complex than fixed byte offsets to handle the=20
> > > string list case here.
> >=20
> > It seems like string arrays are the only complicated case, and by=20
> > knowing that it's a string array (like with the above "s" size byte)=20
> > the implementation can count NULL bytes to find the correct element to =
replace.
>=20
> prop =3D "foo\0bar", "baz";
>=20
> How many strings in "prop"? :)
>=20
> Strings are actually the easy case IME as the heuristics to determine=20
> if a property is a string works pretty well (minus the above which is a=
=20
> test case in dtc, but not something I've seen in practice). It's=20
> determining the size of integer arrays I have problems with (in context=
=20
> of schema validation).
>=20
> > > Finally you'd need to update libfdt (and any other overlay=20
> > > implementation out there) to process this new fixup information.
> > >=20
> > > So, yeah, it's not going to happen.
>=20
> Why not? Yeah, updating stuff is painful, but so is not fixing some of=20
> these problems. Are we just going to live with them forever? I think the=
=20
> reality is most things use libfdt (probably everything that cares about=
=20
> overlays) and they update libfdt at some frequency. And how old of a=20
> component do we really need to worry about compatibility with?

I was meaning in the context of retaining a compatible dtb format.
Going outside that opens new possibilities.  But, that's a big job and
not one I'm going to take on.

> This reminds me of the saying about planting trees. When is the best=20
> time to break compatibility? 15 years ago. When is the 2nd best time?=20
> Now.=20
>=20
> Rob
>=20
> [1] https://elinux.org/New_FDT_format
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--wlUe6no3JlVwCnC1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmaxiuIACgkQzQJF27ox
2GfliQ//R4DoCu0v7GM8U2szGzoH9Rmf06nrERf0D5OafXPXlKnagOUucm0H48h4
m0hBfWI6PQwh4R7c5lHaWRwpw7BVA95BZuokZhnJbMjIHnAqt5oYyC+YH/Mxq+Wi
UNfY+nwWqgZ6Ukm9Ul7/LTXoUMoh4H7i9OtcOkS7AsIT9gXUCIOGiv2KR+5y9f60
hy1kwuFtjZhZJQcY1P0gyihq63kPSFf99KX+mhkWc+q/zJjJfazxqbaLhv4EEkcr
Ceg0XlMhjAcX9+rmQDDXN5wdmqS/vGPO4nXpPOuUEs5+bjQTC0ekAxGDMdKOz7D6
NqD9ItEx/LsSt6cvDSy99DfUCcNIbyMBE7q7Muati7zorp12G1nQBb4nF9WrLFzp
AyFHbyRdLMofgRJg/f60yrX8ZCRJfTwYhluKB4pXpuPfkV7iSjaihCvG2sskUjOK
8HrbEwWcd4ZNync3A+g0a6Q0IDlmQEVFalAjpX/KNvh8V0Xlt7XKo1gFd3p1lRmq
mFW1vm8yY2K0nGjt3ytFydoWF8MG2FL2KK7LlakOIi7FPCDMA9VyGqvJLxoOS3jr
Xya27MRgH1+fQub/mcmX1MzAzPI9wQapgGmvzLGfBmWR0PryxRX91LV1YfSNAQAw
u1OmH5EtD4Mwh2kZyJ6oDUHYN47Ps/A95QyyPJVvIU/reaAJBGM=
=vcQf
-----END PGP SIGNATURE-----

--wlUe6no3JlVwCnC1--
