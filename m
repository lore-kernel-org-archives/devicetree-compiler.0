Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C03F4F1;
	Mon, 23 Feb 2026 05:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771825107; cv=none; b=FHcVXMy0P0LOSDuEL3GJpdyXGvDqPsPdtbYtZwK1QB/rYln6lAoeQBvv/gNGftCtzWt2YCcA/5c5hu84/yXBu2iaATkvy2NHDVHvoHDeI4Nfh/6z9P5qzHloDpHGfudC8jQbrqF2nOXyorem1dBoWlk3Z/vmpBILy5A4ufpqA+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771825107; c=relaxed/simple;
	bh=TPsKtaiyNVo/gyaBLJ9xcdrSNByfg2rBTpX189s1J8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOKsca9+cfDpN+sQIcZ4VSDd1GO87xP38xuF7SzAICuS9t23DOiqE5P96iQxpYHGmCp1HkY0EmOuh8deJSu7bi/MTQpvPN65SO/25COwTxhz5V6dpep9SQ64u1GwnVHKNfZbFTump716Ba2+Gaydl7FP/sLXC5U0IjwKSlq8RV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=mGpNdkHs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="mGpNdkHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1771825095;
	bh=RP8k0ZCChp/B28bt1jAmg+NV39A5oV3C7PbuN9VCUF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGpNdkHsSVeIlpkrhVic+6vMImN+67HX8y7WwdDxdvHgjV/Y0dEW5bFoJQhLxuY3c
	 KzEJ+SNJ60rj5kplbHobQGIdquhMQmgxrdBuv5gc6J76QwcJ+eIyhCazgf8Wau3qm5
	 0VcGyy4fJ6aRWmhx5oapnOHQRHFsFnfYMs39ZILdoS9ZNByIinhUXBCbo99m9lf7oC
	 p1kVrFpK7x1xXQiqjMQ7JyjrRUzNTfxOVK5P+hcaIMNCZY6BgQyROvrvMGvTlX5aO+
	 nvBgEcdgw4clrPVDHU7oTgVwHmkgxB7CpQWO92r9zm3mFq4w2uetbla+43S0K68RzO
	 plSZfki2o96Hg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fK8lW392wz4wBJ; Mon, 23 Feb 2026 16:38:15 +1100 (AEDT)
Date: Mon, 23 Feb 2026 16:38:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 03/15] fdtdump: Return an error code on wrong tag
 value
Message-ID: <aZvnwbRVoX73DyLJ@zatzit>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xlAR6RpopEeYBJuX"
Content-Disposition: inline
In-Reply-To: <20260210173349.636766-4-herve.codina@bootlin.com>


--xlAR6RpopEeYBJuX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 06:33:31PM +0100, Herve Codina wrote:
> fdtdump prints a message on stderr when it encounters a wrong tag and
> stop its processing without returning an error code.
>=20
> Having a wrong tag is really a failure. Indeed, the processing cannot
> continue.
>=20
> Be more strict. Stop the processing, print a message and return an
> error code. In other words, call die().
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

The intention of fdtdump is that it's a fairly crude debugging tool -
it will generally attempt to produce at least partial output even on a
bad dtb file.  If you want a polished tool for use on good dtbs, use
:dtc -I dtb -O dts".

That's why this didn't die() initially - the idea is if there's some
bogus stuff in the dtb, it might print a bunch of these warnings, but
eventually resynchronize on another valid tag.

So, I'm disinclined to apply this without a stronger case.

> ---
>  fdtdump.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index 6c9ad90..0e7a265 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -146,8 +146,7 @@ static void dump_blob(void *blob, bool debug)
>  			continue;
>  		}
> =20
> -		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "=
", tag);
> -		break;
> +		die("** Unknown tag 0x%08"PRIx32"\n", tag);
>  	}
>  }
> =20
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--xlAR6RpopEeYBJuX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmmb57wACgkQzQJF27ox
2Gcttw/+KRSgyBJ9wsyo7qlt9bU7bMRr57wwEBrQMDKLUG1kBqqerumaYpwTh6Ky
LzB6UDxypFKx5m/QiN+VN7VitQRyeTwNKqhhoJrlfva3XXD6LVNvxIiV666GznOt
gBTFmIVbP2LVIx8elwbCg700RjAgOa2zInSsBVgg9f5m70s3uq58gxiOF++AqsbA
BHsninCO1RXNTDPuV9TxkrSb25XuqGsCiukvSreggta6SwUA6Wlt9503YmAYUxEl
OKC/2i5PfvCYfqGZG52NIn3ey8G8V/VKt21dg4amGA7MMXkrQ125Ims8R9qiatFG
N6Kxji9Dlyt/JnA4pWsHvSJR4B3WSMlNfj3j4OdcKQHs+jfO8nIgX8/+xedvleKA
SE083+jIlQ+vgFOGSDWAZ8UX4eEb34yE026sSWwgyVo1tkA9qLAp+tTiLdQ/Q7oA
bMuONDOXgpJH414Tjmgel39wUEvvNmbV5fHTSM5PEh/p6zKZYP6FGuB6OPWL9ytY
PzvkAOCg3cm7EOPapNR/AbHzk85QADh3wIXxmCcQ+gT9xla8VfbmDoiIsMMhOqt/
eMUOWsyI1TzyOS69RVwxDrvuEy4HiZYav+speuaGVcJbgh8e0WGwU653nhcvPQgA
EzMf4WmKqeRNP//12M1jflR5jqGZBBobZ6RBCzJpJxsYyNWeGrw=
=6XGn
-----END PGP SIGNATURE-----

--xlAR6RpopEeYBJuX--
