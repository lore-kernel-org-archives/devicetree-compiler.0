Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332E23D8E
	for <devicetree-compiler@vger.kernel.org>; Wed, 21 Aug 2024 04:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724212972; cv=none; b=HIf+U2gBfcysH6eyIcjm8ssGphlt0/yev5D35iuqfk3h9S0HTnjabVzsVVKoR5JGDvptRoDLgzYPiMSlImpWLS8KUVe3rf6QncwEzhhRcFFwL6byhcpjL6Ge0ojvF/fERwbZGnNAB64LfC4adz6bcd4q5mu1RK10JaeVtOThtS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724212972; c=relaxed/simple;
	bh=hnYMUa/qDfhDoyA9tj/0dNLGyr22CNcaLLUOuWwuPsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLrad+3ybFWNgPWvpD8KjALSZWa0nBTzAf4z9M83SqkPNNr5PEw1v0Ar9viwXtJE/YhUClZAMCZ+AEabj5Ijf21dScgSy8LPuaPG3uHEma0GHkZ+cGRgXLIfFKryhmYyGVmPw+hqmofYvhwwzgqg7LgrPaeBeKoBe9VGBQh1RVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=kwIxuf+s reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="kwIxuf+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1724212964;
	bh=toHJQwCPcGEeDOxzUTCKiv9gyfn0M0SsnuKUntGPGwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwIxuf+sDUyBJehdtcd4ND6BOMwOWDpqoZzP0Kvsb7HJRqhhTfgTr8GvUtA6Lmf63
	 S/MUZLM8L3vGdf2sJo2EXsh9xx6T4jU/OxANsPgNUmj2VWix0KcErxABCzTZYEuQ8n
	 oMrOG0eMSZSwETIS1WTLfXcZgI1kAHQ5aadOhqxHnF11mLCwNO5fV+PHQjh6UUjeGL
	 8FrE1eiTrH6nsOvMuka+ckRsNgIViFSqW3JYQmKFT4NARMMm1Hjfn3UC/aaH/bLTkP
	 v7HySjSgl9EffSo9bTFl+OFrGFv8MEP9sz/rtkgbIu4aDicqcqBOfcdq/Zw1xZWjzC
	 MxWFAIZRNtGAg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WpXjc0n9Kz4x89; Wed, 21 Aug 2024 14:02:44 +1000 (AEST)
Date: Wed, 21 Aug 2024 13:44:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Hoover, Erich (Orion)" <erich.hoover@arcfield.com>
Cc: "devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Subject: Re: [EXTERNAL] Re: Array manipulation revisit
Message-ID: <ZsVimPRPGl-FX1Fs@zatzit.fritz.box>
References: <BN2P110MB1058FB69969C91282858C8ECF5B3A@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
 <Zq3QIVrmUTTc4gjC@zatzit>
 <BN2P110MB105818EC9B379BD63B261E20F5BEA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
 <ZrGIOi9eTBKsf_I1@zatzit.fritz.box>
 <BN2P110MB10581ACB77C1C26CC331650DF5BFA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KU0jI5/0hcVY8ym0"
Content-Disposition: inline
In-Reply-To: <BN2P110MB10581ACB77C1C26CC331650DF5BFA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>


--KU0jI5/0hcVY8ym0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2024 at 04:29:45PM +0000, Hoover, Erich (Orion) wrote:
> > From:=A0David Gibson
> > Sent:=A0Monday, August 5, 2024 8:19 PM
> > ...
> > > It seems like string arrays are the only complicated case,
> >=20
> > Not really.=A0 Mixed properties that have both integers and strings in
> > them get even worse.
>=20
> I was not thinking of this case, but if you want to handle this case in a=
n initial implementation I would suggest:
>    PROPERTY[1*5+s*1+4*0] =3D /bits/ 32 0x0;
> (skip five bytes, skip a string, replace first 32-bit array element)

Already a substantial increase in the complexity of the overlay-time
parser.

Now.. the case where the number of integers before the strings isn't
know at overlay creation time, but comes from a separate property..

My point here isn't so much that these are super useful cases of
themselves.  But just as the string array replacement seemed an easy
and obvious extension to you, there's a whole series of "easy and
obvious" additional steps beyond that lead to something of horrific
complexity.  So far I'm not seeing an obvious boundary to set to limit
the scope of this.

> > Those aren't common, but they exist.=A0 Or
> > properties that have a mixture of integer sizes - that's much more
> > common, since it can include 'reg', 'ranges' and 'interrupts'.
>=20
> You could do something similar to the above or, for simplicity, just coun=
t bytes:
>    PROPERTY[1*5] =3D /bits/ 32 0x0;
> (replace 32-bit value starting at fifth byte)

*If* you know the byte offset when you're creating the overlay, which
is not always the case.

> > ...
> > Ah, so you're suggesting putting those annotations in the property
> > name itself inside the dtbo.=A0 That's not a bad idea as encodings go.
>=20
> Yes, in this case I'm thinking that the dtbo needs to be handled by libfdt
> (or a similar tool) before being passed to the kernel.  Though the kernel
> could conceivably support something like this directly.
>=20
> > > For older utilities, or ones without the
> > > handling for this extra information, the utility generates an error
> > > or just adds a strangely named property that gets ignored (when I
> > > gave this a quick try by hex editing a DTBO, the kernel happily gave
> > > me a "gpio-line-names[s*148]").
> >=20
> > Right, but then you silently get output that wasn't what you expected
> > which can be nasty to debug.
>=20
> Well, libfdt does the right thing and generates an error.

Huh.  I didn't think we validated property names during overlay
application.  What error exactly is it?

