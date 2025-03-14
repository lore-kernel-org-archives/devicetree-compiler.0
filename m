Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D26014286
	for <devicetree-compiler@vger.kernel.org>; Fri, 14 Mar 2025 03:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741921429; cv=none; b=d8OhfkL/rJEpnIz9WJaSY+0kOlPfzPs3B9AdoIGCBJRRMSsw9ccoC06/ttYfWmM4Iu16qLHlVgwT5ZL5nVKo3BuRMwh06+Ev8sKhl2dRlPdT7UxhC5SXJCMQJRXskUNY7YxBtLFjvnGPLJD5ROR28V+OS8khk1BJwKi/aYEINo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741921429; c=relaxed/simple;
	bh=QnMx5Dd4v3ReqFlN8N2jTN7TB70C8GNYWXwmWFxVOAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHKcUQkw6B8XBayhBJXQz9JCl+nMgj2WqhU1PzL8t9tMXt8WePwPfy8iQ/ci6mGJ3tSIcSzq3U3IwkQHQ7ktDznYtJC6qyGfHuQvv6MWvvLuqVbH/TWNW+yxujUkFcAcXTPQRzxNh2vZpp16RAaZgIDI0Q3Yt3wQyTI65+XelsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=aGZ5sKdB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="aGZ5sKdB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202502; t=1741921418;
	bh=bmvyoRB1LD5LYoYz5DZhudFdGYzPqerslzzpweitZqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGZ5sKdBi0SDudNvey1cAdUNYcitepq37/IkuZyhoS5/0uIS/RYv8W3M8v73JJOjl
	 qgx3IisndWeZXyzYZCv4ezv7oWlvF3Enqthp/SlFStOcT/NrddBnsF4lSXPX0Mg7Jy
	 A0Gpqd6MfgUB+493owpVhzvMXJdLV/2coMqV7qofuD86S5Jw/1uWN7Sr0c1Ey0V1IO
	 bqDej0UYaXDB3YWy0Si3WFBMLDo6n6q2oZfULLvqJfmfpYw0L/VldjePzJ3GOq8LVv
	 9NMndvqvn1G/GjnpO7X202OdZ3E8dDEhnt8qkNzzvDj3oBmt5xalLmck6e0fYh5Y4i
	 gF6DfLKfTm7lQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ZDThp3PrWz4xDK; Fri, 14 Mar 2025 14:03:38 +1100 (AEDT)
Date: Fri, 14 Mar 2025 14:02:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] Fix some typos
Message-ID: <Z9OcSv28qi2yFe_j@zatzit>
References: <20250313191607.1556384-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QGV2gW2TcYYdmELd"
Content-Disposition: inline
In-Reply-To: <20250313191607.1556384-1-thuth@redhat.com>


--QGV2gW2TcYYdmELd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 08:16:07PM +0100, Thomas Huth wrote:
> Discovered with the "codespell" utility.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Applied, thanks.

> ---
>  README.license           | 2 +-
>  dtc.c                    | 2 +-
>  dtc.h                    | 2 +-
>  flattree.c               | 2 +-
>  libfdt/libfdt_internal.h | 4 ++--
>  pylibfdt/libfdt.i        | 2 +-
>  tests/comments.dts       | 2 +-
>  tests/nopulate.c         | 2 +-
>  tests/run_tests.sh       | 2 +-
>  tests/testutils.c        | 6 +++---
>  tests/utilfdt_test.c     | 2 +-
>  11 files changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/README.license b/README.license
> index 102b004..a4edc2b 100644
> --- a/README.license
> +++ b/README.license
> @@ -28,7 +28,7 @@ tools.  Allowing libfdt to be used under the terms of t=
he BSD license
>  makes that it easier for vendors or authors of such software to do so.
> =20
>  This does mean that libfdt code could be "stolen" - say, included in a
> -proprietary fimware and extended without contributing those extensions
> +proprietary firmware and extended without contributing those extensions
>  back to the libfdt mainline.  While I hope that doesn't happen, I
>  believe the goal of allowing libfdt to be widely used is more
>  important than avoiding that.  libfdt is quite small, and hardly
> diff --git a/dtc.c b/dtc.c
> index beda8d5..b3445b7 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -15,7 +15,7 @@ int quiet;		/* Level of quietness */
>  unsigned int reservenum;/* Number of memory reservation slots */
>  int minsize;		/* Minimum blob size */
>  int padsize;		/* Additional padding to blob */
> -int alignsize;		/* Additional padding to blob accroding to the alignsize=
 */
