Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785683;
	b=tcLbsrcItFXG80gOjDANMzxdp4Hd9kOeEBaX+xxzFiMFsnZRU3juK6xYYflLyFJ62o3E
	 Ro0PrsBN4xqI6exHtsZnJw6qS/TrqNTf5HO8YasqbfxLTVmlK7rjtsrz/xlZuwqaC3f9I
	 IsWTjuoNN6PmOOchIosobL/+RFiZ0sq3pZk9eAl/yiah14f++CamswftQsLxkX+m+dAGA
	 SY0QIswEQQq2Fb4CwDRWx69cps+HmINCmYXTKXUclytC0YCXr0LuQMFfbrT2w3u51SVSm
	 TFsmHU6G/BFKidheKeSpuADwjXUKBG+v9ztZpM/Wsp3l8WuruEpW5kk43Q4vLgoYG0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785683;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=dGDxoM3fORDhZl43hvRWbA1eXFHwl4jIcHbloHDq+Qo=;
	b=ibWI91IXDTMQkfBcUvnH8v/p4UpJ1eqqrJSzKVx4axhPJLL6nsLQBGnzdF4vGmMwu19/
	 jbPn3RLywdQXLk+vvhiAKElxx+Fj6URYM5T8c85JLT/MbRjwGI9COjgd4HOy1QWbWg5Xl
	 CDzXg5abcK9GJRtsABGLKgYDxTNXH+IMLxSdXG3XTwwxtsUm8c7R4mRbxRSK3q5NIJ3zO
	 dEtaonQJlpkgZMcmqtLOv9usFCPuf5J902THh4FtU8nHYTTw+Mud9pal5/iv7kdvjTTGd
	 TtzSgniBFNepxuy4o0gGLUdzb5q7AYpd5tcklB/VSaQFK+74Mu38aBcvU47IJU63obQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87238606A328
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 09:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87238606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793785672;
	bh=dGDxoM3fORDhZl43hvRWbA1eXFHwl4jIcHbloHDq+Qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bza85njBoJEil6G85XwuYOUrHkEMWxT96wSqMxKgv7hfBgSYDwSmoXYlzSK/3D9fi
	 R+dAbuU+5dsnljlINU1LgAlvHNdLIFM4vbvefCHlgEb9mW5R5xibugEferGA+2Xuyw
	 Hzhx8eT80F9y3KXDnV4+NeTU63LfqygOLMHXrWQmnyBdwoSGtZc+IMK/fqFaOGqKxm
	 VNshfFZvdAKnn9bvEMuBdWAc6hhJMW9cHjGzumkKO5GJSVEByF1FQVMRTzyR62klSt
	 VbXkBNR9DF9Pqi0gtHZYZoJxwO517BIcjtX4Vs5W2DOihtOLK8k87AG20vBmRVIry9
	 8KztD54dwN+gg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jKLGJ6yNZz4w1R; Wed, 04 Nov 2026 20:47:52 +1100 (AEDT)
Date: Wed, 4 Nov 2026 20:47:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 13/13] dtc: Merge the fragments of a dts file in main()
Message-ID: <aur_KYarRUgenElv@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-14-sjg@chromium.org>
 <20261103180803.416e25c7@bootlin.com>
 <aurV_EO8OpYad26x@gractus.seuss>
 <20261104094055.2ca24664@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="KevxQfnSH/SruAMC"
Content-Disposition: inline
In-Reply-To: <20261104094055.2ca24664@bootlin.com>

--KevxQfnSH/SruAMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 09:40:55AM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Wed, 4 Nov 2026 17:51:41 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Tue, Nov 03, 2026 at 06:08:03PM +0100, Herve Codina wrote:
> > > On Sun,  1 Nov 2026 09:37:07 -0700
> > > Simon Glass <sjg@chromium.org> wrote:
> > >  =20
> > > > We would like to run checks on each fragment of a dts file before i=
t is
> > > > merged, but that requires dt_from_source() to return the fragments
> > > > unmerged, so that main() can decide what to do with them. At present
> > > > they are merged at the end of the parse. =20
> > >=20
> > > Why running checks on each fragment instead of the dt where fragments=
 are
