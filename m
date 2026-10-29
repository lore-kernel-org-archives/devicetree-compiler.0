Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793239670;
	b=pFabghpM182UOwgGXfQA9Q+G9Fy8uPM6B/DPhpxerrBaXC/PwMWfzbrqYq4+hgDJ5h+R
	 Wwmq8jZHc8KURVV12ND3yYHX0RogDmy2t91fPM7A6Z3r5T0OJ8m1Y9O2UjHekIXrPJ9A1
	 3YuQGw3E9g/J0IhBl8GZWD1my9LoQPbR79AePklnzdQ7Ut3157Q74Gd+e7qGhXwNZKuBS
	 EU8RBS56RMQnvJIqxCAn7TQ6PpxkRF5l2canEe+1qvaMuuoadNkPAfYd+uyh6bK6AWiWi
	 vS8RCvBxgvkAE/0xnA7mvT+pohCmgZT1XmhVcggRe0DJ0JoPsfme34aaByX/ifjJe/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793239670;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=EIrGzWhlxVW6TKPdZPiopH6RnnCxj+uGB81Lp+i6k6Y=;
	b=RIrYsopDDAVnE8fgV34jcms1SG47/xCDOv5hQxt2OIqFn735bQf/38JgVDkixbKhcbTa
	 79OG7E5L7Lu/YIvDkPBW2kY0DMu5H0bml8WlzUnvJfX2UotSTjvtGzizd+PFX+i4daCRY
	 ZmzVpX5QcJ1+dUMa1Q37Hxroix77gE8OJu8XT5MTGPXdoavGJEcaTvI/wGtJkmsoGwww8
	 eiHTslG8mdBobvAFnuCBGRKOWOpftknb4FY4cKXoXOlb0Xy+BBEu3HVyjH8B/amGuOZY5
	 Vz9jPxb3EJ9eYen9faO4+o3fWi917c7wD8zrrIK7fhWy2vAN9kHdrq6f2rs0u3GgziQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=TV0gC0ZB;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C64606A31C
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C64606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=TV0gC0ZB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793239662;
	bh=EIrGzWhlxVW6TKPdZPiopH6RnnCxj+uGB81Lp+i6k6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TV0gC0ZB83qnyqp+DElPtv3zizMdE25NY/uUDmjoc21h72jW6NT2u/on34JIMwVP9
	 cmfanPleQzH8IK/vTITTVzJinvFahgpdzZ7CKr/dcaNmaOOzj9R8BoJUlQpQrPXEyd
	 8Xxr9Sdkpy2Mq5Wk/gdchZLZVLxJLz6z8OfUUPVCxlrHsURbi4vds3Ics3GxIfUTBk
	 JnotYrsfkG7tsOCPI/QoIohxQhnkmIT7yxmsSHtGZG2l6O9qKDVc+u5nmJDeratbDK
	 Z4OmPuuJjAAvpeaI+f9J21SuiEpjJ9eVW7+ev4S4Oq2JNLTLJzUnh6SoDnAMFWBLzw
	 /gofMrAOXzEdw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jFSL6154Gz4wTX; Thu, 29 Oct 2026 13:07:42 +1100 (AEDT)
Date: Thu, 29 Oct 2026 13:06:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] fdtput: Make it clearer how to create nodes
Message-ID: <auKqGJdeg-SZS_tp@gractus.seuss>
References: <20261028073440.3327687-1-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="75XN7OWVxARWbmno"
Content-Disposition: inline
In-Reply-To: <20261028073440.3327687-1-sjg@chromium.org>

--75XN7OWVxARWbmno
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 01:34:16AM -0600, Simon Glass wrote:
> fdtput can create nodes with -c, and -p creates any missing nodes along
> the way, but this is easy to miss. A user has asked for a way to add
> nodes, not realising that one exists.
>=20
> The first patch makes -p reject a path without a leading '/', rather
> than creating it from the root, as fdtput already does without -p. The
> second allows such a path to start with an alias, creating nodes below
> the node which the alias points to. The third suggests -p when a node
> is missing, naming the parent which is missing. The fourth names the
> property, as well as the node, when it cannot be deleted.
>=20
> Link: https://github.com/dgibson/dtc/issues/49

Merged, thanks.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--75XN7OWVxARWbmno
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmriqiwACgkQzQJF27ox
2GeUPg/+MTzt7DhB1Ot1fNd0f4Hg1aQ+csKUiaRQn5twjkzAutoWuHco3pH9xwT0
VzL7M3hvnelkynE4L0s94xuISAsC/wV0qDT7jY9ohF1o8RNVdha//f4TwcBiPuhc
/Kg/GdmvBAmgf6SPEUrhEN6DbbDW2Sq446FbcYhC3LwhbgufY4ZtqPPzsr6zjaIa
RqDeXdtkYqjXO5sWupq8q+o86vZ8hWnWcA09mFmDbdTAGsldSras7hqkZWPnlQQV
OIaSjcq8AhN2rblTkFq1wIwg+o7qT7mJwCwMdqaDxtrIznG2o+ASQtgRLP2o/ucw
eP0QJqXGVbg1IRjD81SvouFi3oYn8gEJyLkQuz6Ug1AzymsnHflBArkSHEI/mWxg
+/L063CM3cOYrJEKQDkRngvbMRQiQHQ3siaGJS+RhRzA/JTfXXw++qSDyAgQ7wNw
ASo4luVT/jPR423pKQjPbOPhxOgsFGBWDDk0PrMSiV4HQ+pdtTeziItS0UXujcBr
Ryivh6kbvZ4oIZXJycUTJlI995+B5XQA2I41DgyE7vPSn/TK+fXWHMtpA9klJbxW
NoGJDlpqCIyCblHQnHh9ZsvHnJTN85rKSOqckirItfffJDQJ6lCxz9T0Cx/TAJvu
pev/3M+0u9wdHg8m1oHo55pW7ZZIoSmj9jdjDF3FUSjgGq4UDYM=
=XTva
-----END PGP SIGNATURE-----

--75XN7OWVxARWbmno--
