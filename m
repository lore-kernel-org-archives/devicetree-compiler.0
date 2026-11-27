Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747875;
	b=5WMZlx8uUKfmSnGMMm2cevcFA3rzY+zjhIyfTL9sbNHhyfOfmTjz/DlYNKqhJRMwF0mq
	 xUBneuwr/D6YA+osPAo1Nzzldgoea3Ig6AIJw08EVxPBBGxT4vHm7Pf14cavjhe7rgZB7
	 RYVSTOF7CRnD2/Ep/1AEu9x19+EdADts82o1so9Ik80A2dwNXG3952rHc+kaWQGCkGSrX
	 ecCqR45E+wphXBAPcDPOCinV6R9tiOgUjxAyd9xGHKJRsDStqYn0ToqhPeSTozA7cEQe/
	 YEOKBrpDUfQpNSmZZrfeKgqdlEo43KqDPXnljDVlUK8Y7ThZUdJHnOYv/KCr14WQkqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747875;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=RDrRCFUnpNktA4aGU5hzc+JVuH3iYZ7V0alLZ+t8EK8=;
	b=yAJbuSArKbrXuKt4/CQgkj7Zxx1y6q+BhoHxrrarwvk29ZLW1Ac0rlReizvvUYp+y4zj
	 dwBGF6Q3TwYY/ruDq7RZhFo6nw9Tshz1L6sY0dMChtyE5vZftK/xRlpnbyIhZl4jlMo3f
	 Bk2aYMjGtAyrqbQ/yiQiMD0GjMUQwgwbQ9rDoFKKrKkqXfZlpNTCyk2MVCm22IQovAEyN
	 Y1MhytIG/P5FbMZJBUz5/uW0ZIZudyBIy9SQVvz6AxjUGGTLx+GojQY2M9IiaomrTeZkP
	 NVB6G08XtH0SaUW3s1+Psr+xE1aw6P6R+7PlZgDo/jmwHJQkX9dtzqH2f60J9D6c2oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=SzNdJbNS;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB43606A31E
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 02:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB43606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=SzNdJbNS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795747872;
	bh=RDrRCFUnpNktA4aGU5hzc+JVuH3iYZ7V0alLZ+t8EK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SzNdJbNSmJn5ccx7/IoH7RnMuTv0abidyfwJLUxVjLWIiJljWYn58D04VWX+WFhiz
	 xWeHR01A8OuQeQgbAT9xttHhUCraZ9jUPn8zrTjSIs2fmFXzMcUNexGggZY+nHtUWh
	 4Mq7lY31ICtbM12Fofl9fqGXlofadccPIZfqbAfQAMjdVjNZzlSIcdQHvJ59L3rf+q
	 scVUFbBng1+bTIxGjZxkGYLUznDQwGf6ThMn1iPxNgXhnnsfjwtfiyqKH+tqXY0P11
	 c/3JgrX8kAGWeycknrdoN7sUXwHXczKfcUN6RpXNNX4XNc4uc+g3B0w1/50I7JmQAS
	 bL91b6qe+wlXA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jbHww62Dsz4whs; Fri, 27 Nov 2026 13:51:12 +1100 (AEDT)
Date: Fri, 27 Nov 2026 13:50:53 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 02/10] tests: Check a label on a node which is not in
 a plugin
Message-ID: <awjwAldh4Dkj81H7@gractus.seuss>
References: <20261126184126.1472738-1-sjg@chromium.org>
 <20261126184126.1472738-3-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="xsiwO+2y3SQGBQEx"
Content-Disposition: inline
In-Reply-To: <20261126184126.1472738-3-sjg@chromium.org>

--xsiwO+2y3SQGBQEx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 11:41:01AM -0700, Simon Glass wrote:
> In a plugin, label: &ref { ... } cannot become an overlay fragment,
> since dtc cannot put a label on the target of one. So dtc reports an
> error if the node is not in the plugin, whether ref is a label or a
> path, but there is no test for this.
>=20
> Add merge-labelled-missing.dts to check both errors.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Patches 1 & 2 merged.

> ---
>=20
> Changes in v5:
> - Add new patch to check a label on a node which is not in a plugin
>=20
>  tests/merge-labelled-missing.dts | 14 ++++++++++++++
>  tests/run_tests.sh               |  4 ++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 tests/merge-labelled-missing.dts
>=20
> diff --git a/tests/merge-labelled-missing.dts b/tests/merge-labelled-miss=
ing.dts
> new file mode 100644
> index 0000000..232872b
> --- /dev/null
> +++ b/tests/merge-labelled-missing.dts
> @@ -0,0 +1,14 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +};
> +
> +/* A label can only be added to a node in the plugin */
> +newlabel1: &nosuchnode {
> +	prop;
> +};
> +
> +newlabel2: &{/nosuchnode} {
> +	prop;
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 1d3e79a..1e9fb7e 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -798,6 +798,10 @@ dtc_tests () {
>  	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-errors.dts"
>      run_wrap_error_msg_test "merge-errors.dts:14.18-30 Label or path nos=
uchnode3 not found" \
>  	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-errors.dts"
> +    run_wrap_error_msg_test "merge-labelled-missing.dts:8.12-23 Label or=
 path nosuchnode not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-missing.dts"
> +    run_wrap_error_msg_test "merge-labelled-missing.dts:12.12-26 Label o=
r path /nosuchnode not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-missing.dts"
> =20
>      # A labelled reference to a node in a plugin adds the label to it
>      run_dtc_test -@ -I dts -O dtb -o merge-labelled-plugin.test.dtb \
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--xsiwO+2y3SQGBQEx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsI8AIACgkQzQJF27ox
2Ge3kQ//X1b/QhlZJwA0AeNmiodpLZJq3gmB8isran7fOnFCzCz/7pQFGIklZ9TD
WpEm0LXQkQ8a67LWixD8Jh7DVT5ZQcdsml+cdBopCRXkthtVgPgSgAPVCLk9oBHQ
LG1C58chSoT6D8uJeggd/tCMQfM6rs1InefjtJWKdeJF8kY10+H2LLk826jc27I1
9QSinUDdC/oPOUBVm2dplwx5XJQ6X97UgGbIqjAo7zhFbjI4mSAkt/PSnEaG5eYF
b44rMChNTlp4jRQXMVwg7El+Jtm5gI3yRfdWByLBDSTIS7fEe+DmmC25XkzYizaf
uJqHnLOP4cDjwz6S9B9fQ1M6nTIWX1TSoETZoOxbVY+2RqqAeXYY4fyeJABzsbZ4
6+U7PKPRZ5MxWdlp/Zpsf6nqei7JVHzmYy0feD+1yExfEoxUIZ04L2XuWUJQL9TS
vJ8v9uvBne1RQOT7gCM8d9IbAdwJYezfnxyeGaZbv09mjmrL8qp8sABIHEiqt6N9
FF3v6gp4IQuI/5OXoTTfInN8bsExOWqay+Fxh8wNVmItP1GskFeh8I5agpkCpr7P
GgytqOy0GdoujMngBGkzW3MmPAelltNKFKg19muQBSTUb2wq8gCoHcvH3TWLBOlS
fq6WG4+YVikyfMW+czQFz2CpjvA3Y33oceGxE90CNhp+DoKlzNs=
=84LQ
-----END PGP SIGNATURE-----

--xsiwO+2y3SQGBQEx--
