Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D10471CF4;
	Tue,  1 Sep 2026 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249805; cv=none; b=sYqmGBkkl0dK0BYuHoAwnAVAe7HHmZBiIgrdXpLltyj/uW+eGzkARt4ONM3CthV48wP+uY7dPuzqF3BpBknX/o973kZE+2giQDz/MJ3ZT2LhPfgqNSWdn68QNawiZex6aCfq7tLCnkkOXZT2kCO/vwqlfUCxkSiuSkvNMBv2VGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249805; c=relaxed/simple;
	bh=DBqvi2145wRaRemZ3CPfuFNwzKfMZKCYNC7ndtk8tJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkRFEC4ronJa8HeqGHtSNY0WaCDNSZQ5/LGEQNFfbWkzdzgtH2/tInmSR3hINY1+pSPGzXpeKcBsKwPDzCaeDHUc8FZebCJptfZ2XsY0XmzHd6DLM6xJBos+loYse8byK1xZyC03ui5vxCsYwWJ9DQX/mnhDNRRAtMqZ9/VppLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=abm/sfz7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="abm/sfz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1788249796;
	bh=ZLh/gL5WqkFxJPzGlA/crTex+7BN4AyLSjbpVYk3uhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abm/sfz7KH1SOvblSl8+aKwSR8WVx5XKFpz3AgWHtzdcVcl7kJURAt1PDhdwszBb0
	 C7gL5zyFrW4kWOwtHUmXHnOF/qlaHsJxKuw3hoi2SwhK3BpiZ9s/rmnIZH6IVXCpdn
	 M7qCDGieUo4+51udPLed4BpQbEZpb5qpLyqSkKfURGEMsaNyC2z66K5HG6Byyzn+cY
	 uVE1iIDPvXryhmIXs4EO4OKPeIolJpZV8FSy2NlGBp9NTHkA2d+BooX+ID45UAP7S4
	 tqpwd1bkfZe7KrOf4mjlV/2+7gGDTw+6AxWK5+a+GBZUrazLO7eJn8C2fW38qXRwQ5
	 CtAk2ziI1QMNA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hYyz85zhSz4wG8; Tue, 01 Sep 2026 18:03:16 +1000 (AEST)
Date: Tue, 1 Sep 2026 18:03:09 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 03/15] tests: Don't assume the root node is available
 at offset 0
Message-ID: <apaGr_i-s4DAZ-Ul@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oli3xoiA707CJUi1"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-4-herve.codina@bootlin.com>

--oli3xoiA707CJUi1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:34AM +0200, Herve Codina wrote:
> Several tests uses offset 0 as the offset of the root node. Either to
> check the offset returned by tested functions or to directly manipulate
> the root node retrieved using fdt_offset_ptr(fdt, 0, ...).
>=20
> The root node is not always at offset 0. Indeed, a FDT_NOP tag can be
> present at offset 0. fdt_root_offset() returns the offset of the root
> node taking care of possible FDT_NOP tag.
>=20
> Use fdt_root_offset() to get the offset of the root node and use this
> value whenever the offset of the root node is expected.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  tests/node_offset_by_compatible.c |  4 +++-
>  tests/node_offset_by_prop_value.c | 11 +++++++----
>  tests/path_offset.c               | 13 +++++++++----
>  tests/root_node.c                 |  6 +++++-
>  4 files changed, 24 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/node_offset_by_compatible.c b/tests/node_offset_by_com=
patible.c
> index a9e67835..1278a562 100644
> --- a/tests/node_offset_by_compatible.c
> +++ b/tests/node_offset_by_compatible.c
> @@ -39,12 +39,14 @@ static void check_search(void *fdt, const char *compa=
t, ...)
>  int main(int argc, char *argv[])
>  {
>  	void *fdt;
> +	int root_offset;
>  	int subnode1_offset, subnode2_offset;
>  	int subsubnode1_offset, subsubnode2_offset;
> =20
>  	test_init(argc, argv);
>  	fdt =3D load_blob_arg(argc, argv);
> =20
> +	root_offset =3D fdt_root_offset(fdt);
>  	subnode1_offset =3D fdt_path_offset(fdt, "/subnode@1");
>  	subnode2_offset =3D fdt_path_offset(fdt, "/subnode@2");
>  	subsubnode1_offset =3D fdt_path_offset(fdt, "/subnode@1/subsubnode");
> @@ -54,7 +56,7 @@ int main(int argc, char *argv[])
>  	    || (subsubnode1_offset < 0) || (subsubnode2_offset < 0))
>  		FAIL("Can't find required nodes");
> =20
> -	check_search(fdt, "test_tree1", 0, -FDT_ERR_NOTFOUND);
> +	check_search(fdt, "test_tree1", root_offset, -FDT_ERR_NOTFOUND);

