Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793595009;
	b=Tr2mqsuVZZVzlPSXLooZ61q3M4gSYwlObfhBNe8cEbdr7CrhwSUUSK80vtTeFnuyg7DM
	 W11l4isgNXO5hHXDmtomM0Hm0A5FyKQYVyrZ6awLaZcnf+flue0tFCC9SwskzzsijYCrP
	 FuokfkErSCAZ1dvKDZDlhFsY3y2L3QfPr9+20eydLyhcaafdOjdCC9gLTcjxsbkHPWmV6
	 CD1/YunRqziaGHnbVppkJwbaVIBrxc3F2YUivW4Hlacl4amUyQQaXGs02JPE5U5nwKx7A
	 EwAZi12HqbgK1u+yuvkgMRmM7YEnpdYZkYJEB8/zQTz5XZA96hRPs4e0PyAkJtoeasQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793595009;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=7x+qrpTcH5tbDYpx8vd7M8/2S9NrN/ROTMkcFeGD71o=;
	b=2hMWWGu/JIA8xKfp/X/Hff15AZtUOZYavp0j8FKl7PvD0DGmFgmXHwreHdI7S4OOgeO0
	 WmxIb1QsTCeiO9DL9HKsx8l+vYxrRNIRu1M9JBWncNQJZg4Nh2u4ttsdzAqQ8yEYJUSb6
	 sli5bm9bgDObAkb5eoVgN7ZWILhzLBSyNi31JImSszRKnvc7IMC6YyJdKJp4RLpkY1tUd
	 txUMaqs0pi39VaMWmRwioFdw15G9whGO253difg8cLB8iUAXp3VTclu2z5CT2RsLTj6i2
	 xKGn76GbE4BlEwxEGiFJTddxHK+JOGtdfzjYheuIpvGlzz9ddFiCZGi8p1LizvnrGpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Aufn1rAq;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394BB606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 04:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 394BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Aufn1rAq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793595006;
	bh=7x+qrpTcH5tbDYpx8vd7M8/2S9NrN/ROTMkcFeGD71o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aufn1rAqsf12VO1pzmGxZf68Qx7TCSS9PxS94rNSIpuRPVh8dWKpnDbC0rCarRtJ0
	 B2WZfX4uT9a56C3cDVJNogDd//US0xjiNzW3prnM5c6ZcRON52FO1L/S8nbRcuAid5
	 NjDu80APOnnyc9VSVwoFpxdmimpFOtphuoCnTmp5C+XG8wMpfdEDho/X1nxyOjaDVt
	 4GkOmpAFhQPnqcMsk1rRXZHFgeVWiUz3/2aUNiSvaYWlyCTUjHZTk9OCfe/32Wp3o6
	 2WQkVf6EYHmjFtPhro+g6n6nvv6ge6hzVDcDyPR0oyoS5W06GLviqbs30jeHNxoFBc
	 9iC8Gz+XdxPIg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHzlf4fQvz4w9g; Mon, 02 Nov 2026 15:50:06 +1100 (AEDT)
Date: Mon, 2 Nov 2026 15:48:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2] libfdt: Fix fdt_get_path() reading before the start
 of the buffer
Message-ID: <augWIpEahO_vQR4S@gractus.seuss>
References: <20261030170602.2142997-1-ayan.kumar.halder@amd.com>
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
	protocol="application/pgp-signature"; boundary="ngnfH1FmGX4m+dIr"
Content-Disposition: inline
In-Reply-To: <20261030170602.2142997-1-ayan.kumar.halder@amd.com>

--ngnfH1FmGX4m+dIr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 05:06:02PM +0000, Ayan Kumar Halder wrote:
> Asking fdt_get_path() for an offset past the root node's FDT_END_NODE
> tag makes it read before the start of the caller's buffer. Such an
> offset is not a node offset, so this needs a bad nodeoffset.
>=20
> fdt_get_path() trims a component off the buffer for each level the walk
> comes back up, comparing the components it has against the depth from
> fdt_next_node(). On leaving the root node, fdt_next_node() takes the
> depth negative and returns the offset just past that tag rather than an
> error, as commit ce4d9c0f ("libfdt: Rework fdt_next_node()") intended so
> that fdt_node_end_offset_() can find where a node ends. The loop only
> tests the offset, so it runs once more and tries to trim a component
> that is not there, scanning back past the start of the buffer.
>=20
> Stop the walk once the depth goes negative, as
> fdt_subnode_offset_namelen() and fdt_node_end_offset_() already do, and
> reject the offset up front with fdt_check_node_offset_() where input is
> not assumed valid. Add a bad-offset case to tests/get_path.c; run it
> under valgrind (tests/run_tests.sh -m) to catch the read.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

I agree with Simon's comments, otherwise LGTM.

