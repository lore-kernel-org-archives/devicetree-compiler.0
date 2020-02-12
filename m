From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 2/8] Add a way to control the level of checks in the
 code
Date: Wed, 12 Feb 2020 15:35:45 +1100
Message-ID: <20200212043545.GR22584@umbus.fritz.box>
References: <20200211200945.46606-1-sjg@chromium.org>
 <20200211200945.46606-3-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rE45P3aZNSuYx5ND"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581483093;
        bh=5SJrsz6Nlq/8SNbIm8LnIOmxGzAKQnBAu7u9LhGYvCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ksr0Lf26quBRglvHGnh+qehU9yyvprVEASWbJM6WiGEBiqEYaFMlG4EDW1yHxnWQp
         V8WgJOXzReChyi1ioKdljvGIO3NWSnLlBkobG0wij81SqALNMqua5GNT/HwLhbXJaM
         PHRVRhcsQ3vcHN5vecEZBSFXKoGmJh50BxmfbDfg=
Content-Disposition: inline
In-Reply-To: <20200211200945.46606-3-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--rE45P3aZNSuYx5ND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 01:09:39PM -0700, Simon Glass wrote:
> Add a new ASSUME_MASK option, which allows for some control over the
> checks used in libfdt. With all assumptions enabled, libfdt assumes that
> the input data and parameters are all correct and that internal errors
> cannot happen.
>=20
> By default no assumptions are made and all checks are enabled.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

LGTM, except...

[snip]
> +	/*
> +	 * This assumes that the device tree components appear in the correct
> +	 * order. As such it disables a check in fdt_open_into() and removes the
> +	 * ability to fix the problem there. This is safe if you know that the
> +	 * device tree is correctly ordered. See fdt_blocks_misordered_().
> +	 */
> +	ASSUME_CORRECT_ORDER	=3D 1 << 4,

=2E. I don't like this name.  The spec doesn't specify an order, so
having it in a different order isn't incorrect, just a bit harder to
work with.

> +};
> +
> +/**
> + * can_assume_() - check if a particular assumption is enabled
> + *
> + * @mask: Mask to check (ASSUME_...)
> + * @return true if that assumption is enabled, else false
> + */
> +static inline bool can_assume_(int mask)
> +{
> +	return FDT_ASSUME_MASK & mask;
> +}
> +
> +/** helper macros for checking assumptions */
> +#define can_assume(_assume)	can_assume_(ASSUME_ ## _assume)
> +
>  #endif /* LIBFDT_INTERNAL_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rE45P3aZNSuYx5ND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5DgJ4ACgkQbDjKyiDZ
s5JqoA/+JWEFICdELNNOxZWxJq5ryWLFJqHeieJ8PRh9nXYa7Iysy7kGJqBEdO74
nvfzpsxJEMsGdxjQmlMxdVEpfsNMVSg/7P2Q3U+FQMPNlJ408VX/7d6iObVf4EAe
6HRFfW+U3b5Epl39sMDG1hWdT+HLRBTlAwa0kyAMnpER6PnJjZg21ZYRPgXQzuyb
w7NLmByhARH29BMRiJg/9UroNJvgIkRV/ebSHCuzgYElLl13BvmBVWKMnF6Va4a6
ABajk5FIavsrnDbhYO1uL62RBM16YinSa9cKaN5jmrIHCKd1MnkqHVKqr4srCBjN
sY6gzB+IdwkmBWz9VTAXleBSXgXhuCN5dA5cgKxf5lNFm9gnKPNCjDk9WmOJDMAw
pH9A/S12S+AHsMN6OSW7EI3L+PDSESynDH/b4g2paexteOys3NIwTHIuau+9PPqP
CH7pNE+hsq3GKDC3wTT9HF6GWczgImatIpVqM4LrvJnihCmDCRsDKjZuoDkCZm4P
v3285krEmJ8NIMieuWClCV9bw3ME3D6ImBVsKLtlJ6LH0xNhbVzK72ZVTpA76EUR
RN5lfKcR5+zyTfqrEtWOyYSuCdBKPaD2mEkueyTmRWrYNHroxuCD/+wqjNAUxN4V
y7rHveOf0V22VmcitMEZTBJBnzdwe7vHgQgY+qzaoGW4kRLdqug=
=IjSq
-----END PGP SIGNATURE-----

--rE45P3aZNSuYx5ND--