> +int alignsize;		/* Additional padding to blob according to the alignsize=
 */
>  int phandle_format =3D PHANDLE_EPAPR;	/* Use linux,phandle or phandle pr=
operties */
>  int generate_symbols;	/* enable symbols & fixup support */
>  int generate_fixups;		/* suppress generation of fixups on symbol support=
 */
> diff --git a/dtc.h b/dtc.h
> index 4c4aaca..9acf071 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -38,7 +38,7 @@ extern int quiet;		/* Level of quietness */
>  extern unsigned int reservenum;	/* Number of memory reservation slots */
>  extern int minsize;		/* Minimum blob size */
>  extern int padsize;		/* Additional padding to blob */
> -extern int alignsize;		/* Additional padding to blob accroding to the al=
ignsize */
> +extern int alignsize;		/* Additional padding to blob according to the al=
ignsize */
>  extern int phandle_format;	/* Use linux,phandle or phandle properties */
>  extern int generate_symbols;	/* generate symbols for nodes with labels */
>  extern int generate_fixups;	/* generate fixups */
> diff --git a/flattree.c b/flattree.c
> index 1bcd808..30e6de2 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -503,7 +503,7 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int vers=
ion)
>  	 * Reserve map entries.
>  	 * Align the reserve map to a doubleword boundary.
>  	 * Each entry is an (address, size) pair of u64 values.
> -	 * Always supply a zero-sized temination entry.
> +	 * Always supply a zero-sized termination entry.
>  	 */
>  	asm_emit_align(f, 8);
>  	emit_label(f, symprefix, "reserve_map");
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 1fd35f3..773bba8 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -56,8 +56,8 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_w_(=
void *fdt, int n)
>  }
> =20
>  /*
> - * Internal helpers to access tructural elements of the device tree
> - * blob (rather than for exaple reading integers from within property
> + * Internal helpers to access structural elements of the device tree
> + * blob (rather than for example reading integers from within property
>   * values).  We assume that we are either given a naturally aligned
>   * address for the platform or if we are not, we are on a platform
>   * where unaligned memory reads will be handled in a graceful manner.
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index bb9985c..1f9c047 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -162,7 +162,7 @@ class FdtRo(object):
>              quiet: Errors to ignore (empty to raise on all errors)
> =20
>          Returns:
> -            Typle:
> +            Tuple:
>                  Offset of the next node, if any, else a -ve error
>                  Depth of the returned node, if any, else undefined
> =20
> diff --git a/tests/comments.dts b/tests/comments.dts
> index 0b04b6b..d315d7f 100644
> --- a/tests/comments.dts
> +++ b/tests/comments.dts
> @@ -25,7 +25,7 @@
>  	prop7;
>  	/* yet
>  	 * another
> -	 * multline
> +	 * multiline
>  	 * comment
>  	 */
>  	prop8;
> diff --git a/tests/nopulate.c b/tests/nopulate.c
> index e06a0b3..06f8369 100644
> --- a/tests/nopulate.c
> +++ b/tests/nopulate.c
> @@ -65,7 +65,7 @@ int main(int argc, char *argv[])
> =20
>  	verbose_printf("Nopulated structure block has new size %d\n", newsize);
> =20
> -	/* Replace old strcutre block with the new */
> +	/* Replace old structure block with the new */
> =20
>  	fdt2 =3D xmalloc(fdt_totalsize(fdt) + newsize);
> =20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index f0b51c0..fecfe7c 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -805,7 +805,7 @@ dtc_tests () {
>      run_dtc_test -I dtb -O dts -o stdin_odts_test_tree1.dtb.test.dts - <=
 test_tree1.dtb
>      run_wrap_test cmp stdin_odts_test_tree1.dtb.test.dts odts_test_tree1=
=2Edtb.test.dts
> =20
> -    # Check integer expresisons
> +    # Check integer expressions
>      run_test integer-expressions -g integer-expressions.test.dts
>      run_dtc_test -I dts -O dtb -o integer-expressions.test.dtb integer-e=
xpressions.test.dts
>      run_test integer-expressions integer-expressions.test.dtb
> diff --git a/tests/testutils.c b/tests/testutils.c
> index 4c85111..54da2e4 100644
> --- a/tests/testutils.c
> +++ b/tests/testutils.c
> @@ -131,7 +131,7 @@ void check_property(void *fdt, int nodeoffset, const =
char *name,
>  		     " differs from stored length (%d !=3D %d)",
>  		     name, retlen, proplen);
>  	if (proplen !=3D len)
> -		FAIL("Size mismatch on property \"%s\": %d insead of %d",
> +		FAIL("Size mismatch on property \"%s\": %d instead of %d",
>  		     name, proplen, len);
>  	if (len && memcmp(val, prop->data, len) !=3D 0)
>  		FAIL("Data mismatch on property \"%s\"", name);
> @@ -148,7 +148,7 @@ const void *check_getprop(void *fdt, int nodeoffset, =
const char *name,
>  		FAIL("fdt_getprop(\"%s\"): %s", name, fdt_strerror(proplen));
> =20
>  	if (proplen !=3D len)
> -		FAIL("Size mismatch on property \"%s\": %d insead of %d",
> +		FAIL("Size mismatch on property \"%s\": %d instead of %d",
>  		     name, proplen, len);
>  	if (len && memcmp(val, propval, len) !=3D 0)
>  		FAIL("Data mismatch on property \"%s\"", name);
> @@ -172,7 +172,7 @@ const void *check_get_prop_offset(void *fdt, int poff=
set, const char *exp_name,
>  		return NULL;
> =20
>  	if (proplen !=3D exp_len)
> -		FAIL("Size mismatch on property \"%s\": %d insead of %d",
> +		FAIL("Size mismatch on property \"%s\": %d instead of %d",
>  		     name, proplen, exp_len);
>  	if (exp_len && memcmp(exp_val, propval, exp_len))
>  		FAIL("Data mismatch on property \"%s\"", name);
> diff --git a/tests/utilfdt_test.c b/tests/utilfdt_test.c
> index f62341c..992807d 100644
> --- a/tests/utilfdt_test.c
> +++ b/tests/utilfdt_test.c
> @@ -46,7 +46,7 @@ static void checkfail(const char *fmt)
>   * Add the given modifier to each of the valid sizes, and check that we =
get
>   * correct values.
>   *
> - * \param modifier	Modifer string to use as a prefix
> + * \param modifier	Modifier string to use as a prefix
>   * \param expected_size	The size (in bytes) that we expect (ignored for
>   *			strings)
>   */

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--QGV2gW2TcYYdmELd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmfTnEkACgkQzQJF27ox
2Gfv6hAAkOcpWEXyPG2DYviLznlr7ND0BHkGI4j6IzFhNkQVImCIM0GJEXch5QLb
XSZg9sQ9iEs7LwlJ/cVibRK9xXpL/YpeujKeRlcbJzRXXIGaKoqv9dIafNAlHnMh
BOkFrfGxOceq/cxZ6N1pLJtwEbk3GewryAet5RFSRkQoHwL0gLVefLbAFjOGvxMV
bBA47yW9sR7lqft9LbrF0x5OkxUvAPuoL472KaDC9Ar0gFjqmGkjYeWcmEmg45Jg
IE/7lteGsNSYnGkfAPsj7+oiiIEwpsqiKTOhe9kxRnk2WWJfOxA9JD1zQCHqamys
kBsnmrMuEAkKdp0BLP5mUJs6+OxmA1MEY2GIqL97G5VuQCBvrECiRuYPJEQP2v3h
BMDYVWFGSHQhwQAvvDiQxwlxZkWW3EU2y8C1mItXqBlVraYr/SaaAPSxQJeHxwP5
LT9R6WAnZSiuni1lIJZpE5A7voCUs2I2ySnRJpuQ7OX4l+3oLJ2Tuk+Q/T7Ep0HX
+U0PVTqlHqLfOZh77wJMTyMGDnPHozWxCMDmo2u7hIcc3YDCwWMwirmxYfpOn44K
VgsyYszxjJXCkzUiaW+eAYBBWKnCjW8eIYfFzGK1j3cVkrNk4EjJM9R21jC4RUm0
FatiT3ClEiwiOwfgQziEwCLAQJgWmD95psUHcZiani5T05Szoec=
=y5Ck
-----END PGP SIGNATURE-----

--QGV2gW2TcYYdmELd--