> ---
> Changes in v2:
>  - Reworded the commit message: say FDT_END_NODE rather than "end tag",
>    state the problem first, and make clear it needs a bad nodeoffset
>    (Simon, David).
>  - Referenced commit ce4d9c0f ("libfdt: Rework fdt_next_node()") for why
>    fdt_next_node() returns that offset (David).
>  - Also reject the offset up front with fdt_check_node_offset_(), under
>    can_assume(VALID_INPUT) (Simon, David).
>  - Added a bad-offset case to tests/get_path.c (Simon, David).
>=20
> v1: Message-ID <20261001121036.2910243-1-ayan.kumar.halder@amd.com>
>=20
>  libfdt/fdt_ro.c  |  8 ++++++--
>  tests/get_path.c | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 11f2e2e..555bba0 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -573,7 +573,7 @@ const char *fdt_get_symbol(const void *fdt, const cha=
r *name)
>  int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
>  {
>  	int pdepth =3D 0, p =3D 0;
> -	int offset, depth, namelen;
> +	int offset, depth, namelen, err;
>  	const char *name;
> =20
>  	FDT_RO_PROBE(fdt);
> @@ -581,8 +581,12 @@ int fdt_get_path(const void *fdt, int nodeoffset, ch=
ar *buf, int buflen)
>  	if (buflen < 2)
>  		return -FDT_ERR_NOSPACE;
> =20
> +	if (!can_assume(VALID_INPUT)
> +	    && ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0))
> +		return err;
> +
>  	for (offset =3D 0, depth =3D 0;
> -	     (offset >=3D 0) && (offset <=3D nodeoffset);
> +	     (offset >=3D 0) && (depth >=3D 0) && (offset <=3D nodeoffset);
>  	     offset =3D fdt_next_node(fdt, offset, &depth)) {
>  		while (pdepth > depth) {
>  			do {
> diff --git a/tests/get_path.c b/tests/get_path.c
> index 7349898..1681747 100644
> --- a/tests/get_path.c
> +++ b/tests/get_path.c
> @@ -63,6 +63,34 @@ static void check_path(void *fdt, const char *path)
>  	check_path_buf(fdt, path, pathlen, 2);
>  }
> =20
> +/*
> + * An offset past the root node's FDT_END_NODE tag is not a node offset,
> + * but fdt_next_node() still returns it rather than an error (see commit
> + * ce4d9c0f "libfdt: Rework fdt_next_node()"), so fdt_get_path() has to
> + * recognise it from the depth going negative.  Before it did, the path
> + * trimming scanned back past the start of the buffer for such an offset.
> + * Run under valgrind (run_tests.sh -m) to catch that read.
> + */
> +static void check_path_bad_offset(void *fdt)
> +{
> +	int offset, depth =3D 0, badoffset =3D 0;
> +	char buf[64];
> +	int len, i;
> +
> +	/* The offset fdt_next_node() reports once it has left the tree. */
> +	for (offset =3D 0; offset >=3D 0; offset =3D fdt_next_node(fdt, offset,=
 &depth))
> +		badoffset =3D offset;
> +
> +	for (i =3D 0; i < 8; i++) {
> +		memset(buf, POISON, sizeof(buf));
> +
> +		len =3D fdt_get_path(fdt, badoffset + i, buf, sizeof(buf));
> +		if (len !=3D -FDT_ERR_BADOFFSET && len !=3D -FDT_ERR_BADSTRUCTURE)
> +			FAIL("fdt_get_path(%d) returns %d instead of an error",
> +			     badoffset + i, len);
> +	}
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	void *fdt;
> @@ -76,5 +104,7 @@ int main(int argc, char *argv[])
>  	check_path(fdt, "/subnode@1/subsubnode");
>  	check_path(fdt, "/subnode@2/subsubnode@0");
> =20
> +	check_path_bad_offset(fdt);
> +
>  	PASS();
>  }
> --=20
> 2.25.1
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ngnfH1FmGX4m+dIr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroFiIACgkQzQJF27ox
2GcHUA/9GOyiJvvdzX6dSxhoyZI8aqPp4M30xkLv7daMFxj0BRc/H8bCz/Bxnm33
DBlR6AhdcgSiBZ7HBI8Y4fYRfqwFHKlNhkYaw2+8RBTTmI+jNQHkGmyWJzn1n9YD
zY5LNpDbr2YqL4fI7T4uSMlXWmLAbWfRZlalxL+ZxHntUOZHbIn7sMbhFdgNIuGV
RslhzrLKnZzkwiiOIMsmSgTBnRnUU39tE98rKzooNpgzaxHH4vdEzqV19RQyWWCR
LqK+ENvSpGbeLJPzs+r4N2IBI7GWrGfOq8dY/q1shYHy35mmq4wCRDfZCVWJ5cxy
L/CjLnP1MbJITZ/0htqqQS5yVbGeAabYPbh69D1dHFfSqSi5oJq76XsL90EDz4CC
5oifkrMnD8kyipiLT/LQar7Efca/wsARkeXpcptSBZ0yLzqG70nV6Rzxw+9JAn2P
bh8gbPaCuZ9f708GTtNgCN2E6AVifTcNUdztZLNu7+76DxpqDN9gh5aR/JzFnmYO
Ul8c7lF6zuXAp3cAe98jWztOMb/FRr0TrH5StMZQfJrc0FC1jOiu3iuz2l3IJpfw
7Og9c2nrqT2RtmfbtDSx1sTlG4Gcn3gSOaQo4j7VfA2r/xsgRJPGnPDwhhk/oG+L
ReLLnFfFIMWr6Wa2uOsGZqF/RspwQQzss3fE2EAGJ8+8yNUaaPM=
=e26h
-----END PGP SIGNATURE-----

--ngnfH1FmGX4m+dIr--
