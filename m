From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Don't generate erroneous fixups from reference to path
Date: Thu, 4 Aug 2022 15:01:34 +1000
Message-ID: <YutSrkK752OeSXfp@yekko>
References: <20220731121100.253043-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kQIFP9NPu8w+vWxM"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1659589434;
        bh=vGaovoHASRIEhPYp6UAKcU5tldZZ2UVsiSQzRzJsgnk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BNl97Z7sZfc+5O6t/csM3Sn4OqM3+qsqmk8DldSGi3WZZoT0wn5DKHF/9Y+SqHR33
         sUTryiP5K2jW3N86rOZP40lqeneyXAdq1bRoySaAWxQvw8NkhuLYA45Qsozo782Qan
         PAV8G+4V9OcnheWHq4+T7qAiICt9/eBG0p5K4Bjo=
Content-Disposition: inline
In-Reply-To: <20220731121100.253043-1-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


--kQIFP9NPu8w+vWxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 31, 2022 at 10:11:00PM +1000, David Gibson wrote:
> The dtb overlay format only permits (non local) fixups to reference label=
s,
> not paths.  That's because the fixup target goes into the property name in
> the overlay, and property names aren't permitted to include '/' character=
s.
>=20
> Stop erroneously generating such fixups, because we didn't check for this
> case.
>=20
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Well.. I guess I'll take no response as assent.  Applied to main
branch.

> ---
>  livetree.c                  | 6 ++++++
>  tests/fixup-ref-to-path.dts | 6 ++++++
>  tests/run_tests.sh          | 1 +
>  3 files changed, 13 insertions(+)
>  create mode 100644 tests/fixup-ref-to-path.dts
>=20
> diff --git a/livetree.c b/livetree.c
> index 169462d..f46a098 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -919,6 +919,12 @@ static void add_fixup_entry(struct dt_info *dti, str=
uct node *fn,
>  	/* m->ref can only be a REF_PHANDLE, but check anyway */
>  	assert(m->type =3D=3D REF_PHANDLE);
> =20
> +	/* The format only permits fixups for references to label, not
> +	 * references to path */
> +	if (strchr(m->ref, '/'))
> +		die("Can't generate fixup for reference to path &{%s}\n",
> +		    m->ref);
> +
>  	/* there shouldn't be any ':' in the arguments */
>  	if (strchr(node->fullpath, ':') || strchr(prop->name, ':'))
>  		die("arguments should not contain ':'\n");
> diff --git a/tests/fixup-ref-to-path.dts b/tests/fixup-ref-to-path.dts
> new file mode 100644
> index 0000000..f6dcba0
> --- /dev/null
> +++ b/tests/fixup-ref-to-path.dts
> @@ -0,0 +1,6 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +	prop =3D < &{/path/to/node} >;
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 0cabd13..244df8a 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -271,6 +271,7 @@ libfdt_overlay_tests () {
>  	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree.dts"
>  	run_test overlay_bad_fixup overlay_base_no_symbols.test.dtb $tree.test.=
dtb
>      done
> +    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb -o /dev/null fixup-=
ref-to-path.dts
>  }
> =20
>  # Tests to exercise dtc's overlay generation support

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kQIFP9NPu8w+vWxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLrUqcACgkQgypY4gEw
YSK4fQ/+JZJby/bMEGKWAQznXrvZar6C3gM1owPnNTw40zhkGkvSBU/1nWGFVEud
B8k9cXEAVrHbhvAaBNvSlXEiHa1aV9E1npHT07MQw4z5Rdpw7duQiIGjJ/Qs37Ja
Dfv+V2kVK4qcugKTHIjIjp9E/7cwc8MtTkVw2XO6oIjNSUoD20NLYqE833/XjY45
yU4ODzPabF0wTIiloMxWzxWi7fDLEG1fbg/fXVxUAeIdU8iuLQ2kwNpdZQdyZs2N
2GhyQNOekqGYuOCUbMtYWfO7mBPu4I3cCLRm9MOQhu/Ru+SFvOB+JVUgNzFhOTvx
yzDEwJGCEFYb5i040FjKj1jKiBqqfOc2IqfevWHnWvIx8oq3zJA5MBPX+rX0OVO4
TyvRwUCCA0lpg/bQBn1tABP6FzQlY1d8xKbRKxJTEoDisG8V0i9B5SwWeBY1R+mj
68gBEHS+NuAzF5QR8KNu6STqvTIl4RPcrMqTFWnAM3empY/E7f4R09bT5s5lCSzh
0CYWN73/E3esOXtl2Hc79ry9Y/PbmY6va94H/VV6xNSzPTBIibipEbkeJni/z5Ak
CizFUF50NQYVPHxFQv0bOnfPrKT3R/z5vwiCxKXJoezhICDOgc847AnxeluBue1f
gabk/bpvU8CaKG+uMsQ+7O/spYZQLiKcZ6+R7pK1MJf4Bz/xC3k=
=3XWj
-----END PGP SIGNATURE-----

--kQIFP9NPu8w+vWxM--