> I would imagine
> that the version flag (or something similar) could be used to anger the
> kernel rather than creating strangely named properties.

That's harder than you'd think.  The version number is a dtb
construct, and as noted dtbo is a hack on top of that.  There's (alas)
no version number covering how overlay things are encoded in the dtb,
only for the low-level dtb encoding of properties and nodes.

> > ...
> > > Yeah, I understand why they did it the way they did - but it
> > > definitely makes this particular task harder.=A0 Some of our systems
> > > are incredibly storage-constrained,
> >
> > Well, that raises another issue: this would add a substantial amount
> > of code to libfdt, which is supposed to be runnable in very
> > constrained environments.
> > ...
>=20
> I did a quick prototype of the string case in dtmerge, for convenience, a=
nd it doesn't seem too bad to me:
> =3D=3D=3D
>         dtoverlay_debug("  +prop(%s)", prop_name);
>         prop_name_len =3D strlen(prop_name);
>         array =3D memchr(prop_name, '[', prop_name_len);
>         array_end =3D memchr(prop_name, ']', prop_name_len);
>         if (array && array_end && array_end - array >=3D 4 && array[2] =
=3D=3D '*')
>         {
>             if (array[1] !=3D 's')
>             {
>                 dtoverlay_error("  unhandled overlay array type: %s", pro=
p_name);
>                 err =3D -FDT_ERR_BADSTRUCTURE;
>                 break;
>             }
>             prop_name_local =3D malloc(prop_name_len);

Note that libfdt is designed to work in very constrained environments
and is not permitted to use an allocator (that's why there are all
those _namelen() variants).

>             strncpy(prop_name_local, prop_name, (array - prop_name));
>             prop_name =3D prop_name_local;
>         }
>         else if (array && array_end)
>         {
>             dtoverlay_error("  invalid overlay array: %s", prop_name);
>             err =3D -FDT_ERR_BADSTRUCTURE;

Hrm, that makes me think of another problem.  The more complex the
syntax allowed here, the more inadequate simple error return codes
become to communicate what's wrong, which is all we have in libfdt.

>             break;
>         }
>=20
>         if (array && array_end &&
>             ((target_prop =3D fdt_get_property_w(base_dtb->fdt, target_of=
f, prop_name, &target_len)) !=3D NULL) &&
>             (target_len > 0))
>         {
>             int before_len, after_len;
>             char *old_val, *new_val;
>             int array_element;
>             const char *p;
>=20
>             array_element =3D strtoul(&array[3], NULL, 10);
>             old_val =3D target_prop->data;
>             new_val =3D malloc(prop_len + target_len);
>             p =3D fdt_stringlist_get(base_dtb->fdt, target_off, prop_name=
, array_element, NULL);
>             if (!p)
>             {
>                 err =3D -FDT_ERR_NOTFOUND;
>                 break;
>             }
>             before_len =3D p - old_val;
>             p =3D fdt_stringlist_get(base_dtb->fdt, target_off, prop_name=
, array_element + 1, NULL);
>             after_len =3D (p ? target_len - (p - old_val) : 0);
>             memcpy(&new_val[0], old_val, before_len);
>             memcpy(&new_val[before_len], prop_val, prop_len);
>             memcpy(&new_val[before_len+prop_len], p, after_len);
>             err =3D fdt_setprop(base_dtb->fdt, target_off, prop_name, new=
_val, before_len + after_len + prop_len);
>             free(new_val);
>         }
>         else if ...
>=20
>         free(prop_name_local);
> =3D=3D=3D
>=20
> Do you consider something like this to be too much?  I feel like
> adding support for the integer array cases is pretty trivial, but if
> you're wanting to support mixed property types then the error
> checking on that would get pretty complicated.

Yes, it would :/.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--KU0jI5/0hcVY8ym0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbFYpgACgkQzQJF27ox
2GdkLA//bUPnKxbyMcqglG3bXpilvugGoRAfJ+ypM/1LQJCORhjDznUOAtG/kq/e
90gbLPuc9kyKn5KbmmGOFiWrDZKqnzei9FTf87Dk/Qr/KvsvHdp/1jmmC3kIg5JH
GCfLjDKT8wdHtWsSQgZfDXqMyxIUVJPcv67kwF/h7W0QY4l4hdfKn82zpVd9HNCT
s8aWeUmSSemH/6cSjUL9T5YMDrh2JRWef8vm64scqpAvgqS7ahoBkg71T7g/hHNg
JO1zcvZfObrwMF+moFDJhdiESNMeAbpoTsVQB58d/zxjEVST4dtNwukVPEetAp5Q
40pKkyO09j/knK3VSN3cGryGuK+Sgw895HiOpRWkmF7z2LVnEaaDIfyWI8YxG6zI
ibT/aqMkQ9r7SUJN8ZJj/EbVgr/kHtH0z7UyEg7/xqoIq8ypYcF+1n4sMHKcPrDh
xig+hRvNUiRPVo7tzPf6O3sfBERWFjRmhN1+HFJTRECE4pS+jP7ZR5KZ5Qj+Ug7s
LXflr+sgxmBY/m+j1mDM878LQWaFX2AJ6ltGMbNaCp3iIVn1drcS0knngfNJeBBH
FRlae2IIjsnC48CtYV2yav0Ofu78p0ZIL+e6chSXyNNMPgU5wxa7r0TOCCiIce2+
J1IoPWa5RwyC50XQRqwelP+4r1+I7+XimPts1NvX95H65ngvOq4=
=KfUC
-----END PGP SIGNATURE-----

--KU0jI5/0hcVY8ym0--
