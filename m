Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5965533B6D4
	for <devicetree-compiler@vger.kernel.org>; Fri, 16 Jan 2026 02:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768531936; cv=none; b=m/QrqkMb2R2KQK1awSs6uf+8QNMeYROVE0eZcKiNUmNOIcQDMwPVQUr+2Pwi+EeII5CqTXOyPfYkbGIVKb6lsdl30EQudDRG9/IVkJv88lTfFnftOkofPvmCyX/FzNHpxx4whXI7Hd7sleM/wdzQUcf2wkMOTIE2mwy6oPsao3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768531936; c=relaxed/simple;
	bh=lBj570NhwqL4xgpvpaHXFxMRKb6s5nD8xPd/O4t6wmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajZHtmmkZPDXZ3ZCdoYNBJGkC1w1IGSbR1i+QKbcrNvRUsStTjVow7DvY4ZxNjUiuweAyxGftF08xgFXXlpGaWizpF5g4fAT0us5weX5YNYLep+CCI9Bvl5XT2Ib9PQ1n0qQW+5Tb9UaTzRrRjkZeMeQSkzL613f8107o8xRAic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=KL8MORtI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="KL8MORtI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768531920;
	bh=W/apTlVrwp3FKVv6iywSNNODK79BsZhOK3i1alETWhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KL8MORtIB0iV1qBjU7a6GqWo1ECHZFxdhKQ5EIzxXFjQsGNYzhhC1EzaVXwd60fNX
	 +wOtPG+F5odYDHxyyGly/ukeDkfmaQF62SGRHZhCqx9POHDj9AmvU56pUvUcdZXLk7
	 pt3csdwVWVt2T18Twrv2+WCBj/xVpGBIPqIBKv0VuD3UaYlhFSJgmXPTHqPNQi7HvI
	 k7U/V8aKM+v+BdVNJhEfAcwIdlkgsKe4XeiGvEyXvRpFEahUFMsxXcziTmNQ+M/dqM
	 c0PAmVXIGm2o9Gu+w/XJlKB6fiVf6MY92IPIWvZXOFR4L52iAxQY7WjhBlrlwGs+k+
	 W8/Upq+HDvKZA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsksD1Ffrz4wDN; Fri, 16 Jan 2026 13:52:00 +1100 (AEDT)
Date: Fri, 16 Jan 2026 13:51:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Restore phandles from binary representations
Message-ID: <aWmnvqH9G6K3mkEm@zatzit>
References: <20250919092912.663304-8-u.kleine-koenig@baylibre.com>
 <khp2b262g5iyp27z5aancaaffbn7j3dqwja5mywftnwmmuzten@35jd5sodbho6>
 <aTZuGaccu-WDN6Ny@zatzit>
 <wm4ot5mmlflj4jrg2f4z57rlcfcjhrdws43l4ewgjpikzqwizh@napkquii4krl>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RkYZp3gd4TdrA7+5"
Content-Disposition: inline
In-Reply-To: <wm4ot5mmlflj4jrg2f4z57rlcfcjhrdws43l4ewgjpikzqwizh@napkquii4krl>


--RkYZp3gd4TdrA7+5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2025 at 08:57:59AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello David,
>=20
> On Mon, Dec 08, 2025 at 05:20:09PM +1100, David Gibson wrote:
> > On Fri, Dec 05, 2025 at 04:43:43PM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Fri, Sep 19, 2025 at 11:29:13AM +0200, Uwe Kleine-K=F6nig wrote:
> > > > the motivation is to improve the result when compiling from dtb to =
dts.
> > > > By restoring the labels and phandles the noise in the output of dtd=
iff
> > > > is considerably reduced in many cases.
> > > >=20
> > > > This is v2 of the series. (Implicit) v1 can be found at
> > > > https://lore.kernel.org/devicetree-compiler/cover.1755692822.git.u.=
kleine-koenig@baylibre.com
> > > > . The only change is an added return statement in an error case tha=
t i
> > > > missed to add. Thanks to David who spotted that.
> > >=20
> > > I wonder if you have this series still on your radar.
> >=20
> > Theoretically, yes.  Finding time to look as been.. challenging :(.
>=20
> OK, now that I know that it's not forgotten, I can be patient. I know
> the time phases where it's hardly possible to care for the non-paid
> duties.

Merged!

Sorry it's taken so long.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--RkYZp3gd4TdrA7+5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlpp70ACgkQzQJF27ox
2GdwRg/+LTOGy4QFnPz4uzhc5RPhd+XIYj5yr6gZEF7TK3CLNNsmLVU6+FXj88Ih
0B3N4h7i3jZEt0WLZ5Pl3LDQmSg5fQjT2HXCXfYM98CiMPTzn22cE1j+g3FsdVMO
k5CC4eEWi1sKDkBu7EQ1KOcU6nVP2pE0q9t60G9Eg16m8BFmDlNnaJuGtxyqzvZZ
WdhldThNiFjbJ0bTlADNR/rM3Ng1WOA5RY/mXbCrdCx23jSowmr1lFWQz6fEjh/h
cXZFLEN/Ib3l95sL93P0SQ60xkCjqEZNkWlyyQnPVmOuLt93Pe0VvAD1bTLJZAFA
P6lHSM3F7wMDZMrBhy3olGVSLKGn3kt2+tx8A8UCHTwk2H5kngTIGpTMdzbOLLMr
WbhxU5K3RT6q2d4BeLndQFIP+K1ZMRmKdk1iZjlXYmfd+VInJYLUsKKP930+5JG8
Cz+my3ywy8scxRnIkzWAatH+DqMIWZPjlEihyL3/9uHphjccvOisskl5ky9bSpiC
9++TDE2YdirzfJON5BOw2AQ0qSVFbXhHs1HAf24x6wMekdgR3IBROEAMYpKFPMov
HJjMaz2ope9xJ/gy8LIA3+48d8pKUKoyZ25o7MA4PYS3Di3unKOA0vVqSPmbW47B
IjbUNUwIVqJt+qM+Z6DKUKEAVU6wqF8qDy6LhYaOvOK6SwS3LdA=
=LH9k
-----END PGP SIGNATURE-----

--RkYZp3gd4TdrA7+5--
