From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH dtc] checks: Use proper format modifier for size_t
Date: Thu, 28 Sep 2017 10:59:17 +1000
Message-ID: <20170928005917.GV12504@umbus>
References: <20170927130409.9092-1-thierry.reding@gmail.com>
 <CAL_Jsq+egwxhx+9KxwQJBrYsBGMSV+NDmdBzWMfTs2Y0VE4Miw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PjLo8P/CG6vpADRe"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1506561452;
        bh=41jFv3UjPYSCozO2iCBqkfW8RrhJ5ANF9zOBt4z3gk8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UcGh/143hkCOfLXhfdNfRvurz8RomaK+d3HAYYzZMELqWc4yHmFEy/tg3QFmMxev8
         aApL2vPfhOeArruM2blUQBLPPPpQL0I2cOZvLLSkIXizj90eSLpM5BcM+MOs/yZRbB
         J+pkpneaDj5ttYtyhj5wjzoydCukmSIOvxojrlxo=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+egwxhx+9KxwQJBrYsBGMSV+NDmdBzWMfTs2Y0VE4Miw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--PjLo8P/CG6vpADRe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2017 at 12:46:36PM -0500, Rob Herring wrote:
> On Wed, Sep 27, 2017 at 8:04 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > The size of size_t can vary between architectures, so using %ld isn't
> > going to work on 32-bit builds. Use the %zu modifier to make sure it is
> > always correct.
>=20
> Crap, I did it again. %z was wrong last time, but appears to be
> correct here since we are in fact dealing with a size_t here.
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PjLo8P/CG6vpADRe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnMSWAACgkQbDjKyiDZ
s5JTIBAA1fbRSfjufCWwkHPUZGSoZ8p7G6n0PZ+rU5Q4cSJsvOLXhSRDmSslRTym
mIESNNdXT36aNxH4Wkp42kc+G1Ztrq/hVWtAv9HjJr7g89BVpYnwE59q8nLOx5Qd
ghgM8+Exq5u8jPI/lHT+Z4MvN4PDzAxuCFIzAFRE23BwDY7Qc4rj6nom08xE9r6I
Orf23h+WIFrciSWU6dQ6dXD/C5CsrZlyTyS/dWSTpFqIvToR6VcEcT134iaANS6b
8FySXb5XSXld7iWTeoidXeg/+Ate3vmAo/Csr7UHe+Ozn9Rnnx+63p2Ntll/NsV4
k+XK6im1QyBJkedhSNym5W7QIqhw2he8ihGErB+1HuBCix1kY2bou57lnEL2QTWJ
RA2RZZ9hppBrzbrZzXpTaRwy7Sx7NsPZnIX2z4Ckd58il/9GVFsc1S24mFRvqmj+
NKGLfTQ88pqln1Q0vgFJj5CjVDfJTrd9ayEdTf/scgvDnirvns6yxjCV5FuUh104
Fjsq7GO7wfJtOLoOsIPxZLs6zKIAWUlSVFqSPYh3vSerLFERxs1yc4sW20M1v7iz
+hijFAuB0k1L2P57KCL3Ni2cofFRfLR/dkupQzMXkfXM6HMS2t0SHNOBlE2oiy0f
vwatJ0VAvi9thI3EjkrLU5LZNKPRFJWYf7quujndcbEYUKBHD4M=
=J+Yk
-----END PGP SIGNATURE-----

--PjLo8P/CG6vpADRe--