> > > merged ? =20
> >=20
> > This is part of the aim of the series.  Some checks make sense on an
> > individual fragment, others don't.  Allowing both kinds lets us
> > address several longstanding problems.
> >=20
>=20
> To clarify this point, what kind of checks for individual fragment?

As many as we can, eventually.  Anything that doesn't rely on whole
tree context is a candidate.  This means
  a) they'll be checked sensibly for dtbo output where we don't have
     all the information to perform checks that rely on the broader
     tree context
  b) they'll catch logically incorrect things, even if they're later
     overwritten by something

Initially the most important ones to run before merge are the
structural ones like duplicate_*_names, node_name_not_empty,
node_name_format.  The duplicate ones in particular means we enable
consistent behaviour w.r.t. overwriting nodes between the first
fragment and later fragments in the file.


In fact, thinking about it, before the merge should eventually be the
default place to run tests.  So the question is more, which checks
should be deferred until after the merge (and therefore not be run at
all for dtbo output).  Obviously anything that needs to look up an
absolute path has to go after the merge.  Things that look up phanles
are a tricky intermediate case.  Potentially those can work before
merge, but only if they search for labels rather than actual phandles.

> What kind of longstanding problems?

The biggest one, that I'm hoping this series will address is the fact
that we don't have consistent behaviour if a node or property name is
repeated between the first fragment (it generates a check failure) and
later fragments (it silently overwrites).  But there have also been
various reports about false positives from checks when they run on
/plugin/ files, because the partial tree just doesn't have the
information needed to properly complete the check.  Having different
sets of checks before and after merge is the clearerst way I can see
to properly handle those false positives, while still checking as much
as we can for a dtbo.
=20
> Can you give me details about them?
>=20
> Maybe I've faced some of them in the support for addons implementation.

That's possible, yes.  Or you might yet face them in addons.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--KevxQfnSH/SruAMC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrq/zoACgkQzQJF27ox
2GfgCw//V9ZPzPgXsaX0XQAOoztAWwXZur6RMRgHN2TQW6BdXv9ShmJfrXWPOXFK
CzI3bb0CwKVIV4uxNrMxwv5e8oITGOGvLwK8Keg0wH0ESfI5QwYNJA3X5+xyZYEZ
mg1LErycTd6qtX/RSBkmipuGhpGaGeqQD+iuJPd9Bu4Q//SU/cJfhNWeOj7BhkTe
RiUQkTdY4j54qr6BqXPndQxKBfpYtXvzz7TEoUhYGtOkNrLMeePCpIGOWEbl+gtR
BcNOkzgbxPV2HeUwhjHvqcEjzpg1DsuD/klkBR7tij3bBOLVKzcjQmqpkTDL5LqG
aaR8Io8QnJEs6t4eCYWxYGW06diYCM5GpEhNQhQI7tfdSk4hCzFi057H2bbvSDho
209iW5oYsyx/5j5wW7U2ab05mI1FbyuIrFKj+96KMklNlbE5p9JFTGG9hMHIY6sL
pAb7cn9zRdXnPsvL5p/MTBSCn2pndB7PybnPQ+q0SracO5RTVMTCjQIu4+i3gHhA
go48EAAMnn199Fr7/f5ybNsHstvCv2/MCsYjcHn/GCJ5zJXhLCbY6BfF/9Fij3Tc
y739NEgrXZgrUSFs4qTjghWiyp9Pw0TXne8igCDLt1GNse8pkz91uwYPFFk4N9Rt
U/wI+yu6N9ts9dH9M46HoWwN4OZCnfF158tDGm1F7AvpVFfUzQs=
=Af+u
-----END PGP SIGNATURE-----

--KevxQfnSH/SruAMC--
