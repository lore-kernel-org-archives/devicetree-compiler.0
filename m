Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747094;
	b=z3RDAZI80cXCVIwbDqvdj7+w6SX06rmOh7HXycS4PhAbzF1FTRfIHiW4c/MyyXpXVqtB
	 gcQeS/0AMhCBeO1hYuDniKoVP8J0bjq6+eG9fICOPsH1eP66Njmqw4BaOsiD/mUFx7Kj1
	 pbNio1dUrPQVqdfmPciimMsu8ICG3A0crNda/TKPGLEcRE3LPOMd+N+lsRKwATCDsA7Aq
	 GyD3a/2N2htMtwLO/5nYLLLCikVwh21NDLA6Ob2Acj6/TXuw3PJnXEgMzwpDDBgwj7Z2/
	 5wwYdZMMJk7ZVe6D3uHCogSP7bLSDgTqugR6se/vm/FFKny+hayEWiGMjAe9jVtsFeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747094;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=AHaLI/I20jTly3x9u8UqnizsvOZjx3OYsVBv2xG+hPo=;
	b=xmCXz7gEdeQII7CxVggQrQTmRA3YlU82rptC0xEgvp29lTHisHy52tpeshQL2TyhLj8/
	 gGVuPK2Uw8T7Cc2ks63I37kgCEB5Y0S/Hi7vZPhWPvHvsEhOvPduNI7r+CTh/bH5l/I9t
	 45ylo5obIrvzR1PRzDkT/PstKvcBwyiN1Lku1YJRYl8xLwhftFdV2pdwtK2EuvjXkpTKK
	 f5YBb5Ai5lmL287zSputeuhRKlXh79jyviqgY8DVjir/KegIWopPaksYXnmQx0wWKeTG9
	 CFtCFMkvMTndO4B8upVDemKYq4ryX2xDVmHlxed1Oq1kZSGq3Zy0ac8Lmj7yUix5mfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5631D606A31E
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 02:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5631D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795747086;
	bh=AHaLI/I20jTly3x9u8UqnizsvOZjx3OYsVBv2xG+hPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0+nD8Q4d5Qvrp6H2YqRZPJxp96VsqsKGc3RoZwdCGdB6E9+xPp4X5XUhiRTF4EDE
	 g874fniVBBTQ1wrTl3br8AtSGJyM4NwDi1oXU3AEbBPFPURCnLeNzxbGpla+WIt8j5
	 J79NPGNOK+pwYY+Pupomg0/oPuCZjCxAMez5ZccqlNrjR+KEkrM4CSLH0ndqZkfw/u
	 R5aZu8tqQiPv4yEQbbG+cGnRwXwoqp/6kGhME2+hS89fdbIrsO8UGdk8d27d2lTMJ8
	 NaICMiWGnTj54CuHoFfThpszUdPHkG6dAB5GysftO/clou7umGxZ4YsyWCTcGW4joj
	 w6aTwypf+WhZw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jbHdp17zHz4xSB; Fri, 27 Nov 2026 13:38:06 +1100 (AEDT)
Date: Fri, 27 Nov 2026 13:27:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 02/10] dtc: Add a struct for the top-level fragments
 of a dts file
Message-ID: <awjqhCkqGJt313Du@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-3-sjg@chromium.org>
 <awYvRAeiVSO9f0ls@gractus.seuss>
 <CAFLszTjALSPc+oJ7uVYaqZoPxUKJ0ggKSB2LU_QhyohSVaSyLw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="zvvh0tbI1xoi2KGu"
Content-Disposition: inline
In-Reply-To: <CAFLszTjALSPc+oJ7uVYaqZoPxUKJ0ggKSB2LU_QhyohSVaSyLw@mail.gmail.com>

--zvvh0tbI1xoi2KGu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 10:34:24AM -0800, Simon Glass wrote:
> Hi David,
>=20
> On 2026-11-25T00:44:05, David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > After consideration of our previous discussions, I'm leaning towards
> > using the term "source layer" for these top level components (thanks
> > for the "layer" suggestion).  It's more verbose than I'd like, but I
> > think disambiguating from dtb level "fragments" is worth it.
>=20
> OK, done in v5, through the series. The struct is struct source_layer,
> but to keep the lines short the helpers just say 'layer':
> build_layer_ref(), free_layer(), LAYER_NODE and so on. Let me know if
> you would prefer source_layer throughout.

That's probably fine, although srclayer or sl would also be reasonable
options.

>'Overlay fragment' and
> fragment@N are unchanged.

Of course.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--zvvh0tbI1xoi2KGu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsI6oQACgkQzQJF27ox
2GcR7Q//aaokdJtVfVqvxtaOSL56NQ3SzBnRH436htcOTeUDZKi9fp0Y5vMSKhHQ
CpEeSRmQr8NhLiXcEvug7FiMZE510HCvqF9xkaywHqitXN/0D6GOt1pZlMLpQyda
+QTlqz+xhe/tTGYYqT8kcD04BvIvOlSsAEUdLQV/jGSSpy6cA3CaTapCSdI1rGSC
sOtwyc82sKD/xXX8QC2GU9fHEEamEi0qQr4leBqzVMNJ9dVDXBMEtyKJ3w5fW8d1
LhiEcvdo7QuXnu0wO1JkdwHcNqC0Z7nCoAEbSwh/PsoSj7XFAbvaVzc19p/R5ndv
ef3RHQ85DAGqL+AA/F2ORBBzZ5eKWwQa+Ug35YBEmr85IFZqu4VJT/JeaahrGsC+
j3I5pSrh0IW5qYnSH6yZ6SlF7IuoWvkiuQMqUfvo6dhut1nLB5jk2F0XhHgkKzZf
i4iBPx52yT9/UszKnzPCJttqgF46M88DlEwIOQb2/L9dDrKrHiV31DQs27n2a0IN
AMyYrxBBUjQfS3FFGeLNYO34d6EwHKXgQofQexTpsu2XVCBX5rVa0IR2zgU+cxhF
RbJEsXntEiA7orXI6+9ehNz5YEGbcqV8/hjrY447VxULhrxJL6rUWgroN/tg3Jcn
IpIRMAFvimkoE1y40oUIQUdrLpwUNheN6ifmZOcqna8GGsyS518=
=VhsX
-----END PGP SIGNATURE-----

--zvvh0tbI1xoi2KGu--
