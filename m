From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] Makefile: Add tags rule
Date: Mon, 30 Jan 2017 12:17:10 +1100
Message-ID: <20170130011710.GC14757@umbus>
References: <20170126184814.5325-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1485748730;
        bh=sgT5RliiBDZ3uK9hJBIVQQpM3RWmyBXfmSMPsZkejgU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AL8wdIEUygFtm0yu/R0pDa3SkCZBAhEvJ5ui0n2nE57tvAnf7GX2rB+5PUMrDdv+2
         NSCFUXrFdMf7M9ruBOMpyTtfEIkw54fuY7hwNNTxKXBhoR07Hl1e9g+1vYD5sb0j0Q
         71LNj/zCudzBR8/i5hc+W3z5HtYbBN5anmmo+s4o=
Content-Disposition: inline
In-Reply-To: <20170126184814.5325-1-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 10:48:14AM -0800, Stephen Boyd wrote:
> It's useful to have some tags to jump around sources. We don't
> include test sources in the toplevel Makefile because they
> probably aren't useful to main program development.
>=20
> Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
>=20
> I noticed my previous patch wasn't pruning the *.tab.[ch] and *.lex.c
> files. This version corrects the find command so those aren't included.
>=20
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Makefile b/Makefile
> index 32dcfcf8e203..ce05eba6590b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -218,6 +218,12 @@ kup: dist
>  		$(KUPDIR)/dtc-$(dtc_version).tar.gz
>  endif
> =20
> +tags: FORCE
> +	rm -f tags
> +	find . \( -name tests -type d -prune \) -o \
> +	       \( ! -name '*.tab.[ch]' ! -name '*.lex.c' \
> +	       -name '*.[chly]' -type f -print \) | xargs ctags -a
> +
>  #
>  # Testsuite rules
>  #

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYjpQVAAoJEGw4ysog2bOSMxkP/3s67LwCf53oXLNeY36DnCVm
6W7NQvo4V+3PysPo66SFugGSXa4TGjqVr8jOlLLRCx5DfNX8kQ2X3+vuas7TGL8+
bC7f7DZ8GLaWddX87ZLB+v4n9SbNF8yGqCglIC2RdeZ5iYTedQGa5nAQLBafWfkh
r5XthLelTBfXfqvWGtxmQjayD5ZxORfcnr0N5fWtHtvBqfioBZ6wmAUbOhpwsfQr
QL+1n3ZK3xqfJKmt+kzt8o/g5dqzAvc7qrVAjR46mXzBXisj22ZtHQ6aczVFfXyF
1xysJWTwfhTvDy4YhsXV0nVLOiRVmeAXLeLxZadHmozJj+pNskcplxl6GRQoKtoH
fJ0Vjrh4j+DZ/IxTSCX+7JTEY8mM3P9AzJqr5Yi/xUgm1ld1WAKStTUp52PMKJe4
NfBu7Mf6wW86LZNoBMZDybfszgRgRmV6rSD6LpyNSCA1nn9q+ycb9kltAKBSAYtp
9pKlFEdcG3BY4GSXXvPUwyuq7t3UUDsSmyTMwlYsFFC/xrPxCRl2yNbprZqc+RyM
P769hDJ4J7ZA1hbQ9iyLCGX/tVzfNzQe7eq6dVbmwcGAZtT6bhh8hw8cJkEZ8W6n
L0Km1/w+v0+KY8hsRVaud8ubhxRJclNsmh8wVCiCAsFvw8WWzWO4DLZSNqCC67m3
GCqVDWchmXM1FbmwueXx
=7OOw
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
