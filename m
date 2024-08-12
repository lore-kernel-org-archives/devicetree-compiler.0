Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC60661FF6
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Aug 2024 02:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723428079; cv=none; b=TM2B8QXCMFtlaGZ6DWp9DpR0C664jIStk1zaKHnAfU/ByRBTy4qbiWTkikXvLi+uIVv+dyqhJjnUNoxECUkO3EKZPl49K1b7d9xJGchpGkPxgjids2A1t2Jlsahicv3jIFu7SlFg8T67iX1kfcVs4i1jVTzLQPWT8favsoDS2Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723428079; c=relaxed/simple;
	bh=vvuBQ72YM3w/oU8/YQ9uhLbhse5sMLz8mzbzUSoaaJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njDXgqaQ0v/qFdxESwiwgq+hwDetftPIIpqYwpmYqqDTUMUh9y59TB6gljctxAaOlGBQ85R+D2MBOY79otOqlssp2dzCpQ5MZFbnyzZxE7gzMoEyUIl4TOH9gaAYT+8n+LeZ/8UUQnaVKsfSN59/oYT4xXae2OHhPCghGcmEZvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=r9ra7R3U reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="r9ra7R3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1723428074;
	bh=Zws6KORG9dUC0Pr9V+9PXLmz1Fo0Mz7ZtIKUpAVTbws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9ra7R3UddQukgR9gr6/jkJZoy5iUGdiNwhgX0XkLAHtP191sbZw0/vA4nWBkDgqq
	 vTjKFWsuZbcdiqPDdyOOTf5fo0n8YXGHxPRFe9wKgKmEgFzl6cT8a1MpOh0zgBhXbH
	 CHz8aljNrs17TCRhp+Kz+sE77a79d84MwjlKmdF3bcH/qi4fGZi9yHzp98sLLVMf+i
	 Fo3MYwBJpPib6FC3mQKIvvF6TDSu+79gRsAXvy7p/lhMykyMAhj1E41GZ+aRyOEjYH
	 bwFXl3XhKcvci6PROilSO+a3av6ep/bB0TpDAPEkH+DjujcR8d9cf7GEb3aIJoXgUt
	 R2UGoUTzqX2xQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WhyRZ2zrsz4x8m; Mon, 12 Aug 2024 12:01:14 +1000 (AEST)
Date: Mon, 12 Aug 2024 11:42:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Gua Guo <gua.guo@intel.com>
Subject: Re: [PATCH 3/6] setup: Move version and full_description into a
 function
Message-ID: <Zrloit94dFHCKVeo@zatzit.fritz.box>
References: <20240811150248.7537-1-sjg@chromium.org>
 <20240811150248.7537-3-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="csx4d5QLlwdwu+iE"
Content-Disposition: inline
In-Reply-To: <20240811150248.7537-3-sjg@chromium.org>


--csx4d5QLlwdwu+iE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 09:02:45AM -0600, Simon Glass wrote:
> Do this processing in a function and return the result, to reduce the
> amount of code at the top level.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied, thanks.

> ---
>=20
>  setup.py | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/setup.py b/setup.py
> index 4e880e4..eb0963c 100755
> --- a/setup.py
> +++ b/setup.py
> @@ -16,11 +16,24 @@ from setuptools.command.build_py import build_py as _=
build_py
> =20
>  srcdir =3D os.path.dirname(__file__)
> =20
> -with open(os.path.join(srcdir, "README.md"), "r", encoding=3D'utf-8') as=
 fh:
> -    long_description =3D fh.read()
> +def scan_for_info(srcdir):
> +    """Scan for the version and long_description fields
> +
> +    Args:
> +        srcdir (str): Source-directory path
> +
> +    Returns: tuple
> +        str: Full description (contents of README.md)
> +        str: Version string
> +    """
> +    with open(os.path.join(srcdir, "VERSION.txt"), "r", encoding=3D'utf-=
8') as fh:
> +        version =3D fh.readline().strip()
> +
> +    with open(os.path.join(srcdir, "README.md"), "r", encoding=3D'utf-8'=
) as fh:
> +        long_description =3D fh.read()
> +
> +    return version, long_description
> =20
> -with open(os.path.join(srcdir, "VERSION.txt"), "r", encoding=3D'utf-8') =
as fh:
> -    version =3D fh.readline().strip()
> =20
>  def get_top_builddir():
>      """Figure out the top-level directory containing the source code
> @@ -53,6 +66,7 @@ class BuildPy(_build_py):
>          self.run_command("build_ext")
>          return super().run()
> =20
> +version, long_description =3D scan_for_info(srcdir)
> =20
>  setup(
>      name=3D'libfdt',

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--csx4d5QLlwdwu+iE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAma5aIkACgkQzQJF27ox
2Gdpfg/9HJMTnAJabWAA+IU6MZOugUryR6E211uWZm02+LRqyfGPkxmijWoCAG71
3YL1hIKjQRSSN0zmGA014nudm55ttadlz7RircE+KS2zWSLiVsSOQGjltMmp+B71
PL+6heZ3Hjr16Mlg2s30GjbMHJXGzq+gINY3PiKnPa30RmnWRE9yd6dVUFVrqvp4
7aP3mZHJnnGv1luY7DQ2EA3me9J8VDGyoHE72VXWUWn/OpRlImK+Fm3P8+EXNhej
mZ0EkGp2J1Tc+PbUu8QxMeWODUk7zf6Y96QYkjrClctb+rAwKfDSjqSsElV9kjqK
ybvuIBbExOQHew7L68eLRJYpckIjowdCnfSOVrku89iaa9/az+wInmDJ7tE5OGxU
2rw1XORM0ONzxuCyUcyz6KhIoJynXlAvHhYi1J1LnbmknMK8y9ye4xjeMdjWyWze
O5m3vCDuedR5UT2HXtXpy28t3P31CyjLp7ohwPMCAdfCEPFEUFigHfRNEGVi8H2e
J+IcN3BsonynhV5mFNuCxCoE/Wg10iTemnwtvANdnKKnGuOSqjLvfb1FPbkCQLbb
bkucTYWk6E3x9HbDCraJzVHPLp/fDF4f6RjstZDON4vOLP4qaFVmtN5B0gu+XCL1
FtsuJmNCIOmMpioG+EYicfvYfYiPip+vvzC/ZjMA6HsfqknVC+I=
=rK0S
-----END PGP SIGNATURE-----

--csx4d5QLlwdwu+iE--
