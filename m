Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747094;
	b=EruTgjFHCPFfszGpBzeRndAKWuDEHjLRGnN6fPpsrbToB09HwyZbbdvCbpXJo/6S9NJm
	 UFXzWrvqz/ofmeHKGv8uSjKUMmFWRfF9VNY4gtWlHQgHM2SsfYC7pj4t7z7vexUTPY743
	 8W61t39mGCr7Fchj1LF9FynOlzOTMZZ+alzI1Iu3TqpsUnnwaPztqaXlTV8lj9hscy2Gt
	 AJugyI709pOm6l9xEMpHVv/8wI2I3wcXh1faniXWZq228nbOO9BVVbRG1aT0ZxuR56nxN
	 /HgLPb9aEgXXlSbnJgzxkdRF5b+Omu9LigeDdPzQeAlzTIPZ63dPO3KdIShD/VSongg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747094;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=kYXUByr3BLc+2HgC7p4Srmbc42zicxHZH+1OECSUT4I=;
	b=X7o90qhH9XqUT8cCI5gCkDsRaQ1BoxJIc/83JznNkjH4a2hywBCfSSOEgUx/egw0xmAu
	 2hEIIHpeIhK8k75N1VultTg/gjnSXBHkmjQB+FvGSiEZlsLbnk5RUs2CD3YKTyDklMOTg
	 qHBeatFXiWSVSNvZImdF81k6HChwXXTRy1Bj++7Izu3ctR70BXnMI/8dWRmCfWyfJIyP5
	 hIvGqbiaIIXEB5MMbyxA1B48KnNrl/OfKW4BdjzF1oPXZae2MGiwKv9AC+43pp+V/FBwC
	 OJDfYCl1dU7pJczb00Jf/XrLrSGZgj9Tlbjdoc6giYDkGMlC8iuP3esJhzE1ToYli2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=D8WJ27LN;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563F7606A321
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 02:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 563F7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=D8WJ27LN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795747086;
	bh=kYXUByr3BLc+2HgC7p4Srmbc42zicxHZH+1OECSUT4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8WJ27LN9/mhO6ElgGLDfGeuj2vBcipnobUGVmX0pG5p0WNb7uEeWogxUCzBgnRTG
	 JoOl/eg43sGrH6lYD3WQyuUEGOjZhK9HEJOUZcXyvlDTINk1nYMi/QzVeKp+TWD8cB
	 yKUTVv/7Qe3uA8SWbyQ13B8gPgBzKogM/CQb6Wj2a8hqIniC65hzAkafLpDnUDEDCT
	 9O5NnUik0e3sIZBeh9p7nDgsLMZnoB7rwAWHesa5yV5D0A1Iu42vhEpYzpAZB1zdp0
	 sMWOWDCv3vlXK9IU5ah4Sb1y6g8sVnl0HvU2MXCLVxlUCnx+5Ooix7t3L9EV6aRBnG
	 vYKFZonRb0/Bw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jbHdp13hXz4whv; Fri, 27 Nov 2026 13:38:06 +1100 (AEDT)
Date: Fri, 27 Nov 2026 13:26:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 09/10] dtc: Move labelled-reference handling out of
 the grammar
Message-ID: <awjqPMlbhWXZ77vE@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-10-sjg@chromium.org>
 <awZ-fxjHSD-ITpug@gractus.seuss>
 <CAFLszTgCr73DwJdmKjXTj9tXrPyPHCbGPE+d0vpcPOTgVYa-bQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="rvaeQOPLe88UZ3k8"
Content-Disposition: inline
In-Reply-To: <CAFLszTgCr73DwJdmKjXTj9tXrPyPHCbGPE+d0vpcPOTgVYa-bQ@mail.gmail.com>

--rvaeQOPLe88UZ3k8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:33:29PM -0600, Simon Glass wrote:
> Hi David,
>=20
> On 2026-11-25T06:21:52, David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > > + * it is not found. In both cases, the fragment becomes an overlay f=
ragment,
> > > + * unless it adds a label, since dtc cannot put a label on the targe=
t of an
> > > + * overlay fragment.
> >
> > This doesn't seem quite right.  It looks like we ignore the label in
> > that case, whereas we should throw an error, since we can't create a
> > dtbo which does what was requested.
>=20
> The label isn't ignored. A source layer which adds a label is merged
> into the plugin's own tree, so if the node is not there, dtc reports an
> error. For example, in a plugin:
>=20
>     newlabel: &nosuchnode { ... };

Oh, sorry, I missed that.

> gives 'Label or path nosuchnode not found', and the same for a path.
> But the comment gave the wrong impression, so I'll change it to say
> that this is an error, with a new patch adds a test for both cases.

Thanks.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--rvaeQOPLe88UZ3k8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsI6jwACgkQzQJF27ox
2Gfw7g/9FJuXKaPOtdwwTzPn6ExhDfXMcCuN2qmoGbi7z2nbltXUouLsu9A6l8vd
JDC/Y/faKpHY8sqSJtDibJwwyPsFSxcoJnVqMOnuRy85TAYXtGSsSYQZf/BSJoHV
CGdYoo7Du/rSNDpci3uFlKeuAL5u5AREMDOGRVIwpW9Izzx7UXAFMSyU8FhuXj5S
pbvte6e3JebJPNrsf09aXC3KgTYt+IU00daG/zA88/IxhQ3ZObHUs7KDfMKDGXHW
/dyCHVD/gsREDSITqtQkQXV/2s35jn43vaz6Lz4Zpij1aEqPgmn61zRF35Vm6ESr
3cePr1Zq7vWDeqaxWIBR+5g1QPYG/lixD65CSzpWFFSBDMfLyp647u8oyhtTufMn
mYzZpYlrO8lqdL7E7K1p/+Mo4nv7dWojzIIvKWVO7J+rLzN512CfaE4SYXzBPXzu
kYEJhAWzcS9XvdtM5mK5U2k+9fIpyxx2Nyn8+kXXYRmFM13djEbyPzcpuUZpgudF
DHRNg3Tk/ob6wgxz5UC0OBxor5qtYGgj9/FoBHpW9otIN+/aKRoPNwAKOkqKQj5P
mtoF/ja9SsEKGDnDto6IWzzG7ch97RE5C6vjaNeQPQQbvGpXo3jxAzBfcgO7c84+
/xURqPaizWN19PmqA6o2h9jkxrmB8w5FFIME0NwQbIOv7MR4Quw=
=NLaE
-----END PGP SIGNATURE-----

--rvaeQOPLe88UZ3k8--
