Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D28D288DA
	for <devicetree-compiler@vger.kernel.org>; Fri, 14 Mar 2025 03:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741921429; cv=none; b=I6dUXo5DmoLZ/8QOVd9gwwCZbrdG4DbOOCFB2cKGwxBTtpQJhO6toR2ZqYrvj+VGqwoc8QqJZEscw19h7OTTquv9lZOk/UMdnTIfLYMlcNC2iXEjqW7q5MJJQWVsEDGMfeTrTwJnkNghDAN+QJacBV/xwqB4a3pnp2+gzMUjXsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741921429; c=relaxed/simple;
	bh=jg0kCcKGZ6aAwfK66TiwTXI64ZXClhgGAKzHqfIzLd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUhfmEpNehjYtfedzY25qJ+SJxIglnL6kSJ72n316rK5165U/wpIA+7Q1RLgHM8NKd/gojPidMtTwq6sSfeznB/ThUfWtoo07JA6ZmK/QVQ6S1/4seLgS/Z8CacvgdTrBgLjjhYPMGQMxlGh6mvtVAYjf2d5zvLdgUP4oAyVwNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=QaErKPGV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="QaErKPGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202502; t=1741921418;
	bh=o2bPMB7UoZBSbygjdOrv0wu33jzYpQGldfIo2PaqT3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QaErKPGVZuAWA1vmfVONDXKZwR1NK6ShSlvtKLlfH6KD8TLILO9pOt6Q9Psx71Mok
	 hwHOe1PSYMfylf7+B5lAe/LI88++73JFYc20mNIa3Wo6kUKwJRdvTuLHBOcVFyz56X
	 FohQ048uw7KTiS7XJf0bK3iyzorxh4XTV7I8x+yO2EGJ/9I8cYVAie2UxF+hVjeOUI
	 +u8tMnEQcMrAxDQaVRYc1EkZ5b99BuqU/GpLsU+Nfce+mcDLgxfm0duSBmc8SaDI7g
	 CDf0YBBBdwOt4cIuLhxTRHrBmcLQeeSh4dvrnbSzciYQjKgu0KvNquGp0PhgQ8Fz+h
	 ITdXkOTBVhWtA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ZDThp3JkBz4xD9; Fri, 14 Mar 2025 14:03:38 +1100 (AEDT)
Date: Fri, 14 Mar 2025 13:48:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] Remove duplicated words in documentation and comments
Message-ID: <Z9OZEMY0iD9FNEO2@zatzit>
References: <20250313190527.1556019-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HGRhUPIhKl4DxY/i"
Content-Disposition: inline
In-Reply-To: <20250313190527.1556019-1-thuth@redhat.com>


--HGRhUPIhKl4DxY/i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 08:05:27PM +0100, Thomas Huth wrote:
> Let's avoid repeating single words here!
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Applied, thanks.

What brings you to making dtc patches?

> ---
>  CONTRIBUTING.md                      | 2 +-
>  Documentation/dt-object-internal.txt | 2 +-
>  libfdt/libfdt.h                      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index 940dd1a..48c8efd 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -2,7 +2,7 @@
> =20
>  There are two ways to submit changes for dtc or libfdt:
> =20
> -* Post patches directly to the the
> +* Post patches directly to the
>    [devicetree-compiler](mailto:devicetree-compiler@vger.kernel.org)
>    mailing list.
>  * Submit pull requests via
> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-obje=
ct-internal.txt
> index c7357e6..dbbbcea 100644
> --- a/Documentation/dt-object-internal.txt
> +++ b/Documentation/dt-object-internal.txt
> @@ -6,7 +6,7 @@ the hardware capabilities. This is insufficient for platf=
orms
>  that need to dynamically insert Device Tree fragments into the
>  live tree.
> =20
> -This document explains the the Device Tree object format and
> +This document explains the Device Tree object format and
>  modifications made to the Device Tree compiler, which make it possible.
> =20
>  1. Simplified Problem Definition
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index f2675b1..b5e7200 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1569,7 +1569,7 @@ static inline int fdt_property_cell(void *fdt, cons=
t char *name, uint32_t val)
>   * @fdt: pointer to the device tree blob
>   * @name: name of property to add
>   * @len: length of property value in bytes
> - * @valp: returns a pointer to where where the value should be placed
> + * @valp: returns a pointer to where the value should be placed
>   *
>   * returns:
>   *	0, on success

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--HGRhUPIhKl4DxY/i
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmfTmQIACgkQzQJF27ox
2Gcsqw//VlzRW3fkKG6OhaQXxNwRPsdHp2wnntv1pQBgZZ3yAUvmV4J5pdzydunf
n/ORu8u1K0yzdaWDH/qdgt1O58gP5rwmLTbD7P8ECAk+NvdpT3GSbH5CjDUk7psk
xP/3F7eqJGxF4N8LIm8QW6fWFwBmz/EnWCasMg9XodVDSSaiv8y2Z1nLI7TD0kXf
FrxFOei9XUDUxb7IzVhQJn2U7XrijupNDUPzSQzbbVHH3Eh0iFExd6YcouIletHf
ofMO4QHtx1m3tB3uzdWSqtglIMFIWqf4JncRf+FsQKxvz4L02J8SKe/2nifhRZac
C8gaiqBVOFblzGcPuaV4kw5fvaqLe9RNL46GCz0LkZKI08+9mGz4HKDI7mS9J5Dl
Lt7sbIPOS0P/4OV+0imzmC2cGuNVK4NotkJzCNkR1f5zGFvMH/dMq16QLEt96gCv
NaEC3VdZItmQcrDuTNaQLbEBv65nPXUk58gsF+NE4AkB6Yfci9C9Q0Zhv3QqXjH8
z/6xOmXHUvRCw/OPubS6fXMv6MN/qX3MgaX4XkdtZKtR/6TThGDbtR0Co0PZBG4X
WSK65oVNzcHJy8ZuxiMRuL4khBaTERa1oTHGsWtQgSUOGC0g6fx1YePC+O1ctkfG
3ZCXoSRW3onOZ3MbtctR0Jjr36iT42ebm8wPAZ5JYjp9fX6wpak=
=Gmn5
-----END PGP SIGNATURE-----

--HGRhUPIhKl4DxY/i--
