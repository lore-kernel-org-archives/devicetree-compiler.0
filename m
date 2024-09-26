Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52701741C6
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Sep 2024 03:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727322798; cv=none; b=VY5v+Tl0e81hOyxa3tcYDNFTrtyZWjbr1Btv/doCe3P04qoeKrEz3pWbY8VxoKLu8F3bN6eWDbDfVCixT6sMYXO2vrfq3q/8/I3Zux0i5VCbF3MDamsbfHpCCd9ennT9ULhYXmQSLAg1fxCzAwUXcubhqae1rmIf/ewuOBzCt7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727322798; c=relaxed/simple;
	bh=3fK5GC7Mw9TiE3LYEiCg54uSAH1uL2Z20f9ukyyXJnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGh+erY24bh16KOGOPFXAkRu83zEH+mY1P6hdwUvG88azJkg037yjoqXY7SRBFZXSRE4PqkPnFRZwEux6dTB5ep5FVWl2TkvIhsmbvLP6ubwtKrbDhiuhhNLNNt48fY3GOYWxfNgrpP0FQkLMugvePKSTPIfzpnsW4RUXU13tog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=aoAdkNFe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="aoAdkNFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1727322784;
	bh=dgH+192YMHGb8R6XH8k8OsnciTFsM8lrB0XsevViv3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aoAdkNFeraeB2RNLLzGOESNHoBj5CLZ20wUMM3B4Q0hdovWZFmVW/fcHEBejMaDz9
	 PTqQ0HfM5yiJQ8aBrofqGd8elH6Hm4wgR+0VfegJ05aaWneMh59QHlE3vOYZ6fuZjq
	 zbPlUncQXQQxDTLoDU5H7Oqdw0M03DwfkFgDKANzNtRE11CaplodUZSVcpaGu69hel
	 XyJCRMqnll0LemVWTz739Aus3AdhODgIgvTXT7fjWK0d7JXVex4ybnl3l3uL88U+ql
	 8lDjul47LxPnYFxz6a8pyiEtbZ/Ea+kt51uBFojxPwfaMe+Vg+gw+odiXaCt2nYXMp
	 ylzQbs0TlHT8w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XDfnr5WHTz4x7X; Thu, 26 Sep 2024 13:53:04 +1000 (AEST)
Date: Thu, 26 Sep 2024 13:51:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ayush Singh <ayush@beagleboard.org>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>, Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Message-ID: <ZvTaQRupx1cG9fyE@zatzit.fritz.box>
References: <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
 <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
 <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box>
 <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
 <Zuo8yWrRPGcqnEwN@zatzit.fritz.box>
 <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>
 <ZvDjW7W1096FW8XL@zatzit.fritz.box>
 <99c2b16b-a9bc-4808-966c-96b60889876f@beagleboard.org>
 <ZvO7iUv06vxIvdpX@zatzit.fritz.box>
 <CAMuHMdVMFP_pNPEvi1n_CnUTXZ9SBk3G0o7cn6i3iQtca0G8kA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZQRzkqWsl8eraxnV"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVMFP_pNPEvi1n_CnUTXZ9SBk3G0o7cn6i3iQtca0G8kA@mail.gmail.com>


--ZQRzkqWsl8eraxnV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 09:58:06AM +0200, Geert Uytterhoeven wrote:
> On Wed, Sep 25, 2024 at 9:28=E2=80=AFAM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> > On Tue, Sep 24, 2024 at 12:11:36PM +0530, Ayush Singh wrote:
> > > On 9/23/24 09:11, David Gibson wrote:
> > > > The old "connector binding" proposals I was describing aimed to
> > > > decouple the type of the connector from the instance of the connect=
or
> > > > for exactly this sort of case.
> > >
> > > Do you have a link to the "connector binding" proposal you are mentio=
ning
> > > here? I really believe having a better way to support such connectors=
 is
> > > really important for embedded systems. And I am okay with adding any =
missing
> > > bits to make it a reality.
> > >
> > > With `PREEMPT_RT` patches being merged, it is probably a good time to
> > > improve embedded linux.
> >
> > I don't think there was ever a proposal written up as such.  It was
> > just an idea floating around the mailing lists.  I did manage to dig
> > up what were meant to be some illustrative examples of the idea.
> > Alas, without any explanatory notes.  It was last modified in 2016,
> > but let's see what I can remember in terms of context.  Note that all
> > of the below was a quick draft - it would certainly need polish and
> > all syntax is negotiable.  In particular the use of the /plugin/
> > keyword might not be compatible with its current use for overlays, so
> > that would probably need changing.
> >
> >
> > The idea is that a base board could define specific "connectors",
> > which could describe what buses / pins / interrupts / whatever were
> > exposed on that connector.  Each connector instance had some local
> > aliases referencing the nodes in the base board the connector could
> > alter.
>=20
> Several people are working on things related to this.
> Please have a look at https://lpc.events/event/18/contributions/1696/.
> I don't know the video is online yet.

Ayush linked to that earlier in the thread.  AFAICT it still seems to
be focussing on using overlays in their existing formulation, rather
than redesigning the plugin mechanism.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ZQRzkqWsl8eraxnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmb02kAACgkQzQJF27ox
2Ge8IQ//R9bAHB2WNCN0b7oaNIh1otWk8WNm6xWqfTTR7DtgePZeLdoQg01/aZe4
DLz8Wae91UF0mFyNhZgUdLhzVK8PPQQnpyuIIcqp3IjhmclGVUHFbFMuScTcgQEK
6KyyvELPGhGedwXP0YrydQHKrKmHZ4vcil6zOmwEUMizzBLIx7hyQBrMOf3YnvSk
xI/w1zfqQ2uGqk/lEuJJKdm/9J7ZIXU+uXvOnC5jy9Do45TTi2LI6b6IZxJuPBD+
mT265EsWdytfLTHLmS5Oo2nmCr5roGCBmMRnSIkUVvLW55aFYJWCvtMREoE6JeHn
cQtJ9tyOB2xraEG/lz3zweQoNxqJ0/TThFDrufIdieytHc0Z1a0cWCRXxfSJ2guO
cTyS/JKwVgB2xrVubt1eax9xqzTudIg+Bwvr6KAfc4fOs0BEbreBm7573R8u8nxq
nkyv/Nb/9/LWmHqmRquUIuxvc0m5nM+WowBygpNfhhb6+Yh6AEtv0V3YrvEC3Ydu
KHDof8Oz6as780wBYfnZlmIYKvlrU41g9OncQJqh2x50XoW/hdKFFfnwc3E1RKXu
aTn4wOXzilvQYRjJI5XuFDFAtrXmZ5bXf6J5Iwn6s48GpNy73iFqwFkGf9Qq4/MN
0uPqtPU6htAE1XjotlVcEgHMrWi1YEXagphgiEkHBaQvWncOvto=
=kQu3
-----END PGP SIGNATURE-----

--ZQRzkqWsl8eraxnV--
