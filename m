Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34747F9
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Dec 2024 00:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733272576; cv=none; b=EB72mUAP26D15M6qJ6WbnmRUa4ikLB3WGxHiUC2CEZWsTvdwpuAV+Fc8BPIEfeU5dLcpqs4bX8rrE/LfChQXZwWDeAI9cJF/wcreBk4R+pYjAB4BJdEIjRwskcrb++7MQydkr9CvCR03ZHPvgBHVwyq4uJE7tT3zYHRog29uQUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733272576; c=relaxed/simple;
	bh=jjGsl9WnYalwsd1c2pVW6RIvKi3GCKvXZ1eZwYA4m0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZO240pHWWn3HSy/DaX/l3SAk7QYy4V3QGj56cydml7z8bJgBODUkuofmjUeMKHKTNagfF2grjPbyKnKgr/2JyT7wH4JGMum1qe6tlM6Sg6F/s+M2+sjqHY648TyxWXgiOWKe3XOwfJe1SGiwkRd0O2svbYrsnWHd95ptQPw5M4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=cAHOUBCi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="cAHOUBCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733272569;
	bh=Fy0L/V+NmOI1K0RJKtr2Ia1vIVxR5THGDLP2pBYfPQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAHOUBCiH6Y93IfAAdidWysQhtr0JGUPTd8XfQ0kIjAXzjSQ8EuwICHsZI82xTE54
	 arf8Z9XT7PnnSk5ug12A7uU6jsvHkseZPF8XNtfx9GX1VD9wx+FT+rMCtqLK2UvBcA
	 eUb/gsyreF5g+m8hWc4VoeOxDWH3M9uh1duPF4oFwDxvFEXERrqE4SHFCvwmNm47en
	 CBoAJdMzvKJtbUwEwoLBrCwAPFZ0nlMEFIvn9nek/FOdY6zSWGu8b857lmZvASLL7s
	 KgtP2TeJV8b66THBcIP/TET/crQoBStB4LWkG/2LeBce+HwZlc7tSXu7xO6Uo+xxUL
	 HOmV3wjHhrPDQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y2z8n3YcJz4xf7; Wed,  4 Dec 2024 11:36:09 +1100 (AEDT)
Date: Wed, 4 Dec 2024 11:36:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>, Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/5] dtc: Allow path fixups in overlays
Message-ID: <Z0-j8MB89aLHG5RI@zatzit>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-1-ac3e121359e9@beagleboard.org>
 <Z06GPpmkDEPU1XUP@zatzit>
 <b34fa351-ba29-4e40-8ffa-69d40cdbb3c4@beagleboard.org>
 <CAMuHMdXDC+VPD1i=hONCJbzCXtLLoJiy7E09TdvKse18F6wnhQ@mail.gmail.com>
 <913f7185-78f5-4ce8-b518-8272888321c9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WSYd9ZPzI/FEBU5K"
Content-Disposition: inline
In-Reply-To: <913f7185-78f5-4ce8-b518-8272888321c9@beagleboard.org>


--WSYd9ZPzI/FEBU5K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 02:14:46PM +0530, Ayush Singh wrote:
> On 03/12/24 13:44, Geert Uytterhoeven wrote:
> > Hi Ayush,
> >=20
> > On Tue, Dec 3, 2024 at 8:29=E2=80=AFAM Ayush Singh <ayush@beagleboard.o=
rg> wrote:
> > > On 03/12/24 09:47, David Gibson wrote:
> > > > On Sat, Nov 16, 2024 at 08:30:19PM +0530, Ayush Singh wrote:
> > > > > --- a/livetree.c
> > > > > +++ b/livetree.c
> > > > > @@ -908,6 +908,13 @@ static bool any_fixup_tree(struct dt_info *d=
ti, struct node *node)
> > > > >                       if (!get_node_by_ref(dti->dt, m->ref))
> > > > >                               return true;
> > > > >               }
> > > > > +            m =3D prop->val.markers;
> > > > > +            for_each_marker_of_type(m, REF_PATH)
> > > > > +            {
> > > >=20
> > > > Opening brace goes on the same line as the for_each()
> > > >=20
> > > > > +                    if (m->ref) {
> > > >=20
> > > >=20
> > > > As for phandle references, you don't need to emit a fixup if the
> > > > reference can be resolved within the current tree, so you want a
> > > > get_node_by_ref() before returning true.
> > > >=20
> > > > > +                            return true;
> > > > > +                    }
> > > >=20
> > > > No braces around single statements in dtc style.
> > >=20
> > > Is there any clang-format config or something for dtc? I am currently
> > > using the format config from Linux kernel.
> >=20
> > The above are the same rules as the Linux kernel style rules?
> >=20
> > Gr{oetje,eeting}s,
> >=20
> >                          Geert
> >=20
>=20
> My bad, I should have put the response on some other line. I was just ask=
ing
> if it would be fine to use configs from linux kernel from my next patch
> series since dtc does not seem to have one in it's tree.
>=20
> I was not using any format and checkpatch config right now.

I'd be happy to look at a patch adding clang format config to the dtc
tree (you can use the kernel one as a starting point).

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--WSYd9ZPzI/FEBU5K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdPo+8ACgkQzQJF27ox
2GeFbQ//WZ6k8f11TqlBydD5R9hys0lwem6yHSalnexIbGjFkOt0L4OZ3eJgemaT
Lflg7vB7TPbg7CnGDsO0/1kAqMEppuqKYDh0yGt3FFwOedMkcb6Y+bvqwpJnsJ7S
sQ7K1ujoFPsVTMEaotoOyztyQMVLEJkzmYqN27kcVNf91Y327vFpzIZuWW/g/Qvk
UNEt7zeq8hJMOu+Wq004t95f8ueQFO0r7MAXc8YVwpMHmAv9Wr01ZhwaEfu8Df0Z
y1g1Bfqv5nABw89ZNvqvLVzz9/tmlooaHs775vXrA+HJzUHATrxGDOnjK4V4zMTa
sAMDepN7SVil3pfmUjz6lrsh/Qa3LhT2H9kbZQ8PSBrgjYteoPCiaDceU4fIrl3h
UtIZIRxCyslD6qLah5B6YBmXRCOKPF7F8ykbpe1fqCKSq6l7fvAHqoBvMdxZKEwj
3yFAA75blGu82nmlfR/n+vqEK93QiqFTGBHAG77smpJV/gei6SuNlAXoZ6B9HOh3
WCx6+bKSQcHaD1aJDkgHK7JV2VcT0D8c4Ss7uFJnfHKF5m03KqJBCPTyT6L85Ne8
PNhEOVk87aJmMIzg6/Lyw9DOA/6eSpxlrskbUR5hGaiKCwUv3M6mgyFuR94DLsnT
KgWHzu6E6tVN9qRhplmQrDIzu+GjqvleDnr6QaGoNz5o2gFsycU=
=ZutH
-----END PGP SIGNATURE-----

--WSYd9ZPzI/FEBU5K--
