Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175918F47
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Aug 2024 02:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723428082; cv=none; b=ZDlKkurjhy+HqpQ9AFocRQCEJ9LPblsgjfpgF430RF+IDXx92zKgghTJqwi02ht2lBjSeHkBm0dLNsddOR5AQ+YFb+lbh569yejoafgYRMzR0aOFQ8EvsVc1+iXr2hmglsPlq89p5gCZnNlYY8eAiZSRbj6WkfXjGhvD5vAjUMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723428082; c=relaxed/simple;
	bh=2nslSnKesj23F+BnFtRvFhDPA6jjj+cUOyR3myuafdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jf4pMcXanOq4PCEAvklQpUIxwQtRw0lUsnM31aa8PSPHOMxaMrhvU2ecWynJeXe8lxYQkMjkihgMYMRPCe0sLjTXeJDfr81+kbCx84UNUbc8Wj7CoV51sD7uGkmMvWwDYr7JOxl+WS5CRjx2g7T7jyf6IY+5jxmlugp+Mz8UTLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=jEnNTwID reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="jEnNTwID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1723428074;
	bh=u3CVPsQcQpckwDeeTfDcDkY4H7Oc+KNIJ46UJ4mEJFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jEnNTwIDvJcecb7l0EdQ61OqcSRRTbX7TPg6T6JpH90E/Oxq0d8xcK5eSufdZpqjY
	 pqOjNULh/SOcy0P1Ba24KYQ0xm/K73kuLPO/kLFPwX3aaWyaWxnPpxR4pJZn5i+09x
	 BIEgg2GBZzsIBpipIOjvcbcAjOKHX7hPzkWjXIzg3HbelPeJ9G2Y965SJML8a77YDn
	 k6w8MvIkXBSvZzr3xXL24AhHWZiN+IXexYObHcPAmYjLnJSNZK/g8bt9AVkCFBa3Pc
	 X1hykGQ5foNoYqWqIW5ZdqrFjclqqBWYjnJiH9ntmT/KSqhday0O80LVCdmsXWjqCP
	 3vnDg0OxqtlUQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WhyRZ39BWz4x8q; Mon, 12 Aug 2024 12:01:14 +1000 (AEST)
Date: Mon, 12 Aug 2024 12:01:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Gua Guo <gua.guo@intel.com>
Subject: Re: [PATCH 6/6] setup: Add dependencies for Windows
Message-ID: <Zrls36hgOi9jIIf1@zatzit.fritz.box>
References: <20240811150248.7537-1-sjg@chromium.org>
 <20240811150248.7537-6-sjg@chromium.org>
 <ZrlqiYL4p6K14S6e@zatzit.fritz.box>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u6BwPOg4JB3ngMH6"
Content-Disposition: inline
In-Reply-To: <ZrlqiYL4p6K14S6e@zatzit.fritz.box>


--u6BwPOg4JB3ngMH6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 11:51:05AM +1000, David Gibson wrote:
> On Sun, Aug 11, 2024 at 09:02:48AM -0600, Simon Glass wrote:
> > From: Gua Guo <gua.guo@intel.com>
> >=20
> > Windows apparently builds pylibfdt if swig is declared as a dependency
> > in the setup file. Otherwise it must be installed manually and Windows
> > does not sport a package manager, so this is hard for users.
> >=20
> > This change seems to have no ill effects on Linux, at least.
> >=20
> > So add a new setup_requires line.
> >=20
> > Signed-off-by: Gua Guo <gua.guo@intel.com>
> > Signed-off-by: Simon Glass <sjg@chromium.org>
>=20
> Applied.

Oops, spoke too soon.  While this works locally for me, it breaks on
the github CI.  See:

    https://github.com/dgibson/dtc/actions/runs/10344711112

> We do have windows build in our github actions.  It would be great if
> a test for building pylibfdt properly there were added.

This remains true, once the Linux breakage is fixed.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--u6BwPOg4JB3ngMH6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAma5bN4ACgkQzQJF27ox
2GeSVw//WKv+m5N9ayjPzuFy2FnggKIY3kBSbyC9Xyl+DXvmOPYHp6j8mdhegQLc
PuXtnVGAhJaRs5W09tyXTU0xRgwQk6mLWK8Xx8EdDIV4jpMWYx7NbynHo+N0YWjA
Dy3UqIcfpv6a9VH4eDfjr561Eli7x2t6HRu2OQDn4R91OMDYaoL8JCM4VcxNxBpA
SiKBE0/a5oW2HruGRBwyAIVWOef31UGBU7BGY714ZVrsQ5DOER0xJls5R+/MIGwa
ynA8LdYNQ/89tI2rqd5UqIkYMgWhh9eIFJm4NBWakqllkYyKqEbhbw4SvyDmmBs9
k6NqjN/M2X8TRYIX1wy8NmCF3MhQxAhXZXBCbXXzZxDIfHnG39d1Ko1kWdsvL46q
vn5rvfjDDsiwKoM3TjMFrwVS9drMyQAubOLRw0aa5UCw85jFWBcsPygVSglETlKl
Mo8tM+UOAju5t7HgKi3rJ6xM4IY+EuTFP/+DNFUxMTASGSfT0l9M61Xak8aQ7s0v
xfYYvSFq0lJ1b6dvfQmrpKh4guzMLuFFq5Y3GN0BcR6dAteG+UIiDz34OJ4533nt
DwWWRaaj7UTCzRZB3ncOC2r4KFNjrXj3rdFR6DY9rSH4Ktqt7vI0RsU5HJIjRNKD
4I+sVVQk6SCkny6OxgEgE1R4YUtGaWMBohJ9bBflk+Xg3cxXsx8=
=IsKf
-----END PGP SIGNATURE-----

--u6BwPOg4JB3ngMH6--
