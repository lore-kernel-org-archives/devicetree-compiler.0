Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1721378800
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Mar 2026 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049555; cv=none; b=jquGh4cFXq2LYQv96dTlc+/XyhyqM+TEF1BIc/M/B4VruHx6L4ChLqCiKJuaGN27qceg4+M8pMrChp7NdqsfZFUOV69Q4PqLajHKGpsIdYZRPWm3c1XB0Acvv4XQVydGB2D3vjwHI3HkYgveKycwn1Q/FNndOMxstvTyxPnGb5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049555; c=relaxed/simple;
	bh=5ZCyb1n/f1NyoTbfFuGLANsI4u36m6BfYIewQVrOn64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJxUmRGhmgDU4gcDa9lKL0/X6dVbIpmg9ZTgqJx3nCKW7sc4lkKwtYKaOrP9j+JMI+1iOstgYy0KlqAxHCjr/zF7AxEQk/jqUsRLZhUjFENcjKEBbTqMTz2H/BD2pQK/iREGI7H6EhjhncnGuS89Mn2bFiIbrLR6f4pBjt3Ok2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ORRc6aEY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ORRc6aEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1773049140;
	bh=+6Ine/K4jJ5a3qOmJiLXhHhSdh2M9QA2oSZ3R1jduZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORRc6aEYGsk6vL6kvqkOwOxcoLx925xsVSM+DOwJ8UKxoZ6RG2ahrTjP7wLb7RPvw
	 cZX9SDIJB6Nk6VgLRAUm+xbqzu0c/dZzIpQF/bW97WcCmexbYgnSfUvaIxhbsnPyl5
	 g6kx3/qSr99TtN2ZZImQoLTCBCKKkLRWKvWjfIx5sC5cQeLtD7vSHII2MdFvIMmn+4
	 ADdaR6clCJqAvejpXAwKYVkahh7mlK3SueDYQxH6Z+HqQMfQrqCxYgvCqSPr0l/Luq
	 9DQ2DU2AXUchYnWoHArDJbjtqHfXyAGYCf0PzEpVVREG1+cXzLZBA9LbpHc/93GhtJ
	 4rUUOuhsjUQhw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fTsQr1GgGz4wRD; Mon, 09 Mar 2026 20:39:00 +1100 (AEDT)
Date: Mon, 9 Mar 2026 20:38:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: Tag a new dtc version?
Message-ID: <aa6VLj0BI88LSj6u@zatzit>
References: <CAHuF_ZqwfZ9U5FBG+BQdmcVzESfKWvghCL5nc8sqzzzO0VBDYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cldlQjLyQA7+7fK2"
Content-Disposition: inline
In-Reply-To: <CAHuF_ZqwfZ9U5FBG+BQdmcVzESfKWvghCL5nc8sqzzzO0VBDYg@mail.gmail.com>


--cldlQjLyQA7+7fK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 08, 2026 at 03:39:34PM +0200, Yedaya Katsman wrote:
> Hello,
> I had some issues with the python bindings from fedora, and it seems they
> are behind the ones published on pip, since there wasn't a release of dtc
> for a while. Is there a plan for a new tag to be released?

There's never a plan for releases.  Since I maintain dtc in my scant
free time, I generally just make a new release when enough people want
one enough.  I'll put it on my list and see when I get time to wrap a
release.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--cldlQjLyQA7+7fK2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmmulSYACgkQzQJF27ox
2GfWDg/+MwGPmJCziP5EIOOG5nwk19jrUzadzOpE1xyrEVd+DZWf9ItV3rCDy+rs
lb3mKUv2rlLg1zfRulaKnbCd3j5x4E10WaD1F1aqn3phPAB+0R93BheZXg5bOnPr
Vam5NSTDh+t/kzxlxG3EerfSX8Avx/PiqL1nvxA661T70T/uttahZ1cU5bENMxNx
oiAiZvHB+qBMxqSJmw5kMOgP8240Vuz8aUvWchMjn3csN8MCZM0UQrEA7wgq1V47
TlRkRCGps4+7ed5MxP1sQexMfNi0DKZO0rKwlckbKo7QKAVhNqG/K9BB7W9eYfAy
dp3QaM4t1QHvaodtpzYN0gy1uMJWofu4cbr1VeaIb5u6qCwp8lozrHqeFxZafohn
NFgz4QhHvCPeR7r8CqVcsasTP/Zd8r7ZKnbu2hGO1KsWK3VGawG8x7hksoBPcxO0
BmopuZZaWespIosh5hC3F3Top4lJro5q2fvGU3qgkYHclAiTt5H7XvP2UFZXt02c
OfLeeU+jBrEhXauNdbIS+MF4xEDCT/j35rMuZsMRk2zd0154OXkAnXcM5HhSJuae
CcVLudJF0JGBQ6exh8TkFYVL4cp6fyKfS5mxOq5vxuFfKzIqAoFo9QMzuJAVk+kF
LKPCsSV9OKr7s9rNeVzpLYLPldXqTIDFYfU7UgbKIRMIvrCC+4U=
=3dCM
-----END PGP SIGNATURE-----

--cldlQjLyQA7+7fK2--
