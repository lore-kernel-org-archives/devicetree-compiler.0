Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EF5BA3D;
	Tue, 17 Sep 2024 01:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726536246; cv=none; b=aJooKVEnvF1uzBKnl2fUCU1iQPJq0YNidstyqsaORQyjvYi8dlisxDmzUE6u7h1nJp5/QgjT/8O+CfnrqfgYyUwb1PeHwSIxbCYirTqhnQPfi/ZNx+iIyWmKidvVWBy7/3TVTnRhRL1JGpjfup+NqSdyI+IqkFklgwDvH5amDSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726536246; c=relaxed/simple;
	bh=Np3GozIbbmB22mZE3U5ucWcm5gxvv6ogmixGDDZ0MnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oliWkBr3tnIx10y6KOOqKkYUc8lSDo+VMwLWDkgVTTi8px6brWaW8cnUUqLStTy4SeE5azgJ1KXhMS91mfwQjNnTkJMr7KkfCHem+kRTtQThQEzu5oOzBe9PbcqENooCiEWOBpijmwX/eYXAuk/td99Anr0FVPwrRTLY7ipvkJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=BO6Kq4VJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="BO6Kq4VJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1726536241;
	bh=keLfVWBBeJtBd1mdj89pwrb9qSeWWE/FkBEDS8LpSrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BO6Kq4VJ9LJrXEFgSeHBS5mEyyyzd7MPMfad6+Qk4sfSy3PfEHg/46h8kcnOFD44Y
	 J7geojQtarwGWPnmc1I5v9EGEK03TQinPbLkj75KaIggq1rU4XdqS+u/SlvvQ+Bgkf
	 p+BaU/AdzFFo9+GOqEwKd/QVTO4bpd+h4DnDx8wKBPHhcbmRrmVtiyJa395w4DREfR
	 EOFEitTAK9WbzCF3IxJy0Ddpnu2JFjMoxsfAMgME7oPnYUKw5q01YnH1fzSnuzmZ+w
	 /HLspRY8jZZIIISoSAeziJsMhd2abxrg1PGW+CNIGUKaeqH7wFX0IFXw+yFan/Ht6L
	 VQ+vTmsMXCG6w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4X73w10bNkz4xZg; Tue, 17 Sep 2024 11:24:01 +1000 (AEST)
Date: Tue, 17 Sep 2024 10:17:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: Device Tree Compiler v1.7.1
Message-ID: <ZujKoLT9VBHATtyP@zatzit.fritz.box>
References: <ZsBvsq5pVv9xEPmp@zatzit>
 <CAL_Jsq+P6j70L=Sr=a5cBrGEMswZN0fYdaeOeDxGFG-VJgWNbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TARbBD0HUiIwQt3A"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+P6j70L=Sr=a5cBrGEMswZN0fYdaeOeDxGFG-VJgWNbg@mail.gmail.com>


--TARbBD0HUiIwQt3A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 02:45:23PM -0500, Rob Herring wrote:
> On Sat, Aug 17, 2024 at 4:39=E2=80=AFAM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > Rob Herring pointed out it's been a year and a half since the last dtc
> > release.  There haven't actually been any headline changes since then,
> > but there has been a steady stream of small updates.  So, I've rolled
> > up a new release.
> >
> > As usual, the git tree can be had from:
> >         git://git.kernel.org/pub/scm/utils/dtc/dtc.git
> > and tarballs can be had from:
> >         https://mirrors.edge.kernel.org/pub/software/utils/dtc/
>=20
> The tarballs are there, but it doesn't look like you pushed the tag
> to git repo.

Oops, sorry.  FIxed now.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--TARbBD0HUiIwQt3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmboypAACgkQzQJF27ox
2GdVXw//SDXS/vTEC5C6oA13+0H7u0OgBBHJE94SfcMqvoAy++cCsK0CdQa51Ewb
ET4nbdkUVV+H2cOK3l7NoUma0CBnpcfM4aNcn84jMNWk3uHVpMvR4FXU9C/3mbPb
uQ4IqqrU3IWnoDxq73A8FnELM0n/1/vmLGfdDeRD/vnoyzQ71GnWQewLqu+A5qyT
ouRxaOynk3+eTdcJ8zx8H0J76qMLYp7J/ELffGqyG9Sfd+diy7XrFc1zPuUsK6Pt
AoREpuAV4brIo5Yw2vr2BKy7k/6JM9wPz+zQpZS1aa8Bh2zUPNR6eed6GvdSEOkl
byTKCNKMsnqVde7IGWMzw/5yZ5xGKBXSfADzDyM9Wel1RAD+QKZcn4fAjtNKzycN
3A7xRIFdcetixkVgedGKELvk7iqf6FUyd1dRe+Uwg3wZ9gFSehcCiQ2njpkhfEHo
0MhqJJbzM+A0GUQJR1RonmMMDLY+OQP4+xznLlFYJBUGE6lyfEcLKIPIxkOa62E8
2+kuw55TOowQXNO6J0KF58YbAuwC+ujGGdJojh+Hi1rUecmyRo2NilsTw3IVbmE/
a4zRrYIThmcMbyxSBaAfWesoakMjUPVR+NvSzpgAP8SbVpPjhtzniThoB8Xk6qj6
0LXv9YfaVmdu+dXHeEy1YUl/NP4qjpMEOw1wPt/SabBIHXnW+yM=
=WjPI
-----END PGP SIGNATURE-----

--TARbBD0HUiIwQt3A--
