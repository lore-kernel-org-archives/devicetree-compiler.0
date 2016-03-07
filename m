From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Add a libfdt function to write a property placeholder
Date: Mon, 7 Mar 2016 15:32:47 +1100
Message-ID: <20160307043247.GH22546@voom.fritz.box>
References: <1457319172-24071-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Gk0KcsbyUMelFU1"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1457325519;
	bh=Q2XNgV1VWe0xekr8R3X2wDsYF6E2JmdeR98bkr1Mw7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acpkDOB4LdVMHq/mYAmNdaN36ny6eN49tIvAdPYiCrx9T/s1TgygLwEZXYLUVm9y+
	 ALkZZzkWAAzIrXy0W+6EjXZLJsHrMJ34WT8TLmOKSiKW5h098F0R/UZfCECsP7ZAzn
	 H+lFol6hUZF2NIUy4amHitFMsPqjIvEdQOsOOQJo=
Content-Disposition: inline
In-Reply-To: <1457319172-24071-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--/Gk0KcsbyUMelFU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 06, 2016 at 07:52:52PM -0700, Simon Glass wrote:
> The existing function to add a new property to a tree being built requires
> that the entire contents of the new property be passed in. For some
> applications it is more convenient to be able to add the property contents
> later, perhaps by reading from a file. This avoids double-buffering of the
> contents.
>=20
> Add a new function to support this and adjust the existing fdt_property()=
 to
> use it.
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

The change looks fine, but I'd like to see a testcase added for it.

> ---
>=20
>  libfdt/fdt_sw.c | 16 ++++++++++++++--
>  libfdt/libfdt.h | 16 ++++++++++++++++
>  2 files changed, 30 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 6a80485..2bd15e7 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -220,7 +220,7 @@ static int _fdt_find_add_string(void *fdt, const char=
 *s)
>  	return offset;
>  }
> =20
> -int fdt_property(void *fdt, const char *name, const void *val, int len)
> +int fdt_property_placeholder(void *fdt, const char *name, int len, void =
**valp)
>  {
>  	struct fdt_property *prop;
>  	int nameoff;
> @@ -238,7 +238,19 @@ int fdt_property(void *fdt, const char *name, const =
void *val, int len)
>  	prop->tag =3D cpu_to_fdt32(FDT_PROP);
>  	prop->nameoff =3D cpu_to_fdt32(nameoff);
>  	prop->len =3D cpu_to_fdt32(len);
> -	memcpy(prop->data, val, len);
> +	*valp =3D prop->data;
> +	return 0;
> +}
> +
> +int fdt_property(void *fdt, const char *name, const void *val, int len)
> +{
> +	void *ptr;
> +	int ret;
> +
> +	ret =3D fdt_property_placeholder(fdt, name, len, &ptr);
> +	if (ret)
> +		return ret;
> +	memcpy(ptr, val, len);
>  	return 0;
>  }
> =20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 78adb12..d6a08b6 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1180,6 +1180,22 @@ static inline int fdt_property_cell(void *fdt, con=
st char *name, uint32_t val)
>  {
>  	return fdt_property_u32(fdt, name, val);
>  }
> +
> +/**
> + * fdt_property_placeholder - add a new property and return a ptr to its=
 value
> + *
> + * @fdt: pointer to the device tree blob
> + * @name: name of property to add
> + * @len: length of property value in bytes
> + * @valp: returns a pointer to where where the value should be placed
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_NOSPACE, standard meanings
> + */
> +int fdt_property_placeholder(void *fdt, const char *name, int len, void =
**valp);
> +
>  #define fdt_property_string(fdt, name, str) \
>  	fdt_property(fdt, name, str, strlen(str)+1)
>  int fdt_end_node(void *fdt);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/Gk0KcsbyUMelFU1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW3QRvAAoJEGw4ysog2bOSXIQQANclg8ebhNpaaAOfh2QQY7XZ
dpP5bvaWfz7xS/FU0j5h/jU9hN2bXOBmICNcRvHlR5Qg/THDWsXWflbHMDA/wEUA
qYi+DijIPs+bNHzenSzKbwuVh3Pbt5R9dnDlPrxoFb4w71BZbjFj90715mQncvr4
2bE/tv2svvWMp+oIQsQ0jHkrE1IqXw/nsUy5WBctyVed2S61vI1q6Spp1UApP7lY
GVo5ZIr7es+QvHUOTA0aNtU8Lkfrsis/XDDXGfopQhNe43EAptWu1uLgsq4FB7OH
Q4upxJjjgdS0sAh2/Cs5fnfAbjHzBTs9ffOR9Yg3QscYUTi7o+iwy4blZEDWYxot
4NGSaFGTYbaABgljDT9mMU6ERThwotb8km0X+X7MKqReBqqbVfXVowHKLC8uVJTf
iSRlx8jDOXVqn3pDSjRaVy75OEaOGVPtDFQEFiwnibEYyrfFen9A8Mmfi0UFl/zc
DaMeH3aHa9P0cjgGXILAHMcEKIy0zxfbJWAXRA5tCZkYQ4H9jJ3/VignBRgKHH2J
qtcYb9h0QlyLXTCSYuTriy72SthtTl9xXJeT4/Qo0SKyRhd3E3NTwR4Wjbw0md07
98ucWH/DVUROaLp54JQ4AyX6hQ+NJJkzAKsdzOhbGZaTlOQEW2YZu541/CKgjsGJ
OYoHPF8+xQ+ph79b6qk5
=YLPt
-----END PGP SIGNATURE-----

--/Gk0KcsbyUMelFU1--