This does highlight that even with the compatibility changes
introduced here, allowing NOPs before the root node can potentially
break things.  We now handle _passing_ 0 to any of the functions as a
node offset, but anything that expects a _returned_ offset to be 0 if
it's the root node will break.

I think that's probably an acceptable breakage, but it's something to
be aware of.

>  	check_search(fdt, "subnode1", subnode1_offset, -FDT_ERR_NOTFOUND);
>  	check_search(fdt, "subsubnode1", subsubnode1_offset, -FDT_ERR_NOTFOUND);
>  	check_search(fdt, "subsubnode2", subsubnode2_offset, -FDT_ERR_NOTFOUND);
> diff --git a/tests/node_offset_by_prop_value.c b/tests/node_offset_by_pro=
p_value.c
> index 48ab1d93..329409b9 100644
> --- a/tests/node_offset_by_prop_value.c
> +++ b/tests/node_offset_by_prop_value.c
> @@ -64,12 +64,14 @@ static void check_search_str(void *fdt, const char *p=
ropname,
>  int main(int argc, char *argv[])
>  {
>  	void *fdt;
> +	int root_offset;
>  	int subnode1_offset, subnode2_offset;
>  	int subsubnode1_offset, subsubnode2_offset;
> =20
>  	test_init(argc, argv);
>  	fdt =3D load_blob_arg(argc, argv);
> =20
> +	root_offset =3D fdt_root_offset(fdt);
>  	subnode1_offset =3D fdt_path_offset(fdt, "/subnode@1");
>  	subnode2_offset =3D fdt_path_offset(fdt, "/subnode@2");
>  	subsubnode1_offset =3D fdt_path_offset(fdt, "/subnode@1/subsubnode");
> @@ -79,19 +81,20 @@ int main(int argc, char *argv[])
>  	    || (subsubnode1_offset < 0) || (subsubnode2_offset < 0))
>  		FAIL("Can't find required nodes");
> =20
> -	check_search_cell(fdt, "prop-int", TEST_VALUE_1, 0, subnode1_offset,
> -			  subsubnode1_offset, -FDT_ERR_NOTFOUND);
> +	check_search_cell(fdt, "prop-int", TEST_VALUE_1, root_offset,
> +			  subnode1_offset, subsubnode1_offset, -FDT_ERR_NOTFOUND);
> =20
>  	check_search_cell(fdt, "prop-int", TEST_VALUE_2, subnode2_offset,
>  			  subsubnode2_offset, -FDT_ERR_NOTFOUND);
> =20
> -	check_search_str(fdt, "prop-str", TEST_STRING_1, 0, -FDT_ERR_NOTFOUND);
> +	check_search_str(fdt, "prop-str", TEST_STRING_1, root_offset,
> +			  -FDT_ERR_NOTFOUND);
> =20
>  	check_search_str(fdt, "prop-str", "no such string", -FDT_ERR_NOTFOUND);
> =20
>  	check_search_cell(fdt, "prop-int", TEST_VALUE_1+1, -FDT_ERR_NOTFOUND);
> =20
> -	check_search(fdt, "no-such-prop", NULL, 0, -FDT_ERR_NOTFOUND);
> +	check_search(fdt, "no-such-prop", NULL, root_offset, -FDT_ERR_NOTFOUND);
> =20
>  	PASS();
>  }
> diff --git a/tests/path_offset.c b/tests/path_offset.c
> index ad8db833..d4f6553b 100644
> --- a/tests/path_offset.c
> +++ b/tests/path_offset.c
> @@ -84,11 +84,16 @@ int main(int argc, char *argv[])
>  	void *fdt;
>  	int subnode1_offset, subnode2_offset;
>  	int subsubnode1_offset, subsubnode2_offset, subsubnode2_offset2;
> +	int root_offset;
> =20
>  	test_init(argc, argv);
>  	fdt =3D load_blob_arg(argc, argv);
> =20
> -	check_path_offset(fdt, "/", 0);
> +	root_offset =3D fdt_root_offset(fdt);
> +	if (root_offset < 0)
> +		FAIL("fdt_root_offset()) failed: %s", fdt_strerror(root_offset));
> +
> +	check_path_offset(fdt, "/", root_offset);
> =20
>  	subnode1_offset =3D check_subnode(fdt, 0, "subnode@1");
>  	subnode2_offset =3D check_subnode(fdt, 0, "subnode@2");
> @@ -106,8 +111,8 @@ int main(int argc, char *argv[])
> =20
>  	/* Test paths with extraneous separators */
>  	check_path_offset(fdt, "", -FDT_ERR_BADPATH);
> -	check_path_offset(fdt, "//", 0);
> -	check_path_offset(fdt, "///", 0);
> +	check_path_offset(fdt, "//", root_offset);
> +	check_path_offset(fdt, "///", root_offset);
>  	check_path_offset(fdt, "//subnode@1", subnode1_offset);
>  	check_path_offset(fdt, "/subnode@1/", subnode1_offset);
>  	check_path_offset(fdt, "//subnode@1///", subnode1_offset);
> @@ -116,7 +121,7 @@ int main(int argc, char *argv[])
>  	/* Test fdt_path_offset_namelen() */
>  	check_path_offset_namelen(fdt, "/subnode@1", -1, -FDT_ERR_BADPATH);
>  	check_path_offset_namelen(fdt, "/subnode@1", 0, -FDT_ERR_BADPATH);
> -	check_path_offset_namelen(fdt, "/subnode@1", 1, 0);
> +	check_path_offset_namelen(fdt, "/subnode@1", 1, root_offset);
>  	check_path_offset_namelen(fdt, "/subnode@1/subsubnode", 10, subnode1_of=
fset);
>  	check_path_offset_namelen(fdt, "/subnode@1/subsubnode", 11, subnode1_of=
fset);
>  	check_path_offset_namelen(fdt, "/subnode@2TRAILINGGARBAGE", 10, subnode=
2_offset);
> diff --git a/tests/root_node.c b/tests/root_node.c
> index 37e6f059..30903f2b 100644
> --- a/tests/root_node.c
> +++ b/tests/root_node.c
> @@ -19,12 +19,16 @@ int main(int argc, char *argv[])
>  {
>  	void *fdt;
>  	const struct fdt_node_header *nh;
> +	int root_offset;
> =20
>  	test_init(argc, argv);
>  	fdt =3D load_blob_arg(argc, argv);
> =20
> -	nh =3D fdt_offset_ptr(fdt, 0, sizeof(*nh));
> +	root_offset =3D fdt_root_offset(fdt);
> +	if (root_offset < 0)
> +		FAIL("fdt_root_offset() returns %d", root_offset);

Hm.  It's been a long time, but I suspect the purpose of this testcase
was to be super low-level, checking the contents of the root node
_without_ relying on iteration or lookup functions first.  Putting the
lookup call here arguably defeats that purpose: certainly the test
that nh->tag =3D=3D FDT_BEGIN_NODE is no longer meaningful, since
fdt_root_offset() will explicitly look for a location where that's
true.

Or perhaps another way to look at it is that this test is explicitly
verifying that the root node is at offset 0, so does it make snese for
this test to even exist any more.  I guess the test for the name of
the root node is still meaningful, if minor.

Nonetheless, to maintain as best we can this test's goal as working
independent of lookup functions, I think it might be worth open coding
something to skip FDT_NOP tags (not using fdt_next_tag(), even), then
construct nh immediately after that.


> =20
> +	nh =3D fdt_offset_ptr(fdt, root_offset, sizeof(*nh));
>  	if (! nh)
>  		FAIL("NULL retrieving root node");
> =20
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--oli3xoiA707CJUi1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqWhq8ACgkQzQJF27ox
2GfF/hAAgGk88CGJY5GnqxSyVsj87cj4yuEmW4NHSjiCXJbp9Mqo7fFAfMiW4QPf
pCib5FRTdWlkxlHBMWOab2QTfZs8w0EtQu7URQ0Mm6fcbADqoDpiajldm5xfW2IV
+QZwGi4lmAThf7nizOkUQvidT965J8AsFVb9BdshrnyPpe8nMuhmJtx0xwi+KhSk
ijiUe3xf+LVbt0bQbO3zVy3nA7fBSQxl2qMu67J0obNTwht7YDjex5//ZqCX9Etq
qH2YJntpuEP4xB1mq/0HEB7Fo/m3awUvOK27QyHEhFyjh0tD3Aak0WtRb95ygAMY
gYSze7hBYxcLGtxzDChOZj8GcYGjDBYzZ2SUufJHZ5QFKFWz2J3QNqxPfQo1Zc4f
tJFdUXdraNY0hJDCS0kvi/75sUHDlDBaKSJ4XWQgObng+ENNSro6+zlbodJvhlew
HpEiTGbja0tuK4I81K5p0Ig1rVyoEeMh9MinIWzzwpPNrml6rCeCcbeYB3gbnOoa
K29W1v5jEkjVH0YQcdYCqNiwdHzi9fFxI6RRi/0qFvM7wyH1OPUIk706ZAHWn5ZF
rdYsFZqix2DSxNpfwarDr8Q1DIYF50buUdWvQrIKiIXPvv5aMkpum9NEDsUuhV9Q
wJtO1AudgfEKdWS6JnyiwnOGU8AIPNiNstYRQxJVwPpPjTFzLWc=
=9hsg
-----END PGP SIGNATURE-----

--oli3xoiA707CJUi1--
